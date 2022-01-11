Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800958lfj;
        Tue, 11 Jan 2022 09:10:57 -0800 (PST)
X-Received: by 2002:adf:9c8d:: with SMTP id d13mr4653124wre.347.1641921057403;
        Tue, 11 Jan 2022 09:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921057; cv=none;
        d=google.com; s=arc-20160816;
        b=Q06+NBmXNC8UO+BXZUY1LzaOZNIm794K7rnz17fDmRtRXqLNjSHvJTJ5bJwngJFJQ5
         uFLrv9EH6rSQHmqF6TFMIDYyvOMIItLCG8Kwl2NthUeoZhHdjQfWifc//pYzGblUizR4
         FAVY+lb+9VQvdLL6t5N3WNnhsgDzLPLA5YiXqG6tKJVbGDlBmKI+6E6u1+tRbYBiZNgd
         puxpQIw0OTiXX3hsyFRckSEysZiIf5JszQ0GUGurk5H7Wfirvw3R8nDxhHJoxmfjr1KA
         h7oCnrUhreWrgqhHMeese4wLJtrUkb5fre6gB8mWlFMOKBDsOWqt4YL7kqqLl6T9TuzT
         0Uew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M+19OihughmoJEL8u1lX7s3OdjR7r5E5GvgmNdTNC5k=;
        b=PK9NMFCYIWBYF+z4rEf0NRJD4j1ulAP9dvHvikgIoa8CbWGwYs4JV69pZIwlNnB/y6
         QvXQxBmTRNDEd9jtoPQUux5V6CPnVNzXrYf5q9MPGJJ7r6NM12zp5LkngsqEx9oGjAo5
         hej35d934A+Y1Zqh16qB84atTXOSw0SeW2Vbl0haZ+8jCiS9UX3GKJIkuYeGwwR6EwA7
         PvPyGJMYjMWplEYUlbCy63txjYbf8tKfpKXPlV7FQ0V3m6/rhYcnOWY8FJWu3JlZ2sT5
         VHCuOcw9U/aTT74PO19+dwYMO/cisVMlawofnVXdnfkdoph8g2PyV0Cs5OkHz8z/NgTJ
         A4ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcnspWi5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y1sor5563488wry.25.2022.01.11.09.10.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcnspWi5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M+19OihughmoJEL8u1lX7s3OdjR7r5E5GvgmNdTNC5k=;
        b=NcnspWi5FCgsfZ0IvLq/25en3LBApDx+u0lRl8aY8aUxyLL+QdyZKubivzOt5frFUq
         Uk+lrymARDw+sCAmIahgrzWmptzHJoMfwdbLdRYtLdmfDoh3enkZgrQM5+SGIeyXxtq1
         P8+lhwepXlXno9Ku6d3+WN1u1AJE7ZxU198Ug047AdyUEaKxg6cSJo1arC7MtGLbkBbz
         4SrapmHJxM3YY2ex1ck34Egxjxfaoz+mGvvsxG0DyZ2QagP/m/NZkoXFAVLnEc40gMI8
         +GSr4IZSa7SoHnJMa9XS6d0VjOCCnlGO17bzH5oE6u59IjyzRjT1F9ve+muZZ+grWkZp
         ztrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M+19OihughmoJEL8u1lX7s3OdjR7r5E5GvgmNdTNC5k=;
        b=5yRGmjjjJ3BIf2nryt0zFk2RYPK1sppLpsSRZC0NBIQ6JhBlPYR5IIrJI0+oOgzQ4B
         uqADIDQYOZr9F1kmjeLn2WLwbWkFu2gh0DSFuDxqmBl9ftXroUVqLr9LibTjyUyITIrn
         unPeZaH4MaaE6B0/pFehL48q95mR1/oErr6XCYIa7PUFJfOcPouOs4RWMpCO9GxgJy7P
         CuDJaW7kJNgE4zLFPCCvT3VD/RETVgUQXB6/NBnlSKnBng8TP+ARyHG55Slbb38tDUDG
         HTx7JmxV9HgkvI9U/kYPc6L15W/bzt5SiE73ZdroDqa0sUT9pjt+wD34vteDojZRYLCO
         QaHQ==
X-Gm-Message-State: AOAM533JQ/jERP1p7GHowhiOM82LYezmK3EB9R9Wlb0G/RoE1ODSeXog
	RmhNRC3QibOMbIkMPVbcovnhy9l5Wti3K0WE
X-Google-Smtp-Source: ABdhPJwSI+hJ+bxdT8wCvrZjCueZwfcBpeE8qa+x5MksGyRxYKE3kD7ZYmWQhr6V+UW2TTCKUaFIqw==
X-Received: by 2002:a05:6000:15cd:: with SMTP id y13mr4763157wry.28.1641921057153;
        Tue, 11 Jan 2022 09:10:57 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 09/13] hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
Date: Tue, 11 Jan 2022 17:10:44 +0000
Message-Id: <20220111171048.3545974-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pRzoUCeE1iXO

Fix process_mapc() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 010779a9fdc..80ef4dbcadf 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -491,7 +491,6 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -501,7 +500,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -520,11 +519,10 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
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
