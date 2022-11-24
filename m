Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4998695ejx;
        Thu, 24 Nov 2022 03:52:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4VBAmOExiP+GPLqAZxjEFDFIk2/7UHy9YGQ/9CG1nT5Ing069U574FzgsVvhHVgQoijIyV
X-Received: by 2002:ae9:e509:0:b0:6f5:5aa7:c772 with SMTP id w9-20020ae9e509000000b006f55aa7c772mr14409254qkf.97.1669290778413;
        Thu, 24 Nov 2022 03:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290778; cv=none;
        d=google.com; s=arc-20160816;
        b=XFpB1B0/Ge5awFazM6wwwLcT7Zzb7XhvwIy8ZgtbsurB1jnPAuUmJDgKvWh+pprvrC
         7u6JCqrEDN9SajZiJQxP7eitAR3u409t6DQpBfCQZIVvK5MiepBWA8Sb7exNjgTZ63iq
         yxZ++G8lgKjocS4+fqDsvbsVIY2WHC3t6ZroLquRWYZ448SHbIAmLnqzV04EJY47wtJ1
         FmLmYCa7kZeO8EuGFJJU2ccA4JL03OmMij9OL+L5behwbGLZl5GEmv0PX/P7zpf9BHE9
         NeihjyIOGHi4kNI6dlCXNncPWPxhSr1HyVLIso4vTnQrNhyVi3o0urDmKgP6lLz1966l
         E+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rwpZITjHgQ8cOpxT8gQYzyXjPVENzbqAFCPuHxyLkQ8=;
        b=X813wKYmgjd244WvsBOaMCXIJY8KW/S4NU/9eNzLVvW2OeD2i3+KX71LkR5jqepwMd
         AsiVCcbhgC3+0YQuoYI0HUePsylfqcKtwQmd7ch2ukxeqJswuTUDWr4G1D4GKba+sbSA
         zpMmN5GSGgZnnxGQ6QIVqT+OLx5+2r0WkrADLkFRziPGHXZGxdKjTBS8j4Tg/cjToel9
         iwN+QY8t5SB5ySSIpg7zXMaMQvjDnDQUKQ3lPmyor/24uVhxFm41P0hVoJcsapECqqWq
         oEV4bqFUlUG1RXqe9TPH0wUc9hGrVBxxLsgiA95RwIg1X8XroXEi7YmTIwiVpOgDnJO2
         CB5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSQmtuXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020ac84814000000b00390d451b552si452766qtq.344.2022.11.24.03.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSQmtuXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyAkq-0003n1-TN; Thu, 24 Nov 2022 06:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkm-0003dO-G4
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:52 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0004wc-HM
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:52 -0500
Received: by mail-wr1-x433.google.com with SMTP id d1so2086008wrs.12
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 03:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwpZITjHgQ8cOpxT8gQYzyXjPVENzbqAFCPuHxyLkQ8=;
 b=YSQmtuXfYmEMyAZJQQx+sMhkzkfMFBPjsg9Pck+3XE3HU+6t0j/AlUltMb6n7+C8pC
 dLGyyLj+ugYh1v5AQ6O+lBduwFbV7kjIQI8flwycMuqWCDa8SsShqH2fI7lnpAaT4zYs
 XGvfIj1Y75A1gIcfXeZDfhI6Gosxvvt4tZK9c4itdlC/lXatRR6+mlDRMKpw3zqx085M
 q6pF/ux9lcNk4X1zjjI0DrkHP72OEqrnnEGyvjRu8rYKLaaMlMUGNGbYmn5qpQorcGqn
 PWCB6LTMcxLiKjNUcblCYWFW2qRuwjrcfBR5aeaWSIDG0ibgnSY6BqHzezSJryqW8S2s
 dPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwpZITjHgQ8cOpxT8gQYzyXjPVENzbqAFCPuHxyLkQ8=;
 b=JlM+DmqKjsiesNcbScNxL01GGs2mAQa6e52WrkYSghXcehfVb4inkVl5Q9iDiwZUO+
 kz/2eCVOTZAAZ3txmPcnXyte5TxAHVAEq5X/fCSS0IZYgpt3L3CVbKgfvBT/8NhbhEbj
 wcX2rhNN+hMgAdQRZkSsGZHYYmfgZ9N9p/BWYswn5DQckNvMzKdDE4uTNjCbUXciOafV
 ItuhFms/Fhe1lPOL4K2wmEIVfjGtJomWqYvw/temPtEGd6HK3gcgwmO5vR9ssIrxtHW1
 EUDkCkwwVDVRzI0QWOWuQroMm70N0ktDmrIOF1tHsXDaw2F6vjlk+0+uZTe/KaQV2g+S
 1/lQ==
X-Gm-Message-State: ANoB5pnTKttG2wyMoGubU/SiTbzUlt12j2C8f6KvY8aNajklEC3PM4bO
 yvthVVEBvan0vzqegmdJ7uBZgw==
X-Received: by 2002:adf:c64e:0:b0:236:78cd:f3d2 with SMTP id
 u14-20020adfc64e000000b0023678cdf3d2mr20645442wrg.719.1669290642870; 
 Thu, 24 Nov 2022 03:50:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:42 -0800 (PST)
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
Subject: [PATCH for-8.0 11/19] target/nios2: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:14 +0000
Message-Id: <20221124115023.2437291-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: dYH3ZhCovBCK

Convert the nios2 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/cpu.h |  4 ++--
 target/nios2/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f85581ee560..b1a55490747 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -37,7 +37,7 @@ OBJECT_DECLARE_CPU_TYPE(Nios2CPU, Nios2CPUClass, NIOS2_CPU)
 
 /**
  * Nios2CPUClass:
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A Nios2 CPU model.
  */
@@ -47,7 +47,7 @@ struct Nios2CPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TARGET_HAS_ICE 1
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 9a5351bc81d..cff30823dad 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -57,14 +57,16 @@ static bool nios2_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
-static void nios2_cpu_reset(DeviceState *dev)
+static void nios2_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(cpu);
     CPUNios2State *env = &cpu->env;
 
-    ncc->parent_reset(dev);
+    if (ncc->parent_phases.hold) {
+        ncc->parent_phases.hold(obj);
+    }
 
     memset(env->ctrl, 0, sizeof(env->ctrl));
     env->pc = cpu->reset_addr;
@@ -371,11 +373,13 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     Nios2CPUClass *ncc = NIOS2_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, nios2_cpu_realizefn,
                                     &ncc->parent_realize);
     device_class_set_props(dc, nios2_properties);
-    device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, nios2_cpu_reset_hold, NULL,
+                                       &ncc->parent_phases);
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
-- 
2.25.1

