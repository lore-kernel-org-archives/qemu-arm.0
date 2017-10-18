Received: by 10.223.197.9 with SMTP id q9csp5848396wrf;
        Wed, 18 Oct 2017 09:10:39 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SO/Ze3f5S2FTqaCys0pHj9i3tIYU3mGaa6anxq0j37+qWnM9yjy7PjZbKy1qOafnsgwMn1
X-Received: by 10.200.1.20 with SMTP id e20mr3486746qtg.243.1508343039222;
        Wed, 18 Oct 2017 09:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508343039; cv=none;
        d=google.com; s=arc-20160816;
        b=dgiYS2KX8LAeZHMRYQ7tLlwYgb8ydPWQer6tFUdvJrPKwi5qg85d71VVTjBjyuSra4
         jXofxFSkXaiX7SP11sIuPVnrzuykpkuwbnJsRlI1+ZkEFk2W6jKXbMNXoeFr2hO6ymc7
         MIznCKfABF5u3qoLPICGyX+O9WACl8pAMjBfijrQcIMMtecsacbyXO6nMRpzYX0mL+oQ
         mNqFHWd7CwzZK0hDso/Pe9PhIKqmx6bNRTpUnM24V3ursMV7NdpwXL73V9H4UUA5YIuR
         nfDXz4nW95VM//je+cqYxcyOD9/RXhCfiH5WT5pBbnwAk8nP+XmyqPt7Kp3Hr8AFxxEM
         GzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=3dcxl7XzlJk6hya8SwuPa+UKHSnd86yJabXWTHMMxYE=;
        b=W5N8gk/Xd1LhGgdEIOsLMuvPSQ2QpvGlYGDupFg+zmEfjRmbBiF1ohlebz5fMS5X9h
         ZtAjw+EJYjkrz0AWyZYCD2vZtwM6no0EsaPvJ1cJ9dPUnne7J61B2daBOPmpCp3wrqRg
         BFuiNLuMQy8rWgN5Fza7gcnO4byh8SdZqdeMYqKFSm8gmCYGfEZkm7IErwr8Ai7e0fMI
         IYuinyXYP8mJ2b4DCDvccXiUspycxVin8YrBriO8CIxZCz+0L/21F+bazrD1QpRorcZK
         e9mQ3IN/WZTxvDccGvNWJ7RPYSes+IUcg5KYDyye55xLyih6d8bL9c0cwzh5jNJe0Zgy
         GyiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x145si1576146qkb.416.2017.10.18.09.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Oct 2017 09:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4qvU-0002WF-VS
	for alex.bennee@linaro.org; Wed, 18 Oct 2017 12:10:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e4qvL-0002Vm-Vn
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 12:10:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e4qvH-0008OI-Af
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 12:10:27 -0400
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226]:45835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e4qvH-0008Lo-0y
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 12:10:23 -0400
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 59FCAB7AAE
	for <qemu-arm@nongnu.org>; Wed, 18 Oct 2017 18:10:21 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
	by player731.ha.ovh.net (Postfix) with ESMTPSA id A4C6A42007D;
	Wed, 18 Oct 2017 18:10:13 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171013142852.916-1-clg@kaod.org>
	<20171013142852.916-2-clg@kaod.org>
	<CAFEAcA-gYYbQu-Nuds3E0Aw7j0OdD5_ySm=EdMb1_FzxEoMTBQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8ded3a0e-f7da-00cd-3abd-7d4bb22a5016@kaod.org>
Date: Wed, 18 Oct 2017 18:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gYYbQu-Nuds3E0Aw7j0OdD5_ySm=EdMb1_FzxEoMTBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9001288283101105092
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudeigddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.58.226
Subject: Re: [Qemu-arm] [PATCH v3 1/6] aspeed: add support for the
 witherspoon-bmc board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UfO8GiBTk0qn

On 10/17/2017 05:39 PM, Peter Maydell wrote:
> On 13 October 2017 at 15:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
>> Let's add support for their BMC including a couple of I2C devices as
>> found on real HW.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>
>>  Changes since v2:
>>
>>  - removed 'ignore_memory_transaction_failures' flag on the machine.
>>    Will require a couple of fixes in the legacy U-Boot accessing wrong=
ly
>>    the bss before the DRAM is initialized.
>>
>>    The HW drops the write access surely because the SMC controller is
>>    configured in autoread mode by default. I don't know how to model
>>    this behavior in QEMU. I think we would need suppport to boot from
>>    a MMIO region.
>=20
> It is actually possible now -- see hw/ssi/xilinx_spips.c and the
> request_mmio_ptr code. It's a bit experimental at the moment
> though (in particular it breaks migration, a thing which we
> seem to have forgotten to fix for this release cycle :-( )

I see. So the Aspeed SMC model would have to maintain a cache area=20
of the flash device contents to satisfy the request_ptr() call ?  =20

> The other similar thing we have is the flash devices, which
> allow execution, but requires that the guest doesn't try to
> execute at the same time as it's put the flash into
> reads-like-a-device mode.
>=20
> How are you modelling this bit of the address space at the moment?

The different flash devices are mapped on the AHB bus in ranges=20
depending on the controller (and the SoC). For the AST2500, which=20
is the witherspoon SoC, we have :

  [2000:0000-2FFF:FFFF]  BMC SPI Flash Memory
  [3000:0000-37FF:FFFF]  SPI1 Flash Memory
  [3800:0000-3FFF:FFFF]  SPI2 Flash Memory

The SoC boots from CS0 of the BMC SPI Controller which is also=20
mapped at :

  [0000:0000-0FFF:FFFF]  Firmware SPI Memory (boot-up default)

Today, we  have created a ROM region which is filled with the=20
CS0 flash content. See commit d769a1da342d ("aspeed: use first=20
FMC flash as a boot ROM")

So we end up with address-space memory like this :

    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000007ffffff (prio 0, rom): aspeed.boot_rom
      ...
      0000000020000000-000000002fffffff (prio 0, i/o): aspeed.smc.ast2500=
-fmc.flash
        0000000020000000-0000000027ffffff (prio 0, i/o): aspeed.smc.ast25=
00-fmc.0
        0000000028000000-0000000029ffffff (prio 0, i/o): aspeed.smc.ast25=
00-fmc.1
        000000002a000000-000000002bffffff (prio 0, i/o): aspeed.smc.ast25=
00-fmc.2
      0000000030000000-0000000037ffffff (prio 0, i/o): aspeed.smc.ast2500=
-spi1.flash
      ...  =20
 =20
This is a bit brutal, but it boots from the flash device. Booting=20
from the MMIO region would be much better. I will take a look at it,=20
but after some PPC work.=20

> A "reads like RAM but writes are ignored" lump of memory is easy...

yes. It seems but I haven't found my way through :/ a stack trace
of the failure looks like this :

#0  0x00005555558c1680 in arm_cpu_do_transaction_failed (cs=3D0x5555568cf=
c00, physaddr=3D537117152, addr=3D209376, size=3D4, access_type=3DMMU_DAT=
A_STORE, mmu_idx=3D3, attrs=3D..., response=3D2, retaddr=3D14073705442536=
7)
    at target/arm/op_helper.c:241
#1  0x00005555557e36c6 in cpu_transaction_failed (retaddr=3D1407370544253=
67, response=3D2, attrs=3D..., mmu_idx=3D3, access_type=3DMMU_DATA_STORE,=
 size=3D4, addr=3D209376, physaddr=3D537117152, cpu=3D0x5555568cfc00)
    at include/qom/cpu.h:895
#2  0x00005555557e36c6 in io_writex (env=3Denv@entry=3D0x5555568d7e90, io=
tlbentry=3D<optimized out>, mmu_idx=3Dmmu_idx@entry=3D3, val=3Dval@entry=3D=
4294967, addr=3Daddr@entry=3D209376, retaddr=3Dretaddr@entry=3D1407370544=
25367, size=3D4) at accel/tcg/cputlb.c:825
#3  0x00005555557e73ef in io_writel (retaddr=3D140737054425367, addr=3D20=
9376, val=3D4294967, index=3D204, mmu_idx=3D3, env=3D0x5555568d7e90) at a=
ccel/tcg/softmmu_template.h:265
#4  0x00005555557e73ef in helper_le_stl_mmu (env=3D0x5555568d7e90, addr=3D=
<optimized out>, val=3D4294967, oi=3D35, retaddr=3D140737054425367) at ac=
cel/tcg/softmmu_template.h:300
#5  0x00007fffe622c117 in code_gen_buffer ()
#6  0x00005555557eef8c in cpu_tb_exec (itb=3D<optimized out>, itb=3D<opti=
mized out>, cpu=3D0x5555568d7e90)


> In any case we can deal with this as a later patchset.

Well, I would prefer fixing that little issue above with a workaround
region.=20

Thanks,

C.=20
