Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp441300wri;
        Wed, 6 Nov 2019 00:08:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2kmpeKGIFGSgUeyOOH3ukVROJPue0kIk686LxzdhxKRyfJblBlPI0livZDHKxmwdgNcyW
X-Received: by 2002:a37:aa07:: with SMTP id t7mr957770qke.414.1573027690971;
        Wed, 06 Nov 2019 00:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573027690; cv=none;
        d=google.com; s=arc-20160816;
        b=d7Leougvj5aZ/riPZGdjkDVZGnS2Rt7a5b10BmeLko3eARIBwJTn5qULaI4oqRYYrF
         +B29mQ7iB0k9SyI3Ggjr3fRAGSWQDYiyQFyuP4yDtfhvisDHP24btyCLY+F/GFpGYSXL
         9Jbe+a5CG+2KTj4CmemcDpYqPSq5k9aVfRD0IuZx6XjL0nNsOxlxFTFeLifuOyaqIttt
         lj7pZzyyanBcWCEhpCOpfz37Qy6XaH9WW/XjAkxlf67WpzcYTRow7v6u+BGmwxriqS8+
         7w6uip+0YOmCSiRSB3d/4mBnee2C5Q4DR+YY/duL03AwmoqwDuU2AH2oYrdAMiFzGiBP
         2rLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=QG1LCOaU09Dwj3STmutiouVrAODyadM/kxSn0bIr4vM=;
        b=a6VWuiGzbYZD+KccIdGuIgphsomo0Ti2m1UIpFixjarxGWUpWh0Oldd5Q2RVutccTu
         O+Htq/upmu0NAzKRi3TxbIU9/YQTdrd+se6hBgjYdjB0rCMp7OCcT3En0+qq06s6+p2r
         3+TPmsg8UE4K1du8sTWb7YnC9ZM1qJG1qmbjYnle1AAV/n7r0gsMWuqyg8N10Li35kir
         NUjicAGCOpeId4qeOqNbXZN2uDF+tuZohP61JjKyDWDVmvAnYCavHHKrfX+5cFjAuVMg
         ZjOw4Vo7KzYf+ux4uNUFLcMeqm2TcyOy0dAMxEeEkhy9J9Kvp72uMQfjPEnEe2LPQWz5
         O7JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d143si7491489qkb.9.2019.11.06.00.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 00:08:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSGMM-0007NL-Ey
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 03:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iSGME-0007NE-Eh
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 03:08:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iSGMC-0007Ec-TU
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 03:08:02 -0500
Received: from 10.mo7.mail-out.ovh.net ([178.33.250.56]:55811)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iSGMC-0007D2-Nk
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 03:08:00 -0500
Received: from player729.ha.ovh.net (unknown [10.108.54.209])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 1C9D513CF96
 for <qemu-arm@nongnu.org>; Wed,  6 Nov 2019 09:07:56 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 77D99BF352FA;
 Wed,  6 Nov 2019 08:07:30 +0000 (UTC)
Date: Wed, 6 Nov 2019 09:07:28 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/4] Trivial branch patches
Message-ID: <20191106090728.0f758e78@bahia.lan>
In-Reply-To: <41caef0b-3db3-3fcf-a0b4-329e8e88ff0f@vivier.eu>
References: <157296887817.27285.13935693519835086344@37313f22b938>
 <41caef0b-3db3-3fcf-a0b4-329e8e88ff0f@vivier.eu>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 9177210144560028120
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudduiedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucffohhmrghinhepphgrthgthhgvfidrohhrghenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.250.56
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, berrange@redhat.com,
 ehabkost@redhat.com, paul@xen.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 claudio.fontana@huawei.com, qemu-devel@nongnu.org, chouteau@adacore.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, marcandre.lureau@redhat.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, crosa@redhat.com, anthony.perard@citrix.com, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, xen-devel@lists.xenproject.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kzWeUEdtccwn

On Tue, 5 Nov 2019 16:56:11 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Greg, Dave,
>=20
> could you fix that?
>=20
> Thanks,
> Laurent
>=20
> Le 05/11/2019 =C3=A0 16:48, no-reply@patchew.org a =C3=A9crit=C2=A0:
> > Patchew URL: https://patchew.org/QEMU/20191105144247.10301-1-laurent@vi=
vier.eu/
> >=20
> >=20
> >=20
> > Hi,
> >=20
> > This series seems to have some coding style problems. See output below =
for
> > more information:
> >=20
> > Subject: [PULL 0/4] Trivial branch patches
> > Type: series
> > Message-id: 20191105144247.10301-1-laurent@vivier.eu
> >=20
> > =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> > #!/bin/bash
> > git rev-parse base > /dev/null || exit 0
> > git config --local diff.renamelimit 0
> > git config --local diff.renames True
> > git config --local diff.algorithm histogram
> > ./scripts/checkpatch.pl --mailback base..
> > =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> >=20
> > Switched to a new branch 'test'
> > 85ac453 global: Squash 'the the'
> > 9dd7da4 qom: Fix error message in object_class_property_add()
> > 2b76b45 hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses
> > bddcfd9 hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP regi=
sters
> >=20
> > =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> > 1/4 Checking commit bddcfd9b6b24 (hw/misc/grlib_ahb_apb_pnp: Avoid cras=
h when writing to PnP registers)
> > 2/4 Checking commit 2b76b451f9b7 (hw/misc/grlib_ahb_apb_pnp: Fix 8-bit =
accesses)
> > 3/4 Checking commit 9dd7da421bfb (qom: Fix error message in object_clas=
s_property_add())
> > WARNING: line over 80 characters
> > #31: FILE: qom/object.c:1109:
> > +        error_setg(errp, "attempt to add duplicate property '%s' to ob=
ject (type '%s')",
> >=20
> > WARNING: line over 80 characters
> > #43: FILE: qom/object.c:1141:
> > +        error_setg(errp, "attempt to add duplicate property '%s' to cl=
ass (type '%s')",
> >=20

As mentioned in the changelog, this is deliberate. AFAIK better grep-ability
has precedence over the 80 characters rule when it comes to error messages.
Maybe we should teach checkpatch about that ?

Cheers,

--
Greg

> > total: 0 errors, 2 warnings, 22 lines checked
> >=20
> > Patch 3/4 has style problems, please review.  If any of these errors
> > are false positives report them to the maintainer, see
> > CHECKPATCH in MAINTAINERS.
> > 4/4 Checking commit 85ac453d1520 (global: Squash 'the the')
> > ERROR: do not use C99 // comments
> > #26: FILE: disas/libvixl/vixl/invalset.h:105:
> > +  // Note that this does not mean the backing storage is empty: it can=
 still
> >=20
> > total: 1 errors, 0 warnings, 56 lines checked
> >=20
> > Patch 4/4 has style problems, please review.  If any of these errors
> > are false positives report them to the maintainer, see
> > CHECKPATCH in MAINTAINERS.
> >=20
> > =3D=3D=3D OUTPUT END =3D=3D=3D
> >=20
> > Test command exited with code: 1
> >=20
> >=20
> > The full log is available at
> > http://patchew.org/logs/20191105144247.10301-1-laurent@vivier.eu/testin=
g.checkpatch/?type=3Dmessage.
> > ---
> > Email generated automatically by Patchew [https://patchew.org/].
> > Please send your feedback to patchew-devel@redhat.com
> >=20
>=20

