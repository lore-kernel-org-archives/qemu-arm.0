Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp768418lff;
        Fri, 6 Dec 2019 05:49:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnnr9k3lRwrLGOjXgybAh1A8YxB2is/GTYN884uUVXi2iZThDNK67fD2z4C6qkyBEGhAyo
X-Received: by 2002:a50:f391:: with SMTP id g17mr16206931edm.52.1575640154879;
        Fri, 06 Dec 2019 05:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575640154; cv=none;
        d=google.com; s=arc-20160816;
        b=pAV7UKLj3KKRyTpLSQX3U7f8DyuXjJGlqRkAmLT/hd2Hx5Hq0Fg1vObQHEz/PK4hvG
         gbBh8nG+MbXEstyXuxJmrdPmWEi9Gh11SFK+IXTIx0T5Wy/GvGs1h34G/DHLuGoOsZY4
         VPZOYTN7wbcytkhFtadQXF+r3qhP34UsSe2BckVLBLAwuVSB0eroXX+SVOkpe/0WJUQy
         8T6HQmjQvpVf/Lu7C1yJpz628LaCBgI8qaS/uMCE/SzXVMkY+YGs9+Iz2t8EWCS5y9MQ
         tJ2f2JVtlZvlrFU8vo0fnyb6A+taCQRz0OV9V/IxltGozQ0H+N9heR0nnK4WiC6+/i+5
         5Mmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=qeEpOHiVicsdQEuTeVw1xPx0IpulfUWaY/EsL1Z8z1Q=;
        b=ys+E49R6H1RwcienR+kLllQGTOQCMZiPFt0mvIDEwWvPV+nAiiZki4ASudmFSyWfXm
         qF//YI1DjQjn4o3xp91ViGvHdRtBnjW1CCTxJTK5cE14r+3tgC42oAzO5MRMQt233/Bc
         tj1FBeFuURc19ZW6lPumxGJ8Am7nB1qRID3GFmQUY/F6cjhl3URs8BQdzP7kon+3I7K8
         O/K7o/i6B2tgngw+b8xhZyCrOD2X/3cIH1HwyjtK7fqBIRqmwmkpZKgfzrDWSrvqKnt4
         UpHK7HhMS0tY7/V/jNZRxQUilpngNtWkZHSrMWgnuxMc45NE+p687iuF325mwEr85CE/
         oUWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aKHndkf5;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id dm22si10075500edb.381.2019.12.06.05.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Dec 2019 05:49:14 -0800 (PST)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aKHndkf5;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575640153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qeEpOHiVicsdQEuTeVw1xPx0IpulfUWaY/EsL1Z8z1Q=;
	b=aKHndkf53e7je9e10NbF7y3oO2GyLa9P0J7gRidcjdvG8ZBrIZB7vL7tyJmF+gUlM/4JjC
	kikESSTNJu3RhOGNGmucoOn4/6kkYAweMP3w/RibCEriH8RU4W8h78ZW5c2tcXC6AF224W
	yG4F0vdmIYcxKa5gtjCDmpyOdQFGdg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-4R-FKP8ONSOLEjbz2If8fQ-1; Fri, 06 Dec 2019 08:49:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFEA7107ACC4;
	Fri,  6 Dec 2019 13:49:10 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ADC9608A5;
	Fri,  6 Dec 2019 13:49:02 +0000 (UTC)
Date: Fri, 6 Dec 2019 13:48:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Damien Hedde <damien.hedde@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Mark Burton <mark.burton@greensocs.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Oksana Voshchana <ovoshcha@redhat.com>
Subject: Re: [PATCH v6 0/9] Clock framework API
Message-ID: <20191206134859.GC2878@work-vm>
References: <CAFEAcA98rt6nRDSrwk8XRbaBT67LZXvF=XEV13dtJBp4fPUscw@mail.gmail.com>
 <be199ad6-1b79-f77d-afad-faeb042151ed@greensocs.com>
 <febdb64d-9d02-66ad-84d2-dc795879e48b@redhat.com>
 <a0cea550-d6c7-0193-b4e6-24ed879be61d@greensocs.com>
 <279a0fd5-1ea5-b3c7-27bb-b1d22db5e359@redhat.com>
 <20191205102151.GB2824@work-vm>
 <f3aa4881-dd41-ce71-0f5a-8d36bf5c3828@redhat.com>
 <20191205105613.GE2824@work-vm>
 <138ef325-dc9a-2ca5-9044-c67ffdabb968@redhat.com>
 <20191206124613.GA3902@dhcp-17-72.bos.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191206124613.GA3902@dhcp-17-72.bos.redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 4R-FKP8ONSOLEjbz2If8fQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-TUID: gbaExh6f6y9F

* Cleber Rosa (crosa@redhat.com) wrote:
> On Thu, Dec 05, 2019 at 12:01:56PM +0100, Philippe Mathieu-Daud=E9 wrote:
> >=20
> > Understood, thanks for clearing this out!
> >=20
> > Side note, we don't do cross-arch migration testing, but we talked abou=
t
> > having a 'different QEMU version' migration test. When we get a such te=
st
> > setup, it shouldn't be too difficult to evolve to some cross-arch migra=
tion
> > test.
> >
>=20
> +Oksana,
>=20
> Avocado-VT has had this as a core concept as far as I can remember, and
> it's exposed even as a command line argument:
>=20
>    avocado run --help
>    ...
>    [--vt-qemu-dst-bin VT_DST_QEMU_BIN]
>    ...
>=20

Yeh, I've run that in the past - it works OK.

Dave

> Oksana is currently working on new migration test cases, and may consider
> looking into adding "different QEMU version" support too.
>=20
> PS: I have to say, though, that I'm trying to get my mind around
> cross-arch migration being real.
>=20
> - Cleber.
>=20
> > > > I hope I'm wrong and confuse, this is a great news for me to know w=
e
> > > > can migrate floats!
> > > >=20
> > > > > Dave
> > > > >=20
> > > > > > > So we could store the frequency in clock out and migrate thin=
gs there.
> > > > > > > But since we have no way to ensure all clock out states are m=
igrated
> > > > > > > before some device fetch a ClockIn: we'll have to say "don't =
fetch one
> > > > > > > of your ClockIn frequency during migration and migrate the va=
lue
> > > > > > > yourself if you need it", pretty much like gpios.
> > > > > > >=20
> > > > > > > So we will probably migrate all ClockOut and almost all Clock=
In.
> > > > > > >=20
> > > > > > > It would nice if we had a way to ensure clocks are migrated b=
efore
> > > > > > > devices try to use them. But I don't think this is possible.
> > > > > > >=20
> > > > > > > --
> > > > > > > Damien
> > > > > > >=20
> > > > > >=20
> > > > > --
> > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > > >=20
> > > >=20
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > >=20
> >=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
