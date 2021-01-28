Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp426650lfo;
        Thu, 28 Jan 2021 09:46:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyueNe5ZIU921FNJmp24Njp/QAAAMy5EN9lTZBcv7iDKohTOp+qEUuFxLkChiAgHrSi64oI
X-Received: by 2002:a17:906:490d:: with SMTP id b13mr513107ejq.307.1611856014379;
        Thu, 28 Jan 2021 09:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611856014; cv=none;
        d=google.com; s=arc-20160816;
        b=gXBXy9+KSOvzvXmDUDKSr/KqsWyHFTosRaoho79smLoTKVhoq4d1uahaMFk9ca2/3n
         c3L+2IUWvkNp1kW9HxWeYkbjiezwaynu9c/gM8jK9Op9H+DxlpeJ0etJa7twck0yOYsc
         H7gqbF8jRkRfru/uMvpE3JC4CUD6ZxUodWTxXvypfZkzYU4au2SrDL3fhoyoJw1DeU40
         b+XezHsVMaofe6Bqb/q4EQ+hTPP8PwPAtR1D9eW2RZl7R+GqtKt3rVKKsYnO4CZu18Ik
         e3zdYQLIsDif6950wAOtit/8fohOGJfQI1oVdUSmyhVEmcg2i4jpkudrOxKGKrQ/eCL+
         LLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=isSAFS+v7sExV3N+0nlUCmMIaibmFR/wXYLd+oxw3CQ=;
        b=FyZCiFR4DUtghv1sGpbRrSbo1hGmDvALgHBatMtZ7hEVg8fft3I+giVKxRbd03tzGg
         oveYpNmO7vgEiF9H6P5J7gank3Jc8Uyhlt3K1vh95C0oTrEltp9z77GyqY0WRClDWGYD
         R+hPMvrHNT2IJ0Os4vX0N7yQn9gkrI1qMvev6Vy0jusVtur2xIWru01RAHrq/rPeI56+
         +jh5f5AxiVVZh4gkX4FKCv6Qb/fX7JTofytmd9GnoW1ecxh7HihDUkui4krkR5mwD8Ko
         di3V6DC1Shx57Xw87ue9cbSbGpzJxeZ9r6R+GZuUDNSvgTgm2PuEI1VP3yl60auPl8Xo
         PFvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AEtM8F5R;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id z22si3178699ejr.655.2021.01.28.09.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2021 09:46:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AEtM8F5R;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611856013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isSAFS+v7sExV3N+0nlUCmMIaibmFR/wXYLd+oxw3CQ=;
	b=AEtM8F5RAMiPgcPsn+ugfV9HoIjj5rUHufeGO16J6pqdjzV8C/OATQK9Ln0W/8Oj/rsrav
	0a0Lg0Tr+mJnVYWNU5MiDjh37dzuZmce5tDwFKv1XKBq/6Nh5XvLz/UaU4m77dGA1XqKMM
	gbU9R56wXF4N4d7vInaFws1kPG/AXDQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-5nojHRMXOdCp4bwFK1arZA-1; Thu, 28 Jan 2021 12:46:37 -0500
X-MC-Unique: 5nojHRMXOdCp4bwFK1arZA-1
Received: by mail-wr1-f70.google.com with SMTP id z9so3497280wro.11
        for <alex.bennee@linaro.org>; Thu, 28 Jan 2021 09:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=isSAFS+v7sExV3N+0nlUCmMIaibmFR/wXYLd+oxw3CQ=;
        b=XaW67gFK+Q05Bqr05NJvHr6rjvtyL3n74OGBudJFhko5HzmC5mWS2m5Jr8XXa0f1Ep
         +chOGpy0TEHTG3E2C0OCgXpWKifeY0emMMD1RBrA2YOzNnmEnt0dV+uQAykh8bIUbBjY
         ulNg8gBzSteSUbInfdy/vGfrPlpHBbzbkGYG71LMHEV0oBcADrYpYsfKmFTij6QOqHX9
         9T7nNyh4CVKGObpAfgkghYjnxQHFiZNdEgkMNz4R5gKlyHLLuaDxax4et4aCx4NdVan6
         zEPTA/MlkaAaCytrNl2tjLwnrQF778JXYt26ham2dPMlvy4I7/NMsL/ttOfazsa5pvge
         CdDw==
X-Gm-Message-State: AOAM5307pH0BUpeoJyaIUlHmy2Uqxcw/IDmPF4jtzgoEU4DOm+pTl98l
	L9roLmRFOiUqV7l2ChL736ZwSn9lEgoKqrTX7wI4KSXRu2agyHytqJhTRTXp/4SoGT8mvHUuFDu
	ebemwma+CP2L11uPx
X-Received: by 2002:a5d:4e4c:: with SMTP id r12mr239851wrt.354.1611855996446;
        Thu, 28 Jan 2021 09:46:36 -0800 (PST)
X-Received: by 2002:a5d:4e4c:: with SMTP id r12mr239826wrt.354.1611855996278;
        Thu, 28 Jan 2021 09:46:36 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id b11sm7838650wrp.60.2021.01.28.09.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 09:46:35 -0800 (PST)
Subject: Re: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
To: Alexander Bulekov <alxndr@bu.edu>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210128161417.3726358-1-philmd@redhat.com>
 <20210128171811.jlnevikw4wgywjks@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <82de6c97-d13b-01b9-e9ad-3b20f00adc5e@redhat.com>
Date: Thu, 28 Jan 2021 18:46:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128171811.jlnevikw4wgywjks@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: SKqHWCuOg2B7

On 1/28/21 6:18 PM, Alexander Bulekov wrote:
> On 210128 1714, Philippe Mathieu-Daudé wrote:
>> Alexander reported an issue in gic_get_current_cpu() using the
>> fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
>> doing:
>>
>>   $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=qtest -qtest stdio
>>   [I 1611849440.651452] OPENED
>>   [R +0.242498] readb 0xf03ff000
>>   hw/intc/arm_gic.c:63:29: runtime error: member access within null pointer of type 'CPUState' (aka 'struct CPUState')
>>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic.c:63:29 in
>>   AddressSanitizer:DEADLYSIGNAL
>>   =================================================================
>>   ==3719691==ERROR: AddressSanitizer: SEGV on unknown address 0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
>>   ==3719691==The signal is caused by a READ memory access.
>>       #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
>>       #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
>>       #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
>>       #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu/memory.c:464:9
>>       #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552:18
>>       #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:1426:16
>>       #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1449:9
>>       #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:23
>>       #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
>>       #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875:18
>>       #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489:18
>>       #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
>>       #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
>>       #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5
>>
>> current_cpu is NULL because QTest accelerator does not use CPU.
>>
>> Fix by skipping the check and returning the first CPU index when
>> QTest accelerator is used, similarly to commit c781a2cc423
>> ("hw/i386/vmport: Allow QTest use without crashing").
>>
>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> 
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> For reference, some older threads about similar issues in the GDB stub
> and monitor:
> https://bugs.launchpad.net/qemu/+bug/1602247

This one is different. I thought this issue was fixed by
the series around commit 7cf48f6752e ("gdbstub: add multiprocess
support to (f|s)ThreadInfo and ThreadExtraInfo").

When using physical addresses with gdbstub, we should be able to
select a particular address space.

Maybe this fixes pmemsave accessing MMIO here:
https://bugs.launchpad.net/qemu/+bug/1751674

> https://bugs.launchpad.net/qemu/+bug/1878645
> https://patchew.org/QEMU/20200701182100.26930-1-philmd@redhat.com/

I'm still procrastinating this thread :>

> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/intc/arm_gic.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index af41e2fb448..c33b1c8c4bc 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -28,6 +28,7 @@
>>  #include "qemu/module.h"
>>  #include "trace.h"
>>  #include "sysemu/kvm.h"
>> +#include "sysemu/qtest.h"
>>  
>>  /* #define DEBUG_GIC */
>>  
>> @@ -57,7 +58,7 @@ static const uint8_t gic_id_gicv2[] = {
>>  
>>  static inline int gic_get_current_cpu(GICState *s)
>>  {
>> -    if (s->num_cpu > 1) {
>> +    if (!qtest_enabled() && s->num_cpu > 1) {
>>          return current_cpu->cpu_index;
>>      }
>>      return 0;
>> -- 
>> 2.26.2
>>
>>
> 
