Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782234wrv;
        Fri, 2 Aug 2019 05:26:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqUGyAWeN5KjOz31CEVb13ivthxZAfTnvfeEoFP6ICoBo1jU2mrZ4iMHaxZNS6StpcLB22
X-Received: by 2002:a37:4ac3:: with SMTP id x186mr86946145qka.138.1564748777793;
        Fri, 02 Aug 2019 05:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748777; cv=none;
        d=google.com; s=arc-20160816;
        b=Rd+hPjVLPVmAhrbcTzuoiA078WrLuvbgAez26PJ9bO4CTv5GbNhmZoo7V0r3wRYVa7
         UpCEBAuqJnIQe+48s1Mh9txmrqW4NLmDPdSHhqJEPvtMnbB5FXG/5mWXmffg6ufCBcKR
         oi9x6BydYDWKFejub6BdaKPabHl0XCW6zsUwjF3SbR3qr7Ku6v6phfJ5igivyd71kvoy
         2qHos5Xu/tft+qBOUQBB08GJvSWrpoUt4eeQ//ILbWRLVabpdv6bHYAKQCJ2Hvhfqd40
         QBRanuCFw+tMfjd2L6CDbvuiyuGPe5sBw5M3UGQZP0Yn1uL36UVhuNkFG+eprgX7CQl9
         FcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=X8qNGt5CkhjFbym2pGZH3vYA0XLjZeqNXOs1F4nwU1w=;
        b=Gac/BwSPnYMTBolmIcZszWBGbwnG6Lb9Syex07t470m7B0rMZqgjWfzoJHKCtoFfWy
         q0IJB6HKSk4SYGHgKfq5hAaWan6OEbhFmaMZwGpMFNj66FPrX56zlA1VZmHxf9Yhrafn
         GgQgle7Y/Xra2U+g7SwDeq7A0MeqWCFnWnmNLT1e3BJ9ku4N2vzVkwpHiH4eMBVNiGA+
         thc84P/somKX2o3wZ0qdP/ggdQFOlKKwAwPIh1AS177AT4sGh/0g9RzQnVz3clryiQOK
         w9FMj3KwhEosPTYRbSYdMVjTMRCk8s+pLVAmrstcAHOJ13hyJZWSIXdmVEQeKdqpuB9E
         0yyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p10si41425971qkm.345.2019.08.02.05.26.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0095330224A4;
	Fri,  2 Aug 2019 12:26:17 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E79A5C205;
	Fri,  2 Aug 2019 12:26:12 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v3 06/15] target/arm/cpu: Use div-round-up to determine predicate register array size
Date: Fri,  2 Aug 2019 14:25:31 +0200
Message-Id: <20190802122540.26385-7-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 02 Aug 2019 12:26:17 +0000 (UTC)
X-TUID: FyKSVHS2qiLV

Unless we're guaranteed to always increase ARM_MAX_VQ by a multiple of
four, then we should use DIV_ROUND_UP to ensure we get an appropriate
array size.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 94c990cddbd8..a3300f3ee7d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -195,7 +195,7 @@ typedef struct ARMVectorReg {
 #ifdef TARGET_AARCH64
 /* In AArch32 mode, predicate registers do not exist at all.  */
 typedef struct ARMPredicateReg {
-    uint64_t p[2 * ARM_MAX_VQ / 8] QEMU_ALIGNED(16);
+    uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
 } ARMPredicateReg;
 
 /* In AArch32 mode, PAC keys do not exist at all.  */
-- 
2.20.1
