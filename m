Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1311307lfj;
        Thu, 5 May 2022 12:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5vzCI1qispMk/fU8QwIksYwidMAGLoSLVXRNZ5co15ijIoUDnv6334ut/E7RoQIbtqhAb
X-Received: by 2002:a05:622a:1301:b0:2f3:af1d:aa57 with SMTP id v1-20020a05622a130100b002f3af1daa57mr12737672qtk.257.1651779461853;
        Thu, 05 May 2022 12:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651779461; cv=none;
        d=google.com; s=arc-20160816;
        b=IflTzwI4oX8Y7jnfLXaIH4pg3TLlG2/5E/apa2nHRoRfxQCu0cjuQCR3dkHKJF7fnG
         Sq/vJfgP9YbkO8h5rDVizaLYoUb7aaMK1JqszBvEEcPNELPNZ2+P5PP26vC1hB27Sl2U
         D1+uXLWaX2FLCuuNAR2PGk/NMycHoBUCx2lFKqOpKDNXM/Sws1MeJGNL0TTbCK631cpo
         EH2rDSnTA5mFmbMrbZ4b7Wk/F9v8YDAmrWM1HeTpPKP3ebb6icsvHRYMC9a8tLolNV4F
         BOjLOEwXF6Xz0buq7ZA4LsBtKGoPE+eU2hwELcBD5l1cFuYLmXJSV9Dav4stBODb8yIg
         g10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
        b=bmgFtRf7UIwfU5VgfB+cnP1Nb2kdL+yvKn6RZ0u5AcVuwnMeUZHs9be3y6RWa+UwQp
         lbt5WbKxNG+HvI9wH3sBwXBobuOxKZjdQ7S5ALnNdDG7l5rBMsmwDLv0XftMEOjKnX+K
         AyenUxCXltPgloKlDTqV8QCXSM0g5BX/DLqpK2P5gFoSSkbfk877Ol8TY4gqOaOxztIh
         aO+NpHTDNEDN/NNgebcmoH5U/MQk3BmMTyPam0jsPYYpCjOm0KluAHNgIuOSOiUZnoUp
         A+bhRjBx93A2n1xrtz3cze0UoZmZuFrnYzPXmW4f2ScFtM/FZQ/uv8j1vMGYhEpMfiZT
         SuAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcHeraIl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020ac87c48000000b002f3b19568afsi1430826qtv.471.2022.05.05.12.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcHeraIl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmhID-0000Hy-8U
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYl-0003FL-FB
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:43 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYj-0004b1-P9
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:43 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so3519068otu.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=wcHeraIlfRUWCF9ban2wXAkXXxDLGDWyeTz2XIMbhKwffWZA2Nzaupgx9xpsk3XLjO
 +bchceA4QIe4gRPpZ0aizbVPt1vqCeecMP8dNrOcyfolbyoYLIk4YYtG2J4hHRvybst1
 U9qV3d0RanHUH+JwLbvQC8GQhrv53Ao7zc0Ycb57mJvxJ3mecLd+zG7BC8529ypwZGAF
 h7tI7NOYdqwT0KTheF+szQ2vktvlGdrT5/GxqgxIwXfPcXCn0gizf28svr0LhK5VvzCX
 8PcJhZ0Umyq38HTH9b7/ujzoHC/g5UcIvGSwmPIvm2NWmunFSBCo/akolnt3bAf90nbM
 yujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=e05wyiLrta6RYDGulpCSQoWqmlEciHFyRbSzLE+u60rLzRDnGAUGyIdSi/87z7buDT
 xTuVMnyZcUtS34lPGgTcKVzF77jp11nz+JBAgVQrFlgFFQm1OgwSRQuE332nNk7FDy7V
 vhYZL6SHqJh/8o4pz8DgHlDepSOZet8cXU3WHszi0zcsgnOjqVtKWbyxg6oD8vYwx4ai
 linGZQiS27HpHqVnvuvqiiZuWtcOyT0GzQ/F54L8xAo4On/OBqKJ7rSkfSgXwctdElTh
 9nLVLKSdfh96Ey7yIO39X5sjG1ekTYwFarH3/0YgXJMI9pkXM+cTMxr3+E7+G0xcNaJy
 ON5w==
X-Gm-Message-State: AOAM533e2K4GalAQw3Ow4lr2pjCy+GC83Vm/DJy7pUTjFGpWYUMIgjTH
 VYvtkiNhM91ZIR/i7aMI1kyGuQyWa4aR6NTV
X-Received: by 2002:a9d:61:0:b0:606:1513:8ad9 with SMTP id
 88-20020a9d0061000000b0060615138ad9mr7777688ota.307.1651776640624; 
 Thu, 05 May 2022 11:50:40 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 22/24] target/arm: Enable FEAT_DGH for -cpu max
Date: Thu,  5 May 2022 13:50:04 -0500
Message-Id: <20220505185006.200555-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nOEPYsMAhfKk

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/translate-a64.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 48522b8e1c..8ed466bf68 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -17,6 +17,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 40f77defb5..f55121060d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -738,6 +738,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5a02e076b7..6a27234a5c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1427,6 +1427,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.34.1

