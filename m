Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp503200lff;
        Thu, 17 Jun 2021 05:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFY5F+pcMKcSfm6qyhP6ThFA3dhLH+reGJOlrJBVz9ab+rAt/6raU5FawOcVo6tZ30psap
X-Received: by 2002:ab0:26b:: with SMTP id 98mr4872471uas.8.1623933842807;
        Thu, 17 Jun 2021 05:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933842; cv=none;
        d=google.com; s=arc-20160816;
        b=BVfbKXn3jeDCjwWRiB7dX6JyVVlmGX9YQrHx87HaSmGPsokQFzNEE4wJ0moqn8LHUv
         yakPZ5EvdHIM7WbxjTkp6Wf12jc/ndx+O8U/ZzEvDk2/hDrtXQGWPNoBuvZLHwkFK5x6
         /r05pg1ERXhUSRfuTqakZGzljTeiMDaHxgNxMEabzprj9vVjDzL27Uh2aclwFiFTbsSS
         txTFFDMcMLeJtAwr6kyju/XzEIMF11CTr+AjPnURVSC93Are5cFSWKOcTjx7RZJZvZeh
         gUtHaBjs9yBq+YaNY/8jtRpy2dnejrwg4L4hmvjIZ43ilBn7YVwZlwQ8kaBBF04psFPL
         hN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jB0RUEv0EmIGF7IhPeoPsFZRxdjqB22/EEQlfvY8A0E=;
        b=jyxo7jmuvHSEEAcbyl9ewj/kBbTcMh9y3YT0Ngnl5tL/51rr34GbdNZVosZGexi6km
         vKiE4z04vn4zN9nPULfBNxO+2y63TPlTKViBTKyOpXJrcJo/32hyfWlHddWvN91jXvfI
         qHB01B51nLSDFE8C5R7MbsTZMpmdhw8+lki0w1SKZjnQO9NmLsASu8t5qWhjJLFQsSPG
         2F3vTbNKdPsAkOIUhvUKSFV3FyNzyegj3I5eQdsG4g70i8S63ZuQ99bgKowkjFKrwELh
         kfarA55OcOMNx5GB3bRv3ChpLI/QxexIrSAal7WdlCIGM7/BlQaZfTkMnfj2zFy2/wOp
         CJSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X71BeJlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si3495736vsf.330.2021.06.17.05.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X71BeJlL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrNK-0006d4-2M
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxM-0002PU-3y
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx9-0007EX-DZ
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id i94so6537569wri.4
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jB0RUEv0EmIGF7IhPeoPsFZRxdjqB22/EEQlfvY8A0E=;
 b=X71BeJlLwro72ltmsBhzUeq5O9JqlsIcfefGQMr6H/s48ob5SDrvmzWrhwo94QO8gS
 6nhav7mBne1K+WGuE6iot+G2TDYFyJljyYly2UkdRDtTlRbOK3GMKsAqDqPfBGC1mAN9
 Y1WonNXZLHn6uSyyTuF+YZLs8Au0Sb0eIKXem58TLTxMHs0VeS3lpr4SuK0o01ZPNCTn
 6TxtxavGu3Gb7J1xhfYIJhvyguQTq2meOgDa/D5ut+jKXKINLvqMZ+AtqvjQSdzWyEC+
 +CKaIHI7tCf14ZXSAaNq2AH97wkQ42Xp6w470IxyxKv8j4MxivsU8x5JUPskoOxQDsnj
 f6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jB0RUEv0EmIGF7IhPeoPsFZRxdjqB22/EEQlfvY8A0E=;
 b=fMu7H7uUYrLQYcUwBOixOb65QlNF09gMXzrARBDnU2/RZ+fQw7WoheY2mKYuL5rE0C
 T4qPX97dCD+dL4ynT9yYVaL8d6VAmvUHbEUvQq/xtIsAYfpjcot/WTR9TsTEj8B+MPv+
 qHiyGWWd6YUo4ZKyI7Ebc3XTrioJZZkof2hF0N+uMEKZZRZL/+L0kQWmMAt/8asHEXO6
 p73tsZ9Y4iaVCBwmoUfFIF/sxdxCwnaOI02cJ3Zc3ZhR9qGoSASwKX09RBHZf6dGcpZv
 kzBCMxLEKWN+nWGTiMdetOxxoYGO5i6f3uUu/ujExE3+dkw0vq/lmWJztlmNL/W6gpic
 6tdA==
X-Gm-Message-State: AOAM533lBn6/Y1uWv8nfEAZX3mLt/KQq138NoJtRoImPSNEJJpxuenbi
 PEZ+cVgpLnVMEJ7QA7sBQ5znP+ft/6/Sjw==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr5379776wrm.229.1623932218088; 
 Thu, 17 Jun 2021 05:16:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 35/44] target/arm: Implmement MVE VRSHL
Date: Thu, 17 Jun 2021 13:16:19 +0100
Message-Id: <20210617121628.20116-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jrUiesYzDbUP

Implement the MVE VRSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 4 ++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 56b3e8591ad..b7e2243a19a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ebf156b46b5..c30fb2c1536 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 
+VRSHL_S          111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+VRSHL_U          111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5da1899f3d8..cd6b963849c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -538,9 +538,13 @@ DO_2OP_U(vhsubu, do_vhsub_u)
 
 #define DO_VSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
 #define DO_VSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
+#define DO_VRSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
+#define DO_VRSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
 
 DO_2OP_S(vshls, DO_VSHLS)
 DO_2OP_U(vshlu, DO_VSHLU)
+DO_2OP_S(vrshls, DO_VRSHLS)
+DO_2OP_U(vrshlu, DO_VRSHLU)
 
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 487ac3185c6..d75cc377fee 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VSHL_S, vshls)
 DO_2OP(VSHL_U, vshlu)
+DO_2OP(VRSHL_S, vrshls)
+DO_2OP(VRSHL_U, vrshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1

