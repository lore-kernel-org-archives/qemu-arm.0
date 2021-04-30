Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp502426lfg;
        Fri, 30 Apr 2021 14:16:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznItyLhnWi+ZX4jZ/h9McCdkBz5JxbDQxXNBv9ootBZjX6R5gyYlOBzDRBxJl6K2FhvPyS
X-Received: by 2002:a92:c74c:: with SMTP id y12mr2822295ilp.107.1619817399955;
        Fri, 30 Apr 2021 14:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817399; cv=none;
        d=google.com; s=arc-20160816;
        b=Q83Q2OV+pUGsJ03cWsMgATNJc55XZzZk7hAlxK+Rv99QrBMzvhn2sF1R2NmNu5FK5n
         D0yUbRollSq5VNyCnrk0obYt1eBph65HV4UHGhvcHsd+FzGUdHVE7Xhb6qx3uwlm9wre
         OfRwDQPDbDTtO1VFe/1wFge8CsOuYtHvN6ZwKp6ERyVS/mEmMojVh0Efwt4NvpCxbf7T
         ysPIbIWnR7BP1Tz1nXHV4/ZYiZ3Y9iDxFQiAnV3EF392iEboB5Fsm3XkpSwpMKda4OAE
         Vcwuv7JVhFARmZDO/DtZnvtI/OgjlqoYmdv1JzmGtY2/G2zZ58tcWSR0tr2t7Eklg5bl
         QSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=grtE+IKARzmMb4HRIktrtzr0mKc9uwbmVIePGd0MZ+U=;
        b=AyOz6gji8HDGnvg4BuWbpzOyJMnRGt5PuCiOv46Yz7Cd+xU4/xoGKz4XwE2TzCcfl1
         MgKRZmi6LvK2llsjSd4KLrGLHJGwoq7uh5io6OF/vv820zJ0Z0YIO7Yl0qSHP7/eIhT+
         K7AcPukcWeTzjvRqcTuEWIDUp7pMKNRrbD1GXKoTv9Io4P+PRhjmbhZmQ9iljxcqkcwJ
         4tQkBQeittmSd/pOgxg8ZvU+Q9FLPW14zlhVg6eO0YcabY8W7LtqJUIBWu25JPhsvj5J
         BJhwgnGj81fAC2iJUBEAJEyVjQHSevbNan3wWzTW6C+xCxJgIHeeT2q2fNcNixSKC4/i
         O0Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2Dz3C9q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si4030233jad.48.2021.04.30.14.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2Dz3C9q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaV5-0000xu-9M
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmW-0004ml-Ds
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:36 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007ks-Nq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:35 -0400
Received: by mail-pf1-x436.google.com with SMTP id c17so14648246pfn.6
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=grtE+IKARzmMb4HRIktrtzr0mKc9uwbmVIePGd0MZ+U=;
 b=h2Dz3C9qhefPzZY5xiyJB5ygseEXFK65KoIKk7zh4pac66Pg8mpo18aNCB39QNzefz
 Ny/BD4gCl5ZG0pTCt5IvisSW+UIOVA8L7muSZBnz+i2CbGCMaqUEg+RSJ+DtmScMJMza
 DRxjsLU6l5sX74Hn8pBz4kYRz+d5rvLiqjW55iTRTiS6PqyHwbVrPlW14EoY/FILyucc
 sdFs2E7J2EWE+1J1DRdA+ASDDVyxr/qeO+Av9835G5ssuTxpsYDWobT98jIF+WKp6657
 cwzD7DXSosivzUZqPXwLGKPt63GGOP58W0t8ZK3IdlRcWxbrLWFBuATaKBK3xQgatuu6
 gfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grtE+IKARzmMb4HRIktrtzr0mKc9uwbmVIePGd0MZ+U=;
 b=DEwkgzv4bqr0zlhZ9MLmAP379fdnx47nTFqPhiVieQFJfwZxVmonX63iM+pOKumc0x
 FyYAuuUAY48AAJF7jPC8SpzMlazUDAi162h6JFv2K7Ocl/H5V2zem4M1MeVdWd6Izn7h
 w4XAFKTm0/dmc3GenH8eFADYTYzkCRplWrLHi+ERXiNr2H6F4hYZFvEZPluKhX6CaJDD
 hhGOqGCTLVvTDbL2Eo5zwDvQKpu5kBafwCxwfCDFrlgAhVe8k3eDbzZVjWMblNqd/XRt
 MZoyrAg/R8NDHTbutxJom4+1z8uxAVbCJkzSTu01OrkEJQVgupn5SKhRsHpzCa0RoY01
 iHzg==
X-Gm-Message-State: AOAM5320arHTnFhQWUhf1hl03I4pRiVST1UxM4+L7mymckfxnAVkwhHO
 OJ36juprPtXGTtKZqsiwiswc2WkuWyJS4A==
X-Received: by 2002:a62:3486:0:b029:24c:34c0:3c7a with SMTP id
 b128-20020a6234860000b029024c34c03c7amr6318292pfa.36.1619814589422; 
 Fri, 30 Apr 2021 13:29:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 61/82] target/arm: Implement SVE2 crypto unary operations
Date: Fri, 30 Apr 2021 13:25:49 -0700
Message-Id: <20210430202610.1136687-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MF6zi12DSVHM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 73f1348313..6ab13b2f78 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1509,3 +1509,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 Crypto Extensions
+
+# SVE2 crypto unary operations
+# AESMC and AESIMC
+AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8952990453..5219b93abd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8072,3 +8072,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     }
     return true;
 }
+
+static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
+    }
+    return true;
+}
-- 
2.25.1

