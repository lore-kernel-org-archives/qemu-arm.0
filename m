Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4909691lfm;
        Tue, 25 May 2021 16:05:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoF64MfQeiQT2RFh6dMVfSWICUNClE3pNC61RHOB47rrG9470EmeYpjkV9+mSbJkt3Fsam
X-Received: by 2002:a17:907:1b20:: with SMTP id mp32mr31503741ejc.495.1621983914872;
        Tue, 25 May 2021 16:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983914; cv=none;
        d=google.com; s=arc-20160816;
        b=JyRTDtFEfUnJniHf5SFYybrErHyQu5VcilOKtiuUd2YxPM0m5FRzF85Bu1PcdvcEiy
         DbtwD4uOgNV6rq8WORWOfMX1IWPg9H5AuVgy7PGWsXzJR6gwg/h96PPXppS68JJmxQOZ
         LNi4iDsW5ucECOqD418eeG9POLW/YwuB9ADSV6w/DjUyi7wvoUcW8MLYlO6Asnze55DU
         gW7EkIJfKGf5U19Ycb3A4qG2R0oRQMnDFJ48TdRedJqBxZyUKT5lh6LiWe7hZWialZjw
         oc3p4JHdan3P3JfdTz8Zp4+RO6hBcWvrwQwC3ZPJUKbRyOefnUDYWXKIeeSp2uso0tNE
         HTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zs9Prz7ExZU1dWkJoVWg1ReLLRdWEnLSyOhH0GKyXmc=;
        b=lLvUw1H7RxE3MsoSwBMhD5XNuNjO7m0KBAcJs3Dox9YsRwXBef1GAiHng0wSwJkvyU
         wTuLOgeR0vLMP4fyjgofLNdj6srAcr2N9FA57UhAJQcsrDM4VCClMbKXaLF929WX5Q1z
         5YuZofZs7plAfrCodMBrpEI7bbCO7Y4qptzyDBqXMR8h+5Hhfg6SHXGIr2nFxSnne6uj
         +5fHs/C/NHpjedtiWOdnFV9l1DkKtGM116jvIbT/7Ex8CRyscCXbZFV5PtLfFosg/la2
         OE3uk8z2K2IBk4A3a3xeaQKP5tjtrkkPndnAUextD2FRlwMoxArv5NBAokBXjPljXOBZ
         JGKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KI0+RGE4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si16400747ejg.627.2021.05.25.16.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 16:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KI0+RGE4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llg6s-0000uL-2T
	for alex.bennee@linaro.org; Tue, 25 May 2021 19:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0Z-00033O-Ay
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0M-0004qt-OO
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id k5so17729568pjj.1
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 15:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zs9Prz7ExZU1dWkJoVWg1ReLLRdWEnLSyOhH0GKyXmc=;
 b=KI0+RGE4oQXODgj+e0qG21N1cb+djD6h12rXj6oIJOkKxaAGQSXRFcNt0hod4MIaVA
 wvrWVlU1q5UmVduGASahS0ZlaT7d45je6lJ3DSjkBPXMr6a1h9hebh9yUioYN3u6BHkJ
 4+qpzPXtQtbqoocUceOQIIbte3BGRK2TIdf0RQpaFjg8/znN+VskVxhNBvXwnHFlLR5m
 D94cn3mBH6BpplOlQtHrEKAxeVGcPIADTzBI3lkiX5Lj2A8+gCRHGhPyK8wiCD8WHCwc
 fO5cV0PMtFk+EATAGU+vaMxyglJTL1X8KHDmsyumXMO9573s8MIlmwdQIBb22ULRzA59
 LK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zs9Prz7ExZU1dWkJoVWg1ReLLRdWEnLSyOhH0GKyXmc=;
 b=oJOh3beWXawGNiRJWO03yRsqm56CQpARMESbLnuVTHNl4G9aMj8ac9jm+GLYJ2RLjN
 ElbQcxe9wLVeW+WpNFpn3swtc9BEG2mRY2pfSUjHXr9VmDRxY3WTx/kGiD/BcAu60HfY
 Cr8KeOqC9XaGMief8dzruHekxaoA4SSYOz46fkFnmnq6i7v19Epohhn1c8FOSXnZqDI5
 wDD/S/dwTMDwxpoTLV5Sm1+VZV5Pm1ZEPh2aIWpwjkd8kmXa73guU3cquPrzBeFDHlNI
 H+BOcRaOjQp+cFccXUrcg2d86DSi0IZm5iAlomzMV6GW4XeOZHJzVsi/J/zNbB6l3gOl
 ubjw==
X-Gm-Message-State: AOAM531WZvWJr2Xgejir6wdu+PjLeT2q/ZrTAU6ScMIje5umAOgCgl7N
 lrfjCL7LLAAXpYCf6EQObLh0FA==
X-Received: by 2002:a17:902:6bc7:b029:ee:f84f:1093 with SMTP id
 m7-20020a1709026bc7b02900eef84f1093mr32272753plt.37.1621983505533; 
 Tue, 25 May 2021 15:58:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] linux-user/aarch64: Enable hwcap bits for bfloat16
Date: Tue, 25 May 2021 15:58:16 -0700
Message-Id: <20210525225817.400336-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: HcY7yjbLqwJ4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1ab97e38e0..17ab06f612 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -659,7 +659,9 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
     GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
     GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_sve_bf16, ARM_HWCAP2_A64_SVEBF16);
     GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
+    GET_FEATURE_ID(aa64_bf16, ARM_HWCAP2_A64_BF16);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.25.1

