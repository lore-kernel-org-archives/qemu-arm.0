Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2093422lff;
        Mon, 14 Jun 2021 08:54:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQUPQ03she2hvmlewXN5JYezJla5e3bWtt7NlcDaZqbB2c7ZZ1tUc0cddG8fX34KO+pW33
X-Received: by 2002:a05:6122:12ab:: with SMTP id j11mr1745945vkp.4.1623686057288;
        Mon, 14 Jun 2021 08:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623686057; cv=none;
        d=google.com; s=arc-20160816;
        b=iKhwMkLR6isgkaEaPeqoHmM23qrZTIpEMMapBPSe8Pf7fsYJl6vN+7nv/NTVtjcDF4
         ZPTvt91njzjBzv4lbxfg4kSBJMekw5YGxXdP299l4hEeVZJRfY0v8F5RCnNNVD2yN/XH
         hDGSsE6s+4O0ZQ0UN2+0QX9Ud1M3NbM9bdVvFLFOHyAqjlKO4kdYoTfEPBXfhbb5a2Js
         F/m7Zs6lruAdfaUXAdAEXaZfyMZPQrWJ/knCsgtps8fAN51JLYnEjW+9Gje/KeXfFASr
         o/xgjhXcIURDb+SeEw+qdyLHaemWg/kSunHMPdnA11xnIBB9mxgQFzAJBgtF/JbJYWk9
         wMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Si7m8vGilv6/F+Z1S5j2wzHzxj6Fc75XucxlpGF2tGk=;
        b=l2CEJRCZ6Pg0eJ6Xhwa4OxWRT3Za1htZ5lNUyV5V7HTUzDSwR0/FFZDytmHk6qcqlp
         Od69ZQlQ6j0IyujvlyYWnuHLUuO8hVgWUuSlHgH/ZRND+um0G9nxmIwiju/OdD536Cs4
         bu8fyx9akRDbaOhgsOeFGz0MN+AXYKFgY2DWZRQjoC38atyJktzEvTRBhaHjywUmLUHZ
         MlUuF+l2wNh8e4o7f5Fb7flredaTwHFO+I7z9Ra8ZNPpQ+5QVrrdcD5COl30MLAxWRXi
         rL3XW/T3M2vZBA9zVMuySNlFWVvsdF3ECnHvsPLnz+GcfKqLrFy8MfYoj3SYqM8KXUZk
         1ddQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lk1zccxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si6141418vsh.308.2021.06.14.08.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lk1zccxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoul-0003JH-Ch
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFA-0002Tv-Ac
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:16 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEm-0000cD-ED
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:14 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so210765wma.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Si7m8vGilv6/F+Z1S5j2wzHzxj6Fc75XucxlpGF2tGk=;
 b=lk1zccxXTdTpfj55oDNPSwcIubKsjBJyOI13c/Ulr5QBhnls2eH9Fh7iN4J9tIkvWE
 +iaViaF+6EKsbQYKS90CCo7A1pRQhPmeoQ/SsblIVVe1EZC0M6WMZmMcvxVAyc9xQ1Md
 yYkGdKCCVYuMIViN/dQmqE6fsRNPnFtusRCRi+bkUIJJyFwu/7jYDCK9PmtpV8PkvIh9
 sxSSzKpbOeLySB2MkObCwGcdSR5/I8Bn3E40m0Qe+s/mhV+4reN9T/Elj6P7UCEb79XN
 Xkz7mXPEA9RKrX0+VRtkX6UPbIVqQB+LuPgNPswshHD7nJF8qJHCPVU6kxGaKCygT3RD
 QsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Si7m8vGilv6/F+Z1S5j2wzHzxj6Fc75XucxlpGF2tGk=;
 b=pE6tghTP5JvfonnErDQCG6773PeeivjITxwd65D4orYUXFyKjAT6UShJHF+EsxaUny
 yzML/udzWTdpl+y6uKsU+7ISd5ZwfTYwDv0NwbfD7SUcDdxKD5Y1KPIXmJCXCjvbFJvT
 IewKJBWPxffzCtWe+55+xpagK5+SAm0/WFI4onEowaTtDUrxxprEYhzyhisCnbyhUaQa
 0BpQunWLeH8u0bLBu26YbHuxx+8uEKCBglO43UBP9ejPcemKTw5pTLa4LPFHNZtVrTTu
 2jkZpXo9YANTQRQkj1s+che6ENyNoZ9lLgwneC8hVX0eQOgJ0NPP0Q9oHsQzKFl1mcRl
 miVA==
X-Gm-Message-State: AOAM532cZn/t4c+XTPyiwypwphk06IUddzaYyGxZ2eB3GNcbHr9jPvPa
 BJGwE5R2/pPveAWQepKoVMH5lW9YVtS+Yw==
X-Received: by 2002:a1c:1fc8:: with SMTP id f191mr21508081wmf.33.1623683451013; 
 Mon, 14 Jun 2021 08:10:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 50/57] target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
Date: Mon, 14 Jun 2021 16:10:00 +0100
Message-Id: <20210614151007.4545-51-peter.maydell@linaro.org>
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
X-TUID: gMPZYTAHhaoz

Implement the MVE VQDMLSDH and VQRDMLSDH insns, which are
like VQDMLADH and VQRDMLADH except that products are subtracted
rather than added.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 69 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c3cc6a08476..61f8082e0e3 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -217,6 +217,22 @@ DEF_HELPER_FLAGS_4(mve_vqrdmladhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmladhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmladhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d267c8838eb..fa4fb1b2038 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -147,6 +147,11 @@ VQDMLADHX        1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
 VQRDMLADH        1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
 VQRDMLADHX       1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VQDMLSDH         1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
+VQDMLSDHX        1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
+VQRDMLSDH        1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
+VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1310d45f5f5..bd348f034df 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -717,6 +717,36 @@ static int32_t do_vqdmladh_w(int32_t a, int32_t b, int32_t c, int32_t d,
     return r >> 32;
 }
 
+static int8_t do_vqdmlsdh_b(int8_t a, int8_t b, int8_t c, int8_t d,
+                            int round, bool *sat)
+{
+    int64_t r = ((int64_t)a * b - (int64_t)c * d) * 2 + (round << 7);
+    return do_sat_bhw(r, INT16_MIN, INT16_MAX, sat) >> 8;
+}
+
+static int16_t do_vqdmlsdh_h(int16_t a, int16_t b, int16_t c, int16_t d,
+                             int round, bool *sat)
+{
+    int64_t r = ((int64_t)a * b - (int64_t)c * d) * 2 + (round << 15);
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat) >> 16;
+}
+
+static int32_t do_vqdmlsdh_w(int32_t a, int32_t b, int32_t c, int32_t d,
+                             int round, bool *sat)
+{
+    int64_t m1 = (int64_t)a * b;
+    int64_t m2 = (int64_t)c * d;
+    int64_t r;
+    /* The same ordering issue as in do_vqdmladh_w applies here too */
+    if (ssub64_overflow(m1, m2, &r) ||
+        sadd64_overflow(r, (round << 30), &r) ||
+        sadd64_overflow(r, r, &r)) {
+        *sat = true;
+        return r < 0 ? INT32_MAX : INT32_MIN;
+    }
+    return r >> 32;
+}
+
 DO_VQDMLADH_OP(vqdmladhb, 1, int8_t, 0, 0, do_vqdmladh_b)
 DO_VQDMLADH_OP(vqdmladhh, 2, int16_t, 0, 0, do_vqdmladh_h)
 DO_VQDMLADH_OP(vqdmladhw, 4, int32_t, 0, 0, do_vqdmladh_w)
@@ -731,6 +761,20 @@ DO_VQDMLADH_OP(vqrdmladhxb, 1, int8_t, 1, 1, do_vqdmladh_b)
 DO_VQDMLADH_OP(vqrdmladhxh, 2, int16_t, 1, 1, do_vqdmladh_h)
 DO_VQDMLADH_OP(vqrdmladhxw, 4, int32_t, 1, 1, do_vqdmladh_w)
 
+DO_VQDMLADH_OP(vqdmlsdhb, 1, int8_t, 0, 0, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqdmlsdhh, 2, int16_t, 0, 0, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqdmlsdhw, 4, int32_t, 0, 0, do_vqdmlsdh_w)
+DO_VQDMLADH_OP(vqdmlsdhxb, 1, int8_t, 1, 0, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqdmlsdhxh, 2, int16_t, 1, 0, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqdmlsdhxw, 4, int32_t, 1, 0, do_vqdmlsdh_w)
+
+DO_VQDMLADH_OP(vqrdmlsdhb, 1, int8_t, 0, 1, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqrdmlsdhh, 2, int16_t, 0, 1, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqrdmlsdhw, 4, int32_t, 0, 1, do_vqdmlsdh_w)
+DO_VQDMLADH_OP(vqrdmlsdhxb, 1, int8_t, 1, 1, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqrdmlsdhxh, 2, int16_t, 1, 1, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 78fb61e83ca..502ab1f1398 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -414,6 +414,10 @@ DO_2OP(VQDMLADH, vqdmladh)
 DO_2OP(VQDMLADHX, vqdmladhx)
 DO_2OP(VQRDMLADH, vqrdmladh)
 DO_2OP(VQRDMLADHX, vqrdmladhx)
+DO_2OP(VQDMLSDH, vqdmlsdh)
+DO_2OP(VQDMLSDHX, vqdmlsdhx)
+DO_2OP(VQRDMLSDH, vqrdmlsdh)
+DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

