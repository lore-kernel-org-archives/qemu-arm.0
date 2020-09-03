Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp790741lfc;
        Thu, 3 Sep 2020 11:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm4FC+gFcSwygfv+FTVJ7L35/fl0umHVc938klnBfV25sQphMCqZiWG+ChB6OH8eqAyGEm
X-Received: by 2002:a25:ad1b:: with SMTP id y27mr4626064ybi.30.1599159580854;
        Thu, 03 Sep 2020 11:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599159580; cv=none;
        d=google.com; s=arc-20160816;
        b=kunIZnvIHQNdbnX5ydEMxuF28zMGZA8dQWesOKdF9gB49/wNbRCU8NwIkzakCUd3j8
         t/gUYArDRXRySFgdxJFRPUGQCe70dq36LEw3XNc20WXvr6mcFuu8ClidzrJvzm8rUpgx
         fTJSZGoKgRlZjmYbECnJol3AWzgxYAqfMKnjKdhES3WCSG1CGkdRw+tPKERFukcy4PtO
         M0p13Bo7fDGbUOOVpfEt0gLMlrUgEu/7tTjXni6l9Y7wxbeG6YbNm67w+uAA9rrZJMZw
         eY/SGLzmORDdfxZlS/BIB9e101a0Xpy1kcwA/3vA/D4dFQGVj5me9t7VF7bUqE91jJoW
         rCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+0OlYWSUy+XEiYh3AdsnB0drOxFp5cbDPSHkMlxw/2Y=;
        b=qaWOQ3wuAKuJ9WlvxgAe+ba1Ib0idRB6f+1mCX44iAUjq54r2qSK0fbx8qd4+oRkpO
         TNhCQJNl7WONOeLIM+QrWosRWgUj4WvzPNyM+MuXWkSsHTVtV7qdyjSgxcF90Fk3y5+t
         T6Nnwmw15T/aW+WOQXDkMO9c6s5davIUJ8fM+C3AfcooXjePb7AIACOqqog7a3q07cmE
         6BFD4560Ac8a+cUYCSqqJL6dU5x8Hmh2ah5j0zP0485aB2AiUS1r03ybSaG7oZ2hSOKG
         DYs0+soxZB7M2VsLENWrIEkLGVv/0C4QpCZch5pAI5kpIu2eWPbzXMjEPIx8VFNmdd/e
         HbEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O4rADNBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j192si3761620ybj.161.2020.09.03.11.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 11:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O4rADNBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDuSS-0005EC-8m
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 14:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDuS9-0005Dw-TK; Thu, 03 Sep 2020 14:59:21 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDuS7-0006IC-S9; Thu, 03 Sep 2020 14:59:21 -0400
Received: by mail-wm1-x343.google.com with SMTP id a65so3886697wme.5;
 Thu, 03 Sep 2020 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+0OlYWSUy+XEiYh3AdsnB0drOxFp5cbDPSHkMlxw/2Y=;
 b=O4rADNBgsR3mjNhfOXAUx7H+eCNxd2+fBBlgVBVnmPqjcfUT/OORpsZbSHrQ9XWcu2
 1KiID+ViOyk7Vxwqt+Rtiy+OAnUKben8WQxJogJr/eYc3vZO4Snh9rYBpIwsMU7TyFAm
 dFLqNZHTh2dr3DKnGGcTbZlBcuqHdIqX+SejYu9dRvpQUz+/5YpznoPzPRt9PdOUynhE
 zp5exgpnPhwFTz1LasvZRxE4mFregBkT8lrB6XdFh1quRGZjgnqC9zYkMs2TzxKDCVzL
 +FLxA4FzoLOJ2zOypJl8E4VVwlrG4QUYnzi391YLSZdlk/jFC51dRWOzqzUbW4/Q1m62
 D9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+0OlYWSUy+XEiYh3AdsnB0drOxFp5cbDPSHkMlxw/2Y=;
 b=ckQBzmmBp6Z474BM0wiu+nEQliIRzbY3x4Mp/hNEaBqAKWgieNPL2OMcHG6IfxKsZO
 1svBKwD2a2dPJVPti9pgq7fRNGpgtlQ+QxDGcdHhOdtouAj/R2rtD0CCfYjdQj961naU
 4JOdF/CCI7GDb7PZAjTueAwcrVE4dbXyhEnO2xa3pr6nbMQRyzpBnPB4mtcg7xzOaW42
 JKH8ZPwsCzBVPs5LHmKmQUpEvXPFuTb74SNyBcjIzVDmnkYxW6xiKK9OzGslhJ41ccMN
 JkFU28OirkShjJn7aqAU6NEi/SwPQko6DOBWHhq76aVwvosASofiHthIjfCS+OwbKk14
 eSgA==
X-Gm-Message-State: AOAM532wsgJD3g17WyW2VR1+Cd94syTvI9u+1PZZ+DNww6+rbwfcWujh
 1HYwoK7A8gqUYsfo1IvV85s=
X-Received: by 2002:a1c:9a48:: with SMTP id c69mr3770416wme.43.1599159558081; 
 Thu, 03 Sep 2020 11:59:18 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id q4sm5855292wru.65.2020.09.03.11.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 11:59:16 -0700 (PDT)
Subject: Re: [PATCH v8 07/14] hw/arm: Load -bios image as a boot ROM for
 npcm7xx
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20200825001711.1340443-1-hskinnemoen@google.com>
 <20200825001711.1340443-8-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <af0b3d23-41d8-4c46-1156-973d653d8064@amsat.org>
Date: Thu, 3 Sep 2020 20:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825001711.1340443-8-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-2.403,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kfting@nuvoton.com, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +bdK5q9yivD7

On 8/25/20 2:17 AM, Havard Skinnemoen via wrote:
> If a -bios option is specified on the command line, load the image into
> the internal ROM memory region, which contains the first instructions
> run by the CPU after reset.
> 
> If -bios is not specified, the vbootrom included with qemu is loaded by
> default.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 0b9dce2b35..b67e45e913 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -18,12 +18,43 @@
>  
>  #include "hw/arm/npcm7xx.h"
>  #include "hw/core/cpu.h"
> +#include "hw/loader.h"
>  #include "qapi/error.h"
> +#include "qemu-common.h"
>  #include "qemu/units.h"
> +#include "sysemu/sysemu.h"
>  
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
>  
> +static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
> +
> +static void npcm7xx_load_bootrom(MachineState *machine, NPCM7xxState *soc)
> +{
> +    g_autofree char *filename = NULL;
> +    int ret;
> +
> +    if (machine->kernel_filename) {
> +        /* Don't load the bootrom if user requested direct kernel boot. */
> +        return;

Wondering why not load it always if available, and what would
happen if booting from a kernel (without bootrom) and running
"reboot" (via SysRq) in the guest I got:

# echo b > /proc/sysrq-trigger
sysrq: Resetting
CPU0: stopping
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.32-7dc9442-dirty-8978043 #1
Hardware name: NPCM7XX Chip family
Backtrace:
[<b0107c4c>] (dump_backtrace) from [<b010823c>] (show_stack+0x20/0x24)
 r7:00000000 r6:600f0193 r5:00000000 r4:b0b5b1b8
[<b010821c>] (show_stack) from [<b077b230>] (dump_stack+0x94/0xa8)
[<b077b19c>] (dump_stack) from [<b010a20c>] (handle_IPI+0x1f0/0x38c)
 r7:00000000 r6:00000004 r5:b0b5eb64 r4:b0b729e0
[<b010a01c>] (handle_IPI) from [<b0102264>] (gic_handle_irq+0x9c/0xa0)
 r10:10c5387d r9:b0b01ef8 r8:d0803100 r7:d0802100 r6:d080210c r5:b0b37db4
 r4:b0b04504
[<b01021c8>] (gic_handle_irq) from [<b0101a8c>] (__irq_svc+0x6c/0x90)
Exception stack(0xb0b01ef8 to 0xb0b01f40)
1ee0:                                                       00000000
00012f74
1f00: cfbc1774 b01112e0 b0b00000 00000000 b0b03e28 b0b03e6c b0b5e72c
b08e5ea8
1f20: 10c5387d b0b01f54 b0b01f58 b0b01f48 b0104114 b0104118 600f0013
ffffffff
 r9:b0b00000 r8:b0b5e72c r7:b0b01f2c r6:ffffffff r5:600f0013 r4:b0104118
[<b01040d4>] (arch_cpu_idle) from [<b014b240>] (do_idle+0xec/0x140)
[<b014b154>] (do_idle) from [<b014b56c>] (cpu_startup_entry+0x28/0x2c)
 r9:410fc090 r8:0810c000 r7:00000000 r6:b0a53a40 r5:00000001 r4:000000ce
[<b014b544>] (cpu_startup_entry) from [<b0794f6c>] (rest_init+0xb4/0xbc)
[<b0794eb8>] (rest_init) from [<b0a00c50>] (arch_call_rest_init+0x18/0x1c)
 r5:00000001 r4:b0b72754
[<b0a00c38>] (arch_call_rest_init) from [<b0a010f4>]
(start_kernel+0x428/0x458)
[<b0a00ccc>] (start_kernel) from [<00000000>] (0x0)
Reboot failed -- System halted

So not a problem so far...
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But still I'd keep loading the bootrom regardless -kernel.

> +    }
> +
> +    if (!bios_name) {
> +        bios_name = npcm7xx_default_bootrom;
> +    }
> +
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!filename) {
> +        error_report("Could not find ROM image '%s'", bios_name);
> +        exit(1);
> +    }
> +    ret = load_image_mr(filename, &soc->irom);
> +    if (ret < 0) {
> +        error_report("Failed to load ROM image '%s'", filename);
> +        exit(1);
> +    }
> +}
> +
>  static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
>  {
>      memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram);
> @@ -60,6 +91,7 @@ static void npcm750_evb_init(MachineState *machine)
>      npcm7xx_connect_dram(soc, machine->ram);
>      qdev_realize(DEVICE(soc), NULL, &error_fatal);
>  
> +    npcm7xx_load_bootrom(machine, soc);
>      npcm7xx_load_kernel(machine, soc);
>  }
>  
> @@ -71,6 +103,7 @@ static void quanta_gsj_init(MachineState *machine)
>      npcm7xx_connect_dram(soc, machine->ram);
>      qdev_realize(DEVICE(soc), NULL, &error_fatal);
>  
> +    npcm7xx_load_bootrom(machine, soc);
>      npcm7xx_load_kernel(machine, soc);
>  }
>  
> 
