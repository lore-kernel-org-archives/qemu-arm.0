Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A29EEA7184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:17:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3S3-0008MP-9H; Tue, 21 Apr 2026 01:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RM-00080E-7z
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RK-0006SV-Oc
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ab39b111b9so15582105ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748465; x=1777353265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK09IV4jv+83fptexQw6qhQ3h5DqduadUD1Gz4A8BTk=;
 b=S+le+dy34c0SvWCe/PKDHJzCKytZFi2BgBVr4I2Z/F866eXTTJEd4Req6o2cUH+hLh
 20UCn3r+vjwQyC3Dtr9MJ41mLAxHFbzAKgKJzzbKny+kxhZePLP8g4Djh7kTwn7Yt5QM
 A2d2sIxhrxJI8ZI4r8IajN8+4RkDMyrC3ROq2qIVZkc6pR5ubq6oh7N4HH59AUs/RR7C
 gSNsAiPvnp95zUcgzla2QWXLs3UBQU3+DRVXxi8PzuTwfmkotLrnp19eaZbbRATnSelL
 nqj49cQtyNSFT9ahX42McY2KhhT0ChTRa1Nrt/zVCMvaQfTAwRPWxXwdLickfmETKjCj
 z6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748465; x=1777353265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WK09IV4jv+83fptexQw6qhQ3h5DqduadUD1Gz4A8BTk=;
 b=NBVD/puRW7TGg69h+Jm83s8xHN2KSfDthR20kl5ESNlvnJeEEcpUPUemt4QRzvnMRZ
 EihnbxLh1hamq1X4soIqazXoWlNnO8r+WmPxSsUt/7LlEaj9i+506643YwN55Os3Ir55
 eaaLAczyo7q0qPFUZgb0LPlWvLDLVTyk/tou9BOlJKTKNtDkGcjH8PLhavYF9LTcSL+P
 Jwmmv4Hs9lcvNJ7SMbYIRQFYlSW0pFhe0aVGVmpesBrJoOXDwHEPd5IWxmqogKfH0qiX
 j6OCWLafwVQfdl4NvhAjbMMIo+8rIbEkMEAMZtllVo70hKwnYtDCWrl+YUriGa0fH+cW
 02Qw==
X-Gm-Message-State: AOJu0YyWHn4tAdmTzO2cJq91U2ldlAvyDILbgh/y/fLr9N6EpajlDUaT
 Ug2HXMZxIT/HtZknHsKUEmfzQx/I1bRw41NmQGirpxjrqvA2WjUgWlps3kPp1L7P9kCfwJqOZcQ
 VLfScA1A=
X-Gm-Gg: AeBDievzDzNiA+k1zyRnHpIPGI7TCkNyCN6VzOPWi4lluW5FjjKBiocYi4A0zMMvTpo
 Pk5k2hVXkqlhpN3LEJCgUtkZdxTWqZzegHW6GF8de3zFHQuwAACpr3xeeNl1dPoM1AxHotZwawN
 5XXm39mRqjxlFRCFhR0wuIVVI3uwAcqSCI9vzmncnap4KPN5R+NGczFEU04VOFO2/pVmxRJ5Tar
 AA8PvIS0FSetpVY76KErUTNW1vKIWX3xJXQkChmky7/o7C2CopadMsVlaFbaxDBUxBinDvhSeLm
 c+b0/nw/n3tO7yU4sNPbzcGxTPmL5PAkPiCvnuJwLQ0RMh1G/NUbgjyVFWqvAg+g7ov8L9XdjdO
 z20sjY/IxSsOo2qonAtjYlAHDgiVBCmFv6SpkocLCVVQWVFFcl32uzO8T+clYNUrsEueVBavx/E
 CV61dofZbbhsb9KmCwuwIuIE27ZPSZ1Fd3lwX/ucrj
X-Received: by 2002:a17:902:cf12:b0:2b4:460e:6fa8 with SMTP id
 d9443c01a7336-2b5f9f61d45mr158091645ad.34.1776748465172; 
 Mon, 20 Apr 2026 22:14:25 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/37] target/arm: Enable FEAT_FPMR for -cpu max
Date: Tue, 21 Apr 2026 15:13:23 +1000
Message-ID: <20260421051346.41106-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 343536523a..40ed799fb8 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1287,6 +1287,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
+    t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* FEAT_FPMR */
+    SET_IDREG(isar, ID_AA64PFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR0);
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 579df4c47b..fda73d3d07 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
+- FEAT_FPMR (Floating-point mode register)
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
-- 
2.43.0


