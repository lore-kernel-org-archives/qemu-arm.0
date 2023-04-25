Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3718074ejm;
        Tue, 25 Apr 2023 12:36:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOo+IV4pmZYRVqUmy08xZOdLRpd4svzTjOKGyH8m1CIhVaw3kbav/gSYH2mqThzSuHMl6y
X-Received: by 2002:a05:6214:c61:b0:5f1:6c0a:1df6 with SMTP id t1-20020a0562140c6100b005f16c0a1df6mr27183860qvj.37.1682451418002;
        Tue, 25 Apr 2023 12:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451417; cv=none;
        d=google.com; s=arc-20160816;
        b=KxAuvmeuezVY//IdbY5K2OnSmkxyXrjfmq2rhaMeTeJxD96nscRQrvgjtk5f4Y4VTF
         3gf2OvN5OFHbbuyYgwKpU7lYAKwo0se1LRgw03bdbxQowb3TF3A/dO3KgbF/ReT802tj
         Ij6xOC9TM26VaBS1L2zvP1WS9SUo2MH/iJJs+JBEtwxY0qmABiKGPZ9BCJ8su1Ybgms3
         GT5ZYhMw5sP2nx+UbyTunfIWYooY/j4xsNqBDKQ8JJV27TH4utrFe7oLFPGqSTLRqFWs
         rqAt4vgGroTP8bJTEDw0JGol2vMoRaEVuTShPtbjg3c5S+EJrpKvToS4F1OUvne5Y2lZ
         M9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i9vVtuysfBMlh/Al6RBdJn0LgfXo4dvluqytL552K7Y=;
        b=wXq7vmNtK+cRkYmavUYd0Lhugy6StmY2yGchOqp2CM9TTA7AM3bojtWok1/I/oTacd
         vwd539VNHbbYv67z6oEey0WwRxm+BaAD8hy1lctZ+GuAvtvZPpxaS6xf372yyKsdTx8V
         gQpKkYj+ze3npR04Fz9J17/2/khIDD+bZv1C3004lnHExMIj0YtF6JrMOO2vSpKI2+6j
         DJ2yINMMavndrsxcL8sJE6wlMAyT3LuLKF0l1zajKbQh0z5fj2zJ3Pt0hwtq7ehXRZfX
         G08oHCgIEBhZkiWzpjn8jTJOwKa7bKZvnYGBOsk5dLtciDPe5/fwcvrCgL/zntNA2YTW
         LddQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PCi/E1kZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ad45b89000000b0056ebfdbf220si9052238qvp.184.2023.04.25.12.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PCi/E1kZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOQd-0003Ta-Fw; Tue, 25 Apr 2023 15:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQc-0003SY-0r
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:18 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQM-0004gn-9n
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:17 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8aea2a654so60425731fa.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451240; x=1685043240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9vVtuysfBMlh/Al6RBdJn0LgfXo4dvluqytL552K7Y=;
 b=PCi/E1kZuNO3EyT8b7f1NyxkbDbJFkR+o7G4elBMfWhEkoUsIdpCqxE8ojpbPG4MP2
 hMlGYKkrtHEDRE+EQSSTNV23/NGMW9y7nizrsclrrrlY/PHegtGEojV/vIS/gMHJvspo
 x+bb2e4IWxF9pa+7d4P5LJRr3hhjvVXmHmqrPs+CGkwB5gpAo83vtbPnbJ8JpeRhCs/u
 kevUlkmKLRXVPrtXzScaAyF8DZVK/4uMlp624vJLxvCbptxUpsN5by47efV4JOy6mrnv
 hOJJ2mvIJzTE1KCt1BR6mg2vZk9U+neSITG/iKbawxjPma8N87QGD1T6UIzk7Xxiyy44
 7/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451240; x=1685043240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9vVtuysfBMlh/Al6RBdJn0LgfXo4dvluqytL552K7Y=;
 b=gkl+fuToBatwNrD5aOSUWLCY5pnzcWGDHx0geIzb6yCVvM/bhWNZ4aRRlIzMAwsKPN
 2FS/wKor/mlenpqY/h+OcPRGN6DbI5V2YydgQmQeSsHV9BV6yDZC7cT6VvHPTuxraZe3
 Q35/EG6sN+vCDxjeBwSRlsvR/EsWqZvpeqUl2x5vkwquL3N56mq5I1Su8a5+oBOVLoTy
 sLI7yWYqSq0/OKTbckqUiS5evDxKgGNdqz8vdoy80YLoHDdF1qwwVSqm8L6mpCa23IRh
 ImD1S/Lo+aKtItoPaEX3mQjklCFPARDl0box6ikH3eAVl8u8PTzYOdlHiu/NMLnuTHJW
 enjQ==
X-Gm-Message-State: AAQBX9fjp3pAPCGCWSAO/XAJjYwNK5PjT5OaBMUSi+Gk+7hYpjb/ZX5R
 hUhGKIYz422rCYcPsfnxLaabbQ==
X-Received: by 2002:a2e:8046:0:b0:2a9:f59a:a2ae with SMTP id
 p6-20020a2e8046000000b002a9f59aa2aemr3832658ljg.18.1682451240718; 
 Tue, 25 Apr 2023 12:34:00 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 16/57] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
Date: Tue, 25 Apr 2023 20:31:05 +0100
Message-Id: <20230425193146.2106111-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: sXAkM+kAk+TS

We have code in atomic128.h noting that through GCC 8, there
was no support for atomic operations on __uint128.  This has
been fixed in GCC 10.  But we can still improve over any
basic compare-and-swap loop using the ldxp/stxp instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 60 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 874fde6937..cf4a0e4a6e 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -247,7 +247,22 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
      * In system mode all guest pages are writable, and for user-only
      * we have just checked writability.  Try cmpxchg.
      */
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h;
+        uint32_t fail;
+
+        /* The load must be paired with the store to guarantee not tearing. */
+        asm("0: ldxp %0, %1, %3\n\t"
+            "stxp %w2, %0, %1, %3\n\t"
+            "cbnz %w2, 0b"
+            : "=&r"(l), "=&r"(h), "=&r"(fail) : "Q"(*p));
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        return int128_make128(l, h);
+    }
+#elif defined(CONFIG_CMPXCHG128)
     /* Swap 0 with 0, with the side-effect of returning the old value. */
     {
         Int128Alias r;
@@ -743,7 +758,22 @@ store_atomic16(void *pv, Int128Alias val)
         return;
     }
 #endif
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h, t;
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        l = int128_getlo(val.s);
+        h = int128_gethi(val.s);
+
+        asm("0: ldxp %0, xzr, %1\n\t"
+            "stxp %w0, %2, %3, %1\n\t"
+            "cbnz %w0, 0b"
+            : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        return;
+    }
+#elif defined(CONFIG_CMPXCHG128)
     {
         __uint128_t *pu = __builtin_assume_aligned(pv, 16);
         __uint128_t o;
@@ -841,7 +871,31 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
 static void ATTRIBUTE_ATOMIC128_OPT
 store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
-#if defined(CONFIG_ATOMIC128)
+#if defined(__aarch64__)
+    /*
+     * GCC only implements __sync* primitives for int128 on aarch64.
+     * We can do better without the barriers, and integrating the
+     * arithmetic into the load-exclusive/store-conditional pair.
+     */
+    uint64_t tl, th, vl, vh, ml, mh;
+    uint32_t fail;
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    vl = int128_getlo(val.s);
+    vh = int128_gethi(val.s);
+    ml = int128_getlo(msk.s);
+    mh = int128_gethi(msk.s);
+
+    asm("0: ldxp %[l], %[h], %[mem]\n\t"
+        "bic %[l], %[l], %[ml]\n\t"
+        "bic %[h], %[h], %[mh]\n\t"
+        "orr %[l], %[l], %[vl]\n\t"
+        "orr %[h], %[h], %[vh]\n\t"
+        "stxp %w[f], %[l], %[h], %[mem]\n\t"
+        "cbnz %w[f], 0b\n"
+        : [mem] "+Q"(*ps), [f] "=&r"(fail), [l] "=&r"(tl), [h] "=&r"(th)
+        : [vl] "r"(vl), [vh] "r"(vh), [ml] "r"(ml), [mh] "r"(mh));
+#elif defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
 
     /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
-- 
2.34.1

