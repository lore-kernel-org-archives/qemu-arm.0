Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1065998lfe;
        Fri, 20 Mar 2020 09:07:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtOzgVZ5bZ0cSfRkM6k0cDBPvAE/XcutKRHk6y80jvk19ZRVM1/bzMZbs+bdExDCcFu+lcj
X-Received: by 2002:ac8:6f64:: with SMTP id u4mr9167747qtv.301.1584720420906;
        Fri, 20 Mar 2020 09:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584720420; cv=none;
        d=google.com; s=arc-20160816;
        b=Gqy5FvlHY83jCJprIgOTA12qlGwPLK73p5SxqfpOVoBsAx4sRJ51yspC11KD9szfUq
         AHpKeTDnS8/jVhsXUMpGWfpsisZSsNnSE03AK0i9p+iiz0BowMLe8vtfCyc2xOBI8tbO
         x/ifRJMAIn9EGL884EQY5OMuQe6UdbVy+LbrSSRV4FcngYhRG+iJc9bt3VHwLozjcai9
         XYMnG7+0giq/zbIvh9mS7h2OuRIpzzWNIiBAtWMc71boCuAnUiM5/NOVvuIkHlmadAxx
         H7af+m8vUkWutdC5vF0DpxmEQ6kCx7MPHdQB6e7DmcbC4dJLSlzCKupAzr9EKpcFAr5o
         ZH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Z+SDME4E2sCY/GphbA3qjA/hZrqxGNEA6/MPHDiVJqY=;
        b=yqQaEiFRgAcYI9DXa8m5u+GKvXg5tpcfx/Hwr6dxND9hI1Tc91oRFmc/c6WzhOr+zx
         iFbXtbW0ktrtMkwN6IHuHwenI4jg8HZlM5uIcRUc54VN2XtYOljSxtN8EQL9IbvpXON1
         NAXp4LHbAAPnUjxShmFVVTOoaCYrOt31AmfNzkIEeXqhlhPZ5qkYjBSGIxCRMalo3AKF
         3al+FoIY2warQeXBQ7Kai9mH8GCDQzDw7L4eVvrwfbBtiU3yK6VM3E/X9qfs/20A0YkJ
         EgUUsX0xcOA3zmHt8N1hMwulgCH4uhFz3y+wR9EGNTir3DBe2ndmFqyaJQ0GnstjAWkE
         Ku6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mauQ6A8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si3915835qvb.42.2020.03.20.09.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 09:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mauQ6A8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFKAm-0002L6-9F
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 12:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAG-0001xZ-Nn
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAF-0001am-MS
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:28 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37916)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jFKAF-0001a5-H6
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:06:27 -0400
Received: by mail-pl1-x641.google.com with SMTP id w3so2677828plz.5
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2020 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+SDME4E2sCY/GphbA3qjA/hZrqxGNEA6/MPHDiVJqY=;
 b=mauQ6A8a9rBMA3rXL0UlYYMFBZUNKfZWi/KhS+T4kl1u7hBr11rrtv7ujJbx5ujx3U
 zClxvn/SdO4ludJjbBdr+XeQ7ebWa22HvZkdZtjr6PBEdt0dmObvR0+ndjOR4z3C1HrD
 sC2ITIiKq/YWPKh1yzfH3fTyXr9c2HVbIt7+qqmPuek965F3dWi/LkmX2p+MrLyuH8K/
 ODrpP0tjkQdaqGTg2jCcbPxB9v3WTzQ08ID6E5JiD93saoiiqvGtOmV8AoHSMnP4yayS
 Wr8e8T1DJENUBZY4ifmcC8ekBjvcRXCr0tzaqjKLyAqp3Ukb7NFQIs6TurvZC6wjmD6L
 89Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+SDME4E2sCY/GphbA3qjA/hZrqxGNEA6/MPHDiVJqY=;
 b=qltjeFhYD1rgDHAuuiLGxaRLOsRWlpQFUJiHaS3YXkMxlfSz2W7NyyWLmWYt5kbNa8
 Q/42Hh3AQ4fhctZZt7LsvOxbl9BOFnkKsWNThfDOpaqPwOcySk5OOvVkFnE67wsPSgrp
 YnSmvfqehtrbTPzRGeSOUAIOTfShw4O6MgxrUN5C5CWLuUK4nSSIHATzt26oX7+6FAK+
 3PPCJioE6XcbMZUNXRzrOkgvkINHAg4hT8io2aurLEZQYr3mHXQ3aWekcSy9MqFmWIKw
 2IRH+bUZmb/EnIApX7bse7y4BJcHeMR8W5WFjIqJdHNbk5g4nuWPN/0tZXgdaQFLPRo8
 OcVA==
X-Gm-Message-State: ANhLgQ36bjULTcPJiFcQaEoQjOKLJIy2MxOgvibpMI/nGsaeXRd8atNr
 L6Gh6yuE5EGxMcfn2hdLpKlTPSqlZWA=
X-Received: by 2002:a17:90a:c244:: with SMTP id
 d4mr10382017pjx.136.1584720385438; 
 Fri, 20 Mar 2020 09:06:25 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id nu13sm5272745pjb.22.2020.03.20.09.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 09:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Rearrange disabled check for watchpoints
Date: Fri, 20 Mar 2020 09:06:20 -0700
Message-Id: <20200320160622.8040-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320160622.8040-1-richard.henderson@linaro.org>
References: <20200320160622.8040-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +kESCImcpyEJ

Coverity rightly notes that ctz32(bas) on 0 will return 32,
which makes the len calculation a BAD_SHIFT.

A value of 0 in DBGWCR<n>_EL1.BAS is reserved.  Simply move
the existing check we have for this case.

Reported-by: Coverity (CID 1421964)
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ec2c5351..b7b6887241 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6340,17 +6340,18 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         int bas = extract64(wcr, 5, 8);
         int basstart;
 
-        if (bas == 0) {
-            /* This must act as if the watchpoint is disabled */
-            return;
-        }
-
         if (extract64(wvr, 2, 1)) {
             /* Deprecated case of an only 4-aligned address. BAS[7:4] are
              * ignored, and BAS[3:0] define which bytes to watch.
              */
             bas &= 0xf;
         }
+
+        if (bas == 0) {
+            /* This must act as if the watchpoint is disabled */
+            return;
+        }
+
         /* The BAS bits are supposed to be programmed to indicate a contiguous
          * range of bytes. Otherwise it is CONSTRAINED UNPREDICTABLE whether
          * we fire for each byte in the word/doubleword addressed by the WVR.
-- 
2.20.1

