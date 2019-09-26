Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1794992wrp;
        Thu, 26 Sep 2019 00:29:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxn14x9l4Zyj1VFaNZ/ee1nXFS6D+pbKMV4sGPZpPzuNrNVtstPRFvhLwPzFP3AsVAj0l3x
X-Received: by 2002:a37:6250:: with SMTP id w77mr1837690qkb.153.1569482956810;
        Thu, 26 Sep 2019 00:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569482956; cv=none;
        d=google.com; s=arc-20160816;
        b=SOEGYyKj3oBte0ynZdbRN1yrkUeqLoptq0bM3w3009ZcUBJIOOsj+EoesUSPDyU3uu
         lT5ZY8tLBtlynO3+hSlUUyTey2mEnKs4gwNxaIyh+icH5fUpipLla2XTCKFg0G1txSQH
         ABynIJ+ipzathBKaMZZILcCLNP00vbcj4EYmmJMg+SSVAP5lMk0mMYus2Eq4EPhVV5NW
         sO/VV9m0dO8iZo5p1Rf75XXJeBeyqW/vQmnDyGCQ+th0GU0OdvDG5ic6MCNdd55N2sZP
         jfV9CpvyyW65RfEdg8puXqA5idvIP6QMctY1dZiwv+YqxjzaOswLSlhpcLmf+SwuWIFa
         hoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=/cGhteoZZJM+vapsRTgKYXtTysqbQNmn8NRXYFFQri8=;
        b=Nrn5nbqWHCZwRWnxC0GWncaEKSwNquX2sWbaHbOM1ArPtIw8fQq+AG0NDaGZ/ES1Vk
         WYs2Rf0htUD+m98pNMCp1Lp/yW8p+pwDBRtOWAsOAD19wsnYvZYGcPx0+WWkA6QpUJXW
         9Gj6ZwbQtNjSO2BNKbkXDauJeuDNmQd73gk0ILAo2Xb7hHZCoJIGodNn/TBndLSCJlYL
         vqbJH0tuAu+z0ecRK3E3RtfeM+2f+ED0xoOLJz9Bz4/3Wqyfshwrs0eMZy4S/xX3TVf/
         PAA58qaP85/lae57Wp6orAER/EqWMNoGPsys9OBjr+y2wKxZQCIvGpc00F5p9oskCCFR
         VNjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dxnqeLMA;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id d25si1231719qvc.126.2019.09.26.00.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 00:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dxnqeLMA;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1569482956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=/cGhteoZZJM+vapsRTgKYXtTysqbQNmn8NRXYFFQri8=;
	b=dxnqeLMACcUYZFyF2ofPDL96bS2+ANXOkTqYJ+I5U/WzIp7mxyGmvNmA+oq/eDSMv7jMvj
	RWTJcjLYWgi9iYACovXC6ld7VAGiA5sK+bmbn8qzWgihABQNavPnXt7tq6dAlnPWN+T3U/
	m4aglL+AWyyXQNoHKifYNqj6t3UNhQs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-ywntfc6FPbOXwhj2ZxZiNg-1; Thu, 26 Sep 2019 03:29:14 -0400
Received: by mail-wr1-f70.google.com with SMTP id 32so551312wrk.15
        for <alex.bennee@linaro.org>; Thu, 26 Sep 2019 00:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iDJmicGAl96yidCuawMr1CMMu54lmfAcQ3Il8nPoQpk=;
        b=ZK8f0GYbjsYbwENzrseqeOf3iROTY4hq4LfVdDsIVn2p7YSk/gVGHj7e1ViczXYb/l
         Oc9wruianv+1+Ihs78nrv14sLnbdqhHZz0YoIVauPXwqlVH7eNNGyJk6CG1mKNWNDxTL
         VjXZMlkQdU4hR5Ldu4fi29DUqAp3OH60StGmIx2ilhZSNbSE34MYYI/wzkCAe91jXv7T
         aiNjX2llLQlhP4XzChnJ+QytKIqWCGZ7UZiJSWllUYwMHbwSrbd269CchgLLtSuHIURz
         jJcADwGTj+kSuBR62DCbTfpKyPRW0TQR7XfRmEnH+LZAY/6BB2PjgKOHQMMdX0SBKYY5
         teuA==
X-Gm-Message-State: APjAAAVdPLY5eMH5FphF8uZ6NWkTJpUS/y98/3wiDFxeiUoYEk/wmhuk
	3+JTaWmKW+p7yBlYwAg5Yqs0nDb4dfZj9fTaVvE2+UWhmb+n+1RT5TSsHxE6g83F6juTbaWZTrD
	13QzigxeecFwL+Q0r
X-Received: by 2002:a1c:1b58:: with SMTP id b85mr1763101wmb.95.1569482953433;
        Thu, 26 Sep 2019 00:29:13 -0700 (PDT)
X-Received: by 2002:a1c:1b58:: with SMTP id b85mr1763088wmb.95.1569482953208;
        Thu, 26 Sep 2019 00:29:13 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id o188sm2839780wma.14.2019.09.26.00.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2019 00:29:12 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-discuss@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnnu.org
References: <20190925233013.6449-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e08a9d80-a797-76a9-b1e5-6ccbef0b1c37@redhat.com>
Date: Thu, 26 Sep 2019 09:29:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190925233013.6449-1-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: ywntfc6FPbOXwhj2ZxZiNg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: L4wSpGss8Rdc

On 9/26/19 1:30 AM, Alex Benn=C3=A9e wrote:
> The 32 bit hosts are already a second class citizen especially with
> support for running 64 bit guests under TCG. We are also limited by
> testing as actual working 32 bit machines are getting quite rare in
> developers personal menageries. For TCG supporting newer types like
> Int128 is a lot harder with 32 bit calling conventions compared to
> their larger bit sized cousins. Fundamentally address space is the
> most useful thing for the translator to have even for a 32 bit guest a
> 32 bit host is quite constrained.
>=20
> As far as I'm aware 32 bit KVM users are even less numerous. Even
> ILP32 doesn't make much sense given the address space QEMU needs to
> manage.
>=20
> Lets mark these machines as deprecated so we can have the wailing and
> gnashing of teeth now and look to actually dropping the support in a
> couple of cycles.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/configure b/configure
> index 542f6aea3f..776fd460b5 100755
> --- a/configure
> +++ b/configure
> @@ -728,7 +728,7 @@ ARCH=3D
>  # Normalise host CPU name and set ARCH.
>  # Note that this case should only have supported host CPUs, not guests.
>  case "$cpu" in
> -  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
> +  ppc64|s390|s390x|sparc64|riscv64)
>      supported_cpu=3D"yes"
>    ;;
>    ppc64le)
> @@ -737,7 +737,6 @@ case "$cpu" in
>    ;;
>    i386|i486|i586|i686|i86pc|BePC)
>      cpu=3D"i386"
> -    supported_cpu=3D"yes"
>    ;;
>    x86_64|amd64)
>      cpu=3D"x86_64"
> @@ -745,19 +744,22 @@ case "$cpu" in
>    ;;
>    armv*b|armv*l|arm)
>      cpu=3D"arm"
> -    supported_cpu=3D"yes"

I think linux-user is quite used in embedded stuff such NAS.

Eventually this public don't need edge QEMU, it might keep using QEMU
v5.0.stable until all NAS/embedded devices are 64-bit...

>    ;;
>    aarch64)
>      cpu=3D"aarch64"
>      supported_cpu=3D"yes"
>    ;;
> -  mips*)
> +  mips64*)
>      cpu=3D"mips"
>      supported_cpu=3D"yes"
>    ;;
> +  mips*)
> +    cpu=3D"mips"

Similarly I can imagine linux-user being used on some routers.

> +  ;;
>    sparc|sun4[cdmuv])
>      cpu=3D"sparc"
> -    supported_cpu=3D"yes"
> +  ;;
> +  x32|riscv32)

x32 is borderline :) but yes, pointers are 32-bit.

>    ;;
>    *)
>      # This will result in either an error or falling back to TCI later
> @@ -6438,12 +6440,12 @@ if test "$supported_cpu" =3D "no"; then
>      echo "WARNING: SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELE=
ASES!"
>      echo
>      echo "CPU host architecture $cpu support is not currently maintained=
."
> -    echo "The QEMU project intends to remove support for this host CPU i=
n"
> -    echo "a future release if nobody volunteers to maintain it and to"
> -    echo "provide a build host for our continuous integration setup."
> -    echo "configure has succeeded and you can continue to build, but"
> -    echo "if you care about QEMU on this platform you should contact"
> -    echo "us upstream at qemu-devel@nongnu.org."
> +    echo "The QEMU project intends to remove support for all 32 bit host=
"
> +    echo "CPUs in a future release. 64 bit hosts will need a volunteer"
> +    echo "to maintain it and to provide a build host for our continuous"
> +    echo "integration setup. configure has succeeded and you can continu=
e"
> +    echo "to build, but if you care about QEMU on this platform you"
> +    echo "should contact us upstream at qemu-devel@nongnu.org."
>  fi
> =20
>  if test "$supported_os" =3D "no"; then
>=20
