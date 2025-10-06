Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051B5CCA470
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 00:12:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5Yos-0000FS-Dh; Sun, 05 Oct 2025 20:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v5Yoa-0000CQ-Fb
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 20:10:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v5YoW-0004E8-RS
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 20:10:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-33067909400so3155187a91.2
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759709450; x=1760314250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l/93bmDUusvGPtBSWOQh6Rq5pqOuM8kQWpxAeUIhgpQ=;
 b=YNAL57wOuuLon9xddhZb0GfqxbcCplNkV7AdrDtiJaUTmNbFFyLOPCCAENgZlBlp26
 u5iSVjfsZu8RSMRsGxQ0sZebMNGfsHa5yjL1xu+TgEjjjH5Hsp3LOyDoHWWRHs3qERSK
 woBU0/Mm/VfJMB1xlo1tF3jiKNIxTldwEVy0e4ZdF5LP1NwK2sQdsuHbgORr9n5EGkNc
 IGYm4OGUQ7145p2SSXuwSiyK+v1dyWVZbhMGugDC7yGCIOp7CGYPjNKzrUtEjZzp0Erl
 EUBWW7y+8106pE6HFsk8VRzYejXgjhQ0d1ewnH8I4dNJZNzN81fonLXaVcfvBRvQJoCv
 kd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759709450; x=1760314250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l/93bmDUusvGPtBSWOQh6Rq5pqOuM8kQWpxAeUIhgpQ=;
 b=dxGxOqfYUFDX7jhxqhLvO/1o2mCz+TBBoXIspYBIQWwh6e0ACnDsJ1oB2MTXu0RFMX
 HYndQKSzdG87HG5qT9y5o/TNyNBGTH8S+b7hbDraEbyCtf/3wHiETPwg8N7dg3nm9nVu
 Y97lbfC7R8FXb8G9PFrVrSw+ICD7V65xraoSXHcDvPjYY5hFlpbwxqt9KnMjTyWnjuYk
 v9JGnIlHQT2j0jVVrEqoUGh5VFNqb6u187Jocgi1mSkg5IOSCaob7mvVf2RWx2E35FPW
 q9IJxVXgR1W+KLsyvbaRKFNjf9ZZyM/zA+OtuW6buKYdQlOEK4uTA5zOWzluodUkrcV7
 vgtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkEOquTaIhRAkYaJuiasaPz/Km7trmnvbtd0sO/R5AGUsp1axEW2MKKefghBXgYiFl0i5Rr4iyJw==@nongnu.org
X-Gm-Message-State: AOJu0Yyd4GfAyiTgnB3CdgSNPYcveQqQDCy2rItldpMnmacfc4sBqM16
 wqzzyGbg+9czSPgkgvqGwv3u/4FrwWluzg8DFTE4XZPToqUfYeFLJpdz3tihIYRXA+D872NGNig
 MTR8w
X-Gm-Gg: ASbGnctDSiDVnlXAj+2Aa0UIzCyu1O4sZ6yym2/+2rGlM3H3DwdZ8rmZDKQKo2OpOhv
 6hRrWqhIamnHGz+L5HRlcNrP8NkQW9tmxHAHHB38dNR+WtLrPuTuRz0w1zucAncQWSsJYuwDmOg
 J8UbK7bv+d8VjK0wEVOnijl06DLwWDvqBBdIuOgZjAhVnmicu7yQC5J1l0JIxR93QkLROfx6E1V
 bk8sC/h1z4zy+WoSTRF//ei7t/lDnUY4sq9x5jzepaqygfIRIO3ShzrfrBQhnhzvJKniQ12EVn1
 dwj7UIoH6Fi4UQ3tOkDEXcsLPhqtrGOvYiVhGwssKCIe2Vr1mCPIh6y5dwtc6n66EZ1P8QDBDsL
 wFO/5YSQy+HPtN+TTECdp1k5GJQtZiogOEcReXW0hy3tBFhJOWyCmM0For79NOMjluRo=
X-Google-Smtp-Source: AGHT+IEpDFex5TWeNxkxhX6gA+0YmZOzHqrcpG0SjJiQVPmhJxlkMJHxJ4VxFIr9rgfp7qlewoSgsA==
X-Received: by 2002:a17:90b:3b41:b0:32d:dffc:7ad6 with SMTP id
 98e67ed59e1d1-339c27b94demr12136386a91.33.1759709450337; 
 Sun, 05 Oct 2025 17:10:50 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339c4a48584sm8804881a91.23.2025.10.05.17.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 17:10:49 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v10 1/3] target/arm: Add a cpreg flag to indicate no trap in NV
Date: Mon,  6 Oct 2025 00:10:16 +0000
Message-Id: <20251006001018.219756-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006001018.219756-1-gustavo.romero@linaro.org>
References: <20251006001018.219756-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1032.google.com
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

Add a new flag, ARM_CP_NV_NO_TRAP, to indicate that a CP register, even
though it has opc1 == 4 or 5, does not trap when nested virtualization
is enabled (FEAT_NV/FEAT_NV2).

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpregs.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 57fde5f57a..abee72c9bf 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -136,6 +136,7 @@ enum {
      * identically to the normal one, other than FGT trapping handling.)
      */
     ARM_CP_ADD_TLBI_NXS          = 1 << 21,
+    ARM_CP_NV_NO_TRAP            = 1 << 22,
 };
 
 /*
@@ -1158,10 +1159,14 @@ static inline bool arm_cpreg_traps_in_nv(const ARMCPRegInfo *ri)
      *
      * In particular, note that the released sysreg XML defines that
      * the FEAT_MEC sysregs and instructions do not follow this FEAT_NV
-     * trapping rule, so we will need to add an ARM_CP_* flag to indicate
-     * "register does not trap on NV" to handle those if/when we implement
-     * FEAT_MEC.
+     * trapping rule, so a register flagged as ARM_CP_NV_NO_TRAP indicates
+     * the register does not trap on NV even if opc1 == 4 or 5.
      */
+
+    if (ri->type & ARM_CP_NV_NO_TRAP) {
+        return false;
+    }
+
     return ri->opc1 == 4 || ri->opc1 == 5;
 }
 
-- 
2.34.1


