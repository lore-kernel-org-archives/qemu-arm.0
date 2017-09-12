Received: by 10.223.172.38 with SMTP id v35csp7178218wrc;
        Tue, 12 Sep 2017 07:56:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBepCQFCzGN0l+t0vemh7PCPupc3GzKkQaV6fyRnlE0v0jtkNzHJ4SCrARteGD9YTuEgakf
X-Received: by 10.237.39.135 with SMTP id a7mr23093219qtd.84.1505228198182;
        Tue, 12 Sep 2017 07:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505228198; cv=none;
        d=google.com; s=arc-20160816;
        b=D4i//Eu3kSuMNR6CpGoiAAB5/dVm9JhsacrcjkYv7Pdamm+JUhiInwZ/gvj2qSr7nf
         K6r/IlSQQQ45RbZCCIJXMn/mgp9v8GoLY+hbho4ujCTUbuHVTOkRiqAuWM6GEDcV5nyT
         46UoYqJKFAAW5BkT18dElCB+DvBXZaDy56AaOZf9o+3dTuP++kFVLisS/nkVeaKuDHEz
         74Tu8psjAUlj5A2Iom7sVOfWGmghElyuBqw31CI5LBIPo/velOy98CyH114CCNRhdg0F
         eVai/lpDgL3E9qr8m8wm+tgO0GboagQRnYkvUF7/93cRLEqeGrguWEjIkThYxm8ExVFL
         Aahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to
         :dmarc-filter:arc-authentication-results;
        bh=zNu9RVxM7FWwRilnhhyPjwOxyD46uf9L2VxXtcLyvPk=;
        b=g/sUSb8JPNjIamDSgifvMlhXzTYiFXJS4HlzEr+mnsgoIwRCj209cb18/GPqrO9dHC
         RcM+WBT114ib8fq2nHAE53bLhz29CRAG+Y1/5xUpno6+cNPImB3+MXX7j2Iekk0BxlEA
         ESe43QRl3N6MziyY8GsqwfTi/b46g8lc7xHGGinrdJbZ3kQsBGXl174Mp30orF9nsixL
         rYRhnVsGsTyhAfkfu9l8qwded3quVqGKZnLFV39wBG4GcDGq4ngHusJBC3pkMT+23AMZ
         n8Y0vAMRtt0iGbuIzVSwU2xR2IP9bCs5GhY8qbs5zwA+IP4BoP4dN6lylQviv2lu6wBr
         ZGqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j65si11840874qkc.278.2017.09.12.07.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drmc8-0004uE-09
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:56:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drmXy-0001nR-Dh
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 10:52:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drmXt-0005Xg-JY
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 10:52:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1drmXi-0005Ev-LY; Tue, 12 Sep 2017 10:52:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C4684E4C3;
	Tue, 12 Sep 2017 14:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6C4684E4C3
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.40.204.137] (ovpn-204-137.brq.redhat.com [10.40.204.137])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B17166267E;
	Tue, 12 Sep 2017 14:51:57 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912164644.2a0b6977@bahia.lan>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6198350f-a694-cf1b-ec00-4c42ccce39a6@redhat.com>
Date: Tue, 12 Sep 2017 16:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170912164644.2a0b6977@bahia.lan>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="eggrjUaxIGESK3G2WJO0XjI50UAhKdCh1"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 12 Sep 2017 14:52:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/3] hmp: fix "dump-quest-memory"
 segfault
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, ehabkost@redhat.com,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zlqYN4stluhP

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eggrjUaxIGESK3G2WJO0XjI50UAhKdCh1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12.09.2017 16:46, Greg Kurz wrote:
> On Tue, 12 Sep 2017 16:01:46 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
>=20
>> Fix aarch64 and ppc when dump-guest-memory is
>> used with none machine type and no CPU.
>>
>> The other machine types don't have the problem.
>>
>> Update test-hmp, to test none machine type
>> with (2 MB) and without memory, and add a test
>> to test dump-quest-memory without filter parameters
>> (it needs the fix from Cornelia Huck to work)
>>
>> v3:
>>   - remove blank line after a comment
>>   - forbid memory dump when there is no CPU
>>
>=20
> So in the end, we would forbid dump on aarch64 and
> ppc, while it is allowed on i386... I don't really
> care about which behavior is more appropriate but
> I guess they should be consistent at least.

It's kind of consistent: Allow it on architectures with fixed endianess,
but disallow it on architectures without fixed endianess ;-)

Honestly, it should not matter - we're talking here about the "none"
machine without a CPU ... as long as it does not crash, there is no need
for a working "dump-guest-memory" function here.

 Thomas


--eggrjUaxIGESK3G2WJO0XjI50UAhKdCh1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJZt/SLAAoJEC7Z13T+cC218JwP/A/xuZHyv6rt41+vANkwgTvc
bxS8lPLh39txq8bZIT64n2QR3IHeQ3I/z2Ou8pinguVmzdmq36pYvjbTevxWWOlf
AMYKYtBTJtO+52z4RqVNrxlJZBEZcxgFCrYm02s1O3DUhHEfUYY+CCYMvxitbQ4S
6uoBcDQqi+SmPKCH4EcwJbdEsLJwJPfmKdUeNuCWZFYJ65ICf2O8Nho7JtkLs2xG
sYeKYRBJw7KhWfdx+wW2BdzcWbznm9n2aXzEbLko1mlXFbRwDMeIU+GgSXtaHmSZ
v3RfjSPC3vdm4BwbmyIjGtI2rRximeDuIco6+f5rFdQQ5HsdhvMCFkMCdeb84Ekm
fp5HIra2FWY8NEH4+N8W5+agHt5VGqkXLphyz5MjbgQszjn7/zwN3l4X0gV5V6YA
AitCSH+/UxOWjoEsaXOObT8TG/0e3Sw8lMz5rzGm3m9DtrJ0h3+C1KxAI4e9ubzi
NimCo6Vhat1H0qUAkttTkjkDI4pyLhWdWM0goCPvD2P5fOSolZ5sF+7DGdV56Fmt
idnQYtqHDLanSfH3avFfX4eEFsIQEjqCuPNeypFU7WYLFA8gdmNq6TzCDHzSBler
RZ1NciilrAt+rcOviI3EaDUgjZ+lt/Bx4WnbiGvHjZzgw4A3CzmUzk62ZeRhVMuq
VgK6AzcLutk08kQBjXtV
=jCqC
-----END PGP SIGNATURE-----

--eggrjUaxIGESK3G2WJO0XjI50UAhKdCh1--
