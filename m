Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583317lfk;
        Sat, 11 Dec 2021 11:11:43 -0800 (PST)
X-Received: by 2002:a5d:6785:: with SMTP id v5mr21473290wru.380.1639249903230;
        Sat, 11 Dec 2021 11:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249903; cv=none;
        d=google.com; s=arc-20160816;
        b=UGvESNxhLmOG6Bl7tPsc3bXn2/tDw3AVn/0AkwbcwvWq2OHX3AaNR4tc4s/iRJSksU
         gAMoUcjVsdptaj5PXt6FqIOyyo5mrarSVdTHRGsDssezBAKh9R8AAYQQySLmfwXEeR92
         MeKBIOxE49jqFc1XMsYkBtliKdjT8sr0Z+ErHqq1MpMqxjvEq1wLqVm9fsSErzUbCjwr
         BZoLpesKHBGOIaER+0DcyVeToc+GOF40o9fyQiavrY3Vo7cTxm3cxk/mLEGlg4K9JaiR
         FgYIcKeWXe7jua13bgS8pnOMk1wyy/K+2C2zImYK50woqW+iDOrL/ogfDMz9rOKkotLU
         iL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MLNR1fcnj1CQdExPgAQtQq8Gfk8TpYAkjXC++HyyPjA=;
        b=g88i/+dP/X3pQ/N9oHCVtHqmRIGYltDZbzJf48cWn0zrGHMmLFPTESO4xFQtrfPfyL
         4nPZAYSSNgXYYCgqS1SuiV2tcm0zZ9MKlYeb7UTWh2Hi3BW1evQTkAIPsNwTusceIWLm
         H04N5LSaj2cKnRV03wsGbaK9qWku2e+ZdCTIQigMZ8P2fNqnXYLHBMmfzf6pXCcwoemT
         O4PVFUOcrxcJtVcOkFlA+vFb2nAFSYj4AjLAy1+DEhSlq8ksY2V/XDjp8bVQfuHCkX+R
         SF8YpbjT27DwAJj1ZymlluQGorFfwyFAaOLEsfmOtScpecnKgTl8CwF0inz3vemV5kWZ
         0j4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ED4MakYp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k21sor1047991wms.19.2021.12.11.11.11.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ED4MakYp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLNR1fcnj1CQdExPgAQtQq8Gfk8TpYAkjXC++HyyPjA=;
        b=ED4MakYpiiUS3jWg1EwVlyWsqDYIZdUo5+tHqJukoevqseWJudiFa0mOrTxFDBUxWg
         PAOGqRszQQ6Wbj6aIdBEwlYm6gKkZE86AK/pzbRsDAzFmyDuVQkpCxKN9ahpKllqZroX
         jFF6GPCv/E8edgQIJHx+jXo8L63SpJ7oy8SRoxgW/xYOcVNp4YMatp2EPN53z8gl0vrj
         53t3TOtyLAOnvuOYb1fdaeM5mDjgJgNesgznO1A6zXxuNJOY7mZ75Yi/BzMfW4BgYQSw
         BkejFS9vkQL+RXfDXXp0Vx8zaGaGBsCMKUjrG2wRmouk2kP9WdO/dkwH885WGcU1o5le
         4pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLNR1fcnj1CQdExPgAQtQq8Gfk8TpYAkjXC++HyyPjA=;
        b=JZ+uDnyWC4gOK+ZdetACxahpgHujcOh2uHk6ZqHlS+Pr7wFjskQBtWFsY9bspFQD5h
         9ZLQKUhSHCr+6Pjl9AkxgDu8zrO/XNnRf5/Mh2mqFZS6JvgCqol7dqkolBhoPX6mbo9E
         hTDeg4AnyTqV+P7uT0BmjIIDeDv9KKw1sTICk3lHJmYk2C9IU94qxOl7COyxETXlWuJ+
         HV+1c3CPWQvNijVsPaq1f/b7Od3IxxRxHHWsVQ63GeV14UTgkVSKKeWJCjhV/tbif3fJ
         J/GZddQ+qH/KvV8EwhqxoTFEH5VURq2xn6sgkD7LQraA1/L93NPWINOp5tk8w+2VAksV
         KfHA==
X-Gm-Message-State: AOAM533c1RaUmb0OOWZ2sGtZdx1p6r5hnDQZzTlApDPyx9gHOCQl+P6M
	05ttMgNEj/RWduzBC9jQ1ofEcZta
X-Google-Smtp-Source: ABdhPJyY08PkGq0h148FJzKA1/aO8iZtaXJE2han4QCdbv8+wywTF/dba2xQyz6BZbiu2WRZQafbUw==
X-Received: by 2002:a05:600c:2c4a:: with SMTP id r10mr26231909wmg.125.1639249902902;
        Sat, 11 Dec 2021 11:11:42 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 05/26] hw/intc/arm_gicv3_its: Don't return early in extract_table_params() loop
Date: Sat, 11 Dec 2021 19:11:14 +0000
Message-Id: <20211211191135.1764649-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lYWok7Qu+w04

In extract_table_params() we process each GITS_BASER<n> register.  If
the register's Valid bit is not set, this means there is no
in-guest-memory table and so we should not try to interpret the other
fields in the register.  This was incorrectly coded as a 'return'
rather than a 'break', so instead of looping round to process the
next GITS_BASER<n> we would stop entirely, treating any later tables
as being not valid also.

This has no real guest-visible effects because (since we don't have
GITS_TYPER.HCC != 0) the guest must in any case set up all the
GITS_BASER<n> to point to valid tables, so this only happens in an
odd misbehaving-guest corner case.

Fix the check to 'break', so that we leave the case statement and
loop back around to the next GITS_BASER<n>.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I suspect this was an accidental result from a refactoring at
some point in the development of the ITS code.
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f321f10189e..c97b9982ae1 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -795,7 +795,7 @@ static void extract_table_params(GICv3ITSState *s)
             s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
 
             if (!s->dt.valid) {
-                return;
+                break;
             }
 
             s->dt.page_sz = page_sz;
@@ -826,7 +826,7 @@ static void extract_table_params(GICv3ITSState *s)
              * hence writes are discarded if ct.valid is 0
              */
             if (!s->ct.valid) {
-                return;
+                break;
             }
 
             s->ct.page_sz = page_sz;
-- 
2.25.1
