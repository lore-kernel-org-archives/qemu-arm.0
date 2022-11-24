Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp5002167ejx;
        Thu, 24 Nov 2022 03:59:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tr01YooaieC2uSZe3/pBnPd/LFAlH8N9lyQlyYpj74tyc4ND/1oV5QaxzSwvp8E93nO8D
X-Received: by 2002:a05:620a:16a2:b0:6fa:124e:d8aa with SMTP id s2-20020a05620a16a200b006fa124ed8aamr11779593qkj.604.1669291153439;
        Thu, 24 Nov 2022 03:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669291153; cv=none;
        d=google.com; s=arc-20160816;
        b=t5gW1P65vuHVPOkf/oPzRGqIS5Qu7wwtMnHvMBTn3EdN3gQNGofcMR0BE2nboCf7vv
         I9FsVaaiNeCyPhvV56T3zuKPxcDmOg+l9FCCXaqq2iv12i13JbSiLQG4LCjyXpcMqMUq
         LvO+k9Z98Wu8k1dGw9NOCXnDeGxuJjMmut/mhvBRhwGSDiMDr8MfXDh1g8vpCsvTjN3D
         RtKxDWWwar4Ig6zUbPUfnkeML8t604hqZGjm+JqJQrNw8PH6/3BuVmODHeNb0xf+YjfZ
         55zwHk74sOR3/mzkke2melRTsNaWl6POETMJTSp+kZavFhggGMm0uOD9E+Ge5SwnLzYu
         px0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q3oxmV+LQyJX4gwRTeeLTi9bBMYt6AFHuvPAkxNrKQk=;
        b=g2Fy18am00W3bhkOKL8zEfpn2uHrAotP1gZn1dpQCuJooe7xxFqivBrC88d7GlelOj
         Je9mt8zIVjYuzLFzelG9KtAqP/IHYNJFJ9YFqyhL/5omeyLn+PMdofhXyIV+pl243c/T
         48pwwOYUDEytURMqAmTGCBATkpCQ4HqkyJzNmYnABLsRtN6kWcurDdyyx/RTfrLq2zbj
         /8L3OHeZqvWXT5XpizEuiPeWbNJ3LST7MkiHz3nmAQR+pOxVYHWlSt5TcxYlcd+oK36j
         BfSHJtX081bGkzJSPcwLva+yeoui4fkp2R46W5vvKNpigtzFWqZY5cFv9YClpCvCUcXV
         fBMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KF5tC616;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a0562140d4200b004bc0b829ae2si40190qvr.550.2022.11.24.03.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:59:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KF5tC616;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAko-0003iH-DG; Thu, 24 Nov 2022 06:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkb-0003Wc-Vr
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:45 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkX-0004sa-Rv
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v1so2090072wrt.11
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3oxmV+LQyJX4gwRTeeLTi9bBMYt6AFHuvPAkxNrKQk=;
 b=KF5tC616vplC3BrqVFj/zt75ZDrB4Tj9mZKmdjFUICCKLmp0De/sBJvmajFEUDioQE
 9tGRRNrhFIr1lXZinR2gjl3jseN8fNZozx0Cd1VlpsiFTsfmwgE4E5OaG31GTDFeeIqp
 tqpLelPlq2SuZvJgo96z8RRBWSxvavVS4ld1fsTZWYL7BCwT8RBQsNPwr66pcxjcl1dm
 VaJijjIyGlyUtxXUaLz2tPJMYbG7mNI48EYN2CRkusNCYu5vQq5Xg1PpY5zOkXWm7Sx+
 A92HHR7rZJaOTw/o5slS9bHxgdtei12q9vwmeWaZJ5tVYw9UPRtJZpIyqmS5yAjEO4/7
 JNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3oxmV+LQyJX4gwRTeeLTi9bBMYt6AFHuvPAkxNrKQk=;
 b=OC5pc5L77V1c+ltKLHrDUyynLmGgMbt8F5lq13NOrU68DUYFkCj5hUqSmEt3E/0lJA
 J6T3x77iNOVnRfhVOG9ROPSmVQ4TLOeh9w78IWNwcrlmHICczUxLsK9OzE7kyz17Y9AL
 PUWdY+H+bwz1wltCoudUFi7ByykA8zOQdo5eCO1+gHT27UcnWTCJ8uaWYNIQa3sJXzxP
 YxWcMpi/9O+BdYwS5+PWA6mwp3IF3Ynj6RycGGxeiS7EsqpKe57RfSbN8x2GcL9zRZKD
 uYpzudq5ZB6AnB2EuxIORgQykHx8OsQEQpfu//UG8wHuJr9+AWsLJAD6YuOy6p3kf3JF
 NsLQ==
X-Gm-Message-State: ANoB5pmoOolCfenInohlCWNQMWe6CgSOZ7/6xcVSJPe03rsrIptbbTT4
 z4PxW87Kwx4TPL2JL0j4c+zl+9S2DIwi6Q==
X-Received: by 2002:adf:edd1:0:b0:241:7d0a:65ef with SMTP id
 v17-20020adfedd1000000b002417d0a65efmr12760334wro.491.1669290635680; 
 Thu, 24 Nov 2022 03:50:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:34 -0800 (PST)
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
Subject: [PATCH for-8.0 06/19] target/i386: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:09 +0000
Message-Id: <20221124115023.2437291-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: Rf60Kkto3CTf

Convert the i386 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/cpu-qom.h |  4 ++--
 target/i386/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index c557a522e1e..2350f4ae609 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -42,7 +42,7 @@ typedef struct X86CPUModel X86CPUModel;
  * @migration_safe: See CpuDefinitionInfo::migration_safe
  * @static_model: See CpuDefinitionInfo::static
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * An x86 CPU model or family.
  */
@@ -67,7 +67,7 @@ struct X86CPUClass {
 
     DeviceRealize parent_realize;
     DeviceUnrealize parent_unrealize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37d..8f618cf0b25 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5878,9 +5878,9 @@ static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
 #endif
 }
 
-static void x86_cpu_reset(DeviceState *dev)
+static void x86_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     X86CPU *cpu = X86_CPU(s);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
     CPUX86State *env = &cpu->env;
@@ -5888,7 +5888,9 @@ static void x86_cpu_reset(DeviceState *dev)
     uint64_t xcr0;
     int i;
 
-    xcc->parent_reset(dev);
+    if (xcc->parent_phases.hold) {
+        xcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUX86State, end_reset_fields));
 
@@ -7112,6 +7114,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     FeatureWord w;
 
     device_class_set_parent_realize(dc, x86_cpu_realizefn,
@@ -7120,7 +7123,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                                       &xcc->parent_unrealize);
     device_class_set_props(dc, x86_cpu_properties);
 
-    device_class_set_parent_reset(dc, x86_cpu_reset, &xcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, x86_cpu_reset_hold, NULL,
+                                       &xcc->parent_phases);
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
     cc->class_by_name = x86_cpu_class_by_name;
-- 
2.25.1

