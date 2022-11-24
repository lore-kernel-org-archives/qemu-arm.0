Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4998148ejx;
        Thu, 24 Nov 2022 03:52:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5B4Bfe36ytTBmh9gwmzjEiPz9ZwyN53WldaZe/Oi2WQH/nwKIvTnXGs2ke9niBhMnB42fQ
X-Received: by 2002:a05:620a:4590:b0:6fa:3b2b:1da3 with SMTP id bp16-20020a05620a459000b006fa3b2b1da3mr28681252qkb.166.1669290723033;
        Thu, 24 Nov 2022 03:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669290723; cv=none;
        d=google.com; s=arc-20160816;
        b=NhHksAYLw8z0Iog7NdMwxtQYNasRCqXoYE5yrOAzCfNQj3flzyfz8e8lhAdMweWfqr
         DmruRKp+k1Ch1JY33WfGv3DjK/khas+z9rYDEMxjqdTQnIn+/rZOFlQM849Jce23dzZk
         hus8Jl5P3tRUIxSANL8dc1fG0PmOY1jTAmw+/d9vh+RIePn7z0m504KHHZO+FlUolgrV
         D73CgJLrNfT7YVs/eOsPbSsfsIDDCFbcdNhyRdxfvNqGEJqvGiq1ZF/mB6qsjrjl1N5/
         Twn+BNu/bFzPQSfKO4p3CE/abzXnBovT61SiJDHzscCaotRCLG+uAIL57T2GAesZ4vod
         8ZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZpPOhWgTJeRtGlJ/Bb9mJkWWu83x48fPXZ9qUrHHGz0=;
        b=yGT6LilH2nMqbuHi1IRC3WGAFtyhYZUvW6CIFiVA/DtO6oPluIqn51x1XyzlVGd+M6
         NLvRnP9rmbsuJv7689SF5h/NZN2lz+kaXG3YAowGcI/ZihC5UZDZIsdf4k9yhztOXe4O
         l5JqJsMYjvCMyv3JeZLqftsV7Rd/KQO3ceEGiNKdLJUT1MGsPTXaB7TbIW2axkkShHQQ
         A9PACM80ewflWjlc3Dh+AETh8Hgeyxe054ttagwgVidE213lPWlQ1guRWo327zbm+rH0
         Dq4id8C6Zd8mG5eEYNaxKBFFRmvupTiZcxOWISGSy0cE+Rj5X8FO3MjwXbOy1KCiJkuv
         z9nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBQx5v8N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25-20020ac84619000000b003a4f6a56710si453231qtn.615.2022.11.24.03.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 03:52:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBQx5v8N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyAlB-0004P3-GH; Thu, 24 Nov 2022 06:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAks-0003s7-LL
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:59 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkm-0004wF-9D
 for qemu-arm@nongnu.org; Thu, 24 Nov 2022 06:50:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id x5so2122297wrt.7
 for <qemu-arm@nongnu.org>; Thu, 24 Nov 2022 03:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpPOhWgTJeRtGlJ/Bb9mJkWWu83x48fPXZ9qUrHHGz0=;
 b=RBQx5v8NdoZVOHTk82/TeT0jLfN8OFur+hGOOdDp70zHx09Vu9fTBYXEo6BblxdzQp
 X6nxWJ0CYHaAIy0KTq8U5BV226hVzPVgAXLbqqPGqM3h2PxCp6eMmgdRCHm9jt/JHgXB
 exIFC+goYjYzJTs6MvAjq2/U0TuT9uYDx72PaF+PyVMusn4XcnkdCGD9DZsgZVn804PC
 8jkrJKKFzBHMelvclFxnLPJAGkBd1Kk0kM6MC9/Ib8bRKP4x29tAVxcnPnp7BSUEUqLy
 BYRqGyC7q0WPWJOVe0rC3qJUbOOqYoQnCeHXxrdVSk7eME1nnfjISaaqy/RVR4uWEXZq
 Q61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZpPOhWgTJeRtGlJ/Bb9mJkWWu83x48fPXZ9qUrHHGz0=;
 b=OgL+Thi/YWyz5is0uWM8bPuc+qin3W3U2FVk5S4EIocNVnFX6nQdlTCoxF4Of3upPj
 05AXLr5BU/4JuddM/VpbwMT5L25Hc1Vp6MkcJFjOrQ+GFrN9aI4h8Uz0CerHJrCcg+l4
 lfnBh3DgILxDKnsGsM7sCSKZVtcjAFr5jsYgo/QSWTwlFYzEKeY1Yh5nII+SrJnPITvP
 W8kGkh2VzFUOzoU9EhCfWB6Jx7+i4C40u2/FCQu6f/dFztG81II7XJj0MNwU/CIinXKb
 Oho22sZ7X4/lGxOKbaLwgAlbBWffxokUXDnrFBJmOjjvJJEKjfDPJJLIgSzG5hQqluqu
 FX6A==
X-Gm-Message-State: ANoB5pkzYPJF7fdm6gGbjEliekG4eOS0tvX8lxmJjzlSrO4DA+Ajbfqr
 v+Vm9wuUAThcL/ghki6zl7TXTQ==
X-Received: by 2002:a05:6000:78d:b0:22e:3d63:80bc with SMTP id
 bu13-20020a056000078d00b0022e3d6380bcmr20933017wrb.30.1669290651334; 
 Thu, 24 Nov 2022 03:50:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:50 -0800 (PST)
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
Subject: [PATCH for-8.0 17/19] target/sparc: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:20 +0000
Message-Id: <20221124115023.2437291-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: Ti7BTTdZYVlp

Convert the sparc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/cpu-qom.h |  4 ++--
 target/sparc/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index 86ed37d9333..78bf00b9a23 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -35,7 +35,7 @@ typedef struct sparc_def_t sparc_def_t;
 /**
  * SPARCCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A SPARC CPU model.
  */
@@ -45,7 +45,7 @@ struct SPARCCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
     sparc_def_t *cpu_def;
 };
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 4c3d08a8751..1734ef8dc6b 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -28,14 +28,16 @@
 
 //#define DEBUG_FEATURES
 
-static void sparc_cpu_reset(DeviceState *dev)
+static void sparc_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     SPARCCPU *cpu = SPARC_CPU(s);
     SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(cpu);
     CPUSPARCState *env = &cpu->env;
 
-    scc->parent_reset(dev);
+    if (scc->parent_phases.hold) {
+        scc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUSPARCState, end_reset_fields));
     env->cwp = 0;
@@ -889,12 +891,14 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, sparc_cpu_realizefn,
                                     &scc->parent_realize);
     device_class_set_props(dc, sparc_cpu_properties);
 
-    device_class_set_parent_reset(dc, sparc_cpu_reset, &scc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, sparc_cpu_reset_hold, NULL,
+                                       &scc->parent_phases);
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-- 
2.25.1

