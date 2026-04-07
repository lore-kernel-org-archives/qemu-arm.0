Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D1FB5181
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wBD-0007qm-1j; Mon, 06 Apr 2026 22:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAn-0007aI-Jf
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAj-0006zU-Bz
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:12 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2b258576d8cso28601475ad.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528887; x=1776133687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=KRqGm/dWZDDpY/9ofEB7r9nJtkNgktG1QY/hR/sQdx0gRoQBMgXaQPYpIh9IBfqJ0g
 3/ct7ejUDn/518Bnl1cUohrM7OQj2Lk3Z5Jw+yMFNGw+yGIWcSJ+YZ9fE+ubRiTZzZ6P
 WU9SV1hTnaXZRI4d86pUOh3Gw2bsqIIyFH7ZIZdphQW5D+EYIk+O4DAC296crSQ0+lpS
 Pjp4T8Sixd1PlpTW9+hk2yGPN4fBsrFkffeLmsF9x7s/pWjaD4dv69xica2PDLCXzqGB
 /FiaYjIy22im5QVkkzqYVysitSS0erATJScgvNvA0KspvbRzxLocTBduiljF8JI8X9Ha
 1qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528887; x=1776133687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jvjSLIEXvBvChupp9bEDs+PcKLfymPb67QO+8GQ5aqk=;
 b=aS+nneP7MkDYVkRNndArT5LBQTRh5eMMgUOGbNGRAjkt2LXCiloYtNSHDcigoQsihj
 uXDMVcAQlY6APHtNqtDLivFPFb2P1oNe33D5mUkK+udPqTdcCg5qXz85AaraoghlIVGs
 5XdX5zsj0XLpBz+XAz5KawNgWtM2nWfrwUhAZfEONuNCbQ+ViHe73ByKqGD/gYWnCFCg
 lU6bIiholem0Y/npnQUemfSvrgq0yJOkjKx2vVFj+uKD6OVVrFtr/T4MkiUb3m1PeFNb
 dj+oYPsLeoZdeaD0NO/PC+xd/Nw2+khycee4qb6s6P2O8njpvAkn4Bf1USzvVCOdu+rf
 +8fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFUAOJN3x49CzR5NfYJQRvfyqwXpWkYiUEDJBVNis3ZzcoYwnYZlnecGMRTzY052YWlkkfju79/A==@nongnu.org
X-Gm-Message-State: AOJu0YzbIAcuFOMD8tYj75oxWvkkTBlocGCJ0r/rFi/nGbJKlhHbdSp3
 sNG5YATmuNWjZkpv7OGr7tyLzmvX6r7fkNO+bGzn1u7N7L1oKKdO6url/UpH4pgcvgM=
X-Gm-Gg: AeBDievVlHFT6wQnPNu9zM9inXApdaMWPyz+kWLF2/EsDPpkb1X4WVNfX9IkQGHoFCB
 fxLCQv8EJjFK8vPIfrUH+5dZuYk16fvufaIXx9q2v6WYj0aUboZ+2DzfwiK1GOv5tT/MuAJ/0vI
 /UX7/y287V0vXSd9drI6uijt+KPrRWj1K56vXR4WC5YMrDaBNzpUv0+wG51H9TOoVr4kX29pF45
 wyOhF+hIqcvPWqK4L4Czeas2vB8ykIi7puUQqpnpElk6OtBtIj28WQQZm4Dlpb1J0adzhmBLrSd
 cWpvm48WHTc6xnx2B7Dihos2a7SYYGZqQisIrm1PAXH6VZvUtm4vYCGGU1Ze4POUJHmCV6ACV7R
 NFwJ+Terh+3dXBTkUqCOV+jcMsPauBNISWeAyRmlq9F7Leb72S4M4W1Suw5KGCBA7TfvQ2ryBoT
 Ds8gCMT/WygLeeat9mTW8F+cwFRWl9+QEQNiMKcRFCf6YmocDGRuLLnH+5W3JxAPJHD92Cq5eOS
 55a
X-Received: by 2002:a17:903:3c47:b0:2b0:b016:773f with SMTP id
 d9443c01a7336-2b281803f15mr160764785ad.11.1775528886663; 
 Mon, 06 Apr 2026 19:28:06 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:06 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 12/20] target/arm/tcg/translate.c: replace target_ulong
 with uint32_t
Date: Mon,  6 Apr 2026 19:27:40 -0700
Message-ID: <20260407022748.57629-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 4546bbeeeff..204f9657993 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6450,7 +6450,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
      * fields here.
      */
     uint32_t condexec_bits;
-    target_ulong pc_arg = dc->base.pc_next;
+    uint32_t pc_arg = dc->base.pc_next;
 
     if (tb_cflags(dcbase->tb) & CF_PCREL) {
         pc_arg &= ~TARGET_PAGE_MASK;
@@ -6612,7 +6612,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     bool is_16bit;
     /* TCG op to rewind to if this turns out to be an invalid ECI state */
     TCGOp *insn_eci_rewind = NULL;
-    target_ulong insn_eci_pc_save = -1;
+    uint32_t insn_eci_pc_save = -1;
 
     /* Misaligned thumb PC is architecturally impossible. */
     assert((dc->base.pc_next & 1) == 0);
-- 
2.47.3


