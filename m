Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp7379406lfk;
        Tue, 16 Nov 2021 04:14:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzthdNMyXGojnEP85iY1W46Sp+njKzcOGinsnudJZ5D1nX5tEcKC541Du9JV3qOQvnAgKDs
X-Received: by 2002:a67:6684:: with SMTP id a126mr53568464vsc.22.1637064876107;
        Tue, 16 Nov 2021 04:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637064876; cv=none;
        d=google.com; s=arc-20160816;
        b=a/keuY2vcd6VU1YS4oLOJoM02Un9ccV7HpZ3c8nXukuuhJsyjiXAtcEXKeG3ziBanz
         iwBU+vFo1s3p5WqQXw+mqdL/mi2w5uTkwhSbIs/gvDKrnDlxAv3lfTlRSlCYVC1/nnhU
         wmsTUbn21xrMGosIynFgNuT/SM27XS1LPH6DGq2iRHxqsaT95BVCeWwM1ec2855Fwz48
         h+03TXdRfwgkYYsUV0B+0dG987nj9v2+HZ7rjnF8t9Ab+BJ88s01YFwsBicstsrRSleU
         zh1GgSHShzhOQejkKT7Twm30IBkN4e5i/OOD9ovlqRCquqLmAeW41BlEDjoiYN2mJXXj
         lnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=aX0Eo0DiGPusi654EtTTXLIG3bzJCcQTzGBlYu7VoE0=;
        b=BmmMGQQX69TAP/4zmEHEN+0GeZvMTFd4CtaajrIMR0YTxF84ENMzJWYvBRKHo5v93i
         TbeC09vdJv6DTz5pfqQB2A59DoxUCxYAIn2322lD0JRTglqPFzCoG4qdag/89EdQ1NdN
         HUjE6bXZyggj0JOsz3gy5IDj27Ny1cMnvDwe4b3D6ZoQmfc5HdGad9d1HV/vsd7bITmw
         R9F3o3szTh1gDXLZShUHnftJv7mPaB9pCp58MaNOjLlcihB1cT137N+VR4kctf3PiwYm
         CG/o8GYr/+B6IbIDQraVy+kbCeWyuez+ci1yU5c5zsPNXkGXbbX3q2CqpF2PBrrYbMiJ
         iNPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si56939152vsv.159.2021.11.16.04.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 04:14:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmxMB-0004nd-BW
	for alex.bennee@linaro.org; Tue, 16 Nov 2021 07:14:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mmxLr-0004nD-Br
 for qemu-arm@nongnu.org; Tue, 16 Nov 2021 07:14:15 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:44359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mmxLp-0007Hn-4C
 for qemu-arm@nongnu.org; Tue, 16 Nov 2021 07:14:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A2903CBD4E58;
 Tue, 16 Nov 2021 13:14:08 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 16 Nov
 2021 13:14:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001aa53b0e9-be97-48a3-aa81-70644c80001f,
 BFAEB7FE3C4E2C4D96001007C3BA12B7689A693E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <f5336551-b29c-393f-4047-ed36a1b98f6f@kaod.org>
Date: Tue, 16 Nov 2021 13:14:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
 <5b799ad5-a552-454f-dcc7-1ea6de22b397@amsat.org>
 <87lf1pfm2z.fsf@dusky.pond.sub.org>
 <39b908d3-57aa-ab1e-f10a-87afd887a341@kaod.org>
 <87h7ccbg8i.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87h7ccbg8i.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: adf773a4-d0ae-418d-9518-bf619d4e356b
X-Ovh-Tracer-Id: 11569747445414136732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bin.meng@windriver.com,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, jcd@tribudubois.net,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fLK9Gwd5Q0/P

On 11/16/21 10:29, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 11/15/21 16:57, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> On 11/15/21 13:55, Markus Armbruster wrote:
>>>>> drive_get_next() is basically a bad idea.  It returns the "next" block
>>>>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>>>>> subsequent calls count N up from zero, per interface type.
>>>>>
>>>>> This lets you define unit numbers implicitly by execution order.  If the
>>>>> order changes, or new calls appear "in the middle", unit numbers change.
>>>>> ABI break.  Hard to spot in review.
>>>>>
>>>>> Explicit is better than implicit: use drive_get() directly.
>>>>>
>>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>>> ---
>>>>>    include/sysemu/blockdev.h           |  1 -
>>>>>    blockdev.c                          | 10 ----------
>>>>>    hw/arm/aspeed.c                     | 21 +++++++++++++--------
>>>>>    hw/arm/cubieboard.c                 |  2 +-
>>>>>    hw/arm/imx25_pdk.c                  |  2 +-
>>>>>    hw/arm/integratorcp.c               |  2 +-
>>>>>    hw/arm/mcimx6ul-evk.c               |  2 +-
>>>>>    hw/arm/mcimx7d-sabre.c              |  2 +-
>>>>>    hw/arm/msf2-som.c                   |  2 +-
>>>>>    hw/arm/npcm7xx_boards.c             |  6 +++---
>>>>>    hw/arm/orangepi.c                   |  2 +-
>>>>>    hw/arm/raspi.c                      |  2 +-
>>>>>    hw/arm/realview.c                   |  2 +-
>>>>>    hw/arm/sabrelite.c                  |  2 +-
>>>>>    hw/arm/versatilepb.c                |  4 ++--
>>>>>    hw/arm/vexpress.c                   |  6 +++---
>>>>>    hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>>>>>    hw/arm/xlnx-versal-virt.c           |  3 ++-
>>>>>    hw/arm/xlnx-zcu102.c                |  6 +++---
>>>>>    hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>>>>>    hw/misc/sifive_u_otp.c              |  2 +-
>>>>>    hw/riscv/microchip_pfsoc.c          |  2 +-
>>>>>    hw/sparc64/niagara.c                |  2 +-
>>>>>    23 files changed, 49 insertions(+), 52 deletions(-)
>>>>
>>>>> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
>>>>>        }
>>>>>          for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
>>>>> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
>>>>> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
>>>>> +                           drive_get(IF_SD, 0, i));
>>>>
>>>> If we put SD on bus #0, ...
>>>>
>>>>>        }
>>>>>          if (bmc->soc.emmc.num_slots) {
>>>>> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
>>>>> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
>>>>> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
>>>>
>>>> ... we'd want to put eMMC on bus #1
>>>
>>> Using separate buses for different kinds of devices would be neater, but
>>> it also would be an incompatible change.  This patch keeps existing
>>> bus/unit numbers working.  drive_get_next() can only use bus 0.
>>
>> All Aspeed SoCs have 3 SPI busses, each with multiple CS, and also multiple
>> sdhci controllers with multiple slots.
>>
>> How drives are defined for the aspeed machines can/should be improved.
>> The machine init iterates on the command line drives, attaches the
>> DriveInfo, in the order found, to a m25p80 device model first and then
>> follows on with the SD devices. This is fragile clearly and a bus+id
>> would be most welcome to identify the drive backend.
>>
>> May be this is a prereq for this patchset ?
> 
> Such a change will probably be easier to review after this patch,
> because then it's just a matter of changing / dumbing down parameters to
> drive_get().

ok.

> I can't judge whether incompatible change is okay here.

It looks ok to me since you are using the number of possible devices
of the previous controller as an offset for drive_get().

Thanks,

C.
