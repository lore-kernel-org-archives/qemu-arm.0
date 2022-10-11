Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2889216ocg;
        Mon, 10 Oct 2022 20:35:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kKA1QV0wG0ktgOJSxQeWaSxVKVBF+uS2yubyf23SIZIUUJkNFk3lfPvRTdB70tMBkPSiG
X-Received: by 2002:a05:6214:27e6:b0:4b4:456b:13c6 with SMTP id jt6-20020a05621427e600b004b4456b13c6mr1585283qvb.108.1665459341133;
        Mon, 10 Oct 2022 20:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459341; cv=none;
        d=google.com; s=arc-20160816;
        b=yDUMapEX57tm7DTAvkF0CZmusiN2ed0ZMK+OStE/LcxUzb/bZdjWDXXkkX3Q4aqfVg
         RG5iT8Vv1JyqZm886zsv/ykecid567yAoYORSMymz9+m51s/0B9t04QG+JUABRgQA2hj
         Fqn0dJukLbmgrE3fCGZ6lzD23bS9GIYv2gcVvC/pBW7JlLj3Y4v2mWdl/HH6TjVIvA9a
         sqoyU/rO5QF/hkZS4NmQuZwhhXPFnWfX14NXpJUPDYZ6FRd8FAcveR0iEhyDbnmUtGcF
         Tfyi5Fci/u4Hlk1M+jHdogaQiJjKDCmSxFvcEYV9NpmMcSxMNBJXdJeQBW4kLgrUd+oN
         wsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IwIpTgEdJC+Uxc/pi8uZBNwBm2FWqdghmj+rTinUKMk=;
        b=OhjcLThxBJEeonhrnHRCPMu9qMs8Dmy3MgPc5fET/ofWD60u/ZQHODptuGw1DKuukI
         tXnAE8Dy0eNQUvAOM0vO8wLOZS4dSbuh+9A72aK7EWAfWKHwXKTZFXngOhYKxweyZLPX
         cpfZe1SdswR3MudC2f8t2myHvikiegd/pLsfCU6D0Dx6OHhcBfrkmFJohLfEEPP34/0H
         xrbpkcFbuB13KB6kcssvpOirIrfNBX08vOCfxUVSzuEJABSrv4WtP4MHGZ7xFMlFKIIR
         dP9raOLtGrylp9BPtkGWustV6Twi4Taqfv0KnNyMBMaCo2Bq6XTd3zjrdlBMaItkXIsy
         kBqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ufn3j/f1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05620a0f0300b006e30e9cdae7si7065307qkl.28.2022.10.10.20.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ufn3j/f1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi63Q-0002OU-NC
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o1-0002Z6-Ta
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o0-0002zo-2G
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:45 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so14725216pjs.4
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwIpTgEdJC+Uxc/pi8uZBNwBm2FWqdghmj+rTinUKMk=;
 b=Ufn3j/f14om1Tnf6mfy9yUPRVnn8vjia70YuhYrQiE4CkDYyhZoadYOe9XkDbm+u5F
 I6VhbZZrKod+zd0ecfHGkA8O3hKYumuxdQJKqgMrgs5u6CPQBJyn5VIjuppm7gBpTxER
 YtFh3Zc04Bkz5EGgVIAlOMQnzU4ef4/JD7aoo7RFGAKLZ2DWXv+Jz1jeQAJJizYdAhqb
 UuFwP8yugYofzoHDRXaDqvzgwgFphA6mjA6HQrB0l/QLItUXTuMJEBdqmWdKjtgGxE3F
 CG5ysHRUi+VgA3m2qAA3JW85/NZKRx9nOFgru50qN255Atvj9X//Uq3P6upaJ5PqAgNx
 nwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IwIpTgEdJC+Uxc/pi8uZBNwBm2FWqdghmj+rTinUKMk=;
 b=4TY+yYhsXb12SGbn7/vEKEU6nQN2fuYvqIDvxAZz1t9IXBNmKX4yGa+2HIP6wa6hSx
 NmLtFdG9pFzO0udQtx09/jgjA5IQ73BPEPNDiml5havcGxfUNafbpaInOrOcozi8iDht
 Xs2eZ7+etXMFt31b3kjuivC1wbKMZj37wezA8AJGpunZVniSPN7/1t5rEbnWpHZhec7F
 va01CLaxA5gKL9HwELxEWiisu4fMHvIyzgZq8oOjrSVqMiEx+daznCdzCcuC5fpvNsQC
 aKjc2p4gN95I0Wcgauu6ozyNzBrtZzBo+FEvqO4Ht3TG52B2hXQcjZazrhp6REb2Ef3d
 bxXw==
X-Gm-Message-State: ACrzQf37NsWmE7VvhXiNpPPmR0xtUISpb1fOvpZ2RXFNbLXcZoyVAMkT
 wddREEnpXZNACzWv0XZ+Wbzvzw==
X-Received: by 2002:a17:902:f541:b0:181:83e4:4910 with SMTP id
 h1-20020a170902f54100b0018183e44910mr12923949plf.109.1665458383259; 
 Mon, 10 Oct 2022 20:19:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 16/24] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Mon, 10 Oct 2022 20:19:03 -0700
Message-Id: <20221011031911.2408754-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u0+JPEZKZfXw

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b2bfcfde9a..d54e6ca938 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -320,18 +320,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     uint32_t data;
 
-    if (!S1_ptw_translate(env, ptw, addr, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
     if (likely(ptw->out_host)) {
         /* Page tables are in RAM, and we have the host address. */
         if (ptw->out_be) {
@@ -359,18 +353,12 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     uint64_t data;
 
-    if (!S1_ptw_translate(env, ptw, addr, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
     if (likely(ptw->out_host)) {
         /* Page tables are in RAM, and we have the host address. */
         if (ptw->out_be) {
@@ -527,7 +515,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, ptw, table, fi);
+    if (!S1_ptw_translate(env, ptw, table, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, ptw, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -565,7 +556,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, ptw, table, fi);
+        if (!S1_ptw_translate(env, ptw, table, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -650,7 +644,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, ptw, table, fi);
+    if (!S1_ptw_translate(env, ptw, table, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, ptw, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -703,7 +700,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, ptw, table, fi);
+        if (!S1_ptw_translate(env, ptw, table, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1286,7 +1286,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             ptw->in_ptw_idx &= ~1;
             ptw->in_secure = false;
         }
-        descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
+        if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1

