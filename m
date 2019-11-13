Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp4668020wrr;
        Wed, 13 Nov 2019 14:13:24 -0800 (PST)
X-Received: by 2002:a63:550b:: with SMTP id j11mr6334967pgb.254.1573683204515;
        Wed, 13 Nov 2019 14:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573683204; cv=none;
        d=google.com; s=arc-20160816;
        b=QbweukwSNJYSPZU79YjANucTVOT3BD/MuSYj1J/pOLg1iVbAV3aqcX7IHG8mWekuje
         Zv06mHE0eN5OIQbrpcsmgvYv9lingzE8gPEOLieklB9f+UrNF0MmPc75Cj3e1B98YpRi
         ZJVE4HohXpJ5ep9nihOAZevnZuzLl7/sjXn7tlUoU2f18xzrpTHAZtEnx57qYc6FwIVz
         5ZDmw4AQx7HAe7z4GRDGy7fDN5VHhTjplNYnHdVODPv4Pw28DjkthfEs677/jyyhZ9w3
         +qYe8j+HDQf4fsVHncrvoyiBjM1Y7HoS2/tKkkejntpQ20ZyVz2XjPgM/KxXllwflwOB
         JeXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=8TuERMwKIX0IjYAYBvRG+/eE8by9a0Ql/FHpjEAjdkQ=;
        b=nB28stx3aFhq9I8EsKCV8vIe2xAxBOhg6eVB+MB+YKX9uLcYmRtLnRPns++f182mqs
         btm1UQgMmbZfDvah8mFD8MM2RHZ3pxhqdr2Gm7MMbdvdF+aBhc+jQh5jLs8xSVzC0UGO
         bYyIheS3TkfU6j0yDv2qN3n5tfWsdyeLcXcfOpt2FMS9U+g1ua/3ap9FvG6oLpTfl8ct
         94+e6qEQ9U5RqyhVr+yPCnu2qW7nlraeZjLON/q0dALLXcvXnTFYpZbpLNm5k/Tj26lC
         nYPgY+YvCfqf2Zi9Gc2Xld40/4Q9LM2w9zcpobl22MEPMubyfUOTEOyv0NxIW4PSYGHC
         timA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RkaX2O2K;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v2sor4247196plz.24.2019.11.13.14.13.24
        (Google Transport Security);
        Wed, 13 Nov 2019 14:13:24 -0800 (PST)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RkaX2O2K;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8TuERMwKIX0IjYAYBvRG+/eE8by9a0Ql/FHpjEAjdkQ=;
        b=RkaX2O2KL449KlwuavPI5G3WFShvPSTM220WZKzvW+dJG+PEJT2rW0Xtzr/MLxpVYF
         3X7dH1TNU79qU5/f2jRBWhs9z+Oz/vi3y/S5XpmZNDJfLo1PssI6oTQkwElHL/AMDpSV
         G+Xc4O9U/wW3Q0Dq+fQta/OFWLnO/5X4gN3vH92HZ8LG0WpvhdAkIZvdCax7hz68ef+j
         si0MEVK9piF2FgBjPz56iG45PweJ9JsM3kPnuEGPnDVd1lUoNdToDUPRhz8pY5+URkY4
         HXiH1XbLLK8gZEWAPc47e+FWG2vpKdL07T8E57kRbiyH8pkUSqkQAY6t64qzmPx8vBBt
         IEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8TuERMwKIX0IjYAYBvRG+/eE8by9a0Ql/FHpjEAjdkQ=;
        b=QYnaNFslXFVxog/HtIpgCI6+1kEkdcmYwnM3/pH2OxfuUyXXMX0epUu+XEevupCT9m
         PGWMwlQyxsqHVgxOLCOuUwqI3e9WT8N81hUoVwc5r9GkiMbSFJ3ZGxmUuWKVw7kJFmJP
         e1ZeUnZ42H0PVnBM8H4HmbGcjorI2FJ+vRzLM1Au06nFE5h6k2IOhCProgd3OdgHS9QJ
         Z0t/q7sw45KDT4qotRFq2R8ne0B8rrge3QmLXJKs/yHEDHEmLNm4+51eMM23o2cz0Qfd
         CWL8E9Yi+T3eCmWr0xCRJTJYNj7A4zZGy6k/oixm+n2XuZKd0oDSOkEz9AttSx1F9zDD
         PffQ==
X-Gm-Message-State: APjAAAWinHVwHncy8+/0dlNVqD1sdpT4WIYJvYPyXF8GJrootKTPnAMh
	SK8odmVtTRIBhyZuIERMtiRNYUQnJqY=
X-Google-Smtp-Source: APXvYqzymcyJv5GoP2UKH/+bKz7Dd3hKoRQIdWSHmhloYF+NVbzlspE+ovxuS+sua3Du9zgR2DAX8w==
X-Received: by 2002:a17:902:82c7:: with SMTP id u7mr5770045plz.31.1573683203708;
        Wed, 13 Nov 2019 14:13:23 -0800 (PST)
Return-Path: <joel.stan@gmail.com>
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w69sm5252005pfc.164.2019.11.13.14.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 14:13:23 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] watchdog/aspeed: Improve watchdog timeout message
Date: Thu, 14 Nov 2019 08:43:00 +1030
Message-Id: <20191113221301.8768-4-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113221301.8768-1-joel@jms.id.au>
References: <20191113221301.8768-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qmX5vWpsge/q

Users benefit from knowing which watchdog timer has expired. The address
of the watchdog's registers unambiguously indicates which has expired,
so log that.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Use HWADDR_PRIx
v3: Fix spacing
---
 hw/watchdog/wdt_aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 145be6f99ce2..d283d07d6546 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -219,7 +219,8 @@ static void aspeed_wdt_timer_expired(void *dev)
         return;
     }
 
-    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
+    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer %" HWADDR_PRIx " expired.\n",
+                  s->iomem.addr);
     watchdog_perform_action();
     timer_del(s->timer);
 }
-- 
2.24.0
