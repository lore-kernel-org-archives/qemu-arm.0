Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19532njj;
        Wed, 30 Apr 2025 23:23:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkSufLvC3QyCJOszgJL9HsuJNZhZ1f1X2ANlgwZiOFwvDZTZU4tyHrFdXJxnzmvxhrd1QiqDaoAkk+iw==@linaro.org
X-Received: by 2002:a05:6a00:1413:b0:736:4bd3:ffab with SMTP id d2e1a72fcca58-7403a80754bmr7106069b3a.17.1746080638910;
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080638; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/fRNO/LGA7H94LM5BFDEckwoXJBM66hRQgtf9+/3Y9qyVjToyx9/TlxQAQBDDDGQq
         ov05FfTUIB3h9suDrqZAWl7TflJQfCKj+1C4kRa0NsxhWIX3i0vnpA4BrbwtF3yEasCc
         5e8IfcYrxmmme3KXNKLGbwyaz/P2Vi8QBZdsVYj0+RbIox/yS02kIY9QNOGfb3jv/rG+
         WuMzPDhJlE05Rb8cDujDyHVFM3f6ENXWxJUthPQNPCIl3ZyA+j8rxpY9Y7DHd2HL7HAY
         jVWpigTV5TghGorciyaxwZ/7T9N0gUX3fb68Dt2b8JpMitDfpHTm+t2oH/HDk6AtxyLT
         oSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        fh=R5QlOShUunb9GGrFXK/MaIQ/EpK+xPRVrHlwnXzxc1g=;
        b=Zz46xGV27OH32C6USaY9bOJcZwAePNWYqiK7HOAdh5vPDoELa25Q7UrkveeLHTslJ1
         rRfKme8N4rE9bgUkz4TZKXucScwA1X8h5aMWBo46xWPh8k6EjSVEEhdB7G75f1rBx2S1
         WiYoSPldzshjWc5mWGj6CW0dAFtjFHKqH3MTbJ00rK8+ALvaef30H31y+8lVI2kXIDdC
         R1aZikp/Tv3C9F4q8SSChiPHUVZrTL6fMpq1AyhBmpAsGP/bx5XcUYE4azlddMdkcV6T
         wz8vh+/7UyB7fUCEJFkM/AtxpWSJhFqgfdGDIohXpepz/V8yMGcJ1hcY+ZNB0vKMxio8
         ne1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I//XYdL8";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9ac4dasor66417b3a.6.2025.04.30.23.23.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I//XYdL8";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080638; x=1746685438; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=I//XYdL8EAbEOwVUaIr2Z/H75rsqmAlwIGGHRLTwY1wq2J70NkYXhFQj2FAPp9yU9N
         3skOauI81BdEdUR8FyLNwxwjlYphZVoCzMFbRzHnSRnsDY1dYMmU18ntT4BqjOJ9etxR
         YTGtdDsVp1kKHuAwQAQInkOtBVZzZGHGx+MOsvnjU+UHjx8V/KVl9SDCjfFK4lV80ap4
         gmrANORo7L7ECEBs4KNY2ZA/hU3rPvWoEcVTf3J3faV+Z9M9dA33LImSgtDRCkxJMbzc
         Jp+LII7oG23PxFilNkGLhJNnWmUHRlYr1u9fAuwKXJOxKvx6PEMvpagP55TRfJCPimyF
         2J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080638; x=1746685438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=u29RQBIAoAOiMyiADXz8147eQrNeOoLikBY8FmDWmg1gwZDLPqfwm13OWLYOOvl8F8
         3dlXqeeWFUcOw6hU7ejPRc1LfzHaHFLhNkPDARRq+be0+JRl80AcCZo0fe5sr1TUPbQA
         sltzX6oWCFK6oa1n+xMdDfBlwKYV+zv1eh7Rwbb/TJvi4IpCE7iDrIUCTuDhWiHMUBxP
         SPHF1J6G54qmxm3xlsW7k6/xHBAJS0B14lBYYXcojn6HNf/MBHqWmXmYwYqge3W+fOfV
         FIxsvKFCsxe429DbVSS2p5HxaaL6o3coY8yNYWBrooXbRXIj5HYizzjE0f/Y/BSnvt86
         TUMg==
X-Forwarded-Encrypted: i=1; AJvYcCVs+mMUACoV87PTur3djHuh5BvrW/F1LsjpLaTQlSTNpMAWE5nf+ivS/MNF0SdsPxIpEGwO7bqOSXL3zw==@linaro.org
X-Gm-Message-State: AOJu0Yysn/QfUuYoF7HPjbkdtEXsLpK+WNScvE7uRJm6gzQcuWcAweXG
	cYJ6mfwjChMCwrMkIbaHw2I0K/ZC7v/KsVq3v6TkTm0wh+mB0SGtJI5Qa6t8JUmtsw==
X-Gm-Gg: ASbGncuU5BW1kyhV8JkdpShS+lKOJl3WpV7itGD2Hp4I0iVWm1jNSw1iI0sJXx9r4+m
	z7Il+mIi86xMk8HQzrQbhqd1KLcRFOlrTSb4HJXSW0YhGIDKh7cJMfd6np1wQeIdVqdgO/ZaHMb
	u8dcTS1lzxdlfNhEIm9F46P/iL3vlguxcyA3ChSuB+bkJntvqfx7tvxlGvu+xm75fRxbrA1e4wR
	mryj9iNypT0XUtmblnjBLhS3RYZvJ0WY28o32lyhSpeVPcRYzi9Gi/hX1OcNc+KHTrWkkJKGEh5
	hCStDMnSkcNP4uFZbBglZIgGP+U3Bf5qiDBiIZCF
X-Google-Smtp-Source: AGHT+IH613J6jBPOj6ZjFX3LRjtYIvyadYMSVvpnBOyMYotPgpUzTvOi4tNvNr+D57Mb3NRqdNtA3g==
X-Received: by 2002:a05:6a00:21c3:b0:736:2d84:74da with SMTP id d2e1a72fcca58-7403a77d3b8mr7327701b3a.10.1746080638522;
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 08/33] target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
Date: Wed, 30 Apr 2025 23:23:19 -0700
Message-ID: <20250501062344.2526061-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /VpXZIy+aHI2

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07f279fec8c..37b11e8866f 100644
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
@@ -1172,7 +1173,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.2
