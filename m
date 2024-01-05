Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794522ejo;
        Fri, 5 Jan 2024 07:49:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXWGWowHtqknoMXGxpJjNRQhI5uoDctNN3iKwLfD5qvpojIjTXX990fA67Ej0uUJTbcGkI
X-Received: by 2002:a05:6358:7e4c:b0:175:7921:a682 with SMTP id p12-20020a0563587e4c00b001757921a682mr271810rwm.14.1704469742174;
        Fri, 05 Jan 2024 07:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469742; cv=none;
        d=google.com; s=arc-20160816;
        b=QxtXrfTipDyrEX8gBxljduRu+qDfVreFcUbroixlu1OMOX9Yl3JfAFpUm/xDB2HSVX
         4uvMau3wZDwLYwfS2jA8lSsqJyPxIZF5dlyETGbR3iRlWqzzAn7F+iEHAfzQ02nvv16q
         duuycX+NCZjuwZ8XnOO0Vj4CXOC2m/b2c+UKgeMyVwNvvGb+r754UVy0miD3Nun5XrqK
         a8HqL9C/EPPduV98roaHeUB2Ss9GjYS7dxc6c+L64AeOGD38qPJ6i+3925aJe8na8pk1
         FvCoWay+fzFza3Ar18/aW6XD5bY2llo+zY4/Ab5YXuZ8TjivlkYM0G8CPhAZzCLQ+c8c
         q3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+mHMa1tnUIKC/Lz8fv92EG3G72QPfm2OOOA3/xxqo/c=;
        fh=DAPvSgCUhAarA6fZ2xgq43lJ/6n+8M24aoksosCsGI8=;
        b=Ym4gfunFEgp3kbJ3Ly2NXFhvqyScxVOTj1qZBcH0StyREuBbCp9OmvRGn/5vjTBWww
         BSwinbHF3HbTYtRWxpsMiIG3aQp474DuNftOzKAmgrApeIRs0hlHuP8Qi4ApWHDmMO2O
         SIkmLo61IC1I63Fg5kzNiXv7ay+sDSDRDbQ/UGAOH8tDNrfDHN8UjbyYsJ4ydQ0X+vdY
         sEeFXTqQP29yzaQulBYgx/MoxTZeK0AeoY0zgk7JIwdV0sxkeEr+S69SoOSWLdxmQio0
         Sop+dVk3fX77+nXou/UBlMDR59ss56Y4yxkPFm82/dVa8Pj0olsF7koUd2I5DprOfv4Y
         BF3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOwq83hE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020ac87fd4000000b004297cd121afsi576337qtk.350.2024.01.05.07.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:49:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EOwq83hE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmQC-0007Dg-Qy; Fri, 05 Jan 2024 10:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPM-0004Gs-W9
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:46:54 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmP7-0003ty-EX
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:46:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e384404e7so8453145e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469583; x=1705074383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mHMa1tnUIKC/Lz8fv92EG3G72QPfm2OOOA3/xxqo/c=;
 b=EOwq83hELeFzXU3fhCBRM97RIkwnmLILDORrxh2bmW24QwPbULqfd7wsz4Es911bwh
 HdII4/a4ZCwGC9VW56p7W5feklrHxYBna9uTCe341/xVNowZ3avbynacCH77WfUYR60Q
 ZaCY7UxQ0WGLEy21tWmX2eT5T4Bt9zYXj6+laWTuPUCNhZltkj+yMEISf/d/v34VhwmL
 jrjUG82zcNtDpGldhTm23oAuh7i7AeYLKoliImOelsmRmqE5Z16AFCj38dkmVkW0cMrS
 09eE1C8LkROMEyAI9rH2h+M0wvhTU1MsRRi/MgI1y9Vc2S8tCnYcpDib6p846AWgd+84
 B3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469583; x=1705074383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mHMa1tnUIKC/Lz8fv92EG3G72QPfm2OOOA3/xxqo/c=;
 b=ZCbsg+ndCigijr6MuBpEbUPXbvjrHzmJdfWmW/s4V0gVkVrahZUvtXT1IbWeShMgJU
 ZkIkHFXXkUH8LjtR8kQkL58K2iOxCpwPCuRPuQdmumQzThb9bgKMd2wQQuROtZPTebdj
 5S6Qo1xN6DYkWLeNcv565IJP0lDBJwxyObsKlQK/wT9vkLdZm2goMZZ6P6KkcxtbNsT8
 RAVYubP7LIkvTvvA8xCsXuVo2Z/qyfletLEc0G0icTWPVoFZkAAUS40nqsO77E6wVSxb
 jY8ZQ5j0FWnBzkPIq6QH3HsThwHXHjw1QfNzVy/DtNU0CxO7HYduc3a60nm0+An8nMcs
 6dTQ==
X-Gm-Message-State: AOJu0YzuggUz85FwnWy9I5yu3fOnl/FXNSdckKTIRVKkzZhEZVQuCfAZ
 h5xKkEWNvx916Zg3jyaLpo468tuwmiFQUUUfxPfVzEajhGo=
X-Received: by 2002:a05:600c:a45:b0:40e:3511:2c39 with SMTP id
 c5-20020a05600c0a4500b0040e35112c39mr1355661wmq.172.1704469583308; 
 Fri, 05 Jan 2024 07:46:23 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b0040d802a7619sm1924026wmo.38.2024.01.05.07.46.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 29/71] hw/arm/virt: Check CPU type in machine_run_board_init()
Date: Fri,  5 Jan 2024 16:42:22 +0100
Message-ID: <20240105154307.21385-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: s6jNxagPvJZZ

From: Gavin Shan <gshan@redhat.com>

Set mc->valid_cpu_types so that the user specified CPU type can be
validated in machine_run_board_init(). We needn't to do the check
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231204004726.483558-7-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 62 +++++++++++++++++++--------------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8b060ef1d9..2793121cb4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,40 +204,6 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
-static const char *valid_cpus[] = {
-#ifdef CONFIG_TCG
-    ARM_CPU_TYPE_NAME("cortex-a7"),
-    ARM_CPU_TYPE_NAME("cortex-a15"),
-    ARM_CPU_TYPE_NAME("cortex-a35"),
-    ARM_CPU_TYPE_NAME("cortex-a55"),
-    ARM_CPU_TYPE_NAME("cortex-a72"),
-    ARM_CPU_TYPE_NAME("cortex-a76"),
-    ARM_CPU_TYPE_NAME("cortex-a710"),
-    ARM_CPU_TYPE_NAME("a64fx"),
-    ARM_CPU_TYPE_NAME("neoverse-n1"),
-    ARM_CPU_TYPE_NAME("neoverse-v1"),
-    ARM_CPU_TYPE_NAME("neoverse-n2"),
-#endif
-    ARM_CPU_TYPE_NAME("cortex-a53"),
-    ARM_CPU_TYPE_NAME("cortex-a57"),
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    ARM_CPU_TYPE_NAME("host"),
-#endif
-    ARM_CPU_TYPE_NAME("max"),
-};
-
-static bool cpu_type_valid(const char *cpu)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
-        if (strcmp(cpu, valid_cpus[i]) == 0) {
-            return true;
-        }
-    }
-    return false;
-}
-
 static void create_randomness(MachineState *ms, const char *node)
 {
     struct {
@@ -2042,11 +2008,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -2940,6 +2901,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+#ifdef CONFIG_TCG
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        ARM_CPU_TYPE_NAME("cortex-a35"),
+        ARM_CPU_TYPE_NAME("cortex-a55"),
+        ARM_CPU_TYPE_NAME("cortex-a72"),
+        ARM_CPU_TYPE_NAME("cortex-a76"),
+        ARM_CPU_TYPE_NAME("cortex-a710"),
+        ARM_CPU_TYPE_NAME("a64fx"),
+        ARM_CPU_TYPE_NAME("neoverse-n1"),
+        ARM_CPU_TYPE_NAME("neoverse-v1"),
+        ARM_CPU_TYPE_NAME("neoverse-n2"),
+#endif
+        ARM_CPU_TYPE_NAME("cortex-a53"),
+        ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+        ARM_CPU_TYPE_NAME("host"),
+#endif
+        ARM_CPU_TYPE_NAME("max"),
+        NULL
+    };
 
     mc->init = machvirt_init;
     /* Start with max_cpus set to 512, which is the maximum supported by KVM.
@@ -2966,6 +2949,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
 #endif
+    mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.41.0

