Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4997961ejx;
        Thu, 24 Nov 2022 03:51:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7eKfPx0i9swB5mlLkFsNXSRwyk3ZH8hofKoonP7df/y5KevZ6KsPd9AeRzrwYGRw/Huk5K
X-Received: by 2002:a05:622a:5a14:b0:3a5:bf05:f0dd with SMTP id fy20-20020a05622a5a1400b003a5bf05f0ddmr12248533qtb.342.1669290703978;
        Thu, 24 Nov 2022 03:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290703; cv=none;
        d=google.com; s=arc-20160816;
        b=VDvyCx//dqNCNel3XkBYQ28NmDTY3nCgdWIts2LsMNpCBFKWMIIguaO6J9NKTIPVK5
         MYkyHs6MAyvwdjU7N3BBH2Q/NAyNTQX0R2+aR3x/71VXAHKaU2O9QTpw1KTl+kJZevl7
         bYFgiqgpMmiIpI+svGrk6W3OFEWEtpmAcErtU3fhOlG0HgxbmKa7WNXZGTByWxm4OTJZ
         bYQClrKQrZ0xvJJqrlFg3dycxHelz5R5MkDrF0YIgg/4sNdk+HeoAVWFWq+AnBqTwsDq
         oXBi33BsPa/E+ld4MDqFa8pGDac52Lxss4ggTAjiyAYGz+POBO7DGLheJL6VYuEWWD+H
         L16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DGCmc5zG7qiC9O+a1Tf+YC4O8NghpHhNCp4cgIMeJEM=;
        b=b0gOmSAiWBSX5cHkAIvtwvN9uGLhXKwMzmZwNAOk9WPbqkMUAb9ctpqtusc5JlKpvR
         U6DnTTsPYJ6JLGUl3uN/VloiwsmxUWck8GnRkPxZl87b0LnbHLAEFmSj5UC/r/6ZSSVs
         UDW2HBPpf6H8n0/+nph3fnDJENDRhX7NND3kwdfyBAVLH3rxjvuVfsX2NR5VmY7gFkJC
         yoOPf1mKukspIf0zlvlE7e/jCUe9uLLCHWjW6rKktnoVql1w1JKDOdpLaLaK6Q6R9a7A
         UVh9bc6lD/PZCCGf+N6E+uSA3KiWVvrR4eTWMvYr2OssguZpNu7ZLCyl+hH+PX0v/hRf
         /tkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wAw5HxTR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb14-20020a05622a1b0e00b003a5214bbc72si484367qtb.0.2022.11.24.03.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:51:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wAw5HxTR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAl5-0004HV-31; Thu, 24 Nov 2022 06:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkt-0003tY-GI
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkn-0004pj-Fc
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:59 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so4364069wmi.1
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGCmc5zG7qiC9O+a1Tf+YC4O8NghpHhNCp4cgIMeJEM=;
 b=wAw5HxTRUcw0IdM23IH/clxdS6CtzahTsyWOEaUM+5oL5JVQ2eCbmTeZXfxUMUuTSu
 R3ijriwlBCg4SjzN474ER5ZCYVYS3+ozndMgAwF1aNGYunYox3GR5s13gLyCkIPp9ev5
 YNyYaOxu3iC7Psh+LFmJOccl5HNoE1E7JxKrWRR9+qiPRytxOoiqKw/+oW2fLdAp5X5N
 0jNQFoXaCHOxXdcwPkmmJyNIjCmAyQkty1KiDnTeDhHjrc4bSH2TAo6kgja3gk9niJit
 caHLQhgndfFzQzVNus/pLXiZPBupbzKneeUpqH3lknGbnF7SlVLYaqHjnxbTQc1dsYy+
 BRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGCmc5zG7qiC9O+a1Tf+YC4O8NghpHhNCp4cgIMeJEM=;
 b=g62Ud61tiOZ2IggLMzSlIX+F3J4LmCRJG/OZ1ZsJeX1mCKycsrz/JBMG8bqAQ27dh4
 XtcSm4CAlXBrGmcDEq+0MpMZZZgeToRB1NokBGWolwjfdwVqzX5Hs0fEzAKbm9vnlY0e
 cBFsEUGe5CCBH0Casm8HYYJ133+D0N1GPSPvBivWZo8BumK6aNC1EzlTIkSG7LWRyRdH
 b1hJMTc8fTRI+F88H/DUrtpt86lv0pMcWsB3LHsYbDiiJHZFuE2E2iwaStC4Ewa+kfNf
 3j9FrSxfbtHOV4MliVCQ0UbNLagoQVP02U7jdU5vY6UCT/QJrazOHx0eZ/wyJ1kf5hcl
 7ncA==
X-Gm-Message-State: ANoB5pmUud6DmQLhpFRT/doRIoXCaKUvTM16hx1oHvHrtdWF9UxRHomw
 mXqdVVpVh64PLBJ1XGGmVVMbi/eODMh1PA==
X-Received: by 2002:a05:600c:1d93:b0:3cf:d0ba:e5ff with SMTP id
 p19-20020a05600c1d9300b003cfd0bae5ffmr23047297wms.36.1669290652711; 
 Thu, 24 Nov 2022 03:50:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:52 -0800 (PST)
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
Subject: [PATCH for-8.0 18/19] target/tricore: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:21 +0000
Message-Id: <20221124115023.2437291-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: VgkEjzsAzTeR

Convert the tricore CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/tricore/cpu-qom.h |  2 +-
 target/tricore/cpu.c     | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index ee24e9fa76a..612731daa09 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -32,7 +32,7 @@ struct TriCoreCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 2c54a2825f8..594cd1efd5e 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -68,14 +68,16 @@ static void tricore_restore_state_to_opc(CPUState *cs,
     env->PC = data[0];
 }
 
-static void tricore_cpu_reset(DeviceState *dev)
+static void tricore_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     TriCoreCPU *cpu = TRICORE_CPU(s);
     TriCoreCPUClass *tcc = TRICORE_CPU_GET_CLASS(cpu);
     CPUTriCoreState *env = &cpu->env;
 
-    tcc->parent_reset(dev);
+    if (tcc->parent_phases.hold) {
+        tcc->parent_phases.hold(obj);
+    }
 
     cpu_state_reset(env);
 }
@@ -180,11 +182,13 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     TriCoreCPUClass *mcc = TRICORE_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, tricore_cpu_realizefn,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
     cc->has_work = tricore_cpu_has_work;
 
-- 
2.25.1

