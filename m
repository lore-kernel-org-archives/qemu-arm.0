Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B353ACD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:53:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gk-0005RW-I3; Fri, 29 May 2026 15:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gd-00055y-LR
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:16 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gc-0005cH-5p
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:15 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-40ef10ec84cso11792639fac.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084393; x=1780689193; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TJKw9ntV/Q2yFHpEVRYGUEahB0rXJZjAtu4I0qozEHc=;
 b=i/Y0maWg6s+jvV9wgwq9TysI+7tWu8F++YPfRZy8cs+FpzwCE/YwQATAfr32vLUicL
 WQ5v9T7+QumIL+DOMgcoGJcqCwrfINnI/6HEZinHMZj9LpwB/E3hswqCkKRSvVMQekJN
 66cPxk5VsIptcr/5sSC9Ora/2e1VsIkv9TwDYDQt0STrJfbMprThjKCyM0mU+ivzGuxL
 N082f+P+0kC6SDgbFRDKXFR0/OXmWpAxxBuxBK6/ttpmoxYIjG2vEeOES3g20mjL6lwR
 FzuRvmuxnulrEiE0H7mVTbailke/p3OifsADUc1pgTs1Jjfh7Z8cAi9t5hRizN77X8jW
 vWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084393; x=1780689193;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TJKw9ntV/Q2yFHpEVRYGUEahB0rXJZjAtu4I0qozEHc=;
 b=Km77iG7GEeYf4mLmvCB7yy6Sv5A+2qAF1i2flKsTTehKT4GVpWbW5gvJZF8qHBBVn7
 8xPEHX6tJD0eIhnNfCF3OmvKEzXd9Ps1NiKzZzXx5EthvL7r8xSzln1ZkFvoyjOtySS0
 THI06Z/N6orDRknh3KyCQioYtujq/PNS9eqvDR79uppwO8vYBLSFOs6Msfyxs5FtQpVj
 DZvCCeFn0mWxWjpwLWXSY9mDrgS78UUXwNhhZ4rDFitef6j9cArDONcJxMUXilXVyKhh
 JeNdWEz2MtjYwKF/04CWz8EFB5SQWpA4SvRcEmBt+lPlxb7hfrMakWDCA474YY/EtyEo
 X63Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9CZs47RKV72s2gxT/em/6aSSJcwKaXdA2r97osauS3CZ/eK8SvUMOH52jc9ioKIt+NmDOFtS7YAA==@nongnu.org
X-Gm-Message-State: AOJu0YzeHun1nTvx1mr2mlVR9oMfMsqC6VjZOmp6GCiekXVYTHi6OduX
 TdBNJBvMnAZmoqfuDaTO1L4v6ssJpSb4tbupRjUdGZakdafowvJG2Ebc
X-Gm-Gg: Acq92OHEzzhu8N9wkWQfWv8RXZ+1kiPyukWGDuV65cPjKUTj6wLqaUpPYuxcl9JHL3o
 x0T14y3/SeflzidZYG9S5cmPukN9clLzAZEMBHLvCeXwefvpqlQDHrOQZlMNUojReGTdMsTklcV
 fk7L0iIWa/wzi/KtgyNs5vQRuqmOqmqTIKmrHac0eCMu5oWI26P+X8omcyFLoJ1B9grijsPN75e
 CTbltO7vQqsdWc3TlERqmLdBoMVkCM3c2vyhj2Vm3OxxGzM2q9Ws6JtADezFyX0qjqS2JEqA+oY
 DgMS+hPoFFElRtMIsCYgO6J2ler0E3AlRnqHeww7rr9Bjkgwph+ifl7RFZBVJ4Lxt/lyuP5KLmT
 CHmoDtL6j6drnYOeRzkmAHRGuMG8PgxBOA5CpSCKPUHIL+H+Gh9JJGvUeVowmczkyt5hRcDXjZx
 hBeVbuaNaIXWIG2mPa77RB+546zljjY0oYCiqFLwQOukE=
X-Received: by 2002:a05:6820:1986:b0:699:b131:d587 with SMTP id
 006d021491bc7-69e10436d38mr383784eaf.11.1780084392825; 
 Fri, 29 May 2026 12:53:12 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:53:12 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:53 -0700
Subject: [PATCH v7 13/15] docs: add MTE4 features to docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-13-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=2175;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=dYDek0cM2AigowKbRtIvnJyxcZsnT2aDCHX5pbUTS+M=;
 b=HV302SNuYCnwzJLjqOjay3OIwb1ZFNnrKsTekrmU31CT+vp40YQasOAjETXYzNIgCc3ye5oj8
 H4EsvWl4ksGBQVeuM+SPQop1thKvT+qq5Hq6qEsVNjG8BNf7iFaCGBq
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=brookmangabriel@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The implemented MTE4 features are now present in
docs/system/arm/emulation.rst

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 5 +++++
 target/arm/tcg/cpu64.c        | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index e44b3016be..eddbc12ae7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -113,6 +113,11 @@ the following architecture extensions:
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
 - FEAT_MTE_ASYM_FAULT (Memory tagging asymmetric faults)
 - FEAT_MTE_ASYNC (Asynchronous reporting of Tag Check Fault)
+- FEAT_MTE_CANONICAL_TAGS (Canonical tag checking)
+- FEAT_MTE_NO_ADDRESS_TAGS (Address tagging disabled)
+- FEAT_MTE_PERM (NoTagAccess memory attribute)
+- FEAT_MTE_STORE_ONLY (Store-only tag checking)
+- FEAT_MTE_TAGGED_FAR (Full address reporting of Tag Check Fault)
 - FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a377f67b9c..eb4003c732 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1295,10 +1295,15 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
+    /* FEAT_MTE_NO_ADDRESS_TAGS + FEAT_MTE_CANONICAL_TAGS */
+    t = FIELD_DP64(t, ID_AA64PFR1, MTEX, 1);
     SET_IDREG(isar, ID_AA64PFR1, t);
 
     t = GET_IDREG(isar, ID_AA64PFR2);
     t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* FEAT_FPMR */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEFAR, 1);    /* FEAT_MTE_TAGGED_FAR */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTESTOREONLY, 1);   /* FEAT_MTE_STORE_ONLY */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEPERM, 1);    /* FEAT_MTE_PERM */
     SET_IDREG(isar, ID_AA64PFR2, t);
 
     t = GET_IDREG(isar, ID_AA64MMFR0);

-- 
2.54.0


