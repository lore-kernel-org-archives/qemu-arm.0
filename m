Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2197679lfm;
        Thu, 30 Apr 2020 11:14:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypKU3NN9UAPOtZXVMS72NpB9nNyOKeZyHauartxuPDEMNHXGSB0K5+oaI6Fy2Jrv5K4rgaSW
X-Received: by 2002:ac8:5048:: with SMTP id h8mr5124094qtm.189.1588270491454;
        Thu, 30 Apr 2020 11:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588270491; cv=none;
        d=google.com; s=arc-20160816;
        b=H9Pk/gk9ZIw/tLijbxKGrifDN7kYY3V4SCR8q5BWH6hdzwAUNuQwjTbzYqmIkDl7Bl
         OzcsBss4QdDNdGfUzY3xP/sudEcYf8UCLdOJhJ9Wb+uws+ElLjD372RXewVa0or+nXvr
         UkNXmi4W/gbaugWyrRLdeqX8ZVuQwi0tblLdgtGvkZSSodjud6ltFbK57ihIc5wLFWjW
         0aCH16N11v3yK8qML9ZAbe3qY586FKaHHM6gX8jRoHDnac+biYpaDopKc06qRk/bWCzw
         6pn/K7u2spcWKaZcUUaAtgBCTv/mZ+Yyw8dyIvYt+I1Cvqk8lr9JBn8UXfUkngFTyxCo
         DIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XnXDSVyzZWZjdX4ANWhTglZeil8eXcC0WohiZGPb7HI=;
        b=BLsmmtspJDYHtSrb5SOSR2KUrJPVo0o5/fk8itrXtFCg9EY3eJ9ImADGM0mlze3YDS
         598nFi0+esB6DP/ECrIvJNK2zabP8B2tOcceaR37+OSsEkUeBPmoMOt/FZFbq+edwMxF
         3bQndV5QA/xg9dnJFTtDGltRAp824IhRykLyNf2siYSOtK09sVBAXysQeLZwU29q94jI
         ipuehM+zTvCWU31Q7j1ontn5zFI4EZqU2EkSO3bCbMq35DlSVjx2HOz6ISiDzOZ0ZbhQ
         pGiVGgC7ZmEDbpZlybGIt4xXbl5KOBSNTOvpAU1WupXSCRSawWz/ilCY403ApcTQfF5I
         Jh1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ul7PTTVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 90si257726qtg.172.2020.04.30.11.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ul7PTTVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDhy-0007MO-Pl
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDe4-0001VY-NQ
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdc-0000mi-Bg
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:48 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdb-0000eQ-L8
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:19 -0400
Received: by mail-wm1-x344.google.com with SMTP id x25so2982910wmc.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnXDSVyzZWZjdX4ANWhTglZeil8eXcC0WohiZGPb7HI=;
 b=ul7PTTVKdJRlwfCnzQJ/lmbwfvvxYv3rrV/TXzbAoU187elCk50ci5g11G9TbdC/uB
 rJMSK4CfqzvtXWUQB0hrCEgh6AKg0pPwDpLy6SgTQwQQ94KOjS6Q1bvTON4HkAwPVmFD
 EUoiFl9erPToF+RpzmLH9osuEdFyn6UPkEF15uiV6xEtkrlI0J+LduHQTk0cZMV405Ug
 epvmY0euMoIyU5WdLA3X8sPXm+DZ5x4MZVvS3AOVrFrbXSUvvZqgBvBOVfrCenqX7brd
 kOcfssYlm9g1181LUyXvi7nOgOzVENbpmQJ3D3doZ6ZMyCSvqsJ2ITvE1w5b38S+5THI
 V6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnXDSVyzZWZjdX4ANWhTglZeil8eXcC0WohiZGPb7HI=;
 b=IcTKroql4H0ux5ZpcGYepo8MEbCgxO0gr8OsIPw68D+QcmP1M0A7Cxo87JtPpTnrzP
 yrTC5Iq35d2fNNgNLg8vPX4jWovWUMRKNkuyqhC+bY5+s/P45o/z+qUqXrcbDQzF85PD
 eB9UV6Ow38qeeMFDtpGbOzXWJaJy1jcU3OqCyMaP9dpo/yqEraDbm8xo1y1XGZYs7jOi
 /yySdGG12s9zv4UghvMb0e1vyYNEj58TuFRTeysl9LFtpmNl0yC71CBac8XXBV/po6vy
 crI+qonIStfHwgTxBQuOC8PF/O4ZOQ24QOC3WcfJwCmQ3AUEMxs5Yj4T5sqEYhPJhmkL
 ao7Q==
X-Gm-Message-State: AGi0PuZUwNK2NPsVen7C0kiUxT+2Ay8qJmjySQhk+6YsP0uHg0hAjPFw
 Fg6FihAoJRlIq/lIZhZJsYOuXU5mONSMCg==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr4284482wmi.88.1588270213204; 
 Thu, 30 Apr 2020 11:10:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/36] target/arm: Convert VCADD (vector) to decodetree
Date: Thu, 30 Apr 2020 19:09:32 +0100
Message-Id: <20200430181003.21682-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::344
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
X-TUID: +kqRItIyDb+G

Convert the VCADD (vector) insns to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 37 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 11 +---------
 target/arm/neon-shared.decode   |  3 +++
 3 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 0baae1338a3..28011e88d9e 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -67,3 +67,40 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
     tcg_temp_free_ptr(fpst);
     return true;
 }
+
+static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
+{
+    int opr_sz;
+    TCGv_ptr fpst;
+    gen_helper_gvec_3_ptr *fn_gvec_ptr;
+
+    if (!dc_isar_feature(aa32_vcma, s)
+        || (!a->size && !dc_isar_feature(aa32_fp16_arith, s))) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    opr_sz = (1 + a->q) * 8;
+    fpst = get_fpstatus_ptr(1);
+    fn_gvec_ptr = a->size ? gen_helper_gvec_fcadds : gen_helper_gvec_fcaddh;
+    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, a->vd),
+                       vfp_reg_offset(1, a->vn),
+                       vfp_reg_offset(1, a->vm),
+                       fpst, opr_sz, opr_sz, a->rot,
+                       fn_gvec_ptr);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 17167634e29..571b64aa89d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7048,16 +7048,7 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     bool is_long = false, q = extract32(insn, 6, 1);
     bool ptr_is_env = false;
 
-    if ((insn & 0xfea00f10) == 0xfc800800) {
-        /* VCADD -- 1111 110R 1.0S .... .... 1000 ...0 .... */
-        int size = extract32(insn, 20, 1);
-        data = extract32(insn, 24, 1); /* rot */
-        if (!dc_isar_feature(aa32_vcma, s)
-            || (!size && !dc_isar_feature(aa32_fp16_arith, s))) {
-            return 1;
-        }
-        fn_gvec_ptr = size ? gen_helper_gvec_fcadds : gen_helper_gvec_fcaddh;
-    } else if ((insn & 0xfeb00f00) == 0xfc200d00) {
+    if ((insn & 0xfeb00f00) == 0xfc200d00) {
         /* V[US]DOT -- 1111 1100 0.10 .... .... 1101 .Q.U .... */
         bool u = extract32(insn, 4, 1);
         if (!dc_isar_feature(aa32_dp, s)) {
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index d1d707a56d5..ed65dae1809 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -36,3 +36,6 @@
 
 VCMLA          1111 110 rot:2 . 1 size:1 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VCADD          1111 110 rot:1 1 . 0 size:1 .... .... 1000 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1

