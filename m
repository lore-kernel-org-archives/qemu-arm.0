Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp696729lff;
        Fri, 6 Dec 2019 04:46:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGvoyQMptzpecm6KLz7u8JIdMlwYV4v7Sd2VyzfKcQ7wi85keGKQwr5W7nYq7ewKMwioKF
X-Received: by 2002:a05:6214:983:: with SMTP id dt3mr12304799qvb.145.1575636385573;
        Fri, 06 Dec 2019 04:46:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575636385; cv=none;
        d=google.com; s=arc-20160816;
        b=WpwcR7OiPa5ij1vjT/GvYS5XHHKPWIUJn1CDWt67UrLBc3eLQSYcBWM8dukWDu5R7p
         hqkrqsaAnDtt4T+qF9f8m60rAG0sKmHhTF/B0dWYjqLScDuRShvyPiPue1zE5eWlrsWr
         renU9w4CLJJupg141HUxof4a7/wxn/5p99SC5TF7TEgfU5HWCJqwfXSDd0rKNxvzGT7c
         Bx0x8T9j/FyNeLN0cIbUrSkHjxRVKYBz0cLzj4jDdrMhNX3euPF/F3YqQfbrHcR42q5s
         K0T8Ya6Bpg7798L0yKCdLvJE9iXWoQIC/HJqfPrndKm3Ks4Soa3Hpoj4mfWYIRFk9mDn
         +Ryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=S7puR9cKXQmceadF8aHitsChjwoUelc3PuZxZ7OsHwg=;
        b=kZD/7QczOto78pOxYH33Dayd0wZLs0BGZDF0txi9G2UR1Y600DP8gNPR3UtIjZxdpg
         DBrmzKgDXVliNczELqoeTjQWpVpd8JGR5TgQQyJqH/kICDWic3krF2vFaDxvsGszQ+Fl
         wxirD3rGCqXH1r9852ehcgx6XBycMCB47eO+Y5aiaxSsQDzPQSHClljhu93FlJVmDRA9
         5oMNv3BJvDFV6FuFK9abVPOjMjost0p+hPv1yP6mQJSrADbgMyWTIhsKoFs5b26ZbIBw
         5ldsIWldHfwPSGWjit0GBm1SSnc6Bjj4UQdWPpq+7aZWDZ6YJAtZ7U2XNnK2tKti9O6r
         luGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MHOtRqaC;
       spf=pass (google.com: domain of crosa@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id m65si4617073qkf.228.2019.12.06.04.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Dec 2019 04:46:25 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MHOtRqaC;
       spf=pass (google.com: domain of crosa@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575636385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7puR9cKXQmceadF8aHitsChjwoUelc3PuZxZ7OsHwg=;
	b=MHOtRqaCxmNZmPph+LJvYeSNFm5+tzRc677VTs0xArnOjB+i6Wh9s+gzFtrwAiHwgBV9FW
	yCcQJBFmRdxLHyvaM803gA7PJDZfBENTdXcY01LV3ixoporLSo8duS19xQKFCAl2gJPlB4
	nAJfcNkhUkLzrxt3x4sq1JY9liyTsns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-MMCP8qYbNLKcimh9pfhsYw-1; Fri, 06 Dec 2019 07:46:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D68F800EB9;
	Fri,  6 Dec 2019 12:46:22 +0000 (UTC)
Received: from dhcp-17-72.bos.redhat.com (dhcp-17-72.bos.redhat.com [10.18.17.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A38567E52;
	Fri,  6 Dec 2019 12:46:14 +0000 (UTC)
Date: Fri, 6 Dec 2019 07:46:13 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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
Message-ID: <20191206124613.GA3902@dhcp-17-72.bos.redhat.com>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <CAFEAcA98rt6nRDSrwk8XRbaBT67LZXvF=XEV13dtJBp4fPUscw@mail.gmail.com>
 <be199ad6-1b79-f77d-afad-faeb042151ed@greensocs.com>
 <febdb64d-9d02-66ad-84d2-dc795879e48b@redhat.com>
 <a0cea550-d6c7-0193-b4e6-24ed879be61d@greensocs.com>
 <279a0fd5-1ea5-b3c7-27bb-b1d22db5e359@redhat.com>
 <20191205102151.GB2824@work-vm>
 <f3aa4881-dd41-ce71-0f5a-8d36bf5c3828@redhat.com>
 <20191205105613.GE2824@work-vm>
 <138ef325-dc9a-2ca5-9044-c67ffdabb968@redhat.com>
MIME-Version: 1.0
In-Reply-To: <138ef325-dc9a-2ca5-9044-c67ffdabb968@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MMCP8qYbNLKcimh9pfhsYw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-TUID: 3mCSK/S/Ui68

On Thu, Dec 05, 2019 at 12:01:56PM +0100, Philippe Mathieu-Daud=E9 wrote:
>=20
> Understood, thanks for clearing this out!
>=20
> Side note, we don't do cross-arch migration testing, but we talked about
> having a 'different QEMU version' migration test. When we get a such test
> setup, it shouldn't be too difficult to evolve to some cross-arch migrati=
on
> test.
>

+Oksana,

Avocado-VT has had this as a core concept as far as I can remember, and
it's exposed even as a command line argument:

   avocado run --help
   ...
   [--vt-qemu-dst-bin VT_DST_QEMU_BIN]
   ...

Oksana is currently working on new migration test cases, and may consider
looking into adding "different QEMU version" support too.

PS: I have to say, though, that I'm trying to get my mind around
cross-arch migration being real.

- Cleber.

> > > I hope I'm wrong and confuse, this is a great news for me to know we
> > > can migrate floats!
> > >=20
> > > > Dave
> > > >=20
> > > > > > So we could store the frequency in clock out and migrate things=
 there.
> > > > > > But since we have no way to ensure all clock out states are mig=
rated
> > > > > > before some device fetch a ClockIn: we'll have to say "don't fe=
tch one
> > > > > > of your ClockIn frequency during migration and migrate the valu=
e
> > > > > > yourself if you need it", pretty much like gpios.
> > > > > >=20
> > > > > > So we will probably migrate all ClockOut and almost all ClockIn=
.
> > > > > >=20
> > > > > > It would nice if we had a way to ensure clocks are migrated bef=
ore
> > > > > > devices try to use them. But I don't think this is possible.
> > > > > >=20
> > > > > > --
> > > > > > Damien
> > > > > >=20
> > > > >=20
> > > > --
> > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > >=20
> > >=20
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >=20
>=20
