Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp812523ejb;
        Thu, 25 May 2023 17:25:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ir+GTXBFOCAQr5MbswohRbwJpqxGWResiLLPBMHLUlGBSbt27naxKNBiSYDz+e2bmxJUD
X-Received: by 2002:a05:620a:454a:b0:75b:23a0:d9f1 with SMTP id u10-20020a05620a454a00b0075b23a0d9f1mr576356qkp.71.1685060700418;
        Thu, 25 May 2023 17:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060700; cv=none;
        d=google.com; s=arc-20160816;
        b=SSYyYY/K7PB8HkK2WXgTkyczsOowkmAOllskrW1X86iykswdX40SXuWua5jJhL3yMI
         qUlOh8EGT4FeBe/phjdsuqTO3iJQwcsLICCCNiLAeyxF94HMv0c1/UfpCL3c2c1SOh/U
         +Xqgb9USXNpk9H3/6DDe0EUQD+aSzWN7HmiPH4mVIEmgUORB/KvGcrEmc/z4RGI7Bjuu
         Ne+4HCB/4vk7Nq25Xlb3RKxUXTnJYo3JoX864T+TEQZnaQKPoGabAK0tapN2HRYChw7+
         XoiUijkWoGwVC883bhk6NsHyf/q9BXSxipPR2oDUk2jj3u2Bt4w7vUhncRc+NMCFYobq
         8nlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MUe+ePpAXqeWQugAYIOwy5+kFWDdU+DeS/QoHodF2ms=;
        b=dj0Szgw9rxXtkLOdRP9SRlkZsFYUUlmtv4H39LaYCvfU1KigRg8L2237jUMyCga/Jf
         NIP0Tk4ZX8aJVagGC7vRAfON2dijDNglhVf7ujTvFYWDrzp2IjhekdYIahNz/829ZQHX
         i5lBYNuujwe9WmACPQttfEYc7/fl6Vm1vcsvaFVuivtXBRMFVMzczSzxkEluZOKVfy3a
         +fkpaqs8zMcUpQlauXF+dMxZGVyp/pkyha2nD1BoXv/jD00fOlGrlfif0k/cIjFU3yPj
         u/NNK+ZoD1LR99DVub1RMF2HFdv3hC+geixLdq8fpom/FcGFqAvc47F7ac8KCu4/m4EF
         463A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPJL4LXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r29-20020a05620a03dd00b0074ecd00821csi976587qkm.522.2023.05.25.17.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 17:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPJL4LXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2LFU-0002hW-Ke; Thu, 25 May 2023 20:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFS-0002gg-S1
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:24:02 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFD-0002Bt-HS
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:24:02 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64d2a87b9daso277900b3a.0
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 17:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685060626; x=1687652626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUe+ePpAXqeWQugAYIOwy5+kFWDdU+DeS/QoHodF2ms=;
 b=YPJL4LXaItaCdTT1Wk+w9SzMZexjbtJkqDF4P0Z5sLF/at1inAQAR+nvaNhcK9++tn
 99n+8/a3lnGnrVmLBzAmxqZrrFmBW1T01xVJahK4Tc3U1knQ/dR98C9c6Zv3u+bNvD5w
 +MJF0eY1NwTv7PhUb761HObbb7RFYL/KRYE+XFvodJiBe793XinAMVG4rDKvRHR3wdJL
 bPk1WEaBrWjXkrBSOPcVUb1aNiTPZAW0KhN+7nLj0B+CrRiuWNOo5YB+XtGOYvPWNIzf
 CETl9Ex+I3NNlR5bKflG1kBaF4TNyG5wYFTKb4hPqaSFM3Auj/H4zk5DalazNMuxnaS2
 v2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060626; x=1687652626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUe+ePpAXqeWQugAYIOwy5+kFWDdU+DeS/QoHodF2ms=;
 b=GtvF5I5CZWwffPHyRk/5q2K0IPDyZPv3f5NbkM/zRXZNNq+6ax3da7OfVHAw4UKR7Z
 68RP1pMW7MZXh+1P6+v0TMXfwaS2HCpas8xKf13u3NB4MZVCF62q9AS3q5G55DALwj3D
 bzigmDTQNIxzjuvX4lvJz/Qjfp7vYmEfFqqW2A+mUv1Bs315h5qPcZlKmzDm97Ar9wLe
 JlQT9toWf1lZXJo79YVUvuZeI1ExQyMQOt0wfb1hO3htVT0gG4gQQQyAFWi4MS0Zj6qu
 eM4qICmvmqrQLfXBjTDqxkDktDJLPxwCY/CYgXShyN+zOtamU+rPq7TMdkrZhOMVKseB
 Zf+w==
X-Gm-Message-State: AC+VfDyMGXaL4GnBDfSOBJvP7xBqP/F5ZMpvddGD4o1cIi+v6iHqeHJB
 YUMYVqc8ZXgIOYj37mNWZyT3mw==
X-Received: by 2002:a05:6a20:258b:b0:105:5800:c51b with SMTP id
 k11-20020a056a20258b00b001055800c51bmr25388429pzd.30.1685060626284; 
 Thu, 25 May 2023 17:23:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:23:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 13/16] accel/tcg: Extract store_atom_insert_al16 to host
 header
Date: Thu, 25 May 2023 17:23:31 -0700
Message-Id: <20230526002334.1760495-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dTgrA9pZ/OMI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/store-insert-al16.h | 50 +++++++++++++++++++
 accel/tcg/ldst_atomicity.c.inc                | 40 +--------------
 2 files changed, 51 insertions(+), 39 deletions(-)
 create mode 100644 host/include/generic/host/store-insert-al16.h

diff --git a/host/include/generic/host/store-insert-al16.h b/host/include/generic/host/store-insert-al16.h
new file mode 100644
index 0000000000..4a1662183d
--- /dev/null
+++ b/host/include/generic/host/store-insert-al16.h
@@ -0,0 +1,50 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Atomic store insert into 128-bit, generic version.
+ *
+ * Copyright (C) 2023 Linaro, Ltd.
+ */
+
+#ifndef HOST_STORE_INSERT_AL16_H
+#define HOST_STORE_INSERT_AL16_H
+
+/**
+ * store_atom_insert_al16:
+ * @p: host address
+ * @val: shifted value to store
+ * @msk: mask for value to store
+ *
+ * Atomically store @val to @p masked by @msk.
+ */
+static inline void ATTRIBUTE_ATOMIC128_OPT
+store_atom_insert_al16(Int128 *ps, Int128 val, Int128 msk)
+{
+#if defined(CONFIG_ATOMIC128)
+    __uint128_t *pu;
+    Int128Alias old, new;
+
+    /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
+    pu = __builtin_assume_aligned(ps, 16);
+    old.u = *pu;
+    msk = int128_not(msk);
+    do {
+        new.s = int128_and(old.s, msk);
+        new.s = int128_or(new.s, val);
+    } while (!__atomic_compare_exchange_n(pu, &old.u, new.u, true,
+                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
+#else
+    Int128 old, new, cmp;
+
+    ps = __builtin_assume_aligned(ps, 16);
+    old = *ps;
+    msk = int128_not(msk);
+    do {
+        cmp = old;
+        new = int128_and(old, msk);
+        new = int128_or(new, val);
+        old = atomic16_cmpxchg(ps, cmp, new);
+    } while (int128_ne(cmp, old));
+#endif
+}
+
+#endif /* HOST_STORE_INSERT_AL16_H */
diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 39ad89800d..6844f85d58 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -10,6 +10,7 @@
  */
 
 #include "host/load-extract-al16-al8.h"
+#include "host/store-insert-al16.h"
 
 #ifdef CONFIG_ATOMIC64
 # define HAVE_al8          true
@@ -681,45 +682,6 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
                                           __ATOMIC_RELAXED, __ATOMIC_RELAXED));
 }
 
-/**
- * store_atom_insert_al16:
- * @p: host address
- * @val: shifted value to store
- * @msk: mask for value to store
- *
- * Atomically store @val to @p masked by @msk.
- */
-static void ATTRIBUTE_ATOMIC128_OPT
-store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
-{
-#if defined(CONFIG_ATOMIC128)
-    __uint128_t *pu, old, new;
-
-    /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
-    pu = __builtin_assume_aligned(ps, 16);
-    old = *pu;
-    do {
-        new = (old & ~msk.u) | val.u;
-    } while (!__atomic_compare_exchange_n(pu, &old, new, true,
-                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
-#elif defined(CONFIG_CMPXCHG128)
-    __uint128_t *pu, old, new;
-
-    /*
-     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
-     * defer to libatomic, so we must use __sync_*_compare_and_swap_16
-     * and accept the sequential consistency that comes with it.
-     */
-    pu = __builtin_assume_aligned(ps, 16);
-    do {
-        old = *pu;
-        new = (old & ~msk.u) | val.u;
-    } while (!__sync_bool_compare_and_swap_16(pu, old, new));
-#else
-    qemu_build_not_reached();
-#endif
-}
-
 /**
  * store_bytes_leN:
  * @pv: host address
-- 
2.34.1

