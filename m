Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7202BCDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:54:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGF-0004tG-N3; Wed, 24 Jun 2026 21:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGE-0004r4-2t
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:10 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGC-0008UY-Dr
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:09 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-37cbcf49deaso1132398a91.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352327; x=1782957127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXQBevF1dOv7VxOG8cDP5suXTbi/pSPJLgFi4iYWbMQ=;
 b=fJOVOCjsH76X4Zqk4ztHARRZVKJEHQoYTo5GOc0P88wT8Sxft8AotQk7SaDhYw9iQP
 vgN9IXcLA3UiTH06UstVV8ZmwNXC+TigG1MEjsQAVaORWtkAFvaR8oWgok+0PTgEP717
 m4H7c9zu0k706qG6x/uxAbDs4gKQitZM0LXauO3C/7x/fRBn1kwefAKq7CM5UCiUEPvi
 /2p22xkTd+BEqf0HVRC5/sqIGOOIAcKvBZSSgsArcQBUQ1bjsuhTu/A+d9PKGQId3bhS
 y2BKpFwFQcqlhJO3F+RjDmpKHDEJ3NbKANxcwRRRiSlObDsV4dx/9u3wHcg5ZGbBlJda
 ouBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352327; x=1782957127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CXQBevF1dOv7VxOG8cDP5suXTbi/pSPJLgFi4iYWbMQ=;
 b=AVlvy8oWlE6bWZPyPmhhW1vPoYQZ36KXk1bovBxFmeAsavrnj/Ftd5/S2DHIjmsgPq
 NbV1lZ6r9z2AGNe9prUHfpvdTaN5DZkKZ4dkDTT9NwODMhbc4jGtd3b3o+SgZygeQ+ZV
 1Gwzriyl3Vv1fbkpSs7ipUNSq8/hqlCNs/k8oXVdBQ34nbg603mnA8vTiAExL58CeyaD
 8Q6t+EULd8B+16evS8I6TZrGRSPCUAF3p8JbOjrUrumZRFc4Gd2WuCtngiTvov28Vm4M
 JDkFt/1cvvCsetJUbDEh9g8OXP7jWuCPK2np1YNleQFaf0zmdreFalRXhPYyC1pY3zPW
 DGDA==
X-Gm-Message-State: AOJu0YzTeVIPV9ymGoPkZ33Dkr9SXwk/rtNL2Zg5rwyqikh38C6VvnFL
 pyeUBjUJzWOWXEz3Cov4xypFW0p+23XTCpLFxdxStcR7c+4gCZlusSf234/ZmGcwLFc=
X-Gm-Gg: AfdE7cnbis5ZslEgkArdf1KyKoPt84g7tFHTsGjb/ypnbTrrJJCUYa2UbW7PudCvIJE
 ekKue8sqHCLDsYfmQ/bz6uxKVSFZPRpn1Cf5KYJCa5lnAVRzvVNGhpQplRpGlUhDG7xOskuqqtF
 2RS/IsOyc+y7qCuEl5HrsTwKLaRu8YFMQivQVCm+UElRjYcVrzeV8GCB8rLtQ8o+NKaW5xfLWrN
 zTF9hUWU0rgFWX1hkoTHXeiCIEtW9hAio8rI6IsCoBaAYSoJD9Rb9wlmsiX/O8jnSFKzkjHXn8T
 RqWx0D/NO0Sw5Ey2J7m3WPEUkTM5qbAjlUDiGfdzgN7qB3ZWgq7UgaWDA/nouwxkI3HTOX+MQR4
 LjlPS7NGppfW2RXhBQU+tyvuCOQS8ffTWlEt+gjaimAF6Sz4qaqMvOG3qqLOdDhc8AK53kPU4wH
 LQ01tBC4+dcv+8z6tBHbdvbQD1w33f0P81mXkhlujkh1CIXchjeQ==
X-Received: by 2002:a17:902:eccd:b0:2c7:9ba7:a39f with SMTP id
 d9443c01a7336-2c7fc70a33cmr6083765ad.17.1782352326949; 
 Wed, 24 Jun 2026 18:52:06 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:52:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/10] target/arm: Rename FVDOT pattern
Date: Wed, 24 Jun 2026 18:51:56 -0700
Message-ID: <20260625015159.719300-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
References: <20260625015159.719300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Rename to FVDOT_sh so that we can introduce an insn
of the same name from FEAT_SME_F8F16.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 2 +-
 target/arm/tcg/sme.decode      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7eeac28480..267a6b0d9b 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1260,7 +1260,7 @@ static bool do_vdot(DisasContext *s, arg_azx_n *a, gen_helper_gvec_4_ptr *fn)
     return true;
 }
 
-TRANS_FEAT(FVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_fvdot_idx_h)
+TRANS_FEAT(FVDOT_sh, aa64_sme, do_vdot, a, gen_helper_sme2_fvdot_idx_h)
 TRANS_FEAT(BFVDOT, aa64_sme, do_vdot, a, gen_helper_sme2_bfvdot_idx)
 
 static bool do_fvdot_sb(DisasContext *s, arg_azx_n *a, bool top)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 755d5f00d0..160cf130d4 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -662,7 +662,7 @@ FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
 BFDOT_nx        11000001 0101 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_i2_o3
 BFDOT_nx        11000001 0101 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_i2_o3
 
-FVDOT           11000001 0101 .... 0 .. 0 .. ....0 01 ...   @azx_2x1_i2_o3
+FVDOT_sh        11000001 0101 .... 0 .. 0 .. ....0 01 ...   @azx_2x1_i2_o3
 BFVDOT          11000001 0101 .... 0 .. 0 .. ....0 11 ...   @azx_2x1_i2_o3
 
 SDOT_nx_2h      11000001 0101 .... 0 .. 1 .. ....0 00 ...   @azx_2x1_i2_o3
-- 
2.43.0


