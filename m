Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181770njb;
        Thu, 30 Jan 2025 10:23:14 -0800 (PST)
X-Received: by 2002:a05:600c:22d9:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-438dc48a91amr78729005e9.15.1738261394004;
        Thu, 30 Jan 2025 10:23:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261393; cv=none;
        d=google.com; s=arc-20240605;
        b=I15Ff9UqT7cpyKRUd/XxABM8wBGtccdhcyWgDGtANNi9DnGCxR3p4HS9tlmnQnZhCe
         DZRcXIsg+XVqrT7Zca1kH//r5kCQWrVwskeNkL44OF6zhiPJPwMHyxBtCq323lEqzOxS
         tHG831xwwyGUjSJZezPoZ22uljN4S2+DbZdWkIjAcnETr9oLcsxI5YZbDVweH3AG3sFe
         UxejVVgjt71QOcqpkc91xJ+ktY0GUNes7LbX40sCLneG/uWOgNRjHPJRZnm0s/WoUUs9
         ORkwDb0c5/uwJ+60cXUju/JXxXc+wNjW/Io36WPBRGMAGLc8DHT4eO97fVk9m1YCj0s6
         IkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Wlns9GOwYM2bjd4U7krW4vEiipIfGOqidyiNeaIvOXs=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=REkyWuB1WCJTAoC774cQ+Xc9JAs41wvAKnzpInL0TkTo/z6k7v/SYl4u5VwO4MyDpK
         8Dr8rbc3FLTwUq69voFW0yxIctp9CbnRb0w1tUAUIAA3UAA/XN29QnxQbMqEbnXsjKjj
         /C7tW0ndKGohPUNa6XHLBSMV6wuYo7AMF0WCR+edSDdxdU2YW9mbWMWbgvIVg872C26o
         zfFVgqZGbhiYdoTlGVMsSe36revlSHmkB5DwD7ReMzRx8FKFrix+NNV6l6vTytqjLdg0
         QuGxU7EIjlZ5YzNAxawcRpsk5gLrpKMuc8Wher8/00iHPFyzDb41dWw+TcWWVfrc5FeQ
         dyxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HCpNV8dU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1f81cesor693498f8f.8.2025.01.30.10.23.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HCpNV8dU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261393; x=1738866193; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wlns9GOwYM2bjd4U7krW4vEiipIfGOqidyiNeaIvOXs=;
        b=HCpNV8dU4nn573IKJqTuXw/SFz33UyAi0LVA7qVo7jVpnmxMURWGG3oly2Z/KpWawS
         uyGgC/L9Uy9kVado2ym/otXfv6KfuaK6YOxdRKSWPKaS2NYpGqIoqwB2r/xIZHw64xU1
         sYD1Ih/SegxucD830VF9frUcmtJ8HOdY5+Md72gtUG93RliCowf6RigVDh8pXb+u87b+
         ptkj9eYsRoApr4u3m6KKcVWXD44EXD6GMNwqd7jlgkre3mCxGTQYGg0/Hx2dRYz06zYD
         hSOGT1QapIhhwZ0RG2L9q+HnImxSrKzk2PYoBABtqsuLsDI2MSrExHNAzugco/IIGOhe
         oEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261393; x=1738866193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wlns9GOwYM2bjd4U7krW4vEiipIfGOqidyiNeaIvOXs=;
        b=EeoxLaG1ybhZeRWYqPRXUzL9/xbEoCrK4O37zJcUzhX8E5ww6cX655PTvUsFBGClQx
         5JIvS836W+OzTm4ryHL3smn4SuHHCKOTq+namOLCraZwu8947fwrWWj9ArB6ADZEgsai
         ELj+d34oriyhUFaTe8AmhSIvfwGJimozNdEJ1C6DCS6FR2Ithj7DcmQHAfv+YOxH3gv5
         2sF4PFsl7FjqMezwHNfNZYD0LsMSjy6WHgFVetqvNwky8PS7LOqHuXB3LIzYfs+lFUms
         eqdbcS7Db4BbXAK58UgALSFCJY3ym0dqJz0I+1vT5np4neaMdDUHe5d2oZj46LEEvqjR
         Xvbw==
X-Gm-Message-State: AOJu0YxDmGG+AplaU7/1apCvzjgd18jx7sOpHKaFUuRsyUqPfvVhHfEI
	1TJUqawy7ijJ6dXgJ3pmWdm+kXTl+iygmw4oOJM5unaYIwml8FNCp8DC7TVovqayFreXUeSE603
	oR90=
X-Gm-Gg: ASbGncsLYMtoNSarQX6HwhblWSTBfrFCLX1ytZRM+KGEodKJ+Y6SgVcJcF1w+RVBqcl
	6Z+uliU3skAqQyVn2cvFVH0/LwvmEMX2XzXF0G9KYeHd68txjcZsI8JUScuc1rHmPAE9repFWP9
	wdNB5XmCzk9/N2dhdjbTs8/HxzpZKOtOEEjVECqvztHbrygZVp25AFLwDJpZTo1HH95S+oSwNMU
	xjWK6iv3ybnQbfGa0OvRPro3Rl5d9N1s5oAwSJkhq6M7/NN+7ccjoAIhyJ6ciTXswNkh4aFax8H
	FYmWyhFaSpQuMzEdb0KNPQ==
X-Google-Smtp-Source: AGHT+IE2UbAKKT+ZDLAy0oJBJeXaNOHA7u6S1jdHO0APO9zbbJCdTYWh7roiFyRaiIozYNmO+XvbdQ==
X-Received: by 2002:a05:6000:4023:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-38c516583aamr7804506f8f.0.1738261393493;
        Thu, 30 Jan 2025 10:23:13 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 02/14] target/arm: Report correct syndrome for UNDEFINED AT ops with wrong NSE,NS
Date: Thu, 30 Jan 2025 18:22:57 +0000
Message-Id: <20250130182309.717346-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6xP0cdotnDre

R_NYXTL says that these AT insns should be UNDEFINED if they
would operate on an EL lower than EL3 and SCR_EL3.{NSE,NS} is
set to the Reserved {1, 0}. We were incorrectly reporting
them with the wrong syndrome; use CP_ACCESS_TRAP_UNCATEGORIZED
so they are reported as UNDEFINED.

Cc: qemu-stable@nongnu.org
Fixes: 1acd00ef1410 ("target/arm/helper: Check SCR_EL3.{NSE, NS} encoding for AT instructions")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c5245a20aaf..7ddeed0283f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3601,7 +3601,7 @@ static CPAccessResult at_e012_access(CPUARMState *env, const ARMCPRegInfo *ri,
      * scr_write() ensures that the NSE bit is not set otherwise.
      */
     if ((env->cp15.scr_el3 & (SCR_NSE | SCR_NS)) == SCR_NSE) {
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
     }
     return CP_ACCESS_OK;
 }
-- 
2.34.1
