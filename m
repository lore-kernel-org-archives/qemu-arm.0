Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583517lfk;
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
X-Received: by 2002:a5d:658c:: with SMTP id q12mr21758024wru.34.1639249916739;
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249916; cv=none;
        d=google.com; s=arc-20160816;
        b=AtfZvd2HrzaOvurQqmtOaWmUZVDLdz4kXPkRo3mXiPvVFy2f2gcYFSKzsOTAj1rwZ/
         0YYgh75tMrFeRJ0kfcliDMtK7wcqBLEyUfkWdo+dyZvekJAWpRPZYBewggINXy/NmZbb
         n4juB9TjofRxoi/UazZB+o8Usj0J9nKw5SqUsSM9vmVTVcavZBdvh2ElR0fdKjCzEjAK
         1O+BsAp/S2x9RW1oNvlmVxi1toZ/HqK9v+UrSIxJzM1FdXHiECvdEALSEScRuqDWes5K
         ZFSkeQJbM7nGItu4j538/ieoFsFOusTlMt21hK3VmtQR3+ZrF65NgJq0YtvoB1lkbdZB
         3RJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rqSYDsT24wAOvcWNZvFNMbKq/OKjOlcWYuyMyuVIt6I=;
        b=kaI2jAUmn+OIJr2qD9VdEmhXDZDuMva7o/+XJPAhFzKz9ATMkg5MbPeap9OzkK10VH
         ZJMrZvl66vrvcE//JmeA4WzGxGwzj1t80h9cckjoBDeU6Ekgb5Mk4Rsv7MAlepuqHJUq
         ZAmhGD2FPthsfgpKrJi1ufUZLmyaxJXYggz11uOrM9eKnToxCV/KISANF8iTcg1qtyPT
         KbRKKOs7cGb5Nmh1DjQNIwbHQN0fsX+brllHKsHOHHoFBjnAScXHutFI44grBIyjWpzM
         sJaR9oUSOgADJ3nzxkQ3MohC03EYzgKEhouVmyQlm6SS4vhwECTEoTMZEyIsBbWdZgI8
         oCFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixwKe8kb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n15sor4353105wrf.44.2021.12.11.11.11.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixwKe8kb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rqSYDsT24wAOvcWNZvFNMbKq/OKjOlcWYuyMyuVIt6I=;
        b=ixwKe8kbXxlNnHCxYXC/0ra7c71Tr0zEhLjZrIqGsZ3S8B/7sjtQ+jV9QfZGkGFA3D
         4AAQU5ZZLE21Hr8NHhHT7e52vfkEYdVs5u+jmqi4Gq7o3Quh6Z8E3rGBBw6ppWbaKDL5
         lww7ZvAIr+EvMUnbG96yt0G2HQREbT9jAqYdm9jMiJXSFCSRDlCog28GTr4WSv2g0Ot8
         YLUItzd19lbmJGO1stHvKqILv9/wThzgbEEQt2wknnM5jfX+in0GUUGVb6k2WHlv1Bu1
         89F8Ql30fIJuQrrdDGEpavH05Dg7OX2KwCetFynBhjTvc4+YlVUPNsLb0nYcuGXYC5nv
         +EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqSYDsT24wAOvcWNZvFNMbKq/OKjOlcWYuyMyuVIt6I=;
        b=lgNIjYx3UHbBZ7kfWlH+ZLFUbxEMKSKu2woyqG442ON9ZtXAiijgfrcyBMNr4Mxkw6
         zFzrwmjPb3Inf/rpvw7/7I5qR9GaJDPttmgJUoEnbgIG2PBOupOnekt4w1XUbeNGJQuR
         YLxNHN7KdKLSF7c7lVUQ7bJEuoRhyrB9sz6oLxFavBgpYeq58/xYrR0/nnUyMClD5SWm
         v9GT8pbgDQovNHOkKRb2k3LB3B6Jt7FwFUTgT0YNzde7FTF1goNba1+NVD31sG3Guv5d
         Jrs+MfsH3r4v1WNmrVKMyAYIJdFj6vPQKyfoRduEKt+2aDTBamPUyEMOI6QnMaLpWq0S
         mq6A==
X-Gm-Message-State: AOAM533GnzZSFrPZVeY1tl5C9/6yRs2nbN2OT7tr9rY+nSju/xenDU4/
	2PnkwM378CZL75Tj+/wINxFo6d2r
X-Google-Smtp-Source: ABdhPJzNTUUdQwPAcnW2X3hyW8WnJFypcILF2K5gMie28TQ2wkYfW27gn5uuNYB/mrfaL5+UvId1Sw==
X-Received: by 2002:adf:facd:: with SMTP id a13mr1953911wrs.513.1639249916511;
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 25/26] hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
Date: Sat, 11 Dec 2021 19:11:34 +0000
Message-Id: <20211211191135.1764649-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LkfD+dFxLHEc

Fix process_mapd() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7615e9aa279..3bcc4c3db85 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -595,7 +595,6 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -604,7 +603,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     size = (value & SIZE_MASK);
@@ -614,7 +613,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     itt_addr = (value & ITTADDR_MASK) >> ITTADDR_SHIFT;
@@ -631,11 +630,10 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        result = update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    return update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1
