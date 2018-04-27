Received: by 10.28.4.212 with SMTP id 203csp1163611wme;
        Fri, 27 Apr 2018 12:50:36 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoDazf69ghZtYpbMPh0IVRYpPcNyhHzyIosZjK+rEmc2fL3RltAX/IUZFaSTODO/pyeivJD
X-Received: by 2002:ac8:859:: with SMTP id x25-v6mr3559837qth.48.1524858636173;
        Fri, 27 Apr 2018 12:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524858636; cv=none;
        d=google.com; s=arc-20160816;
        b=yn0Lf2tW8yey4JG4WBqPc4YL120ojg+NSa1kBqP0Cx0F6+ug7xUqY5u1Vwl40VX1O5
         ob2tDXoFmcktdA92xOd9y1n3V2epmSAZnhTihpfsldHALxWobVs2/AWrORohnCp8cCD8
         pZkRHE5wcEcvB/b/vrrDhnswjjeoosQCNffZAXkcxjPY1j0Ct11AFkTLVr+8X+GI9a/k
         WpX4DvPA2tzrncrm1PeqLDdj3JJvzkZtZlP8w5Tlf5BXsvNdw7hyxRWjC1LAe7InLW6d
         jX/MNxj8BaCsle7jJXF4Kt8MmExNkASsxE54ZMQmV1iMIuECVlM4KyuUlRtlZvRt7HZw
         9LkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:organization
         :openpgp:from:cc:references:to:subject:arc-authentication-results;
        bh=1d7PwCoFV59ZFIxvcr2z40ZbHyOfnh2IDjRADq9cbyM=;
        b=kQ2w8idr164rF9/VMDnDMGbDjx3AVPCVyVNE5i/ug2EiSGHDKxWRvhdp6R2TuYQwB0
         9gWOc6/79PTq5g4PUcVd77Ux/nN7YuTf0OWY/9yMlspRYm7voan44HoPTRD1S0blWYU6
         AOT2gtFoiZIV45D3Ostf0QiTKQG41Q7CTj1ndBBGV+R70xxPnRxFU4A8bd3m51YNT02A
         qYYzQAtZSnApYIWTL8C26Z+KZhTre36iLnImcmarMFFRCdIkshQ+kdjNnqP2LOk5Ob1J
         2WJMSCUtpL0vTmvQ2OBZalKmPOVTK8lsY47/9Ioxg+u0BkU3DS8fUtFS5Wd9+Deqkazf
         zc9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eblake@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id o36-v6si2057910qve.158.2018.04.27.12.50.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Apr 2018 12:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eblake@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C77CC4027E11;
	Fri, 27 Apr 2018 19:50:35 +0000 (UTC)
Received: from [10.10.120.65] (ovpn-120-65.rdu2.redhat.com [10.10.120.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 481A810EE964;
	Fri, 27 Apr 2018 19:50:35 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH] arm/translate-a64: add FP16 FCMP operations
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org
References: <20180427191916.26637-1-alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, "open list:ARM" <qemu-arm@nongnu.org>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <7781dba2-883b-52b2-2c80-316816779e15@redhat.com>
Date: Fri, 27 Apr 2018 14:50:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427191916.26637-1-alex.bennee@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lH8UHjazXymAow9HLzaV1QTruWMQqneUX"
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 27 Apr 2018 19:50:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 27 Apr 2018 19:50:35 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-TUID: hWkpOo1nJoCq

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lH8UHjazXymAow9HLzaV1QTruWMQqneUX
Content-Type: multipart/mixed; boundary="aSwh12gp0DcqeH63R39E11eZSxRzJRShF";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, "open list:ARM" <qemu-arm@nongnu.org>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Message-ID: <7781dba2-883b-52b2-2c80-316816779e15@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] arm/translate-a64: add FP16 FCMP operations
References: <20180427191916.26637-1-alex.bennee@linaro.org>
In-Reply-To: <20180427191916.26637-1-alex.bennee@linaro.org>

--aSwh12gp0DcqeH63R39E11eZSxRzJRShF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/27/2018 02:19 PM, Alex Benn=C3=A9e wrote:
> These where missed out from the rest of the half-precision work.
>=20

s/where missed out from/were missed during/

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--aSwh12gp0DcqeH63R39E11eZSxRzJRShF--

--lH8UHjazXymAow9HLzaV1QTruWMQqneUX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrjfwoACgkQp6FrSiUn
Q2ptsgf/YVER4UoC9XqlpRFKOUB10lvesS6dUjDQrqFEwfeVkNY7cuzieEDjwBsu
OZsS0480x18L/7vf3QX4MBUiT2K1pt+hkieWzNmtTGpgKIiwFbtWFBLwoNNBxitM
okW+rYLb4sdg6htHRrn3frucX3rj68pHUou9fGkxYyx3pfGh8JrOHUMGbH8ywOHo
vu2P0E9djlj+7w1Ko0cjIPUHByZwawDVaS4yskAhgT82/Nb+HqdhDDNn8mIJ2Ohs
fZ51bcK7x26mIivUwM4QGWpX9QVkFBGhbSq/BmXfqbMla638rpDCzjhHdLn42G/w
/BO6tV054xSJ5x1s15EiO59VA/SqJQ==
=8FD2
-----END PGP SIGNATURE-----

--lH8UHjazXymAow9HLzaV1QTruWMQqneUX--
