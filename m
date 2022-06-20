Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp597149lft;
        Mon, 20 Jun 2022 10:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sr04pqJwkueA77zFjW89ywJcbgU7bxUzhdHYd9U8jf95PTWuUAEZUANZZIR9JQJB/bg8ai
X-Received: by 2002:ac8:5b44:0:b0:305:1a53:48ec with SMTP id n4-20020ac85b44000000b003051a5348ecmr20753347qtw.135.1655747650565;
        Mon, 20 Jun 2022 10:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747650; cv=none;
        d=google.com; s=arc-20160816;
        b=vEStq1+8Xf5XdiVktM5k4/u6s2H5aEjmnKvnRU5nw/XpbQ7nldJbAzzj2bEdViYKZl
         fiBNCf30tHVL4EDevm6EwFiVlRt38+9qxjHBMRua75lSNLKJPVCwkOoFt8Q148692pDH
         mxAiq2fDjhteGtDyiU+j250wuKj5foIdi4Tw0cO6gMLz+zkSoLmXKhF3zoiL/jafh0jU
         lIUvTdIKZ7CchMYOamARbcLUOPZmb1CkdfDu2KwPYG94B28QUzQgP0SEyM0DOL43Kf4h
         HoQk6kk7WfpMW3Z3tQYjjoIwV2F0LotBIjAxWIFB7KgSlI2H0Qrv7coLvmfOaCc+DO3h
         gzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+C/PGq+HnUIHwmNMLjSjjZWblYyrjc+K5YuntUcgNSg=;
        b=tbxqCHsDMZaweF7M/p+1qOV09TWcWFJGLgLK+sLfW2m5kk9RwbdkZEbPqJzc2EA2dL
         Qi70vEjyG7C62OWiW2jQP3YQAr7F/fd9Qn8YIuZwAKwH2+B4bDd0wudVp5LW/JPioiK/
         bV1XyhHP1+9e7pBT9TccLKDe6s7Tbd6HhejVvfCrObTPq4jXvGe8Os3fF/esWkMuDPUI
         wdwyWsXcxJ98KPnYzOG5afTqfcOBR9HMlj+kv2zdbT/3XdoSO05tfU+J+2ztr2t/uPt1
         pnQMNzxdihBJVXbKy5dA7/cm+YVHfy3mlfMOCMjzoxLBu7b6DI35phpPujY5ks4BO2X2
         yEOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrXasSHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a05620a448600b006a339d370bbsi10380689qkp.338.2022.06.20.10.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrXasSHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3LbF-0007Ts-VS
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZq-0005Sn-TY
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:42 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZo-0001Kp-On
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id s37so10851160pfg.11
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+C/PGq+HnUIHwmNMLjSjjZWblYyrjc+K5YuntUcgNSg=;
 b=GrXasSHfi9NIvoS6x9HwseW4O1ojE/ZP3FoRgi7L9H5E0zKQnf+WiyDGS2KF+WgHUL
 Zg99uGfSwutgE+3LQzYFz9AqQvdt5T/1KPutM8jMokg8rkkh4zZoZoBxXLI0gIYsbHAZ
 DENBa7R3aGDHY4WCWbSCL+bndDbkEum0L0SWVlMuWZDo8lkKsGxrD/day3XY01XjTvZ2
 0kMrZq+sEV60fBoxLZKIAXyRBq6reNc0ULmyOX4m6HVvPiVNtNUn0ZRbq5KpFiEfEBlH
 Vkyq0nAC0iOQcvSuEC5e4u6Oz7lIkjn5ofbJYTGg3CXG8n8sCAVRaso7qo9lP48l485h
 2uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+C/PGq+HnUIHwmNMLjSjjZWblYyrjc+K5YuntUcgNSg=;
 b=wLvj5lXyfRMt9Eoad0Qos3xW4NiDsKUkERC8nx3CTd0hcS77bKl1jwQInerQuAnqlN
 HTY8CpGPPaSBXrzc4x+TQL8hDOMjJkziflUdKFb9XoTkzHVHOifNgw3r74R9sKYGx1Ox
 vyLbylf1X1aP9AtYho+OjWf+vTnm/rQHrC/pQFZklzQeW23zS+I3UV/L/Eoa0m/7rEDc
 aYnzpiiKlm+FUEvHb0DT1yah1OJfEChTYFfs7mzzErW6h+GI9hJx4QtYVQElI7/GaFL8
 YS4RRTIchd/zsuoF5vJpTriF4J+yxqAJJ77vNFLL4mP3E5JHM/l/5bPJyjxBcy7FsGUU
 RpjQ==
X-Gm-Message-State: AJIora9yt08bCVzQvXgNR67ovg569cxromaXy+l164QVpa0t9xdutr5l
 V6Rpefrti/2o+8pTv72FRWNIQJwMdCGuRg==
X-Received: by 2002:a63:2cd0:0:b0:3fe:2810:ba99 with SMTP id
 s199-20020a632cd0000000b003fe2810ba99mr22811835pgs.27.1655747559493; 
 Mon, 20 Jun 2022 10:52:39 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 03/51] target/arm: Add syn_smetrap
Date: Mon, 20 Jun 2022 10:51:47 -0700
Message-Id: <20220620175235.60881-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: reFpril6g5H9

This will be used for raising various traps for SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c105f9e6ba..73df5e3793 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -48,6 +48,7 @@ enum arm_exception_class {
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
+    EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -68,6 +69,13 @@ enum arm_exception_class {
     EC_AA64_BKPT              = 0x3c,
 };
 
+typedef enum {
+    SME_ET_AccessTrap,
+    SME_ET_Streaming,
+    SME_ET_NotStreaming,
+    SME_ET_InactiveZA,
+} SMEExceptionType;
+
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
 #define ARM_EL_ISV_SHIFT 24
@@ -207,6 +215,12 @@ static inline uint32_t syn_sve_access_trap(void)
     return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
 }
 
+static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
+{
+    return (EC_SMETRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL) | etype;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
-- 
2.34.1

