Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp496518lff;
        Thu, 17 Jun 2021 05:35:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXqMSgY+ITWD6ozZXhbwYtNgevvOttmWaP6jQKBd8P79c8iFA292GAUHrP1+NnvVsqjRKE
X-Received: by 2002:a50:ec08:: with SMTP id g8mr6260529edr.376.1623933330923;
        Thu, 17 Jun 2021 05:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933330; cv=none;
        d=google.com; s=arc-20160816;
        b=kJx7MDs0z52qcnawfZm2NbLbvWv4QfD+ggYOjENETn4qx5TB18LeVbmB/eRotzn98E
         YO2cTWVyYttMmoJd3cQAd5tyMmvrPQnCcOGYXf0Rk7P7JqAR8T9MXaEPGc/muCoHDvWO
         XYS8/lWjZm7pqm96xDvUSg9eCwQM9uwO8xtiAcGc0gsnqnzNlyFMgc6LoQNc8jzA/nto
         ERtlyn9h7YaxlwX75Tw5I3VNQj43TBhNMfdCJTYo6WEhUFFwM0KBP7/TYnFsVFJEajYy
         tKtqRheSIavosg9wTlS7x3NB6w+Hv0W9L8Zapb1A8j1ZhomnwZncJn+atx6/aXyBf6gb
         gkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l9CGsd2JDLWqVBRR7mAVVVxLinFqjtRSoga/NQkTbnQ=;
        b=EtEvhJUxbPACJ98FrvG26Q6VQ8UZW3DV0SX3hsvcOP1O+uf6qPo5tKgpk6hoZWRAkQ
         zaXxIuUaOCVLbLP6ZJOPcEO2mXmYzLX/bfUzQWkOzOC948WUY80vuvA8qjdApJWg+FNk
         QuxQNY9wHmGn4y2OAi2AKMNlDa/6we9jW+Gm/BNMND9iFtL//tAyWXSnuF5SmfdNxkO8
         03ArIsBBlQUUK4dAloIuUZveVlnengnF9UcsP9DfKm/qeRCSmxh4MGtGBdrhURdQkpGl
         r6WHNByJGVVPcdd5NJbyjLhI20EFG5o9yNr1Ud+t1jGeSPwxlUJiqmHV25Y3Ajx65Ffn
         Wr2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kliH5axT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si5477967ede.590.2021.06.17.05.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kliH5axT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrF3-00014C-Tl
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxB-0001qD-I1
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:01 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx0-00076z-LZ
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r9so6524041wrz.10
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9CGsd2JDLWqVBRR7mAVVVxLinFqjtRSoga/NQkTbnQ=;
 b=kliH5axTyURKAY6d0yfYKpjZgBJa2BDMVc2vhI2bPOE+6EKl8hSN6Clca5vpri/g9T
 pFjSIT7A1YIGpPXhuY1UcazTO6jCt3S13n8LuSq/ivb4yhv+8K1HYM8l/dy6ZYFHlyF2
 zN1oxfg1ttbdZ9jwzXb+bcvQn5dhskGafsv6gzdGPMfDM7M0tlvbLSgstPvu/WcllhwZ
 qAO2fghkiNuy02C9QVJbdHfiY8EcgyKjMfFqi+jGAswI6+nm5yZIXR6HbjM/e2j230m/
 mx+x9xaPq2R3JoqYNy4ygpCV7AJ2IEk1nKSwJLcalW0RZbFgZOPQxRt+AMzd3LS+85Sx
 xSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9CGsd2JDLWqVBRR7mAVVVxLinFqjtRSoga/NQkTbnQ=;
 b=l7tj5Zq32/i9/lN8AxCZ3+WprjnXunUAwF2LlGCoJf9AXCC6XzvKjxm1v8BNNBqlqr
 ZKwepg25ZEBPq/t3SRDfqPJJRLIfiVAfYjiJtpBr1OY4B73ax0YdxrEUIMWFLRKv1wCQ
 xCDlU1D8A422hyneQFTwnHZp80sl6yPRDeAQRMY3/MQNh6dHecEZt6Oub4elJZy4yOJI
 R3hwVessDMzovyy4YVq5TUwThaFvbKUTA6+PRjrbWh2lhhi3GKbp7cF+LJGvoPfzNgR/
 d49qaJLiakEoWwj+kQQtAaOvFi1/GkO1YW/k6YQECk7b1AU4GbzExKtPJrmTvJMZXn/6
 D0tw==
X-Gm-Message-State: AOAM530ByHb10x/zLftQoqDXyYugcIjyvl/Od4fIOwSh8hJ4Rj9sA9jy
 57Nb8fsR1DBUyfhKbHtoiwP+IL0PfIoDEQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr5440586wri.196.1623932209049; 
 Thu, 17 Jun 2021 05:16:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 24/44] target/arm: Implement MVE VHADD, VHSUB (scalar)
Date: Thu, 17 Jun 2021 13:16:08 +0100
Message-Id: <20210617121628.20116-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: xj0C6Mo4FOX9

Implement the scalar variants of the MVE VHADD and VHSUB insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    |  8 ++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 32 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 912505d0152..52086d769f4 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -157,6 +157,22 @@ DEF_HELPER_FLAGS_4(mve_vmul_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmul_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vhadds_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhadds_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhadds_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vhaddu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhaddu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhaddu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vhsubs_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubs_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubs_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index af5fba78ce2..5c332b04a7c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -163,3 +163,7 @@ VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_no
 VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
 VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
 VMUL_scalar      1110 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
+VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5fbe44745d3..0ea1605182b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -525,10 +525,18 @@ DO_2OP_U(vhsubu, do_vhsub_u)
     DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
     DO_2OP_SCALAR(OP##h, 2, uint16_t, FN)       \
     DO_2OP_SCALAR(OP##w, 4, uint32_t, FN)
+#define DO_2OP_SCALAR_S(OP, FN)                 \
+    DO_2OP_SCALAR(OP##b, 1, int8_t, FN)         \
+    DO_2OP_SCALAR(OP##h, 2, int16_t, FN)        \
+    DO_2OP_SCALAR(OP##w, 4, int32_t, FN)
 
 DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
 DO_2OP_SCALAR_U(vsub_scalar, DO_SUB)
 DO_2OP_SCALAR_U(vmul_scalar, DO_MUL)
+DO_2OP_SCALAR_S(vhadds_scalar, do_vhadd_s)
+DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
+DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
+DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
 /*
  * Multiply add long dual accumulate ops.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 3c059ad91cd..4b379bfe6e4 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -429,6 +429,10 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
 DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
 DO_2OP_SCALAR(VSUB_scalar, vsub_scalar)
 DO_2OP_SCALAR(VMUL_scalar, vmul_scalar)
+DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
+DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
+DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
+DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1

