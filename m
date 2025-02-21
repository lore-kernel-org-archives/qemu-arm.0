Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp504323njc;
        Fri, 21 Feb 2025 11:10:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8JjksvEhj7+LbP8V9u3r3jbbYfCy8HHTwE+mjyHixMrHXJI2cwgVHEwxr+G4exLDz18PDaMRrNz989g==@linaro.org
X-Google-Smtp-Source: AGHT+IG+KyaSZDM6X1W0xAOX3spbfiqcrP3g4poyiPlG6Uk9bqbGZaqkTFfvBC/bIqJymcWg5+wN
X-Received: by 2002:a05:620a:4155:b0:7c0:b795:9810 with SMTP id af79cd13be357-7c0cef0f44emr590064285a.26.1740165039257;
        Fri, 21 Feb 2025 11:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740165039; cv=none;
        d=google.com; s=arc-20240605;
        b=Gfp8jA/7KOH+vNXcwJ+898Ng50vTVk/GMpJZS5ab7jAm4gu2YeRR0i0cHz+ozhc1XK
         pSS+P22FBxf3rYp2DvYjZiscg/3SwcOglHMGsxeRdkzNW2P9QkSi9p7esdVPtAXGsx0d
         i3W02D++jTmgNkiKpYv2t0+l7bGif8XjhHCvih8EKioh7+PnskjEmU6ay4oOTBOEVbS8
         WBxTiwTqdTLF8vzJ5ONvWgTCETkJuQBZQKROdN1ljCl1SpDl1kDARI/b6pH7zxICqfDM
         MLJtThd7Bg5/KOzAlhvWdc9qOCVhgbtKP4+jcUBBToEG/NlcO4bEvFEmlMsqI8joeteJ
         Vznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cBaUtQexwmvEbDOtV7dWohrzipVVAW8wPhNQo0ILWHg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=U09qVSBjAW5/3pKv5e7pTBNxHI+pPsC/Qsl/aIsLGvwdrHQV+uVe9KFyvmBtcmhTuB
         IxBS1UU6/TgsWQjms6KmNFjOmtPUhIzS1Xo2WUjf3n/YqSv0MXC9ijU7sHEwwE5a+VAU
         1jkYUp9JOpyPvDBq9authmYWmcCSmPFaJAvnpdtzqk/Wux7xU/dRLau93kerPZ34uJPz
         4YVzAGxoY9/gCXGVVPHHP9i26gcOoSPWyhT1k/w343A4y2trXp6CEK54NqqBDtSc1jxM
         vFif55hJGmR1cRd5zjyTbCr63fOJ6UzGTLeCvdDG3Kdx8YvQ414tZkGs3q1A1OXGT/Sy
         ch0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=urxSt8Xt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0abadca65si786557185a.165.2025.02.21.11.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 11:10:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=urxSt8Xt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlYPc-0006Of-OO; Fri, 21 Feb 2025 14:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlYPZ-0006M6-I6
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 14:10:09 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tlYPX-0004Hf-8B
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 14:10:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f378498c9so2244471f8f.1
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2025 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740165005; x=1740769805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cBaUtQexwmvEbDOtV7dWohrzipVVAW8wPhNQo0ILWHg=;
 b=urxSt8Xtr9lPNgx8IyxukbV3cptOcMmFT3F2dp2wlWZgaOdMrxa++D070bVECSSIk8
 njd8FDlulNQVr2WgSYMyYIoBObjVSSajLgkf33ZveE00m/UC2N8FQyKR/WPpv5K1qmEA
 /yJWg6/FEPm0BbFcXh661WGg24aoCF8eDDCq6Y7mG7fFDDp44rQBb3cKdhvoDGFBHZGz
 4oPheiWm5szBQhDeA/t4EbH++AsqoMqC9kJ+QhadVZENFcCQDa+av+5bSp3c/6aHU8sB
 vuYgN7cLbOBDD5sJZxpROwZ+RPpk4D3sW3nT+GO0+6+8XsRg3NM8PmYA7TPNyUJdtBaP
 WsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740165005; x=1740769805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cBaUtQexwmvEbDOtV7dWohrzipVVAW8wPhNQo0ILWHg=;
 b=ogdAC49C2rhMcmPJhaEDDPh6il6nEunUAxdVxQ8QuE/s/pgYQlR3n8bXugN5RNXKdE
 cqmys5FVwnxO3J2ysnjLR+xxoQTlHkHe+E3vxW/mMBJ38linbFqb/JtMzgYvTX5d0tBg
 Jees8iDrHjrLd8XeUQdvla2mZsk6m9LMfck2Wyoj2jsOi8AMpu59eWX8j3OYC7XOb0ss
 4/ZPegiswSEHloAiK2ba7ADic8XjReJscgxtz1owSPaAooa8NvMlPOEjal3acTKlkyzQ
 9KiVQ2vHE+2gBJUHDLnUkaUtSAMLKa/hNsXHzb39ASJ3aAwkQO1KFvHItY/nJVCo39ne
 1Udw==
X-Gm-Message-State: AOJu0YwNddjQdtvm2EJAWYtDQNB5GAY5r6LKap7+RrzhbRWVibjrRBeg
 5x0emrhVCeKwZaKwn+sGd3fauA1WS3SnU3cm7wIgWpvWagf0Da+9WH8Gn3H6oiuvgg5cVIRj5Nn
 U
X-Gm-Gg: ASbGncvwqX7UFk7Yo5ojEXeYEsruSbfeVawDHGML9lXLnYWfe2zw18NV/wH9mFRBlbK
 4YkvZUgkcmY+rCvu0dwLEALL87X1LGNMDZkcoqFoNe+R4nxjVriCekGLuFw7O01YSU1D06DaQ6+
 ukBoxlI2gnlHuOs2Vs7d1XkNyTg7+WrcY1oblm9Goft8Wj8c+grvWar85tEUHteqF6EIBJLABwD
 C2lMJgaqH7dpL+Xux47Qu2K8EUwBIHP0PikT/6+LJoyMY4nUnb8avPCSq+ufxki1E+yfLJh6F1w
 vt8nUk/Tp3etwAI8ZuxhlqOEzmTYrjkR
X-Received: by 2002:adf:f003:0:b0:38e:65db:517d with SMTP id
 ffacd0b85a97d-38f6f097eacmr4193414f8f.40.1740165005242; 
 Fri, 21 Feb 2025 11:10:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm24392478f8f.39.2025.02.21.11.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 11:10:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Rename vfp_helper.c to vfp_fpscr.c
Date: Fri, 21 Feb 2025 19:09:56 +0000
Message-ID: <20250221190957.811948-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221190957.811948-1-peter.maydell@linaro.org>
References: <20250221190957.811948-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F5TVR5d5bSOT

The vfp_helper.c in the target/arm directory now only has
code for handling FPSCR/FPCR/FPSR in it, and no helper
functions. Rename it to vfp_fpscr.c; this helps keep it
distinct from tcg/vfp_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/{vfp_helper.c => vfp_fpscr.c} | 2 +-
 target/arm/meson.build                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/arm/{vfp_helper.c => vfp_fpscr.c} (98%)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_fpscr.c
similarity index 98%
rename from target/arm/vfp_helper.c
rename to target/arm/vfp_fpscr.c
index cc0f055ef0d..92ea60ebbf2 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_fpscr.c
@@ -1,5 +1,5 @@
 /*
- * ARM VFP floating-point operations
+ * ARM VFP floating-point: handling of FPSCR/FPCR/FPSR
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 2e10464dbb6..3065081d241 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -4,7 +4,7 @@ arm_ss.add(files(
   'debug_helper.c',
   'gdbstub.c',
   'helper.c',
-  'vfp_helper.c',
+  'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
 
-- 
2.43.0

