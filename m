Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp250981wrq;
        Tue, 22 Oct 2019 11:12:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydQ/yGYXVONk4rHibeYheELOzWVrvH36wDhXS++LXnFudaNiv1AvjI/684qyWGuDHkmqh/
X-Received: by 2002:a63:1f4e:: with SMTP id q14mr5262830pgm.144.1571767933345;
        Tue, 22 Oct 2019 11:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571767933; cv=none;
        d=google.com; s=arc-20160816;
        b=eJRixf2CY/7MpYNg56eVlqQ8AZxb5u3Mqm//0U4epLKxML7A4FU5g9RVH7PGGqy2MJ
         rJuCL01+Sn4s0s5mclrwyh1ZnJ5DpXFKQp7tUvwT8XOa9HLbzG5xnmJ9nrH8xvtqLCo4
         IOeWGnJsb0AheCxP1wshSbFQtCRWVq5a6kli9NKmxlcJX4/lFXx4lryV0slI3Xn2NYrB
         Ww4tIZdNMLsQuSpWD2CTVyDptnQWDDIogDXYS+w8VQB9I4+XwYb88X89rputbiR2iG+z
         PfM7YWVp0OZPi7WiqjbGZFR7WzD1dAcE9829+nS4U/6N9XS0NrwBMdDQ4HmwFqBhHA82
         45JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from;
        bh=Hnnr8tyhRaDcgWNL41p0LrMcGeMAQgQP37PiTjOjUes=;
        b=wmpYlTnUNqf+MKnuISLCA0yZsvXeYxTyQ0mCB+dy+uDAwCPjzuWaIomGdS0kqLTwIQ
         nt3w0C2IGCbISd19Ykh5rmnytTK0dO35XKqjQhfYKlDKv4IUgK1GPgHlvjermrZVyYFK
         c3sFh5sKJAyj4dw/2UbLTtVZ2Z2yGhdJvIhvmz1KkAd2eGH3FTAMkyV/X+qEmM5qrvVl
         Xn3QEe9+jcLd2F3jn+lTTvIeH6a66eneFN9jnxc5LVsN6cEpgaruRtuzd9NF2Bz2RQ19
         xjA2Ptc9688+R+Gl5bmJ/UBNJ8GaccvmnoZYfxTXGZBfK+/0AzAhyy5TYZSgSZS8Cb/E
         PPEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id o23si18376570pjp.57.2019.10.22.11.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 11:12:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 30C373F230CE;
	Tue, 22 Oct 2019 11:12:12 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y7HqjLvEgwMl; Tue, 22 Oct 2019 11:12:12 -0700 (PDT)
Received: from keithp.com (keithp-172.keithp.com [10.0.0.172])
	by elaine.keithp.com (Postfix) with ESMTPSA id E3B6E3F22EBE;
	Tue, 22 Oct 2019 11:12:11 -0700 (PDT)
Received: by keithp.com (Postfix, from userid 1000)
	id B896B1582187; Tue, 22 Oct 2019 11:12:11 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] Semihost SYS_READC implementation
In-Reply-To: <d7470bfa-ba4e-3287-326f-ee63c5d76407@redhat.com>
References: <20191022031335.9880-1-keithp@keithp.com> <d7470bfa-ba4e-3287-326f-ee63c5d76407@redhat.com>
Date: Tue, 22 Oct 2019 11:12:11 -0700
Message-ID: <87sgnk3b0k.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: yx8ddLZG/16h

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Paolo Bonzini <pbonzini@redhat.com> writes:

Thanks so much for looking at this patch.

> I'm a bit confused, why is it not using semihosting_get_chardev?  That
> would be
>
> 	-chardev stdio,id=3Dsemihost
> 	-semihosting-config on,chardev=3Dsemihost

Because I didn't realize the semihosting code already had a Chardev
option.  Thanks much for pointing it out. I've changed the code to use
the semihosting chardev instead of serial_hd(0). That change was quite
simple:

 void qemu_semihosting_console_init(void)
 {
=2D    if (semihosting_enabled()) {
=2D        qemu_chr_fe_init(&console.backend, serial_hd(0), &error_abort);
+    Chardev *chr =3D semihosting_get_chardev();
+
+    if  (chr) {
+        qemu_chr_fe_init(&console.backend, chr, &error_abort);
         qemu_chr_fe_set_handlers(&console.backend,
                                  console_can_read,
                                  console_read,

(I left the call to qemu_semihosting_console_init() late in the
initialization process so that the semihosting I/O ended up with the
stdio mux focus instead of the monitor)

Your example command line was really helpful in figuring out how to get
this to work. Here's the full command line I ended up using so that
semihost, serial and monitor are all muxed to stdio:

$ qemu-system-arm -chardev stdio,mux=3Don,id=3Dstdio0 -serial chardev:stdio=
0 -semihosting-config enable=3Don,chardev=3Dstdio0 -mon chardev=3Dstdio0,mo=
de=3Dreadline=20

It might be nice if this could be shortened, but it certainly provides
the necessary options to make it all work.

I'll post an updated version of the patch in a while, after waiting to
see if there are any additional comments.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl2vRnsACgkQ2yIaaQAA
ABHuuA/+LkJ6ZfdfZ+wCjEtpm9M63MQblGwO1TZAwHDeoRAWtfZeeCni/D3PzJIQ
O2fUsRrCYfFrJxoMK7xyAswQMpv7e4Fn4q9WCPzQ6gjs0SvoC1YUeahXeO5gHj41
db6P86RcQQ4Hg/uJXKWskVxGEZGZT/VKMH90YC4j5PuylCP2r6iGwznbl48bEqa7
hUkZxedMDZEl8wAHYJSCIAhzC4Lk58PMsK82jninKoE93r5xBPKpVqBuChlGEV1J
rABmwZjf+Nuj1idIUvylkGSY8sO/GvkjaoZDuz19V9yEUMhfgsN6DG59tDLDmG/I
PLMtSgVR+JmnksZIof0X+BLerS6zIouI1yj7/ZfobnycZqcULTMAmpEcr+BWAyX9
r83S3Oj8IxvecCm4TuQsKlAfoWJ2a2A7g92ytdCCu1/1z29ScZ2GsfJMwyBzoBRK
rnc9ULexi0V9OgY8WIziHhEUSUGZzRu7QjmJeSdvq9xgyTQRGVX4rp9UPcT/uo76
QEYCUGGJJQtnNxnldaLoeA1fDp6OOogwr+ysw6hILkCAP/fwH5sEZxz7UVjuzAUp
BTXPAbgkUF7eyOTXUEyM0n+D387ibaJi2X+VInRQJ09GwoYu7siHFm25MV/AHcEh
x5sTBS9FZ52tFqjbhfuwyLLcKpzZKur8NX8TAn9UmRQNGj2ZIrk=
=I6jL
-----END PGP SIGNATURE-----
--=-=-=--
