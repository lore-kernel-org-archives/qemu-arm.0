Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649906ejb;
        Fri, 7 Apr 2023 19:47:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350YNgPds4NQhEsdclT3VaBmfbhyl/0R/FphUculiENLW+D9fHUe2NTjpjzw1BKgYKZBhqrUO
X-Received: by 2002:a05:622a:550:b0:3b9:b70c:9697 with SMTP id m16-20020a05622a055000b003b9b70c9697mr1119278qtx.5.1680922020882;
        Fri, 07 Apr 2023 19:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922020; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgKTto6hOejEeOunAB924bdXg04Na9miuvBMfWbX1vwisdD2sYH/vVTw7ayCALuAGg
         ysRzIkMGXeoWw1y9w8koXwrZoAlPziLDqqIAEYtQlV3Z3bFxcM/nr93v0H7v3Hdgeivl
         LzZsV6Xn96wN9xlJwD6xXncNFxKw6hqETXo+xG9mE84md6Wfacbn3AnpcxvkG4trqcZR
         uQ74+o29uD49cUb4zlOj9G+XoU4ddKY4ISqcyinlh+0A0L19+zbMPUG8+r8iPQWHqLm2
         +GybeG0mfWOuTvruBh4X2xEXzG67xQ89Zv5t+njxHeFgtKGqu0b0ttFEDmMvHwv2Hw8F
         kcDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
        b=mvHtHk5EW14MFKsYm+FHBBd1+X4a9RkNeZaJ0rBU4PUKIW3su6FlQLNNx2KHL1jJGo
         HNsV1/AaGXvRrd1uE1iEAs0LmP/NCH+fSstK8uiFTfgikAHs0Q9hnWKz+PuMOhbcfg9O
         axZFnDWZ3aSN9ldf6bR1zrzuPbsJCsA4F7DyJyu0XJAbZKDSXE7z+7g4nL5dZJghvZoA
         NBAkWIk3vDWDgVo/McuEAHOwcFRiNSJfWBu1LYDfJ6oaaDQAX4slUxOyG2hphD8MuD0x
         Jy9d1SYluXMt8mtQSUCDQZ2oWWdqkwUdRx3Cp8VYq8v63TGeK4xEdXqM+GdwH0JTlE39
         8VRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TiS/X/9z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020ac85dc6000000b003e4d6f5b844si3667031qtx.161.2023.04.07.19.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TiS/X/9z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyZP-00013n-DS; Fri, 07 Apr 2023 22:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ6-0008Vd-EE
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:35 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYR-0005sw-3F
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:32 -0400
Received: by mail-pl1-x634.google.com with SMTP id h24so511879plr.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=TiS/X/9z9vAJ/AtN9LcuqJIn24hK/cJn0T0PsWujj1S3NELmozS0gYIje3V4giix8p
 dyVCe/9d9Y/v+E93aJA0ZyJSqDYRY3DYYvKoSWOmuLJLEo+0YIqBI1EpmpZ0Qa7ImuKu
 sc9EBXYaWug5Z7whvvZFeb40QoyH+2v3Zre5HfUcekxIb8VlSmrd6oeO35D/DGQk36eL
 qSTQfBKTbFAx93uhYwm0vC80EH4i/DFxxxFIJ2BcxWm8ly24t+dtAFbX8TARZbZ23Mld
 fY1AtLxDLkJ9uP9/m1G/duCoUxrekaiGD5Swi6rB/fAZvnVSgHnUZftMKqv4v+c7yyXT
 8Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=eyTLU1S35Ps2m+pD5FcKNLWwAV5BOjWKOE0sS4DN0XHNAeRBVy85IabuAGQUxhaRFS
 OJnP2EqwKj5HXPnuD6Fj1US0KnyTFPEIgr+0/axT7Lyx8vgi4b/+ZR6cxLQnEnIA7+1I
 36kjZTwkJiHUB4PMmNvRCMpuktIUgwE4CJZYH1nrFFX4BAjCck7yyvam9a3YNgLOILh7
 /gDM7LsGcqQ8WS25f2L7NklAj9LnKqsI82kpRVHi6YsnPIHUpOOXuicrOGsOiVgRqmFe
 ZeYSgAMedIqm/degeZ6bQ9s3lIE28mdVpLGu5hIQ9kBfLUG8lYK8DPrw77RH2Km0myw/
 vEkw==
X-Gm-Message-State: AAQBX9dPYtXTwr1sE6Yx61jBrt0OT+u2M7sHDxVQYBhicOHTgvni7Jy8
 ThPE1g1BIzJg2pftGvP/k1Bcm3hQMfyUNsPV+jE=
X-Received: by 2002:a17:903:228d:b0:1a1:f5dd:2dde with SMTP id
 b13-20020a170903228d00b001a1f5dd2ddemr656762plh.44.1680921829385; 
 Fri, 07 Apr 2023 19:43:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 37/42] tcg/ppc: Remove unused constraints A, B, C, D
Date: Fri,  7 Apr 2023 19:43:09 -0700
Message-Id: <20230408024314.3357414-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1EmEQIh/0lc+

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1

