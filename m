Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB107C87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNix-0007cU-52; Sat, 02 Aug 2025 21:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiv-0007Xj-CO
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:17 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNit-0004hO-J4
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:17 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-71b76c2f903so16661637b3.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185274; x=1754790074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTiGzwvpwsNU7dZm0XrLbdqelbE5ohm8IHv8pUf2Q7s=;
 b=tbbmOi42DMWZ4F0Fg8fct8GYCTzwfAp5nArc0NDjuzmWLf8DLoP4dVXB4alM0ETgMK
 whfKPrTKobZqgFIRuMjrQl4AtmoUYRKhgI6ifabO8BNUgPVkHwhq9oD3xZzlwTpOsGmo
 Rx9deyqgXnIl1VpuDPASF+WxcvHunKdZ4Ydwb0QbJ3bp9OYgv3cnPQuH03gLkyvP66Hj
 V+sa79Xp+xJFXXTGdwoUKShDUMJgcd7Krttd8Y4RuuPfMvtvRB5qqHMS20VW2RdWhdzI
 pyHhy3rWa8r7X1yDrNqup2qn5hl7G9pko6W/mv+nLEkB9YCgccxYVCaoxfB/N02Q6gf3
 +X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185274; x=1754790074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTiGzwvpwsNU7dZm0XrLbdqelbE5ohm8IHv8pUf2Q7s=;
 b=JwzT2FSsmom+4uN9CL+LjGAkcE6RRgknf/Lu/DSa/ZxZzVO2biI1/kpirO5uxXsm3Y
 swOYFJVfZR2wZ2yA9RvOcBqV7CiPcMoGYkgWLHYEF4G5bw9tUaFy/JwsRUV0EYElueKu
 sDYummqKBJvcR9Ann1LvYJ7TfH7lEmo+K+FKz1KA2OnhTQbBTL/2o/PooEx+6BUqwR+D
 IHsNzdcqgUYqb2oDpnzk4G3XNkFJu7wOItNQfF9MM1SIvAuHhRbMd8Z96idcPvxhpWls
 AlNebVby2PlEQ1m1VME5MvC2oeEUr7FutCZycPds+W7AapT32Nc0U6oN7/gFpAb/YWgg
 BsVw==
X-Gm-Message-State: AOJu0YwPfJJ5o3plpXftqY1pcEtLPG2dW8JkSn5hgPFOojLJTShccCgI
 GygAmIa5tiGlVsFhDjub9plmpM8rfDHkApECjsTAFKCpV1+g2Do2aNZBzFLKybBrtDKoZ//Rw8q
 1HxRs070=
X-Gm-Gg: ASbGncuW6NKcRsuJqJv6RMJ1CQgkQylN8BjU7kLl25bRxdCbqZTZ5V8N7XgV9zV1TbP
 Po2+zyBtAnbq6D9XHkdHxcfqvYqRrnS6FNTeutfHvIz9b2ccxBmwhGyQ+n+md03QvYKn1WpVpZ6
 X/dZLMEzFM7oZJ/+kDqfAtsYrIFicV17gISoeWuHyAW8+Zr9KMaP7MCQtsYMsHKcRymI5pYG7bG
 aPPv2BV+wGBWvXTDJnFX/vgCYsRYkgq+TtCJpTYi8ZzDGFqpCa/+t/Anyz2h+pQRQMM5saWbhrg
 TehIG9WKYWMnNwvRU5hZJ0uPRDBhg02wevh+xKgAQaeHrh4wQlEdQIVxTjp8GjHz2SJdzkaT5I7
 AjwSll6AFC4L80NlXfFqucr6xuFp/fvBsjqfb8BbfC3T0Is2hDwP7JQFdUwVJdkE=
X-Google-Smtp-Source: AGHT+IHzBFEssRSoIVW5AElrclLCaLH+iY3cf6RTW4FyBHcfYAwoFaBKdjC/xJzqs6lxFPf11e8SkA==
X-Received: by 2002:a05:690c:388:b0:71a:354:ab3 with SMTP id
 00721157ae682-71b7ed16fd4mr58195387b3.3.1754185274461; 
 Sat, 02 Aug 2025 18:41:14 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:41:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/11] target/arm: Enable FEAT_CMPBR for -cpu max
Date: Sun,  3 Aug 2025 11:40:19 +1000
Message-ID: <20250803014019.416797-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1134.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c          | 1 +
 target/arm/tcg/cpu64.c        | 2 +-
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 4ab6bcd50d..b2461aad2c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -877,6 +877,7 @@ abi_ulong get_elf_hwcap(void)
     GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
     GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
+    GET_FEATURE_ID(aa64_cmpbr, ARM_HWCAP_A64_CMPBR);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index d4c021e34d..d0ecd517e7 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1178,7 +1178,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, MOPS, 1);     /* FEAT_MOPS */
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
-    t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 2);     /* FEAT_CSSC, FEAT_CMPBR */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
     t = GET_IDREG(isar, ID_AA64PFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b9b11e82b3..1b7f7881fe 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_BTI (Branch Target Identification)
 - FEAT_CCIDX (Extended cache index)
 - FEAT_CMOW (Control for cache maintenance permission)
+- FEAT_CMPBR (Compare and Branch instructions)
 - FEAT_CRC32 (CRC32 instructions)
 - FEAT_Crypto (Cryptographic Extension)
 - FEAT_CSSC (Common Short Sequence Compression instructions)
-- 
2.43.0


