Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C08C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 17:58:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiFUX-0005iz-7i; Fri, 10 Jul 2026 13:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiFUV-0005hm-8B
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 13:58:23 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiFUT-0001T5-Nf
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 13:58:23 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-84874b52eabso1390514b3a.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783706300; x=1784311100; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XDiSL4skeBdw/QfZ4bPcuanFzLKyweW4gBYzMWPnN78=;
 b=AN2iIDoiZkaI7fG8lrAP+iabSuGt4aVvlK+HJbkvDp6pwou19jgaJVPYKqsmMmqHyg
 4QV/puMvvy7ZhLsL9jnPFa5HYDYrAkzhwqpv7dPEPLAx4D+FAh/XCNOA3dsAeRd8e/gP
 0BsKR5Ub2/58K4sKppwPvtdJAEJeJFVlIHOpwMAE7h2+MSpo3N6C4kt16z8PvrUECiis
 okwXQMB+c7NZj/jaG9Ey3xxmLjg7AvMOSKsqCTJiqBj0rxNxgpvEAXGjHLRzYg3ZXGm2
 LLlU8wbzRb7ikVDs3BAywzE/wUPytORIM4u76A6DWccgvqXOnwYd4u54REloUmniTmdd
 c08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783706300; x=1784311100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XDiSL4skeBdw/QfZ4bPcuanFzLKyweW4gBYzMWPnN78=;
 b=os9rwI3/sr3NRB9H5oMTcr/SHiDTmLnfxm5bdrWTwqC9Zq7QfH4Y3MpG0L/OOJ2Tqz
 ReDRfW6PiAXnicF6N8SknPnYh8SeE3z9ffAxYXkMH9s91BgDn7Kca8BydpTVJ4zISJYP
 aTsx/jizDaH7SgEM5l1GtVjmCIKnPDNI3ucS+mP9uE89QCcwauvbRyGaQjIXwMpzC8HK
 OQedYhR5gpFWO0Wyin54964HgJVbq6U0ycBewFJD9iAbFp7yT0pfX4IlywUn+bAAt9zQ
 VGyjobDx25VcCc51KHc/j+NJfhZIBOeYj7u+cYBgzQlyC4cQrltFB+0aiDenRppzWGDM
 Wweg==
X-Gm-Message-State: AOJu0YxTyouzQlJ/zTB8l9nIbFU9ZvL8dIz4XYI+ntD03lflzUXRm2jh
 4R7MnmZtx63xQbmHx+VPKI/Wf4pU7WlXF1RChmGpfm67Ssi1SdlKxgtuvb9tEHuZLYw=
X-Gm-Gg: AfdE7cnrsxvNzBxi1oiq0QkteuJQHckLnte4pIbSK6BG5plaRHL7Dp1Lmjos+HKf6mz
 ReEYmUbFLPUzfdXb1W8ooyl2+Lz+3emp6TlqYOcilbc0F3i9wMZSOc28Ora23Qj1OC9wNk5BSzO
 euFaZB2qPPFyaGDKY37r4Z05S9ULW+oTaU3sJWOj309qcktcxe8ALpPo6rzbwKrfTZw6J1OEASz
 +JgrnHPQedcHhkdC280UkfZlR2DFPDjGioQVFs9rWWcKYW8KWsDGcRVNClRYKUk4p/Mab9y4jqv
 PPpfJqbaL9PsGCc7LiFyE0v4vGOIdaQWNW/FfllQEsJ27G1hdv07ENEF8dB7cKIMKFRoqApde1Y
 64rAtcXx/picd77puislhfAfqKUE8iUSD7AHEi35RkOdNinHbZ2UQA6t4z1if0rn2YVNLL2WLU3
 Sam4oROLJP2cXQvhdbyw==
X-Received: by 2002:a05:6a00:9501:b0:848:50a5:a70b with SMTP id
 d2e1a72fcca58-8488962feb7mr102545b3a.21.1783706299599; 
 Fri, 10 Jul 2026 10:58:19 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6db29d1sm10715973b3a.53.2026.07.10.10.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 10:58:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH for-11.1] target/arm: Be more defensive for invalid
 tlbi_aa64_get_range
Date: Fri, 10 Jul 2026 10:58:17 -0700
Message-ID: <20260710175818.528974-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

It's possible to program TCR_ELx with an invalid granule size,
which could match passing an invalid granule size to TLBI RVA,
which would then fall through to assert in arm_granule_bits.

Cc: qemu-stable@nongnu.org
Fixes: 3c003f7029e ("target/arm: Use ARMGranuleSize in ARMVAParameters")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/tlb-insns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 1a0a332583..b24eb57788 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -854,7 +854,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     gran = tlbi_range_tg_to_gran_size(page_size_granule);
 
     /* The granule encoded in value must match the granule in use. */
-    if (gran != param.gran) {
+    if (gran != param.gran || gran == GranInvalid) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
                       page_size_granule);
         return ret;
-- 
2.43.0


