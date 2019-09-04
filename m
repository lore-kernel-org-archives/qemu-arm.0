Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1145463wrp;
        Wed, 4 Sep 2019 13:07:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbmR/zzLOPC9RK62hKpZMGICQq92EWW8NReksTOmJHRglhD+TkZfEa4xEny7Zm5R/qQa6I
X-Received: by 2002:a17:906:7c55:: with SMTP id g21mr4005750ejp.177.1567627654084;
        Wed, 04 Sep 2019 13:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627654; cv=none;
        d=google.com; s=arc-20160816;
        b=JgbenZSxpEaStAzzPUl734piiW+qJusJqVsQzi1ew0Ay0PBAkzp+Xj1iby6VVfv0J0
         SVXjSSPxlqKgx4cdjlAheMikQdIB8x1Po4o6woaRjyc9vszAGH/qwnW5L/cUuTXABjEC
         Ujtx0AdAdzkc6D3tM+92H2HY6ozxS1wDlSE9T2UQO+w1jGBdUqT3/C+RI/INLwKqpqpD
         INiCDvmTRDIDQaCvBios+zb00C8tD+xWe+u+m0ajWv3smUygXxwM6V/VECBvepTkx44K
         g0tLa5MUMTfKU6dympw6/YVQoe+c5kf+LCe8po8eAoFxgQ3CT5+D7UPW4vVWBGTM0bTf
         kHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=bRqYq2TLJ+WIjlJfH/2hIAtxOVh3ChiZfI3nAvVSmQE=;
        b=IT7HJlPbX2n9nwLMLRKREKbYMxzsjMNbhj0edIp/CoiX7tX9Dh3pcJxbb5slvaTpox
         sBvS2IEjHMawTlBz7CNJWxO+A46Kk+BRGk1lCborokeQtOva4UFsycx8YdSJIy1kdLqs
         8JC2gjyRNvUpLefGZgMWwqfxi9I0inOGAcXloondn/cN2mYnweKzjzRM+JTf/kvjhJK3
         NzbHwZw9rKlYyZcPxGQvfNW3LExJlIkNg+TeK5qPtVeFdkqvkuFw8b/Y0AR/NG5yRKUb
         3Xs8rsqe2u583EwC1N0H+7MDEbJENP/IX//i+KkDrepm/qUmGtjAGTrWowwg43v4KW+2
         gh+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iRb1/wXK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si14046488edd.112.2019.09.04.13.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iRb1/wXK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bYy-0001iK-Jr
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0Y-0005DZ-3N
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0V-0002oo-9L
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:57 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0U-0002nm-WD
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:55 -0400
Received: by mail-pf1-x442.google.com with SMTP id d15so4400392pfo.10
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bRqYq2TLJ+WIjlJfH/2hIAtxOVh3ChiZfI3nAvVSmQE=;
 b=iRb1/wXKxZU+WH6cNoOPPE5ajNFKlx1uJ2+hVuPfjqFHjBEk0jz1T+w9rM4cyydPB5
 EgEVrmaGhx078DRYd78x9KDvO53i2785IeiT4DzWbP6t8gekmX2VPMGOY2/uK54d+WDg
 J7fUy/pmqBIlYfcuY3MH1HMHKSXYM9T1oHezV8zmvNZ/DCbBf+2DVe7zUYrjjlaNQuHG
 aooOtLGhp+zPkr4f3LsQVjKO2BOZlZ5K93OWB/seJNuKHBai4eZMTMZjRNIIwpegdwDI
 U/hNvDa+VSo1a2OtZIebBWTAfjZp9sq18l1iXQe03OFMyyjBqIpJFnYDVdPp8yO3nAcX
 jEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bRqYq2TLJ+WIjlJfH/2hIAtxOVh3ChiZfI3nAvVSmQE=;
 b=U/gzMGC5vsmthgdmVKIhj+peqpIvi/3at0miJt7ggfNcxzF18Sd2rjVSzi7p1IzIHv
 fVDDlSk+8NpbG5ZaYNX+hnQUhB5/wiAKF7jtZkiaaE+IhIQ+MUj4Xp79w9bKYUeaRY9T
 enAl/eVaBDLpkEUm/Ozuz+zILT8PuESySVSdeYyGznohBtLuYD5rzv2dEHhUBbDXZJWo
 SoVKS/6QxAgAz7Ea3H9XmVJX8Dv1BQnACW6SQGHme0L8/cTvUnom2JT4vjeUzQ2JVVOv
 g2Sawd6HIaBXBLmhuJgeNZ1KTFeKeyFKoXoUSTD7pFl6PT5Fj8YDcJM+xMAfHDRrYHby
 DiXg==
X-Gm-Message-State: APjAAAWlr/9eWegwqNF6OXv3TY9k+pJ7CiF3Mm7MtBAK6kl97BGQCYQY
 JxUClwXWVQdxQBn0wA46uVAqow==
X-Received: by 2002:a63:1b66:: with SMTP id b38mr36618239pgm.54.1567625513742; 
 Wed, 04 Sep 2019 12:31:53 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:31 -0700
Message-Id: <20190904193059.26202-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v4 41/69] target/arm: Convert SG
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N40yzsvTaErj

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++++++++++++++++++++++++------------------
 target/arm/t32.decode  |  5 ++++-
 2 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 96149eabf4..af7eddca48 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8467,6 +8467,34 @@ static bool trans_SMC(DisasContext *s, arg_SMC *a)
     return true;
 }
 
+static bool trans_SG(DisasContext *s, arg_SG *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+    /*
+     * SG (v8M only)
+     * The bulk of the behaviour for this instruction is implemented
+     * in v7m_handle_execute_nsc(), which deals with the insn when
+     * it is executed by a CPU in non-secure state from memory
+     * which is Secure & NonSecure-Callable.
+     * Here we only need to handle the remaining cases:
+     *  * in NS memory (including the "security extension not
+     *    implemented" case) : NOP
+     *  * in S memory but CPU already secure (clear IT bits)
+     * We know that the attribute for the memory this insn is
+     * in must match the current CPU state, because otherwise
+     * get_phys_addr_pmsav8 would have generated an exception.
+     */
+    if (s->v8m_secure) {
+        /* Like the IT insn, we don't need to generate any code */
+        s->condexec_cond = 0;
+        s->condexec_mask = 0;
+    }
+    return true;
+}
+
 /*
  * Load/store register index
  */
@@ -10553,28 +10581,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
              * - load/store doubleword, load/store exclusive, ldacq/strel,
              *   table branch, TT.
              */
-            if (insn == 0xe97fe97f && arm_dc_feature(s, ARM_FEATURE_M) &&
-                arm_dc_feature(s, ARM_FEATURE_V8)) {
-                /* 0b1110_1001_0111_1111_1110_1001_0111_111
-                 *  - SG (v8M only)
-                 * The bulk of the behaviour for this instruction is implemented
-                 * in v7m_handle_execute_nsc(), which deals with the insn when
-                 * it is executed by a CPU in non-secure state from memory
-                 * which is Secure & NonSecure-Callable.
-                 * Here we only need to handle the remaining cases:
-                 *  * in NS memory (including the "security extension not
-                 *    implemented" case) : NOP
-                 *  * in S memory but CPU already secure (clear IT bits)
-                 * We know that the attribute for the memory this insn is
-                 * in must match the current CPU state, because otherwise
-                 * get_phys_addr_pmsav8 would have generated an exception.
-                 */
-                if (s->v8m_secure) {
-                    /* Like the IT insn, we don't need to generate any code */
-                    s->condexec_cond = 0;
-                    s->condexec_mask = 0;
-                }
-            } else if (insn & 0x01200000) {
+            if (insn & 0x01200000) {
                 /* load/store dual, in decodetree */
                 goto illegal_op;
             } else if ((insn & (1 << 23)) == 0) {
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index d05673ff3e..c956ddb254 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -487,7 +487,10 @@ STRD_ri_t32      1110 1001 .100 .... .... .... ........    @ldstd_ri8 w=0 p=1
 LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
-LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+{
+  SG             1110 1001 0111 1111 1110 1001 01111111
+  LDRD_ri_t32    1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+}
 
 # Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
-- 
2.17.1

