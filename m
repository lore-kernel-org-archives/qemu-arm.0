Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp729676lfr;
        Fri, 16 Apr 2021 14:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcWJuxoI+2hJvnWQZU5ujutBW+IUy+VkG3ctUCdBNqpYpe9Ej/Tl5oszBGOpESK8XbogOQ
X-Received: by 2002:a67:c80d:: with SMTP id u13mr8981794vsk.27.1618607346438;
        Fri, 16 Apr 2021 14:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607346; cv=none;
        d=google.com; s=arc-20160816;
        b=Ae7/SU1mz7zqhfOV2wavptCsEXDOsJu7t/gp9MX0EdB4bk2+F8tFVdfMhaJB7qVbrj
         LlXBi+nBvaE+URyxqUhozelazmzg458krrjudoubcp9rmW5CP5g9AVrVp/z3wt3+E533
         Co5wILGRruN+0OYRT/x7082qzhsR88B0vthmCHDiEe5JAKhZMXubZMicOgpPXWvv1j5V
         VSEhe4inf1OOdp7ypKVDkjGWLMFVtZxhCGSzJvn7jGbxlnZxPTOcysHRw+VeRAFqyHYV
         pxIUBZAe1hz0R1Uf1/oKvMSYBqd3HrXKjWWYZ69B2hj4/7XbbcE3Z45g+JNxNCuDom9C
         VqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VTuzzLDpebdoMraQ+WOsKsSEBj+Qw3Yc0aepQpiGbJo=;
        b=OuNpIa04pYcSj3PWdRJrd2CwODlogMP6IryQlZ90t7s7bRcmDrzxu7U290/dgOtmhJ
         CaCYFJ4Be1THWvx6o9Idhne+HP+VD5Qlee//xNd4bZolbajPCb/Nfv7ovL2y7fEd1tt8
         F/Q2zlzyloemNFMl80rgYvb0wyr/HJjVOtgdxpXZ6P61otxLAFRMhlfl331VP3yl9z0g
         sjAq7BRNEKL88lhi77yHNcFbMo2iH1dbcE3iQO/cZe0wGvTGn/VNccC9lb23MwVPULmc
         heIi/FncqjpfDUf+aHrK9IP+gG+vv9Fd8LGZcP0j/bLtPF2o5u+lMUY9WyLtSCr6YIpZ
         Uw/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwV+0ItM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si2697797vsk.415.2021.04.16.14.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwV+0ItM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVi5-0003uP-OD
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc6-00043h-KW
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc2-00010x-Kw
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id j7so10587739pgi.3
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTuzzLDpebdoMraQ+WOsKsSEBj+Qw3Yc0aepQpiGbJo=;
 b=EwV+0ItMW7ZHEpMWqPSDwON/vy5HBsO7db6dnPnZ6XP9pyoAV6D4SH/l0xRs00eZy5
 SsEeKm3k+cxkDm9CQ2cUSaEmRKs+SePyTlDoQYx1Srf960j4FDw9FTdqQHTHEb2nhAHk
 r3+PZ/ELX/Mjadzk3EwaLQ3xnT1dtDtN9vOkqDLCoehFduDENrXlJgWSbM11P3UBjsbl
 caA0cdx6py23227rSFtw9GrChYgNi0+ty/mxsGg/KIawxtAwFryZAwVDYu+TYHivsL56
 Pnrle1xAMc5t0BmB31OViZGYNVlZF3U2haY58jIFnjdJxf0M9NhL/nzwwUbLsEHXksS5
 DlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VTuzzLDpebdoMraQ+WOsKsSEBj+Qw3Yc0aepQpiGbJo=;
 b=IVcoPA/vU8S7HsUYuCpHE0Ill0QRHko6DomZjOZ+HZTMv3QUMCBrzSvl295P1WQp3j
 WG9WauZfhg7S6kmQL4dkVX7ptTDNfvPLMicdOfkTYUGebPYpjgVqR4a8vC7sJgNS/LD4
 4NQIKxz7dvMpB2yXz81e/QtKiUmHV25VAhPCF0hW5FNIeIYUrE45g5G/tltgIaGJAbAQ
 FZHX7FA9q7wvWG8beaq+q+zWYa3ypMY0ydvoLUk11H41qaYLcnJoaKDLVhsw5hKD6PLP
 of9MPHP7qcdcDHTxdEC0rKPg2TBSFb6AoRONjA0mq/8X3o+zHXEjX6ThhTd9aQLtj+sc
 zogg==
X-Gm-Message-State: AOAM531xnLc+OKyZbEZi58pfW+SFRlS4jw4soPTbsLFC3un9euYL+IVN
 HilZomVTlOFwYaMdsTt4/V/zCg==
X-Received: by 2002:a62:ed0f:0:b029:257:7278:e72b with SMTP id
 u15-20020a62ed0f0000b02902577278e72bmr9136809pfh.17.1618606969150; 
 Fri, 16 Apr 2021 14:02:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/81] target/arm: Implement SVE2 saturating/rounding
 bitwise shift left (predicated)
Date: Fri, 16 Apr 2021 14:01:25 -0700
Message-Id: <20210416210240.1591291-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OM0o9z9tWA85

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Shift values are always signed (laurent desnogues).
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++
 target/arm/sve.decode      | 17 +++++++++
 target/arm/sve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 18 +++++++++
 4 files changed, 167 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 9992e93e2b..62106c74be 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -172,6 +172,60 @@ DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uadalp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5ba542969b..93f2479693 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1112,3 +1112,20 @@ URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
 URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
 SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
 SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
+
+### SVE2 saturating/rounding bitwise shift left (predicated)
+
+SRSHL           01000100 .. 000 010 100 ... ..... .....  @rdn_pg_rm
+URSHL           01000100 .. 000 011 100 ... ..... .....  @rdn_pg_rm
+SRSHL           01000100 .. 000 110 100 ... ..... .....  @rdm_pg_rn # SRSHLR
+URSHL           01000100 .. 000 111 100 ... ..... .....  @rdm_pg_rn # URSHLR
+
+SQSHL           01000100 .. 001 000 100 ... ..... .....  @rdn_pg_rm
+UQSHL           01000100 .. 001 001 100 ... ..... .....  @rdn_pg_rm
+SQSHL           01000100 .. 001 100 100 ... ..... .....  @rdm_pg_rn # SQSHLR
+UQSHL           01000100 .. 001 101 100 ... ..... .....  @rdm_pg_rn # UQSHLR
+
+SQRSHL          01000100 .. 001 010 100 ... ..... .....  @rdn_pg_rm
+UQRSHL          01000100 .. 001 011 100 ... ..... .....  @rdn_pg_rm
+SQRSHL          01000100 .. 001 110 100 ... ..... .....  @rdm_pg_rn # SQRSHLR
+UQRSHL          01000100 .. 001 111 100 ... ..... .....  @rdm_pg_rn # UQRSHLR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index bbab84e81d..7eff204c3b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -26,6 +26,7 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
+#include "vec_internal.h"
 
 
 /* Note that vector data is stored in host-endian 64-bit chunks,
@@ -561,6 +562,83 @@ DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
 DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
 DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
 
+#define do_srshl_b(n, m)  do_sqrshl_bhs(n, m, 8, true, NULL)
+#define do_srshl_h(n, m)  do_sqrshl_bhs(n, m, 16, true, NULL)
+#define do_srshl_s(n, m)  do_sqrshl_bhs(n, m, 32, true, NULL)
+#define do_srshl_d(n, m)  do_sqrshl_d(n, m, true, NULL)
+
+DO_ZPZZ(sve2_srshl_zpzz_b, int8_t, H1_2, do_srshl_b)
+DO_ZPZZ(sve2_srshl_zpzz_h, int16_t, H1_2, do_srshl_h)
+DO_ZPZZ(sve2_srshl_zpzz_s, int32_t, H1_4, do_srshl_s)
+DO_ZPZZ_D(sve2_srshl_zpzz_d, int64_t, do_srshl_d)
+
+#define do_urshl_b(n, m)  do_uqrshl_bhs(n, (int8_t)m, 8, true, NULL)
+#define do_urshl_h(n, m)  do_uqrshl_bhs(n, (int16_t)m, 16, true, NULL)
+#define do_urshl_s(n, m)  do_uqrshl_bhs(n, m, 32, true, NULL)
+#define do_urshl_d(n, m)  do_uqrshl_d(n, m, true, NULL)
+
+DO_ZPZZ(sve2_urshl_zpzz_b, uint8_t, H1_2, do_urshl_b)
+DO_ZPZZ(sve2_urshl_zpzz_h, uint16_t, H1_2, do_urshl_h)
+DO_ZPZZ(sve2_urshl_zpzz_s, uint32_t, H1_4, do_urshl_s)
+DO_ZPZZ_D(sve2_urshl_zpzz_d, uint64_t, do_urshl_d)
+
+/* Unlike the NEON and AdvSIMD versions, there is no QC bit to set. */
+#define do_sqshl_b(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, false, &discard); })
+#define do_sqshl_h(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, false, &discard); })
+#define do_sqshl_s(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, false, &discard); })
+#define do_sqshl_d(n, m) \
+   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })
+
+DO_ZPZZ(sve2_sqshl_zpzz_b, int8_t, H1_2, do_sqshl_b)
+DO_ZPZZ(sve2_sqshl_zpzz_h, int16_t, H1_2, do_sqshl_h)
+DO_ZPZZ(sve2_sqshl_zpzz_s, int32_t, H1_4, do_sqshl_s)
+DO_ZPZZ_D(sve2_sqshl_zpzz_d, int64_t, do_sqshl_d)
+
+#define do_uqshl_b(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, false, &discard); })
+#define do_uqshl_h(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int16_t)m, 16, false, &discard); })
+#define do_uqshl_s(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, m, 32, false, &discard); })
+#define do_uqshl_d(n, m) \
+   ({ uint32_t discard; do_uqrshl_d(n, m, false, &discard); })
+
+DO_ZPZZ(sve2_uqshl_zpzz_b, uint8_t, H1_2, do_uqshl_b)
+DO_ZPZZ(sve2_uqshl_zpzz_h, uint16_t, H1_2, do_uqshl_h)
+DO_ZPZZ(sve2_uqshl_zpzz_s, uint32_t, H1_4, do_uqshl_s)
+DO_ZPZZ_D(sve2_uqshl_zpzz_d, uint64_t, do_uqshl_d)
+
+#define do_sqrshl_b(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 8, true, &discard); })
+#define do_sqrshl_h(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 16, true, &discard); })
+#define do_sqrshl_s(n, m) \
+   ({ uint32_t discard; do_sqrshl_bhs(n, m, 32, true, &discard); })
+#define do_sqrshl_d(n, m) \
+   ({ uint32_t discard; do_sqrshl_d(n, m, true, &discard); })
+
+DO_ZPZZ(sve2_sqrshl_zpzz_b, int8_t, H1_2, do_sqrshl_b)
+DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
+DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
+DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
+
+#define do_uqrshl_b(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
+#define do_uqrshl_h(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, (int16_t)m, 16, true, &discard); })
+#define do_uqrshl_s(n, m) \
+   ({ uint32_t discard; do_uqrshl_bhs(n, m, 32, true, &discard); })
+#define do_uqrshl_d(n, m) \
+   ({ uint32_t discard; do_uqrshl_d(n, m, true, &discard); })
+
+DO_ZPZZ(sve2_uqrshl_zpzz_b, uint8_t, H1_2, do_uqrshl_b)
+DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
+DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
+DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c30b3c476e..6c1561d897 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5931,3 +5931,21 @@ static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
     };
     return do_sve2_zpz_ool(s, a, fns[a->esz]);
 }
+
+#define DO_SVE2_ZPZZ(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                \
+{                                                                         \
+    static gen_helper_gvec_4 * const fns[4] = {                           \
+        gen_helper_sve2_##name##_zpzz_b, gen_helper_sve2_##name##_zpzz_h, \
+        gen_helper_sve2_##name##_zpzz_s, gen_helper_sve2_##name##_zpzz_d, \
+    };                                                                    \
+    return do_sve2_zpzz_ool(s, a, fns[a->esz]);                           \
+}
+
+DO_SVE2_ZPZZ(SQSHL, sqshl)
+DO_SVE2_ZPZZ(SQRSHL, sqrshl)
+DO_SVE2_ZPZZ(SRSHL, srshl)
+
+DO_SVE2_ZPZZ(UQSHL, uqshl)
+DO_SVE2_ZPZZ(UQRSHL, uqrshl)
+DO_SVE2_ZPZZ(URSHL, urshl)
-- 
2.25.1

