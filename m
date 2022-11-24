Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4997471ejx;
        Thu, 24 Nov 2022 03:50:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ah01R0BocGu9LGg/ICMTW3iwEX694MAhoKNhuB6zXGU/Ig067tRHx5S3fVuNXIuB13n1l
X-Received: by 2002:ad4:4c03:0:b0:4bc:182e:78c2 with SMTP id bz3-20020ad44c03000000b004bc182e78c2mr11850273qvb.2.1669290658070;
        Thu, 24 Nov 2022 03:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290658; cv=none;
        d=google.com; s=arc-20160816;
        b=h/EMNJq9mKz/EGEfHEQf+rP3+6OJypOqINWOhAzulHhYtR6uHhs3AKbpHpYePvQBIl
         TuZ6YrqXYfgFqqV54J7XYpNPy4hQhqsI5UkPVb2GkIE2iHr2cisFuSD0kB7+2K+KVvtH
         vBGYfsmMo6vUkuH0syFXkrGjVJK8RLpLwUaje8YE9NGLjb0Fjt1RYhfHj4xG5fw6s5aL
         AE7xxFbTHmPgYmb7NLOFN37NdNLi25Ua5qeJhxPYIOjz6o0FUX5W4IHMqR/cQW3WleeA
         3kiLYrsv1qoLgGUrqXNvKKEyO3aaleZn66hX5ixQtSai5uPQiAmZPDXbNb1lvMdqGam1
         rWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6ZF6j0QSh9sYA2HgkILcyWukmhzzkxCNhgIX/8WMk28=;
        b=lDv5uSTWAzKZQJKxEFDPTQin0V/r03jftQ1Yi5GPIzeTTK1AcH+IhIGsngLJTfUhx+
         DZD1VRbL5OZEvsd1RrKbpaLRrC0dl+hMeChJ/AO3EwH2AdErPhJ6P3dNqJM8cKWWNCCa
         ecWghlXx9zNUyBmaeJt+YvoPz6m+zLZ84d+OpFU78nhgILx1pl+z3o2LGjW5PtndFiPQ
         jYhX3r6bveo05KMuTMgC5JGiLpIvC0oTfbGrS3qzJ8m83BeT0CLdcd8iZk+OJLuPJnzL
         jOBbSlzt4WRhN3yg3n6gTsjHvrFzuy7PkFCyXCYi41ALSuLSlspbdkkqb2wcFpPu8lBL
         gtXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAT4FHh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq2-20020ad45962000000b004bb591ab1besi497330qvb.389.2022.11.24.03.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAT4FHh2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyAkn-0003gP-SL; Thu, 24 Nov 2022 06:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkd-0003Ww-L4
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:45 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkY-0004u2-UI
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:43 -0500
Received: by mail-wr1-x42e.google.com with SMTP id x17so2124235wrn.6
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 03:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZF6j0QSh9sYA2HgkILcyWukmhzzkxCNhgIX/8WMk28=;
 b=NAT4FHh2y5rfoCsN2LOyaBHUjKRRBGr4i2n+kh6KKWC9FTpJO2uKeVXKlXd67RYKfP
 1OcT1jIORmWT+rkZaYG4r9ZM2pMa75XvwYxq4h2d5Js4HqalHq4Dy3f7Kp91qEBiaVex
 hlc+82YG/1xfezhc/951gCNyri7JysQt4mpLodDf+8gGXagB5G+wnRrNXq4Cj5jrn/4V
 XGO0xAHBZRDm4JAjovVfnk1Ln4iic7UR+VoiwK7kh6b2lLsJFHWmqKQ4M3yIuTeGuG9A
 3CTA2in20ok/RxmkqYkVC/t7NMgwNqHrA/FrEWkeJS+MilCaJtjPjWeByuGIfuxM7o9x
 XWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ZF6j0QSh9sYA2HgkILcyWukmhzzkxCNhgIX/8WMk28=;
 b=LNK9RbGRv/DB71QDWvwi2EMTxObiQ2FzLwiGfWfO5ZJhe5aHYHU+jOlBLDSF9zqaMY
 bcmo4W9yXjFXq3Dmq+20JPrD8r+cojHaTV7bFDjfKJEf3lr9sJ0cosTY4bsKjzbossLy
 ip7vhUMm6FpEmR4JYLatbBwQJ5lfg2Ik8CeKif+sSLgQQu0fxIsRUeziJXshDF4lVjmv
 g1Tqt/9Hj2A336oVc879fmoZtqiRj0G3TK4SEBp5VXvfslx5EPyVqQ5zMuczZBiX1JtX
 dda4+MwHFM1qy9scPwx7aS0YEXFz6Y/CZCIRwXzYg6qzKeQ3ApLhMaSutzQPnjLW+ttT
 JVVA==
X-Gm-Message-State: ANoB5pnDF9gaRSdd3WJQ3zggnDNe4xrceXzG+ZfYzridK9GBVD0h5ny5
 Fq1R68z8Wu9ZbHSQeFIx9TRuVw==
X-Received: by 2002:a05:6000:12c7:b0:241:c876:773c with SMTP id
 l7-20020a05600012c700b00241c876773cmr14540856wrx.95.1669290637064; 
 Thu, 24 Nov 2022 03:50:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH for-8.0 07/19] target/loongarch: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:10 +0000
Message-Id: <20221124115023.2437291-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UJJaIalyqcLQ

Convert the loongarch CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/loongarch/cpu.h |  4 ++--
 target/loongarch/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e15c633b0bf..e35cf655975 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -356,7 +356,7 @@ OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
 /**
  * LoongArchCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A LoongArch CPU model.
  */
@@ -366,7 +366,7 @@ struct LoongArchCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 /*
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 46b04cbdad1..e8c42f17a54 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -452,14 +452,16 @@ void loongarch_cpu_list(void)
     g_slist_free(list);
 }
 
-static void loongarch_cpu_reset(DeviceState *dev)
+static void loongarch_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
     CPULoongArchState *env = &cpu->env;
 
-    lacc->parent_reset(dev);
+    if (lacc->parent_phases.hold) {
+        lacc->parent_phases.hold(obj);
+    }
 
     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;
     env->fcsr0 = 0x0;
@@ -696,10 +698,12 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
                                     &lacc->parent_realize);
-    device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, loongarch_cpu_reset_hold, NULL,
+                                       &lacc->parent_phases);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
     cc->has_work = loongarch_cpu_has_work;
-- 
2.25.1

