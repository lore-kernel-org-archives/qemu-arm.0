Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FAFC88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:02:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x697e-0004IK-9w; Mon, 14 Sep 2026 12:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696j-0003FT-5t
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:39 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696g-0004eM-73
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:36 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f91so1188359f8f.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789401632; x=1790006432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=kkXdxdxtkGFvjB+esa9le+MPJYdqX0voNJcK0mIKJXQ=;
 b=Y6sflanwI2dM9X9aBUOkpEjHjEdvhmPKEu4CfBgblQ61QVa1c69ciVvhHUxUXFqErt
 zhpzARdVTilxi0JpCuqIcSL6XqjDda/kom8Rby0BKyk7yTc5ElyMuyoee4+aT1VhObyo
 2+AaBOqDzEiIjFhEsgksd6EhE88fsipux3AEU0IUonFna4YKdf2pa56H+UfjhoBQ1QGL
 qx8fVtlqp4dzygeBS9X9TFW191QpVG0wSvke6Z/AIr2ha+OxaxVwPSom5MdhYaO1rzpx
 eJND8htcVn5PviohwrE+K9H8F9n9UG5DzxcEpnXStX0PM2RiWJO9sF2vYYUY+iCglrUe
 WM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401632; x=1790006432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=kkXdxdxtkGFvjB+esa9le+MPJYdqX0voNJcK0mIKJXQ=;
 b=YN84UWleZa5xMnNDf7dO2nhwapAQwX0UV53SRAD43ZCkKUGzRYzJCmV6jB0oA3LV5Q
 MPPMfmBmrx9HEZA/W9MY4mOO7j49eJrvP3FJvejOHbriSmr1HTy1pYxEeeop5mWjB/Fv
 8rQvwdbJ9Nu+2v6ch5xzthrQcjw6vkd/yQZKU9YJp82JGoyK+G/LmsLskTHkhlOaUHnk
 mazCP5Lq/b1M35D1M64GN5heNjEx+q99vEFT8AadJywcMdvZ0Kyhq4fbBgsxqVHnR87q
 m6IpY2RRUBRaoMIp0xvz37Arfk1K/Ml6zAvxfC2i9OOyekfgaamhUcamH/meWlC8bIK2
 OlCg==
X-Gm-Message-State: AFuF++lwjnXgHaDW/MGcqDmKWjUbXCBfONqZEMvqBV2YVtPesFmwKKqV
 WANmAGatEZWva1XfZ5Kfl2qaVug2dcmAbz46cxr2LtcaNqQNUFXfSU4OhMaH028kbqmzUAZWyeM
 0evy6NOA=
X-Gm-Gg: AYBFou3KQNRL7a3tsvdHLybv4FyA1iLELBjjIDnOSOdAsf7Ld+ZzF/NvtYN8EZs6vIp
 +eqxgg+eWbUl7p6dBqqHPMLpEqr9d7+nXsQYSNgNyaFGYQ5PFvnqSgxlHGEjem8JgV2GkOmMhJ0
 k69oj0OWYTTAmCS4FHkCMnqgjDyKNIZkd9gI63MI01oq29lYVwa6Kq7F2nEFEJoABrvaNPwDd5B
 7BprutFRpvJwNU47jsQdFtc5CyzDPNnr96r5sHyKZ7YiDW06bIg/2Rvon/OIK1E9Z/h912q8kDC
 zfMDlXc/cgS8wHrMJSCCxVpO3BDt2PJHvBo6ZtjQ27wNOrPtyrWLXWZ7lsKVdkyOU6MfLBGW+9o
 WncGv+foLiQu5Lz0M/pXZNuUMji8gAiKnlYrag26WGPc2fyoq9KXXcsTTiuHgnumtmgB2F00HVG
 +5wCG3bNJ0fUmj5RzgNCphErpNHzukxoNiqvC/DPRYx7lfrWQcP6OBp6OCINhHu40fRWoA6AY3E
 Y2jJuoFW+Wi7XxHb8nbZtNOplH93Lhw1QPkxcdd0ILccgLex2DOI670RzAL+aWDcOZREx1rjgSz
 mv5d
X-Received: by 2002:a05:6000:4811:b0:487:210:ce1a with SMTP id
 ffacd0b85a97d-48702a9a3f3mr3944754f8f.1.1789401628366; 
 Mon, 14 Sep 2026 09:00:28 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm30797695f8f.27.2026.09.14.09.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 09:00:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] hw/intc/arm_gicv5: Free memory in finalize
Date: Mon, 14 Sep 2026 17:00:16 +0100
Message-ID: <20260914160020.327787-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914160020.327787-1-peter.maydell@linaro.org>
References: <20260914160020.327787-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr2-x10.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The GICv5 allocates memory and creates hashtables during realize and
as part of its operation.  Free those resources in finalize.

Since the GICv5 is created at QEMU startup and remains in existence
for the lifetime of the process, this isn't an in-practice leak,
only a theoretical one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c        | 11 +++++++++++
 hw/intc/arm_gicv5_common.c |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index c6914f7310c..6b72870439b 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1970,6 +1970,17 @@ static void gicv5_init(Object *obj)
 
 static void gicv5_finalize(Object *obj)
 {
+    GICv5 *s = ARM_GICV5(obj);
+
+    for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
+        GHashTable *ht = s->phys_lpi_config[i].lpi_cache;
+
+        if (ht) {
+            g_hash_table_destroy(ht);
+        }
+
+        g_free(s->hppi[i]);
+    }
 }
 
 static void gicv5_class_init(ObjectClass *oc, const void *data)
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index b155486af65..cc67246686e 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -112,6 +112,9 @@ static void gicv5_common_init(Object *obj)
 
 static void gicv5_common_finalize(Object *obj)
 {
+    GICv5Common *cs = ARM_GICV5_COMMON(obj);
+
+    g_free(cs->spi);
 }
 
 static void gicv5_common_realize(DeviceState *dev, Error **errp)
-- 
2.43.0


