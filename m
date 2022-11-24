Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4998508ejx;
        Thu, 24 Nov 2022 03:52:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6QSor6E8X3m4h+lO13+bCa5eNaLrDQfQRvHm+OqF2U4mDhpW/xvNwQ9CJWrslIlVJowtDW
X-Received: by 2002:a05:6214:3689:b0:4bb:62b5:bddc with SMTP id nl9-20020a056214368900b004bb62b5bddcmr12178915qvb.91.1669290758062;
        Thu, 24 Nov 2022 03:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290758; cv=none;
        d=google.com; s=arc-20160816;
        b=gyBd3DfaB68JVgCgY3utF+55MbXEP4jupPlXmwRLjgSDL+ARdMcs395RIEErSRtnfN
         +b7id74a2m+yBOJ6IHg0qbd/3AcEnqPtZC56Gi0BhKjmtXSl2I6vFFEh5296Rz9N3IXU
         fO5KHNpP9d96xjy95Nq5JsK5le+7G4mDk9SdGz1QtxgvY+ZcW93JCjSQ5zCI5Cainysm
         4EgkqIg5b+4ZVvJ/ruzPwT/ueiqwMKFDVw0juM7Be/+NL01Sdt/j1sbMwgtxtRm0r3Rd
         Zxhdz/kbjpR8BGN/Nt9PaCKs+ELa/hE9m916OCY2otzrn7r7iI7rfnj4KuPMx1nLBmzR
         4hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tSG1Pvc6m8SnTYZhtJnHT4zBC5AegvUy/RzVsBJxFvM=;
        b=hCfMZLuHUVESHaA9sxrEIA57ExkpUrWrg5lZxcLcTHTFDoq/oqkMr3z9fs13uUnK/+
         sCOH6ag5bWtzNmqpbXmF0Rv9aCs8bIJgdSDRj4Ie9W7eqrRvMSyQGnFEZjIXdK9JNP8j
         0cjQ9F56NXHArPLaf8Ut09Hbla1cDIE8NP3QDBXdMw1TcEuwXlvvutPN9EfWgZJ7WHs7
         ArpFJ4RIwKmZDNtYNgFo6bS74NZuobkbk/+mdPSnz707whxJfidwA+v6odXxZrBHXhsi
         YJxT7eAh0QI/BzPU+W2LQqYQ55pQThH9CnUDvlEFWylgLQrFpBA0edr/UwxGrGNtdLqF
         +HDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HisP1vEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05621420c300b004c6aeadf75bsi560904qve.271.2022.11.24.03.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:52:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HisP1vEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyAku-0003xX-KZ; Thu, 24 Nov 2022 06:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0003XI-QA
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:47 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAka-0004ut-50
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v1so2090245wrt.11
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 03:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSG1Pvc6m8SnTYZhtJnHT4zBC5AegvUy/RzVsBJxFvM=;
 b=HisP1vEH09VESx7i8+MbNnveYSd6zREVfrB87gWzdyqhrcGoByZnE9EdQESORV2LVx
 y1/L69WKqJ8Y1S6NXzQyEAIeVs6UNdaq1C4MPWrkhq9Dw8vqaFcV2XjYSxKKpC28vLkH
 Khae5lsZKAheohs8dvRZcakjj3xMndKdpbIy3/S4cUQtiIKlLxFY2QMoj7rFfpJ//vjs
 SN1lIQRTpIPivuvQpfnNL5le3OoQCBqb7eZLzdYlJwv1wFM9zzLlrW0wVEjnEVrGr5cx
 7OUo1TFI1YUb7mCYNRmQUfwfv/0XFkPaJSKz4u07YNhv9bPoEA0kGxpRYGeql0dXUTyU
 0igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSG1Pvc6m8SnTYZhtJnHT4zBC5AegvUy/RzVsBJxFvM=;
 b=fbSoduaYMrg8L5of3kMxlKsVxw/CwG517N7zOv14fvEJrmtqmIZCnYOIKDkURaFiwJ
 doWtaZRip4aFTASu/iqIPUFLNLFh1zNUbN4hNeu77P8lMDt6egsZpQICUodhlnXdlYax
 /524Ik5Dh9ISp+iPeazF2ECzouezlrdKSmRmohpx3oAjlDBFVzr5vZmG3sO2rJQN4TFg
 AHTrGIxai5jV4cKtwlGdQUJ6Pf5tPsrk2HT3S7Yc/2VKoAF6kTFmqJ72vqizLC0CH6w0
 uRqRph3o+EgvtJyB1UNVTkogVs8U7Csdf/bZEzDC84VnOZIpl7RiZBRb9S9au5IKbQQ6
 su/w==
X-Gm-Message-State: ANoB5pmA9nn40AoKmQ0RFZxIDsa1nJ+yqW9WSK3x/MsxY+z4W0Ssm1LL
 dVuOs+Pfasfj/wJ4iEZGxuPpfw==
X-Received: by 2002:adf:e3d2:0:b0:241:d676:a787 with SMTP id
 k18-20020adfe3d2000000b00241d676a787mr12028072wrm.694.1669290638551; 
 Thu, 24 Nov 2022 03:50:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:37 -0800 (PST)
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
Subject: [PATCH for-8.0 08/19] target/m68k: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:11 +0000
Message-Id: <20221124115023.2437291-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: YUOQ2mPS34n8

Convert the m68k CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/cpu-qom.h |  4 ++--
 target/m68k/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index cd9687192cd..0ec7750a926 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
 /*
  * M68kCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A Motorola 68k CPU model.
  */
@@ -40,7 +40,7 @@ struct M68kCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index b67ddea2aee..99af1ab541a 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -66,16 +66,18 @@ static void m68k_unset_feature(CPUM68KState *env, int feature)
     env->features &= ~BIT_ULL(feature);
 }
 
-static void m68k_cpu_reset(DeviceState *dev)
+static void m68k_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     M68kCPU *cpu = M68K_CPU(s);
     M68kCPUClass *mcc = M68K_CPU_GET_CLASS(cpu);
     CPUM68KState *env = &cpu->env;
     floatx80 nan = floatx80_default_nan(NULL);
     int i;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUM68KState, end_reset_fields));
 #ifdef CONFIG_SOFTMMU
@@ -552,10 +554,12 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     M68kCPUClass *mcc = M68K_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, m68k_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, m68k_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-- 
2.25.1

