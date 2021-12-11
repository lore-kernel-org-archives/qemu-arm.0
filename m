Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583364lfk;
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
X-Received: by 2002:adf:ef52:: with SMTP id c18mr21687203wrp.162.1639249905895;
        Sat, 11 Dec 2021 11:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249905; cv=none;
        d=google.com; s=arc-20160816;
        b=tKD39a98vAl4CfF88MIH6K0B7T0HYQx2M6u7LQO6tUyttW26L8NZfCB0lok6VsnDRg
         LZHVJIy9sSRjZKb4wHGLJXOE0lhX4EBegPbPNORx6yu8sHjmDzNq2ou027zjqFmHO3bD
         gKJa6Vn7QSRxYTyIyBFcCK6V4qqbvl5yO+vAuTNuFMd+yWCzpH6lu3z/aX7AEzyLRKxI
         k0IMnUctHMQWXn0w9wWtyz8hhghfuAVc+NAtMDI9fxy440O1egeS1lE+7OD3RT/NHSRJ
         FNXRyvhjdakx5W/tA3xepl14z9gS3MOZp+lcplEjFpEoGEv3x8zEEGCtABoT73Xm/uHW
         Ov/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uBlXpUi7Hc739T7tIMt8EUkZsoHbYKvygpVzCX6VAv0=;
        b=XX4RQPzS84w1txMCNhaDd42hVJflawpTPkmqgRm+zKSeaaK9YA13WXl6XEHdX6sv+Q
         BpRyndNtZMZKVkzz2EtESATpP+F3s6ClbRILSZvLaDhdK5U3y9gMAbEWco4twcXYOjhW
         M6VTQ+MD9UUem4ACaC8zm7z6d0qXDOjhqPKtQyClJhjkNtCM2j66aZTyb99tWZ9GaTB+
         05GPtcwrqegL5976SoLbOGBzryVIJmlMplzq8ny1iUAf59CpYW1+aZT73BueAKTbalNa
         qsu373B3cRE/ZfBnUZEDUmYKtIkwkOeV1/CyhdgxZwfEF9QPc1tbCkH9/YzGrxMXq3Ke
         g5vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oQg/6Rud";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u14sor4334856wrb.23.2021.12.11.11.11.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oQg/6Rud";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uBlXpUi7Hc739T7tIMt8EUkZsoHbYKvygpVzCX6VAv0=;
        b=oQg/6RudXIkBQ3sX/9WqZX9vpDw8N98BBqqt1Z9z74BWHN7QfbI2n+uv/T6I8rgnWz
         AjfJALJt3h3uZBJS4Sed090WPqQHpXkk+EUE4iCY2GlJN6TeH14iPFl7hhsL1PEq/pDu
         lBnz0NvvROBe7hj4WzvCfSoyEnxaRMCd/7ZavJyfkQdITV3Nw60Kkfi/4rbAa5f0QSYu
         O3klkX4hisf9vFTgSoyFmvbt9I3zaKTbVdOyKMWjArxjQkoCTJTjq1ovd9J3aldmK+12
         s489apBy4mJ0KaMCcPCyo04HiK9nymGggEPH1vAeJFf5GMLUFWGc019UAEEaMejcrOFK
         Ik8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uBlXpUi7Hc739T7tIMt8EUkZsoHbYKvygpVzCX6VAv0=;
        b=i/WsMRoAypngWMNfsiEoHWvv6LmVgIDkil+G9/uQhqL55wh8lAQYZ1Wz9YnVAtA2TU
         QHXOjYDmwAq+EZpx3vZhxUWBhP+s7kph/b3JLAJJJBW5DYcHxbOG3+5QX2tVawsSThQ/
         t79H9gUu0x47UODbPOooT/8tXA2avqcaa6JfED6vl23u45iKi99UYnxDQdhSJjs+c7Ev
         b9mlRRcqLI8cjOz++qxg1BSdkbRFE2JLdJk3Jvbkm8s0PRgZRo1umIpfXM4X+mZkhpLY
         8fCJ65rDC9kINPeKw7K0BNva5i3arnzPjYJPuL1e+zP8bD0o6lIQu9jV+53IKmpMNsZk
         DnHQ==
X-Gm-Message-State: AOAM531t3QrQXf3PpnvaxufXvt3yFkVHrc157hk5IlK3psNc1SVR1tNo
	FuGcbgmLnj0YPRvCPGAM5Vl3Bq0G
X-Google-Smtp-Source: ABdhPJxXPgI2LcrJ6Cp1pu3sluqPy14/n4S5lQw7TW0+SNX1/5LB3PvDm7Hs5eSXxbVpV4L79CAAiQ==
X-Received: by 2002:a05:6000:120a:: with SMTP id e10mr21795346wrx.156.1639249905650;
        Sat, 11 Dec 2021 11:11:45 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 09/26] hw/intc/arm_gicv3_its: Correct handling of MAPI
Date: Sat, 11 Dec 2021 19:11:18 +0000
Message-Id: <20211211191135.1764649-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: K6jQaHatppmI

The MAPI command takes arguments DeviceID, EventID, ICID, and is
defined to be equivalent to MAPTI DeviceID, EventID, EventID, ICID.
(That is, where MAPTI takes an explicit pINTID, MAPI uses the EventID
as the pINTID.)

We didn't quite get this right.  In particular the error checks for
MAPI include "EventID does not specify a valid LPI identifier", which
is the same as MAPTI's error check for the pINTID field.  QEMU's code
skips the pINTID error check entirely in the MAPI case.

We can fix this bug and in the process simplify the code by switching
to the obvious implementation of setting pIntid = eventid early
if ignore_pInt is true.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 15eb72a0a15..6f21c56fba2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -354,7 +354,9 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
 
     eventid = (value & EVENTID_MASK);
 
-    if (!ignore_pInt) {
+    if (ignore_pInt) {
+        pIntid = eventid;
+    } else {
         pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
     }
 
@@ -377,14 +379,12 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
 
     max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
 
-    if (!ignore_pInt) {
-        max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
-    }
+    max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
             || !dte_valid || (eventid > max_eventid) ||
-            (!ignore_pInt && (((pIntid < GICV3_LPI_INTID_START) ||
-            (pIntid > max_Intid)) && (pIntid != INTID_SPURIOUS)))) {
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
+             (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "devid %d or icid %d or eventid %d or pIntid %d or"
@@ -400,11 +400,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         IteEntry ite = {};
         ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
         ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-        if (ignore_pInt) {
-            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, eventid);
-        } else {
-            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-        }
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
         ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
         ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-- 
2.25.1
