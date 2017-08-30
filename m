Received: by 10.223.188.70 with SMTP id a6csp1465546wrh;
        Wed, 30 Aug 2017 14:20:59 -0700 (PDT)
X-Received: by 10.55.164.136 with SMTP id n130mr954897qke.215.1504128059387;
        Wed, 30 Aug 2017 14:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504128059; cv=none;
        d=google.com; s=arc-20160816;
        b=PfjptkXf1xkB3cmI40dyTBH/V1nLFmwy+9OHot9NZc3xBlYcAwJ1heVLdJ7EoSn24l
         4ybncZAj67r+HA4LvvxmuVbN+vbWKFX6JNLeU43wxatVyFbBKRUqJJiTw72dyfuWsT9d
         mCQiXg73ED+C/gqvYX3wUWNAvUS8C6UUSvGUdQmScoOiHqEalW8TsBR0pRN7fgdVnzw+
         booIYuc4ueX2NxCdS1ZBagy1EU6EgElM76Rm2CsPV25199JY5evrJnysGW/O9JnlZsTN
         UnH7uAm9wx1UaYc1HDKfZWoLDXcGgkrGM+ofdspS3BGdCiFFo3Tz5D+2jYKlOY0bnNeV
         iywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ewGsQBQ5Opu++IcyvbcrCoJV6ozE5fgOJz+Gg1nz8Do=;
        b=ABv46SMSISpZH1iqWa/gjuJAqb2Jhg9bwyMd4GHIU+sa8efgexRoujbe+KyEU7p6aj
         PtRwj4eWM57Ix5XRnJOLXPpwp21r4jQkBaeRINmWnLYYL4aU1E4nC3rqnISNqV4H7tE3
         mMCVzPzMSGzkl8hcO2cnbdp6J2SKULZMcdzyYd1mZGI9kp9AlCJs9hlkiV0RJZUjvUYs
         qdF3MIYpTYkHPk8qkkXtftBUWN3OIiUxX1uY9SzL191IrP/ejFI9vmBOnmRkSXe3XF4N
         B3CA+hnczUvyJBr0FlaEqWUVeITdt31fp3vsUAvDD/DQorIBy/JTSl6Csx/xHRlGSMGe
         m5cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iLS17Cjx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z92si2629245qtd.462.2017.08.30.14.20.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 14:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iLS17Cjx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnAPw-0000vk-Vs
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 17:20:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAJu-0003HV-Qe
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 17:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAJt-000256-Qk
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 17:14:42 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAJp-00023b-4N; Wed, 30 Aug 2017 17:14:37 -0400
Received: by mail-qt0-x242.google.com with SMTP id e2so6182449qta.3;
	Wed, 30 Aug 2017 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ewGsQBQ5Opu++IcyvbcrCoJV6ozE5fgOJz+Gg1nz8Do=;
	b=iLS17Cjxj+yspVHRcatHmq12CeXLzMxTcyuJB2l1C2IleU7UtCu8QDC0VAez3NBMs9
	6qDW6fPv9GdGHn3M5SLMhXQ3kOK5u40iVSILZfkFjus1M/fo21eqf5eaxB8rduToDEpL
	8jNYbzLYOf8OWuO2QG0LN754z5tsngqpUedvBe+6cPt/vBiLpWGlt4AF257U0FSah/tx
	8EOZ8jEDffaR9PknicXp7mUJqNtN5hZfI+A3lq2kJaQbtqTsBVU8uCcV+j93Q3VZf2h2
	3qVT8U5R4uLEyHsx/o4bBO0PuQPpYsK2Jp80vA8JyOUDyB+1r599gnFEb3PBZLLskqMs
	ZrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ewGsQBQ5Opu++IcyvbcrCoJV6ozE5fgOJz+Gg1nz8Do=;
	b=JSMF2Rs5TDccCZykkpL7Po3CIbe9QHWVauYXlR4q0ZgbW8e4+0MX7qb8gxsg1jC+3p
	a3BHDjnMVcKM1WO1zyVmhsgRIrLeTDvglQPWGmlOttRfH69lXw0ve02Rt18yGeA4qqxT
	6j18nEYG4yS3Bc44NzkPkDv9ftFLQ4gidsnkKeF9XrUtJcqPT7zq97VrCBVFlAVpe+un
	u7Ptnepa3+JH/x9BSl/3afOLYlDfdRCPm7Mk8uBKXt0vYDMMQMI+O7L3EMC87Bf/7ZAB
	DMlQGmJU9FgHtRdMViEL3+U18rAsf9re7xKwwmBMhYxpb0CnzZr4o57P3H/13/I94UCM
	fdMQ==
X-Gm-Message-State: AHYfb5g4TOawN9pVxR2ZPwe+S4Gp5xGjrNX3Pptje8kCzASS2CGMgmKM
	h6ij/vErNmzlB9oOkRc3rQ==
X-Received: by 10.237.36.205 with SMTP id u13mr4058937qtc.124.1504127676343;
	Wed, 30 Aug 2017 14:14:36 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id a8sm4521048qtb.93.2017.08.30.14.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:14:35 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-3-f4bug@amsat.org>
	<db19cb55-ab00-d889-521c-836d0f7e6464@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb46e788-e2e9-24b2-365e-b0f55fc5ff56@amsat.org>
Date: Wed, 30 Aug 2017 18:14:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <db19cb55-ab00-d889-521c-836d0f7e6464@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/47] MAINTAINERS: add missing
 ARM entries
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IG05brFCMQ9A

On 07/28/2017 03:55 AM, Thomas Huth wrote:
> On 28.07.2017 07:35, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   MAINTAINERS | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 972118e70b..795f89f709 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -120,6 +120,8 @@ F: include/hw/cpu/a*mpcore.h
>>   F: disas/arm.c
>>   F: disas/arm-a64.cc
>>   F: disas/libvixl/
>> +F: default-configs/arm-softmmu.mak
>> +F: default-configs/aarch64-softmmu.mak
> 
> You've added this to the TCG CPU core section, but strictly speaking
> these files are also used for the machine emulation in general (and also
> for KVM). So not sure whether this is a good fit here ... up to Peter to
> decide.

You are right.

> 
>>   CRIS
>>   M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>> @@ -380,6 +382,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>   L: qemu-arm@nongnu.org
>>   S: Maintained
>>   F: hw/char/pl011.c
>> +F: include/hw/char/pl011.h
>>   F: hw/display/pl110*
>>   F: hw/dma/pl080.c
>>   F: hw/dma/pl330.c
>> @@ -402,14 +405,19 @@ F: hw/intc/arm*
>>   F: hw/intc/gic_internal.h
>>   F: hw/misc/a9scu.c
>>   F: hw/misc/arm11scu.c
>> +F: hw/misc/arm_sysctl.c
> 
> According to a comment in that file, it is about RealView/Versatile
> boards instead, so this is the wrong section here?

Wrong section indeed.

> 
>>   F: hw/timer/a9gtimer*
>>   F: hw/timer/arm_*
>> +F: hw/timer/armv7m_systick.c
> 
> How about rather removing the underscore in the previous wildcard entry?

I also wondered, because I'm a slowly working branch where I try to boot 
some Marvell SoC, and I named the timer "armada_timer.c" following the 
Linux device-tree naming:

https://www.kernel.org/doc/Documentation/devicetree/bindings/timer/marvell%2Carmada-370-xp-timer.txt

But if I ever finish it I can add an exclude entry, so I'll follow your 
advice.

> 
>>   F: include/hw/arm/arm.h
>> +F: include/hw/arm/armv7m*.h
>>   F: include/hw/intc/arm*
>>   F: include/hw/misc/a9scu.h
>>   F: include/hw/misc/arm11scu.h
>>   F: include/hw/timer/a9gtimer.h
>>   F: include/hw/timer/arm_mptimer.h
>> +F: include/hw/timer/armv7m_systick.h
>> +F: tests/test-arm-mptimer.c
>>   
>>   Exynos
>>   M: Igor Mitsyanko <i.mitsyanko@gmail.com>
>>
> 
>   Thomas
> 
