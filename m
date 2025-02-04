Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp465049njb;
        Tue, 4 Feb 2025 12:12:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8fbWpmAOfFX0tPztGyZe+9Bz4iUmvGwsK/0kHMoPYZqt4I+nIHPuzLp6CTYufh55BUfk4kQmTOpd+nA==@linaro.org
X-Google-Smtp-Source: AGHT+IGzPWw4h8+Kpr4zz0OSbfCB7An6R4YjcD+GShyP0+KkmT+ejUNAjVUDh92UvLiJDut7mjPP
X-Received: by 2002:a05:620a:26a0:b0:7b6:6b88:cc00 with SMTP id af79cd13be357-7c039f980a3mr14895585a.5.1738699932961;
        Tue, 04 Feb 2025 12:12:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738699932; cv=none;
        d=google.com; s=arc-20240605;
        b=V3KtJdHFvCTM0NQLodN6hWpL5nnt4/sMO/ASCNbIqX1MN60RIR2hjXAgLxy2uNnE9f
         iSPlrrR1gT+TCGuK+vqetRmhcMVuOhbjFG3txxsZ5uBhT1UpaxEK6e3sU0lqxKh1/DOM
         YcJuYxRTi5pn2aNoVYS2o9q9Qn84P4LeprfNI4XbcD52foiCHr+r6yy/0GgspuIvB4iq
         2ht3P1yNIIz/gJi23186GuPw47Rnz+qaUvyyQwhuWDua2UrDxWyj9g5GjoYiMmRGSqAu
         DNVSjjOVf6LkQb7pc4iLtfNsO0OTZTAFSi/gCDotVWs4wbti/cSy5NmaOnYuA86GuePC
         DYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PhmA/maE+T+RrjSr6dpY30qil8BVZDc6N3XpaacESEk=;
        fh=MIRbudH41Un4YFW6NixOpRsaPhvTWB9E1+aH1Rbw9sY=;
        b=R/vd7lA8jN5u7VJBiHDCnkrGcSb+evxCi6ziW/zBVLTwId7Sf7XUODNs8diptd5Otr
         5FAS37gs9gGXAZd/5NjMItstaCxv7HQz3zNOvXObN9mnKWMFTaFI2tLBZ/RMoMMhHw4S
         LwIOD8ha3X+u1Ue5TD0yLjE+IDyxAnWzXgxQNDhHCWrgWd+9l9dfj7CECkA2FEwSoKdx
         TY03gQ/Z4no6qMRModiH4DifH/y/ShAWL+3aK2T+dJFlUZesdqtA2YsblBNV/lq3baNB
         wM10NcNBbxGv9QLSPmDlc1ZM6X4DEWWlQDCcfkEVq7HamjX86aiEkQgQvNy7v8nTGLfi
         Le1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUNnyHcL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbe71f2si349651585a.339.2025.02.04.12.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 12:12:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUNnyHcL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfPFY-0001Mr-6b; Tue, 04 Feb 2025 15:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfPFS-0001Fv-Sf
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 15:10:18 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfPFP-0006hO-Po
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 15:10:18 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso42161925e9.1
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 12:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738699811; x=1739304611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhmA/maE+T+RrjSr6dpY30qil8BVZDc6N3XpaacESEk=;
 b=XUNnyHcLRkC15Z8nlDkP68umo1S+C9vJQMmUkyBaYFcBkRg01UHLmdT1siQWh2hSQl
 5HcVkjzrKGS/RnagCl6qaEa5XY1coXb3zgm5UuAe8DKIPiJZ2QEkKZ8iIZnpqDkto9mB
 6K+OYNTUCGorTtNoLgHcvTBu2fkP+BVIyKxFtklP7SgwADd9cGyySGesFwDofdzZ/KUd
 QjNnOA++6wqjyEUqV77jonv5AR17ZBLB4b2vhDZ+Co2fgWcFFOeuZYlZmgFNbGMI7wlr
 yxOK4+GZpM4CFQDqNToLifqisM7nbE26IO4O8HwIIUss+6f5k/YYGLcyoc6szHNPMcyG
 yQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738699811; x=1739304611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhmA/maE+T+RrjSr6dpY30qil8BVZDc6N3XpaacESEk=;
 b=GZFqmNvEfSg6oYFxlLOpa7u5Z3VKVbs2sl1y7y7oAPtbw4iVHMGHrFhveV6egmkdBh
 ex6HoI+hqXr+wqPiIita/P3Kcux35zWcnqXFJEZnQinjA669mE2B8zHwW9Zp/ELMsMx2
 MVFpXylH4fUYw5pFOyBkqoGCFS2iTA5PddWlae7Lm8LLq9mNShsTYnV4DPH+e7pnFv+x
 Pqc/ssTG+fB5lRtg4cEfhiENujuRM663g6tNGWmw5aucGtVmIF38ewQU9KOGHyeLcmJs
 UU8ZG3/P/Mo22Sy6IBbGsbQVWD4ahElFr8qPAZM6DANH7zo/JFo2+fq7q5uO6IOTKQUc
 /q9g==
X-Gm-Message-State: AOJu0YwVF76clBrYU535IedmWeD3zOWa6XlBK+uwMA0+BPcLRRqMVGMy
 AmXypuqnMsC3C3HUaiJk6XRJi8xQRF3MCRQPAAgqMiuulO5VeeiisZw4jf6uQFjfN3FRB5WpTD9
 2mGU=
X-Gm-Gg: ASbGnctmvjUuj4F3rJ1tBM87wgx9eCT8/1GkAyt5yJknNM16U68/AaYVCM1s7jeVy+u
 4Oj+IHlgi58v++OCRIK7Cypdf6uakdri6BO/9+AlwCrQc084GSxaN+9S1+uonHc9jpB4iVmp1B6
 0KN7iexCCU5d8z814KotmmsLVoRrL9HJYnJwYFhAzMF7hYIO7IX/ejLPTuZmxcG+TwOVBei2Qoc
 xLgwfWsYAiPQrmEy/5fbemMNgn/qgbp8b8XtjOWGPRoH9LuJ32A1enn3L2PuaOrEYmLJFSIJGca
 9q9fzI08fdfhbWcblFY3qObRr39zCfFb8Mag9YPoYe2tetNVU4WJzJyeUiYQpazlDA==
X-Received: by 2002:a05:600c:5112:b0:436:fb02:e68 with SMTP id
 5b1f17b1804b1-4390d42f7c5mr67025e9.2.1738699811044; 
 Tue, 04 Feb 2025 12:10:11 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38da59470b2sm3255118f8f.40.2025.02.04.12.10.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 12:10:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 7/7] hw/boards: Ensure machine setting auto_create_sdcard
 expose a SD Bus
Date: Tue,  4 Feb 2025 21:09:34 +0100
Message-ID: <20250204200934.65279-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204200934.65279-1-philmd@linaro.org>
References: <20250204200934.65279-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: iadqbwyhgCkk

Using the auto_create_sdcard feature without SD Bus is irrelevant.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/vl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/system/vl.c b/system/vl.c
index 5ff461ea4ca..a904687b57c 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -53,6 +53,7 @@
 #include "hw/usb.h"
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
+#include "hw/sd/sd.h"
 #include "hw/display/vga.h"
 #include "hw/firmware/smbios.h"
 #include "hw/acpi/acpi.h"
@@ -2661,12 +2662,27 @@ static void qemu_init_displays(void)
 
 static void qemu_init_board(void)
 {
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine, mem_path, &error_fatal);
 
+    if (machine_class->auto_create_sdcard) {
+        bool ambigous;
+
+        /* Ensure there is a SD bus available to create SD card on */
+        Object *obj = object_resolve_path_type("", TYPE_SD_BUS, &ambigous);
+        if (!obj && !ambigous) {
+            fprintf(stderr, "Can not create sd-card on '%s' machine"
+                            " because it lacks a sd-bus\n",
+                            machine_class->name);
+            abort();
+        }
+    }
+
     drive_check_orphaned();
 
     realtime_init();
-- 
2.47.1

