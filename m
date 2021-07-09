Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp1104676lfg;
        Fri, 9 Jul 2021 16:07:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxx+hhs6eNo9dXrZM5Y/pt88fZ0WfVF2EfSWYr+uZ2MvE3ShTu+9dY/h55Z3ykGgtDuCen
X-Received: by 2002:a67:ebd9:: with SMTP id y25mr9720641vso.55.1625872030079;
        Fri, 09 Jul 2021 16:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625872030; cv=none;
        d=google.com; s=arc-20160816;
        b=HYUwHjopq+kNnY+Y/zB5xR/MQca1sjMyxbdyZFEIiFyibSBKJVl55+3yqGEk8rkFZG
         L8OM3W0GPymETHxiZXlM8Z2sInCI45v68Tr3nTROPV2jB+DIV6MhzR7CBw7jwTLAYs4T
         EOC9iaw3Zaul5F4WyspBgDz9/7ARrbKO3Xjw1ZSjugKxHfjvRvTTAAnR+mqE43crAyXG
         ZVtq3GIZjIVBi3+iJ+2A6hCZdUZvJHPblo7pw7X+MU9LZRrKALR4WaTNDcEWmI1OxlmO
         1HRn/gTfrCWPEdrTii6fYSyyD9JldiGy+QFWwyjCl6IAeiUZfLS8KC/6aDqFt5jL4/Aa
         sCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/iDhmkz0f3T9GUt7lkp7w4neMFdEQE2MNAGQv76evlc=;
        b=UXPt/tY+MqTvBSeVt3FjI8fwYB3qiEbO/AzQyLx5tSjeh9bQaF+N1GrSNegiqK+D2T
         UGbBeLKBnVMliayoF0zQoibPs9/PJv9TZUlul2RFzO06gTElVrSNMZeke0m5YLbuU00l
         B6sLqt1wpF3ZMr3U56MB4XMpOv7+9x//dIKuTnb62h6OH1Ro7dLRBfZJvFL89w639X2f
         82K07BbMWrP9iS+2D7274GayuQPwzAex/Dhk/6wcXF9r5cKwcjvuX+PyZgVb5kq8idy6
         qmCOW5ggC5YIj4cZgVr3EwtyGW7LEvX+6Et0moorBVO9XK0r9IgAcROb//qeZeWd5Xib
         pLjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqpBkuiR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si7337727vsq.72.2021.07.09.16.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jul 2021 16:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VqpBkuiR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1zaP-0000Mw-EC
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 19:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZi-0000Mh-PG
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 19:06:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZh-0004jR-0L
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 19:06:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id d12so10145068pfj.2
 for <qemu-arm@nongnu.org>; Fri, 09 Jul 2021 16:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/iDhmkz0f3T9GUt7lkp7w4neMFdEQE2MNAGQv76evlc=;
 b=VqpBkuiRUp/i9+4jEAq0AHdWD35YU1aAO18qYjpa3NDaABrIC+YySIMk1dVCDv81Oj
 0l4PtypDCpoLAfL+QSu1A3yDe3IctT1A8lmLzlOMCP0cMbodDA1rtNeXAZ9TyJnTL+Ln
 nB6iAAfh+NX87BRCjEP+ZzNnMIGUI+nWtQ9NpZsS7BJi61YbPGcr7UaSUfGpd3WREi0l
 SVjkOOkIVgdDrb72chWUwbc+pbuMmvdlxXJETdKcXjcEY2rupsCuaBksAUSK7chPMtIK
 5QExYP3HS1LC6zm45VrOAxi3gE5YDlSbdm+6X+m/w7X20KGUV3VW8qwp0gIBwEzUiBTA
 T/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/iDhmkz0f3T9GUt7lkp7w4neMFdEQE2MNAGQv76evlc=;
 b=Qgyn3CbenBz9jn4kUoghge2EDen1Gp/RFa1Dpd/SFIl2U1MJXaNLOzmCGl1SjzGV7C
 /urA3ziAAKa1kC4088bLBOxS6xhBU05Jx+t0org9rMp4S8pX81PrMZkDGua43efqq6g1
 5GB3960qkYOWG5OQOpLLsd9F0iJKwLBN9kIqlVIRKrileZQC7JWj+4JpdTA+BWz515/y
 irw0a2+LCFbphKCR/KbHydpi0jYLyx1ntKC2t6J+xbLjFbTjTIAFTar+BZixzNqGSEo3
 bTRVvjIWJw8LQnrYNaB56oknx4evhF4aY2IzPHXf1mgRwKY+i14pKl0IGmVDq1WxHQiw
 y1eQ==
X-Gm-Message-State: AOAM533RxxOvYdJqO3+b81N08bsIq6aIywuV9HqNDYz7nrAxoN5GsIrp
 wrsxcMRC6DBLqsPudTX337txV0uwTxx5og==
X-Received: by 2002:a05:6a00:b42:b029:31c:abd1:53ec with SMTP id
 p2-20020a056a000b42b029031cabd153ecmr33421380pfo.45.1625871983521; 
 Fri, 09 Jul 2021 16:06:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d20sm7270414pfn.219.2021.07.09.16.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] target/arm: Fix offsets for TTBCR
Date: Fri,  9 Jul 2021 16:06:21 -0700
Message-Id: <20210709230621.938821-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709230621.938821-1-richard.henderson@linaro.org>
References: <20210709230621.938821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sz4xnX7h1DWa

The functions vmsa_ttbcr_write and vmsa_ttbcr_raw_write expect
the offset to be for the complete TCR structure, not the offset
to the low 32-bits of a uint64_t.  Using offsetoflow32 in this
case breaks big-endian hosts.

For TTBCR2, we do want the high 32-bits of a uint64_t.
Use cp15.tcr_el[*].raw_tcr as the offsetofhigh32 argument to
clarify this.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/187
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a66c1f0b9e..3292e212e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4106,8 +4106,9 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
       .access = PL1_RW, .accessfn = access_tvm_trvm,
       .type = ARM_CP_ALIAS, .writefn = vmsa_ttbcr_write,
       .raw_writefn = vmsa_ttbcr_raw_write,
-      .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tcr_el[3]),
-                             offsetoflow32(CPUARMState, cp15.tcr_el[1])} },
+      /* No offsetoflow32 -- pass the entire TCR to writefn/raw_writefn. */
+      .bank_fieldoffsets = { offsetof(CPUARMState, cp15.tcr_el[3]),
+                             offsetof(CPUARMState, cp15.tcr_el[1])} },
     REGINFO_SENTINEL
 };
 
@@ -4118,8 +4119,10 @@ static const ARMCPRegInfo ttbcr2_reginfo = {
     .name = "TTBCR2", .cp = 15, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 3,
     .access = PL1_RW, .accessfn = access_tvm_trvm,
     .type = ARM_CP_ALIAS,
-    .bank_fieldoffsets = { offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
-                           offsetofhigh32(CPUARMState, cp15.tcr_el[1]) },
+    .bank_fieldoffsets = {
+        offsetofhigh32(CPUARMState, cp15.tcr_el[3].raw_tcr),
+        offsetofhigh32(CPUARMState, cp15.tcr_el[1].raw_tcr),
+    },
 };
 
 static void omap_ticonfig_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1

