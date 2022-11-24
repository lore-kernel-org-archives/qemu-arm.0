Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4997725ejx;
        Thu, 24 Nov 2022 03:51:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7k6zCvlEXGaMLKH1AkmAa85inshZExpk3lotsFtO+GgI9xshXq7tFKaEgIyBMk1TYtEg0Z
X-Received: by 2002:ac8:7217:0:b0:3a5:8288:17d5 with SMTP id a23-20020ac87217000000b003a5828817d5mr30762945qtp.80.1669290682657;
        Thu, 24 Nov 2022 03:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290682; cv=none;
        d=google.com; s=arc-20160816;
        b=XoHPvSCeAM4+CO9bxVeZCQm8Tb1gRtaMizZwhQTSyE+srFazYOFk4D35Gx8M2Py5ue
         0/lSdq7pgkd2ItmJt6hc1jrkU9mRQyBjfy8tQRPyceAfx5l8k776ToeT17kxq+iDQyjC
         top4376jzeCms+oJS+ebqinna/fhHyA1LvJfARWpuiFVDmOAFnDBPX2wUSCgXfTPik79
         +jeqwI1WjxnACfBkwFbCMD260DR9dAHkr1SozZZzE4+pLRcNS1PeTATKGbVybw6e4hRb
         /MdOAHoYuZH66KdosQJ5Ra4ZZncW3YI7QSU2I/fcOsut8O56PYoN/mP/3N/jyKL/8D6L
         +THQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5KqcOcEgIFi0TOph9IghaJwhk/riQMZsEbqVRIdHQT0=;
        b=qHs4ov+sekrHJZSU85OmEVbeHIsLNa/PVHHYxQocVQ6SXK66QzFBzP12fKQnvusC1l
         ykEmnElJWyjX1RMzWTnMfFL3BHMG0GKaslIj0PYDT1X8zKyKFBgxXTyakAbxP4biSkNm
         avRe5MIMhHGElamE8c9IRUzEK4BYVI5v/x9gHhxPQIFs7hF4hvINE6xSkirqOC3ubr+J
         IHvqYDN2OFXKaon33I/6Lu4Z+MJCKtRT1v1pq+RTDZk8k7QjiFKFYraSoe5XyCnd/rl1
         UBjFCxYFnLHh8ZI9jmnIY7ujL/6exGisAU6kVMwu6Ud+b2kEY6PBqDDWBUL9DcK4Sh3F
         JtSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ApUEl7Xi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a05620a408c00b006f9b019034bsi481365qko.259.2022.11.24.03.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ApUEl7Xi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAky-00046Q-W4; Thu, 24 Nov 2022 06:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkp-0003k5-3s
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAki-0004xK-5l
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id q7so1232677wrr.8
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KqcOcEgIFi0TOph9IghaJwhk/riQMZsEbqVRIdHQT0=;
 b=ApUEl7XienxaTZM34NxC40iIUE3iPt4pf0H75DjK1W/AiYLYUPiGbsZ3zUdJaGuXaw
 ZVQUK01taqHHpAU1BjMhZvTBZXYiHQ7fRLUhxHe1+dRWOOn2am7I53H+okPQ+Gfwguir
 eZ9AG+ZWs2nx6Mo7V6ZP4qLgeoE1FwfV00T6b207whdoWidowz9eHGn5aZcFYuhOlshb
 zIS0nR5c73PWxb3Hj7xDM1F+mPKXCcviZJ1xXNWqkbI3Iu4+c5qcXCUo4Z7c1pvqqxI3
 0R5o8rkCKU9dCr/M4o2RAnTiXgf8qfEvdpS+Rxh4DBYGYAoqDFa4edteV5LR4hIdzuTs
 yrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KqcOcEgIFi0TOph9IghaJwhk/riQMZsEbqVRIdHQT0=;
 b=sGRl0PdzxKpJkDkNO0uqmginrZXwd+bBEc1DZ5BUP3a8hV1CynuJOcZLwMc7r42tB1
 HMaYB4+fROzG+bolE9g3QIpAQdyu/rxPTqKsGGYhC4CpDuy56mGxbUv4npGbf3LMi+Gh
 VW4uYU0VLRUGOnObjUUg+WMwP6DajC6cqGTAze92UmkpLwbWteKaUTbx/8l25oTo9IHq
 gxwOOrzA3FYXjfG3JXxMejp98Cu71bIRMpMVKa4n0wI/Eb7FZl9Gr/GEKJ7HTkmKua7A
 0Am6Bw1AL3KRGzmiaJkhD9r8wyF24pJDeo3pxaxE/pYFqjGbyLUrmikmop7VnyVD3YcJ
 NVVg==
X-Gm-Message-State: ANoB5pnswGKPIBfIU3rNcMSRSDUuznphhkckGIyvRgEpvTWS40z8rapv
 lyHqzX3qhcDpQOs5l6Hddgwl+A4cHRvpIg==
X-Received: by 2002:a05:6000:1d94:b0:238:3d85:8e2c with SMTP id
 bk20-20020a0560001d9400b002383d858e2cmr20372497wrb.650.1669290644214; 
 Thu, 24 Nov 2022 03:50:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:43 -0800 (PST)
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
Subject: [PATCH for-8.0 12/19] target/openrisc: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:15 +0000
Message-Id: <20221124115023.2437291-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: V0bzWW66HFvr

Convert the openrisc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/openrisc/cpu.h |  4 ++--
 target/openrisc/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 1d5efa5ca2f..5f607497052 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
 /**
  * OpenRISCCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A OpenRISC CPU model.
  */
@@ -44,7 +44,7 @@ struct OpenRISCCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TARGET_INSN_START_EXTRA_WORDS 1
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index de0176cd20c..4c11a1f7ada 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -70,13 +70,15 @@ static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
     info->print_insn = print_insn_or1k;
 }
 
-static void openrisc_cpu_reset(DeviceState *dev)
+static void openrisc_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     OpenRISCCPU *cpu = OPENRISC_CPU(s);
     OpenRISCCPUClass *occ = OPENRISC_CPU_GET_CLASS(cpu);
 
-    occ->parent_reset(dev);
+    if (occ->parent_phases.hold) {
+        occ->parent_phases.hold(obj);
+    }
 
     memset(&cpu->env, 0, offsetof(CPUOpenRISCState, end_reset_fields));
 
@@ -229,10 +231,12 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     OpenRISCCPUClass *occ = OPENRISC_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(occ);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, openrisc_cpu_realizefn,
                                     &occ->parent_realize);
-    device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, openrisc_cpu_reset_hold, NULL,
+                                       &occ->parent_phases);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-- 
2.25.1

