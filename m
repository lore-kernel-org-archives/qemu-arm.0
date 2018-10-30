Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5655703wro;
        Tue, 30 Oct 2018 07:27:36 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cpHHpE7946oaju00S+yYZfs1rOmQBrmePhz6CvcF23jzKWqLSVvDecAiLB1ZNip1qhbO/S
X-Received: by 2002:aed:3882:: with SMTP id k2-v6mr2311330qte.345.1540909656528;
        Tue, 30 Oct 2018 07:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540909656; cv=none;
        d=google.com; s=arc-20160816;
        b=ws1PzctBO5QBbUXODLwlF9XeRbx6/sVRjplOi69FhQVKLhrfi6N43BMecS/VBPuubz
         CHGEmsHhk4YbhRnJy1/xBScwyrH1zAC9uNxnMQQ5mRqPcp1OBkBz5tg1GDegkTluEWAe
         pQ9VCNklQk3Jdn9qzkJnkvSy6vdaoTQCeCZOEG8CYoTX+niksFve/WCvLzMJwdOw3f1s
         D3bTV/uXF0s7h80JwJYM9jh2J6niGz62IP9SISO++k4OyEuAwhHexsBKTyuKLKSCj7QH
         bj9iQXnj+d8xwR4NdIh2mhrhd5rzW/QdxY4j9niBnWXGwK1ci1AVqtQdP3uJeclejxbE
         +oAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=df+HY5WVAeDRq6rtZB9Ft6AaUeVZ6J03o+NwZYQfvoc=;
        b=QiqXqw+bc+ndQTFlqboQnfhycMR4JaHlNvPI/SSc/to4p7D5HPQJmYxvmmrrHYklSD
         JSZHlB9s7hD2ethJfipu9qxR7edrTQHO9UzMqjqVOmzebLXC/MWflaLHIeifsabjXOlZ
         VGpUjBq0Fm0ttlKZuWKFict//2cdF3AekgcV+8/yToADfi8wS9L8CXhWSTBNIIE+IfY/
         72+cCElmUz9LkuTAImsiB0A0vQ6agoIgmBri2hhzVxz+z/m0/zfHYyXk6mCguATjnH6q
         LKtsIW8WKhftdQ3Ilf/P5U/vYwR8biz7IAZXM59BBZuzUW0kzaVWVzHSirnOyyVjbgFl
         7l8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h15si687716qvo.103.2018.10.30.07.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 07:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHUzX-0003gd-Tr
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 10:27:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHUzI-0003ej-FF
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:27:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHUzB-0003TD-MN
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:27:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHUzB-0003SV-EN
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:27:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id h2-v6so8167060wmb.0
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 07:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=df+HY5WVAeDRq6rtZB9Ft6AaUeVZ6J03o+NwZYQfvoc=;
	b=LwgcF/alcqCtuvvBaK7coIARe8+wOh7dTj4EFzotaRQ4LwhZq1S0gvZCE7CaWL2vWg
	AdgbmAKj1HCyjxJOP6Y5V52TEoIwOj48xaMLrrmEQkA9+3T8FszR4jMETWT21dPOHV52
	bLUMTSR2tkqHMHZjMsGWCw4U8WnVPRFGAssUkNm2PiSxNrWpuiuV9tI/sOk6g6xVT7qK
	Sqz9vQKvQ0LmKnykksDqwPIACc9b5mlQW66VUymhk3zwD8QMhNrqTmtlbBqge5Fz3H3a
	inmli5yDZOijtadgnCUVVEvt1Lyp9rNmvpJoZUgdOs3Sg0xNqyejYs6XhsWCOl2esnHl
	aZew==
X-Gm-Message-State: AGRZ1gKs6Y4SGyNHcNYOQhXzJ66LOC4RJTxgLTkRsRLeSLaoaKSNq+pL
	3+Zy0+WeOsgw/y9RIAjVGz9FhA==
X-Received: by 2002:a7b:c0cc:: with SMTP id
	s12-v6mr2100433wmh.39.1540909632393; 
	Tue, 30 Oct 2018 07:27:12 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	l70-v6sm43345252wma.0.2018.10.30.07.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 07:27:11 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181030114048.21527-1-philmd@redhat.com>
	<20181030114048.21527-3-philmd@redhat.com>
	<CAFEAcA-4_fn19H9aCio4QKikdMBv_oicgWNrThCXshNJ3HOnig@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b27c4766-794e-a3dd-7931-6c54e30bd30d@redhat.com>
Date: Tue, 30 Oct 2018 15:27:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-4_fn19H9aCio4QKikdMBv_oicgWNrThCXshNJ3HOnig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm: exynos4: Add dma support for
 smdkc210
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ctPsw8+TkK/d

On 30/10/18 15:06, Peter Maydell wrote:
> On 30 October 2018 at 11:40, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> QEMU already supports pl330. Instantiate it for smdkc210.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> [PMD: Do not set default qdev properties]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   hw/arm/exynos4_boards.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
> 
>>   static void exynos4_boards_init_ram(Exynos4BoardState *s,
>>                                       MemoryRegion *system_mem,
>>                                       unsigned long ram_size)
>> @@ -171,6 +187,14 @@ static void smdkc210_init(MachineState *machine)
>>
>>       lan9215_init(SMDK_LAN9118_BASE_ADDR,
>>               qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]));
>> +
>> +    pl330_init(SMDK_PL330_BASE0_ADDR,
>> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(35, 1)]), 32);
>> +    pl330_init(SMDK_PL330_BASE1_ADDR,
>> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(36, 1)]), 32);
>> +    pl330_init(SMDK_PL330_BASE2_ADDR,
>> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(34, 1)]), 1);
>> +
>>       arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
>>   }
> 
> Are the PL330s really on the board and not part of the SoC? The
> layout of the dts files in the kernel suggests they're in the
> SoC, in which case they would belong in hw/arm/exynos4210.c.

Yes you are right, I missed that :|
