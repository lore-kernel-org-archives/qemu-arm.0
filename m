Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FA4CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 21:00:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCOtn-0007mf-0V; Fri, 24 Oct 2025 17:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCOta-0007kj-Dz
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 17:00:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCOtW-0005gA-Jk
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 17:00:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso18542265e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 14:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761339616; x=1761944416; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XcIxaQ67a8jVVOfKmnTa9SFKmogMi3dQET10JvoF3/M=;
 b=EUgdgC1JhQPN4MuiS8vlrk6dQFtAsXhUUPqda+3cdIjk17t12R5f2Br8i8ZXnqqei+
 gMqfveGwFOH8xRvtOG089QCGQ/Uay37/5g10mgVTKBCmoH1bQKHmZr2OCGoo8/H5lfr2
 fkLIsF3xUygb08hg02Q8nz+MKiL4CyXjQi8JKQQYR/mUVDMpUkdIbsgZHKERTT4t8x8H
 mVLE9UlC14UmpM2QkYnv8bukeV4q5YtRH0ZFgWi34kUBuX0OjREC8gSEEcMnseu8K+PB
 tkY1CNl/xjPMGOikRRQcCgTQGf8AeSctYJ0kJ0mpUeXrqeU/YoLTerLNrfyJIoPoHl2Y
 a1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761339616; x=1761944416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XcIxaQ67a8jVVOfKmnTa9SFKmogMi3dQET10JvoF3/M=;
 b=rsrlGdADhKBWP2qKIFsiP3/bb1nPcfhe+mxoJO3v8gz4uX7MmAqDewJM6/h0VnDVgA
 qIJ1a8jF/5GsZi6V3jm2les/by2Klhigfw+/VKn3m2UAEwMderwX9ceGjrPTJ+7Z+lfX
 b7GSWOQHfej02B9Ou940aoW1oVkTRjBYB2v88Few9gI0MPwY9q7yTOxG06f17SCg7kdb
 kMXgRo/WSv+V7Q1IOAhYbjs11CXJsmG65b+cKy7D8awHhRT0X8VdnCoNrphxIbVGshhm
 O0RNkKBHe/Q95hg52tFNSYVLaq5k8cwEgWag53dU2UcR5QySyQ6f3AiQtcrkolzw094l
 Puog==
X-Gm-Message-State: AOJu0YywTRhpIs9m6C4NXbhzKJ+dNsk49Wrpt7hotchA3Auyj5TheJVu
 rUT5qe3jlwwtmG1xMNxrAcgDFfNSYYL+zgUBARHwWLScyQYr4LZZ1rOGYyHClp8xZ1E=
X-Gm-Gg: ASbGncv0xbYSruM8m04+ZbS4wGsltglHw0foUWDpT3nm9r1giXRf9QwR+zuFi+y2GDw
 aGjWrlEZf18KARcSlF2DorIurYVDzr5J5pbdNZQnR5sxsmIsl1W9WCPDgEL+nR4oz6tmj3usjY6
 ygvZ8unZ0PyoeHmIoZRJIWPkg8LeCNN81autzW5vaHVSBuSg7Bt5D+HyC/yFvQXQawA5semhg25
 XzvgXHKDIoullQI0JZDhcpXeI2PNpnECQOpeLKmu0mmOmtxElMt3K9W2tsldKqTer7I8AbuVH6Z
 fPjyraU3DQ8d4FSLx3ytthzPQUZ3Y4BUoCH0zchXQ7RnEbm7DQu/ojc1pgWaUWHRPspX32S7x+i
 jD1qqcM7/l/UUnL7sn2sHJgDI7qYl1xt8TdT2Q+xDSkF1L3JOrgRFc+378IAGyeP8W7ef30cCAI
 3l+xwnfpdNuyyh/lX6yDm6aEtRXtDc27CguIE67keIsA9sPcYtWrsEog==
X-Google-Smtp-Source: AGHT+IH3C5fpFaNOpwEIrGKdP2Ewlswyv/5J1kKxz9xjLgB9bCb5iiYTPpa8ND6AlvQNTLgxF4fyFQ==
X-Received: by 2002:a05:600c:3495:b0:46d:1a9b:6d35 with SMTP id
 5b1f17b1804b1-475d242c75cmr35087015e9.14.1761339616380; 
 Fri, 24 Oct 2025 14:00:16 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd374e41sm1195045e9.12.2025.10.24.14.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 14:00:15 -0700 (PDT)
Message-ID: <7f0180ec-c08e-48dd-8b46-fc70ffbbe49f@linaro.org>
Date: Fri, 24 Oct 2025 23:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/27] hw/sysbus: Use memory_region_name()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20251024190416.8803-1-philmd@linaro.org>
 <20251024190416.8803-4-philmd@linaro.org>
 <1201fe45-f822-4e1e-8cd7-84b23eaa2bd0@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1201fe45-f822-4e1e-8cd7-84b23eaa2bd0@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 24/10/25 21:40, Mark Cave-Ayland wrote:
> On 24/10/2025 20:03, Philippe Mathieu-Daudé wrote:
> 
>> MemoryRegion::name is kind of internal. Use the proper
>> memory_region_name() accessor, which might return a different
>> name.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/core/sysbus.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
>> index ae447c1196a..d33be6b2b52 100644
>> --- a/hw/core/sysbus.c
>> +++ b/hw/core/sysbus.c
>> @@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, 
>> hwaddr addr)
>>   int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr 
>> addr)
>>   {
>>       for (int i = 0; i < dev->num_mmio; i++) {
>> -        if (!strcmp(dev->mmio[i].memory->name, name)) {
>> +        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
>>               sysbus_mmio_map(dev, i, addr);
>>               return i;
>>           }
> 
> Interesting. I'm mildly curious as to if you discovered anything that 
> broke with this change (even though I agree it is correct)?

I'm working on having qdev to absorb sysbus features (MMIO, PIO
and IRQ links); what is left is the qom parenting on the main
sysbus, only used during legacy reset; I hope to convert the
remaining as a cripple reset tree.

