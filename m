Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3694286lfa;
        Mon, 7 Jun 2021 10:24:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynqjnSKZ/y33M7yVMW8ms6w6qart/pcSZRYvY0lJ3WxTB3fMz1q033nsaRgV5z7f1Bt93F
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr15214627otb.257.1623086653633;
        Mon, 07 Jun 2021 10:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086653; cv=none;
        d=google.com; s=arc-20160816;
        b=J35q60RSUDphY3/k3xw7FGbnpwnbZZTiv9s8jpR2Why77+WQ8/KKRbmgr8aAuyOkZB
         ISxUtawvujYsrbdYMZo7NCEu1XOvt5gHQCCRNQIU4E/ZI7dhZRW01Zc89JF+w889hX09
         /ozUpjqpDdiGcBdl8s1bVKfZlv8gngSI4f0EBmqUUTb9989djfiA3xIwPVj93DcFCurE
         pImsPkV6yJihjdLtcuB2ZpmV1ISeVFvP0sKHYjsGGAVQCYOT9jfrEO2pj9tMnDdtiteX
         +tWo0STqvkqrDXAzOUyJ1XF5vC+8lc6J3a/J+lPx7438uhJPhBpViMFgE3R2D4mvEdaU
         S5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Lmitx3Cr0jgwChXHcEsjI6tKva1OYZOq2ukb+k0uZ1A=;
        b=fGdBFnOkbU3+Zi+c0tZmN+YrgAjJy8yhahK1HLlYBDn4sUah0mU8gnbKredOy7+Tx2
         KWGF9BEI+29sv9ab2c23oVoZ/OBM+bT5K8BReTZ37mnWMI0DWc3VHIIbDKXOSqkXzrpZ
         gmf/ukLoja7leeI60hdWMm98dM1JvnL/o41Rw2J5wFtt0XI+7T5a92FIhyiIBLcfRgqc
         H6AcgJv1yUvpMnV5yjI79p7cvg+QE6J4pDNieCRsvLvQV4Vm2MF47JfULxhInw/fvNoj
         dDjoqkSY7uDYRf+N/4Pc+/epOjbKvOYCA2NwckWbTvNxRy9hW4XwC2wtyEv99E1WiHGS
         CHVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/U0EZM7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si10587737otc.181.2021.06.07.10.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/U0EZM7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIyy-0003iz-TM
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIal-0007eA-R2
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaN-0007zd-Ny
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f2so18391459wri.11
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lmitx3Cr0jgwChXHcEsjI6tKva1OYZOq2ukb+k0uZ1A=;
 b=O/U0EZM7TpiX0bCY+g2CUvmd1NQWPFhTAdTTJ84lU5Tf+IHNcFICtn0MPI5AMoy4As
 FHYl2gQ+sbunN4+Z/KrLuxp5uswpDmMSZVJBjU05q2rafdqrlnIwTGXjcVLr5N8nCHYr
 jGzKM4xoITtNQycoJugvGmgzwNZhWeDBDNxyDmD8KPIqFTjWNRgzSAzbUxqsGScclDYY
 BrPxPSheXRqXUlTrdpZ0iLMrvVNzBHjXBogN/zM+E9b8U5+JBGtSmfai4WMPxbhzBFqO
 dQ5qNNBIO3G908F5R4UP2d8dFIHq25E2CjeIcBRf4fjOPZTKScHVkE8JDchUNmPlRgfK
 btww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lmitx3Cr0jgwChXHcEsjI6tKva1OYZOq2ukb+k0uZ1A=;
 b=ggT/JsE/szWXeijq012Q8ZecDSr9UarZVp0P8Z/sN2+yA45e7Jamlvk1oKv6SQbjBZ
 2+mrwfZTj0g8o/1i5kzDV/zoSnxCSqUVAAzQ2Jdu3MIeT9HRfCHZhN9FrsU7U+DK/uey
 smBaLPrFtCVLB6HdIft4FcAOw5YZsVIO2zgJ2FWl+KEFzFIGu/44YW9h+rqn6s4pj12V
 QELyUhfnnvxWD9ljVQpxmZumydB19mNmHQGLSmeYqVFy8G9pEV3VtWebO5qSzinQEHat
 49ttbF5OWoYy6Fy1Re2EyE2/z2xHGm9pTOnvX8yZJ9Fbh8v7yaEKvgyjxb6S0Hr94rZN
 4GXg==
X-Gm-Message-State: AOAM533h2szEv6oWtIrXDUul+H2+9QY3ls4lNQ3OJzYGEoOg1CqtWLha
 g9SRUtHdsjde5+AozTb2GvQT2WAMZCZBRXES
X-Received: by 2002:a5d:6382:: with SMTP id p2mr18888638wru.338.1623085123788; 
 Mon, 07 Jun 2021 09:58:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/55] target/arm: Implement MVE VMAX, VMIN
Date: Mon,  7 Jun 2021 17:57:51 +0100
Message-Id: <20210607165821.9892-26-peter.maydell@linaro.org>
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
X-TUID: zCAXPLC0OUMP

Implement the MVE VMAX and VMIN insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 38d084429b8..bc9dcde5dba 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -97,3 +97,17 @@ DEF_HELPER_FLAGS_4(mve_vrmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmaxsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 4ab6c9dba90..42d5504500c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -88,6 +88,11 @@ VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 VRMULH_S         111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 VRMULH_U         111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VMAX_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
+VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
+VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
+VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 20d96b86f5a..f53551c7de5 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -329,6 +329,12 @@ DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
     DO_2OP(OP##h, 2, uint16_t, H2, FN)          \
     DO_2OP(OP##w, 4, uint32_t, H4, FN)
 
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_S(OP, FN)                        \
+    DO_2OP(OP##b, 1, int8_t, H1, FN)            \
+    DO_2OP(OP##h, 2, int16_t, H2, FN)           \
+    DO_2OP(OP##w, 4, int32_t, H4, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -396,3 +402,11 @@ DO_2OP(vrmulhsw, 4, int32_t, H4, do_rmulh_w)
 DO_2OP(vrmulhub, 1, uint8_t, H1, do_rmulh_b)
 DO_2OP(vrmulhuh, 2, uint16_t, H2, do_rmulh_h)
 DO_2OP(vrmulhuw, 4, uint32_t, H4, do_rmulh_w)
+
+#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
+#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
+
+DO_2OP_S(vmaxs, DO_MAX)
+DO_2OP_U(vmaxu, DO_MAX)
+DO_2OP_S(vmins, DO_MIN)
+DO_2OP_U(vminu, DO_MIN)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 7e9d852c6ff..c12b0174b82 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -383,3 +383,7 @@ DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
 DO_2OP(VRMULH_S, vrmulhs)
 DO_2OP(VRMULH_U, vrmulhu)
+DO_2OP(VMAX_S, vmaxs)
+DO_2OP(VMAX_U, vmaxu)
+DO_2OP(VMIN_S, vmins)
+DO_2OP(VMIN_U, vminu)
-- 
2.20.1

