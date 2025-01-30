Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181763njb;
        Thu, 30 Jan 2025 10:23:13 -0800 (PST)
X-Received: by 2002:a05:6000:1445:b0:385:f573:1f78 with SMTP id ffacd0b85a97d-38c519744e1mr7268118f8f.24.1738261393077;
        Thu, 30 Jan 2025 10:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261393; cv=none;
        d=google.com; s=arc-20240605;
        b=Bfs2duz/LCCbvsPRVG5D3RoiMl56H6wi0009gHCm8CZouu2gl53dnJhq1nh6uB3TyO
         /5/PSmhWUI7FddCC/JqWtCAWGfjCaNBAVy4YRt628aq5ay8lNlfJ+gH/jU3KFO+C5jne
         ftUTFDEEfpOBfOr+Cjq1BtncDp/OOADjMg+cma2uJdSzEh6bFU31Gjl+g86mBk5YbteL
         +xSfFf/zBzglej99d+0M0vHsmflZZnqhlM/qTr594Zfc7X1t/dABwdHa/POXMCgt4I2/
         nrQYKk652/DAkJV13WwPZCW7ozYEjGcsfQOV3NfYB2c3mYKV4NX0bpsgw7IwRt9rPb5g
         p5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LMfouiukZplViqTOnGPtuKQ5CD0lpwbbbWd2NrRj/nk=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=E5gQ95RCgICkpeYVDndFWOklbg+q1EdjsZsqsDNge/78+eH9P0x75Jhuf18VQ7ii09
         iqrlUdC4oSbQ6yL4PoSBFLxvPr+oubO11sEXfWaKMnXpqL0UtUL0kBCdUtXHLOWDAa4/
         /O60m2OXQed02qy3feoYcSshEQJUICrovJsUnHcBLHIkzQ/R3Hf+yRVzvQZ6HAzjBnDX
         ejJXlCcyMwASLQW/mWaotvdkSjVBrjvAoIQbOcIgfOMlkN2DR1fjAUU3NrfvI5SFCTta
         jaMKzUddSNbt5RkxCtAPSQrFsaDbREjRehKghjoW/IJtskMCjmpCXqKSR64V/H74JpB/
         xPKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uC7FBqyZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1018d6sor707548f8f.3.2025.01.30.10.23.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uC7FBqyZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261392; x=1738866192; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMfouiukZplViqTOnGPtuKQ5CD0lpwbbbWd2NrRj/nk=;
        b=uC7FBqyZsAIOllPPxVN8ErAFjmQ+xOXVv+E8nw6P5fvn25PdpkqZq2q/jkf7QU391v
         WTqU2jn2SaqW3cQwb+3b1egUtm4jLGZx5kny1kRF4tJfFSlC1ZzGgevblKejFmny00Ko
         aUa3cRzxjd8aqol7bzqOzSjzqGRf6vTtitzZ0zwijIeNVgDM5xM3gNjO8fZuuBtSNI4f
         pZP8qof3JfM3H+UHbqAWFOQgHBH0fIlu+qmSvojRRB/6sVY6G4uP6isduphOxa3+r/TN
         jkbN905ra1HmRTUqmrfuROL31Zy2lavtyvDjQEwuu0c+byywvVHLPdCRSH/khUDPffBi
         pXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261392; x=1738866192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMfouiukZplViqTOnGPtuKQ5CD0lpwbbbWd2NrRj/nk=;
        b=FoW+7drxEgNp5j6welfsApJ9ElXk9NgaEPZbxiR3RBNc5DwcaOuKsizaFh37mincFQ
         UnwJXHk//pP0WcS0vbG/BvWxDZgHXIEzu8VVGCll6SMtTtYvJkYYZ5T3joveL31KxX4W
         9ykvC0IwODjvRFY/vNC12IOIduiBZqs3jXfQWzfRKkylHt+R7kT+FZzEGztivRAB9bG1
         chmpg/WLAXVPmmirawf4X69x782l2OFRXqjaDCQRFfSdVvX6LVQ2Fj5994avr9y9nEG+
         z/2V0qwas9+JZtoinuJ0EKpCtzjpeFgrzhUZbx/Wb9MGoFdgQxMyMo+wlYD09NL1pOum
         HqPw==
X-Gm-Message-State: AOJu0Yw/iBDT6PlUj8QHa9dS26jMQ9S2LIz/FEBGFUd0/eY0baA4HJv7
	dM07T9AMSTxKxy0Ja6JX/fnXIcHill9Z4AI/xaKaGJNNdFQpTzBacOgmWnWZitiqvA==
X-Gm-Gg: ASbGncsuZtny+g5rCyP2HQmhaNai7NmgPo6g4OrwqUAo6pXQrztHqEubftj+SvbPKcB
	KZFAxVfvJyYUMg49B4GiCCZM1jYgaPd5JDJsCtWQ1KDzOITpksyuBr9u3GSwlWIWBEizRe8Nqiz
	NjBtOOSqoWma7jsR+0Y99YLixLcAN17Wv3n4mBnQTjwdmFwhBzhmDoVEJxdLJj5KFs3x+H8nWjw
	ahUkOvj10l8FeSiYHskhPEdZWILk2mabXLSqFIEVNYGOBEBTnDJOnK18Dn4cBX5cvNorK4SVjPP
	ScbiZw+smpgAZQiuL/WGxg==
X-Google-Smtp-Source: AGHT+IE0Ntzqkcvpi0/rtd9RUCq1vjf0A6C7yblnPNWB4Ert1+7WzMmsG13LS2EqDenr5fnRIuTw3g==
X-Received: by 2002:a5d:6c6f:0:b0:38a:418e:1177 with SMTP id ffacd0b85a97d-38c51949ebemr6862874f8f.11.1738261392535;
        Thu, 30 Jan 2025 10:23:12 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 01/14] target/arm: Report correct syndrome for UNDEFINED CNTPS_*_EL1 from EL2 and NS EL1
Date: Thu, 30 Jan 2025 18:22:56 +0000
Message-Id: <20250130182309.717346-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lYsa0AlaPoyV

The access pseudocode for the CNTPS_TVAL_EL1, CNTPS_CTL_EL1 and
CNTPS_CVAL_EL1 secure timer registers says that they are UNDEFINED
from EL2 or NS EL1.  We incorrectly return CP_ACCESS_TRAP from the
access function in these cases, which means that we report the wrong
syndrome value to the target EL.

Use CP_ACCESS_TRAP_UNCATEGORIZED, which reports the correct syndrome
value for an UNDEFINED instruction.

Cc: qemu-stable@nongnu.org
Fixes: b4d3978c2fd ("target-arm: Add the AArch64 view of the Secure physical timer")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40bdfc851a5..c5245a20aaf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2385,7 +2385,7 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
     switch (arm_current_el(env)) {
     case 1:
         if (!arm_is_secure(env)) {
-            return CP_ACCESS_TRAP;
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
         }
         if (!(env->cp15.scr_el3 & SCR_ST)) {
             return CP_ACCESS_TRAP_EL3;
@@ -2393,7 +2393,7 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
         return CP_ACCESS_OK;
     case 0:
     case 2:
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
     case 3:
         return CP_ACCESS_OK;
     default:
-- 
2.34.1
