Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D3ACCF2F2
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 12:00:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhnw2-0001Li-TJ; Mon, 19 Jan 2026 07:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vhnw1-0001LB-UB
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:00:41 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vhnw0-0007wW-BP
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 07:00:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so2537908f8f.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 04:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768824039; x=1769428839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AqxHyjEuQPKHPyx5WfORnyB0ROCMxrgg1w6gOY+4oEM=;
 b=xY4dltmFMpGCvKsoYURFB94iqnDHGLJ/x0T4lM7l6A6+H/swF8cNxukp+Vq6GIsoQP
 KWPkfrkPO5L62Z7l7Wgjrk24o1nr+v0wIDtLsVKzGYL2k/e+IruRbZyIql6bZgwZqiuQ
 CtmKPNEmo/teLYXhRfNv3FZJdZlZrKJq/v0AGUpxe3v4BB4Y4bepGxv4Wh3oWuHs8Doz
 LWarzvw2UQ6H9TQRQYyGW/y3ZFc0OPjtH953r7/zSOU8Gf6sN8FCvOsCLv9ccfgHTlso
 cbOysDYL9MbSsPa1IGNPgXLVbKEExWEKBY4yNDc5E5jGI4dlW3pMk40XktwvgKN9kYzA
 nIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768824039; x=1769428839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqxHyjEuQPKHPyx5WfORnyB0ROCMxrgg1w6gOY+4oEM=;
 b=R3ymX9y+P7XyT2ox19KziTWK0IJEGxxrJvIIDhtfuuhrXhqGUsh4SXtde3uVml6dLF
 D8dAmOCR+6MYRSVXLq10rxFpWBDl5ob8LlHw1R9dXleFoQ3NO+XYTkSKVMVXlA2d5K+k
 4hS/uO4rBo/ZgyOVhrTevFb6R1sFRfxH8Kot+z7bmHe5ZVQHoAkJhIAmQveDQjCTzxmD
 bobNknY/zJkrAM3uyyffauEXWuc7+4WLufdtlFj1ZFf98dtZ2/x/vSUt27UapTT4gs0l
 /Lq+trcxlWXunRx2CP0fbvdDMCp9nb7eQESyQTFmpaL7RJN9fPXCD1toM131Gq3jFy8p
 LpTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu3ruyII5D0xX2PYQE5E6uvmcbbCt4JAf6W25S0pamgB6dHZd9OATNyMY/KjXvsETFxhhoz/s6cA==@nongnu.org
X-Gm-Message-State: AOJu0Yz4ioIDw3p6gdgn2uDNmkdvWQs0vtE8Ef7HECI3UznvknkBMo2K
 l4CnK+IagfcQJGBKreqNZyr/ruwrTbqh7RaTUqxeDM4vD7SYk9lAXEXGIECgnW9f6COsBl9Ux+a
 Go0im9EA=
X-Gm-Gg: AZuq6aK0OBZOPvsBcGV3fLpg7xHTie0439ZMZuzAgOaVgZOBM/Bgbeev1bo7u6r6zuz
 qWTkfoPyWy0yXVtxFjLNzwEp8sctZiA6aHKM/Ra3DAHoRfJOKVJ+nh6hjfJZuHDqAd8esfqWbEn
 2eKPljbHsoEBFxI9uEZQ0Nu7kzwkGzMpeEemr+dy1oflSZDBW2dXNoTXY2z6mVMJYhnJEajngJJ
 6SdTxCAJVsbKvubq/pWbe74RnKBw5HcpVG+27mkVTnpHRNEe2f0ABW+mUFumGRwBz7LdxJhDP/S
 LMJZAYDBJPmB8sKXCj8G47Sdts7G0lrtcKxaIdSgjsKhJrROnv6tQiRTh/VrjO0P+W6MVGZJcqO
 91G17+5MVoRpF6/C+6txd5W3/CtdnxQSQ21GCn/wQQmUg0A46QlLCaGOWvlwaGbzUEr4Lh55xhj
 6ku/84a58Jg32vs2lqhwpmMQ==
X-Received: by 2002:a05:6000:2481:b0:42f:9f18:8f40 with SMTP id
 ffacd0b85a97d-43569bc6d7cmr14046408f8f.42.1768824038400; 
 Mon, 19 Jan 2026 04:00:38 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf33sm23397065f8f.25.2026.01.19.04.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:00:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0E3825F87E;
 Mon, 19 Jan 2026 12:00:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM cores)
Subject: [RFC PATCH] hw/intc: avoid byte swap fiddling in gicv3 its path
Date: Mon, 19 Jan 2026 12:00:30 +0000
Message-ID: <20260119120030.2593993-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

The GIC should always be a little-endian device as big-endian
behaviour is a function of the current CPU configuration not the
system as a whole. This allows us to keep the MSI data in plain host
order rather then potentially truncating with multiple byte swaps of
different sizes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gicv3_its_common.c | 4 ++--
 hw/intc/arm_gicv3_its_kvm.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index e946e3fb87b..60a5abd8d3e 100644
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
@@ -97,7 +97,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps gicv3_its_trans_ops = {
     .read_with_attrs = gicv3_its_trans_read,
     .write_with_attrs = gicv3_its_trans_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
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


