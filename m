Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp510593lfg;
        Fri, 30 Apr 2021 14:28:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMUwVkXbmlLoX2UUk9eLxjNR66Ez6JlCpxN/v34SvVkyYbzdLuNtBlcPTe/4lyou8hx/cq
X-Received: by 2002:a02:ca45:: with SMTP id i5mr6754463jal.118.1619818117583;
        Fri, 30 Apr 2021 14:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619818117; cv=none;
        d=google.com; s=arc-20160816;
        b=l6fWNcoCBySMInwtMaMPwuTix0j4yftUHwIcuHwdMx+wxJ6XlWmXmnUE94C74wB1/L
         6LIoFIitZE5FD43fjbm3JDwC3nNxpsLO2sDZyftfjrNgWQh63KJEsN2nd2anZdiVWSk0
         MxkHMaUULOqOPWZ+7dOvdjRh2dDHncp5QA7CgoB9qS9N7EbaWDYyYzWCm8e3ufrzkqkg
         ef99JBTP6+A8Qf1IL5nbUsj+lKDSHTecaSjdy79n1I/K7q9MOyV8vrHA7M2E4+MkTsEF
         KvSTC1mjBQb9qtwWQNfZ4JbGJ9OekCNNyFyMsMeYi/rp7B7Cf8R8d6AZnsPCdD9SOxqp
         9Weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wpJcy1e6R8SkvPfghmeWun8lKvG5ixv1LSGzenTGPsI=;
        b=E86WySsvdZ0nm99hPy8VVseGikWCXT+lirrQxOOPb7ZOuBbSNpWl2gmRy+JTy5Silh
         aHL0zyE7Cmaka4MmCLDUWYC0q307DAImEXOIKRfoE+v/PPjkl14JwRv5mHblwD+0E+hF
         fQR7nBtJsj6P+aZcTDQiinnQzDJ9bDFifq8LHqgxCGZCtQAcsNV+X1faxu8EWTUDwGwT
         dlk7x61U7X50u/IJtDezNGKvK5UcRwbWhsHWNG+jobpyq/me/wIsvbA/Ce7zCPTh428O
         +1RpOBFG2VQVUDncGdIlHjlaISLNX29UXCwTQZV5htMN4divbQ/ivkihGL7dEzgCmQgb
         Q7CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fualBbly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q145si1732565iod.36.2021.04.30.14.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fualBbly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcage-0006za-Ts
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmh-00050R-0j
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:47 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007oX-0N
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:46 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso2375534pjn.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpJcy1e6R8SkvPfghmeWun8lKvG5ixv1LSGzenTGPsI=;
 b=fualBbly2B4omzNxg9shtHYSa0jqFzslZYTr0PmXTB9xiQBo72tmu2FvxLVAt3NmGn
 CeCk/iJeN4RB/y5tX2nKcZGH8Cc8lLZIOJaRY7A4fWCA40hoz3Qdju4d8dmMSHjVdkYO
 YSp9upAfd2WU2s4dpbj0UUgaVT8Ym4OVpC37xdKYj+7pxdhWboKOWzBLc33XV7fpXdWV
 lPIBKhAhurr89xNTC3ldqgfG0+obsJjQ6L9RiDWrJTFyC2ebaHn0IhYaupMBca1RuYPs
 OzZMAyKSxAwOjwNYteCJfSSO2uG6RCwOEJAU0OpuL/7F4phzV96bW5ugCbVPqjCXZstf
 OerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpJcy1e6R8SkvPfghmeWun8lKvG5ixv1LSGzenTGPsI=;
 b=tRwixV2DH5b1rU6sBaXt41C6HvDndL35DiXi0fNAmCf1/wGR+wtBOTPJ6XUgILuWb8
 JVJen0N2RVD92Gt2ZDkvFgYTPg54BucqZ4fXXxpcnddOW875p0iXL+7Nsb1mGU9PRyK7
 fJ9XIXhIoFWKpVTrGElrpQceUqjJB3xSR/LwL0tM6OfF/0dLnZ+aXZq4q61c+D8/9n74
 KxBvarYoav0nibBGq8bAOLzhV/85fT/FoargX1ZmQV/lSpKjjmbQkl53YWD+ZEedqjMo
 euk/TGMcT8EN8BSd+316o0iyEKggR/VoJgasViEMr1doh1a+SwubqAQEYvgYdA8z26JK
 4K4Q==
X-Gm-Message-State: AOAM532I/O515ajJyrBidsb72k0/VrQWDXAK8ozPsbO3fupbNmZxuQKG
 +SljTv/TKVbPDV6cgmHKqN1fsYd0bvV6kQ==
X-Received: by 2002:a17:90a:c984:: with SMTP id
 w4mr16569921pjt.110.1619814598243; 
 Fri, 30 Apr 2021 13:29:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 76/82] target/arm: Remove unused fpst from VDOT_scalar
Date: Fri, 30 Apr 2021 13:26:04 -0700
Message-Id: <20210430202610.1136687-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4/SceVdFKLdm

Cut and paste error from another pattern.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 41a7b2208e..a0e267694b 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -325,7 +325,6 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
     gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
-    TCGv_ptr fpst;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -347,13 +346,11 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.25.1

