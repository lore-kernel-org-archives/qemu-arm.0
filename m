Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087560lfc;
        Thu, 12 Mar 2020 12:42:45 -0700 (PDT)
X-Received: by 2002:a62:1a03:: with SMTP id a3mr9682253pfa.171.1584042164863;
        Thu, 12 Mar 2020 12:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042164; cv=none;
        d=google.com; s=arc-20160816;
        b=etBE69srjpaef5wgaRCiAv9rBTZjHHCI8MvPLpRSmOO3pXjXnGDyRRKabsunoMc1+0
         zlx32bLvG5V6vuwz/keOtWWXNozQfOhYR0mKXMMc/r8BMY9XU4A07nHILOyfFMDwqFjG
         IfapKBHxxhjn1lHFHyZiaSMH+p6sBz8W7sZnEYpJaPLOdes71PDIene0CKCLi/tAhQtm
         sXhdABbHn8a5auO/lkxXFIaQSBoCNWTnamzNinyQgVHSCEsWbxoStauo4CGXmDoicrPM
         bguYpejm1yR+QM8qUS2p1SyeSkMF9KRHGj8CPbr+n8Yo0Ek3M0YO5AsnKvhk5Q6ilQ33
         doww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JBLvmRkIs5r/ZixfpsDU17HkY1c+JR6WvLvqW6Jbx1o=;
        b=t5wJPyUpe632qkzmWRAuLFrUz1TgL0Pv7ayF94DCUNpJU29lY0mfo6XWIILmsVrJtC
         N4Kb00TecTnzKZFT3yWMe7xiId4I4S+uZcDx9n4r5avzoqf6iJg29AvwlE6P3u2/KRjy
         lDsDM7/P861NX3EbXhXmTduMfm1NwAEvp/TVU3JAy6tagsIf0ptsrXFhtX5rA3+VnLcp
         KPTV2hH1NdrSd8E7vp7s/wRwWPmLLf69AJxpuuygVdHBXIx00UBKByRpLhJceVKSFfFc
         3rIjJvAJdPcmIzRBU4QYkkuo2oPAeZCAtzoCh6TBmSucDx/xkNFLcNFLJGmeqbUd9cxQ
         BtIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Abh9nIy3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b6sor7820792plz.22.2020.03.12.12.42.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Abh9nIy3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JBLvmRkIs5r/ZixfpsDU17HkY1c+JR6WvLvqW6Jbx1o=;
        b=Abh9nIy34f4vrATLK4BTPz6BBAZvbS71pZ5ZszSqUMR27+Qc+okyzXmeb35xH02mDm
         isUnSqL+4kG17rO50PX5Z2GXhA2X4OOz004+7zZqQfqKHOFlpfwN+5toDXg49+ywI9Lt
         2Lf65hgUU0z2akxJqgWWoEDPy6Ld9/SjjJsBnLonFDs0DWsIf3uNAq0goz1rv8ZNBgg+
         /c3VEgp1rl2vpNggfl5y7shTAidH+T/9Ef/bz8X7vF4nn2m/rH8jfHtyG8fPjDXa/np0
         BqKBS40NlrQL1NM+TTo6nyfXhPUbk0owGVveadB+iBxqXi0WnwTsp9x/VAOb3EKsaaaR
         whRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JBLvmRkIs5r/ZixfpsDU17HkY1c+JR6WvLvqW6Jbx1o=;
        b=ruij6zD2X5COMborjqZmBLCoLbO1XfKaj8EbSO+mzHoB/N6osSRa1fIhMGJjPq/o6l
         unpm7JSlASrO39ATBaLhqC+k3CsiN7pPVHoTDOB4b7s8fHPSPSfWhQx8SwyZjJqQmPQe
         NjhqtHdpyHSlBVejzYpa8Laau+XmG/MiPIUfMTx2MwaykKMow0Bz+dSUQL8g2RZVz6WD
         REyFUt1kC6Bt/e27FO4AiiijKI2J88DPNbMAzIpQ+SnbcuV+iuAMrL0E17+lLM4l/O9/
         HqTgdj0aiBtQIvlXZj5o+xAstXTW/Q8LtH1qNNdRgZOWlmh7En0m/KulVgyqpC+6CHGV
         SVQw==
X-Gm-Message-State: ANhLgQ3d1GX7cJbiQN6XZFnROg2J3bDQXjY/04khcv1OStEwxaMz5vyl
	uv0qt9XcPWjKIskUxASUEFuPAeOt
X-Google-Smtp-Source: ADFU+vuwmAcOJBVmF2P+40EMXgJNif9lwvugy9SmbpXCqxsh2KUTrwL1NMf3Eq1W0poT/qunLc7F+g==
X-Received: by 2002:a17:902:7d94:: with SMTP id a20mr9927958plm.307.1584042163358;
        Thu, 12 Mar 2020 12:42:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 17/42] target/arm: Restrict the values of DCZID.BS under TCG
Date: Thu, 12 Mar 2020 12:41:54 -0700
Message-Id: <20200312194219.24406-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YcUs/emUCCTc

We can simplify our DC_ZVA if we recognize that the largest BS
that we actually use in system mode is 64.  Let us just assert
that it fits within TARGET_PAGE_SIZE.

For DC_GVA and STZGM, we want to be able to write whole bytes
of tag memory, so assert that BS is >= 2 * TAG_GRANULE, or 32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cb3c3fe8c2..96c20317ad 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1807,6 +1807,30 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
+    if (tcg_enabled()) {
+        int dcz_blocklen = 4 << cpu->dcz_blocksize;
+
+        /*
+         * We only support DCZ blocklen that fits on one page.
+         *
+         * Architectually this is always true.  However TARGET_PAGE_SIZE
+         * is variable and, for compatibility with -machine virt-2.7,
+         * is only 1KiB, as an artifact of legacy ARMv5 subpage support.
+         * But even then, while the largest architectural DCZ blocklen
+         * is 2KiB, no cpu actually uses such a large blocklen.
+         */
+        assert(dcz_blocklen <= TARGET_PAGE_SIZE);
+
+        /*
+         * We only support DCZ blocksize >= 2*TAG_GRANULE, which is to say
+         * both nibbles of each byte storing tag data may be written at once.
+         * Since TAG_GRANULE is 16, this means that blocklen must be >= 32.
+         */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            assert(dcz_blocklen >= 2 * TAG_GRANULE);
+        }
+    }
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
-- 
2.20.1
