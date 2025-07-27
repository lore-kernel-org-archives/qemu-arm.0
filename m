Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C793C87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:08:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwMN-0007NV-9t; Sun, 27 Jul 2025 04:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLv-0005N5-1Y
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:27 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLs-00047w-KO
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:26 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso31841065ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603403; x=1754208203; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GWd/xEZNpqzr2re+HDg734KFb7ylW92QKYvsSGI2wwk=;
 b=Vc9XfNiBXq8lWOxPf1Rbv4fo/Zb4odYDFaP5gVkp8btIGD4AUa//Ksm5+XsBttHMgb
 mDCaUTs/xSj+MDqUFbZ3tSFV3hGgxqhn5olg+o+ZIi5+WprM9QojWl3mrT+BN5iQ6NxC
 ouHYcFUgYbipy76gjT/Hjz4T3zwbZs2wTrUfZjl25HRf/lB+gy76ACYuFPoMfZfzAjws
 aAsh95fR2tfKwIGRkkLitpRl9s5MOduG4ANiyW2+iNrPn54cJZ+pD7jaFNSyN2dCsfWW
 9nWRP1OpDvHE2pOSW2zoMdufRA57sjT5D4mlgsNA2f1uns86PbOPLhaK23tS8NcH5IxB
 lcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603403; x=1754208203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GWd/xEZNpqzr2re+HDg734KFb7ylW92QKYvsSGI2wwk=;
 b=tLCKzswnGYgS4NSIObLqFsWVXe6xFfpHHs3QTB4O9HyI6urCacx14D1oDwGE1ez6zO
 0DmB4xlXSxmt5NFctZDSsASWpqghp1BMHyowWvEA6VtJtcd2NE4b/7P7ki8h26apbUE/
 oFfruNi3QiFNHj2KyXZHUkKD8BtMZRH8kSkm9R6z91nd29BwlhU03NhPHVrnI3A9TW6x
 c8i2J2sUUWztobtOImBHYuBdR+eHGSeEnR4eJsCJyiYcw/GaAfRg2p06DAaiSjfhvXCC
 Mu1SmVVLaa4EzbdHE/9kZ+KRnPyV6H9rcCtlNE1FtOK02PUTn9TwnVdybPbXjE1GFslS
 RBhA==
X-Gm-Message-State: AOJu0Yyl046VvMB+3qrwv4wBhw42MfNKDvRZFCKao9uvzBv77cmmY6Tp
 eyl8jZ1pnLBGAfl0isQAxEUuNc6QFAdZ99kxMTtsotLdwqH+03laHFuiI42TiKNQE1se4qir30i
 eUvC4
X-Gm-Gg: ASbGncvcTlIqM4frLPpZnuWpvs3zfDA5yZhVmJ1Ic809fg3gZ6AKT+/vpoeH3Gr8/Xp
 v5rwe2EiD5FCcSc/kOa94vho9tK+h43/vZamKsPBIReTyLWlADE/NU//PNvMdJkI5dZAy9q/eCT
 qi3no/E1HUQFUe00TtR8mZCeLBAGjn0JMBZQ7SGMLLcx6Es4BErrjMi9YR1DbZj3dhphAQFztzN
 /sSIAMuR+bQlAmJTkhsr6qcC3wNQBsJju3O/EsuznrPhmtyv+MID4IatzmWCeMIw4v1ukcf+YHL
 znpPxwnubzmkJTmXU7q/X3rBuRqxfPz0pF3rh2ub6RUfHgoeJasrMZFiBNdWEyLuMo9HjambAoF
 k/Lv88t54dbdDtHVSFDvgE6UZdIltoXiKdGdNpgs7X0jXvzHnPcJbtLssvz7YIRExIBzvXoZfF9
 et+FwNHB1hog==
X-Google-Smtp-Source: AGHT+IHMb9WxuEK4kLQoowwafwOlbljK3CdNXO79VAWgTyQ4N0R5HuZ3l/GXTTinzvtc9iDNJj8qrQ==
X-Received: by 2002:a17:902:e78e:b0:234:9375:e07c with SMTP id
 d9443c01a7336-23fb3171f12mr110025845ad.46.1753603403394; 
 Sun, 27 Jul 2025 01:03:23 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/82] target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu max
Date: Sat, 26 Jul 2025 22:01:54 -1000
Message-ID: <20250727080254.83840-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 22ccc4f697..f4a41c854f 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1253,6 +1253,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 1489c262b8..6ebf9c9ce9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -123,6 +123,8 @@ the following architecture extensions:
 - FEAT_RME (Realm Management Extension) (NB: support status in QEMU is experimental)
 - FEAT_RNG (Random number generator)
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
+- FEAT_S1PIE (Stage 1 permission indirections)
+- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
-- 
2.43.0


