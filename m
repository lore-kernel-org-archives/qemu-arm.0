Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2272104lfc;
        Thu, 11 Feb 2021 05:43:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw11QV4azvvx3q86bHyAbFtRbT8tT8OFAU96ga0NQTB56crI0IgZWwpwtjjqm8VkVnwj8z3
X-Received: by 2002:a25:c901:: with SMTP id z1mr2570262ybf.386.1613050981618;
        Thu, 11 Feb 2021 05:43:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613050981; cv=none;
        d=google.com; s=arc-20160816;
        b=exiaH+BFIbBErhx3pNIC5XSuVH/c+11NIi6JWzSS+LAiVfSlpav7jnf7woeGXCRJgA
         gJre4jtJI7w64F53fiCrjbAj3PPnIciaJ5m4Rh7uOQhnt2xUEqt21TQZXpqXEp9YVgsW
         msvZkgDVa14i1p6f9TKLPhAhgQ9BnSULj/FdXVknFQ6nfStM8EZqkVQyaXOV8jxnSwoq
         9tpwYtziI+NcmMosKcxpksoqaXcnIpBxmXmNafxe3QGrvebbCf3nlRDNWdtcSb86amnR
         veg4ik6Rv+V3KA59VRjPCJST75h8eL75BMwWCsfCAAgXMZJnagiBaoLDEgjc/j2wxajq
         FrLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=kV/WF5qn0kMO8hjbcp2cRjasRWJgVGaR99KFulB7j5w=;
        b=c+5yNIAEB6guTg4WVbcxwT82+3tqoPxu1QS1I1gMJnSS40i3uT2QDHGIgRGkfZQWQb
         xe+1fh9rAHKCvGU/cKb10broi/PygRwtGb9LTEz/L7ATWxjWneuTETLGtQvkQZXR9lUB
         7uzNrmVBbKPykLtgEgeTGFWZcKTA6jHFfjiFE7RzlREVELo0IOEHtIfA7v8BdHemZCYu
         wmNV4a37hv4uJ4VGJnh3aIIjiw6ppvQrB4pFZSU46GBPeDid2Fi4Edg9QCgMLahexA8P
         Ymw5AYaDW6T5uFWPfaUbsqdMgAzjsmcPaP8pO0sn2xAOmOXpTFRyvqBDSF3omNN/JX1b
         ovww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b64si5198979ybh.32.2021.02.11.05.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 05:43:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACFJ-0002kY-0T
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 08:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lABg1-0006Ws-Lr; Thu, 11 Feb 2021 08:06:35 -0500
Received: from mail.csgraf.de ([85.25.223.15]:41118 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lABfz-00038J-2g; Thu, 11 Feb 2021 08:06:33 -0500
Received: from Alexanders-Mac-mini.local (unknown [188.138.100.120])
 by csgraf.de (Postfix) with UTF8SMTPSA id 6F4066080F87;
 Thu, 11 Feb 2021 14:06:27 +0100 (CET)
Message-ID: <37018444-82a8-96c0-b5ce-da056646a1b8@csgraf.de>
Date: Thu, 11 Feb 2021 14:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH v6 07/11] hvf: Add Apple Silicon support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-8-agraf@csgraf.de>
 <CAFEAcA_-4GYk_+jdczWE720-VH1CLcS+1jVB2LzG=bBBJc8w-g@mail.gmail.com>
 <298dcf49-1a99-9406-275f-b05c8befd13b@csgraf.de>
 <CAFEAcA_ze+J7geayqgaV274anQubqiv56qan7wo8EkxZ14Nydw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA_ze+J7geayqgaV274anQubqiv56qan7wo8EkxZ14Nydw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.119,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i3W10xvtGwVZ


On 10.02.21 23:39, Peter Maydell wrote:
> On Wed, 10 Feb 2021 at 22:21, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 28.01.21 16:52, Peter Maydell wrote:
>>> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>>>> +            break;
>>>> +        case EC_AA64_SMC:
>>>> +            cpu_synchronize_state(cpu);
>>>> +            if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
>>>> +                arm_handle_psci_call(arm_cpu);
>>> Have you checked that all the PSCI code really can cope
>>> with being called from a non-TCG accelerator? (As an example
>>> the CPU_SUSPEND implementation calls the TCG wfi helper...)
>>
>> I have not explicitly tried it, but I don't see why the TCG
>> implementation of wfi should in principle break with hvf.
> Because the TCG implementation of wfi is "set some state fields
> and then longjump out to the TCG exec_cpu code-execution loop",
> and hvf doesn't use that loop.


I can confirm that it breaks, but are you really sure about the longjmp 
not working?

What would you prefer instead? Duplicate the PSCI implementation for HVF?


>
>>>> +            } else {
>>>> +                DPRINTF("unknown SMC! %016llx", env->xregs[0]);
>>>> +                env->xregs[0] = -1;
>>> This should inject an UNDEF exception into the guest. (Compare
>>> the pre_smc helper in target/arm/op_helper.c for TCG.)
>>
>> That would break Windows, which is one of the main use cases for hvf
>> support in QEMU.
> Why is Windows making bogus SMC calls ?


Let me have a quick at my crystal ball ... mmmmmmhhhh ... it's a bit 
blurry unfortunately.

I really don't think I'm the right person to answer that question :). 
But the Windows loader does invoke weird SMC calls on boot:


BdsDxe: starting Boot0002 "UEFI QEMU NVMe Ctrl 1234 1" from 
PciRoot(0x0)/Pci(0x1,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)
ConvertPages: failed to find range 102000 - 102FFF
ConvertPages: range BCCE4000 - BCD05FFF covers multiple entries
ConvertPages: range BCCE0000 - BCCEAFFF covers multiple entries
hvf_unknown_smc unknown SMC! 00000000c3000001
SetUefiImageMemoryAttributes - 0x00000000BF500000 - 0x0000000000040000 
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BC190000 - 0x0000000000040000 
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BC140000 - 0x0000000000040000 
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BF4C0000 - 0x0000000000030000 
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BC0F0000 - 0x0000000000040000 
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BBCB0000 - 0x0000000000040000 
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BBB00000 - 0x0000000000030000 
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000BBAC0000 - 0x0000000000030000 
(0x0000000000000008)
hvf_unknown_smc unknown SMC! 0000000084000000
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a
hvf_unknown_smc unknown SMC! 000000008400000a


Alex

