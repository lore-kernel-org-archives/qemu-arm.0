Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3702028lfa;
        Mon, 7 Jun 2021 10:34:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwECgKRHRhZ7JmD5o+SgeX3R1E7xusEhXc50m9ffRkZvwPHws+MAs059WTLBCGf7t+GBlkv
X-Received: by 2002:a5d:8996:: with SMTP id m22mr15063313iol.6.1623087293575;
        Mon, 07 Jun 2021 10:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623087293; cv=none;
        d=google.com; s=arc-20160816;
        b=YXTKxa6WpIy+JGDudGtI+HmcLefSLaf1z0rNLbbTO2BqlXVPMsrawbm7O3KRzPssXu
         lWVOFmdusUB0CX/QEeNT+W9UH3VLTRcvDAAe891FgLfiqvLMP3FbhN52VJlq/Sdpail3
         yE/KhS/YM5sa9aaMr/4mvHHUT/wTXl+LXHqd8+Qs/dxsy/uMUlnTLwxICgPP4/Z/6qiq
         dJY5u9T5qc9hoC8LDKHD/8Roqe7t7YG/vQ5QQPdYY+8h09pfSTgdPlByb43mhXwsu4DF
         grYIyqGsxBud9/eXI8KilTkEAwDUSCw4qvTAqxtWED100mHMrExDuUo8wJbildtKMId3
         vqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZpgHoqnBmOkzqr58mneEyeBuRbOpEZqrC/tcPvjTIAc=;
        b=xc4qeNp2HNSpwCW6dmdfyYpMdMfc0FHCdLv+dJx/ijaqOOJ1qHJJf2xnz4lfOpMCvv
         YjfZV0gWp0MfEkgvQpYP6PI2sja3ZH1hLKcKol4dtC7UrzNMTIAg0zWZNKn2dA5Vqxs6
         XH1d2I0TwN/YonLVKB9vTlZqxUZ+1mDiCXKWEvHbWcZ7OP3lpP75fHyBDd6sXjAFV/sH
         rLHihdaXl7TN1QwsoKkSiPYtEpI+/Gh19MpHZ9r2c0dPCJuR946x3nmkCFDsGxmcKmLz
         8KG8szv0Auf3FrVwgkbofDGlNpg8whjLWxJYX7mFgNsMT7JAoBOInrRFMNwFqDAZwqgH
         zZug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zaDcXdZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si14905064ils.14.2021.06.07.10.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zaDcXdZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJ9I-00088m-SO
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbR-0000Tr-Kp
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIag-00088R-Qt
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso107353wmi.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpgHoqnBmOkzqr58mneEyeBuRbOpEZqrC/tcPvjTIAc=;
 b=zaDcXdZYuPaLxXrc8+yy6DvgriO/W8e23iDmNoDp5l+ibmuEO+LdFl5wweyaXLk/JT
 U2TixxRJCVoCI98o3w8eIzK7peftEUroOB/+666N/pMnJZ+ASEMSLWTRZ9suAfV5643G
 FyW6ft9UMDSrFRPwXvFOTJBeTewtCc0QgRZSS28aikJ20hQpw/V67JO4uISBl6Gm0xCv
 ZtljD3faPR3XNdVH52G31GfxGNByna7SymPm52LxnJWvadbeQJix5tmgtkfDM6H+RXa9
 SkH1jmAbmEFOE0eCWkblCzjlDtvBWw6ItCxtypLj3knb7wRR3PckJa/A3NE0sMmJpCng
 EPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpgHoqnBmOkzqr58mneEyeBuRbOpEZqrC/tcPvjTIAc=;
 b=msRnS2y35ENmv3OQ43VvwSNhLcJZYZaDRmMCCl2xkrnOwLMT/WXN/c6CA7lfoBOwUY
 T1C1rt3eS800FQ2ZQmS7xz78EzBi0Xlv3CS2e3Y5wLcAJnqV5nB1DM6R/1aj7crqopS5
 pGUZdPEKJgzUBGwxhpFaT0RKfd5Gk7jteFPDAug55lmBhg5uBCEGSBjNOo6FRLoZ0d8G
 XRA4rhK8JeuCRrdMRT+8Mh+MpSdH1ICrTwZMswtAnzo69BSMgblWqYbH2gWTL0P+CF2e
 R3+X8lmYuRB/ZgQZckfLJaRyBw2Mfrx3n0gGRlDT5eiv0JwYpras86uLmDJj32X3vg5s
 EIlg==
X-Gm-Message-State: AOAM531vRl3uV6c88Dspa3YqlfuG1noK7+9JRpTuKCHlSTgd8uhgf9In
 S+sXrImSRBnO4Dq9RnhijNaWcUI5phKTzb5l
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr103897wmh.8.1623085145328;
 Mon, 07 Jun 2021 09:59:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 53/55] target/arm: Implement MVE VHCADD
Date: Mon,  7 Jun 2021 17:58:19 +0100
Message-Id: <20210607165821.9892-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hoGykO5wAi7T

Implement the MVE VHCADD insn, which is similar to VCADD
but performs a halving step. This one overlaps with VADC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 6 +++++-
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 4 +++-
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 6e345470cbb..3f056e67871 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -259,6 +259,14 @@ DEF_HELPER_FLAGS_4(mve_vcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vhcadd90b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd90w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c0979f3941b..23ae12b7a38 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -163,7 +163,11 @@ VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
-VADC             1110 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+{
+  VHCADD90       1110 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
+  VHCADD270      1110 1110 0 . .. ... 0 ... 1 1111 . 0 . 0 ... 0 @2op
+  VADC           1110 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+}
 
 {
   VCADD90        1111 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 2c8ef25b208..3477d2bb191 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -638,8 +638,13 @@ DO_VADC(vsbc, DO_NOT)
     DO_VCADD(OP##h, 2, int16_t, H1, FN0, FN1)   \
     DO_VCADD(OP##w, 4, int32_t, H1, FN0, FN1)
 
+#define DO_HADD(N, M) (((int64_t)(N) + (int64_t)(M)) >> 1)
+#define DO_HSUB(N, M) (((int64_t)(N) - (int64_t)(M)) >> 1)
+
 DO_VCADD_ALL(vcadd90, DO_SUB, DO_ADD)
 DO_VCADD_ALL(vcadd270, DO_ADD, DO_SUB)
+DO_VCADD_ALL(vhcadd90, DO_HSUB, DO_HADD)
+DO_VCADD_ALL(vhcadd270, DO_HADD, DO_HSUB)
 
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 8e3989b0176..b2020bd90b1 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -443,10 +443,12 @@ DO_2OP(VRHADD_U, vrhaddu)
 /*
  * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
  * so we can reuse the DO_2OP macro. (Our implementation calculates the
- * "expected" results in this case.)
+ * "expected" results in this case.) Similarly for VHCADD.
  */
 DO_2OP(VCADD90, vcadd90)
 DO_2OP(VCADD270, vcadd270)
+DO_2OP(VHCADD90, vhcadd90)
+DO_2OP(VHCADD270, vhcadd270)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1

