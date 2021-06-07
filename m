Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3695746lfa;
        Mon, 7 Jun 2021 10:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxse2gF8og7gUhTQeY+a/SQMjuwCqTY0oJjBufGJ+4PxRcufrg8ApDJEU7E2UwkRr1nY1HY
X-Received: by 2002:a05:6102:2431:: with SMTP id l17mr10079856vsi.45.1623086778549;
        Mon, 07 Jun 2021 10:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086778; cv=none;
        d=google.com; s=arc-20160816;
        b=gl8P+dUYXtwb8pFmcZW5X1bzydKJ2rbzU1prVv79sEjG5af0rgmwB7EeRQ6yHJrzFa
         eYuawj/+EBZrWxrHJ7Go3PkDdxPQsqn+faq5DY5uTnoTeXXm7uk/EvVH4wYRTyVtYDAl
         MSL8fZXXUMA+FgmOz8428j8egz7uWPlQEKf9vgOth+BUq+m2MC3PjqZMb7CBZf1mXFG/
         pXQD9Npp6xIhmq9BjpKDHepfrs+Qcbm1IlELp+uOyKA47dvekJnVRPdJ4mUOwQHFoCM/
         hCvq6Pvj3AmE7vKQYtmfI9SlCbjc+bqsOO4W/RviNjsbpxaR9UG6sxoVa+XDwPKCNwBK
         rLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fGbsL0Vwzsphqd9BOE+K3Cgyjkt5iafRzopECzKXlTk=;
        b=KHiRGYj1AD/L2FiBRNo0YvLbw+diebFCafYNCCQ5nUi3CJxOx9IQ0sc/UldI15ubhP
         kus4C8d3Igvyb7oANBWJbtGwtUHiVROGhz1DsyHaLGEzBY+SPHX90qVZVzERocx4URU6
         1nDcrBeYpGLdSKYWJiuTM1M9Bycu1ZWQgezF6MVYU/ulhqjlRs7L+T5c762shdVRxR9L
         I1n5iHOzpz+JQndnxmVoMCDNINKK9tiy0g0PPZiXm98q/cIHCHqP4cZKCN5qNRsGnken
         5SAh+ElHVS7gY1RiseLgOq2zldzYZG9sqkOKEP3mCBm2u55+2xNMsmXMFeF2iTL/7pU8
         cbnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtCN42k1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si5838397vsq.98.2021.06.07.10.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtCN42k1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqJ0z-00089q-Qz
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbE-0008JQ-TY
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIab-00085r-KT
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a11so16559730wrt.13
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fGbsL0Vwzsphqd9BOE+K3Cgyjkt5iafRzopECzKXlTk=;
 b=rtCN42k1YLcAp1p5WQY/xVy7uP2dRGuuQrWjywpQub8YgmxfGPUiHU7v4m3D6ylSfi
 aUQlAqCHyNNvIV0Iwv5EnqXq97Qm3lOqTfLcvPew4DSUZUs75dg9p+RUBfUmKDw71LLR
 QXO6ebnRWVQAk3J+SWBz+tvULPsAI7CWUD3PIlGAjqFBh4B1L98pjT1LuYWeO0tjE8Ar
 WzNq1hCO1t4GhBpYtPATj+bGqPerHCx6NqxKnVt0ATvXgbF1Px1O+1XLzmZhZHLhw4Ve
 h1YJUhzd39wwVRWo/n3Tcf2XOqmfqyOfRWDvTdtmk4FK4DvpbAwHymxaQ88M0t49lukK
 Ch/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fGbsL0Vwzsphqd9BOE+K3Cgyjkt5iafRzopECzKXlTk=;
 b=Vhe0OJGfIjn0ovFElS6qAm8F5CHfgZHkdsyqkLPaXolYsdMorK3BvuH13N+TVPfllm
 PK5LhY3gfNHoHLVRM6IE49zMpVFy/VLhOxhh1nDKPiq3JZXx99peoBJtLb7pkUAdAvQK
 F+huCSyng3h8nrLT0u83el1XEZ0WcxwoCDQA11sTnlvazOiErS2n51vLgeJ4o4GCoB4P
 FF84A8nfvz8GWJzKlVX79a6W9ynTcLlcKBx4FBY5UBKitQ4VlmV5f0yDBdqUEe5ZvbYw
 TKrLP0eduuzi+O3DB2nZ0Riiiw2YWMHJRfYNhlI0EtBcVpg01DslwIe22YeIRv0xov7l
 VJ3g==
X-Gm-Message-State: AOAM532rg7U+O7rcMwzVDtU029wCU3JhCGzCZdMuOEmKcDDnTTrIelSt
 SFj+sX6EF9I9f8JUrSVt5IuUP6nzBkbK2ssW
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr17686776wrz.59.1623085139104; 
 Mon, 07 Jun 2021 09:58:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 45/55] target/arm: Implement MVE VSHL insn
Date: Mon,  7 Jun 2021 17:58:11 +0100
Message-Id: <20210607165821.9892-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: F8GSomsdXLqr

Implement the MVE VSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 43 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a2f9916b24e..6ef01d367b4 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -171,6 +171,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e78eab6d659..ebf156b46b5 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -130,6 +130,9 @@ VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
 VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 
+VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b7f9af4067b..c95d5a0fd8e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -508,6 +508,36 @@ DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
+static inline uint32_t do_ushl(uint32_t n, int8_t shift, int esize)
+{
+    if (shift >= esize || shift <= -esize) {
+        return 0;
+    } else if (shift < 0) {
+        return n >> -shift;
+    } else {
+        return n << shift;
+    }
+}
+
+static inline int32_t do_sshl(int32_t n, int8_t shift, int esize)
+{
+    if (shift >= esize) {
+        return 0;
+    } else if (shift <= -esize) {
+        return n >> (esize - 1);
+    } else if (shift < 0) {
+        return n >> -shift;
+    } else {
+        return n << shift;
+    }
+}
+
+#define DO_VSHLS(N, M) do_sshl(N, M, sizeof(N) * 8)
+#define DO_VSHLU(N, M) do_ushl(N, M, sizeof(N) * 8)
+
+DO_2OP_S(vshls, DO_VSHLS)
+DO_2OP_U(vshlu, DO_VSHLU)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bea561726ea..6eaa99bc0f5 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -421,6 +421,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VSHL_S, vshls)
+DO_2OP(VSHL_U, vshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1

