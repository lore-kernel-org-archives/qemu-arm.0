Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2613655ejb;
        Wed, 24 May 2023 08:00:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UB9hC8jyg/Cm0O8XHHwayGDG9pi6fjK7Dvr+1rF1quc/C9RCi4SRGfO5YvLPiLGRStBfY
X-Received: by 2002:a05:620a:29c4:b0:75b:330a:a6c9 with SMTP id s4-20020a05620a29c400b0075b330aa6c9mr6525206qkp.40.1684940427026;
        Wed, 24 May 2023 08:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940426; cv=none;
        d=google.com; s=arc-20160816;
        b=JDPRCEhgO48MMyHhjJ79AdiJlj043ULHdNBbQgdSgQwunhVGysl3UCS8lqsy/9e43U
         b7jHc1PYLxrKr30s6FDtlaffrNbeNKI57OLajuogIZq3td57ijRLceOqIJ+fOWiIOrNQ
         bPInNYU2W/uqPlqu1k4hu8yr+oAKKjvyhC7PEfTUpcQxfgtZTV1N2UfDdVg2H2v7B+wx
         loKDITbBr4/gHjOvuStFgow0hOJtATItMOBCakdvMpVt51s454uK9+UK9F8wk8HG/yZi
         sYSYSotpCoUALlpo6NKDplIuTbWshgmNKTV4vl3NfsNHkn6NPmJQFwoy5O0O7kckf2iH
         pVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=50SL7zbNGl/fD7oTGtJ8qBrDyfPUgCnUWKs/hQwlad4=;
        b=M2TaG7vPAnXJxqEyMaBb482gXP7HVptgpMk8/t2xO1wlM8/voPIXwQZPnCfzrLZsn/
         C/370RKG8cZ95IryQ5bHWmHS+BAuZ+fEXWIEPNBCaHUT0nNFbJHHXDM7+QYc+xtZjJ4w
         hRJ4dlh1c3W9YTqcfzPjnWaW+zbtpTaP+lfwelVkfCS2a3tdR/maLRoU3gdfAZ1XdnnM
         5hOKVxjeWOTqyYPNoK4X8cfhjxYcMbExIOZG4CCkQqKuHF/SM/RrLem52f/gKhjosLAz
         KXJVHib2hrI4UWy4COW1i4W+3j8q8z3XxjY+6u/NBUCuNrX+dYgphFxbwRNOoUUKX5MI
         DCXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NP0MhVp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a37c44d000000b00757da616db3si6273730qkm.232.2023.05.24.08.00.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 08:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NP0MhVp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pxn-0006No-6R; Wed, 24 May 2023 10:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1pxc-0006Hm-Gx
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:32 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1pxZ-0006Mw-Pf
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:32 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3094910b150so943862f8f.0
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940365; x=1687532365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50SL7zbNGl/fD7oTGtJ8qBrDyfPUgCnUWKs/hQwlad4=;
 b=NP0MhVp96M6zkPmX0TGWKygB31Bd/ybIuSWwGmRVrkhPSHTg9+mpoiBof0mDbwlaYq
 T+HDIO+jixPETamR3yEt8XXovaZ+PtGlOqF5BBf1eiqdadY2V2+Ebc+y2R/Hal1Zua//
 HXyq86MTGAPh+dIXlcg+oFB+0Gl8knr0ysZencIGWOThoBWv8Rjg7td8k9U5xTK8mLKR
 9VWGibobVKNpJuxJk+QQLl0sY2z7cxanCXEin3+ojkcZwl0iMoYBoaG9l1ewfx96lf7n
 1nGdLmpEyuZfA4Edy1o1/JReOhR64hY6qmNDx3dPvKZVmpam0DUuyx4A8bb9rTtXuxtc
 xCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940365; x=1687532365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50SL7zbNGl/fD7oTGtJ8qBrDyfPUgCnUWKs/hQwlad4=;
 b=cJW3sKrYYqCdw+krXG2jxNl4wxHF3NbU0jbQbbqcEjV85j2pBk+hFoU4LgfXcwLdSH
 ysF6fKWdTEd59Fl881t95K1M9X3fEo60e0kcw0NlDMKTJ89ZBfI+1NFqJbxBkf3BEJpv
 HzGJQJKkdKiSf1UUPulddfxUhC7emUsjZPXlPERnosgBzdOrQTgH9Z8gG1d/iGf5ozxd
 gOKqXZazZsrY+e3HGifEw4DKy/j2OnA/DnFtEi35tG8fijww+7OwlhI4YNC8NX7p6WJA
 s2ZoCOyrtDArZW4Gojdy9p5pe/ybKRC6Sjar0FpnRq1dJN/bY6taFrN9+YHp/2ImWV5L
 nSBw==
X-Gm-Message-State: AC+VfDw4lVLqaQFycVuzt7on/5VcMa1xC/jhgVDk7CwW0tBl2gyy1qXu
 QUMVaVB67/2hfJZ3ppMok3CgYw==
X-Received: by 2002:a5d:5002:0:b0:2f6:bf04:c8cc with SMTP id
 e2-20020a5d5002000000b002f6bf04c8ccmr27678wrt.55.1684940365713; 
 Wed, 24 May 2023 07:59:25 -0700 (PDT)
Received: from localhost.localdomain
 (fac34-h02-176-184-31-193.dsl.sta.abo.bbox.fr. [176.184.31.193])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4001000000b003062ad45243sm14826928wrp.14.2023.05.24.07.59.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 May 2023 07:59:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/10] hw/arm/realview: Introduce abstract RealviewMachineClass
Date: Wed, 24 May 2023 16:58:59 +0200
Message-Id: <20230524145906.33156-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230524145906.33156-1-philmd@linaro.org>
References: <20230524145906.33156-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: l+9kwcoMDB4X

Introduce the abstract QOM TYPE_REALVIEW_MACHINE to
handle fields common to all Realview machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/realview.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 07a80d0de3..f0a8a93b08 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -30,6 +30,15 @@
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/sd/sd.h"
 
+struct RealviewMachineClass {
+    MachineClass parent_obj;
+};
+typedef struct RealviewMachineClass RealviewMachineClass;
+
+#define TYPE_REALVIEW_MACHINE   MACHINE_TYPE_NAME("realview-common")
+DECLARE_CLASS_CHECKERS(RealviewMachineClass,
+                       REALVIEW_MACHINE, TYPE_REALVIEW_MACHINE)
+
 #define SMP_BOOT_ADDR 0xe0000000
 #define SMP_BOOTREG_ADDR 0x10000030
 
@@ -448,20 +457,25 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
 static const TypeInfo realview_machine_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("realview-eb"),
-        .parent         = TYPE_MACHINE,
+        .parent         = TYPE_REALVIEW_MACHINE,
         .class_init     = realview_eb_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("realview-eb-mpcore"),
-        .parent         = TYPE_MACHINE,
+        .parent         = TYPE_REALVIEW_MACHINE,
         .class_init     = realview_eb_mpcore_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("realview-pb-a8"),
-        .parent         = TYPE_MACHINE,
+        .parent         = TYPE_REALVIEW_MACHINE,
         .class_init     = realview_pb_a8_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("realview-pbx-a9"),
-        .parent         = TYPE_MACHINE,
+        .parent         = TYPE_REALVIEW_MACHINE,
         .class_init     = realview_pbx_a9_class_init,
+    }, {
+        .name           = TYPE_REALVIEW_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .class_size     = sizeof(RealviewMachineClass),
+        .abstract       = true,
     }
 };
 
-- 
2.38.1

