Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1154059wrm;
        Fri, 18 Oct 2019 09:39:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2hHpun3NP0P34+1s+J3M8ClQD2rsxHgS/IfoCU8OTScuu2IY2EI2ZkzjaE7At+RtSOb+7
X-Received: by 2002:ac8:5354:: with SMTP id d20mr10751916qto.229.1571416796467;
        Fri, 18 Oct 2019 09:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571416796; cv=none;
        d=google.com; s=arc-20160816;
        b=ADpmOZ0tQgGJSGoPCodYQ8rr4w9o2PUwHVk+Ts34znQnvW5JmWFS03g6gx+PRyg+N8
         wXZa9LeoiC5O0SzX2USABp83VodtEaWvNhZEyZ5Ze/xcJqom8G+z3lvwE4v8mv2E4kWn
         GuY+wOlOhM2tU4pwjawkurXUNe9BgeKIho7FNXM5FtdMxoFX/k1GoCU33LYjhKO55GBn
         UCbtH/8QHx/EEz/SU69gbPKilpUbIPW9n5fk6nXYbB069pvlMhqC1a6MyRa2WeWEiSTn
         HrvQZfJesYW6LcVlu/0sPhTDAZ7Lx0EyG+2As0FEfqlwYX7299k5wAjgQkxRikpmxJV3
         droA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=23m95JkdVC8VGzqcdYu2JTt5Isoo8DTDWYVI1brOuyg=;
        b=OkFmTDyjwsi3cZmZRxOYCJe02BSpyb9rgTg9kTegZRuNHRY6oPwGcyFBzR1+Q4Qlx9
         57JEXW4likWRccZx2bEU1EgqSWT9UzeyJIJs6CH+vHSDx+ptaeqg993d8lybnNTBNlTx
         RZAqJfkHv4/uSVlpxNk1Q5KaB02w+Ydw+8MjWBkJxP4CysPCBscDC3ttWkZ5XSpkQ1ac
         6m7/4YkHAagZ2RmRLuY2W/8OWvP1+2UQr5xKzESne85b4qnS8LLhE5d5E/FYl/aRu1yE
         vBvKRYTr8I60ZTzoHfCcGKgxQX0FTjXeJdJ6KLgROFBKdHsDe7V4XgHmHYLC79VcPsKs
         t0Og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c37si6129262qta.135.2019.10.18.09.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVIB-0005Za-LB
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 12:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iLVI2-0005Xe-6Y
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iLVI0-000512-Ko
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:39:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49920)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iLVI0-00050F-94; Fri, 18 Oct 2019 12:39:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 16A533090FD6;
 Fri, 18 Oct 2019 16:39:43 +0000 (UTC)
Received: from [10.36.116.245] (ovpn-116-245.ams2.redhat.com [10.36.116.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44E305D9CC;
 Fri, 18 Oct 2019 16:39:40 +0000 (UTC)
Subject: Re: [PATCH 0/5] ARM virt: Add NVDIMM support
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a133d4c4-3f60-2bb1-a7d7-35cdb06af265@redhat.com>
Date: Fri, 18 Oct 2019 18:39:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 18 Oct 2019 16:39:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, lersek@redhat.com, linuxarm@huawei.com,
 xuwei5@hisilicon.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cRqNn6I24qad

Hi Shameer,

On 10/4/19 5:52 PM, Shameer Kolothum wrote:
> This series adds NVDIMM support to arm/virt platform.
> This has a dependency on [0] and make use of the GED
> device for NVDIMM hotplug events. The series reuses
> some of=C2=A0the=C2=A0patches posted by Eric in his earlier
> attempt here[1].
>=20
> Patch 1/5 is a fix to the Guest reboot issue on NVDIMM
> hot add case described here[2].
>=20
> I have done basic sanity testing of NVDIMM deviecs with
devcies
> both ACPI and DT Guest boot. Further testing is always
> welcome.
>=20
> Please let me know your feedback.

I tested it on my side. Looks to work pretty well.

one question: I noticed that when a NVDIMM slot is hotplugged one get
the following trace on guest:

nfit ACPI0012:00: found a zero length table '0' parsing nfit
pmem0: detected capacity change from 0 to 1073741824

Have you experienced the 0 length trace?

Besides when we reset the system we find the namespaces again using
"ndctl list -u" so the original bug seems to be fixed.

Did you try to mount a DAX FS. I can mount but with DAX forced off.

sudo mkdir /mnt/mem0
mkfs.xfs -f -m reflink=3D0 /dev/pmem0
sudo mount -o dax /dev/pmem0 /mnt/mem0
[ 2610.051830] XFS (pmem0): DAX enabled. Warning: EXPERIMENTAL, use at
your own risk
[ 2610.178580] XFS (pmem0): DAX unsupported by block device. Turning off
DAX.
[ 2610.180871] XFS (pmem0): Mounting V5 Filesystem
[ 2610.189797] XFS (pmem0): Ending clean mount

I fail to remember if it was the case months ago. I am not sure if it is
an issue in my guest .config or if there is something not yet supported
on aarch64? Did you try on your side?

Also if you forget to put the ",nvdimm" to the machvirt options you get,
on hotplug:
{"error": {"class": "GenericError", "desc": "nvdimm is not yet supported"=
}}
which is not correct anymore ;-)

Thanks

Eric


>=20
> Thanks,
> Shameer
>=20
> [0] https://patchwork.kernel.org/cover/11150345/
> [1] https://patchwork.kernel.org/cover/10830777/
> [2] https://patchwork.kernel.org/patch/11154757/
>=20
> Eric Auger (1):
>   hw/arm/boot: Expose the pmem nodes in the DT
>=20
> Kwangwoo Lee (2):
>   nvdimm: Use configurable ACPI IO base and size
>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>=20
> Shameer Kolothum (2):
>   hw/arm: Align ACPI blob len to PAGE size
>   hw/arm/virt: Add nvdimm hotplug support
>=20
>  docs/specs/acpi_hw_reduced_hotplug.rst |  1 +
>  hw/acpi/generic_event_device.c         | 13 ++++++++
>  hw/acpi/nvdimm.c                       | 32 ++++++++++++------
>  hw/arm/Kconfig                         |  1 +
>  hw/arm/boot.c                          | 45 ++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c               | 20 ++++++++++++
>  hw/arm/virt.c                          | 42 ++++++++++++++++++++----
>  hw/i386/acpi-build.c                   |  6 ++++
>  hw/i386/acpi-build.h                   |  3 ++
>  hw/i386/pc_piix.c                      |  2 ++
>  hw/i386/pc_q35.c                       |  2 ++
>  hw/mem/Kconfig                         |  2 +-
>  include/hw/acpi/generic_event_device.h |  1 +
>  include/hw/arm/virt.h                  |  1 +
>  include/hw/mem/nvdimm.h                |  3 ++
>  15 files changed, 157 insertions(+), 17 deletions(-)
>=20
