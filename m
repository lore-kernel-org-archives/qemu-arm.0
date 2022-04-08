Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp388472lfq;
        Fri, 8 Apr 2022 07:20:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTAlWUQWgsTjnE3aMZLNL+05Felf4PdoU7YC92gfo4EfIjpcoczz6td3wUpM7UfZRhXy3k
X-Received: by 2002:a81:ac05:0:b0:2eb:6a14:afd0 with SMTP id k5-20020a81ac05000000b002eb6a14afd0mr16394065ywh.436.1649427617670;
        Fri, 08 Apr 2022 07:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649427617; cv=none;
        d=google.com; s=arc-20160816;
        b=Ui/6Qia6etfqLqmZASb/bRoEBUsVFGOZsuDcVfgHWsg3wUDZxMSLB8TmIUOye27RBz
         yzHLb9Iz8yzDCvuXKXWjnpZBX84v9QpL5Lm6gxLu/7OSESYMzOG94WTDlYlkXTplg1Qy
         D5GeByBvrKT++78Hko96c9dQ/Qp+y0nAlOnBdgt33iRLcHxN+SBkLbw+nmqcyeZuZX6o
         WKGh1tq4u9kF6bk9bNkC4L+/2eWssEG2PFwrfjcNYLF9z6a9tR5YjfjSGqnX/fljLHp9
         zfCNtqBDCMt+DFnCKgYMI82Ez8Dji32CFKFPTgWpmXvej3ehXk8c4rxxJMCF3eJVsX54
         f1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kl+2ZVJ+6xTCifWmFmG6E383UT0qNH2bxah0KF3V4pw=;
        b=Xo0Zr1mon23bbHqknwJKCTfcH69mIR/aysuN8TNiBvdXch6Ux26io9cxxVmSM4jz8M
         6EpoRfQQtzATCx8M8+TniEOAvsR+E8b7kZASkkWuHRrf0kTUkrygN+d5NMw3ZXaWDxRg
         /b5Xp/9ksBBNuf9RpOYYpVq6XqEJhp09yGiYedUFxuTgslJKZtgCZ9DUOWpINSIHGiwc
         8O7qcD/4MvRapAdlK0NWWldiGS9yU3SNifhix6tGzZhzSCmLMjrcha6ExWn6aRJ+usxK
         o5xPmz/hn2BgmFi8H2FSyIFjWISZhnKMe8Dgvw2bBntx9OPILOZ478O102iBk0Mn/OhH
         xk0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvuViJ6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s41-20020a252d69000000b00633bdb387ebsi595687ybe.449.2022.04.08.07.20.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:20:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UvuViJ6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpTF-00073L-3c
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPB-0006k0-84
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP7-0002Ey-7S
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso7684937wma.1
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kl+2ZVJ+6xTCifWmFmG6E383UT0qNH2bxah0KF3V4pw=;
 b=UvuViJ6HrsF9PkyUGVohQvmwYPOmZ6yWSgOSwjfO5ZxJhLcow/WOYHKqd5temBg4Yf
 AXupkhUY8utXvMbGEOqhO277Mj/8S4Y1UdZRKwXha2+TV9O/61g0vIVFmae+c3O+kkkD
 ztcgNe5xXhCIk7tR7sCdFl4hboYdu1Eae/+p1H+x2SePT1QlYXcV6Uo+HVA63hREaBLk
 AMyx6MZ3UyMJmKbfGkUwTl+4ZYQ60qqX/nQPrcNHZgTpxt8b6PcUIauSMSm3yZAhpwtU
 42k3LrW3WjJTjJACgnTfhsbd+VxNxG3rxde54Mx5Ng5Q0ocvTVU10+mcCamMMHvjEXKv
 h6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kl+2ZVJ+6xTCifWmFmG6E383UT0qNH2bxah0KF3V4pw=;
 b=toIKY/29nbcTv3sG1DLF6OQ8lqsUBA2/lSnr90mSpHDLK8K3Swr6iKwLbj7OJd6iFx
 Z6NBCWPXwyPOiplrUEIowLmK0lHkAJKACsyQ9p8UJTrgDgpQgd9/BgoW5SmNgNhiF+SP
 OGnFjF/j0MLnNusFP7n5ZYX4qqUbmR0FciwxoR4Lu+dQBOWayaVZkgmFILzeDs8WC7Zh
 UyqPojxXDblg6Sxl30/jLmVK6zmKAF9MpmNnmEO6a+HEBAx7xvweOxhtms59M8cn6q1e
 QBGyPhOzkA7Rqd4vjRs8rGBc0VmWWlqVI5J/vdare479M05qwJblZtZOG7IPthN2mTmS
 L7LA==
X-Gm-Message-State: AOAM530JAdd9utHDckJOcXysRwgG4zwfLzjrkXOr7lEeye0E15tPf0XI
 zS16d33uAHdZcp+wSOU9SwuLqyZL0IFV1A==
X-Received: by 2002:a05:600c:3b99:b0:38e:aa31:a864 with SMTP id
 n25-20020a05600c3b9900b0038eaa31a864mr1661901wms.108.1649427359902; 
 Fri, 08 Apr 2022 07:15:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/41] hw/intc/arm_gicv3_its: Factor out "is intid a valid LPI
 ID?"
Date: Fri,  8 Apr 2022 15:15:15 +0100
Message-Id: <20220408141550.1271295-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fPaLAUm43p7Q

In process_mapti() we check interrupt IDs to see whether they are
in the valid LPI range. Factor this out into its own utility
function, as we're going to want it elsewhere too for GICv4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f8467b61ec5..400cdf83794 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -79,6 +79,12 @@ typedef enum ItsCmdResult {
     CMD_CONTINUE = 1,
 } ItsCmdResult;
 
+static inline bool intid_in_lpi_range(uint32_t id)
+{
+    return id >= GICV3_LPI_INTID_START &&
+        id < (1ULL << (GICD_TYPER_IDBITS + 1));
+}
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -410,7 +416,6 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
     uint64_t num_eventids;
-    uint32_t num_intids;
     uint16_t icid = 0;
     DTEntry dte;
     ITEntry ite;
@@ -438,7 +443,6 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_STALL;
     }
     num_eventids = 1ULL << (dte.size + 1);
-    num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -460,7 +464,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_CONTINUE;
     }
 
-    if (pIntid < GICV3_LPI_INTID_START || pIntid >= num_intids) {
+    if (!intid_in_lpi_range(pIntid)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid interrupt ID 0x%x\n", __func__, pIntid);
         return CMD_CONTINUE;
-- 
2.25.1

