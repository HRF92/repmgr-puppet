class repmgr::postgresql {

    $pg_ctl = '/usr/lib/postgresql/9.1/bin/pg_ctl'
    $pg_logfile = '/var/log/postgresql/postgresql-9.1-main.log'
    $pg_data = '/var/lib/postgresql/9.1/main'

    service {'postgresql':
        ensure  => running,
        status  => "sudo -u postgres $pg_ctl -D $pg_data status",
        start   => "sudo -u postgres $pg_ctl -D $pg_data start -l $pg_logfile",
        stop    => "sudo -u postgres $pg_ctl -D $pg_data stop -l $pg_logfile",
    }

    service {'poqtgresql-reload':
        status  => "sudo -u postgres $pg_ctl -D $pg_data status",
        restart => "sudo -u postgres $pg_ctl -D $pg_data reload",
    }

}