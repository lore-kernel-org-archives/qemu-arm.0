Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BD610ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:19:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65C3-0006oK-Rq; Fri, 27 Mar 2026 07:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bz-0006iH-Et
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bx-0007zR-FM
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso18878305e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610248; x=1775215048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQqxa14v3renxWrOIrZAagAxupwiwJNPXfLs7FV9EOg=;
 b=Ep18Gnv744/TVtSI2p2bz6rYvniQgUpi01ckgzakRIieMlhAXV7LGqL7kwlapiA4XX
 hRWaU8ZZVwBOpZuEWstNhleNo0FcES7D90nFtKIf3FkAXoF6Jeam7jPG1irT+iacmohy
 hEzcbUzPdCLQvfemCUVbh+iMRwe8k5va0VlnucyLfOVd9rWsh3pU9oSKUVfSOzWYJRpt
 kqO/1nbx+/aGQQmCZWnHDvjpLs1to4ueeVwvLJ4LQh8gb1XrOKaicqP5/UXzdcwQzfC+
 bh2NuxBCtEd8HJyuQ8cBRJUOE8Pi3kPrbyzG+DBqPdUcqMonq/vcshx6kD7FrvOkczBl
 em6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610248; x=1775215048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aQqxa14v3renxWrOIrZAagAxupwiwJNPXfLs7FV9EOg=;
 b=hS3eiY3qGxneKmdby6RruHGaocKSEQbp6qFQ/tf8kkpdLrkO+GnbDsuqgt3CzCFIyS
 F3vKKkhdEAOlprHxsGlgfuJkJ3IFJGXATWiEeNrtG/yGCyml7eLkBrwv0eSr6yNi6gwX
 8AirIRiwb0awVgK132A+Zw3AccQ7ef2W9j5W4HyfWb8JC8fVHzax2U1X2PQpt+59PfJd
 cFhNj5PbhbYJwFjKzCcTJBzBEqLkW1AeqoLCT8m9dx0FCPhUC5hCj8UjZP+DKDQtFzX1
 P24zjgDeZ5RN/K0szuBaRtNxJcPGB81/Fh78VosvwZfAXGZSEoqLadRyZAV+ESqwoH+a
 SWMg==
X-Gm-Message-State: AOJu0Yww3ZlA7L/6ngol3kWAnXbnplocW20NVaIzAYQyoSG97byLRFR7
 7CYwDxA6+LXTnFmYhqC+CO0r8Us0Y0QcgJ0DEwsI+z/zLSgZQW6eweJMfiyd8c7VFOLC5jQIDkl
 LjxwpbE0=
X-Gm-Gg: ATEYQzz3uTnLibnV3bUuonIUPLDs9Go/GkTFWfffn24eOI+HBZHJ2wU77cDewFKi0Te
 JiiEHTDK2PdSNZvZZIDM4n6ulLoCCYmsWklHm+kWnJekNFNutCpdQw1aNCZXLHY3Du0dGsT7HQZ
 hGgYIwoqjdGFwwaVQyCxYubnOBz0fNpu1/WCyY5fFWHD6376A5r0beG0KXjDOMSFNw30Lbm25pH
 0rdOnGnRdnBDfw5sCj9XcX3DZg+rMa/923g804mBWIVY/Z9jQIdRw/7oVQiOKF1shyBOxZw+CX4
 NeGGVQb5nt10RIn6w9m5NIgHZDlf3VPbOegn/6w+BsOHlGKzrCFbC6JtrGoB5op6RiSxPe7cBn6
 +9RhbK/VjJVNPWr4Px8eRYMa8qKTOIHNDx/pcABej9OR3HGuCKuSeCLS/yGfacqtt6mMtGv8gdm
 TCYplPaT5odELk3olJQlmqIj6VQ6pyvI3XVtIXpdpPoYLBJuj6fB4HsWq/dGxu8HeUwa2wa+EJL
 xf00e/zUxLJwoGSKdAss26cn9tJZrA=
X-Received: by 2002:a05:600c:c089:b0:485:3e00:944a with SMTP id
 5b1f17b1804b1-48729109d76mr21662295e9.9.1774610247939; 
 Fri, 27 Mar 2026 04:17:27 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 27/65] hw/intc/arm_gicv5: Implement IRS_SPI_{SELR, STATUSR,
 CFGR, DOMAINR}
Date: Fri, 27 Mar 2026 11:16:22 +0000
Message-ID: <20260327111700.795099-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Implement the IRS registers IRS_SPI_{SELR,STATUSR,CFGR,DOMAINR} which
form the config access for setting the trigger mode and domain of an
SPI.  The way these work is that the guest writes the ID of the
interrupt it wants to configure to IRS_SPI_SELR, and then it can read
and write the trigger mode of that SPI via IRS_SPI_CFGR and the
domain via IRS_SPI_DOMAINR.  IRS_SPI_STATUSR has a bit to indicate
whether the SPI is valid, and the usual IDLE bit to allow for
non-instantaneous updates (which QEMU doesn't do).

Since the only domain which can configure the domain of an SPI is EL3
and our initial implementation is NS-only, technically the DOMAINR
handling is unused code.  However it is straightforward, being almost
the same as the CFGR handling, and we'll need it later on.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5.c                | 68 ++++++++++++++++++++++++++++++
 hw/intc/arm_gicv5_common.c         |  9 ++++
 include/hw/intc/arm_gicv5_common.h |  1 +
 3 files changed, 78 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 04d4391ae5..6ff3a79745 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -310,6 +310,22 @@ FIELD(ICSR, HM, 5, 1)
 FIELD(ICSR, PRIORITY, 11, 5)
 FIELD(ICSR, IAFFID, 32, 16)
 
+static GICv5SPIState *spi_for_selr(GICv5Common *cs, GICv5Domain domain)
+{
+    /*
+     * If the IRS_SPI_SELR value specifies an SPI that can be managed in
+     * this domain, return a pointer to its GICv5SPIState; otherwise
+     * return NULL.
+     */
+    uint32_t id = FIELD_EX32(cs->irs_spi_selr[domain], IRS_SPI_SELR, ID);
+    GICv5SPIState *spi = gicv5_raw_spi_state(cs, id);
+
+    if (spi && (domain == GICV5_ID_EL3 || domain == spi->domain)) {
+        return spi;
+    }
+    return NULL;
+}
+
 static MemTxAttrs irs_txattrs(GICv5Common *cs, GICv5Domain domain)
 {
     /*
@@ -1010,6 +1026,38 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_IST_CFGR:
         *data = cs->irs_ist_cfgr[domain];
         return true;
+
+    case A_IRS_SPI_STATUSR:
+        /*
+         * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
+         * instantaneously, so the guest can never see the IDLE bit as 0.
+         */
+        v = FIELD_DP32(v, IRS_SPI_STATUSR, V,
+                       spi_for_selr(cs, domain) != NULL);
+        v = FIELD_DP32(v, IRS_SPI_STATUSR, IDLE, 1);
+        *data = v;
+        return true;
+
+    case A_IRS_SPI_CFGR:
+    {
+        GICv5SPIState *spi = spi_for_selr(cs, domain);
+
+        if (spi) {
+            v = FIELD_DP32(v, IRS_SPI_CFGR, TM, spi->tm);
+        }
+        *data = v;
+        return true;
+    }
+    case A_IRS_SPI_DOMAINR:
+        if (domain == GICV5_ID_EL3) {
+            /* This is RAZ/WI except for the EL3 domain */
+            GICv5SPIState *spi = spi_for_selr(cs, domain);
+            if (spi) {
+                v = FIELD_DP32(v, IRS_SPI_DOMAINR, DOMAIN, spi->domain);
+            }
+        }
+        *data = v;
+        return true;
     }
 
     return false;
@@ -1041,6 +1089,26 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_MAP_L2_ISTR:
         irs_map_l2_istr_write(s, domain, data);
         return true;
+    case A_IRS_SPI_SELR:
+        cs->irs_spi_selr[domain] = data;
+        return true;
+    case A_IRS_SPI_CFGR:
+    {
+        GICv5SPIState *spi = spi_for_selr(cs, domain);
+        if (spi) {
+            spi->tm = FIELD_EX32(data, IRS_SPI_CFGR, TM);
+        }
+        return true;
+    }
+    case A_IRS_SPI_DOMAINR:
+        if (domain == GICV5_ID_EL3) {
+            /* this is RAZ/WI except for the EL3 domain */
+            GICv5SPIState *spi = spi_for_selr(cs, domain);
+            if (spi) {
+                spi->domain = FIELD_EX32(data, IRS_SPI_DOMAINR, DOMAIN);
+            }
+        }
+        return true;
     }
 
     return false;
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 79876c4401..0813f0ac66 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -94,6 +94,15 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
             cs->spi[i].domain = mp_domain;
         }
     }
+
+    for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
+        /*
+         * We reset irs_spi_selr to an invalid value so that our reset
+         * value for IRS_SPI_STATUSR.V is correctly 0. The guest can
+         * never read IRS_SPI_SELR directly.
+         */
+        cs->irs_spi_selr[i] = cs->spi_base + cs->spi_irs_range;
+    }
 }
 
 static void gicv5_common_init(Object *obj)
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index a81c941765..61d017bf38 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -83,6 +83,7 @@ struct GICv5Common {
 
     uint64_t irs_ist_baser[NUM_GICV5_DOMAINS];
     uint32_t irs_ist_cfgr[NUM_GICV5_DOMAINS];
+    uint32_t irs_spi_selr[NUM_GICV5_DOMAINS];
 
     /*
      * Pointer to an array of state information for the SPIs.  Array
-- 
2.43.0


