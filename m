Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp70017lfp;
        Wed, 13 Jul 2022 00:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vs6D+tZ+XfcWdZDn5tSo+VzHOST461NMh/cQNmbOid8n918ICb5CD8cvPtk3wGHuosO+ix
X-Received: by 2002:a05:622a:14c8:b0:31e:c5a1:8fc2 with SMTP id u8-20020a05622a14c800b0031ec5a18fc2mr1700711qtx.591.1657699061996;
        Wed, 13 Jul 2022 00:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657699061; cv=none;
        d=google.com; s=arc-20160816;
        b=xozmM8sQXDs0pFttPQoPt/k+uT+pvqGsqUzF8nHi0TPUbdIADF/yDQFOHt85geCYB3
         TVamk3tHQ2b/ny3YIa8w7fK60LvHN+xAgMurRD0q6XsiW6iN4rj/XEm4fZt2+zoSu0nF
         WQZt5SzR93L4acSDMITbP+JeqOyb3tCbP8LLWXHCOk+QBg/0g+l1ocWtiNQv7eGkMKFr
         nGMCFxtpnMjWvB8PUwe5lrgTKOc9wt+GabPQ57PlXFzVxStfhfSUKnlBN1Dz3GsuCf8A
         Nf/I4pexQSMVFkny4jtAtFtZBun84IgXUfKINfpbYl6aPLWo3jRkXMtMZWcXT+zB7Gp2
         bGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=g7hmlXbqNtMhzRTUQ+OON2td4T8iglD3RIS1UcsPu+c=;
        b=fn65nn7UedGRkm7CR156twrDn1p9RQTUV+YOuKJwq7Ctx/t335WQ3sSo8Xn8GCSpO6
         Y/gTFCnur5axNlGmdNdO+Vraoj7r8WfjwdDhJlgVR1BalrmHlDxanTtrdGVi8RzIbopN
         7D3ClUB2BvzgXPSdDmogBgmiFaB+eaRPUP4drq3njFhMj7MyUzUqayAierjhWizMHP1L
         rw36JEjxKropEkWgna+CF4gkg3N+xrKU/4STaWR81n+9WiDYMgoVmKNQx0ZfsjK3QQk6
         b/CQpZlEJkiZ1tLxKlANaL9+uMWxFrCn5FWCYi4tpTaqxJurMC2hmT5buzZzO/pdh/Ej
         EK7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020ac85b8d000000b0031e79963769si105686qta.461.2022.07.13.00.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 00:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXFd-0005LA-Ge
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 03:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBN-0007rn-Ld; Wed, 13 Jul 2022 03:53:17 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBL-0002XP-Rm; Wed, 13 Jul 2022 03:53:17 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVGw4HBBz4ySl;
 Wed, 13 Jul 2022 17:53:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVGt1wlJz4ySW;
 Wed, 13 Jul 2022 17:53:10 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>, Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/19] hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
Date: Wed, 13 Jul 2022 09:52:39 +0200
Message-Id: <20220713075255.2248923-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o2FZBouG1EuT

From: Peter Delevoryas <pdel@fb.com>

This commit adds a passthrough for PMBUS_IC_DEVICE_ID to allow Renesas
voltage regulators to return the integrated circuit device ID if they
would like to.

The behavior is very device specific, so it hasn't been added to the
general PMBUS model. Additionally, if the device ID hasn't been set,
then the voltage regulator will respond with the error byte value.  The
guest error message will change slightly for IC_DEVICE_ID with this
commit.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Message-Id: <20220701000626.77395-3-me@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/sensor/isl_pmbus_vr.h |  5 +++++
 hw/sensor/isl_pmbus_vr.c         | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
index 3e47ff7e48d8..aa2c2767df90 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -12,12 +12,17 @@
 #include "hw/i2c/pmbus_device.h"
 #include "qom/object.h"
 
+#define TYPE_ISL69259   "isl69259"
 #define TYPE_ISL69260   "isl69260"
 #define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
+#define ISL_MAX_IC_DEVICE_ID_LEN 16
 
 struct ISLState {
     PMBusDevice parent;
+
+    uint8_t ic_device_id[ISL_MAX_IC_DEVICE_ID_LEN];
+    uint8_t ic_device_id_len;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(ISLState, ISL69260)
diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index e11e0288840d..799ea9d89edb 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -15,6 +15,18 @@
 
 static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
 {
+    ISLState *s = ISL69260(pmdev);
+
+    switch (pmdev->code) {
+    case PMBUS_IC_DEVICE_ID:
+        if (!s->ic_device_id_len) {
+            break;
+        }
+        pmbus_send(pmdev, s->ic_device_id, s->ic_device_id_len);
+        pmbus_idle(pmdev);
+        return 0;
+    }
+
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: reading from unsupported register: 0x%02x\n",
                   __func__, pmdev->code);
-- 
2.35.3

