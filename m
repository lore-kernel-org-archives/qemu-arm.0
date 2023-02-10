Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2057607ejb;
        Fri, 10 Feb 2023 09:11:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+6lg8dlUrqbQSgeT6D5Gd6rxP6ir+9q7M9szuirIOO2GtNSZo843gMClUiSAPTd8e7fCPd
X-Received: by 2002:a05:6214:1bc9:b0:537:7484:8d1c with SMTP id m9-20020a0562141bc900b0053774848d1cmr29682095qvc.30.1676049088988;
        Fri, 10 Feb 2023 09:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676049088; cv=none;
        d=google.com; s=arc-20160816;
        b=AEl92easVrNZISnqdiMsBT+s0nSwwpwEseyMkSxfksONJxnkolN4VlC0rq0gqdCDY4
         raGN1JCYizU5/yypG2oNPUYQOQXrXRM/dl5krd0GUXA5wSnkCATuUrPuf8dU+0v+xRrF
         7SbosIsRz2usM9DrcLIi89VZfOpBcHRtr5kPT2iGirqf5NPmEDlXZdiR5w5ztd6E29+o
         EKK3OaMQqHYfi3E56pxpduzmGZDhR/nqrwB7mT3xp/+T+V9m85m5xrjlDbjTwHRUWt7R
         Am35VeQbJ/esVDtpCbdWGHBl2THXuALFLE77qmhASEp2V+FQKaF+GErY9M8Ncyywl43I
         5kHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xpd/wQa/7zbsoam3G+qnzylT9lEu37BbNyJhoajYMv4=;
        b=SuMFoNmlbpDc2WDhxnN1WEfp1+0LYVPJZdn5Ho0XP5IT7C/0t0phLOcJNnboORbTkB
         U+4XmyRHRNYDEuGa2SmZtF9TL5Xz4JulvolptR25Q69mT+X9qAntZ5rxrXTajO6zFPo1
         E5WwkNQSzm7e3ryc/9edp561d/6TF48lKjm3swlpwfzxsgki6vjb54gX4avDtrJWyPWm
         XyhJXjd3nhaq0Y+xRJ0+mtq2it/mDNSrlA+VlwPU7JQGEiVyGy7zWSQn3Jcse0WhTjdN
         NGc21eQg62h/LDarTsTqafix31n243T4u3Fbwy3LKDHs2Uu4RdBD8DbiNnW+AmfTB3Aa
         Fbxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Za6YjPpf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05620a255000b006fed8cfac9bsi4648890qko.452.2023.02.10.09.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 09:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Za6YjPpf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQWvb-0005wp-Ls; Fri, 10 Feb 2023 12:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWvY-0005wB-PI
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 12:11:13 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWvW-0007C2-MK
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 12:11:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso4542948wms.4
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 09:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xpd/wQa/7zbsoam3G+qnzylT9lEu37BbNyJhoajYMv4=;
 b=Za6YjPpfmq/b7Ze3mbqQCf4AQkFUqPt/5l11UAy/62rzbeT5pgSc5qj4evQP6TSAl7
 EY7NKN2EpINdDNGAreG9gXtYO/JAnxJ397HzpQAGsicUaQL3Z1J+DTu6rf+1oLiyeJ/4
 IyrFDDQ4XVlg/tjV1S+QOqcRSa8IJJAM7WVWldDAnZEuZFm1UufC1ZBbkJLwagN5J7mX
 Pqpd2wCGMNe/TKksTVjpaiEL6wlsUG0HEep1Nsm17WzQ30ldmVNfR5cDRlLZrtRlSKmW
 0CW7DOVNDA6IcFfQn6ptkqUJ066AtxACOlTrt9AnDMCL9mjzfYUmc1RyJMJGfw4hGCrf
 PP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpd/wQa/7zbsoam3G+qnzylT9lEu37BbNyJhoajYMv4=;
 b=IxX4ipbcZZjYoc98SGHI2UpHZCQaDiYY3QC3qh2QWizmSrrrj+mJnbvgnToQ5cz5f7
 xCN+CnBMlBouX7qlnmye6r8WBJo0fMv8P5NAHUt+YANP5hVq5NIxZZJfmQHIOoDlgFda
 PV0NmXsFVvFmYOf2sD4QF9xn3h8WJ6/C+4uAlbAY7zViTnC4Nud2OMmQDgbsMy7cXkOn
 cn+ZrLbeKgsV9USK++TX6vvVIiVEHmevMpQk2CJ3Im/Gyje/5bXzPDS4vB3uaZBqKbIn
 gaqRjSjMzmYm2Er47XjSpt1zsy8qTrvBfXD+Z8Ch3xDefv3FJ48LTACY8HjbMIUD5QfB
 mNeg==
X-Gm-Message-State: AO0yUKVxZBDyk42E1x2btDRe1MbDivrMRnM0XhGHRdT1dj0Cjx/i0M4l
 9TYd0kuirA49GY+Q6MsMazw3UQ==
X-Received: by 2002:a05:600c:1656:b0:3e0:fda8:7e26 with SMTP id
 o22-20020a05600c165600b003e0fda87e26mr9771632wmn.33.1676049068934; 
 Fri, 10 Feb 2023 09:11:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003df30c94850sm8577400wmc.25.2023.02.10.09.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 09:11:08 -0800 (PST)
Message-ID: <6f97d406-ff70-07b2-2477-c69420bff2a7@linaro.org>
Date: Fri, 10 Feb 2023 18:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
 <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
 <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
 <9578e7ca-5f3d-2d00-7288-16ae486fb8c0@linaro.org>
 <36BB4E64-8163-44BA-B622-8943E1C1DCE8@gmail.com>
 <50FA07E9-C8DA-4D6E-9A87-F40BB9C2D324@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <50FA07E9-C8DA-4D6E-9A87-F40BB9C2D324@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WopZ1BEEJuJi

On 10/2/23 17:27, Bernhard Beschow wrote:
> 
> 
> Am 23. Januar 2023 15:51:49 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>
>>
>> Am 23. Januar 2023 09:25:51 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> On 20/1/23 13:22, Bernhard Beschow wrote:
>>>> Am 13. Januar 2023 17:39:45 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>>>> Am 13. Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>>>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>>>>>> This series consolidates the implementations of the PIIX3 and PIIX4 south
>>>>>>> bridges and is an extended version of [1]. The motivation is to share as much
>>>>>>> code as possible and to bring both device models to feature parity such that
>>>>>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
>>>>>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
>>>>>>> list before.
>>>>>>
>>>>>>> Bernhard Beschow (30):
>>>>>>>      hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>>>>>>>      hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>>>>>>>      hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
>>>>>>>      hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>>>>>      hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>>>>>      hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>>>>>      hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>>>>>>      hw/i386/pc: Create RTC controllers in south bridges
>>>>>>>      hw/i386/pc: No need for rtc_state to be an out-parameter
>>>>>>>      hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>>>>>>        south bridge
>>>>>>>      hw/isa/piix3: Create USB controller in host device
>>>>>>>      hw/isa/piix3: Create power management controller in host device
>>>>>>>      hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>>>>>>      hw/isa/piix3: Create IDE controller in host device
>>>>>>>      hw/isa/piix3: Wire up ACPI interrupt internally
>>>>>>>      hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>>>>>      hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>>>>>      hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>>>>>      hw/isa/piix3: Drop the "3" from PIIX base class
>>>>>>>      hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>>>>>      hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>>>>>      hw/isa/piix4: Use TYPE_ISA_PIC device
>>>>>>>      hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>>>>>      hw/isa/piix4: Rename reset control operations to match PIIX3
>>>>>>>      hw/isa/piix3: Merge hw/isa/piix4.c
>>>>>>>      hw/isa/piix: Harmonize names of reset control memory regions
>>>>>>>      hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>>>>>      hw/isa/piix: Rename functions to be shared for interrupt triggering
>>>>>>>      hw/isa/piix: Consolidate IRQ triggering
>>>>>>>      hw/isa/piix: Share PIIX3's base class with PIIX4
>>>>>>>
>>>>>>> Philippe Mathieu-Daudé (3):
>>>>>>>      hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>>>>>>      hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>>>>>>      hw/isa/piix4: Correct IRQRC[A:D] reset values
>>>>>>
>>>>>> I'm queuing the first 10 patches for now to alleviate the size of this
>>>>>> series, and I'll respin a v7 with the rest to avoid making you suffer
>>>>>> any longer :/ Thanks for insisting in this effort and I apologize it
>>>>>> is taking me so long...
>>>>>
>>>>> Okay... What's the further plan? Is there anything missing?
>>>>
>>>> Ping
>>>
>>> The plan is "I'll respin a v7 with the rest".
>>
>> I understood that part. I wonder what the blocking issue is/was.
> 
> The first part of this series contains piix3 changes such as the ISA proxy pic and movement of rtc. This seems the riskier part of the series to me which I'd like to get feedback on from the field rather sooner than later. The reason is that I can't currently forsee how fast I could react if these changes were merged during (soft) freeze.

What bugs me is the i8259 proxy. I applied your patches locally, and am
trying to rework to avoid using it. I amend a 'Co-developed-by' tag
to patches modified:
https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

