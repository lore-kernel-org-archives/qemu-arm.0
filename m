Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp489941lff;
        Thu, 17 Jun 2021 05:27:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1Efy+asJw10UWIPu5fG7FYXPHP4ZopSwrpQ92ns83x0cddAAYzl1WD11DkVVgw9G5Xjtv
X-Received: by 2002:ab0:2690:: with SMTP id t16mr4821061uao.9.1623932832203;
        Thu, 17 Jun 2021 05:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623932832; cv=none;
        d=google.com; s=arc-20160816;
        b=SkFnhIQpnOEDXTHPuK4hLqNq/tEivoSkzf/+1c6NbxuvPTJLQFc4qlGvHMCEO4qv/5
         +LAZVOOPfPXFtmSVYgTsCnYsiM3qKg9pTEiitnj2E1GcNxCHAS3BRWIqjCCtytfKh+Xr
         m3eWP5sjWJalII5Xndy74Gw7cVjN0rCNF1iCLLKYSRTxB4cyz6cbHAWssLpq4omnZIhw
         +qE8zbBUF25OmsyXLyzSaN4qxPwV8USfC/9qAwVB27cTknApLV9u8HMeM9XICtjoC1dV
         xWf2cJfUcjsdxFrUOG6kyXgnOh+OfyTipONBfHP8wwxYrhcOsYdmMXX2fT10CSYcgkLm
         1Baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mzLKJNfiBgDVbcPmDHzHURLnPVKoRg2EJjxlEH4Mm1E=;
        b=pPSYNvuOvnOCGoENrNhYuZTc2dChh/cY/pUql0x+VwqTpXuY9pK926DEpOakc/Kbdj
         Ga3D4VUn2F9wTSruTb6Wqj3ANCb0bjQ9pqzlF0F1AREbw7kFaOOjehRD+6ZTQZGnuz+6
         EeVRjQDnUABFNS4g8EKtE0r4pzWGLCQ51MazcLtV7aLQyI8TNKGz02FwHGqZSxhdUnwJ
         KbNxhvLC1fc1T+K91sN+y/NLOvRcZS8JpOHd9XaOE0Z5PvzsR7zgPFfhlu0H8G4Gm0ow
         d7tjxl3D3XOJ+0uhH0Qm7gMwQJl//BNj/64U6Uv6OZHmc1loAHaQmjBni5PV2skTX4QE
         kfuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9Ins+fy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si3434051vsd.255.2021.06.17.05.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9Ins+fy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltr71-0003lj-Fa
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwx-0001Pc-QX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwr-0006zK-Gf
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so1528572wmb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mzLKJNfiBgDVbcPmDHzHURLnPVKoRg2EJjxlEH4Mm1E=;
 b=a9Ins+fyB55Q5dNY1OBfKOMVFjk0ZpibTLCigmlj4+MVAFErh7fOmb+9dGW6zhO/XI
 1mwxamtDyZMc7cKFuYbHW5sC000Ip/DU2zvHyL24wTPMnLBBTx+9TeIYcpyKN2FicRnD
 5hwEiKEqzZdG92SEOvBcX5FKMl4iA+N7F0s8XhS4miv7nj81aZnkmVDYQU20vFZK9Ex8
 UQTlxniNhJ6fXGXBz4h69MQjKBCL0YmDNso1fx5H41TFpcrkBmQ0RyDlRVzUadHZqKvr
 quXjsafL74Irf2MhhuRIC1iOBzjp3qTNfmZ18P620tU2xWPDcf8g64XGPxSRc4S40IZ6
 lPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mzLKJNfiBgDVbcPmDHzHURLnPVKoRg2EJjxlEH4Mm1E=;
 b=bVSJAVK3FFaHe8YFuvSwbVUbpTzPvRE/SpGyoGMmTUZheDCUigbr4HdembZMQM5B71
 tWufrHTMFqQI/+VV+X3d2yq8cpH5ju+Xqjl47ixQeV3/4Z74uk3SQEifOkLNm+LG3YMq
 UayxconPfyBFfP2Pt/SaLFG00ZMbMuckqO3evjnrIvQPQ5LRQxxE9YFcmrQHvL8WTWXP
 w50JEmSrSwKxhxip4b435Pj9sMCPe6YRZcGu7kr6hHAO4Jn3XzDkmwmz7p6rPOkJdDAa
 TKeX7wvZ/HmK/qOnRJlhOhbONeImlJChXaG41a8dgCVQWNiiHFeynvy3Ge+dJJbIe3PF
 6WIA==
X-Gm-Message-State: AOAM532PBxhYNl2YnPJ1uDvNgwhxXReG7sHzdOCB3/qwX8b4LuckxlRQ
 UCBzUDXe6MMP6KyGtim91BpGyw==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr4717870wmh.104.1623932199925; 
 Thu, 17 Jun 2021 05:16:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 12/44] target/arm: Implement MVE VADD, VSUB, VMUL
Date: Thu, 17 Jun 2021 13:15:56 +0100
Message-Id: <20210617121628.20116-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
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
X-TUID: 7ub4PEjp/DQ3

Implement the MVE VADD, VSUB and VMUL insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 12 ++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c | 16 ++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 01b6123f250..707b9cbd546 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -69,3 +69,15 @@ DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vaddw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vsubb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsubh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsubw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 332e0b8d1d6..f7d1d303f17 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -33,6 +33,7 @@
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
+@2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 # Vector loads and stores
@@ -77,6 +78,10 @@ VORR             1110 1111 0 . 10 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 VORN             1110 1111 0 . 11 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 VEOR             1111 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 
+VADD             1110 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
+VSUB             1111 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
+VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a8f873e735e..6bbd15a3d9e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -352,6 +352,12 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_U(OP, FN)                        \
+    DO_2OP(OP##b, 1, uint8_t, FN)               \
+    DO_2OP(OP##h, 2, uint16_t, FN)              \
+    DO_2OP(OP##w, 4, uint32_t, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -363,3 +369,11 @@ DO_2OP(vbic, 8, uint64_t, DO_BIC)
 DO_2OP(vorr, 8, uint64_t, DO_ORR)
 DO_2OP(vorn, 8, uint64_t, DO_ORN)
 DO_2OP(veor, 8, uint64_t, DO_EOR)
+
+#define DO_ADD(N, M) ((N) + (M))
+#define DO_SUB(N, M) ((N) - (M))
+#define DO_MUL(N, M) ((N) * (M))
+
+DO_2OP_U(vadd, DO_ADD)
+DO_2OP_U(vsub, DO_SUB)
+DO_2OP_U(vmul, DO_MUL)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2546567774c..5d3dee46995 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -331,3 +331,19 @@ DO_LOGIC(VBIC, gen_helper_mve_vbic)
 DO_LOGIC(VORR, gen_helper_mve_vorr)
 DO_LOGIC(VORN, gen_helper_mve_vorn)
 DO_LOGIC(VEOR, gen_helper_mve_veor)
+
+#define DO_2OP(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        static MVEGenTwoOpFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_2op(s, a, fns[a->size]);                      \
+    }
+
+DO_2OP(VADD, vadd)
+DO_2OP(VSUB, vsub)
+DO_2OP(VMUL, vmul)
-- 
2.20.1

