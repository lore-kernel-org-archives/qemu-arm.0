Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F0EF9EDC8
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5e-0006do-LK; Wed, 22 Apr 2026 08:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4r-00065y-2i
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4l-0005Wm-MM
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso29158335e9.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862386; x=1777467186; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rop61lo3CsCy/AA+flQ6RjC7mnHYxt45F3om3vFlXxk=;
 b=WisRWG2jEcHb9a2Hb+Xmgtr6O3txfV5Ti+TO/q9XTzOWgZRHIEz6gqwAwHTc90/H0N
 vtGPBpe7vo0KLlFxlcvft8GukwF0xiMGkKiapcGKHByZRWJG9s5X3zHBUOz1yVUTZCkb
 m2gjvIHILjOBaUDRCT0SzvxdS4kEGN4dm4C97IEVF6SkD3Foz3CPj4XXxFtjMKQEXVkv
 e45lr9VeOLrF30OxhyIK6VMnkBbwc86lSOEIV8fvbb5YIBcFo114vPSFBuOqMy6kL0x6
 CcWBcGV8fEG00rKu/Aqw2aP5b9NY7d57n3gNUsUo5bDj2AhNvhvpza0Dw036YgeHGKk7
 JXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862386; x=1777467186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rop61lo3CsCy/AA+flQ6RjC7mnHYxt45F3om3vFlXxk=;
 b=QPotSQCBRck3nPcOo/tgUMtcSoSXjaDn2MoCK4ipnjQFOGaWg3HU2W/cLZVBLT9DPP
 NFFCks8aPMkyJRPdkVvp4k3eMhv901NFkTMZJ6Z7C9ZMYJjzCHct0H02XRZCkPH4cuJF
 boaBlJ6m394ET/I2nGxQYvsYNO+FeYNX6ZPy9Q12E9uYuvdLBOdG+xaX8EJQCW1je2Mm
 AJdbH34UpGtDS7hrVblLTdHoJ7WVz+3Wot+EP2F4XgDj3eW4zZSVC7E8vF8wWv61cJ9q
 OvCm1uOouzM9pAr/jqW+TI2BaplDBjo3Y4oZ4ojVJKjgBCvqkh1+ublpks21vrrb7cYa
 xgig==
X-Forwarded-Encrypted: i=1;
 AFNElJ9YQmqlBrjKXriTvk8vBMlLvHvlvRzv5hEjsXlOrVQ7olfZmjv+kvgqhb5hVc+ZyEBuegmNOMFenQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx9pd+MGwC38vStMqk+RDm/hwga1H7lW9G8SnGliWlWL4abMDr3
 eQ5+MOWmvLGfS2WFLJeSC2CjThOEubEwYyAHAmX8Uyoz+pbbj9geC4pUWhJjVoQljnk=
X-Gm-Gg: AeBDievJC+zxAkBuB9tBN3uP8sbIx7hxwhwsOrsgleJzHyYcNVRiru4OBMrmBa2mdZD
 kfCHdu5+CpA0+orznASfRahb1jFtHBPeeLQiGnOLpBMJ8s8+X4rhHyOBZZlJqC9AuZJdnHpRKP+
 e+cP0bR7hEerGbzuF19Ayi9OXIcavG8aUjK3T6XOaXo7tNNn9jdQqRZx1hYf+/I+jPjAii04Ii4
 wuxkzGZhCDqjjchtUH9SJGRHDX/AAB9mGSElHhPJ0GkGEZJbFDqK79lvUjaPAGx7NWAnAj2O6gR
 7B1T3zT9QspR4VPLY2STm6eaDnr4LMp+ykRjzdl859Y5ID2Rh1YecFFBImL+KNqEevl1diS50V+
 QQbCssVbwggNKJVEPpzt8uS3NqIkvjBSBcBnEgm/vUJWb2skx3ZONaE+p6dO0XcU4IVt7lf6xdF
 YLsdJxh9+apZ1eoptSCYN/2aG3+N1cpHEuNg==
X-Received: by 2002:a05:600c:19d3:b0:489:1ae1:4eb9 with SMTP id
 5b1f17b1804b1-4891ae14f23mr179317695e9.28.1776862386147; 
 Wed, 22 Apr 2026 05:53:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a52583fe7sm162310925e9.13.2026.04.22.05.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8B960612AD;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 20/32] target/arm: use syndrome helpers in
 merge_syn_data_abort
Date: Wed, 22 Apr 2026 13:52:37 +0100
Message-ID: <20260422125250.1303100-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

One more step to removing the old defines.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 565954269f9..c74d8e785a6 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -56,7 +56,7 @@ static inline uint64_t merge_syn_data_abort(uint32_t template_syn,
          */
         assert(!fi->stage2);
         syn = syn_data_abort_vncr(fi->ea, is_write, fsc);
-    } else if (!(template_syn & ARM_EL_ISV) || target_el != 2
+    } else if (!FIELD_EX32(template_syn, DABORT_ISS, ISV) || target_el != 2
         || fi->s1ptw || !fi->stage2) {
         syn = syn_data_abort_no_iss(same_el, 0,
                                     fi->ea, 0, fi->s1ptw, is_write, fsc);
-- 
2.47.3


