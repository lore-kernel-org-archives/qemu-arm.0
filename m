Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2081150lff;
        Mon, 14 Jun 2021 08:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx4bUf7sq+JxtKn4XBmi1B7NvVObbiQB50jAj145dIDvzMRJ2/rqRRtcmO+rFAHfNZh5bN
X-Received: by 2002:a05:600c:354f:: with SMTP id i15mr32352529wmq.131.1623685058259;
        Mon, 14 Jun 2021 08:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685058; cv=none;
        d=google.com; s=arc-20160816;
        b=oyliodU9bBLhdB08ndr0gKTPsvhiKyEJAw7B67D9YbW4SRtcEEglU8yDMIQ4W9KWhP
         5OOktGvdgDLr8nJWaF6rOmSOEJk3E8bdmHFx/PpnrOxC+L1bM03/LDi7NWn0LHxInl7w
         uGjwAJbPofqDTjf5PTiKDbcHFM5rr9hnVe41+mL4RfvTcVVWJtfI6Kw+Uaq5QDNpMrIa
         aX+vzc3ON1oiVDIUXPkNmJ9VIWQ3CvTFPyYosJLnRW6Lq2i7j6al4qeRZbn+3plijvL3
         ux7Wr/BnnbNaAFiUbXhRid8tFRSy03tHjUlTrZ5CqS/h83Anz3RtRHjElB2tLI/9e97q
         q9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WP3yw/hS1pkprDLOSdYQbjEtB9oL/BmXI/yNEZkMMxg=;
        b=GEE5WfaasAODDSVcDhugoQp0oe3eS/UWa85FI19TMTA/joez+uFzGZtkJTIiDepiPM
         xJg/ykCDSkGgEEpl2/jNhTkuYYt/Uv/AlGyw4IOlKM9s12Gcq84cREjCzd7LhbovHmLx
         5FFDgMJP1+7kZ4bQPpJWuHsWNkgf4UQlaibHAkqHZzrrjcLbKiiL8qbaxs3yU/LYAanc
         dDMuABWRByVyHpp6IIdvJa3ViH+QHLJ+3arZnxOd8quIYVJF6ZPZFNOIEvJbo+4E40zW
         eZe8VxE5cy/vc154Gc61UgwfMeWzZNlNcqs0G57gOb6j4zS057rDYCjGtywMhqCSBzpH
         wmCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hz+uoNcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si16210111wry.334.2021.06.14.08.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hz+uoNcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoef-0006bP-7k
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoF1-0002MM-3L
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0000a7-2a
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso187343wms.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WP3yw/hS1pkprDLOSdYQbjEtB9oL/BmXI/yNEZkMMxg=;
 b=Hz+uoNcqMSGuTEHJBo7scotX2FTjsNyad8c9M3rj3k1fd72+t1bQp2wX7lbtpYSJBw
 XT44mkgsoGwE30BIpPfkyjdjUWb9HDjU5+1DN/uhLUVxFLGm5H0olkiGNdQykJ7W1K1r
 YWKyoelzK8W5Aqzo73OZKSw3yyDouUAAa/tRFAO7cibIyIUQ2sN4SqcroFyOeZN0QKy5
 3B3b/q6g+zIFGp066h8rvZSO+aMb2XoYR1MjBIK0rfo3uayD4c+FZwLDf2i966Gr/GTo
 ik1SmPrR9Bm4eQ3gaO2RqwKcniXlq+do1Ilm0oChaeKOhmT49VeJItlIr1PQBig5TdCH
 +WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WP3yw/hS1pkprDLOSdYQbjEtB9oL/BmXI/yNEZkMMxg=;
 b=K8HIIMYqjDKjYVJk5kUJ93ShI5tAUQ+QJE+m8CLuWNqUhv9Efl4EVkBlWlkk2VYLQW
 GIpwhNkEwvkrw4iRRQOcw71FkAv0GyNQyqk8LUm7jUgmC8cZdP/jGPgV3szopqKJpSSm
 aMuMMxY7R7mJzGE1Pywu87g8WIOrsozKttiqozy7LUB903AWquYSXQP2HSWAokDXXXSd
 hjLItMZY0Swfi0Mzshs/RhxWo9LE7C+aacKULrxEpftl0taxecqwsWYIgtbXqx3VEFRB
 4UTVPwQXzPlvDoZYa4xQ5+/PbnxycNFb8goC7pDbgAtZGsNkhwpx9UcDggJDYiWYGtcT
 ng2w==
X-Gm-Message-State: AOAM532KSosM3FCxB4W5bznLtpw0IhNJwT3JPPis7oFKuqXMeDgdZ/bG
 KcKaX44KfeVRCjyM+WDNp6O5MGGqYLkp8g==
X-Received: by 2002:a05:600c:441a:: with SMTP id
 u26mr17138386wmn.166.1623683445910; 
 Mon, 14 Jun 2021 08:10:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 44/57] target/arm: Implement MVE VQADD, VQSUB (vector)
Date: Mon, 14 Jun 2021 16:09:54 +0100
Message-Id: <20210614151007.4545-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: OwafjenQ4kEx

Implement the vector forms of the MVE VQADD and VQSUB insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c4e766c6511..93847fc04ad 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -153,6 +153,22 @@ DEF_HELPER_FLAGS_4(mve_vqrdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 9860d43f73c..80fa647c08f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -116,6 +116,11 @@ VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 
+VQADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
+VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
+VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
+VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 0f4c10c46ef..fc7e08d6128 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -578,6 +578,20 @@ DO_2OP_SAT(vqrdmulhb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT(vqrdmulhh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT(vqrdmulhw, 4, int32_t, DO_QRDMULH_W)
 
+DO_2OP_SAT(vqaddub, 1, uint8_t, DO_UQADD_B)
+DO_2OP_SAT(vqadduh, 2, uint16_t, DO_UQADD_H)
+DO_2OP_SAT(vqadduw, 4, uint32_t, DO_UQADD_W)
+DO_2OP_SAT(vqaddsb, 1, int8_t, DO_SQADD_B)
+DO_2OP_SAT(vqaddsh, 2, int16_t, DO_SQADD_H)
+DO_2OP_SAT(vqaddsw, 4, int32_t, DO_SQADD_W)
+
+DO_2OP_SAT(vqsubub, 1, uint8_t, DO_UQSUB_B)
+DO_2OP_SAT(vqsubuh, 2, uint16_t, DO_UQSUB_H)
+DO_2OP_SAT(vqsubuw, 4, uint32_t, DO_UQSUB_W)
+DO_2OP_SAT(vqsubsb, 1, int8_t, DO_SQSUB_B)
+DO_2OP_SAT(vqsubsh, 2, int16_t, DO_SQSUB_H)
+DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index baf587c118f..2accc050708 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -398,6 +398,10 @@ DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
 DO_2OP(VQDMULH, vqdmulh)
 DO_2OP(VQRDMULH, vqrdmulh)
+DO_2OP(VQADD_S, vqadds)
+DO_2OP(VQADD_U, vqaddu)
+DO_2OP(VQSUB_S, vqsubs)
+DO_2OP(VQSUB_U, vqsubu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

