Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3056250ejn;
        Sun, 23 Oct 2022 22:59:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cMJiedyNWBY9qUZ0BYWhRw34tH7CnbSgiVcAM3z6k4ztSLkQc8JBAqrBaJlPig//HpBRe
X-Received: by 2002:a05:620a:31a5:b0:6ee:b0c2:f54 with SMTP id bi37-20020a05620a31a500b006eeb0c20f54mr22014011qkb.69.1666591193162;
        Sun, 23 Oct 2022 22:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666591193; cv=none;
        d=google.com; s=arc-20160816;
        b=F2G3U4tj8sg3ggU5gCCEPApVSCDLr4nmPy3mTua4eghYo+xC8+JTdF6scPlJVR6puX
         oPqa9lRcOPlQ0yMP4us2j+X7mUAJL7wwGQEfP8g6uwPnYEeDv4czOfw4oYs3GF5ryOEy
         oqGCkszw2/DQNlTJfXQ3PB6rl0Q2l90m4cK1KLvxQbamlHj/BiRphPffFkPmmoXgjW4N
         a7NTAT9vhxQQwuxae3kuvG61B1OYsh5xZ/GTDZbQfJI2K2lN8nmjQXhGbngNKmwwOLmA
         pfZ0mHLq/6krh4/B500iCEE1H+7PKlwvxUH/ZZCfLAGZWxUF/qOtwaHSaP+PUJeNpaxx
         6HXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fmhV53NBm0GuAqG7xZExjY3NVZwOXtngOnvaKeyYV/A=;
        b=ARAcxEf+Ji6Bs6IodF7OXMmtOZ3XCpB0+RGM3178/45qXv9MMOD/XsDI2Ln23v4AdM
         VQTu0KZU0oPAuBAuci/u6BeTwlBbbmwQZnUQ3tPa5o1RX+LGSO3DK8JyMRsJy531xZyz
         0QhbvlhmpCIH70w2p5l45zYCUGQYZi8sj2TGKbIkTFE1Y+WJq+08uqTB6dnD4aJJS927
         g0wJvf7rEShCPnv/gLdzcO4PSxaKym/nzbC70sDE5jzVLnRoy/sPwzZo4mow6erjr1Y/
         shcb2+ScO73akg8kafDlUCPzlkpPILZkwhLuu6c5vcHzCq18iNMikVVJCGZ0huzPjhGV
         vL1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hD/hgcLg";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn41-20020a05620a2ae900b006e5e0d15413si15478935qkb.401.2022.10.23.22.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 22:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hD/hgcLg";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompsw-0007dY-Vq; Mon, 24 Oct 2022 01:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompsB-0006ri-0L
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omps8-0002SP-5f
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:38 -0400
Received: by mail-pl1-x629.google.com with SMTP id n7so7600136plp.1
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmhV53NBm0GuAqG7xZExjY3NVZwOXtngOnvaKeyYV/A=;
 b=hD/hgcLgHogKhfFD2gfVE+9DpeWgQyUA2U8XggbR3Znnh+9MJKW6NaFuUJT+0wW+d9
 4BEXWgxI8910oJCPdCHchZzpzBHvTAhUoqaEW0m1ho5AOkNDziLTOtVkAzY2YvcXs2Ae
 /Q1eUl3jS3fIobqhdPRkGtkaYlS0SG8+wWHNtyttf13/JSXAhBLVFb9Ds5KEBer1oWFl
 vc+DB2ZSsBxg1WQ1N/ZgwGvHRCLcXrPVmOME7jC6jZG7IyPupZ+aAzs1Q/zUS+8BbHqH
 UDVsQSbMJ/AYMC3Kk4HphPkahXO5Jgu/suWa/nIrFAzFc5z9p4pg9S++39bU0aFLOMIh
 J59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmhV53NBm0GuAqG7xZExjY3NVZwOXtngOnvaKeyYV/A=;
 b=QZEsWr6A35PQgQFAr5bEeEe8xsa9WaE0pxwIVz4U/lAF7CWyYNXxYvLrKqXZHZTjkF
 t/DzxihZc2VAeyqYBGEnNn/r5QsfdFqZ9MCIsyRRfFjTF9e8Ipp963OpWeK4NaiGlzH/
 RnOT9+Co6PajM6R949ut77jPqnMcbl5hagEr2RKJXlKlrNqSwq2Xx28RDuOmqGphu5Vg
 C5/bKRp60q7NGj8fD5dAoKZir3WuKlwCcgmCEPTFshHXtoQvmLriyDlscjNrbCAewDmD
 z+VXNeLcDh7l2HOY8+M79jF2yCsUyHTrdXdIERN9amMg+YI2imOzVVSaWunE7bqQHLJm
 e5lw==
X-Gm-Message-State: ACrzQf01Sbzcwsi8ZOELmWNSiCPao6ws6+rc2Bu0rLl0O7eoSIwww/6x
 C8DP/9mwWPV1G3qJ/ruy8HEm9aQZOxD+uSxr
X-Received: by 2002:a17:90b:1e0c:b0:20f:bcbf:ab5 with SMTP id
 pg12-20020a17090b1e0c00b0020fbcbf0ab5mr34887522pjb.187.1666588774276; 
 Sun, 23 Oct 2022 22:19:34 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 13/14] target/arm: Implement FEAT_HAFDBS, dirty bit portion
Date: Mon, 24 Oct 2022 15:18:50 +1000
Message-Id: <20221024051851.3074715-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lmMkKc0a9UMd

Perform the atomic update for hardware management of the dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Move the DB update before attributes are extracted and merged.
---
 target/arm/cpu64.c |  2 +-
 target/arm/ptw.c   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fe1369fe96..0732796559 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1165,7 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d9f89b6105..d87757a700 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1463,6 +1463,22 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                 goto do_fault;
             }
         }
+
+        /*
+         * Dirty Bit.
+         * If HD is enabled, pre-emptively set/clear the appropriate AP/S2AP
+         * bit for writeback. The actual write protection test may still be
+         * overridden by tableattrs, to be merged below.
+         */
+        if (param.hd
+            && extract64(descriptor, 51, 1)  /* DBM */
+            && access_type == MMU_DATA_STORE) {
+            if (regime_is_stage2(mmu_idx)) {
+                new_descriptor |= 1ull << 7;    /* set S2AP[1] */
+            } else {
+                new_descriptor &= ~(1ull << 7); /* clear AP[2] */
+            }
+        }
     }
 
     /*
-- 
2.34.1

