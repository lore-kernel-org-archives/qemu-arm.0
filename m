Received: by 2002:a05:6214:430:0:0:0:0 with SMTP id a16csp1140303qvy;
        Mon, 7 Feb 2022 07:34:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA1/D29DRgDoO5dBGO9aUjA0qMkYRl9i/+erdl3RfwQLfrk0IDMQmov0A9shT4Jx1xTPwF
X-Received: by 2002:a25:db42:: with SMTP id g63mr222031ybf.25.1644248044158;
        Mon, 07 Feb 2022 07:34:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644248044; cv=none;
        d=google.com; s=arc-20160816;
        b=Ra7ycSQAnW08K3nilRDVbWWOW3A7qCF51OPZkXWjymI2ot7Hsf0xEur2+53O8XSlY1
         /R55zlJ7AdDKRCXxfFBJ197jpRFaUdWVxLLTrR+8Aik7n+Y6kosn6qQGjeEIGiy5elTj
         P8xQpFKi6sI1uqJ8U+oF1VoAdZTxV0hGpRm8tvSCme1u1Zsv+Zy4BIFCgJUjvmWfV2sI
         YLw646Ae2cse4cG3l75hSVZCeuLnoz423+kXIS0yS8CctNt54EbA+rPADDsarCNKtUIb
         TdFA0dXX8I5rD0t3b6G9o+3/HFN3GIy4UeVVNc3E4ux/q4zozYIu1sndKaLqAPD11biw
         B3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:subject:user-agent:mime-version:date
         :message-id;
        bh=JtUawYWA5qSh7BoG/BYMpQAScI1xuhD8XeSJvh2MtDw=;
        b=FMjujIH57iJ8yUQQQ50dWADSYWhckvvnasIiKp6xnZPD1HeqSLWZ7lyJB7MaDAUJ7G
         dm1lxndjVaMe0J1yTFH4XHASiJd4ODjX+UxQquWuKlpJlXjK4z9FpDa7QauEB/az6eJ7
         Pk94xhFgXoruzp2YXsBXCvhWE+SZDZyiZwPeo/7hnkmUweftJJb7PQ3a8cwW25Z+0Ypw
         MRriW6uXtFh3pbO44pMan5/0SLThha4YB92LODuEjvVSH8zCpqNt0B5q0d9pQYqXuqVk
         jrVYU5Pkg37oAm7gHTjoFrfhAv1fS/n2XmiD7WjBwghozC5m+E/aPhkW0SSiG6faCNhL
         xkjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i187si7097964ywd.315.2022.02.07.07.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 07:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH61j-0002DM-ML
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 10:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH61S-0002BJ-IR; Mon, 07 Feb 2022 10:33:46 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33842 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH61Q-0001Sm-3H; Mon, 07 Feb 2022 10:33:45 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 8C05460803EF;
 Mon,  7 Feb 2022 16:33:40 +0100 (CET)
Message-ID: <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
Date: Mon, 7 Feb 2022 16:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Rob Herring <robh@kernel.org>,
 sstabellini@kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 michal.simek@xilinx.com, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AkPWJdgWbVg0


On 07.02.22 16:22, Peter Maydell wrote:
> On Mon, 7 Feb 2022 at 14:21, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 27.01.22 16:46, Peter Maydell wrote:
>>> Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
>>> boot.c functionality to allow us to enable psci-conduit only if
>>> the guest is being booted in EL1 or EL2, so that if the user runs
>>> guest EL3 firmware code our PSCI emulation doesn't get in its
>>> way.
>>>
>>> To do this we stop setting the psci-conduit property on the CPU
>>> objects in the SoC code, and instead set the psci_conduit field in
>>> the arm_boot_info struct to tell the common boot loader code that
>>> we'd like PSCI if the guest is starting at an EL that it makes
>>> sense with.
>>>
>>> Note that this means that EL3 guest code will have no way
>>> to power on secondary cores, because we don't model any
>>> kind of power controller that does that on this SoC.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> It's been a while since I worked with ZynqMP, but typically your ATF in
>> EL3 will want to talk to a microblaze firmware blob on the PMU.
>>
>> I only see a stand alone PMU machine for microblaze and a PMU IRQ
>> handling I/O block in QEMU, but nothing that would listen to the events.
>> So I'm fairly sure it will be broken after this patch - and really only
>> worked by accident before.
> Edgar submitted a power-control model patchset:
> https://patchew.org/QEMU/20220203140141.310870-1-edgar.iglesias@gmail.com/


Ah, nice. Would this also work for Versal?


Thanks,

Alex


