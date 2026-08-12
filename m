Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0916BC5CFDB
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:03:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFAS-0003TZ-Uu; Wed, 12 Aug 2026 16:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFAR-0003TF-JC
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:03:15 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFAP-0004Pp-LW
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:03:15 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-84862b0d5f8so1322125b3a.3
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786564992; x=1787169792; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TgAuYL2wZUHdpKn7fLlMxv1Jyx6gCYx0YZSOWtCxWpk=;
 b=b03pOMQboawz2CGKjnn4jxUKVbgd0/ZlRoA8X+6rVkcUHLdhX3nKYczVc6sDfPMVSl
 0pKIZBTfGe0GVJqFf/7ka9IxkjRQ1F5JKjBwvzYqNrncAWzMgLlh0VFfuyshniQus+ao
 BEZ6y2j0xH5FRJr8CtfR39zdPhUVQI/C9x44/zX1gVOHjLIzk0iyA/UI8pQ1v4DQERZd
 LKHav2MkJEaBjB7FdDO3A8EbRtmDPOMltPZbXfdomGS2bxdhIUSGkWQec4r+Mrs1+8MD
 bMN8TeXRKekKa9nI2McZ+XYyOeh+MwDHgr4CMIftnuy1Xn6QRgkWBCQ4KT6sXSU45TI1
 XZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786564992; x=1787169792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TgAuYL2wZUHdpKn7fLlMxv1Jyx6gCYx0YZSOWtCxWpk=;
 b=rERiMf2dmiMx2sVLCArpOK1AiwTYQ1NaFWrx/dzK77j0LkLskXHf6iGOeut3hQdAkC
 7IzCclQfSnMGu33s7lpi1XhEZf0B2yu/shOWn/gcw2T0ltnmonpkbacjW6X+26/H/AQy
 jX87Vq5YYRm84rXvbgyoNamYzpRQuLc7zFufU0FAzKGKEorKrYQ6JulNnUR0PTZWkK3e
 xtlsmjC5jRgQlk7wroiV0AEpckAcFF6TSBQnHHOxPsCL/6qNYrExyh+/VAS2IrHyJZOB
 dApYGtwOMbkVTW3bU2/TBg8c5TkjZktBrZvUrKIBdpv2lwCfHlrUdmIq0lHeHNOz6L6+
 O4Tw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqk+GF6qbfetoKGH6AvCdohpdkIBpyHpyhDa1t4mV3UYZHErnySq3dAbic6B6ljSM0vRQ++qQftVA==@nongnu.org
X-Gm-Message-State: AOJu0YyXylqSjTsixwC20PixzlsJI5NzmYo9PoRmNiZiFLUketJ1T1mI
 jvPvP4A+9yBp8wkxmK/Fg43O2s5C0Q6v7SYsNcOluhmgySW0/IDlxfxwiG3AKt/lWhw=
X-Gm-Gg: AR+sD107SCehOg6/VDZATRX9yLcw8NP3FInlt6HmNHhTl25G28C9mPhHk/m4AI1hwU/
 R6xXr4zNyiP2mTq0fcZGgbNdPbRQS4DuWzo7W9vNmO1PVF6NCRImpoPotN12F3pP/gcEaPLL51L
 uhr9BR5FUbwp4rq+bsmfa0W/eSbEjn/3WlQEb0iJKdIUa4yWCAlvMPoJ2WmHIZsi0DtRACCOP6y
 0uadB1xmsvbxMOkMH+L4GhT5VpMWzyVZNcO/iT7E1gXRPt67x6UX+wTOjJmWy/XNIBEyam07AaB
 JD+FoQBxG0tqkmpB6CiiHUqxy3F4/8S9PLQl5LM7Ht1JxBkJ6/fgQpld1dDVBk5ky8YswmkIGCS
 6839o1TZz3JDH7ec3Vt6v2EebWseDCNBSWxVE9McWx9YBnsCp9mXYjGOyD2kIqyjx/3R9Bw6Suu
 kVwXxCkjaLiz330F7uSFi9/VbkLoXakS5wxLlP5ew+vgBqMZ6/+mMinF1vrRpkJZgM/OKbjlWLR
 I0Im3BbBQANQ/lu+xKT
X-Received: by 2002:a05:6a00:4385:b0:845:3fe5:cddd with SMTP id
 d2e1a72fcca58-84fc747f37emr412127b3a.36.1786564991636; 
 Wed, 12 Aug 2026 13:03:11 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc5a1cdd3sm99132b3a.33.2026.08.12.13.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:03:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@oss.qualcomm.com,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/intc: Fix arm kvm gicv3 selection
Date: Wed, 12 Aug 2026 13:03:08 -0700
Message-ID: <20260812200308.289238-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

While 39a8c3941e may have fixed WHPX, it certainly didn't help KVM:

  $ QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/arm-cpu-features
  ...
  qemu-system-aarch64: unknown type 'kvm-arm-gicv3'

That patch did remove a test for TARGET_AARCH64, which is fine because
it has been a long time since we supported KVM for AArch32.

Fixes: 39a8c3941e ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index a1401cb521..faf63a0145 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -48,7 +48,7 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_WHPX', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_whpx.c'))
 specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_hvf.c'))
 stub_ss.add(files('arm_gicv3_hvf_stub.c'))
-specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
+specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
-- 
2.43.0


