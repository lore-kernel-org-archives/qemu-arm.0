Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2310995wrr;
        Mon, 11 Nov 2019 22:45:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGm8PLYRRne2FK8ZGf/wO3uDsDVlpYj41c8bctCifHHpfmss2dBGvi4s8tl7uwf0eIdkVF
X-Received: by 2002:a17:906:ecb8:: with SMTP id qh24mr1685482ejb.174.1573541110367;
        Mon, 11 Nov 2019 22:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573541110; cv=none;
        d=google.com; s=arc-20160816;
        b=EUBKTNDjxTsJU3Sdxr1g8cBYV/LEUvJNd8tQopJxPD8jrsstrwKl2XQU7tfjRHm3hi
         EsxD/T6y7aEa8Ia0/JunFFlB0GrUyS0WszqFxRQS5schn2LBvTAYKAYoiv+flXLwaQeT
         R4iTs0BpTvQ+rHOF1kemyadfGuGaXQpm/Tq8HYRfRCkHd12BmgQroFp7C0p5qasBAymR
         VCn8+S6JxfY3sWya+rpuz9mAZIt8wLyGDGl5ZyGf617l6yruf+alxpfZKi6qfzfuIQ6S
         5xj4UI6Ap13kbX3zWIuP2j/iFqFTHTtvisbbEwfmV3OFMddf9M5p/VHiO42QOEw4+Y3f
         1yaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j37H1qa+h9fHDfjTASOPnrg2HuSkQw6LSGgwlJ4L1BI=;
        b=pwSNZcaP7QYCI6PxiY95bwyKmk5FRChOkf/otEH6K6NTApmxWm+VxZuSZDL/l0Q7Bq
         EOSMKwIXUynzfsiIQiN4BoO9mlzPmmAnPMx/vTiJNOMyLMhBqOFBkJqPdT/a7Gazsu5h
         B7WLHko9PUPxat1RoKkDptaAOepr9gZTIFIRugk+NO9Vl4SNr65n0BikPqv53VoI0jVZ
         nqePGHRmlLZQu0Q485lgkRNw0edNh4ZK7Wr3HUVB4cgOR3CW/V5g9ykjX8yBZsllKFnu
         72MJurKPA/oLKVriGRpaJpnmpUud7c5fyqIRpXv5d9tKNw7+9rVLZmwsQ/AiCYqzE2cR
         B6IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=munbN8Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si10451377ejb.49.2019.11.11.22.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 22:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=munbN8Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUPvJ-0005Tz-8O
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 01:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrd-0003Mc-Jg
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 01:41:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrc-0007QW-Iv
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 01:41:21 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39035)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUPrY-0007O0-Ld; Tue, 12 Nov 2019 01:41:16 -0500
Received: by mail-pg1-x541.google.com with SMTP id 29so11180175pgm.6;
 Mon, 11 Nov 2019 22:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j37H1qa+h9fHDfjTASOPnrg2HuSkQw6LSGgwlJ4L1BI=;
 b=munbN8JjSqEXfb42+yBm1Gw05N9mU52wiSskJnU7YntaW5je8OsU3VO8GqzLdAT6ZA
 aar8hkWM0ILovvTGBbVHpMZXgQv5h8BrU3q5wCQEUb+aPXP60KUdc7VOTua2Z4wsXBGx
 n3ClqjyFNmfc9TbpJgDNj1YaS9J1KG3LVGxfxg5KZW6sg8+8bOGugsRWhZVoKJXpK8Th
 5Fyc6bNKU4CO7wKDyGIfaMjQ7J5SqDsM2G2Ow5Idcp/yy5yVzLQ8Dc3XCmKETM4kHOzn
 5LNWoZWa2G0aTdkeCFJY/SeRCC0WODRFkEaVJLmrvK8tMLV6vSDKiMpC6ezo8EEwzu0b
 n7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j37H1qa+h9fHDfjTASOPnrg2HuSkQw6LSGgwlJ4L1BI=;
 b=jdMzzQ2NstfTltWQSu0HaqK4LeQR/pPmgyV5RqDUepDsztnXypgdWRxBmlTUcixvTy
 OHy95CfQhfqLAym4u+iC3YwMAR9NdEFQ1nZL5Oatkz358bTwYqUNUnswcLYEI+O8vgAU
 h5lySxRZVHM0R87s3zDIdm4VgyqOgACu2VNEwGgowOKYgtwoW7a5FrpgYCEvcpILeXUh
 pzx6Vtc8Jv+INrcEQdPLMUSalpm/uaLAaLtPcBXXoxGJx18iBs9ueSsPEjzHJFqnlvbe
 u7FbtyU008D/bNNfBoPaWjijrv7CMcLpfcMQ7JoO0jXMCFKhhSYQo1evXQtzwuIB8d3e
 ds+w==
X-Gm-Message-State: APjAAAWXd3ShUyKME6ltEtOxuKA4PU8rXsDYaBFOY4XYnzSh9woPCTNb
 sTvboyxz+Kkoou+Z8sq1O4o=
X-Received: by 2002:a17:90a:e90:: with SMTP id 16mr4277177pjx.65.1573540875064; 
 Mon, 11 Nov 2019 22:41:15 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id q8sm16375590pgg.15.2019.11.11.22.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:41:14 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/4] watchdog/aspeed: Improve watchdog timeout message
Date: Tue, 12 Nov 2019 17:10:57 +1030
Message-Id: <20191112064058.13275-4-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112064058.13275-1-joel@jms.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZvHNxH65JUZ5

Users benefit from knowing which watchdog timer has expired. The address
of the watchdog's registers unambiguously indicates which has expired,
so log that.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/watchdog/wdt_aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 145be6f99ce2..5697ed83325a 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -219,7 +219,8 @@ static void aspeed_wdt_timer_expired(void *dev)
         return;
     }
 
-    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
+    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer %08lx expired.\n",
+            s->iomem.addr);
     watchdog_perform_action();
     timer_del(s->timer);
 }
-- 
2.24.0

