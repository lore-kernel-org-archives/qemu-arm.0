Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004582njm;
        Wed, 30 Apr 2025 07:58:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdUySSJ0iqLDZ6cVEINlVFbO4wvXTmNwOVSjEnjsitvJHz9H5rn8upExjZ4ajm8n6ZuGrWcGeiqDdxkw==@linaro.org
X-Received: by 2002:a17:90b:2743:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-30a33c98735mr5363200a91.2.1746025138902;
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025138; cv=none;
        d=google.com; s=arc-20240605;
        b=V9Rt80fn0b5A46/b6IVrBG5NcK5gSZ8CB9ySPba/uU6AQaGMs6syc7K46cRaEEBEec
         EJ7sAvG+tSr3htvTdC2iiPTpoYWkCvfQyribwnCskeYDLcuKYrCdvPAGeoiRkbdprZta
         h4lgHQxniss0Btf7x+m3MbzCS3CSuvI2i88Hg7SKSVv2gfedSHwbTvYUd+Q+S5oN9Ozp
         rswxe0jolEqah8vIbuvqSBqeh6IFU1gdKlSxo8ZEQNypJe9cvWbF/u3pQB0mXZ+IOuNJ
         xnVMvv0S1czST6aKBG3wy4Z255bTspk+6lKopgV4tJ0QlVN9GTFUSa8ZtBHNNr4d4jQ4
         z+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QBK8LHWqvAyuwDxFuuTqDb/KWyXEAnnOTejYROwMLow=;
        fh=6rWCSSu3dMxDv1boGGWimn28Sn9fcTZh5DvfZI6icEk=;
        b=L6VTsFwByhnUI+e358nPXuDqIufhNTGY0BX585bCsy14RY6vKaTA8+itim/8Upq78E
         NXPLw2n457kM6bev5A+DxeHLLy4UwaGzsNqBPWpXKce2bSf2fiS/GEJ25PT6ZEwE7el0
         JsW7/A2IN9a5KkqMto97B1EMjo0YX2PL0pCLEuIHn6HfK+Hn9afDIbG1BrvBhlOffYgi
         VGj3jZeacqmEescbIrPRkms8teyY8Dts/AirMxk7fdiEGylTBY0Fch4rcpdGc66OH2cY
         L5pICiR98Ryhk73aIoVyC0xCNcx3aUH4ylSvmtiA1CyG1Z3EDgIW3H3mq6XGVYFko69L
         Q/IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBuCVWgL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a347ca48csor1304358a91.3.2025.04.30.07.58.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBuCVWgL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025138; x=1746629938; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBK8LHWqvAyuwDxFuuTqDb/KWyXEAnnOTejYROwMLow=;
        b=ZBuCVWgLAmco9AeF1jKEfNhWJrs18D2DZahjrRlS9CgiRSqFFfgd18fw1C13STO788
         nSh2LvwZ7KjpNPfp/2diWCagnrcKOSQf+sheD2bc1gFqIlz3l4rIGqMz28vNdaVlmf5S
         Ui+0GfPnl0keLN/ajicsDAEP9Ng96/arzrd/omwGFsEclO3sW9cQftPReB7eNuksECNF
         5CmaPqoug5TbCItES9tUjhdRw3DyMZL7x4c5L6GKNJjex29lYQuGCI+5DsCdDnkIQz5Y
         4sKpRTC6P2Lt1qzGs9XQQFn0gGfAR0GdVjlqu+xLdEqxTESpdeNsHd7b2gobzeRG0f25
         FVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025138; x=1746629938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBK8LHWqvAyuwDxFuuTqDb/KWyXEAnnOTejYROwMLow=;
        b=e3GHZtZyaf1vYW5x3Pcpz3/kl/BGJJdV8AllEot+HCSo6NF/4krQGABzquE5Uf4yOr
         cl8OQqJc7sljB6W891EVkLDV/8QzWvZsBJVBHcWKwrUWfApYLIz6VSuI+8ZdB64eceIl
         wgsO72u5tq+GScAhJTmGeLvKxfbWmAgY8Dl73TEto8/sCyPqQo5xip6M5krvgS3auxU5
         IH6m9EdCZOZZYr8SlY2QaQ/ehazB8+X0IlcQlxOUWcwKETXCzPmxH/ty8jY+/WuW6iyK
         6fRAP7jmtIpRblA3fvNSCsMYB5evzBqwflN5Wey4sSHwTX/pGtcOLzHG3E+RC+bfIWW2
         hpyg==
X-Forwarded-Encrypted: i=1; AJvYcCW2fyQKAqES4FVuzw8X8TX8eMnCzSBl4jRTrNIupDTGk93bPFTyF1rz3XsCVpn8+jrmA/VCom8EcI4qzw==@linaro.org
X-Gm-Message-State: AOJu0YwMO3bxhfc7wD2V0GqtVc6ZclXfDtZ/07mVQLmW231D1b16Dd68
	FxEaRhqXcFLRZB9QTUrUaKsiubMLdt70xA7kUfCk9zOPzVUxsTMILxkTpfiAxo5IEw==
X-Gm-Gg: ASbGncuYzDUVCea2AsRwiS7SRtCC43OeHlYDbBPZGKP7KhM+mgGjVD2coOOBReyiu16
	IPWgwSxZ6jYQ7VDqA6F6yywUZnCZ7TySi4ZQD+UDAavw6bgr2Zv5yqz8yET4eal+JYs7zgC7D/D
	wJVsm1OzyajCwUNwCgeDIBvUhpo3uFbNtS+uXJs576qGppYt4WD6hQ9hwb9DYdIKUqzc0UOJQ3e
	ESqRA+w8Rk5asWU0maHBJjZIR22HZ8zLizCtik+tF6Of2sTwzdsWFTV1XFnbqvcH0fkxcEg679f
	Ns7b0rpeoDyMEzcru+V2bBRssEGB3zXjwJ0HqGXI
X-Google-Smtp-Source: AGHT+IGbHAOKE7iuPjYSBIxBLMfH8W4TYKvNqESm7rCnzFL3W3NNnV27ZkpuMRRPW9MKndTzkiNmbQ==
X-Received: by 2002:a17:90b:5647:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-30a33d3b0fbmr5073649a91.14.1746025138468;
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 09/12] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Wed, 30 Apr 2025 07:58:34 -0700
Message-ID: <20250430145838.1790471-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7g3W0Hp55KJJ

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 37b11e8866f..00ae2778058 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1183,8 +1183,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1342,15 +1340,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.2
