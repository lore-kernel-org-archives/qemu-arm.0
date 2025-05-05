Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778270njj;
        Mon, 5 May 2025 16:20:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2NMflUGgBTrZ9Apmo9PLgPc5U6wyevukBnRUFI5ec9pLsYQI93neX4g6gAgoNS3KZvECG0ar5HkB7Yw==@linaro.org
X-Received: by 2002:a17:902:d2c1:b0:224:24d3:6103 with SMTP id d9443c01a7336-22e363663c4mr11973155ad.35.1746487238781;
        Mon, 05 May 2025 16:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487238; cv=none;
        d=google.com; s=arc-20240605;
        b=GfWVsv88ODQunR3wqFP3kXA169NpIfxn+ek0L/fjDFy3e9fS9ibdBBJdKcVjiayUUA
         RIVMdH6ISKLrvC0E+9TEQf2zs4qF1WkEyzi9uJa0J/D45gMEl9uHDpkvN/qg22h578JP
         kyKs13MkY4Iq3uUWFxrZr7RxCfyByVtxdl5eb0lNDYa3x+66rez/SuFn4ff92FLUJchc
         XfzawgaF4qksWTglv9LQ7kZ/ohBkjM6eULgFqCk7g6Znzshg73aIGE5yaOIuRab8CfVy
         cKnzCY1l2PuxUGvMezbYNGBeW382RS2uEZrpj8moAafLDfT0vRzH/i4hNVXLuvX+7vno
         /I/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        fh=VkvUIgsdJeH2ym1jzFXwhxN85xltNXniWVcPvXhUAcE=;
        b=G7UmW3NMT/UvWIE3p26BpG502JEpq5uFmoBZVJcJlB1OB/ESTQS/SXxINMehWfDF4y
         EbH6gcVstj4gQYM5/V7XaIXfxHFi3wfGZBJvMAuS3MnSlD+cdubg1djZCRiCCeNTeosW
         qQCdvtcbAjlZOiR1BRumvvk2/7qanz6QqrNzF+bvLdnrKMyr48rqqiUCdoZVYPMY7nhP
         hrD4KBhwIh7JaLN+s1hJxnr0go5t3YxI35LpQABsZkUI/yuiwQCuRaRLtOdz2KUnTWJ7
         wAf0klZ3oDdxXizJXZ5FA30NblKcZtYwQzLi65baDF88xjOiCVKYBbFc+c2zDLrKu+Me
         lxyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ae+8Op7U;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1932fsor88943215ad.2.2025.05.05.16.20.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ae+8Op7U;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487238; x=1747092038; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=ae+8Op7UdExPLJAczAwp8IUHRpkakXFQbAKpamLQ8FE6X6PHGrOq6c1Q1/JqYhoJEA
         /9SSrqypEoN+K78/IYK0gwKy2sMZnQcsBlTDazS67p5PaE5yzc9kG+6F2eGzRst6qjYo
         AYH3GlDpauKHgBPdbAwNHDjxESNfM3wX7JHv4EK85TX7uTxAe7B/D7xBiPQzsR0xsHVd
         Qfpgvtu3F366Uz/ME56c7jaXPuH32dFacl58ZDJFF5lF0nJqIFgZBIHYQjIQW1T/lmRM
         ltqLN0RsUxcfXakrmzmJzjvV4uIOCYGvJhVEzmkAbVOUrdcrIj8Y2N0LZUItmQj2zfjW
         S+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487238; x=1747092038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=DQfxhV4TTtsyHTMsNNEj0Hcv/FAD/lzbHMxz/guviLa/v+dORGZtn11g1Lhi4vLUqP
         D4nUeya5zvXesSISG47+uP7a/cI4EWlwn27EznVgo7h1Olt42YaDrF6hrX+gcA5kbpZX
         xy+jadRnp0zjTpQCVPuFuGKpokYKBksZjTuM0gZ5oMwXF/3w+i127qwW5Yoz1IaZNev4
         pb7CTMHHZ6Xg59FD6eehBE4ayaqgGNY7RBrqv/R0F8WWvHiTpJmdUiO/Rq2ea5vHkbkU
         Rd+NQLgpr4Fl3SG2AfWfRaSrFoJ5i1eaaYTg0YuYPbeqi+jIv7hWLi/VMr3aSATO3oQe
         5ERA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+e0CeKPjRDRLuX5XITNUrVKT9QpQaLKZ2l1QYSbLFuWVQBIJ4gYZlZz1aYfNYDR3Ext0OB/NrHziYg==@linaro.org
X-Gm-Message-State: AOJu0YzifyLfOjIpZftH9Aq2tatdjCmCLfr+KFzVvHwFiOxA6csquPww
	NjexQwAgsmhMj+hSjjyJzPmxyULzrd5VRPNk9xYvFoWEiNNFTB48BDskn8NWjMSZiw==
X-Gm-Gg: ASbGncv9YwWasj/5ZZYUvfrXykzuAuF4EWKMCRtd6McRZd/Eqm1FEHAN6OLnY4YJwBO
	tY0X2XJq4OzDu8LdiESwRCyNDn7Osxydafn8ZpIzSCOzridsbZCcMAHoi04koNlZAFjB+QaNg53
	G2mEXX9hKH38TOaTGezMIGEbGOgohGMtmIM29N+O1MSkPVjcB9MnSz3kUh0Rd36yq8wvuFLhvKU
	wll8dvXS4FGmJWiOsicQ6X6lXNccqoW+TI8Lp7qNsg9YxkjyXezh7Iu/p+xo/qJ7BsMavRs2D5I
	to0B0TujtRQwVBFPVTNoa354PTtPjumZfFzyylEJlHvyRvaZ2rQ=
X-Google-Smtp-Source: AGHT+IH20d9iUdXCOHxwG6SI6Sy5JpqtCCPeA+IenO/oPeRx9XNel85Y0hwvj9DAfrOx6h8FyTp6MQ==
X-Received: by 2002:a17:90b:584b:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-30a800a14dcmr824679a91.32.1746487238401;
        Mon, 05 May 2025 16:20:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 20/50] target/arm/debug_helper: compile file twice (user, system)
Date: Mon,  5 May 2025 16:19:45 -0700
Message-ID: <20250505232015.130990-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Eu7Hx1+55hWD

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index de214fe5d56..48a6bf59353 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,7 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
   'vfp_fpscr.c',
@@ -29,11 +28,18 @@ arm_system_ss.add(files(
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
-  'cpu32-stubs.c'))
+  'cpu32-stubs.c',
+))
+arm_user_ss.add(files(
+  'debug_helper.c',
+))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(files(
+  'debug_helper.c',
+))
 
 subdir('hvf')
 
-- 
2.47.2
