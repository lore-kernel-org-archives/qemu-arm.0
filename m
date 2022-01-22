Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732430qvl;
        Sat, 22 Jan 2022 10:24:53 -0800 (PST)
X-Received: by 2002:a05:600c:3843:: with SMTP id s3mr5465429wmr.150.1642875893616;
        Sat, 22 Jan 2022 10:24:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875893; cv=none;
        d=google.com; s=arc-20160816;
        b=BxH4XXRFdMv1kqIt7YN80FUrX1Jo4StIL1cmz0UY6dk+Q6ond8mJUA+TkE+68nj/L2
         e7fC8ax3M+vQCU1zhS5D6cjglg2jYrq7rroly77EucVureJkgBlPZ6HSKVmGOQkkqFoj
         DFVN8N6qeEtVGp7LQcLsXTMVYa7+KBkDy548t87IqVAn/QO2HNq5CvPJWUYgHXMtLL3m
         8xM2xeh5W0iw3OWc0Lx7reRLqqBcfMEgMjXU2qPSLdgmoIPee6PMKKLFTraVeQZ9caGC
         5lVDmc09C8LoMrtbx1dQcsTUWrlDRm2Zml2nFEcxD/4bI2mPL24emW1upzEkkAxwbjgx
         HyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A9W2sZCF9TsA92jrnmPwe+qydShQXcLUoRlpZNsydLs=;
        b=Wjei9osQNhzFVYyuMIqvC7/cvYnVX6YkHlevzzzdVs0n/J342/rWn43DLfVdLiG/ZB
         6Y2MfwboK9FYuLDT5FDDD5By6d9SF7XWEBG0e/HD9xup5D6crwiV6c5YmuAP9hZW6DAY
         om4LA1trv5E3Lx8dvrOPgBJk67kBmsp6a2HC2poDUaQxD5ixCUuvJs9fmrVBL7y2epfr
         RnEWGRqtqMMqspe4i3K20iWchh9QRy7tISJ/blha4CRbsIpAY32XYMxMBPwmclywFaet
         /70qDkJ91lKYdmtakMvvA6cpd7kHOz298+O/K4mOL3Qke0urUFfxQGExxqAN8taamOrQ
         N1cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hY9qBsqe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z7sor5732280wro.68.2022.01.22.10.24.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hY9qBsqe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A9W2sZCF9TsA92jrnmPwe+qydShQXcLUoRlpZNsydLs=;
        b=hY9qBsqe5YW6mXtX8cv2chdwQrP/T27eaRN2GA+0H0NFbezHCuoMHcBbmEg/ggFIm3
         apsTcKZPhWoC9Yx6h2tvc2SNzasDPjfDbPTS1rmARjqo2dmIcmyUdQ30O05+mmbixrvw
         4/pvmcxdY8P+IjiJq2eFD7BfDyRIe3vOpjsHo8x4C9hQ707OnrNgTpQ7y8OFcVybtaYk
         OoiW3m/65A62L6CfxOUVu/4QD4ysKfAW2LoVFn7dlOUY9u3rdCpRPUD9sIIuZAWh9MQG
         f6ABcPJGtURGVrFcg45tGUhA3VMg6fzcg9LOlw9qPPLcpC977LGw/Qw6oPdNG47R/fe5
         MyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A9W2sZCF9TsA92jrnmPwe+qydShQXcLUoRlpZNsydLs=;
        b=3xuJrVRdJCpjfLmFchbQOw/W6EXgBxeFz8ClmgO2nxarho2lG2jMxN0NCUS/Qd8ho6
         tywlUvmyiNjfva1LJeGwMgkaURzfcy/XdEHdrpVkopIz/HuaBcTjEXXSMISdC3cvirCf
         i2wmPFQJfhR8ZKKTY4QTQuQQiR2U9S1VtN+EP3ZEcPFiC5EhTWQ49ChQQm0wiZ9I7jWM
         0qI8Iqk6vJF+sPvalGjq5aPg5pE1OGYKVlx9W8HinX9frfCBq3+GxogobKe8bor5wkz2
         TTAbcI/bRAxyeVmgwobgcbqqBsL7r9XMsNis3XX7KIsVdtGYP07Pfr54Hi4diypNM8hw
         6svA==
X-Gm-Message-State: AOAM530+L7OrgFKTX3RA/KVMuu3Yk0lzJOq/iwIFLpnadEVTYZOMW7BE
	IEPplUuUeDTpHLwetQq0BVwY+EUM
X-Google-Smtp-Source: ABdhPJzrB873bmslKntesPqWvrfWddSqFHwBk2gylyHQ2MXAOWI0MDsPJLsOd9+BSaKkKML454gsjA==
X-Received: by 2002:adf:f7c8:: with SMTP id a8mr8433490wrq.603.1642875893344;
        Sat, 22 Jan 2022 10:24:53 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 10/14] hw/intc/arm_gicv3_its: Provide read accessor for translation_ops
Date: Sat, 22 Jan 2022 18:24:40 +0000
Message-Id: <20220122182444.724087-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: h6i1t6kkVgbq

The MemoryRegionOps gicv3_its_translation_ops currently provides only
a .write_with_attrs function, because the only register in this
region is the write-only GITS_TRANSLATER.  However, if you don't
provide a read function and the guest tries reading from this memory
region, QEMU will crash because
memory_region_read_with_attrs_accessor() calls a NULL pointer.

Add a read function which always returns 0, to cover both bogus
attempts to read GITS_TRANSLATER and also reads from the rest of the
region, which is documented to be reserved, RES0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index d9ff7b88492..b17f2631269 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -813,6 +813,18 @@ static void extract_cmdq_params(GICv3ITSState *s)
     }
 }
 
+static MemTxResult gicv3_its_translation_read(void *opaque, hwaddr offset,
+                                              uint64_t *data, unsigned size,
+                                              MemTxAttrs attrs)
+{
+    /*
+     * GITS_TRANSLATER is write-only, and all other addresses
+     * in the interrupt translation space frame are RES0.
+     */
+    *data = 0;
+    return MEMTX_OK;
+}
+
 static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                                uint64_t data, unsigned size,
                                                MemTxAttrs attrs)
@@ -1168,6 +1180,7 @@ static const MemoryRegionOps gicv3_its_control_ops = {
 };
 
 static const MemoryRegionOps gicv3_its_translation_ops = {
+    .read_with_attrs = gicv3_its_translation_read,
     .write_with_attrs = gicv3_its_translation_write,
     .valid.min_access_size = 2,
     .valid.max_access_size = 4,
-- 
2.25.1
