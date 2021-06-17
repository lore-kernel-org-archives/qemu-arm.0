Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp497888lff;
        Thu, 17 Jun 2021 05:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR3USY5yyDYGWDn57GtdWZLY5i/E7wc0/Kxw5wdZwMHalRut900pstS2yv7WsTArxCUAnj
X-Received: by 2002:a05:6130:384:: with SMTP id az4mr5027718uab.59.1623933436763;
        Thu, 17 Jun 2021 05:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933436; cv=none;
        d=google.com; s=arc-20160816;
        b=kzv8varr4cEAHYQE3usG5Bn9wmeqHJMn87xqPah3W8C8YZMFNrz6PLT8tFvdQOsqL0
         bdawYGA1mQs8KOsBohsmJJALnI6wvHINogj3o8a6vBn5XXXYylJmir3oZqOKtao0kxWb
         yYjEf3JJbU8ak20zDfhSPQWSBPD3YT6hFRb/ZBgPt/IF6NrD3K2a3e+WEjcvRMmF1XeU
         cPc9NLBBPnPxUN2XlltCxEbbbxECugdo61oRK4V8Y49cUNXYhBN2ilp7gkisaHEr74Ge
         cck9n37N6VapvFkPXcEeb5NBMDRl7a4yOWacEHW8Ff1G21Ds54kZdNxSRGtNAvoncIRV
         YRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LqoTp3jMlRSR9bdF6Dg8iV0VxlX7b4D2jVB6chB7grU=;
        b=tdbt/L2pPzvoii36NQ+lM67PviPzERCEkJvQOB7DXmNcdn4JtDICHrC9t1vGEM+1kV
         IhiR/JubgR0lTmfd3i9JKyiJ4+CoopwMEk4cJYe839V5v1q4nMyUsCUcXJWnTyGinNQz
         WmnqmPtYuPCTbfdvBzcXIwQbdCyoH8MyhNKu6ueL3pSlAYs3mU3jvI0rKdL7nYyLz+++
         gTOkP5Bb3ujqyOnxMOmFhZ/s7Ncv1M9ShYzV3PaOcCjGSUbgSoEMXaDRhRCzPcQi9rFh
         7hU7FutK+y8SnC2QMC335UJJU6PxLkFQq17tQUnTc3OSKG2SoOklq/WdFM9yWwqHEsFK
         Gvyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqcvUhBL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si3664318ual.2.2021.06.17.05.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqcvUhBL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrGl-0004t2-UP
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx3-0001cx-84
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwu-00070Q-8E
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f2so6506711wri.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqoTp3jMlRSR9bdF6Dg8iV0VxlX7b4D2jVB6chB7grU=;
 b=kqcvUhBLWwRgkpH65VurZD5mtkMoTayHJZvNIOePS/X+j/JrtytpiqnqEO4vu3UU7L
 W6IKVHHv7SuIKIO3DlmCc0j7kIbfWY88kHr9nm9cMhlcfDqXFSTN8iKdX3hl4tuH4dpG
 P19ZB43L7r/oAPaURyfBPiQZPpmBbS4R95QqHc869L4XoeeFnBW/p99sgCLpQZbqq9O+
 Q8cEoW5JhK5fREiKeb1sBSxg9VR30s5VJ7FdTiSgatgmXAQDEd0CLKbpaeD+o/mT7//W
 fttwCmof6p2RnIclcZtvIymP719GZihG28Zd4KYtWD4+cV2b7jNeWA+UehAcPGvsQNE1
 idRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqoTp3jMlRSR9bdF6Dg8iV0VxlX7b4D2jVB6chB7grU=;
 b=FCKE0mIS5b81+f1i3X2lVAd42irdoT5ZU8qirPns3RFl34b9CbflSeQBDdh4eSs7Nq
 2LxWCTD0wLrv6mpNafHUzzN2tsm/F6XWjsXm5BVtDClq9dXk2QSxM3o7bsDXJlM0Rqu4
 yfDVuEcJ5Abs1xjJn/CG80A+tBFuKodHvtUGh5A60nW5B1su6pU0RztxFYrq/KI9ndhg
 VsybhD1Uhsl1FJeoL1eWIFmKLOlffA/5EOUMVTcvf6logxp/nw7bSf6zHQddgmqB9DBg
 nB75/6YFJHp9r2bO9CnGJuhAt7ycA0/m8scPBbY8t68RPUwLfE+/fHMa1SUn8DIvNcYs
 vFrQ==
X-Gm-Message-State: AOAM530/4TLDQ06NmufQk01KuqYoSk6m2z2YPwAc66NuEXGncwhyUONt
 u4C4uIP7jzWbTNkZcsbPxIzK9g==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr5378506wrm.229.1623932202902; 
 Thu, 17 Jun 2021 05:16:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 16/44] target/arm: Implement MVE VABD
Date: Thu, 17 Jun 2021 13:16:00 +0100
Message-Id: <20210617121628.20116-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0af/LKVIETps

Implement the MVE VABD insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 7 +++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5181d3b9413..5cd4e7d736d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -109,3 +109,10 @@ DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vabdsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 42d5504500c..087d3db2a31 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -93,6 +93,9 @@ VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
 VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 
+VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 888d74d5b1c..65141221b63 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -439,3 +439,8 @@ DO_2OP_S(vmaxs, DO_MAX)
 DO_2OP_U(vmaxu, DO_MAX)
 DO_2OP_S(vmins, DO_MIN)
 DO_2OP_U(vminu, DO_MIN)
+
+#define DO_ABD(N, M)  ((N) >= (M) ? (N) - (M) : (M) - (N))
+
+DO_2OP_S(vabds, DO_ABD)
+DO_2OP_U(vabdu, DO_ABD)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 107c393a997..041fd1ef14f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -355,3 +355,5 @@ DO_2OP(VMAX_S, vmaxs)
 DO_2OP(VMAX_U, vmaxu)
 DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
+DO_2OP(VABD_S, vabds)
+DO_2OP(VABD_U, vabdu)
-- 
2.20.1

