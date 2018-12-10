Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3792397wrt;
        Mon, 10 Dec 2018 08:22:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UqKBj56+DgZ7ufTeqR4uamB6gZA4za3tSDaKVR4c5czS0qj83fIVdvATaXdluji96OPcSQ
X-Received: by 2002:a37:6413:: with SMTP id y19mr11363193qkb.215.1544458932148;
        Mon, 10 Dec 2018 08:22:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544458932; cv=none;
        d=google.com; s=arc-20160816;
        b=QW07JOvkNniLZYZ3mRsmvEsAbCvcYcZQL23orUOLjkV8NLXuh2h7h/liC7jhMnknEI
         yesFviY/hPz0rsZjH6KjyY9a9PIDMwqrZNgepxm7gxfRTvJpmW5iGvztdW4xE9gcZusn
         OrgAyIJdlpu0Ad4zl3u8VgIyfteqWnZDxXlroKBD24x+4+z4qDNVfANTNinD/5DIxjmD
         Fg2rBKd+Mlc3UySnIEVce6eqtNFB5KdCBCq12rMmYIVzvNnzih73Q8c0InhW6aoVI++1
         icXoCACULGBZOTbE1tEHq/5SDoN/kkZUw8DXuv7LJ44VMB+EGAIOY6tVlFtCrBMN+82Z
         J1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=7u6X8oN1FcxTT5cCtbtQis3wNiDINn5c8zGLjzwCu14=;
        b=CbCLc8wTLOXF1UWlLcblHKiQrhQOw4SOVyYYKXD/pBjy0hkGJJUP/k4TfVAuHWVVNw
         8wN2ymtLeKF74q1DvrIJabuq/iaMEjbQnfvuzE+mb61h4BytBi7s3klJNo9/YBkw/oX7
         PIbfDuhT7BsEUA1tika3K8guS1Nps/sfVhWJSQTPbsfQDFI+nLJjw1ZL6EPpdEguHopR
         K+pSsRoLXLq5QPtmu2MSjcNF7pmPfK9bb3kqmgkFFKQH1GNAU1mpXtUieiXOY65B54e8
         diA8D/v0KonHPshTqB8M9/BD5l8toPzy09Iz0PCQi1M3vykn150JDpBO+AX6S7wsAV3v
         3Q7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22si3144888qtc.162.2018.12.10.08.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 08:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWOJv-0005Tn-J2
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 11:22:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gWOIm-00050d-0c
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 11:21:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gWOIl-0004cS-0g
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 11:20:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gWOIg-0004ah-EL; Mon, 10 Dec 2018 11:20:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC8763003191;
	Mon, 10 Dec 2018 16:20:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B88460C45;
	Mon, 10 Dec 2018 16:20:50 +0000 (UTC)
Date: Mon, 10 Dec 2018 17:20:48 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181210162048.zjio2dr7ffgntlfg@kamzik.brq.redhat.com>
References: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 10 Dec 2018 16:20:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V12 0/5] add pvpanic mmio support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xtfblWN1Q6LG

On Thu, Dec 06, 2018 at 07:25:55PM +0800, Peng Hao wrote:
> The first patches are simple cleanups:
>      - patch 1 move the pvpanic device with the 'ocmmon objects' so we =
compile
>                it once for the x86/arm/aarch64 archs,
>      - patch 2 simply renames ISA fields/definitions to generic ones.
>=20
>      Then instead of add/use the MMIO pvpanic device in the virt machin=
e in an
>      unique patch, I split it in two distinct patches:
>      - patch 3 uses Peng Hao's work, but add the MMIO interface to the =
existing
>         device (no logical change).
>      - patch 4 is Peng Hao's work in the virt machine (no logical chang=
e).
>      - patch 5 add pvpanic device in acpi table in virt machine
>      v2 from Peng Hao is:
>      https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.htm=
l
>=20
> v3 --> v4
>      patch 1,2 no modification.
>      patch 3, add TYPE_PANIC_MMIO for distinguishing different bus devi=
ce,
>               virt + isa_pvpanic will abnormally terminate virtual mach=
ine.
>      patch 4, "pvpanic,mmio" --> "qemu,pvpanic-mmio".
>      patch 5, newly added.
>=20
> v4 --> v5
>      patch 1,2 no modification.
>      patch 3 delete PvpanicCommonState structure.
>      patch 4 VIRT_PVPANIC_MMIO --> VIRT_PVPANIC
>              correct VIRT_PVPANIC's overlap start address
>      patch 5 no modification.
>=20
> v5 --> v6
>      add document.
>=20
> v6 --> v7
>      patch 5 modify device name from "PANC" to "PEVT".
>      patch 6 modify document description.
>=20
> v7 --> v8
>      add configure interface for pvpanic-mmio
>=20
> v8 --> v9
>      revert "moving structure definition to header file"
>      because of compile error in x86.
>=20
> v9 --> v10
>      Modify document.
>      Repair missing header files.
>=20
> v10 --> v11
>      change configure interface in virt machine configure parameters.
>=20
> v11 --> v12
>      realize pvpanic as a pci device and use the mmio of pci device.

Do you have a pointer to the kernel patches?

Thanks,
drew


>=20
> Philippe Mathieu-Daud=E9 (2):
>   hw/misc/pvpanic: Build the pvpanic device in $(common-obj)
>   hw/misc/pvpanic: Cosmetic renaming
>=20
> Peng Hao (3):
>   pvpanic : update pvpanic document
>   hw/arm/virt: Use the pvpanic device
>   pvpanic: add mmio interface as a pci device
>=20
> default-configs/arm-softmmu.mak |  1 +
> docs/specs/pvpanic.txt          | 13 +++++-
> hw/misc/Makefile.objs           |  2 +-
> hw/misc/pvpanic.c               | 91 +++++++++++++++++++++++++++++++++-=
-------
> include/hw/misc/pvpanic.h       |  1 +
> include/hw/pci/pci.h            |  1 +
> 6 files changed, 91 insertions(+), 18 deletions(-)
>=20
> --=20
> 1.8.3.1
>=20
>=20
