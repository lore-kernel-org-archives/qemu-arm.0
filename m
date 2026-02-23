Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77D5EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:04:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKY-00028J-N7; Mon, 23 Feb 2026 12:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKV-0001uO-8g
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:43 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKR-0000AC-7R
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:42 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4837907f535so41153215e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866158; x=1772470958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pxugm0oWVUcgkpDMORCz85xFJuuEUVhItUG4r6MiPs0=;
 b=dEzfcDi8EPrNZGt1pK/smxvIwn7w+4jNuj3P7otqjonLrRWlZp98NSY9NgT5soKMMT
 kIewJ9eVU5Fh/bpqoYQ15ywlXxfTbq/iq9OoZWAVDmIK1+vFWebpL99VXV5HMgGyqMFs
 21Neee8HtKeAo2ITDuQ6Jk2uu327plLyBANKt24H/fnxSLrU8rWLI0NwA8mae6yNefPX
 r5znTxVwtzavhivah68mYNpw1h+nT8Cuvyz2yTgPhzVqhzl06fcAnpoRhn/kF1tWukwQ
 gDYofSa6iK0TFQUZCL8FuKLAyULB/CiM18iiZ7FqmCsosdUq5o5CtHblw6uc4PoKERbp
 gmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866158; x=1772470958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pxugm0oWVUcgkpDMORCz85xFJuuEUVhItUG4r6MiPs0=;
 b=pOIrwtSb4PQ9eVjKJXrRVa6OzDsQxEyL/0NKbyL9XlTUPzzWmhueRODHlX9tgJcLSF
 LNlD8Ulpa7BP+9D4tx+aK4YpTFHBtsVJE1NFyIBKcn22cTtb2wiL39LBJselqa8syFEy
 CJpG+GqghG5yfmz5WsyBTS0cwNi0jMOt1oeSgQ8gviKwmCYClVOVdWDeBsUVuUAuQuZ9
 9KeRoEj1tFyAsuPu3hzyE6Aw0l5dh59g9C5mTWn05/Nn3PlSCqw/g7BX6pdABy+opadg
 2NiE36F5+7pR5uk8Ajjui64LNtkPzyDQ46TVb/7FHm/DXTQL3TmC+2eLyTStaoJ77Z85
 LUqg==
X-Gm-Message-State: AOJu0Yz3mZDHtBmKi23gAm3kKXR05cDzbrBrnieuQSm19ODA0lEKn4/S
 gvyOHxsc+TdR6QI7/xWjmhgI2HDd+0LC71OQIkatURSG8zB7/8wZVy1+Fl6IrMKFz4h/gsM8OmO
 xSysU
X-Gm-Gg: AZuq6aJFOMJ8kSh/rz45/pWmRLxOFla+fjZ6otHK6qCsS+RtaL7cXiIhjDgkAsa4e/A
 aMmmOYTc1ulRhnIi9Qgp2x3nMUSc1ngVw0o+0DA/SCQ6zOuO+wLyQkgwrQzXTXBDgC/8DOzj2Pb
 am151GQqnnBKqwRnJavLEWLGYPVU1QINgzJJRmkPBMeb4bnpI6m7fjTLZRRP9TqPIQNQHzg2xZf
 etilOW/SdbbRPG5AESdFNZWkQsbm+JJql9G22TQcHfWAP7NeSMSJQ6anfIp80Azf9oFu+2WrBTz
 XROwXiFSdaQx6wB1rwOF670BJgtHAh7NrQi6o2mM2Z8pNM3da4y5XO0CZmv7H5oPXedy5rtgueg
 yxn4KMP+RhdnU76wCpN5UCgOjMlXa1/98r1xbmUaV5JNfEQnNBmR37dEZo3R9EygEQKw/FBm83U
 RiUBbale4qzyBYSj8KD/zuEF7scBIUc39ttSaV3eZ5anDZ5ikBwZ9/5PfDwqPOE21sO79UF10KS
 kuhdvPbEZ7fTS+ks16wjoKOQoAbmrQ=
X-Received: by 2002:a05:600c:3115:b0:47a:814c:eea1 with SMTP id
 5b1f17b1804b1-483a961602dmr194302305e9.35.1771866157552; 
 Mon, 23 Feb 2026 09:02:37 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/65] hw/intc/arm_gicv5: Implement IRS_MAP_L2_ISTR
Date: Mon, 23 Feb 2026 17:01:26 +0000
Message-ID: <20260223170212.441276-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

The IRS register IRS_MAP_L2_ISTR is used by software to tell the IRS
that it has updated the address in an L1 IST entry to point to an
L2 IST. The sequence of events here is:
 * software writes to L1_ISTE.L2_ADDR for some L1 ISTE which is
   not valid (i.e. where L1_ISTE.VALID is 0); it leaves VALID at 0
 * software writes to IRS_MAP_L2_ISTR with some INTID that is inside
   the range for this L1 ISTE
 * the IRS sets IRS_IST_STATUSR.IDLE to 0
 * the IRS takes note of this information
 * the IRS writes to the L1_ISTE to set VALID=1
 * the IRS sets IRS_IST_STATUSR.IDLE to 1 to indicate that the
   update is complete

For QEMU, we're strictly synchronous, so (as with IRS_IST_BASER
updates) we don't need to model the IDLE transitions and can have
IRS_IST_STATUSR always return IDLE=1.  We also don't currently cache
anything for ISTE lookups, so we don't need to invalidate or update
anything when software makes the L2 valid.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 8572823edc..af27fb7e63 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -492,6 +492,44 @@ void gicv5_set_priority(GICv5Common *cs, uint32_t id,
     put_l2_iste(cs, cfg, &h);
 }
 
+static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
+{
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
+    uint32_t intid = FIELD_EX32(value, IRS_MAP_L2_ISTR, ID);
+    hwaddr l1_addr;
+    uint64_t l1_iste;
+    MemTxResult res;
+
+    if (!FIELD_EX64(cs->irs_ist_baser[domain], IRS_IST_BASER, VALID) ||
+        !cfg->structure) {
+        /* WI if no IST set up or it is not 2-level */
+        return;
+    }
+
+    /* Find the relevant L1 ISTE and set its VALID bit */
+    l1_addr = l1_iste_addr(cs, cfg, intid);
+
+    l1_iste = address_space_ldq_le(&cs->dma_as, l1_addr, cfg->txattrs, &res);
+    if (res != MEMTX_OK) {
+        goto txfail;
+    }
+
+    l1_iste = FIELD_DP64(l1_iste, L1_ISTE, VALID, 1);
+
+    address_space_stq_le(&cs->dma_as, l1_addr, l1_iste, cfg->txattrs, &res);
+    if (res != MEMTX_OK) {
+        goto txfail;
+    }
+    return;
+
+txfail:
+    /* Reportable with EC=0x0 if sw error reporting implemented */
+    qemu_log_mask(LOG_GUEST_ERROR, "L1 ISTE update failed for ID 0x%x at "
+                  "physical address 0x" HWADDR_FMT_plx "\n", intid, l1_addr);
+}
+
+
 static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
@@ -675,6 +713,9 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
             cs->irs_ist_cfgr[domain] = data;
         }
         return true;
+    case A_IRS_MAP_L2_ISTR:
+        irs_map_l2_istr_write(s, domain, data);
+        return true;
     }
     return false;
 }
-- 
2.43.0


