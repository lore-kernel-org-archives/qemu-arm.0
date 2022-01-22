Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732413qvl;
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr8220292wro.686.1642875892208;
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875892; cv=none;
        d=google.com; s=arc-20160816;
        b=n1qp/sgSTGR/9rY/W2pCZF7EHLpWW5s0rge0prHNFHFJ8j9z2L31VoKrU6WB5cc5/y
         SkeedcwfqmvOjIB+2RDO9A9KbIgxoW444xhZQ5XJMa6t7OUmLlo980b3DqIsjLm/5n6i
         eDbanR3Jerxs7g5MFQomq+jjA7zJ47xNXYsjO8dT+UTZg//C+MMvNpZzWJVAr/+Qssu9
         ROTIWoEN2EgTp16jxQ+AawGyCxPUYbr5zwAuuukN26PCU4WDCg+z/M+mshywtKoFPgBq
         xftp+N4ggliP1y5Sw9zj5eVUR5fLNg7kp2i6gK7lmzMZ9vDjf6qINxv97Lm5AzzHHZCK
         GPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lp1oJ9HFOvv8JUdUv/7QWvh4BnxCy5Ok7f/8j3T6Vxg=;
        b=zYY7xhRVm1mb/TGGRaW8bhlorAWpVu7km0MqhK7tN4OukYGW0xYIxUd5tgbhasA+Id
         vV+H9fo4GiImY3/DmS8Xxe81ycqc6F/mN+ElJ1Rjsqww7qVH/+EpAh9tjeX7wmSrZkEW
         CdC9VdUIJSom9Cm9+HICM5d9z7gxOXYa5kz8GSBNft3n9R8iqS0TEjBFTla76H99RgEj
         RVzt1vu1OFXxU97hDC21hvBulY6k4iyjy8rK0x80H+igKKIQHoSMyQx27b7PJ95F8tz/
         Jd83gQsTODXXyDaaimT9JZhYS6oZmRmeTrAJ2CfMIcrx9SXh5ALAvxEKyFdUAFYYviwQ
         qQMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eu37rzdV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w7sor5839465wrr.56.2022.01.22.10.24.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eu37rzdV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lp1oJ9HFOvv8JUdUv/7QWvh4BnxCy5Ok7f/8j3T6Vxg=;
        b=Eu37rzdVMdIcpRW57Yo+pjUs+MZ7R8s8kyVcjaG14s8mW8ihQRHuMgbYAOgaEA+LIG
         olYmx6aS6TH2amumu3AlOhpD1qPK5Y2oJGfojKQiEle1v1CZcJbqUlh4iC3o1rQ8cMhi
         5BdYlJhdH2m1RoqPMHbooiMZi7cbWsnyXAsXJ3u5yZ5owzD/nTQeXgkpc5HeMqzcwo56
         hqv1PS4ulbuDfYpPOhbFt52k2z7K+jpad2JNpqf7KdPtqUPwNUd6Hb5r4pDBn3irC/9w
         wl6D08Dq2YkRyH/Xb4eSGAxUjw8UB66bIqimgok0fwLs5WeDEudGPkxOMWCIPAqNAJN4
         kZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lp1oJ9HFOvv8JUdUv/7QWvh4BnxCy5Ok7f/8j3T6Vxg=;
        b=BUqQBLbS2ruPmUEQ6maVNxO2ASVENlKo4cTuLLGr4xz+d2X4tBjb/TJ/bEbKqZ2bX8
         1gUNqgEJq+fpiewQSNtasBkfN7Si1ps6YbxRzYv4SThlka7W6iCFnbI7Kw9WB4iCthrp
         UbC1UNKWA/VyzUdUVm7rtkptOMQl9nRGCvSdRKj0o8ButlErK+WfQpt1z1Enu41U1a2q
         oVPnKe/vRNcFFWsF4AmM1H+9P4C2B62YHPgTrQ109y6qeUCtInwnz1wyho30I9Rapi/U
         120YmCZA/7Lwh+UU4YM46i8yv1fqz0tLV2ZheYgw/HcpDjwzR/v2L4LcuHRM/AtuCo/5
         P3vg==
X-Gm-Message-State: AOAM533GrqYPfmeTVu40s3XMFOXKX3JI3pWO/K2wt2HTWetC51nZWXF0
	yocBSDVTybU7y4vMVX2AAsSDDbjW
X-Google-Smtp-Source: ABdhPJymlfT3enirToNyVsbxWsTQoWh3gHnSbQWHXzQwRUihGy7WZ4waWDF8Lr4sPxVwnU6ZW8WKZQ==
X-Received: by 2002:a05:6000:16c9:: with SMTP id h9mr8452070wrf.508.1642875891902;
        Sat, 22 Jan 2022 10:24:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 08/14] hw/intc/arm_gicv3_redist: Remove unnecessary zero checks
Date: Sat, 22 Jan 2022 18:24:38 +0000
Message-Id: <20220122182444.724087-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vBeZGxtLs1uf

The ITS-related parts of the redistributor code make some checks for
whether registers like GICR_PROPBASER and GICR_PENDBASER are zero.
There is no requirement in the specification for treating zeroes in
these address registers specially -- they contain guest physical
addresses and it is entirely valid (if unusual) for the guest to
choose to put the tables they address at guest physical address zero.
We use these values only to calculate guest addresses, and attempts
by the guest to use a bad address will be handled by the
address_space_* functions which we use to do the loads and stores.

Remove the unnecessary checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 99b11ca5eee..d81d8e5f076 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -591,8 +591,7 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
     idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
                  GICD_TYPER_IDBITS);
 
-    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
-        !cs->gicr_pendbaser) {
+    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
         return;
     }
 
@@ -673,9 +672,8 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
     idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
                  GICD_TYPER_IDBITS);
 
-    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
-         !cs->gicr_pendbaser || (irq > (1ULL << (idbits + 1)) - 1) ||
-         irq < GICV3_LPI_INTID_START) {
+    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) ||
+        (irq > (1ULL << (idbits + 1)) - 1) || irq < GICV3_LPI_INTID_START) {
         return;
     }
 
-- 
2.25.1
