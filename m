Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F327EF9B609
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:18:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUeh-00077K-Ms; Wed, 22 Apr 2026 06:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeM-0006yg-1t
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeF-0002Om-P1
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d73352cf2so4330651f8f.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776853053; x=1777457853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1esNeOF5ufpO0cAxHdsE5rjzSjC5Q+4Ajm02teJ1954=;
 b=qxV6nDO/0F+3rFI7BAQwKgiX8CLJJMKNhXEmm2x6nHXLLYVsmWlqZaHWyvBh+z5E6o
 tApwgXOsBQbXIClOnHFXmMVTSboyFBo1EHOOdFcD7ZUVSWZNPKEHRt1InpZ8QW7G3569
 WRfu7ocCY3Vo3zYPx0bpXZma6rFFNDCHQZVK7AuEiLpVVYSdxjgNdjrt0hJRbo9VItFC
 DAnzSkISW/KIKlx4Fv2s2MTkMgWtIsDr3lXeyeYIUU1LstgMYvsTDfjelcSOvv+FTIG3
 tp2k/54D/MZYw2/41ZkTbdHu2VT1ZMJkbcXt5oPshmlbHr7u/s/8/A6bt37tIB1rmrTO
 Fihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776853053; x=1777457853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1esNeOF5ufpO0cAxHdsE5rjzSjC5Q+4Ajm02teJ1954=;
 b=tPj1zEb8tUh21hJRXg2Y5fl7PQrLGCdDz8Gj4irTPWvDqZOsbs4qwAnLWx74Gr+bvi
 QNSbD5N26ILCUvZHzRrlD0VlHfqSGtiObW2TOkL1c1VkudIlT8xl1yW/MkR21wopPfFS
 zDm5QKqsOqnlIIlQu7A1j6y6aTOCtK6qcSzaYKRxArmN6rklm5FAAo0yuORQ/5+w6bsi
 yCc4DsYPhZPA0HypTZiZvBlbxnZCYDk5mXF7BsPNbbSpdpYS//Hrwwhj5EpKOMs0j7ag
 MfMJ7eH/Ep3Cu2Jy2QI5uWub4W8IHajqKbWVcKLEvkf2PPjaDuSp673fGdv03H94Moeu
 0QPw==
X-Forwarded-Encrypted: i=1;
 AFNElJ93gZ7cl5jG166n3hVAqAGc2JnpD9N1bXGyyFShStACQ1wQRn1oXeRbqu5oDg+j5FREYZyAmAoHXQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz8jdw/ADFlACFwBBRg1mfOH/2IFdGdwiTzEZPW0dLa9gx9iMpG
 TqScD6BkDUarvS6wF7jNHWsFCKylMF7WNoe/IIiYF4RS/S8TDeFSKJ0N6jxtw+Zwbh6gxZxHbUO
 CFqMBS+4=
X-Gm-Gg: AeBDieuvQDWVoev7Dw58KQk2fRrQ51pIenn5zVg76P81GHMk/AKvhqiLlenIybiCkx8
 bJUS3Xkd+1GOFpc6xrkhKIQFgOBTNW6CJH2ktWw5a74CvqnVpJXP1YbRGZUDnu6LBMdwc5YOTat
 c+ZSczQkb+/bT+xuyR177HGc/SRP7wUpFzocJH49B4ewuiinTQwy3B8o0u3DszsndsjQS3mNntN
 cnx5Qz9dXwmuy7znvvvDDwR1OJRoQ0KzJzeJiStdRbXPtZ2u91Lvket2nlfkG7VT/IyzkFa0oNq
 +F51pAHdgBWX7NYOG2CSvupDHQgWSIKkDavQ9/LEqwe+ra28Qc+fIPH+UjFZtyGSwCjrc47VWSZ
 EE2I1UkWQ2OH5fpLzRJHeYSYqiSYLy7F7s3ye4pNumbDlht/qhymwDWi2yF1ls4WYAUrHStPJQv
 wTMoCL7YSM3S/MykTJINXU5QCZhvkXXGtrJQ==
X-Received: by 2002:a5d:5f43:0:b0:43c:fde6:212d with SMTP id
 ffacd0b85a97d-43fe3e13d46mr34364660f8f.33.1776853053246; 
 Wed, 22 Apr 2026 03:17:33 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d5b1sm48556243f8f.30.2026.04.22.03.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:17:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D6D1F611AD;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 18/31] target/arm: make whpx use syndrome helpers for decode
Date: Wed, 22 Apr 2026 11:10:29 +0100
Message-ID: <20260422101043.1234229-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

Rather than open coding a bunch of shifts and masks we can use the
syndrome definitions. While we are at it assert it really is a
EC_DATAABORT.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/whpx/whpx-all.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index bbf0f6be961..4cfc7f99698 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -356,15 +356,16 @@ static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     uint64_t syndrome = ctx->Syndrome;
 
-    bool isv = syndrome & ARM_EL_ISV;
-    bool iswrite = (syndrome >> 6) & 1;
-    bool sse = (syndrome >> 21) & 1;
-    uint32_t sas = (syndrome >> 22) & 3;
+    bool isv = FIELD_EX32(syndrome, DABORT_ISS, ISV);
+    bool iswrite = FIELD_EX32(syndrome, DABORT_ISS, WNR);
+    bool sse = FIELD_EX32(syndrome, DABORT_ISS, SSE);
+    uint32_t sas = FIELD_EX32(syndrome, DABORT_ISS, SAS);
     uint32_t len = 1 << sas;
-    uint32_t srt = (syndrome >> 16) & 0x1f;
-    uint32_t cm = (syndrome >> 8) & 0x1;
+    uint32_t srt = FIELD_EX32(syndrome, DABORT_ISS, SRT);
+    uint32_t cm = FIELD_EX32(syndrome, DABORT_ISS, CM);
     uint64_t val = 0;
 
+    assert(syn_get_ec(syndrome) == EC_DATAABORT);
     assert(!cm);
     assert(isv);
 
-- 
2.47.3


