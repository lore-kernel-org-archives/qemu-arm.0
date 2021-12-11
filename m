Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583497lfk;
        Sat, 11 Dec 2021 11:11:55 -0800 (PST)
X-Received: by 2002:adf:ec89:: with SMTP id z9mr6770203wrn.645.1639249915296;
        Sat, 11 Dec 2021 11:11:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249915; cv=none;
        d=google.com; s=arc-20160816;
        b=X94msYCfDpVPaaEmPOH5LmVk+hZHukProtbaJU6ACcxmtiO8kt52rhBG4bgxmalxd0
         dCPCkdU9gR/FjzmnngTD8WdQjwZzO70o3Qb9ED8SNf7ecaqW02jyAbIBfngY7nCt4noN
         X91t/KfInS8cJUy/X7ExeFOaRzrmRC2Pto8m1mjSKr8hrsEjuOtinHnEW4u3Vt3MsDHW
         vTslGQNkHjdWbGOcjksXNMHHacCIbvR6K+/OzaZe4kcz9BbehGFl7NNlLkAPdBWVx6nz
         OCaeyTlAVvZGeT6kylnneybrvM6Kh9ALEC4yqZ70XI56uzlo1UOiLchBCwQiTWiDZO64
         MyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RZRdimySV2tzC3ZHoL/w1SnZpTEUgmFudXJ6uGktXNE=;
        b=bkUxRrrvutzrQkc1YRkidCa4rdeH9yG8MutLov8p/BVgxW9Wyc3vzqX+AiCZb8nVRZ
         EShD7wimHfrlpykrs4FOcO0m/VciuFsydaqdXD5/KaUDRmHFWeeSZ1UsaOkRd/wt7Md8
         b4bMPsnZi/vwvWkXlwO0w7Tw0n/Q8Cd5j1gCA4OOU2r0ES0RvrWOTJgcGNEogxRVrX/q
         M2BJgWVytcLKKfTLYAz7UdPO3deTrl4elEkcJAAEr5T50c8gcbRw2HfJ89E+IyBgKpF+
         CQ0POBT3DqLqLv4jefi6ds4PSdVdEJ01qKoIZCpURxsT3p7uI5CGGWXf3BwSqEEZI7jn
         kXVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YCoP3t/d";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l16sor4286251wrg.6.2021.12.11.11.11.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YCoP3t/d";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZRdimySV2tzC3ZHoL/w1SnZpTEUgmFudXJ6uGktXNE=;
        b=YCoP3t/dzGidjiJUkM3yK3uA5zmXuWnDqPBJPT/QCzpo/8n0vHlwoe1sc8cYlky0mE
         8vWDy03rqc5i9J20dOnsf03Ax4gPT5sR6SlneZhnwNN/xZNVgZFBoPEHVUoLDldgHNNF
         iVWn/3gLnFfwlys3cd7kO+p2qwY5isE24mZO2S+k/gE8y8alVg0I/6ta6Z+ixfL8/V+6
         LMpOY05gM/Qnv68dfSTghIrG8gvv+CwiuaRkigzY78cNE+Vs3+cfnf289UMKYFPMPa/h
         7QgTia22M9i91hA3QYcX2WL32sbq8spqaPeAGB22mXcSrZweAPzjGoiQKyTsGLmoGl8T
         SMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZRdimySV2tzC3ZHoL/w1SnZpTEUgmFudXJ6uGktXNE=;
        b=l2a2hAE5U5xDm+UiEPQ+qqF2EZpMvmpmiU0cxqKcvOg82enHUnqSIatA1kj1FmheCi
         xYDHgK55KxJzktxMfK6PLC5pMFkb+kmQA0PhNOxUsOqFqjcUUhrqBSb6MGC9kC6Rmy/4
         wxd6ue8s7k/ncCTsnc9fFWm8cc16xSYU7aMoCkMvKi4nKKiqTbjEkiBOwMK29769o/+A
         vI32UvBinHNBxQD5kKFK0fC5YQLiWUBZhRH0WpFYIlXbN4WG6wLM4eiuTjBpdzy9T5DB
         Pt/i+8FxrEsSr3hP1W1pjdIXRIHU3A2fHZnDIDpDTaIvYwWCkSalhbldM7YjmzngNqhK
         0N/g==
X-Gm-Message-State: AOAM5316IHiyAizvTV+wjJfkS5qvheOiBOJBIC8TCdmSlNMaFqd1U3Vd
	4XYAMbfyOzcvfMjCq9dAXMXXwy2v
X-Google-Smtp-Source: ABdhPJwIGWtIdtnIST8DH+Rs4rtBcALtna4QB+47LOnXvDW9/tIoWvTD/aZ+MM119wfQR9vXiBbttA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id o2mr21791800wry.360.1639249914991;
        Sat, 11 Dec 2021 11:11:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 23/26] hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
Date: Sat, 11 Dec 2021 19:11:32 +0000
Message-Id: <20211211191135.1764649-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uW4l9PyZ5ucH

Fix process_mapti() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 275af620058..5b25347de12 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -355,7 +355,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    ItsCmdResult result = CMD_STALL;
+    IteEntry ite = {};
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -363,7 +363,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     eventid = (value & EVENTID_MASK);
@@ -379,7 +379,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -387,7 +387,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
@@ -407,19 +407,17 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        /* add ite entry to interrupt translation table */
-        IteEntry ite = {};
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
-        ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
-
-        result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    /* add ite entry to interrupt translation table */
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
+
+    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
-- 
2.25.1
