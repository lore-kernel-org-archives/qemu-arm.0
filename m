Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583510lfk;
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr21268945wrp.56.1639249916100;
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249916; cv=none;
        d=google.com; s=arc-20160816;
        b=bQa3p/Cqox/2YvPboWFXStK2dPvF6aS0+GW/0gke8H4dYhlrM6sJOXbd9177Wc3pvU
         /7JfUgtFa4Tomeb9QLUPfefXhecdVZzpomLkbGnwQkoZbkJo1fXwiIDlLUmsdJtjL8Kj
         UIo6TzefWqQeBMiuWV+96GeJO1Egu5TqTeWpRVzHx5pLFeVTrNiD9JpbqSL8tP0UOk+l
         gnCcvuE1JlMxkQlTVbBwzR7RQJubEhkD3EqvxBPLrosBkmwep4C49xWvfFWu4VpSRJ3c
         c0BzHG02fXzV7AC0ekWLoVGW/OfX1kCKaqPcP/J/iw1AaNMrJdARr5nFT2zXNZBd7pd9
         EqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nosYSlY6B8BjGiEgE79mxQI/EMOO+ggHFy7fpPzljqU=;
        b=lnpUAaGilRDMWbqkMZURu8eIyK1T7fIXF/Xb+bs8ohefvzQMfOacrhe41GtlPFXFJW
         E0TQY3kU9V8+OBsoddO4LjzlsBOjg3YyqVEUcbZH3ESBpHOC/X02RuSVTJaZiDaOWLCA
         AnN8o33ezu4idaAebgDJMWm3JV7U0ATnvl90mYhk6u//wPK92885HnSG9CmCtPbpwyvi
         NhUnCP0M7CFGiXx1BLAy2VKukjBDeMOJMtPshqS9V6XUYP3X50M33BHwZlKxaPJ5xhwz
         ss280exfkPGRi9K7cECheNVGF6Y4iN0cD/Kzt4OvYhpVGRSS+bP55/qUI1CqmaYG+Jsr
         HyHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ox7AOAvs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 13sor4259904wrb.28.2021.12.11.11.11.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ox7AOAvs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nosYSlY6B8BjGiEgE79mxQI/EMOO+ggHFy7fpPzljqU=;
        b=ox7AOAvscN3ZMdOx+B9sxNJnoafh7hnqLOj9MkCuC1sjg7QwHQPl5KTtKTcWTB6Kw8
         K+Vx75qOkaL1NQhvwN0b8KZUViY8LOZhV2ZwQsziqNGVXRzs4MpxMHA8/wBs+bvcf0V6
         UCc89V++XzXJRfkeemppb7onb42NBqrWoifFKq5i06BObNUcS+MDlG2t5CSGd4CNBmaE
         nzipY7BA6oA17n6PJEC34CfatrK/1pujVCiE0GT661kzXTHRb+E+BapojNNh605wKBdx
         p7LHSGOpjyCxx1Xl+7SPmjbVgFaFLxmZdflEuwoDrU9QdkVklX1fXdAIN6+efQClk8CX
         NhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nosYSlY6B8BjGiEgE79mxQI/EMOO+ggHFy7fpPzljqU=;
        b=W0dNNeLuONsQ7aBQKzS3cXkFbgvxGDsSufM2vpSqdh2GBAPRl2bnCRZgU5o7wptQCe
         ll7nasDoMdn8gQZtolSWSuc0LNgmL5jQiPBC2mPn2Y49aRl97LqcK2KEIyq4ZkAt+HIw
         0XPXUOCcfZdY9rmvU/IKHegUoEqSYPz6PQMB6Yf70VRVPWUSlJqVbl8KhRUi7pHAvW11
         xQw2q93cXwiQdDW02DvYDcZ4LQkkhrwcXcyHkLsPNXQOzkay2bPP+frsOdK6GIZQfNiO
         8NDnCNmeIiMZukzoR0OEivIYnA2kTryswSbCX1rfzV1bcEMfs0bU14UPTgqjGhGuLtPo
         kmlQ==
X-Gm-Message-State: AOAM530uLzeO8d6mKpL7T2ckbkBpvL0hpdZI7gwD07X71zAxrnakx+li
	0nlyWZic3lmgg7SAsh60ve5lb5oP
X-Google-Smtp-Source: ABdhPJxhQujeN7d3J8wXXtQ7fdp7OFd1ePHNz4ZXPl0SyDDykSo2s4pjEL6kyfptla3H77WJmC+KMQ==
X-Received: by 2002:a05:6000:1a48:: with SMTP id t8mr21587075wry.66.1639249915796;
        Sat, 11 Dec 2021 11:11:55 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 24/26] hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
Date: Sat, 11 Dec 2021 19:11:33 +0000
Message-Id: <20211211191135.1764649-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9/KMjsjFk2bw

Fix process_mapc() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 5b25347de12..7615e9aa279 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -489,7 +489,6 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -499,7 +498,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -518,11 +517,10 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        result = update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
-- 
2.25.1
