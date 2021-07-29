Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5548843lfc;
        Thu, 29 Jul 2021 04:32:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzg5SSDaD8sEGwZBwP6OS2a1uYVtxZ5QlfijoQ8cb5YSw6hdBcm1WQS2zvacp2qTnqNWn2
X-Received: by 2002:a5d:8754:: with SMTP id k20mr3763393iol.160.1627558321569;
        Thu, 29 Jul 2021 04:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627558321; cv=none;
        d=google.com; s=arc-20160816;
        b=rdKtnPcEhooGi0lqwH2/uXbx8FhrIlF3AufynlkKGXehD7V1MqBc1TiXlV4LCPbCot
         7DNcB086H8PwGm3EDk8FIziqg6rnX0ZJfzONg49r3pCOSBXN9NIjH0+34DqeWbaVNyPm
         9G/AirrMSZsywsR0Qw20focTzvZM2lbXAiQ5BZEPgEwe+ydBm3xyIl+mAxt3urCdfdJg
         KbIThqDtxUKo4m3cd+2Kg9agIVNL/jmMf+L4cfwF8FTpauGjhoukCA4fwolVYZ4oXNy0
         bL0Mjicgx3dFJjtZO94cOZqSCY0UdiPycdv76tgyEZqN9FqDnL6bgLvqloZeRUvyTwfD
         w0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H9TZmaWqhZmwH6AhFQ01QX7XQokaEmxCohWlyYnItss=;
        b=a0DJ4OwLu64Dxj7z9/jwGz4/vIZlwTMa6hciQ5k/dgnUDAzUAXQZDn2CackUKhoRE1
         t54EXk+ZRgeTUJbMIJgMC7I7IWzXen2qlYaq8/9ITGF7bd6ICuVMyX5kyP7FaWqxkHgS
         9SCsiuQVe4FhSYT6lOpVl2Fq462VfKBzXV9cp/0rRZb4wj7C4am5yJsXO++f9+H8z0ij
         AWd7IcIw0Nt0DFb4euxMERh1wPri/5RM2eE4281D6SlJmauvO+iH2PFQZ1AgtKe1ruOz
         z0Dd6fwaHBOQisNanQHYo8JEbazmjPmfXyk3ZU8+DNgDOunEYzHZinT7eWsB1d2XmZxN
         fVlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wK6yb4kG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si3282338ilx.20.2021.07.29.04.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:32:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wK6yb4kG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94Ge-0000Tr-Px
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940z-0000fv-0h
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:49 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-00019q-LY
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so3770468wmq.2
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H9TZmaWqhZmwH6AhFQ01QX7XQokaEmxCohWlyYnItss=;
 b=wK6yb4kGx51zJ2lJQyDXkel7EjQqfiMi9z+xK9u1dstCRvhouHXI0YL37JCxadYHcl
 FmZdXxJ82X2z1V0iBpsPX9GY7DxDu6hkz6B6c6vCKHMkKhH2OVnp09NnajPEC3bD5gKw
 j0vZt2N2rEOrLUZ5ha4bnrsKfDvSjTTRE/fWmmTBgPby9lEABdij6DBHmCcYn7nU9jqQ
 DQgGKMpxy3Pslq5+MXvIis/3QUTVoysxM3AI+cM7T9j5uFCEDp7zpzAQ9KMPJwpKJ8F5
 usa8i2tHfVU5BaDt8SccpqcOfrJsE1Tgx9NDD1y6HwYrs0JdvVI2G0ayu0vAsM03n6zX
 96zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9TZmaWqhZmwH6AhFQ01QX7XQokaEmxCohWlyYnItss=;
 b=a3aEKd0J72WuHU6p+HEBB/za6SpRuNBGINCdWaQTdFYy3itdBgz1xqJJfCHYiLBvBP
 vwK0N8Qj6ttEups4xlc8CZFuauWsP/N2VVmkA2KD/yNmI6bXOpHAjvEVj821MKT72sJz
 bY7KKnszHPC0N3Wg2Ne/D4oruqnm0kjM9KFqQmN8kCA58x2KUAW6esUBWanJo5HHrdV5
 Rm/xfxqJ/zqgF+twB+8ICChwEIuMmKOAF1cFGHApoBoLBE031fRqURuwjAlTi6zIbTWJ
 +ko83Rp3JQ7wV02clPFw+xbWhpAHiyu/foJWESdzHx3suOlPCnBl5bgC9ifrj2jYF7jd
 I1ZQ==
X-Gm-Message-State: AOAM531rUZzHJHj/zpquEG66Z2BFk8WpLBwXfH79Bb7tr+39WOB3IyVO
 Z9tLaB4FQDSZNMmvOfxgVS1GNV+nW17fWA==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr725597wmh.0.1627557328943;
 Thu, 29 Jul 2021 04:15:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 17/53] target/arm: Implement MVE VPSEL
Date: Thu, 29 Jul 2021 12:14:36 +0100
Message-Id: <20210729111512.16541-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zw6BQ1JQk6RU

Implement the MVE VPSEL insn, which sets each byte of the destination
vector Qd to the byte from either Qn or Qm depending on the value of
the corresponding bit in VPR.P0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  2 ++
 target/arm/mve.decode      |  7 +++++--
 target/arm/mve_helper.c    | 19 +++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 4f9903e66ef..16c4c3b8f61 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -82,6 +82,8 @@ DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vpsel, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vaddb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vaddw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ef708ba80ff..4bd20a9a319 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -468,8 +468,11 @@ VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
 # effectively "VCMP then VPST". A plain "VCMP" has a mask field of zero.
 VCMPEQ            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp
 VCMPNE            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp
-VCMPCS            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
-VCMPHI            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
+{
+  VPSEL           1111 1110 0 . 11 ... 1 ... 0 1111 . 0 . 0 ... 1 @2op_nosz
+  VCMPCS          1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
+  VCMPHI          1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
+}
 VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
 VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
 VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1a021a9a817..03171766b57 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1842,3 +1842,22 @@ DO_VCMP_S(vcmpge, DO_GE)
 DO_VCMP_S(vcmplt, DO_LT)
 DO_VCMP_S(vcmpgt, DO_GT)
 DO_VCMP_S(vcmple, DO_LE)
+
+void HELPER(mve_vpsel)(CPUARMState *env, void *vd, void *vn, void *vm)
+{
+    /*
+     * Qd[n] = VPR.P0[n] ? Qn[n] : Qm[n]
+     * but note that whether bytes are written to Qd is still subject
+     * to (all forms of) predication in the usual way.
+     */
+    uint64_t *d = vd, *n = vn, *m = vm;
+    uint16_t mask = mve_element_mask(env);
+    uint16_t p0 = FIELD_EX32(env->v7m.vpr, V7M_VPR, P0);
+    unsigned e;
+    for (e = 0; e < 16 / 8; e++, mask >>= 8, p0 >>= 8) {
+        uint64_t r = m[H8(e)];
+        mergemask(&r, n[H8(e)], p0);
+        mergemask(&d[H8(e)], r, mask);
+    }
+    mve_advance_vpt(env);
+}
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6c6f159aa3e..aa38218e08f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -376,6 +376,8 @@ DO_LOGIC(VORR, gen_helper_mve_vorr)
 DO_LOGIC(VORN, gen_helper_mve_vorn)
 DO_LOGIC(VEOR, gen_helper_mve_veor)
 
+DO_LOGIC(VPSEL, gen_helper_mve_vpsel)
+
 #define DO_2OP(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
-- 
2.20.1

