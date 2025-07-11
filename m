Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C535AC83F1B
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 22:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaMb3-00010U-Lq; Fri, 11 Jul 2025 18:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYa-0007PZ-GT
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:40 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYU-0008Lh-BN
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:26 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-610cbca60cdso1494942eaf.0
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 15:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752274158; x=1752878958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YI3COkHr8iN6ZiZaBxW0Jd5c0UbnphQ3x2NypN3ngdg=;
 b=TBmsc+RcBJ4D0Vaao/543Ht96+847qobVBvPVd0gzjX+5IT1XFckJA1G6oQB66rzWO
 1AfPDxCHIH0d3kGfE6SKnkWXViYHGXzwnRNUTCCpq1UfFcUEwQlqG7NBNVLMXUlWQInq
 zIbJClYhIBhoBDTOEJEpo6K3sbyXw6+6FILoai8rDzvOwLDZMzNl3ZL33N2qdT1XS4na
 Galjws1xqPocDB1gGVH9M9jCPAkWRUOkRzXP2e7j645b40HrXhPF0gynwKYVe1SWvGjK
 3hWN4gqjpnWFO+ZqT8I/cYBsBK+19HjQiJQiju25AEGsvfD9hOpG6n79jO9/Givev9ab
 yBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752274158; x=1752878958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YI3COkHr8iN6ZiZaBxW0Jd5c0UbnphQ3x2NypN3ngdg=;
 b=Fq0K06NY5KYQqM9nKonYocCkcwtJabfPwDVfTi59YO1P/eOGKuxsHljiSx5BKKaPe3
 Wk20CaFabbqXynbK9q/qJwvNVbGlnJzh7UN2HMFWLYINzvoBqpCQEGCU3DvgdW+GlebE
 5/5WPMQhdYUG7FAUZmJCTu5qY5LBaieYjEGPRn+6iInhfiX3DAa+J5RJHBiS8LAvjigr
 9Y+bAnzVFfE+yCt7/SWpA/fDjM/UcWRPFx8ol1vNOVyCEigcPnLNbENXCrVTsp9P9SCB
 QseQXQRhn70sHkDmwi5wUfQjTmD0XbGd+Uhz5xrxugGso3N/6FaEqMcYsCRehqSlMn4m
 75MA==
X-Gm-Message-State: AOJu0Yynf/BRQRpKuW8xpjosDaHS4k9HbQvnMMRRoO0CGYZfp87gD3Jw
 MUu3TEU6i6Rhl55aUJuOOthk+fSzAZSoJYYBtwlzdp1ppVZM3pDqkzoQkcDWXQ8OTjQ=
X-Gm-Gg: ASbGnct38ptl1787UfIbFlncPzvD5m13kI2IoK/CDpS5negNLWHEG5EryvekSDZYx/N
 TMpfxh1kVp72hgsLhQmF5vJoEXhMoQda7WQ1Q/MG2jr0LwN4npd9vz1EFq5hu6yp1GCQpBomcOi
 Gyq4L0KHzOqkHGbX4JZ28NJkFhwlCSuFoVefUfvFqnKxcBioAl0iOaenXcvRqJ/MwJhprazowGE
 U/37cx9W0//VChsQAlFiDNssJAB8tVxALhawi0HdAWtnmzjYckbNitIxhTST9JWoceBt1lz3JUE
 6dcJ5VV2v7kPL/aWFRg2D6Nh1js4/EnpgkEEx45ra58tkG5I4sD98gUF8PAwqwv89Pyhy6rE/zO
 rTR6XFHtXET5ZzsSNcea30csAWnD2pkaiJB9Ngn0Mhp4xk013YJKL6/UEh+rku5I4SqkH39kY7m
 pTOuZed78/
X-Google-Smtp-Source: AGHT+IHiOk/nudTrx16YoB0mjKaGzpwBRRQcQDPOJ6CeDh1JpZAVD59V3kste1hWqwbc69XJyk+BfA==
X-Received: by 2002:a05:6808:3026:b0:406:72ad:bb6b with SMTP id
 5614622812f47-4153a1841bdmr3373191b6e.37.1752274158164; 
 Fri, 11 Jul 2025 15:49:18 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-414197c6064sm696638b6e.20.2025.07.11.15.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 15:49:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/9] target/arm: Implement FEAT_ATS1A
Date: Fri, 11 Jul 2025 16:49:06 -0600
Message-ID: <20250711224915.62369-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
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

Based-on: 20250711140828.1714666-1-gustavo.romero@linaro.org
("[PATCH-for-10.1 v7 0/6] target/arm: Add FEAT_MEC to max cpu")
which itself is based on the 20250711 target-arm.next pull request.

Changes for v2:
  - Rearrange the protection check patches: 
    - Do not drop access_type across all functions,
    - Replace access_prot with in_prot_check to S1Translate.

r~

Richard Henderson (9):
  target/arm: Add prot_check parameter to pmsav8_mpu_lookup
  target/arm: Add in_prot_check to S1Translate
  target/arm: Skip permission check from
    arm_cpu_get_phys_page_attrs_debug
  target/arm: Introduce get_phys_addr_for_at
  target/arm: Skip AF and DB updates for AccessType_AT
  target/arm: Convert do_ats_write to access_perm
  target/arm: Fill in HFG[RWI]TR_EL2 bits for Arm v9.5
  target/arm: Remove outdated comment for ZCR_EL12
  target/arm: Implement FEAT_ATS1A

 target/arm/cpregs.h           | 29 ++++++++++++++-
 target/arm/cpu-features.h     |  5 +++
 target/arm/internals.h        | 23 +++++-------
 target/arm/helper.c           |  5 ---
 target/arm/ptw.c              | 64 +++++++++++++++++++++++---------
 target/arm/tcg/cpregs-at.c    | 69 +++++++++++++++++++++++++++--------
 target/arm/tcg/cpu64.c        |  1 +
 target/arm/tcg/m_helper.c     |  4 +-
 docs/system/arm/emulation.rst |  1 +
 9 files changed, 146 insertions(+), 55 deletions(-)

-- 
2.43.0


