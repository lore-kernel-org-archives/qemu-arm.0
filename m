Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4025316lfm;
        Mon, 24 May 2021 18:20:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoa4PSy8hhypRfy50Va93GXRZRLyWkCaMRxp2z3mNEHWqs0/jKoVtCn80fElfPgV58ZC4t
X-Received: by 2002:ad4:4583:: with SMTP id x3mr33631340qvu.39.1621905640940;
        Mon, 24 May 2021 18:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905640; cv=none;
        d=google.com; s=arc-20160816;
        b=MUeVV4dvyZdMUOFw955Gk4dDka5a4hl2IOMgkwWL3yqhmeQnrIFEA0qDOlGTykW9VK
         CKaKeAXR76MJhj/GgL7CSoPxvlTEGS0kYHky7xTkeO7wHCcFUq+wN/ErqOcUisIxmqsb
         V+bFdpvpxw4a7SOMNR2GnasqeRxdQVS5446zDTsmPi7y/uaPplRjjvl/L2hu8JRCFK2B
         Rm3k20J/jvqKmAwOJ3XZ9XGFNr4pvEHHExYFDIqZMNmX3L8EwYtLMAWmwm9K4xs/98yl
         SWoEhHtMEc9V1u68bOnQ5U1D8U2OkgsECy+mn6DN96hvZqZRYULMkELt2dfrBPeFe1oE
         yPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SWFfFR452q1fUmRFJ3PaFSu6DwY4BPwjHHMIRk/NZbA=;
        b=YKRXwwV3/YCNea8UkYH1+UCm2/Cp2GTvfWml51NLdFMrp4TdMfwhKYErd/Udqehrwa
         cwARc13Hiphg85cQTomnjmQSSAtFTOKYTFHYjpZjrxlICDUUi3jYbHHSi4UgbEmAy0k9
         Xyvd49UweYqJ4XSjPQZr8Y4zm6nVMRzVceClf0IgYktRy3YrhQ0q4sPS5Ri3RqxWQpaW
         ScyKNHQS7wDTqgrM6KVjq6rIHWiMoRgmHDKNgU7Q24tibVCHvAucSEzanayCzFsYCRiE
         jBwajWF8WQqyE+HsGxJtwTfPKMAfMolAggrqXI4qdMAVBnxPF/9h02q+h41DcCotwSsL
         XWiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eoEgxpve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si10781084qkk.229.2021.05.24.18.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eoEgxpve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLkO-0005il-7N
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUo-0001tC-2Q
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUT-0001mq-Bs
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:33 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 cu11-20020a17090afa8bb029015d5d5d2175so12256395pjb.3
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWFfFR452q1fUmRFJ3PaFSu6DwY4BPwjHHMIRk/NZbA=;
 b=eoEgxpve4A8zngVkaQB3BqKjCLq/mqS6llMMuYGnp5guFpLPbERF0f4lODQ5gZxUDO
 yOXSImBamWY36CwkUDixipcX3FwxXR9wiq07Id40SRxv02Ey7NnB4MfoqgJRtaEHMO9u
 hJ5/gq2L0aFxQD2/Hh7q65Mqe3S4HiwFemILsvoxjOXlfOgf1cFhH9qH8PgGT1ap2dQM
 fDNX/df2OHWnaGJibDhjkhiCpLM+hikV8GudqTluRY1V2aGJNGzd0cAakhQ64goEw7pv
 yLnGJhT89VeGrMGKPIA27MoOUEWhYzStQK+5HxNYoqb4mJ4IigdEBsXt18C2EOFSwoqV
 thRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWFfFR452q1fUmRFJ3PaFSu6DwY4BPwjHHMIRk/NZbA=;
 b=BMTGeqoCrFIZwWQmsBSa33EcYthGIJPAXUpwdY4iOLqOzWPJtesdCICP0KhkVcByka
 3OEy7PKMWF9mD27KbaH1y8A1DghlFoT7kfm1N2uo6BpqpEDzhFINfWCld1fcaKhxwaxz
 v/V3SCexCO7L9Zt/4v7Wz6cU0f2cJa+/FxYWS5d8O62CBrsuX/VIjYiwSFarnQafery2
 fKlIIV5C0Morro8C+JauTbDSIsk9U9yGwxo7YNEZ0Wh7A/d8kNV7Z8OWgQ/KbaCB8eXJ
 pMDFw6V1CAMHhx/4GXWz/+I00mj8tAk6KR+JvTYFn+WXzZtEDdmnbL+DYgzV7L5cO3iA
 yHsg==
X-Gm-Message-State: AOAM533oNFBWGgdr9CQ5kGIMiGb11s5aY4W0aBH9FzvYKqKa1yYZoxAl
 xzrIAPMaa5OLwhKhM4CC8kz+BA==
X-Received: by 2002:a17:90b:4d82:: with SMTP id
 oj2mr27258073pjb.61.1621904651960; 
 Mon, 24 May 2021 18:04:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/92] target/arm: Implement SVE2 integer add/subtract long
 with carry
Date: Mon, 24 May 2021 18:02:46 -0700
Message-Id: <20210525010358.152808-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O5SCgRVAS3P5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sel indexing and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    |  3 +++
 target/arm/sve.decode      |  6 ++++++
 target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 229fb396b2..4a62012850 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2416,3 +2416,6 @@ DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_adcl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_adcl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 56b7353bfa..79046d81e3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1247,3 +1247,9 @@ SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
 SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
 UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
 UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
+
+## SVE2 integer add/subtract long with carry
+
+# ADC and SBC decoded via size in helper dispatch.
+ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
+ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5d084a1164..b63d84eef4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1269,6 +1269,40 @@ DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZW_ACC
 
+void HELPER(sve2_adcl_s)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = H4(extract32(desc, SIMD_DATA_SHIFT, 1));
+    uint32_t inv = -extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t *a = va, *n = vn;
+    uint64_t *d = vd, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        uint32_t e1 = a[2 * i + H4(0)];
+        uint32_t e2 = n[2 * i + sel] ^ inv;
+        uint64_t c = extract64(m[i], 32, 1);
+        /* Compute and store the entire 33-bit result at once. */
+        d[i] = c + e1 + e2;
+    }
+}
+
+void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t inv = -(uint64_t)extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint64_t *d = vd, *a = va, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        Int128 e1 = int128_make64(a[i]);
+        Int128 e2 = int128_make64(n[i + sel] ^ inv);
+        Int128 c = int128_make64(m[i + 1] & 1);
+        Int128 r = int128_add(int128_add(e1, e2), c);
+        d[i + 0] = int128_getlo(r);
+        d[i + 1] = int128_gethi(r);
+    }
+}
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c41464ba22..cf4fa50ad2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6371,3 +6371,26 @@ static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_abal(s, a, true, true);
 }
+
+static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2] = {
+        gen_helper_sve2_adcl_s,
+        gen_helper_sve2_adcl_d,
+    };
+    /*
+     * Note that in this case the ESZ field encodes both size and sign.
+     * Split out 'subtract' into bit 1 of the data field for the helper.
+     */
+    return do_sve2_zzzz_ool(s, a, fns[a->esz & 1], (a->esz & 2) | sel);
+}
+
+static bool trans_ADCLB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, false);
+}
+
+static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, true);
+}
-- 
2.25.1

