Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp405598lfo;
        Thu, 28 Jan 2021 09:19:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw21j/4haSpDWYZThAIxuOS/tamJ98hbLK9aaldFYkHcLT96+ZgX+yOPHJq5NUUkycrx1MD
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr225687ybc.41.1611854371119;
        Thu, 28 Jan 2021 09:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611854371; cv=none;
        d=google.com; s=arc-20160816;
        b=MTUzfBee0Hf2yTdvd+TxGjEE8sWq4sT+0oABLBjdlHNnSyNhftQft5THqHTYfcAn54
         T7AlhoTtFVxDyEBBAZbSTsUaUkSGVVkMBBuM8hGN9UFeppbkW4il9WRMoLD6vM5VYm5W
         /Z2/WCUXHtQOB8+WBzyvLfYvuIbqt4/cPcSqSgkP0EzbIwUtLOZdRqG2BgG3hiASqC3i
         X5sM5+4rGu+BVMnJwDlz6da6O/g568BmA+/AirUP+gt9WytkjJnFFID08PDLcQb5+oDZ
         FNvv8P5Caf6u6c7/DgVKI38nV1WCn7rh3JT9tTzq3/IWUfSptvo5c+EcrC34QItz30HC
         Iirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=gn/vnZtRY3hswpOEkG5FTVwL9r0KzFeXJPC85EOiiMM=;
        b=ng+Ru7/J3b2zHcriMLXUXRMvwZS830ojBofiJ37Y1YSUyon4ui6wk6FukqqxRqUQqW
         XLU3oB85a3rH8zzdpgOFqzbumCA51zPm6fX6ryLaDKY1UksMGyzZKk6kVowdDJ1FkFog
         smIzWRBxpjM1GffUpHN3lSYlm1Edo5n0zYqURjwFc499M9taz1R5l4Hm5kWouJrAiHn6
         4rc/EF2WXQ2DDpwUaubemg45u+aq5zjFL/CwIkK7zEjX31j0TTDwHatcszDlSUSLVr4M
         qfYXo8T3iTBU1FJe090uUVgpbR467gcQyf2RGcu05OBpdLKWLPyTJYPwJoLb6TuksDDP
         p1FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8si6066810ybg.196.2021.01.28.09.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 09:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Ax8-00045Y-Do
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 12:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l5Aws-00041Z-9H; Thu, 28 Jan 2021 12:19:15 -0500
Received: from relay68.bu.edu ([128.197.228.73]:52652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l5Awq-00084y-7K; Thu, 28 Jan 2021 12:19:13 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10SHIBY0030640
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Jan 2021 12:18:14 -0500
Date: Thu, 28 Jan 2021 12:18:11 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
Message-ID: <20210128171811.jlnevikw4wgywjks@mozz.bu.edu>
References: <20210128161417.3726358-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128161417.3726358-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z2j2J/mj0TMU

On 210128 1714, Philippe Mathieu-Daudé wrote:
> Alexander reported an issue in gic_get_current_cpu() using the
> fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
> doing:
> 
>   $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=qtest -qtest stdio
>   [I 1611849440.651452] OPENED
>   [R +0.242498] readb 0xf03ff000
>   hw/intc/arm_gic.c:63:29: runtime error: member access within null pointer of type 'CPUState' (aka 'struct CPUState')
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic.c:63:29 in
>   AddressSanitizer:DEADLYSIGNAL
>   =================================================================
>   ==3719691==ERROR: AddressSanitizer: SEGV on unknown address 0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
>   ==3719691==The signal is caused by a READ memory access.
>       #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
>       #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
>       #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
>       #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu/memory.c:464:9
>       #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552:18
>       #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:1426:16
>       #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1449:9
>       #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:23
>       #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
>       #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875:18
>       #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489:18
>       #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
>       #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
>       #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5
> 
> current_cpu is NULL because QTest accelerator does not use CPU.
> 
> Fix by skipping the check and returning the first CPU index when
> QTest accelerator is used, similarly to commit c781a2cc423
> ("hw/i386/vmport: Allow QTest use without crashing").
> 
> Reported-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

For reference, some older threads about similar issues in the GDB stub
and monitor:
https://bugs.launchpad.net/qemu/+bug/1602247
https://patchew.org/QEMU/20200701182100.26930-1-philmd@redhat.com/
https://bugs.launchpad.net/qemu/+bug/1878645


> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/intc/arm_gic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index af41e2fb448..c33b1c8c4bc 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -28,6 +28,7 @@
>  #include "qemu/module.h"
>  #include "trace.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/qtest.h"
>  
>  /* #define DEBUG_GIC */
>  
> @@ -57,7 +58,7 @@ static const uint8_t gic_id_gicv2[] = {
>  
>  static inline int gic_get_current_cpu(GICState *s)
>  {
> -    if (s->num_cpu > 1) {
> +    if (!qtest_enabled() && s->num_cpu > 1) {
>          return current_cpu->cpu_index;
>      }
>      return 0;
> -- 
> 2.26.2
> 
> 
