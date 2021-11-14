Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4938289lfk;
        Sun, 14 Nov 2021 13:35:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+PHnumm6/9ISXdwI8WVhu/+aBKSJVy7pj90QTWjA2BNf25vsw6dTYbBvuITNwky1X263w
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr34031390wrm.103.1636925730799;
        Sun, 14 Nov 2021 13:35:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636925730; cv=none;
        d=google.com; s=arc-20160816;
        b=xQs8AIb003jfNV7SBwm0MbT4jNhu/AXrOG9pCDxD4m0Pr5ZJ9l0gip4Rihvurk1rZR
         CY9Jjsb7Q13P4Z8bxGAJd5qpUQTtk4cHk+UU1Pld6EM7Cyh9mUX62De2lMefb9w77dg3
         DOpzaxGXJeb+HrNDVS8iY5d4jRxMiauxnryEsmnHQFzWbSytjEkXirDly/wdZRC/xoHq
         3SU0iNamY7SEWwVEcQmyoF4JzzsvJHlw3HA6oeQCgR71y7X2WdFmNILBTbmMceOPagG1
         mGvZqzhnJAKPRSZOl+c4xUfBnbnVL8FZX3KUxXfBVIy5VUQUFLwnsiwhUan5URjBB+rQ
         QeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=EBhferSvwrMCnEGwfr+CXlR9BIPh8Y7gWQUnYAeNhi8=;
        b=ZyA3BJfcnJt7TMfaY2Oq+Ul3pfD56ax6e8f/8Z5HNVfGOK/Zn7/U4y4HHuimpNXuxM
         VyWdLAzQFRZZktBopQhcJKTaKNA/E4SWHJrooSST+qXimid6DjwetwFUAzD6I4NhiEKC
         R9cZLQyx8iNstQKISyMpFwD6eRbfHBrEMuPGiBQQb4JRogh/F3Zv0otjEi24k9oTVNxH
         12sMMiOiGfRrXIbxSW30Km8EEtyzKwjks8n12VynRXmutRZE/uCmgUTxqKLB/dJWpxor
         uyS6EeXIYyY58Ji0qzi8Y5FCHUYs30Tbxg/gA6Va0cfo+2A5re2qJ46LBt8mMp5i9pX8
         pnng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id y2si23620118wmj.29.2021.11.14.13.35.30;
        Sun, 14 Nov 2021 13:35:30 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [192.168.106.118] (dynamic-095-118-029-131.95.118.pool.telefonica.de [95.118.29.131])
	by csgraf.de (Postfix) with ESMTPSA id 920AA608038A;
	Sun, 14 Nov 2021 22:35:29 +0100 (CET)
Message-ID: <55997def-c09c-00c8-711a-50a2ac6e7576@csgraf.de>
Date: Sun, 14 Nov 2021 22:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Content-Language: en-US
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Andrei Warkentin <andrey.warkentin@gmail.com>
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
In-Reply-To: <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: XVk1twHcEXZb


On 14.11.21 18:41, Alexander Graf wrote:
>
>> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
>>
>> ﻿On Sun, 14 Nov 2021 at 10:56, Alexander Graf <agraf@csgraf.de> wrote:
>>> When we expose an SMC conduit, we're implicitly telling the guest that
>>> there is EL3 available because it needs to call it. While that EL3 then
>>> is not backed by the emulated CPU, from the guest's EL2 point of view,
>>> it still means there is an EL3 to call into.
>>>
>>> This is a problem for VMware ESXi, which validates EL3 availability before
>>> doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.
>>>
>>> Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>> ---
>>> target/arm/cpu.c | 20 +++++++++++++++-----
>>> 1 file changed, 15 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index a211804fd3..21092c5242 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>>           */
>>>          unset_feature(env, ARM_FEATURE_EL3);
>>>
>>> -        /* Disable the security extension feature bits in the processor feature
>>> -         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
>>> -         */
>>> -        cpu->isar.id_pfr1 &= ~0xf0;
>>> -        cpu->isar.id_aa64pfr0 &= ~0xf000;
>>> +        if (cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
>>> +            /*
>>> +             * We tell the guest to use SMC calls into EL3 for PSCI calls, so
>>> +             * there has to be EL3 available. We merely execute it on the host
>>> +             * in QEMU rather than in actual EL3 inside the guest.
>>> +             */
>>> +        } else {
>>> +            /*
>>> +             * Disable the security extension feature bits in the processor
>>> +             * feature registers as well. These are id_pfr1[7:4] and
>>> +             * id_aa64pfr0[15:12].
>>> +             */
>>> +            cpu->isar.id_pfr1 &= ~0xf0;
>>> +            cpu->isar.id_aa64pfr0 &= ~0xf000;
>>> +        }
>> This is tricky, because we use the cpu->isar values to determine whether
>> we should be emulating things. So this change means we now create an
>> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
>> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
>> unset), and depending on which of the two "do we have EL3?" methods
>> any bit of the TCG code is using will give different results...
> Do you think it would be sufficient to go through all readers of the isar bits and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy to do so then! :)


The aa32 pfr1 seems to have a single consumer:

static inline bool isar_feature_aa32_m_sec_state(const ARMISARegisters *id)
{
     /*
      * Return true if M-profile state handling insns
      * (VSCCLRM, CLRM, FPCTX access insns) are implemented
      */
     return FIELD_EX32(id->id_pfr1, ID_PFR1, SECURITY) >= 3;
}

which is only called for M profile. For M profile however, the patch is 
irrelevant as it's patching inside a !arm_feature(env, ARM_FEATURE_M) 
branch.

The only consumer of the AA64PFR.EL3 field I could find was in KVM code 
when assembling -cpu host. It again is unaffected by this patch.


Alex

