Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32687CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:26:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXep-0004Ya-9w; Thu, 14 Aug 2025 09:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdw-0003O4-HB
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:20 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdh-0005O4-8q
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:20 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-76e2eb4a171so1417155b3a.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176702; x=1755781502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTzILFxOh9VPP18+18G2a8oDIZLGKqGhECeVoAfm6S8=;
 b=XGFf3B2ld4uo57k7Y6eHIZg9zR9q7YuIzF+TwzZ+kL14f0VFXgFKyD112sJ25f9I+C
 Fc2WYov+FbHOm8S3cZYsSf5bfynbhnm+NwSaHgqPJJpdZ5d4XUyoYtk1r9ZS0vYs5DTr
 R6YfAfNvn82UKodIs85Hl8W6NSnMhF/DZ9wx1W3D+o+6AgyZ0Um9Os3ySMbzH+iSXqpx
 M75daqiErGqTvWVpq0J1n4V4+m0E9E4i/UIfVpip8MPFr6fNKtnZmxBujuDO1AKB3vDE
 H0w6gDo+vubiytQ8Bzv/I136RWVedWc57EAahEEh1v1Qtb2e5XjkzRDQjWmiOptIGYEF
 PCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176702; x=1755781502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTzILFxOh9VPP18+18G2a8oDIZLGKqGhECeVoAfm6S8=;
 b=kpcODu328LIPH/HcfVgOPq1Ru0bqsFFfxI5w0YKvZiutbkBsV1Z1rksskn4J74turq
 Azxo2R4Ly0IsUFwT5gXw7fXBBUI2SQ1HJjAIMCCsWw+mptbpH2i9cdHIjq/pmi8AIdw1
 GRMMTZW8F6Xw1Q3gtZYInYw9zmzzvKqsS9R7z2f95lxPcmq6nkXLiblYiVuS2fqosssM
 KRs/+osEzPxXi/2GfSq7eGEsSo0cxoIkuQ1MCQeFo5/cyY14Y9eJVw4BECwUSAGUJ91v
 FRoAoQTbMXTjDxtgmCnplF5UCtZc2jM6Gx0ariTMCNoNFp9LoU3B8BbFHt1cTVTWAVWJ
 Q8kw==
X-Gm-Message-State: AOJu0YwmrB7qJPUyidZ4cEJMb57xkwnlil22JqtsQrlu2trzbH6NbFy3
 +y3i69djeS5IkbXzQxpfhlFrDctJGv/bGEj7HvN3eanY4lE/L5oxrJwt0iNw8y7GsOhlZiTlEZt
 q5c42+kY=
X-Gm-Gg: ASbGncuPoCvloXOs29qOXqMTFKbyM1nHv1i/MLXXHYmMHn0OVWvuiuD5hg7h3b7acks
 M8lVtA8pQZt5CNwI6wfiCrEHwS3ZGNcmg2wfwi7Y0PYMsy3ZcdK1sNo74zUwVFXVf/cGVCKihHG
 LzzWMRkvhTIaNT2nnQitX23AZbrTcDp9VUmaxFUk+LzxsCTEuia5HeyAK7moYnPG9Wa4fMKtQSj
 oW91AyDvvfV5bydbVO590mozAz8xTIBvs60MFa8LXnJzYyGFynwHmjoQsu5h7YrwgInJYVb0D9I
 zWnY8r0OcPSzSA3lsSWHP4YkRA2j1h+tAjRpo7KGiz4AmS9Ef1cN8FqYySyM4QXyzhPppH8nTcS
 cWMg6AFX0fECy5Tqa6XIKV7wQdP5NZcJNFPC67EtYZg2VvoE=
X-Google-Smtp-Source: AGHT+IH/yhMZGJainqAx6hHcFZvlcDOdk2i/f3M6T3xLNUelT7aLU9oeggaV/hW28XdEfr90dG/Y+Q==
X-Received: by 2002:a05:6a00:1995:b0:76b:e144:1d91 with SMTP id
 d2e1a72fcca58-76e2fd72ca2mr4558954b3a.16.1755176702220; 
 Thu, 14 Aug 2025 06:05:02 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:05:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 73/85] target/arm: Enable FEAT_GCS with -cpu max
Date: Thu, 14 Aug 2025 22:57:40 +1000
Message-ID: <20250814125752.164107-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index f4a41c854f..0c3408c0a0 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1205,6 +1205,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
+    t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
     t = GET_IDREG(isar, ID_AA64MMFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b894aced89..9e3df48e00 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -72,6 +72,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GCS (Guarded Control Stack Extension)
 - FEAT_GTG (Guest translation granule size)
 - FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HBC (Hinted conditional branches)
-- 
2.43.0


