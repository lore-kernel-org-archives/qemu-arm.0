Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800970lfj;
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
X-Received: by 2002:adf:d0c7:: with SMTP id z7mr4699226wrh.236.1641921058129;
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921058; cv=none;
        d=google.com; s=arc-20160816;
        b=t/6yU1ibgQdV+R8UysXLG7AEFtUAmntnWVGiWyPudVF7SjWMIQvuXD1AT4zrf/tLOe
         QggYp59QuTOmI11jmly6FDSWazAHxTeDu8kBK4kqF5OVc+d57kGk6kss65kOOR6z4lNq
         9X5mglT7rIeFMhczbK4+CB3qxcYr8VfQEsrRz9ak2qOMCcUBCDadQeOd0nJWTR0FO5qH
         2Cyh11CGX7k6KbwCL3vR1pYlBj4tQ/eFTE3OOqtOinF+nZbJcZRM9CJ2rj0vTALnvZsh
         bsNI0uSC82m/Wo5dxMNUN/OMmrcqpOArRTH7L/cE4ve/BT6PDdSxVOuZR2fBXRVBnt+M
         tLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K3C/kFYJ4QIEIUS4ZNsrIp8SeCMyQxIhNuKfg2+o/Ik=;
        b=E6ZKwyCZFPn7EvFOtBdwXv0zAEtdffovDzqu5F/DUzn10/vdqbU2gszFKFo4xn+IJ1
         lD7wXL1a1rjgDjMHNAe4wy8MvU1SLf5oHqbZpJjNxNc59E3hdtqnTfhTOFha3N9pCHUk
         JmmY9sl9XHGmzV/xAPo9dV/gnvVsgVl9YYFtnigCgkE97bTN2FUiTOiZG/t5OUPw06+p
         SBz03E7/feQRqezoeSloLBMkSfZW2C8rYOfKsSvsoSX/TGv0zlvmjphZa24zj/TxqOJp
         eJEqM8typ1++fowFkuq3n6DuHE0gegX+OKPGB/kAJfSafERl77pwY3oo9Cq6C76kQRoG
         eFmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y7VCa6wd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id az21sor5682127wrb.59.2022.01.11.09.10.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y7VCa6wd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3C/kFYJ4QIEIUS4ZNsrIp8SeCMyQxIhNuKfg2+o/Ik=;
        b=y7VCa6wd0XAg2p685ZFaOrkrHBL0lZ16qiWl1hmgnpFEuNl0OfJW5cxFaIyZaQ8J0H
         7yMZsZAJfA/XiIZ9N3WQwjvyhKB518gffWz7yl5FqXEYvBZWwoYcRW77PPc1a8ZJW0eF
         FO4niUwbqAvz8aDWnxV+Q6wSZIhdx5yCPNI0p5R1742lxLsyHAYaD9gWcB6fxqUeKFDB
         JNmfhJEuHatpWiWxbd31RCPTLwOkbdAPp27b32PRRjYy8++DRQ7ETECsGW7r7gFfJCJk
         mL9u2bdD3iGbCVy8kUsoHIYjeK/+kIPvKeSyht7THnEq5oF/ULBEwspguus/GBoMBdnb
         7LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3C/kFYJ4QIEIUS4ZNsrIp8SeCMyQxIhNuKfg2+o/Ik=;
        b=DEsqoYTXinZgzrL0vT5hGNbws+gRuPiD2E4i7NPhTHNiZvPh1HeypPUwEnV6CqZU+j
         eYm9oN/NUNPWnw3xmbuPf3+8/JQ2qxj8Xkg13M32vrxHIXEMCBMACPGvKEBqUYS0eWhx
         uKpB21QDzBJh5uDGxI7oWgBxfRv8A3VqEkGZgjCqRxOTeufbG2RxMpRhauqqffQ6AQY8
         6186v8XaYxAY0jnrIzCaT6Nha6l2MqZXyEGoZBiXCOc91x/2QVXQwvwyiHpLqAWbEEcY
         wQhSwBKvYBbhWO4UZLDOTSs2ysH/4LZwpYL/+lwv9nR0FDWM0BVjW826e7XD/gcpqC3u
         t/rA==
X-Gm-Message-State: AOAM531rBljkUvxbf6r3vq1JRgQDR+3wyjdH1GXILXPePFvqwQeq++J6
	zwpTEQ5tAa36Qb2TbVYf+0bQix+y
X-Google-Smtp-Source: ABdhPJyycWI9z4ECuzRcHLgpjusbTQ6WQxy+9sZXqod+9Kdkw7tHbHtflVH45+avr5fw2/54Whr69w==
X-Received: by 2002:a05:6000:1d89:: with SMTP id bk9mr4525198wrb.561.1641921057733;
        Tue, 11 Jan 2022 09:10:57 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 10/13] hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
Date: Tue, 11 Jan 2022 17:10:45 +0000
Message-Id: <20220111171048.3545974-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EzouSYXC8U+j

Fix process_mapd() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 80ef4dbcadf..917201c148f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -597,7 +597,6 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -606,7 +605,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     size = (value & SIZE_MASK);
@@ -616,7 +615,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     itt_addr = (value & ITTADDR_MASK) >> ITTADDR_SHIFT;
@@ -633,11 +632,10 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
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
