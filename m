Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4999071ejx;
        Thu, 24 Nov 2022 03:53:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7cMhn0gcgul3XoDlYY+Nmf1z8n1KgdEKQewUpCf8ZoMGko+H1E7cdd0OlkLnFIkP3qarxq
X-Received: by 2002:a05:622a:5d87:b0:3a5:28a7:ada2 with SMTP id fu7-20020a05622a5d8700b003a528a7ada2mr18410471qtb.396.1669290812753;
        Thu, 24 Nov 2022 03:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290812; cv=none;
        d=google.com; s=arc-20160816;
        b=qk4cl6pHQMlIuHSGkfCRMSJXQWzq35tE5Xc3uQcEYRs3CZc0DSSxq9lBcVhs7Zkwik
         lzOq9n+Orwu7S+m0et1jjDl3FnnyFItJQxziu3OcVdkh5ZWMtowayZ9dRZWJ7strDgXF
         L0wKhyBLbMe+BQttT0PDFzOhi0MTCfdjcTIQJNgbDxB0SfoOedclPJOop+KQ0UCiSgHp
         AdEsIuXPnyrMvBCtG8DdKFUY2Und3lxSFx/xEk0G0keU1n12r70RGSf6crhk03EkYJTd
         5RO2ww1WrkeBHx2sSOHslgFBZ1mSt4P/wvF7FOyb7GbZZd6goEKgp65Fp8cA7c8azTpC
         v1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YH5A0XgSQ+x7lqY+JmUugpzZ5SHd9m7aavem37GWINU=;
        b=ZVI0KH4Za580mZ25V3xx92Q5UetKXgMTRZULpQ4fX+jXj7266KYxrGmYPrORq41O6r
         bdVewd1REMebnvSaM+b4+aWVXTGHx13TJ+rGVN9aFHvqox+fjit7meRJSLxoAgLpzPU3
         3wU//MzYs10zMKiS277pRqMlMQNgimmHeA+sw/qffKAhyVduccHhAa5eCJk2GyxDjLlk
         HO0pEwcit95AmvoU8bUgJjl6al/TveDRlfzvrkwiG5HYYJWA9CDNERw488zxoJc7w+bT
         8bU8fKhLNa/3Zk2LXzAGVvQDdH1xuqe4vSCoU2L0p8uyz09+8lq4DGijZ+UF0T0YFLCK
         poHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uysoE+lj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if4-20020a0562141c4400b004bb9e59d7e0si487083qvb.586.2022.11.24.03.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uysoE+lj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyAkv-0003yG-3X; Thu, 24 Nov 2022 06:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0003XN-SV
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:47 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkb-0004vc-Eb
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso1054455wmp.5
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 03:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YH5A0XgSQ+x7lqY+JmUugpzZ5SHd9m7aavem37GWINU=;
 b=uysoE+ljouGnQ5ASsQhEK0UBx1Xru4DBOsbetk0ixTQF5fGYKtqYw7YO1upKLRGXfp
 3lekh1OyKhtMXg4GmIrgJGWi3lbcqmW6oq6oc3N9rtrk1x5z3W3f+6obEnPC8i6SWxt6
 YAcE+Q83VF+ks3p1FGqwr3aK2Dy7JssibAsN42gyI/rgyJHKyt/XgnRwcdwisY7Z4zEF
 lkJJf1aO8lWtHbf+izUuvlvv3uww/BXroyDyZnrdsKyJhPay70He3NlwGYSvXAtPqJtH
 1wjebi9bqHMk8yDoKpZH5JUrbulkTWpz32Y1lLC3dxqFR1jBQkKx86lhu4fVnMB95wAF
 /WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YH5A0XgSQ+x7lqY+JmUugpzZ5SHd9m7aavem37GWINU=;
 b=I3aKuuYlmz8yO2czCZpWROtPMlovGJDaYBlUR2+ui8OBPQnn9y+83B4yh9EENkXCh2
 b1ruHjoNLzs4DBsZptU/d4S+2UKpE6CVagqrJo7dqYBTc+EuTjBkiLZ2Rm516MmvPbep
 nAPOqFvfIaxLpQ7zdJQFsfdgEIqmHcdoco44uFTi4Z9QU/C1znxKwWXrOhVkqKSwU4Ck
 O6ZAsJLlEs2Jh1S4TAtXtq8OzDmRJI+mwhaEYVROQyXU/oPgFLwSAYtoD/8ix85IoLL+
 wAxCVv2Bmolv8aA1mmxu2pPUWM1Ui+LF2k6dcADbZfqh/gMYZHuBU1HMIMutwwzozKsk
 TMvw==
X-Gm-Message-State: ANoB5pkWTJ/zlMRwjTPrQceIOt1TZY3PkZ19kEY3A83vgeufGJzSwwn7
 mXZ3sn8gSvBXooepU0sOWwhX5Q==
X-Received: by 2002:a05:600c:4e0b:b0:3cf:e850:4437 with SMTP id
 b11-20020a05600c4e0b00b003cfe8504437mr12993161wmq.51.1669290640170; 
 Thu, 24 Nov 2022 03:50:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:39 -0800 (PST)
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
Subject: [PATCH for-8.0 09/19] target/microblaze: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:12 +0000
Message-Id: <20221124115023.2437291-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: kkm8bK4Ydqsn

Convert the microblaze CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/microblaze/cpu-qom.h |  4 ++--
 target/microblaze/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 255b39a45df..cda9220fa99 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(MicroBlazeCPU, MicroBlazeCPUClass, MICROBLAZE_CPU)
 /**
  * MicroBlazeCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A MicroBlaze CPU model.
  */
@@ -40,7 +40,7 @@ struct MicroBlazeCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 89e493f3ff7..817681f9b21 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -162,14 +162,16 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
 }
 #endif
 
-static void mb_cpu_reset(DeviceState *dev)
+static void mb_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(s);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_GET_CLASS(cpu);
     CPUMBState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUMBState, end_reset_fields));
     env->res_addr = RES_ADDR_NONE;
@@ -399,10 +401,12 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, mb_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mb_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
-- 
2.25.1

