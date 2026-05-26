Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26827CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 17:42:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRvn0-0007Gt-AU; Tue, 26 May 2026 13:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRvmy-0007GZ-VT
 for qemu-arm@nongnu.org; Tue, 26 May 2026 13:42:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRvmx-0004AT-6t
 for qemu-arm@nongnu.org; Tue, 26 May 2026 13:42:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49039a8851fso53522605e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779817317; x=1780422117; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0mssOI/2jraHsHBlbkv+u0I5kV8JcukvHeex68v/cTo=;
 b=wMP+5KSyYhVUOUUb10nfkfF+zWYVWfFPG2Ve5fS6n6NNZmCg5e0FAjaaBSZP/TYk3L
 8OG5rjs0FkdT1m3i5CH10NqNkn8hrePMh5f7Knh3ax743xQuOlY41lTvacwuwLcRlIFU
 Qx32p4Kz/HmvvTpKenrAx4K9uzxOGucFutdtx1HLtkKdp9kxr3ULYAjA8MLNpI4f0kn+
 Pq8+BhCE++D8rMuw1rvSZhHsy+x/zLS7qUP1MWBsc/zVfT//NsbOSIX3r4SdELmomT1F
 kyxdK1WDH87qwtbWolZ3TNk0ZAwIAUg/lL/IawApedHNbMMO50+a49frj0jjx9qteGPE
 kBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779817317; x=1780422117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0mssOI/2jraHsHBlbkv+u0I5kV8JcukvHeex68v/cTo=;
 b=lo/VyRnFS8nJv8IIPykBtnDAgJmVBzvbkseURtnkPds1DsFyclXexd9Bls6Q+1I+Ee
 ciLmlLXNG2mP8x0D2aW5ZGyR9DBXqpAUKqW0M8OG6pURyjgZaVdfW9R3Y5akVfxt5KgI
 cK6YY+ub2gyi8EMzk7vhSuZ9adQZ2HXDdEgloem3Ytg7VUOtN/q5Pw0bd6JnuMGKUlz0
 ITnwzEvX478WytaCDsfqpsWIuDoE1dbhMQzx47yICsQu1KyL8znImAHvWlGQ7ZLH1Hst
 NZwblC7GwCOFuaYmGb967SK8vz5VhcogfNajuqfcMirQAdDoTVTmrKJfJkg+8Ne1rLPk
 NqnA==
X-Gm-Message-State: AOJu0Yyp5QC0/PZrbJCa5bEfgBQO4zz1D780WrsUz3DTrHKXm2MQRfQR
 XUZjRzqbzQvCQiVNngFkgYinmsQ6e61irymkkJS1+9ylwxaM0qcJxEl0hTmxqeZZP8Da40oP+Is
 c2zdL
X-Gm-Gg: Acq92OE68rFsN8CkePi3R5hZWX+jtnb90mPZm2CMM1+EfWWdEOgN4Xoqdb8VzTlGBMd
 xgfYdUk4wDU0dV+HleiMQtivyCEi0mFgWnN6geazj6cv9usRSr8tHhk5uvhio03TAB+vs552cbP
 44AjgH9H+/JgP84xDL00L1biw2yyrVXYVrbBIl60rLnGcKJTbts/3UXk99s7ViaXLWy5l7JstG9
 8rEoiZjm/1xKRg4wQKyQ/DdwAO9MxsXrxjxkP5D+BMc9sN4injy/G5zFifZtyPrTfp0nND7VYOh
 XMoFzp6EQCtCAkKwvOVZV/DpP86uHY7GxXhdvA+Pe1oW0Umlkmj0AHQ/n0vJeTD/2p6dSwMiKws
 dI6Q3zTd/UMRQIAggU4kD2eAIeS7xrhj3YRKZxxET239RmI0Uc3+LjxGM0y1ts/cIkbA09Lhp1J
 Vxpg/ybm4nEV3DyCXAWi5S6b+dOB15lP21CjJ8hiw+eiv7lFRPHGYgkRoY/9wZFOwAUerWq4Go0
 8pEaADNkH+KbWXxLZp2mcOJxyDS+YRQLW8aK2KE4A==
X-Received: by 2002:a05:600c:4ecc:b0:488:aa33:dcbd with SMTP id
 5b1f17b1804b1-490428db91cmr296943015e9.26.1779817317323; 
 Tue, 26 May 2026 10:41:57 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454c600esm335920215e9.3.2026.05.26.10.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:41:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't assert if 64-bit EL2 AT insn sees a Domain
 fault
Date: Tue, 26 May 2026 18:41:55 +0100
Message-ID: <20260526174155.2491217-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

The Domain fault type can only happen for 32-bit short-format
descriptors.  This means that it almost never needs to be encoded in
a long-format fault status code.  However, there is one corner case
where we do need to report it as a long-format FSC: if a 64-bit EL2
does an AT insn on an AArch32 EL1&0 translation regime that is using
short-descriptors and that translation operation hits a Domain fault,
then this is reported in the PAR_EL1 in long-format.

The PAR_EL1 register description defines that this should be reported
as 0b111101 for a level 1 Domain fault or 0b111110 for a level 2
Domain fault.

The Arm ARM pseudocode special cases this in the function
AArch64_PARFaultStatus() (because no other "fault to LFSC" code path
can be a Domain fault).  For QEMU, implement it in arm_fi_to_lfsc().

Cc: qemu-stable@nongnu.org
Fixes: 1fa498fe0de97 ("target/arm: Provide fault type enum and FSR conversion functions")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3512
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 00830b1724..bb15b149f9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -880,6 +880,16 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
         assert(fi->level >= 0 && fi->level <= 3);
         fsc = 0b001100 | fi->level;
         break;
+    case ARMFault_Domain:
+        /*
+         * This can only happen when doing an AT insn at EL2 for an AArch32
+         * stage 1 EL1&0 translation regime using short-descriptors, and
+         * the translation hits a Domain fault. This needs to be reported in
+         * in the long-format PAR. Compare pseudocode AArch64_PARFault_Status().
+         */
+        assert(fi->level == 1 || fi->level == 2);
+        fsc = 0b111100 | fi->level;
+        break;
     case ARMFault_Translation:
         assert(fi->level >= -1 && fi->level <= 3);
         if (fi->level < 0) {
-- 
2.43.0


