Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5019130lfr;
        Tue, 13 Apr 2021 09:18:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznVT52qc94w02slRGNnHOMoBJiRv9q+2z6/ozCQFtzkKVS3OrRhAqJY9j6xcwhczz/muNW
X-Received: by 2002:a05:6e02:1c06:: with SMTP id l6mr23876850ilh.185.1618330721697;
        Tue, 13 Apr 2021 09:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330721; cv=none;
        d=google.com; s=arc-20160816;
        b=nKWQqGQsVDmqXbnzaPKaPuuz08RS1ng1qlzNN4S99Y+bNGB37liQNwSa43vb6FxDj6
         KhZyBTYVs34AqwgcD+m119V/H5LhkTP3wj5KvjC0QMXOdUVU453XRNj4b7QaHxKqFpa5
         +0G327sHgYFT/CflsGFQ8iwBH406m8Y7GAgTrDj9ht6+ChvJdAXm+pnqZL8ZWTnEV1Ak
         vcXWVdO5We5hoc7cwufUuJJVUQAUD9Ile4jwBOMnOK7ncUd18mkCf5/DbG1wkttfY9nZ
         /R9nhj1CxX+ONGQutGtxTq2BgDcyVD9udiZpftQYgQbFpZkkZBq1h0mkuVNRh70thy8B
         Mbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Lkn8vbO2lVSIohjSGTPLDGmJoMLFeHQNYDUF+MkHtwE=;
        b=YUGdETM7DW0zggChLD+ns2TAohyzB5I4DoCwEker20pe2uDBKRZ8pemNq6lOZc2ou3
         7gcYBMu7cxkVrYhMtCXCrMuteFROHKMUU23ulu0EyNtMyJc/gte969Hghw4xxl8xMVz3
         fdECaKVJefDBveOs2JISnhezqizlSHUwvg73ZRCk/W4LJ9cLe6ohP2y0zv/n37lkeJop
         +hm4xb05U4bGFhEGQTPz1Ey/slMu4TBdhB+3lsNheRntdCQDzwwPx2j/RQ8aIRe6x1ez
         Oy+Gl/ZIpzrArd9GUNZA+z9eok6LkAlbkDFA59Y619NK0hdJ6tY/ElTnkuNIqx7QeLAE
         3Vgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ttpY1qWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si12096493ioo.77.2021.04.13.09.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ttpY1qWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLkO-0002ap-UQ
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaH-00061P-TV
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaG-0006lc-3y
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id y204so7658419wmg.2
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Lkn8vbO2lVSIohjSGTPLDGmJoMLFeHQNYDUF+MkHtwE=;
 b=ttpY1qWcHVF6FL4A/LOEd4qfWu9bmB+fC5MMmAZDHIyGqHdoMHjB/l93PkjUSvN+g0
 sfBjn5MAkjzHrHkJPlLW2iQdOMRNgxilrCv9d0lQlEYrTQLI8XF0GfYJLzb2KjNZO5kw
 +RqVLqFt5YY9zDeXtKKxCLdKZr0XClvTOo42fsqQ2G0m/2StKsUAorn3z3Af+yL4OuRA
 VEi4yQ1JXlOZqJLPF57m9Zx0KhxwJT4lH6vRwVnnKwmn7bhntqVhL/J5zjh30Pa0UPLB
 oDIHARyvQG3ebDCUjVSk8a+F3NjviBsuafp6JfB8I1GnoPLVWNjh988d499VWWVxywGB
 m3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lkn8vbO2lVSIohjSGTPLDGmJoMLFeHQNYDUF+MkHtwE=;
 b=V7FC/lVQTWINVeCAHS6zIXeIJx7D3REm+pS0EK6Rttg+JBYIphOeoScAsngnwSvgcS
 jqpZHDqWA1k0olHyG74FqFT53bS+mtDt5RgWFi84hWlA5oE9S52Hw5SMMe0bD+UPug1D
 qgrY17scthq1zobvX7K7lBNgrm3J0pwaQ/pnHw+ft6Lgnck2gRauXdDmQ4S1m/1eF+bP
 bY0QoDAzmqA2jFX4JmnzK2Jg6k/tiISk8SLpulikqzceiuJowqqUgDlaeQpJ5RyXPuyl
 WppyEYqz6wuhSfnPu61Bim8H1xpi6dDLtig6QIhhmPFZWRXvrwFOTpBx4Ovc4vAqtr75
 vQIg==
X-Gm-Message-State: AOAM531LrfWL8XwWHSvK5zxah2eoLFekRKuFWPI1sML3qLwExBuAEJqI
 pX6t3NoBhnlZQQvo4hPCsxcOMtcWnFSOKKfK
X-Received: by 2002:a1c:2b03:: with SMTP id r3mr661288wmr.173.1618330082162;
 Tue, 13 Apr 2021 09:08:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/13] target/arm: Move constant expanders to translate.h
Date: Tue, 13 Apr 2021 17:07:47 +0100
Message-Id: <20210413160759.5917-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+/HiWnCKWuE

Some of the constant expanders defined in translate.c are generically
useful and will be used by the separate C files for VFP and Neon once
they are created; move the expander definitions to translate.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h | 24 ++++++++++++++++++++++++
 target/arm/translate.c | 24 ------------------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 423b0e08df0..4c0b6e8fc42 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -116,6 +116,30 @@ extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
 
+/*
+ * Constant expanders for the decoders.
+ */
+
+static inline int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
+static inline int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
+static inline int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+static inline int times_4(DisasContext *s, int x)
+{
+    return x * 4;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b6..0e30892d54e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -109,30 +109,6 @@ static void arm_gen_condlabel(DisasContext *s)
     }
 }
 
-/*
- * Constant expanders for the decoders.
- */
-
-static int negate(DisasContext *s, int x)
-{
-    return -x;
-}
-
-static int plus_2(DisasContext *s, int x)
-{
-    return x + 2;
-}
-
-static int times_2(DisasContext *s, int x)
-{
-    return x * 2;
-}
-
-static int times_4(DisasContext *s, int x)
-{
-    return x * 4;
-}
-
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
-- 
2.20.1

