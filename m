Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2083660lff;
        Mon, 14 Jun 2021 08:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX/WDPtPE54w0Lv2JsMA/PbNxtiS7YSbhxVO0OapFjMXnsCBuzM80QerDToP4hWryT21aE
X-Received: by 2002:a1f:2fc4:: with SMTP id v187mr16583374vkv.4.1623685251500;
        Mon, 14 Jun 2021 08:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685251; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+JhsmtLH8S0xNGenXo4wUrO29f7bhPmnQl4UX5RdDPiABkYUFJVyNEC3y9XG6vdml
         tFG3yjl4k43XUrXk7Qai9d7dd1+2cegbGfJ/nsLR5yCAqu97qabP6Tnn5kdbA75TsFxE
         9vZABxywgwjp00Wgry+3w8t655GLhuqpHPdFQr44IbUfTmtzh+uHYNV8pKTt4ieZlTQm
         JuyOtAwDIbSYalCBmwR6ZmFqHuATXP5xZpMSSsk7SEjW5uk6sP4TdHPxxZKpRlwUvHUl
         AmzM3X9YnRLy7Vs+CAa2MqoouRR5tMsK24ZwF7FU4ontntuX1G88cEjn0jmO3bCVh9wM
         Rc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qNQRvMNaIXyVbqoVWVPAZdQE8EjkcwMkTf+5DbPtj9c=;
        b=YtSCQeTNy0LE57RdyffnUjWnaJeQvBjs4GZ75+LU0yV/iRoK9YWV6Xm/URlEiOwE8g
         5mu33kOwJjMAwRLbj8MENvpz2bMgWnzvHt+4rcZbGHpqeJPjcx6sZdIk4pHTYEVX7x8V
         1VtSTcBGX4WVng1OxwizIWgfX0AbNETUqEnmXj3hJp7sZhydOBuHUO2W+t5iHB9QfNkr
         NYS8mneVztWrJ1m5fMQ17WGaMUOD1Fm7fItKoeGVvNiVz7ja8CA+cCaL7tiLYzjfH8wi
         ftCXfQWY62+MIa5tUMSs0zk2OQO6eytx6o+r05iYpzn7OmAmzzywlMnomJeHkGdPM1zX
         eANg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2Oxvlx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si2416800vsq.27.2021.06.14.08.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y2Oxvlx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsohm-0008A1-PQ
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoF2-0002Qx-Je
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:08 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0000aW-9b
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso188147wmj.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qNQRvMNaIXyVbqoVWVPAZdQE8EjkcwMkTf+5DbPtj9c=;
 b=y2Oxvlx7CbSw+MfDTsc9jf7eQRSvpvrG9DklMbl1G/4yOQVQoY0uPqkjpGuY8F0MGv
 xP+5WNMHfok1P7qXsY/aNWuEVahJxUsxpTHLAJLZZfp2v5SzELe0pTFyGRDNs949lH3E
 ZuO/i4426WxiWhhb2eyp4vqti5f5rYld/6ubrcHlod9bHq6Nh1CZV3QB7UWPKPaSu67G
 ZXOyNF/QArLUMqkvLq1kVEdabdUpqjotPFoZ9ny/LHK7+6/VcIRT5KbqNq12M7lPAMH/
 xvyNY7cLbE8KEOfWCmNp061lvXLgWm87Y9WEi5qWb5nf6Y0c6UXLbwQI4fmW+s5O88P1
 zOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qNQRvMNaIXyVbqoVWVPAZdQE8EjkcwMkTf+5DbPtj9c=;
 b=IRwLHs6l8lvZCXK8w4/5knHb+Tl4GRP55MNTIato2xtrL/JtJc3EWyW8jUtwC1KcGW
 eyPfwhvoCq+jOWCDmkywhAJUO9Ji44n7jfrxMmy8Hfc2rZqN1JI5gqa5B6NbJOO0dYXI
 vXYsvKJ1bohlZn5GZ7AWSKwP33b1UQqGF+WBzA8WZrKj9Qit9XGWZDnNRVxlf/0Yf5+r
 ElYNYwzyn7tJfIL3o2DqDF6CGf58dfCq2fx5XSfxCCw61nEP2N/DHFNqvBOEZfUOzmKh
 +Kv3AhIqJmHYba7axYTO5qVlzUyWooeSJajE4nNQ/bwXC+xP9M1hN6MK/IsgAr9BN5vo
 Ca/A==
X-Gm-Message-State: AOAM531Ifb2TVgnfp+OyABxphltWhWugQcnY9RTikkUDIKRYwXCwum68
 In3CQhdLRMIUJF3phlFwJWlPTTW7onFwbw==
X-Received: by 2002:a05:600c:2905:: with SMTP id
 i5mr10487614wmd.91.1623683447448; 
 Mon, 14 Jun 2021 08:10:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 46/57] target/arm: Implement MVE VQRSHL
Date: Mon, 14 Jun 2021 16:09:56 +0100
Message-Id: <20210614151007.4545-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: iSmZJ/ZZbAlX

Implement the MV VQRSHL (vector) insn.  Again, the code to perform
the actual shifts is borrowed from neon_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1c5626bb726..42be99ad526 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 2c37e265765..e78eab6d659 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
+VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 31ee057db2e..3464dd311f1 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -622,9 +622,15 @@ DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
     WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
 #define DO_UQSHL_OP(N, M, satp) \
     WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, false, satp)
+#define DO_SQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, true, satp)
+#define DO_UQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, true, satp)
 
 DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
 DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+DO_2OP_SAT_S(vqrshls, DO_SQRSHL_OP)
+DO_2OP_SAT_U(vqrshlu, DO_UQRSHL_OP)
 
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bde62bf2445..ac0114c8358 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
+DO_2OP(VQRSHL_S, vqrshls)
+DO_2OP(VQRSHL_U, vqrshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

