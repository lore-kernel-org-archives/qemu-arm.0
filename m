Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794238ejo;
        Fri, 5 Jan 2024 07:48:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPJAGC/2JwyeKKSTX2DSdieQFaM7Q6WuJjJzbIvgrdMHOQ6R2N73NM7j5ajdAr6Qm63VUM
X-Received: by 2002:a05:620a:47d2:b0:781:df48:3d7d with SMTP id du18-20020a05620a47d200b00781df483d7dmr2249404qkb.9.1704469711278;
        Fri, 05 Jan 2024 07:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469711; cv=none;
        d=google.com; s=arc-20160816;
        b=t/Myxm54xD1BXBAushaITyM/EAE+a9GCyUA6YuhoOzODqBEiXLIdRE6l2tzw3cWYJP
         FRhdc+AlbNJ4AhthUKEu60SQ84GKB1jqyJhv/AwwVpc8d3GSavFra8iafEerMpUSXP8w
         zH0oZGVq7ixMA+pYNiKTe5qOw9D2SC1SQV2YwfEGScV3vGRpJ3gIXIPNyuAqfiFlVxmy
         m9PjOFKptDpm7kp9aTzereLRgNAJ2pG7N6vSZIIv+AgZaxx6EcbU1D1GxO/pzjoYL1vc
         3pbnVnrBFSPRKHE08t/YXO6IR5fMjAqHTVvjNeW+hO5M9HdQ4Woy6dDSUf3UjZ/0mVm2
         o5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H4P3qee4jFL51Nbb/746jQf4mN+fePYfOB7VeiIaJ9s=;
        fh=5Ta8+zkVYsUaAj/mRnVEpKYttBANBvhDfDKAxLPIHLM=;
        b=JIy6wLeHgY+aL88ixNJJIjmwTEfL2fhHn4sDiTIByNfigfdk1TMUrEpPpmM5VoalA2
         MT/e4GJcOK72ZVoR3A4lZvDUxSosqMhohQpD/P2LdY40+Pl7DXA8nvfT1RlsjsDm3oMg
         aXz1ixz/mfZjtD4/UsBhx+NvUWIIhV2xXiPBP+FNuzjnbE8dJy0QPTW8SHqRLfKrlx/M
         x8LpteS0YJHlWxcGVKhmKISVGbmNURtV+aaE6haSVseyARjlgAq+s4k6GfF+p6aLD3iw
         zqSA6TXb425jta+S6GtNdNJUGWHd/6TjNyJ68ffe3PzB3VOJHm9OKReFY+h0re9ED3fn
         bgoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kkwah4b1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a404900b007830d587161si628746qko.593.2024.01.05.07.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:48:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kkwah4b1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmQS-0008R5-HC; Fri, 05 Jan 2024 10:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPQ-0004Ku-T2
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:58 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPJ-0003y4-76
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:55 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33748c4f33dso1401696f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469608; x=1705074408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4P3qee4jFL51Nbb/746jQf4mN+fePYfOB7VeiIaJ9s=;
 b=Kkwah4b1tougeMRIpTCAQAwZ9p+kwT5uP9F0d1TekDZxKNFruCjHlyyMhiRX/Eaq5Y
 620c6kZHtKSeyiKEdKRLGJpUM+wRdzTLIY1sAWXrDEbW9OnKXBKyPrVdxXOGm5aIiCEV
 EThdXcWqHbRbHXDHBIXJ/REptiyqGo5hX5F+fFLoCxiIC6puZ/cTTiP9sdNeBeuBGtWe
 EYROdmlU8GkXnBy1y0PhRsD9TiIIMQsRoqLeqGFXFc/x8sYh/Aew/MXHLuAi8H7WhNwz
 gRT3HYkCGkE3vheDOhyo7w8g+XACjxGXEIa0DMGezH5n5CPlcoVZQGPTX6CNyAzXrRGe
 wZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469608; x=1705074408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4P3qee4jFL51Nbb/746jQf4mN+fePYfOB7VeiIaJ9s=;
 b=H821kkFsY3NvIfhVMOkxXhpKK4y0z6y3LoC887+4RuD/yRWg67w/7cN8OcT93pcHJz
 knLR1Q9Hqjhc9bGzdrsLMYGlZpfKhOn2NerYSSVhPee4yumLcXOElbxFkLPx7+76aJnD
 hco5aJVM4MVlnfkWTLYwEH6AvV8Y43PuFV5OWg4B9uYzya/7+dy97JaL26eGyFvj0gKa
 4RP9+ImtqMLlBOuaEc4CR5a7Uo5KqlF16EDtYy3H6JYaGoCjDTmMXE5A0GxPfsl2ZPdC
 xPc2/U5GexquCpvrgZbz54+k6FoJvUEpSsO+0Uv83z4blHgqxuXQOz2nHHkiFHKLlwIk
 Pibw==
X-Gm-Message-State: AOJu0Yxv65fCKhe31/wOlvkngyUfepsQs6jXahjb0KYmii/9rYr984fe
 KxFNvRc3RaBdIt82YX53eoQ/EBsuN63oGA==
X-Received: by 2002:a05:6000:1972:b0:337:4221:5525 with SMTP id
 da18-20020a056000197200b0033742215525mr1273664wrb.46.1704469607760; 
 Fri, 05 Jan 2024 07:46:47 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 d18-20020adff2d2000000b003374d8306cesm1606073wrp.86.2024.01.05.07.46.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Vijai Kumar K <vijai@behindbytes.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 32/71] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Date: Fri,  5 Jan 2024 16:42:25 +0100
Message-ID: <20240105154307.21385-33-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t8d/psxwSXrY

From: Gavin Shan <gshan@redhat.com>

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231204004726.483558-10-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/shakti_c.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 12ea74b032..3888034c2b 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -28,7 +28,6 @@
 #include "exec/address-spaces.h"
 #include "hw/riscv/boot.h"
 
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -47,12 +46,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
     ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
     MemoryRegion *system_memory = get_system_memory();
 
-    /* Allow only Shakti C CPU for this platform */
-    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
-        error_report("This board can only be used with Shakti C CPU");
-        exit(1);
-    }
-
     /* Initialize SoC */
     object_initialize_child(OBJECT(mstate), "soc", &sms->soc,
                             TYPE_RISCV_SHAKTI_SOC);
@@ -82,9 +75,15 @@ static void shakti_c_machine_instance_init(Object *obj)
 static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(klass);
+    static const char * const valid_cpu_types[] = {
+        RISCV_CPU_TYPE_NAME("shakti-c"),
+        NULL
+    };
+
     mc->desc = "RISC-V Board compatible with Shakti SDK";
     mc->init = shakti_c_machine_state_init;
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "riscv.shakti.c.ram";
 }
 
-- 
2.41.0

