Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp5001127ejx;
        Thu, 24 Nov 2022 03:57:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6cuo+kKNa1yOWlECa1IBP2KoVYiv36KCRy4uQJKiLKbLPi4HQFdjkomkEfGpk2dbA7KvBk
X-Received: by 2002:a0c:fa91:0:b0:4bb:d324:3aa with SMTP id o17-20020a0cfa91000000b004bbd32403aamr13210604qvn.99.1669291043122;
        Thu, 24 Nov 2022 03:57:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669291043; cv=none;
        d=google.com; s=arc-20160816;
        b=kX0wvNdeuPmSVy3TJrCB0EPbIgX+5TaKkKZ32AYYj2C/SBuvgE7il0bnOtFNiiU9jM
         AAwkRYuhTBeFIReubBEWxs+N+q4K5knS8rX45AvuA7nh29zSxD9S/4NUKsV6nQCyCmqJ
         Fk1eGbGdzCNRK+N5uHfP/Ch12rqufy2UGad1I/xnaFC6bbCoeZp35WgX3JexO7kM/HdG
         s/h6i8PuR/VSrJMW/soWrPJY7KmYZFqjZPvZrGw4jcHzrhpMRgjIKN0qw2a0pCh75VMN
         D99ffkkvcQ9caUpcIJfylPMhHV8wdqkLsAPNRRHeWum5YcR5gmNjoB13Fh7P1st4x98D
         u26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+pngmMhNFNeQ+gXXcDsfqo/V6FiO7zBgzlTDG8C44Z4=;
        b=sZ2U8CH5A6M2Zp/RhRGsN+ZQHAgPCf2iPRlMFAJGBK3pRA61jk+KePAMih7DUDMJPp
         xQklpZ/Chki7EPKW+bySU8oMlfh18ygBwb6VNB0QXRG6bt5ITsPxouHKrrlRuSKr3WW2
         UL4uG19vcA6w0oK4lkNNbJY3k74vFpfbmJKcJV/m/qFElLiyfOuEwGSTNLgU/tE+1ojA
         6KiFU8sVHorVlTN8yojCHiVosotICDvAO9saJiw/Lq95jDPL+xOAYoLovXNuFpnIsyp8
         j+NVIHoc6NThTTE/1DEK1zEYCNTpneYuYz8/fS0Bhchnv9PwRimImJZjc8H0vez4vVWl
         iL6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cex4TJEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020ac870c2000000b003a4d3a5ce56si476163qtp.245.2022.11.24.03.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:57:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cex4TJEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyAlA-0004OF-QS; Thu, 24 Nov 2022 06:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkq-0003lp-Lv
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:56 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkl-0004pl-Lf
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:56 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r9-20020a1c4409000000b003d02dd48c45so3422771wma.0
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 03:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pngmMhNFNeQ+gXXcDsfqo/V6FiO7zBgzlTDG8C44Z4=;
 b=Cex4TJEi+yfXPgI+YyoSTGHPzvlkW4KQ5iwZdCIdf7+PQRewWEeefhvSxNYd2nz1h6
 R9M2QKi7HYywjLabejqKSylkDjaW2wOLeZY3RXzkhnkTVA8WfuBxdFi/bn4MB16C3s1G
 7G+CZHEqBcG+Tk/TKUz5I1sEY47dYCMKrfUtAlLQy000n9fJQRJJGVdY2oeJVD3l9HZx
 7hLokGlo+Kr4dDRHiETpRiR8RaZaVE6v1pgS2yB6BZECqmlGutZv+J4hZS1Oj6maXA+0
 1H+MB/CWQWfGIoAXdp9M6CpZx2lxZ5gIVzcCYLoQkwil5RYeDsVL55cFqKtnZX2qehXW
 ZV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pngmMhNFNeQ+gXXcDsfqo/V6FiO7zBgzlTDG8C44Z4=;
 b=F9U6cdIjetyIgqgHQsMhXbH7quRvRlLzl9MWjLSobJHndYRMg0MBAEgvgtulBzpRLa
 dUBlE4a5zbESs5M+1EaQHjKkUY+1FfunUmYoYkvlolQg5SYIkC8DoW2uJ301m9V+emvh
 HaCF0Xi8xgTOn8i1ki7oGtoM7iuZ5tTPMINvIgY46xNxlHhaO5fsp1Bq0iFKrLMXcrV+
 cYaR4vXyoVp7NWbH6dR3uYETZodHuoczqK3N/EMto8ldEHo8+MBbfvNQXIwQEbYyhTD8
 FNpkS2zp+vuG0wXOPLGFWnu1bQyUxcZORmF4OZvv8zheVpwswxaA/bD+Qi+HYIkHFJq/
 arjw==
X-Gm-Message-State: ANoB5pl5Iyf49kQdodVoTM4bR8hfWXk59J5GBEl0D3Bi/ZBvl99UYskB
 Qkv7++SzvfzJF5owdKFgKkflGA==
X-Received: by 2002:a05:600c:19d1:b0:3cf:ca1a:332a with SMTP id
 u17-20020a05600c19d100b003cfca1a332amr27246324wmq.118.1669290647083; 
 Thu, 24 Nov 2022 03:50:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:46 -0800 (PST)
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
Subject: [PATCH for-8.0 14/19] target/riscv: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:17 +0000
Message-Id: <20221124115023.2437291-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: aV0J9iW05DkE

Convert the riscv CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu.h |  4 ++--
 target/riscv/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f8..443d15a47c0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,7 +395,7 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 /**
  * RISCVCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A RISCV CPU model.
  */
@@ -404,7 +404,7 @@ struct RISCVCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 struct RISCVCPUConfig {
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc1..6fe176e4833 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -519,18 +519,20 @@ static void riscv_restore_state_to_opc(CPUState *cs,
     env->bins = data[1];
 }
 
-static void riscv_cpu_reset(DeviceState *dev)
+static void riscv_cpu_reset_hold(Object *obj)
 {
 #ifndef CONFIG_USER_ONLY
     uint8_t iprio;
     int i, irq, rdzero;
 #endif
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPURISCVState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 #ifndef CONFIG_USER_ONLY
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
@@ -1161,11 +1163,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, riscv_cpu_realize,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
-- 
2.25.1

