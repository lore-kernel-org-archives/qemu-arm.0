Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp844678lfg;
        Mon, 24 Feb 2020 14:24:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfln1Zvq1Fcuhfq4Z5GwWwAPK4isNphNRWHA8cwYkiCFHQsBnxjjcBPkZUPt0WK5mHcDSB
X-Received: by 2002:ac8:5486:: with SMTP id h6mr49283125qtq.17.1582583069881;
        Mon, 24 Feb 2020 14:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583069; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5ebybWogWjBLPr/P4h+rJ/+igZuwUmeTYuxuzhc6U2zP0QdLbMvTtMe9SPaUHy9cf
         FsRbPe8QunYXzlbbJbEXuQsWE4Pfa8qgCQLfJSQt/ji4Dt6x60Qpxf6AttsZGQNE/LlY
         GZXs7kT04kERo8PjOEOEnZlCjmEXi+1QJx14tY2UGC1vU42uZYOxOS4rzGSdYZ5+VrDa
         bPQPBPBBDpevnVwon80IsWTIyWgDFi42iPS8bk1MXpPTFJFNQ61PiEiVsGav1p9H64wF
         1bZTGV/ac85Qhoq9T7urzElbFVnvzIb4iAmM4Xx0qm1+jqAp+qzR7QNrexaLESJWkHTg
         LBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+KPvmzpCR5seSYv8kHpAw1AZPr6kKDFij7TNxO0T5iM=;
        b=meUEsF1yiBf1VM0IbxtwGiImw8b3TSDgyscoDcxgZ47seP3IRS51V5PpSoT94GeCS9
         k3/ny/xLQYMLkqPCJXa2GRaNtMmK2HnoHeofpeWzZPMSmBoyGf9U+BM45iw+9Gp8p/rI
         2IvuOl5ONAQdomt3J71SDg/IBQMtOg6KZZrkWON/02FbfwW6zkYqLPqcdBjv8gPTPxHm
         JqKc7wwc5h385wv66ihEj/8YCzVJ9SJCMaL+OIh0YieJzf3YSP2q7hUeiHWS2jXFIKKG
         zDGPDHIvDxTIiXZ0sNEAp1w4dE8KsA+pXT6thzub8TXgQLscON0nmob0UCg/VKjf9YSD
         +4bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uqbxg0jS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p29si6611199qtl.207.2020.02.24.14.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:24:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uqbxg0jS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M9N-0007Y3-8x
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7c-00043V-Ui
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7b-0005lW-HD
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:40 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46280)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7b-0005kh-Bb
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:39 -0500
Received: by mail-pf1-x443.google.com with SMTP id k29so6052477pfp.13
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+KPvmzpCR5seSYv8kHpAw1AZPr6kKDFij7TNxO0T5iM=;
 b=Uqbxg0jSTQpcnURf4xEmKosWe03wCLnDnGlU62zj/rU1xQnYsUL6vQG0jaC9wVQPXK
 WtQff6VthTSvakTFz3/W48U2KAmz1ecxTW2YtTKKJcpUBA5mFUF66a+hScksICwFjzFp
 6Jx+BTSAHh5bSaUNHhiG+8my02XfdjFc9oxNwoPRWYeAuVVrEvZwX4AvVmIPGtSwtE/V
 GiMAskG/CbY5Y4X2h09T25GrenbWLQwWBergpjA/5zPM8bhnIbpRmbe/OcqIYL6bu469
 PE00pxAprU2rjHmVybQtqoMaC9amatDPxORqbb3//kIu0dbLah9VUG7vdo6iOM8n1ECW
 il7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+KPvmzpCR5seSYv8kHpAw1AZPr6kKDFij7TNxO0T5iM=;
 b=N5W4mWk6J7mRPMAHiskv+fImqNEkxXVnTTzYUMkDSIeQTNOfSgDIJ0FhOCALqVIpYJ
 TMzpGyaD2RNKW9Rv+V/dolI3pHmYBhV9FVF7ys95NnPyphfXgCaa5Mpgz65H3KqogUIj
 tgVwYU+EVo3n09laNobNilTR2mhEi7gT65VFWsjpIJPdqJU01v347xoJ644maR2rf3Dc
 AGD9ivCuYixo+nN5LA9rkjCgR0mBfxPimSyhcFOosB5o05K65zsA8ck8DenHnQYbKdwt
 PTLqff0GTgc+/KTS9K44YygUQ2XGcCSNF4i2TSzNwyDrX10o4xV7S/mCxEqy+tJi4DCN
 Xg9g==
X-Gm-Message-State: APjAAAWmloR9qvsUc7VYwehlkFJhN7uMwUs3ou0O4vj8rQBHXdvvIhoZ
 vmZi6xJ/7xSXDAszBjH8LN+8gw==
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr53268382pfd.70.1582582958411; 
 Mon, 24 Feb 2020 14:22:38 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] target/arm: Add isar_feature_aa32_{fpsp_v2, fpsp_v3,
 fpdp_v3}
Date: Mon, 24 Feb 2020 14:22:18 -0800
Message-Id: <20200224222232.13807-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: AyzFm6Q0xvvN

We will shortly use these to test for VFPv2 and VFPv3
in different situations.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1e6eac0cd2..f7a90f512e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3470,12 +3470,30 @@ static inline bool isar_feature_aa32_fpshvec(const ARMISARegisters *id)
     return FIELD_EX32(id->mvfr0, MVFR0, FPSHVEC) > 0;
 }
 
+static inline bool isar_feature_aa32_fpsp_v2(const ARMISARegisters *id)
+{
+    /* Return true if CPU supports single precision floating point, VFPv2 */
+    return FIELD_EX32(id->mvfr0, MVFR0, FPSP) > 0;
+}
+
+static inline bool isar_feature_aa32_fpsp_v3(const ARMISARegisters *id)
+{
+    /* Return true if CPU supports single precision floating point, VFPv3 */
+    return FIELD_EX32(id->mvfr0, MVFR0, FPSP) >= 2;
+}
+
 static inline bool isar_feature_aa32_fpdp_v2(const ARMISARegisters *id)
 {
     /* Return true if CPU supports double precision floating point, VFPv2 */
     return FIELD_EX32(id->mvfr0, MVFR0, FPDP) > 0;
 }
 
+static inline bool isar_feature_aa32_fpdp_v3(const ARMISARegisters *id)
+{
+    /* Return true if CPU supports double precision floating point, VFPv3 */
+    return FIELD_EX32(id->mvfr0, MVFR0, FPDP) >= 2;
+}
+
 /*
  * We always set the FP and SIMD FP16 fields to indicate identical
  * levels of support (assuming SIMD is implemented at all), so
-- 
2.20.1

