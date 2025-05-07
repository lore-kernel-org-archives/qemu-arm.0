Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94269njb;
        Wed, 7 May 2025 16:42:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6qK8o6GuxiIl8IFEu0xymVG0EzOLVwt1ZYxszSrqbG5XyiWYfJqbfu4tTlkyFxMKlMreRMQ4bKPmVcg==@linaro.org
X-Received: by 2002:a17:90b:4c48:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-30aac18373emr7230839a91.7.1746661370893;
        Wed, 07 May 2025 16:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661370; cv=none;
        d=google.com; s=arc-20240605;
        b=R8CN/76sbrRhVBIudc2rAM9Z8G0UFBeCIQQvY2lTPRdVKonb9DiByC3yrI/ny32z0+
         lKUJNWhLhDtZJuTZkl1wNYwVx7bdKdmxoF+Qa+2yDbay9LmQ7bfZwNTfUISmoC5IQqkM
         newaPPTVNgxZh2oPUI/kOdYIYGP4rKBnifedx2iFzmT3oHuSsX/3Q1CCtFMSrln8q3v5
         B8N+zkNSwtBAG1BEdXukqwPWZwwer0u9Q0Xd/wLRmJBsXoRRoQZlpW5MDVGbbObnzKHB
         UTyRvMUk+GIw1F7r5DFtFCvkAXy0cFtK/Jh8308rtgPph09YU69cQ+fSQqInZlWFlN++
         hHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sgtD9a+F/fV1o8g6sPaSIZoYXGKqR0qNW17PKpxFW74=;
        fh=6lB0vTcflE2LntXFeuBzNRkZ/+bOriP6Wx4PE1j3ihc=;
        b=TKbBGp2lIIsqcyf7DCQgk/Ow1MlS3ygxROXoqmFmOlfzwxPjYaLcKkjhrciKm6Rb2Z
         H/pSQMqp5Ioe0euJf36aJnrt2x91OKWuIwTwh0X1Cz4i3W5IVhjmg2CipJeMHT0H/wLd
         1a3QwJ2aOCGCNkZSOdzFWi4+iCU3GqZS8aRsq+4VSl4QZN2DT3p1fz8DdzgiQ/whJmdG
         4JYOfz/Lz/WIImfF8egPIW/gloRhZBZmesh8HZpncqytiZiFKyoN6ZMCiPXI7s0Ao9hQ
         9ds2Vbfq2yL1zikp9lte41eMR3D3kiFBdkppYLZaPCFcF2ri7iPJiCOL66fBcNcGYTBs
         lAyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ReWeaf4G;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30ad89b709asor679224a91.6.2025.05.07.16.42.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ReWeaf4G;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661370; x=1747266170; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgtD9a+F/fV1o8g6sPaSIZoYXGKqR0qNW17PKpxFW74=;
        b=ReWeaf4GL8JyhDwtyl39DUrWlJYb51wkCkJ+5/hr+KAxCLsJr29W4d/SBe9PmPKVuE
         Z6BaH6FwHadkzCv8/bX6rep6kNVB+u98sZS52E91Q+H/SrwC8T2L7JE3zaCKfyEmtalS
         9t1UVwzzp6oQ4bS6AsbZ63aTZy8qGb5jZitqzc6eVMR6N1p2OLxJWLMkmEusGzJz/tEo
         Eiy2VHgv2kF6bZKmPoMPyiVjE06sEpQ+zznlrrE/Kf4WWKU06S8f33ZeRFJUE0xb5YzE
         0KIUhTA366lqUG5uPy26rGJH7eJLuHUL80kvx8dSVwYLHF/NcDxyf+rS7p1BpgWb6W3f
         kT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661370; x=1747266170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgtD9a+F/fV1o8g6sPaSIZoYXGKqR0qNW17PKpxFW74=;
        b=qcrNjeLQO06c5xNgtUyvma+Jx273YPxDCPDLOAeqvyYIoS1yOb3WQo6I0XAAMSmcZw
         xUkisfUTkT5JdgEMR/OOKFbe0fCxmgXVD9K8Rjf4ldhm4eMGegVP7y3gTG2eRd9R/sdX
         S6+IlluZAPDP/Mf/2y0ssrEuG/HY6u54IfJunqNnt90enRdA8i+TudZIyfqSFsKRnde5
         SywV/HKGcKjALFHAbhArwdYUoy41WxTkLlvLKh6zfwG6Tvoe/w5V59uQkHFzKtRwKp+M
         LaP/BsI2odtR1kjr13XJfP2vSY9A/Qfu8PiFoqd8gNivVSAaMTxavEbxG2/4Kiyf7VJZ
         8wPw==
X-Forwarded-Encrypted: i=1; AJvYcCW096VSk2nE4XBen6yfVGlAidfNGLGeDjLrAlZzuTnpVC7FJa/smphu0jVxmImONKqQ8P7yco8iBC/F5w==@linaro.org
X-Gm-Message-State: AOJu0YwSKC0IGubD9+5rhd8givCqkLYKUZqOps/Apv9/jIW+MeCeTVvf
	HEitnWNSVzNkm4Gcmtsa+/Ns0JAzPWWEKiWgaDpnIpHU90j7rnCBVwnLQwDs1QgPTQ==
X-Gm-Gg: ASbGnctCCYNd16AG4THO2mTJKDKeCtM78h6tuEpIORWObA6EH97zjcVQJ2D8iOkdQIE
	AuW53uVQT7hhJY7Du5y1L+rGqRjm+vTO0EPsUYW5ooIHNq0hdmULBcpiEmQzsJUvN6y94i/J/g3
	6YGT2R1d61R5kdkdo9gzNOQSahv98u3fWiaYQNu2F8WggAuChKXDiGbr4XxD4TVX4x3fUE4L+GY
	mnnijb0Ioh/b/AdlrcLrA6ctRffYK5aUGHV4JySJ9qw74hbXb9CVr7cq5nsapKpo+Pgc+Aaa/l2
	vPH7xBUyPs1fd1YWoPaEqcc62vmapsf77hydoSnJ
X-Google-Smtp-Source: AGHT+IFpfXF464QoGLu/+GuZuBU0TJX3a3vlbSAcU4c68XYKCA5Jxjh3FLDVc+LLIUs1T7RyGLYtfw==
X-Received: by 2002:a17:90b:5105:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-30aac183ba0mr7012520a91.3.1746661370425;
        Wed, 07 May 2025 16:42:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:50 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 08/49] target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
Date: Wed,  7 May 2025 16:41:59 -0700
Message-ID: <20250507234241.957746-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qGgQR4DLyCM/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d062829ec14..b0eb02c88ba 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "exec/page-vary.h"
+#include "exec/tswap.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -1171,7 +1172,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.2
