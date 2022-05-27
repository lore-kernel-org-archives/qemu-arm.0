Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1197908lfh;
        Fri, 27 May 2022 11:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn4cCZUDPRVWj8vvHi/xawX8AJpWzXu57fj///R+l7ZOTxZIZiEb8MUy2/0gVoiSKHDfof
X-Received: by 2002:ac8:7d44:0:b0:2f3:af0b:dec1 with SMTP id h4-20020ac87d44000000b002f3af0bdec1mr33549840qtb.634.1653674820072;
        Fri, 27 May 2022 11:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653674820; cv=none;
        d=google.com; s=arc-20160816;
        b=VytURxDPNywrDVQgYLWavHwNlNTJqkX9B0XuFqnGBcID1h6I5Z8dv9NvkSsY1yRhib
         QfWYVirzRZelGXHhmvpyRlbCi+IBOnRecHPQfNO1VlNwnzMxxa1pKLLwfgGWW5dU53fS
         2ldy20WBO1k0q5C3Z4kBlP9oE2FmhIys3AjBHWdUPHwAUgBK9vr0PFzcPMzIjVx7+gS5
         jOUfD7W0sgn0jzrsf6do//Av1XxDyYjBjBuYec9WwL/+5NptGehsK5Odmb0orBAUVbel
         +3FI0pMkT0cWtcEXJwUvdtcC29ArFLP9GQoC22ZiXren4Dec9S78Gkg72pTHHm4Rm9PJ
         T5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oUTUBggiPUlwZ7WOApcqxGvEWawXcbJb2Pfw/Rgn2LA=;
        b=kUeeSoZvG5lN7bAHoAM4ac/Dl/CyYh+cCSewHffGimx1RSHfqLtBSMEmzd+WeLJGqX
         mcr5DvJ4ZiKrstCf4NMOpnwCmVRrdZszHmsJ7tSlkPj7jVgpfQNduPWCzAM+UEEZvQEV
         lhvgPJz+Hyha0XdmxaIJSQ3SC1M+NW2+mtAAS65baIav7hv64oaOKjvdDm/NwkHczFr4
         F8zTYvWCe3oz97znOEA9t9OGKHlYFSCkQVlT0I4tnELZ5HK0a9ZfGxlVK9fx9EzC6bH5
         4Mjopusp0ZPYEBVTdpy9qRz7RTQk4rgqF1boOqzV1EIiFG6+mpir8Ri8WaU7g8CS/JDt
         8g7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FD2Qmuk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo26-20020a056214501a00b0045b7aebffd6si3235588qvb.493.2022.05.27.11.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FD2Qmuk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueMU-00030k-EJ
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM1-00030I-CC
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueLy-0001cc-Nx
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5004042pjq.2
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUTUBggiPUlwZ7WOApcqxGvEWawXcbJb2Pfw/Rgn2LA=;
 b=FD2Qmuk2Sb6HYzJEtJ4rF0eoLkN0CL/ThgGkXVh84pfpfmWJ/Nnr1S6G5plr3kfu5d
 9ia8V5qOuaPuSzA/mSmG7AdYG3V/64qWt09FqmT8aSArd0Ho6A0oHGSPOKxoD4Rw1Ip3
 cx5RRtaBeRKo2skHP4OOd1a7WOvHVuC6Mypy25sCVLPr/KrxEt+ReO4L9r0C/ASXYYR1
 CDfFDT35zpQjAH1yOzzE3JWdmqxQZg7YVwiQ/m4cYIEATp8DHhAxn9dvEKnneBb6yhGH
 c7CUpzK8cGluXLhpvsbrMbm8hN+qRPkDrBSi/voKIQMamVBkoE+hhoe15q4vAMeNQ6Vy
 kjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oUTUBggiPUlwZ7WOApcqxGvEWawXcbJb2Pfw/Rgn2LA=;
 b=XMLZtmUwiRkzRczPM+8wAjd2nOhWLL3K8ZEv3n9f+4dIx5pIU5d1A1to+W+SomArEB
 qMvPg1qcRPclOWxxQATluvmvafC2A3MEJOGhJrJNx/TuRfVlK7OwQ5DL08V7lxPz/X4X
 R6uvm4xYWYvExMmzIESTcI9hsBtxxN5j+VTURcNcYfbbGAAeo3D/xzL/BjZjySlFwb7b
 t8wC/dNJyCfy7xcmWLVaDb0EIskLeyM3EXKbWN6P7SmNx2oxBFoILaJBahpPhYZUU09L
 HQA2kQ8mUgMoA1x/FaRAramEfuB+iGrUH7dvNGbveKexVzB2dQeQXuLupP3vkcuMnVXN
 cI+g==
X-Gm-Message-State: AOAM533IH71FXGnttq3AWlbpNSzIi7R6Em4WBzgghsMvu50J5UAD/Ije
 cIhoT2z+UC1oKpHSkoOcfaCGfj7ueV0XrQ==
X-Received: by 2002:a17:902:ecc6:b0:163:8bc7:16c5 with SMTP id
 a6-20020a170902ecc600b001638bc716c5mr6380657plh.75.1653674785313; 
 Fri, 27 May 2022 11:06:25 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/15] target/arm: Rename TBFLAG_A64 ZCR_LEN to SVE_LEN
Date: Fri, 27 May 2022 11:06:09 -0700
Message-Id: <20220527180623.185261-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EOkHexuQo1zc

With SME, the vector length does not only come from ZCR_ELx.
Comment that this is either the SVE VL, or the Streaming SVE VL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 3 ++-
 target/arm/helper.c        | 2 +-
 target/arm/translate-a64.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5bc6382fce..69e71fdcec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3117,7 +3117,8 @@ FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
  */
 FIELD(TBFLAG_A64, TBII, 0, 2)
 FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
-FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
+/* The current vector length, either SVE VL or Streaming SVE VL. */
+FIELD(TBFLAG_A64, SVE_LEN, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5c875927cf..2a0399100e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13683,7 +13683,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             zcr_len = sve_zcr_len_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
+        DP_TBFLAG_A64(flags, SVE_LEN, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cc9344b015..09ac344d35 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14608,7 +14608,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
-    dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
+    dc->sve_len = (EX_TBFLAG_A64(tb_flags, SVE_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
-- 
2.34.1

