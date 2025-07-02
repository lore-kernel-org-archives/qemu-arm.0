Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3705603qtb;
        Wed, 2 Jul 2025 05:36:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgYkwHoLhY14qYvaM7BIDD71qQ9RKccYuoOxEQx17DmMJQUR6j8BNe0AdUX4yJ+s4oCpq7GyMFZ36qKA==@linaro.org
X-Google-Smtp-Source: AGHT+IHyRkglR+YKyZmMUGZ+SxQTtPqqgepcYNcH9BFH/GBmmc8gfIET1T5XRMkznNnD0y/t+FgW
X-Received: by 2002:ad4:5602:0:b0:702:b506:c13c with SMTP id 6a1803df08f44-702b506d076mr19803386d6.7.1751459804693;
        Wed, 02 Jul 2025 05:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459804; cv=none;
        d=google.com; s=arc-20240605;
        b=k/wpQw9JGr7+QCehHrZRqU0NEbk9f//06E//ydTzyDXSss2DUXoG5X6/tDKT/oxLsu
         5KtFLPdB2aFHEmfv5bgveTNfhtpwBoHwHFplsv88UBPGSdTb9YmXRlkTqmPGtRTIOPhH
         I+hwJEY4WSv58xRHaHPUKTivZFbXDLlkL01lKPuSTuj+roBQkW/I6wtb9yzIq71g3yxv
         1W6P57J345Ys3cqoXPgvpnxl1+ux5e930YtAWx6N/4F/anxSn6EXJVXS34AGSX/XD9a6
         dgT4VGKj+JP0gXCJkkmqzvtWOgnkDXtCnqvJcuyF8edYqJl/efR/96xBY8vPwsZphpZd
         Vy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WjUNsC/tPxG2dLETLc6CC9CFxkrBSGpmnmuEo26OYIY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=MGCOIuVWFSxfXQnD8AAzsUkfbq5MvVafChEIYJdld00RCCtQIgqCzt9E5ThgNaPi0b
         2z3gY3JtlmNwWy4A+vlfWdUWkIW9ldO0kLowlyDuPVfw4b89vvF1jNaPynkjti56DElQ
         iC5zBrEvlOpUZdV9Vt2ijINK0EuQy3rRWhORoLPJXbGlvftel/R3iwtY4RfB3Un78c5m
         Vc6XcWbVMH3o9U1jaXDqWeibwtZYlyIyjTsFVUWhmWhynAsuzp2v1kBiSTLV2xyalE3K
         YJp+1UEuwhg9fafk8lSrCV/CFVNYZUuQs2K+bAl1y+gspQwEhBjinO2FN9iBeUsjLUkV
         oU6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2jLuibl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7738a2fdsi149671286d6.395.2025.07.02.05.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2jLuibl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwgi-0000Nc-Fm; Wed, 02 Jul 2025 08:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgA-000813-3z
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:10 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfp-00015a-1b
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:08 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2ef8dfb3742so1093496fac.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459687; x=1752064487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjUNsC/tPxG2dLETLc6CC9CFxkrBSGpmnmuEo26OYIY=;
 b=J2jLuiblf/ylvBSf4bfRG74b77Esp820Lv5S0FkWu61io9vmelfYLCxixnuHKF+y1b
 q7VgH/RP6JHH9viYDvOjBBjLYiQEUR9BkeP/tc+ad2No5OujJ8/GkYEYzEK3M1PQHWQU
 AhmqLDmsSJj/qUCIEFfdjs86nIMXZStnZM+eH+lN1qv5dFuoickyQTsffeMjCHm1pe39
 PvESZrNHVsgFE7hl+lNeH3q8mp7GBmCMvPcTzxlqfC6lmP43s/NMx/2K7M7xG1hbEeav
 OyqBJ99wryYSta6lD4ByFYFPfgILsmaAJhlZPlzk0o6VZ9si/4PUxzBKlw70Cqd/lWtz
 U0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459687; x=1752064487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WjUNsC/tPxG2dLETLc6CC9CFxkrBSGpmnmuEo26OYIY=;
 b=h/Cd27TZwDWz4tFpMbCIsftugO6t6yu4uhXj1fHe+qlEA2cmEziAoOOz8sRhUyROCO
 gDo8sCULrJPCMdM4gYR1CiRwnkm4E5lj/GGJxAQyxwNFL90LS/JeRKV2Fw5gc1JtODRU
 OMVIm1b3b3hZbaOkkRVRPXcYsfu03I3TxAJc+8Fr+rthuLVvYf8kNwNmqoiNsBXpDlBK
 8VkLYKcdtdT8DqQy1eLMg7J0x4wBwYjeEGh8axzye6xP0/q4b46CYOW3nHR6txMiT5Z0
 yhyMAJofqugqB9WTgtvrl7wQWI6KUX9auNkgEPapLyaZTOaaE1Xujyoq+NDSPAe21Sfl
 K8hw==
X-Gm-Message-State: AOJu0YzHfrRljNRRwHJpiOGvH/PpO3WsxC6doE7zo+jCYbaZhFFUHPhI
 +bse6kiB/5AdtOQmg2Z7dobq+GM232vwUw1aROh5Gj1fXMC/5ZrPVFmHxdMkE87R4iQ=
X-Gm-Gg: ASbGnctx2zlaNlTOHWg6necDxkyoIxWP3cV3D7VcaQwk1xSCVVvU4jfamkr8Qz+8Wnu
 Mp1hkjF0BcwVFGwV0Isruv/kYipYrOdXVfOJdqhA1msrcq/J0juz9I43AUO9c/ckVBpwHA7UhId
 a60seDUFsCXxs2Zr+ExsrW91tqn7bIYnEcH8+THz+dMqudkno4RECN/iGLar5y/wT3JOKqGRnaj
 c7ljh+btX0FhrltGaQPA68ejAM7QrEue2wufVg5hR/gmMSmCp7Mzo0nhGPsYUrvVNbmDdjH3uTJ
 5K20AlDM/hzgPdRSJcfWRgk0EzC25xUtUGmqh0znrpXvFWBvfir59tLtZNmi6OVGRxrtsQ==
X-Received: by 2002:a05:6871:2881:b0:2ef:9aa7:becb with SMTP id
 586e51a60fabf-2f5a8c97853mr2020632fac.18.1751459687449; 
 Wed, 02 Jul 2025 05:34:47 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 28/97] target/arm: Implement SME2 BFDOT
Date: Wed,  2 Jul 2025 06:33:01 -0600
Message-ID: <20250702123410.761208-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PIWdqYzkbNap

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 17 +++++++++++++++++
 target/arm/tcg/sme.decode      |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 761584c90b..965a49465e 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -921,3 +921,20 @@ static bool do_fdot_nx(DisasContext *s, arg_azx_n *a)
 }
 
 TRANS_FEAT(FDOT_nx, aa64_sme2, do_fdot_nx, a)
+
+static bool do_bfdot(DisasContext *s, arg_azz_n *a, bool multi)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 0, 0,
+                         multi, FPST_ENV, gen_helper_gvec_bfdot);
+}
+
+TRANS_FEAT(BFDOT_n1, aa64_sme2, do_bfdot, a, false)
+TRANS_FEAT(BFDOT_nn, aa64_sme2, do_bfdot, a, true)
+
+static bool do_bfdot_nx(DisasContext *s, arg_azx_n *a)
+{
+    return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, a->idx, 0,
+                         false, FPST_ENV, gen_helper_gvec_bfdot_idx);
+}
+
+TRANS_FEAT(BFDOT_nx, aa64_sme2, do_bfdot_nx, a)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index a2b93519c4..18e625605f 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -288,6 +288,9 @@ BFMLSL_n1       11000001 001 1 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=4
 FDOT_n1         11000001 001 0 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=2
 FDOT_n1         11000001 001 1 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=4
 
+BFDOT_n1        11000001 001 0 .... 0 .. 100 ..... 10 ...   @azz_nx1_o3 n=2
+BFDOT_n1        11000001 001 1 .... 0 .. 100 ..... 10 ...   @azz_nx1_o3 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -328,6 +331,9 @@ BFMLSL_nn       11000001 101 ...01 0 .. 010 ...00 110 ..    @azz_4x4_o2x2
 FDOT_nn         11000001 101 ....0 0 .. 100 ....0 00 ...    @azz_2x2_o3
 FDOT_nn         11000001 101 ...01 0 .. 100 ...00 00 ...    @azz_4x4_o3
 
+BFDOT_nn        11000001 101 ....0 0 .. 100 ....0 10 ...    @azz_2x2_o3
+BFDOT_nn        11000001 101 ...01 0 .. 100 ...00 10 ...    @azz_4x4_o3
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
@@ -365,3 +371,6 @@ BFMLSL_nx       11000001 1001 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_o2x2
 
 FDOT_nx         11000001 0101 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_i2_o3
 FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
+
+BFDOT_nx        11000001 0101 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_i2_o3
+BFDOT_nx        11000001 0101 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_i2_o3
-- 
2.43.0

