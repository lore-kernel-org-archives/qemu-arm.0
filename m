Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4555484lft;
        Wed, 6 Jul 2022 02:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWXZ3K7xkqKv5wc8Q3UF7+pQGvEHS8hL1rtZMKhHeWzqWS9ri9kISiAv3r2xg8qg5JNZ72
X-Received: by 2002:a81:c307:0:b0:317:f76a:c49d with SMTP id r7-20020a81c307000000b00317f76ac49dmr45855852ywk.169.1657098315926;
        Wed, 06 Jul 2022 02:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657098315; cv=none;
        d=google.com; s=arc-20160816;
        b=mLGJ2TPzr4ZXCfFreDgRHQNyPfSrVIeAO5tVPeZ/4/JWI1UbzuVLJ/B+3PPq7ZJFal
         hWG/q0DmsG37qPirFEhCthvRmnUtniepwjuBAjMM3RW0yQKtxepIiiZwg99nXhM5c6Xw
         xiCKHcWIlu9getKfhqmzVNSMbxK5GLMhAVoKCe2bwRgA1pxGKr22mzp7ve6QoXWB3SNf
         zI4tW/oN6lhizB0EvnxAuMVVbRV1PQ456hy1LFU5RA88i/w2t4uMXYUqTKWoeVKyid8l
         YWDfnjJRwu9t0GAT9w18T17LVYCHDtpMmJCrUonX2iKV24Azgx0D2WHW05QzHpMd31ft
         +9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
        b=lFDcrXcU2ziC91L/KDgVZzv5apJCFAfM+uS738BTL+i+ANF48xem6Ugi17zyNGFvJD
         PHqqdj79onVH6Nj0CAQ1WVjkZXjekvTNs5mrVofPYdAtor/AiYyvFOFtTS55jKd5TPaa
         fLis2Cy3cyTMACZ1lWtwwgkVw257WEydcLZDYXkAUg7tIR3OyfGCXPNnhLSa6zPp7yTP
         Iijc7GLLMtEJ8e0rTLke8Qrjq5bRQ2KUY9t0MATGozRdounF9Bo8DipjkYbCf4ogKttW
         K7u2+1fofXQVygnFRKfjaZuliqopZyZGb0j8HdFBhFSR5W+GAqsv+v+ez7ErOv8penee
         qmAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sj63h/zR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e83-20020a811e56000000b0031ccac91219si5821050ywe.138.2022.07.06.02.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sj63h/zR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90yB-0001Eu-0t
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LE-00065o-Aw
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LC-0000RF-77
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id j12so6265470plj.8
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=sj63h/zRkWhQLZV9P/R0rqi1ghEtjEY97oRVCuNVCOoUkDgvv6Umtn4sgBwnuniBCV
 +u6unh0OcSM9qLEbGSOm/Df8tB6EM8EI0YkoUKcJmm5sShEVf5/m/pTvITRX4AVTVqzk
 9KntLE76vW2qjze8Z9KOaKBD1eqMc7udqZ50K0SMWZFdQtonZFEvrtFar9ddOibSIuRb
 uSKYrs+8swPcUrwkbItQaBhR9Yj3FelLDyh7RmRlsei4jdnt4idTTLt1zs6DYY9d/anX
 KBoaiBeXy110uTqbcjIlING7IhCb2od+rPM4qC+lTMhCazyN+/GXgr0haEW8ANzMn0/m
 TewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=3IXnO5gYiL/10gH56uCVU2n9MiKhvg1V1zgbCcBxnjL+gclRr5TiANcmeolLu6rvxk
 LzF/qHJUAk42ZmuJmd7E+I6P+kp7BpOT+2/pdIBxttnTed+VyU+XjK8SN40yxpt+v1Uq
 8fqoVswcwtdnVYYdFQ7V8+Xu1oMf1zkVvQwRXJCCmnR/Q7fwi+4pmzLHtL0RsHVfQPZM
 30EXSlAuKF9gLQeDIR+jwJRp04ZQ65/lv7y3e9S4VwN+vW/IbXmboJ/hn2wpyk08tH5G
 OIboJbygeipY7u29Qk54Oj8jAhLdmElezYFUg3yTioqUOPRfpFwTJqC1eIx0udmEhqoL
 lAyA==
X-Gm-Message-State: AJIora/Vhb+ggwBLa9oQFO6iXWFdJRwTVb8dS0d9Mjxb4HMg/ipCGxhf
 m6dw6By1R5VtSfuuV4ssbxbT5Q==
X-Received: by 2002:a17:90b:390d:b0:1ed:3058:45e5 with SMTP id
 ob13-20020a17090b390d00b001ed305845e5mr46625701pjb.141.1657095896980; 
 Wed, 06 Jul 2022 01:24:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 16/45] target/arm: Handle SME in sve_access_check
Date: Wed,  6 Jul 2022 13:53:42 +0530
Message-Id: <20220706082411.1664825-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pJ2pndYuud4P

The pseudocode for CheckSVEEnabled gains a check for Streaming
SVE mode, and for SME present but SVE absent.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b16d81bf19..b7b64f7358 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1183,21 +1183,31 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
-/* Check that SVE access is enabled.  If it is, return true.
+/*
+ * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
+ * This function corresponds to CheckSVEEnabled().
  */
 bool sve_access_check(DisasContext *s)
 {
-    if (s->sve_excp_el) {
-        assert(!s->sve_access_checked);
-        s->sve_access_checked = true;
-
+    if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
+        assert(dc_isar_feature(aa64_sme, s));
+        if (!sme_sm_enabled_check(s)) {
+            goto fail_exit;
+        }
+    } else if (s->sve_excp_el) {
         gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
-        return false;
+        goto fail_exit;
     }
     s->sve_access_checked = true;
     return fp_access_check(s);
+
+ fail_exit:
+    /* Assert that we only raise one exception per instruction. */
+    assert(!s->sve_access_checked);
+    s->sve_access_checked = true;
+    return false;
 }
 
 /*
-- 
2.34.1

