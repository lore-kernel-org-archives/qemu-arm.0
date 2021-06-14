Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2072481lff;
        Mon, 14 Jun 2021 08:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa6LoTfK5S6N6czbd/Es7G+lkxYk1x3K30YGoMxsFpZaleH/HCyHhneahBfYFx0Ahk660+
X-Received: by 2002:ab0:42f:: with SMTP id 44mr12868819uav.29.1623684444211;
        Mon, 14 Jun 2021 08:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684444; cv=none;
        d=google.com; s=arc-20160816;
        b=jCQiGu/2UCBTknqtQpd+hHJqju+19r4GJQnizLv4sXHhwmyEKDAgxczImVt6AlLocR
         8N+Iv0cURWAaTveh+Cp11ZBN3U9AutH8pHDF0Xt3XM6F/i3QVEnHw2H9Q4KmLMHOLx1w
         54wJWReoVFQBujzdopXRyOgX9dNfBJi3PxFkPsTwzdyvLk7RYvDuRtyMw2+j29Q6Zwln
         Nds22I2Gi1YDjELEyfyy+53qfvfXg2HplvcoPJz04ev9zUm84OQyfTu7Q3RmgpYbbtt1
         A1tbpR5a0Q4B1ZgK2hSKuPqJft5mfELIOnKuqNa3UaJDY9T/6afJuUyTnoUZZzIwLcF6
         cq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4YWvzbcoWa4j3/sIAhGsy9QmsBrpnIE43G38xUeYuVU=;
        b=iskuQo2YAUo7WMhKzk+9FvJQnc5adXGHWswBte7FpkHHkvGz9YGbORXet5s5MQbTOc
         c1kVD5T/tdnoUN9E1kXmvbNMTSz4FtQttu/fJqGw4d5vvwkUq7qCxdb9oCgMhXr+bwiY
         TFMxvKCphx0Uj2iTr8U+eFYnSI5s5c+YOqHjwCw/6Sd2PTrhKFbvhYT56FqhBDM9XniF
         UCR6d9msfY+qG2oD2TgmWi2OsiTm7YkFmGx8TZKMkydBm0rWLWz2pUrcNSREy02CuqRI
         nSOwBXf6qhPUifQJi30t5mRacqNY9Q6ch5pIvLiCNa0KFlqmLC6FZNa1Uuuu2BE16eWf
         XBXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MvYtCDnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si6228963vsl.403.2021.06.14.08.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MvYtCDnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoUl-0004a5-EP
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEa-00016p-NP
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEO-0000KL-SC
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y7so14929476wrh.7
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YWvzbcoWa4j3/sIAhGsy9QmsBrpnIE43G38xUeYuVU=;
 b=MvYtCDnYSNwdItF0Vgzgfa8ihUocsE8zRjl85x4NMTnNmyQpdV6goYNoX68KXhc4rS
 vDyfpriePmFJM0nvv6xkxe6j2b3zvLyyH/S9OXDEsmQ5s7ILq1Q1qbAwZTlmltsgFRG9
 9lE/zLa+u0pXtDmgApSjqGHErovrPNUQZ/pIMacyBw1FgwR6WScHSkl4oN1UCuAoNlxD
 KaV74vvcnwxb4oOpolL1k5eKOAge6QMuYq+Mu3aH+EBKTsxMHQ4mg0bqt65cIMs0O2Mx
 bIomnzw/yWayQmEIc0tvEmPl5q9q65a7sibjeLOgYWT4J9JhIM1BvXpaGP7nm8kezqGS
 xdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YWvzbcoWa4j3/sIAhGsy9QmsBrpnIE43G38xUeYuVU=;
 b=tEXGSu4YesNHQAJdZ50YPjBJ8ePbIZzIURwlOgHe0THlFIKXWUftmmpwggGtoiNj5Q
 fZDJctEqqHbaNx86cqIjd/jeB0GeNkwxZvjgUvyP52+OopaUug07RVaEfklJXLUDFTNs
 UrIE/EBoBFrvZ40+9zY9n+Im8yXdNSr4fZtjzKyOhFDJhShVxImYFBIe4x83gZX1CtFN
 Bwft7AVPHkpqFg26qP9/b8K/xzYGjAvA8a4HBPnvQl2oZEkDggLbAMMAfKISSLj/NtId
 anYguExfBTiV9s5hXUN9kDjJ4BETEhn2GRVBnaENwmjfD1pRweWV0I9saINnxzYTx/OW
 dF8g==
X-Gm-Message-State: AOAM533DRfOn5VsTRNVEosxSCIx9vUzg/skG8S+TTlMcj7xv8Q6HVV/N
 kP2LJY1bT36olzzi2u1YeJD29AOlYIKQMg==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr4333712wrh.236.1623683426729; 
 Mon, 14 Jun 2021 08:10:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/57] target/arm: Implement MVE VABS
Date: Mon, 14 Jun 2021 16:09:29 +0100
Message-Id: <20210614151007.4545-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: DHqFrY3FWUX1

Implement the MVE VABS functions (both integer and floating point).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 13 +++++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f1dc52f7a50..76508d5dd71 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -49,3 +49,9 @@ DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
 DEF_HELPER_FLAGS_3(mve_vmvn, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vabsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ff8afb682fb..66963dc1847 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -77,3 +77,6 @@ VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
 VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
 
 VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
+
+VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
+VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 564f86fc65f..5f36f32a231 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 static uint16_t mve_element_mask(CPUARMState *env)
 {
@@ -296,3 +297,15 @@ DO_1OP(vrev64w, 8, uint64_t, wswap64)
 #define DO_NOT(N) (~(N))
 
 DO_1OP(vmvn, 8, uint64_t, DO_NOT)
+
+#define DO_ABS(N) ((N) < 0 ? -(N) : (N))
+#define DO_FABSH(N)  ((N) & dup_const(MO_16, 0x7fff))
+#define DO_FABSS(N)  ((N) & dup_const(MO_32, 0x7fffffff))
+
+DO_1OP(vabsb, 1, int8_t, DO_ABS)
+DO_1OP(vabsh, 2, int16_t, DO_ABS)
+DO_1OP(vabsw, 4, int32_t, DO_ABS)
+
+/* We can do these 64 bits at a time */
+DO_1OP(vfabsh, 8, uint64_t, DO_FABSH)
+DO_1OP(vfabss, 8, uint64_t, DO_FABSS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bd908abcff7..90996813a85 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -199,6 +199,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+DO_1OP(VABS, vabs)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -237,3 +238,17 @@ static bool trans_VMVN(DisasContext *s, arg_1op *a)
 {
     return do_1op(s, a, gen_helper_mve_vmvn);
 }
+
+static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vfabsh,
+        gen_helper_mve_vfabss,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1

