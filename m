Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp5000543ejx;
        Thu, 24 Nov 2022 03:56:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64jXpF9ZJrN87TmzE+SHxiWSGNO3tX10HGMOjhxq+4Fs4iGpeg/Rxn4jUiqW5nAJdPEe6R
X-Received: by 2002:ac8:6a01:0:b0:3a5:6047:c75c with SMTP id t1-20020ac86a01000000b003a56047c75cmr29730723qtr.434.1669290973948;
        Thu, 24 Nov 2022 03:56:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290973; cv=none;
        d=google.com; s=arc-20160816;
        b=quofmyxCqtv6y3dCMqEWWcV+D9rlA8Jgqo/nCN3o6srTCQ633wy1DNCpQ1iezbc1k3
         GP4/98OcQWeSYJ+JLsjZfMgFbugYktF3uPOgKPAOdK6K9Bm4Jpv2Ebvq+9pZ6YMrPe16
         C6tgeDoyNLaqzwnZW4i01L9InHtuas70UDNfNZTaZdKHZJ9DWOx4cXsCLlja8tjKtLhx
         BiKJPPZwzs79i2kPVPTkD74r3ZnLJwFiUGnzfs/YssKpU8cByo3es6mrYeKG6NCF1nN4
         jJ6yWxFX9BLvlFGzztCzgbVEpuag1jmPm1OrMkFgtaCb+m68C5QApLD6GuRKzqPN10AD
         MoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+6WeqXETEAN/JcQ5LzZg6NwphS26sTdkAogbV0qOYE4=;
        b=gOOsZiVSFzKwRz/Ql23JOZlh7Sz3AKslDr8frmLMER91zcC2OZ4MIc3YvfUKioDv7M
         DVZQvQJmYLuxS9b6bbcrlIDEeyyy9E57g70IYXU52MFiUm/6cLNvjYCVhjdkElBK3Jrq
         owecaxG9QZqhDD5O/xHHkIaDZc2sThcdg08nyXDDwaGVIYnWnKIJbK9nJifruK6Tth12
         3eyWM7tgRCFAGgIv4leAa0iape/a/hczpvkNlW+1sqrU4nooRIuL5/kERbe3EIFNNU2n
         6PzUtrsFC8BRPUM6jqZygtVTBhBXt2dpLfdyHcBm0pcoBI9lZraohHL799tcB9J1OIam
         /Xog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rwRVagaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5-20020a05620a290500b006f9f6aff5c3si619588qkp.473.2022.11.24.03.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:56:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rwRVagaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyAkq-0003lM-FH; Thu, 24 Nov 2022 06:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkY-0003VQ-3h
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:41 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkT-0004qk-Ds
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:37 -0500
Received: by mail-wm1-x332.google.com with SMTP id t1so1117169wmi.4
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 03:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6WeqXETEAN/JcQ5LzZg6NwphS26sTdkAogbV0qOYE4=;
 b=rwRVagaBLVz6jP/hsd7gDhmw4fr2FJ9MF3b1SaUrsyVjHlkg8DvPxh0PziMvz+wiTF
 ifosIa4hC0XFMhEMA5bvvP7bnmsR+GLasGAuNSZgExMGe+OVn+ZQWMBESx1wg5Eesj4F
 z+VsVrEmtUu1XoLR+XqK5RvA71Z2eDyKzINZfWOjZAIbapFtl6HwxTDc4Vp+cA6LFH2M
 v4qxIScGBgKoBJKv1UVxng4R4uLmwRIy9t4xZJAVYh19GifXwhitqkvzwVEc4vX+8jTK
 b3XSlIDKFEaVBS4sCXcIFIzLuPRolC++6YCFSvbRcm9+Z7vdyGWQ6NJ308GXHvR6kIET
 PAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6WeqXETEAN/JcQ5LzZg6NwphS26sTdkAogbV0qOYE4=;
 b=cU2Ibd6J0rags8WJHPWYejw1O0WBdTESbRLJQnrsXrsp4A/N3vkeW2zUSm2djNDJOq
 gJrQ2soeFv4uRGC7jl0m24+LWUf6oOhjKorU5y/B5xOrZSqXQoYqprgCJ0RmzhW9G9no
 /wjAhUeSwAP6PuhsOkTeVjLKI5Pq2f7zOJkaorPBWgScyB2TS0BfkvRrBWHvMZcDCLW1
 i7KBOPxfdaLmjN2/YclnDstEW8Iol6Pv3AfYb0TXobXTxr5xwrFqr3/Jx2WIWWRVtFQ+
 L5uvuDbpH2UFgwCXiTya8780EsoB2UDdeqSexK3+drraraw0OyNKurEa+vcqWuWMqMmB
 1Mpg==
X-Gm-Message-State: ANoB5pn5yuJ3hWfwyHC19IVFTOU3Ads5tu/FfOt1UauI1Rk1k7PpnoHj
 0VhXJjI/QBJuyUuxProUs0kL2Q==
X-Received: by 2002:a1c:7c01:0:b0:3b3:3256:647 with SMTP id
 x1-20020a1c7c01000000b003b332560647mr9510555wmc.197.1669290630701; 
 Thu, 24 Nov 2022 03:50:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:30 -0800 (PST)
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
Subject: [PATCH for-8.0 03/19] target/avr: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:06 +0000
Message-Id: <20221124115023.2437291-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: FlTPrSjiVJQt

Convert the avr CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/avr/cpu-qom.h |  4 ++--
 target/avr/cpu.c     | 13 +++++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index b5c3507d6d7..01ea5f160b6 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -31,7 +31,7 @@ OBJECT_DECLARE_CPU_TYPE(AVRCPU, AVRCPUClass, AVR_CPU)
 /**
  *  AVRCPUClass:
  *  @parent_realize: The parent class' realize handler.
- *  @parent_reset: The parent class' reset handler.
+ *  @parent_phases: The parent class' reset phase handlers.
  *
  *  A AVR CPU model.
  */
@@ -40,7 +40,7 @@ struct AVRCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index c7295b488d1..d0139804b9f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -67,14 +67,16 @@ static void avr_restore_state_to_opc(CPUState *cs,
     env->pc_w = data[0];
 }
 
-static void avr_cpu_reset(DeviceState *ds)
+static void avr_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(ds);
+    CPUState *cs = CPU(obj);
     AVRCPU *cpu = AVR_CPU(cs);
     AVRCPUClass *mcc = AVR_CPU_GET_CLASS(cpu);
     CPUAVRState *env = &cpu->env;
 
-    mcc->parent_reset(ds);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     env->pc_w = 0;
     env->sregI = 1;
@@ -223,9 +225,12 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, avr_cpu_realizefn, &mcc->parent_realize);
-    device_class_set_parent_reset(dc, avr_cpu_reset, &mcc->parent_reset);
+
+    resettable_class_set_parent_phases(rc, NULL, avr_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-- 
2.25.1

