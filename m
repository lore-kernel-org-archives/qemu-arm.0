Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp521821lfg;
        Fri, 30 Apr 2021 14:43:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuubZ5+SrhyE6hhvoxUf4F5VgkdsT7uI8+5ZGvMt/8DBTLXgLZDYsoM/h524ebcuTMkOfM
X-Received: by 2002:a92:c525:: with SMTP id m5mr5558393ili.298.1619819033551;
        Fri, 30 Apr 2021 14:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619819033; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDAtDQKTKgGWuf7LZrsz1+0POMQ7XEx9hnf3vXN6dFCZhBj24QPOGX0ZLBNELMuchf
         lPTQQYAS1biBzKmAI8e/kDwOLIe7hSa1JnDhOnAlhGG73RcS3YGMCuv7upKVGKmLRXUn
         Il5suFHCkpwcKASwmGIGJEi/LtzoH9tcQu5h3jRFp678K3OAbQ5hIkgL79IT7EQBFLqJ
         tFmKAqLreUCUlOZ6GDX1VoAKvrJsYDsxlVwo+MtU5ALF4t1g3wFWasDQYkEQpAyW2vLq
         lxhIkTT0D3QxE/7V8DY8kfoBriL1Hv+MJlk4gERUiQozJHCfbEd+YkTP9fiIWxW682RQ
         ozfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PS5/3Bgg+wTxPQ6ZWYhKexmWIte/yItcs5KmNlLkiRY=;
        b=dLATyxEQQAcUuW+e1/tCrO8UghqlpHak2FGIJKKjYUMPJydX4PKW/tF2p6Au51v8ht
         MTw2eapU6Dp+Iaha2e82p9BA5cXemMp1cyYFDLmKeRODFLt9VuAC4kNg/8cGQfSb6MFB
         vcvRo891+2y8k6uyM7+6rbiG6V488DGd3elC7YJ1jvi2C2k0SXZkoQSI2XubtK4isP4j
         wTeu9McG4nXGNn7rLAtGax9YJO6HCsVx6YgdxepBn1okp4RukJ/bwQPZrIcNPagkA5/0
         9L7KzICb7B2phwRDnNadAF6hMSXZEXgy45VVlfhaXkFsBffoLnO75RSVnAnytgIAigNF
         CbEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRfl8eTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si1796526jav.68.2021.04.30.14.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRfl8eTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcavQ-0001kV-Py
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZp8-0006mY-LZ
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:33:20 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZot-0000ru-Ot
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:33:16 -0400
Received: by mail-pf1-x435.google.com with SMTP id b27so910982pfp.9
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PS5/3Bgg+wTxPQ6ZWYhKexmWIte/yItcs5KmNlLkiRY=;
 b=SRfl8eTfYpam230n/syaxqtDBTUBQX21+jpNyMtnieQq8aM+PShwWvX2NLIZ9yf9Rk
 ydp+45FKAx0TCloU8RRCgGwgyiA57DLBn6MicEpyZYoY7tqLl3rCrBCJKR1EP7TQPVv9
 SJMmi6C2rVTL0tLA+00A33qsQpGdPj0P8m/JdIo8b6ahEAAHeQAc4bmRuCwneC0hmky1
 xIL2Z4x0zIrIEP0BWatO8Q2P4FfKNfHpL0uLdX+MUdB8hVL5aYKC5KfJRET2DGqPsSbJ
 2FG2ocEp7Gukmrz55K7UVDMnCOhkj2hUusRlYBUNtO8EdTyiDwiZyi3undLJTul8iy2U
 RQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PS5/3Bgg+wTxPQ6ZWYhKexmWIte/yItcs5KmNlLkiRY=;
 b=LihirLTP9lNht1xJg7vXIWi2IBiC+QAMeN1sbWJtQ6hWMGGOFP5WUlgcKLnIL+veLL
 uczcJb+jwpyHFaEfv8HmndqxRI9H41XW480z1XSveOTjhXInwxMmlknDwnT7caZngGXc
 QruNnYRk+906aPD58ebmSL4W0/GGA5afpz0WxfzYAetXh/e0aFlQGVrkBbyhlKnUVk6s
 Auo0jezMB+yP8g+b/PzmxwvCDaxsdcEwhpqbb8fU9lJNQzC/2pPKaVOtq9WjRyh49+Pa
 fYp8Sx+CBbpQo1U5dRlm/Qn5lvSkYr89Pm9ebZkQIqBPqiQ3smKdpHUzrL68Qr6rYZvW
 agTQ==
X-Gm-Message-State: AOAM532h5cM/XKwrg+XYJVgx8jjLk4D8+NCkdzTOAgyWwo+lZ0ZBNrrg
 q5L7D5M+t5MJSKdZa/LE4vEwcQ==
X-Received: by 2002:a65:60d8:: with SMTP id r24mr6364448pgv.226.1619814781951; 
 Fri, 30 Apr 2021 13:33:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3792511pgt.42.2021.04.30.13.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:33:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 81/82] linux-user/aarch64: Enable hwcap bits for sve2 and
 related extensions
Date: Fri, 30 Apr 2021 13:26:09 -0700
Message-Id: <20210430202610.1136687-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Z1NMht+GcNU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fc9c4f12be..299116d450 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -648,8 +648,18 @@ static uint32_t get_elf_hwcap2(void)
     uint32_t hwcaps = 0;
 
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
+    GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
+    GET_FEATURE_ID(aa64_sve2_aes, ARM_HWCAP2_A64_SVEAES);
+    GET_FEATURE_ID(aa64_sve2_pmull128, ARM_HWCAP2_A64_SVEPMULL);
+    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
+    GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
+    GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.25.1

