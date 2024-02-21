Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2065474ejb;
        Wed, 21 Feb 2024 09:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDvXTziIwBd7xCeU0SMZcIax0c6LiTflDUykC634Eeh5JQizZoZJ2hHEKF9R3eo5mxKPOoaNzwLVa7YSeRojQS8e+kUdSR
X-Google-Smtp-Source: AGHT+IE80ZpANT12WRvEZiJ0kVB+ietmzCJwMA5cIKX5vLTFziERxpjdlGEJvcQDMYeR0aluG8bJ
X-Received: by 2002:a0c:9c44:0:b0:68f:417a:4767 with SMTP id w4-20020a0c9c44000000b0068f417a4767mr15295166qve.41.1708536854742;
        Wed, 21 Feb 2024 09:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708536854; cv=none;
        d=google.com; s=arc-20160816;
        b=OD7K7XgiUxxZVRxBfsWv2s5QQbnPRoQehJ+YhaDnEMawhD6p6j75H6+sBkLQvfM/of
         xX+p7Hb/qNQmjRYr15mniTRHaEqvGVtJ4NH+E7AEUXRKV6/QktJbpht5WsScPMyWF26o
         bG9ItRX3BPM6hdOKzKtOxGPLyDFI1CuhPt6bTdETo30Bwjnutl+Pt99ZyxUVXERkJ5VN
         oCG6QLdn1zuVcVkUQRek4WsEk3EywkP2g4eDRrM+RtAc0m3xaCHqAwVyyA8knKBzBa4d
         vT/f+OEh6hw21QcDu6SjHYaM8CRK7sEopqRh/Zzu6hfIpfb8SbReCUvwGDWFpDGa7g4F
         B7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=+9+8PfRfulApedC4nlWtcYgUGbJ4o3VdSnLLrjIzEPA=;
        fh=uaa8ks6tMviNJZL+REatm/ZMC9EMp7Ie+hmqE8al1i8=;
        b=f0YBKofMGhUI6hjj1ir9DEpTcSZwhPTwJQmO7jHHPZ2UG7LX8X/mSkOe4xNqHMQd2y
         VIMx7W8gbZMDzeQ0U89Hmj4sXhcE9ZXCQUSuxRD7/B9zV0ZWyyR1GeT9nCUXr4kFjnYq
         sArKuKNTvaF1L5h4U5H2JhiYtJQ4eA7l/2XSGS0FY2r1qXqAx46qzqr/A5S2k9UlhTUA
         WmbiAVITAf2iL+Fj6AmfMzNXlIrHBpq2kUV1ydfPyuDc4/721HHttoYe487YMTnnHDlf
         qbaSfpCN0k4kkqGoECiojMfHKu80siyE/ihzQ+8hPt6dwcXYt1cwWz34kTxvTLB1Ti/7
         bkOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=n3+Zfzpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js5-20020a0562142aa500b0068f480d8aa2si10039218qvb.259.2024.02.21.09.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 09:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=n3+Zfzpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcqTg-00015s-0y; Wed, 21 Feb 2024 12:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37DPWZQwKCOEQDELKHVWHIDQJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--nabihestefan.bounces.google.com>)
 id 1rcqTT-0000t0-91
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:33:44 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37DPWZQwKCOEQDELKHVWHIDQJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--nabihestefan.bounces.google.com>)
 id 1rcqTO-0002TX-Hp
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:33:38 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dcbfe1a42a4so1813848276.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 09:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708536812; x=1709141612; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+9+8PfRfulApedC4nlWtcYgUGbJ4o3VdSnLLrjIzEPA=;
 b=n3+Zfzpn0YSxuUhwDm+sLoF9XwsgVFg922SlmH9AxymcjJtgM+IDlsRh0A+cGuFIzq
 OYbS3fEG0MHIMHnJ9IWxdOM54fCjIYd/gLatxUILoRRvR9QqyOpatkwcfNAqej0gEmW0
 rTDBln5ZPscaarUGIN2dVQCI24SXgGn6w6JIpU8M5I/ysTZRVG9BGp5fcbRjMBhiks+U
 8nc2f/2CMOl5jOrzPiPJHT5BuQuY95waZJaZ6OAowhjABCzG+JKErXQKXVqzo2bzoGJE
 fBL35wf7Jad5TOpFU0gsNrB1itKmKZB6YtMv/k6Nm6rKhDBn9H3/Dp0lAPkLFMoOdowA
 7rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708536812; x=1709141612;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+9+8PfRfulApedC4nlWtcYgUGbJ4o3VdSnLLrjIzEPA=;
 b=NH38zPOSsr2pLaHPPO4O7+lYV8uRSuwTn4EpqPujJGsJeC7+6AEDhTwZEOgkO19oWV
 yfoyNKUHFWYVPacwKHYKeDR+qVcBkvogDxzoevsoMUfVkRrx4+mXWIv58P1Sf7Sx0Rhq
 cEZqQ/PT6CSHvYiNLUBNe3OhW1usy9IgJnmo07oV11CMAVTpeBEeQo7LCvd58B0op1Pa
 WP6jGwuK+JMql5s75HFuFqWWQA9tdjbuwQiPPKQWLIiiwPVwtqnHQC+8ON07BAZu8x64
 b6M1txDiiGpqDFx9UWX0sH+o23pEAy654aI/LdSW7LO76bkjJVVm3W/eZod2jbmrM3I8
 3ceg==
X-Gm-Message-State: AOJu0YxfF5G8FjsiZAvm+SBDSAVL9zMBbAWYqrxDqdi2fj1hQAoN2j+1
 +2ujv025Wde58TCKehrrFWZ65S1NW8dJmmCmTpXHkeGd/wWoTt4b7gk0ADaiE+S9CXYu1LrLnS5
 049cXPFHKbPdm3CYk3LEu1rwFBw==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:840d:0:b0:dc6:519b:5425 with SMTP
 id u13-20020a25840d000000b00dc6519b5425mr5001050ybk.11.1708536812182; Wed, 21
 Feb 2024 09:33:32 -0800 (PST)
Date: Wed, 21 Feb 2024 17:33:25 +0000
In-Reply-To: <20240221173325.1494895-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240221173325.1494895-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221173325.1494895-3-nabihestefan@google.com>
Subject: [PATCH 2/2] hw/intc/arm_gicv3_its: Use send_msi in the
 GITS_TRANSLATER write
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, roqueh@google.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=37DPWZQwKCOEQDELKHVWHIDQJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 7VKF52gfkEVj

From: Roque Arcudia Hernandez <roqueh@google.com>

This is trying to achieve 2 things: To be able to redefine the send_msi in a
derived class of arm_gicv3_its and/or to expose a method call interface to
inject interrupts from another device.

Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/intc/arm_gicv3_its.c                | 20 +++++++++-----------
 include/hw/intc/arm_gicv3_its_common.h | 13 +++++++++++--
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 52e9aca9c6..9342e96be3 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -20,16 +20,6 @@
 #include "qom/object.h"
 #include "qapi/error.h"
 
-typedef struct GICv3ITSClass GICv3ITSClass;
-/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
-DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
-                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
-
-struct GICv3ITSClass {
-    GICv3ITSCommonClass parent_class;
-    ResettablePhases parent_phases;
-};
-
 /*
  * This is an internal enum used to distinguish between LPI triggered
  * via command queue and LPI triggered via gits_translater write.
@@ -1561,7 +1551,8 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
     switch (offset) {
     case GITS_TRANSLATER:
         if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
-            result = do_process_its_cmd(s, attrs.requester_id, data, NONE);
+            GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
+            result = c->send_msi(s, data, attrs.requester_id);
         }
         break;
     default:
@@ -1994,6 +1985,12 @@ static void gicv3_its_reset_hold(Object *obj)
     }
 }
 
+static int gicv3_its_send_msi(GICv3ITSState *s, uint32_t eventid,
+                              uint32_t devid)
+{
+    return do_process_its_cmd(s, devid, eventid, NONE);
+}
+
 static void gicv3_its_post_load(GICv3ITSState *s)
 {
     if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
@@ -2020,6 +2017,7 @@ static void gicv3_its_class_init(ObjectClass *klass, void *data)
     resettable_class_set_parent_phases(rc, NULL, gicv3_its_reset_hold, NULL,
                                        &ic->parent_phases);
     icc->post_load = gicv3_its_post_load;
+    icc->send_msi = gicv3_its_send_msi;
 }
 
 static const TypeInfo gicv3_its_info = {
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index e072c36cca..c81bd0b26e 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -25,8 +25,6 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
 
-#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
-
 #define ITS_CONTROL_SIZE 0x10000
 #define ITS_TRANS_SIZE   0x10000
 #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
@@ -132,4 +130,15 @@ struct GICv3ITSCommonClass {
  */
 const char *its_class_name(void);
 
+#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
+typedef struct GICv3ITSClass GICv3ITSClass;
+/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
+DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
+                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
+
+struct GICv3ITSClass {
+    GICv3ITSCommonClass parent_class;
+    ResettablePhases parent_phases;
+};
+
 #endif
-- 
2.44.0.rc0.258.g7320e95886-goog

