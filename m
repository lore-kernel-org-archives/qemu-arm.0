Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181801njb;
        Thu, 30 Jan 2025 10:23:16 -0800 (PST)
X-Received: by 2002:a5d:598e:0:b0:38b:ed18:2f3b with SMTP id ffacd0b85a97d-38c52095854mr8914219f8f.48.1738261395836;
        Thu, 30 Jan 2025 10:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261395; cv=none;
        d=google.com; s=arc-20240605;
        b=WNKW50tJv4Sw+sIkhDlAlxhZ2ObbFG2ILNg4XFt/t+b3a60qA00Fy0A0UsM82ILDQI
         GNzxxLptsUEggDE9uKTw3VKTanrLZosaoadXSNfRLwaGChgRZ/EAmVdKWzDKx3ztSOLq
         h1OzQshkDdO7F+cHv+WPVv1uA9Ykx4aWOGR7TQrFo+4+htixDZVIEvfJxj5pFEQthpkf
         Tlt39exgYL5Umf2Y4guzbsLMCkJqEwwU6TGwUx21vRNBd/dhfqgpaI8LTfUtwF8+4Vx+
         LQVzTKtEIpqYWiHwRlAi6KhNAB05vr13Q9gckLXsi4oVwovRngPqfTPZypgIq3DVQuM0
         P/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9XVL1wlKsZQPV2VNsPNKghCDpbJZsLxmzWGbgwthcyk=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=SMz6Jo/mT6YeMiWpnnJ3z4sn0xC3T3eWHZ/Sv0Osx8Mb85HfI+BROyX04PqCZiLhmX
         W7HfiI/t6syGfk/iWYugO1CP79ue4khspXWiMdEFIf3oXKODbK6bPt+tPcxnzkM5IAe6
         wDF/BxzXalcJxIKqNaKsE6lR9lAVHbi7AKqjlEGfsq4Y2VXyZ8RcmQx6ImS+5acI/1lZ
         HYhW7Rl6UbfxOR/FXKM0HHiZ662tCywHuT9n1ZeDR29geOASKans3m4zdW5Oh9TRk4sh
         fE7lk1PQEEubODwzyFa0VQ5//+A6ebd2XjAjdUASHVgPyQDznj3Bv2sDds7tktE+YluJ
         rtLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ait1VB5z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1aa681sor902961f8f.6.2025.01.30.10.23.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ait1VB5z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261395; x=1738866195; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XVL1wlKsZQPV2VNsPNKghCDpbJZsLxmzWGbgwthcyk=;
        b=Ait1VB5zY9UET1gGJRCZo0/MOOUMI7UJWLoVRLDs1UQRvpE+O06rgsZQXJzKPLhMeb
         hKc2Zw3hRQoB4fZqkNX8BSy0EnVwSQvTqqjh/ypoumxrR6xwIxY199yzuieeCvFFBnNv
         h12UIx2UsZfq5UnLtvYJaIfaPxJk4+Po9PzhuYI25/VAzMwp0Revr25UAPvK7JiTqUkp
         lprvwSDx4TG76QlWVe+wKADw4ue5OgIF4L5QQE68N+9Ao86kHYEwNVM6e6pBnOC0cfTs
         jYGsF9l0/KnNoeAg+vyXRZSp/yew0YYrgs2EeuHvSlMIf3mWfrj2/yB5XQzfIZfwvfkD
         7Dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261395; x=1738866195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XVL1wlKsZQPV2VNsPNKghCDpbJZsLxmzWGbgwthcyk=;
        b=K2qU2ks3aBPFXxQditFBFqtNTCbgjfvSInQAGcoN2xegyR/rAqEVuq5WrHExdWOs7J
         +e/4CnBvj3P/7WyfsEOIMytZ1HKERynreVy4avX+3SDbyCGStGmHv6IR5Gm5RxeCU4b5
         lqaqcRueV+zCD77Uvd/5GH9rxMuDmjpMPrgRqfA302wSH0HG9tZn3I5527rlsFObXV1+
         6h2WqV9ijg7jRti5nl6ddUtVYRAdu7dn1YYCIQrjTh9Nqdmh77bZCEC5FOHErCxXyU4o
         LuPe66kyyeYCNxavjkqWVU0DCX4zaA0qci9TWR9QFuyEQ0EyP5eej6PIC3FUIBdE7iwZ
         iTXQ==
X-Gm-Message-State: AOJu0YwLsaTiB6TLqbk65NMtKGMi9FWGSc+9EyI7gJJZC2AsCtHEfrBb
	tEEAY6s9XtjXLQDwE4wxMySfKgdCwHGqDor2I4CHqslDMNDF8FDd6+MQXA3y6YQ097Fibv0zcis
	CA9w=
X-Gm-Gg: ASbGnctYSFuXDmZHeQCu0YCRN/w2PgVXt/N87b83T9pu4tZ1tlPTWTcxEBb0w0b7ws+
	njK3RyOuYKO5qQKKDrc3IfowF0T6Xisf5b3F2kDEXtJTAC6vQufFMZqdDkoxs5f0KLImYsGRzD0
	xU2bdVjTNDLoPUMdoGiSl5cX0SeAc8eNYGiVuI0zi0J9RwOMJ0hZzleiVl8X4AQqwRdHtRatTlp
	hO+xX54cIJIJz9swBSGKQStEe3203ooldmvBrlk1bVjjO7SCFxCzS6Df9dwAVBogcBMhA0g/9Ld
	j4kglUFlc4x7rv8NLu1wIA==
X-Google-Smtp-Source: AGHT+IFEl4mBtaDwDRKh+R7ZNm0NJQGZd+X2Nd39Y7GBdCSES7z22sohAmIx6YE8+sjAuWJkmujg8g==
X-Received: by 2002:a05:6000:1862:b0:38c:5d42:1528 with SMTP id ffacd0b85a97d-38c5d4218cemr2970194f8f.40.1738261395345;
        Thu, 30 Jan 2025 10:23:15 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 04/14] target/arm: Report correct syndrome for UNDEFINED LOR sysregs when NS=0
Date: Thu, 30 Jan 2025 18:22:59 +0000
Message-Id: <20250130182309.717346-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aZBd7CvRjyQ4

The pseudocode for the accessors for the LOR sysregs says they
are UNDEFINED if SCR_EL3.NS is 0. We were reporting the wrong
syndrome value here; use CP_ACCESS_TRAP_UNCATEGORIZED.

Cc: qemu-stable@nongnu.org
Fixes: 2d7137c10faf ("target/arm: Implement the ARMv8.1-LOR extension")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 74b556b6766..5d9eca35c04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6750,8 +6750,8 @@ static CPAccessResult access_lor_other(CPUARMState *env,
                                        const ARMCPRegInfo *ri, bool isread)
 {
     if (arm_is_secure_below_el3(env)) {
-        /* Access denied in secure mode.  */
-        return CP_ACCESS_TRAP;
+        /* UNDEF if SCR_EL3.NS == 0 */
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
     }
     return access_lor_ns(env, ri, isread);
 }
-- 
2.34.1
