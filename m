Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5320CC44507
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:01:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viVw6-0003fN-Hw; Wed, 21 Jan 2026 05:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw4-0003QV-GF
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw2-0007wZ-Dh
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee9817a35so38374545e9.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 02:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768993177; x=1769597977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZ6t9XZ5QAwAxAU+JLleQRkqn02gh51WB6UgsTIMHoY=;
 b=wUn3sSDaHFQkfCu9Dd2ptx8jwNrib3HP7Uw6k5W5ZyWmx3Szz8RSY1iGHjMClsgqXk
 y6Dry96mpaHzpiro9wl2GZ8eg8XRj0UhTJ+3fgTrJLQkKRJOpxLM0o3nRAUqCF+36ACK
 Gmf+kaWd0tC5lm3ka3+t5kQjcSR0YVtR+Dgo3RdOT4FwuqB05sVBIojk+J87EBWD6NV1
 khMiM9eorcVW9g8bemubBORVhXOlas8tAQ41U/7nmXZyUyPmDV1Jiwad68yIEgo2OPrY
 Gg0GtWTw9lELsw9mEBgM8VZYuFpi74ms8bmrvGvlvZM9Lv/WhaY5z84lmHtDoqdYY81/
 xKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768993177; x=1769597977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zZ6t9XZ5QAwAxAU+JLleQRkqn02gh51WB6UgsTIMHoY=;
 b=SmpTVs/WG8aqak1RSvjX31bxykpuvlDGIUQCpPEcWVmVF9dHyP00BuxbWt48MgARxF
 mIL3yK8vJuaffY2ps9zsyqKk6qD9RcfrAULjVr4J2V1MDHhfyIukTxBg6is8Yd2HCHHb
 cFZcR5nGWHfaON8VSacol4O/nBwfwxsyKFxunWa+D5kLgLm1cktetMUhDSpZZvXkhQqw
 GHphPDHR2rkk2zfrHXWbOHqvVdDV1QSDQ0Y0/ea1rcfIJhVkonBrEV3MJJHsj9bs5pfO
 wom8whCkbdiUKHS+u25dDs7lzP/6VbSvLcWEg7Wke05AjPoAKJ1Lx411yp0uD7K5wkoV
 4x3Q==
X-Gm-Message-State: AOJu0Yz2asCRv1WSVk9Py6CrnZ5+3DGXFtXbVC3o4u16imLQcEKR2LVv
 X7jQUclwQ6z4Rux9qrTMxqL24sXQ8txN3rsDIaHfUAYjU6JlhmaaIULHNK7xOa7A6R4=
X-Gm-Gg: AZuq6aLcXG/udkkZu46aIFYM6O/Wx/fl4b7mvR2mvS4hGXh2hAe16NLlXQmAxzkvEeK
 WTQdEpWGpACZ7Pni9qogCaneePNyEaUr3SXYigKqxOgRuNA0QbzohMGQv/1J0NZEVMTZWFbcsd9
 pUeuZh44MzushcONl+m4Rr+SKZMoCHp+XvQ7ifgQhJK4HIDjKT8muMkPldxdsl4g7jgIJNyO3az
 BE05Y48np4Dfii6beoax5l7KHoePsroOlsE/qErOyCctZcXpZE1Qx0yQNLtgqwBi/+2FF5CpjYZ
 Ud75TnIO8ePPTpKJtvKo3rI+PSopSN7e1IQclZUj9lo314uOpJrRwAZUgPITN5lY6jpwN1DMEH0
 5vC3Mip4ziz/D1P3B2QnpO2MwU5qQDXSgv5avYRMW15+J8/cVlgsDpaDDs2AE9ca9pQao+9v6dP
 huFe9t1s/kl6RQ
X-Received: by 2002:a05:600c:8b75:b0:477:b734:8c22 with SMTP id
 5b1f17b1804b1-4803e79b7famr76971705e9.8.1768993176662; 
 Wed, 21 Jan 2026 02:59:36 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acae8sm359509295e9.4.2026.01.21.02.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:59:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BE65A5FE90;
 Wed, 21 Jan 2026 10:59:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH 4/4] hw/intc: avoid byte swap fiddling in gicv3 its path
Date: Wed, 21 Jan 2026 10:59:32 +0000
Message-ID: <20260121105932.135676-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121105932.135676-1-alex.bennee@linaro.org>
References: <20260121105932.135676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

This allows us to keep the MSI data in plain host order all the way
from the MemoryRegionOps write method to the final KVM_SIGNAL_MSI
ioctl. This fixes a theoretical bug on big-endian hosts because we
were using different size byte swaps which would have truncated the data.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org

---
v2
  - split from DEVICE_LITTLE_ENDIAN changes
  - expanded the commit message
  - cc stable
---
 hw/intc/arm_gicv3_its_common.c | 2 +-
 hw/intc/arm_gicv3_its_kvm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 9fc51ad1e0b..60a5abd8d3e 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -81,7 +81,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
     if (offset == 0x0040 && ((size == 2) || (size == 4))) {
         GICv3ITSState *s = ARM_GICV3_ITS_COMMON(opaque);
         GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
-        int ret = c->send_msi(s, le64_to_cpu(value), attrs.requester_id);
+        int ret = c->send_msi(s, value, attrs.requester_id);
 
         if (ret <= 0) {
             qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index ae12d41eee1..a8d6d4fb540 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -58,7 +58,7 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
 
     msi.address_lo = extract64(s->gits_translater_gpa, 0, 32);
     msi.address_hi = extract64(s->gits_translater_gpa, 32, 32);
-    msi.data = le32_to_cpu(value);
+    msi.data = value;
     msi.flags = KVM_MSI_VALID_DEVID;
     msi.devid = devid;
     memset(msi.pad, 0, sizeof(msi.pad));
-- 
2.47.3


