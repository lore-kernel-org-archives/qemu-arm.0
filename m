Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2451348wrq;
        Sat, 23 Jun 2018 21:18:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc/qXzTFN/t/+OYqd3CSnD2D6ymVWtSd4aCb3VfM7+HuLc4O7Oepu2rkCbuuL/gZbRZb/fr
X-Received: by 2002:a37:6586:: with SMTP id z128-v6mr6689305qkb.410.1529813899810;
        Sat, 23 Jun 2018 21:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813899; cv=none;
        d=google.com; s=arc-20160816;
        b=ELPlwZodFMTBtw5VFeKfxkgbAfkfuKfHCgdUlEfKVbtdRCmWYPa2X9n9aXMJmKI2v+
         mCiuN8yfnbJnr0ImAxFTv46JOfhnBFUIX7yHkevYkY4TW990BMW8JNd2JOI9Lc2Im1s3
         fbdshlYfQFnHamRpD1xeMJ6L4/WKMCcEhxfeqoGl1yWqX0mAHHbEUk8Nl+EJsGR4DWGC
         MFMpTmfojpYf2wv5hE6GZ8l26OCehEIBKHW0q7O8O1eTG0wq1KtWToc+BuXpx9IQPxek
         VIHn1j4D6ivf64l7i6jMSnTs9BCIfTveWTz9BxeWCO76kzC5MKIKs2kNtf4tKtIz1KVh
         oQUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CdRYXCWhsmUMH0swMo21YkdEym9cTZmwH2SpIoP+Acw=;
        b=AhInlCvRm1DGAnyI84DmibVN1qdAvrWDQLKAqSjp63QiWc+YENlHGAE4Cv9vBmAyy6
         /V9p1b7ZsPR39+ai6JEj5FT9O0397ucpeGgFC87I37448Y6XbnUM+2v9707Dmuj5R/SH
         9UzT+1n9Il7IyNMBQlr5Dql/AmwZNbna6KaeBREqHso7cVEb2Jh9POBhNY5sAGhiXvNF
         iXsGtbPwseTUSyjIowl1DFWE/NElPhTJs883RSWpVcFLJQt0zHGDV3u7Prc5QQkkoawd
         6qK7XPwzwDB+v0Uwy/J6XdqMe6j7UzF1CeZGI4D/3APWQDpsCD6uP+KTxU+ELqbUYsML
         oKXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pJi5+FIQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w195-v6si690714qka.252.2018.06.23.21.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pJi5+FIQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwTj-0004QJ-BW
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:18:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIq-0004Fp-OF
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIp-0004L8-Tu
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:04 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37252)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIp-0004Ks-PB; Sun, 24 Jun 2018 00:07:03 -0400
Received: by mail-qt0-x244.google.com with SMTP id a18-v6so9352901qtj.4;
	Sat, 23 Jun 2018 21:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CdRYXCWhsmUMH0swMo21YkdEym9cTZmwH2SpIoP+Acw=;
	b=pJi5+FIQaOnrJ5HEq97TOJtF23p/ZpX6NeRN/98BwA3XCehnup4zeDAC//K+ERpBjy
	hdsM/Kanvwf69ObR6mBH6v9EXQM30SwpJE0E1Ut919QjyakC2Pt2BjDpG6wnYL9MGx0O
	PJG7qXslFri1UL6JXBwLXuQPQX7goxPb3owLRwIyuNnQWn+6n11OuYlnkWAdgLNLqM5z
	lzjrVmYK2zla1zmXHiKMf+k0nFYmDz1jpfTKu8ez88FFMkTZztLV9BrmKMpx0pd4iRNj
	fqTtzXe8IsZN5krkbmSiQHzDmnz5aLAm2TZF3B7BOeaZ9wo7LX/3w2NzWA1yO4okwz7r
	Eu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CdRYXCWhsmUMH0swMo21YkdEym9cTZmwH2SpIoP+Acw=;
	b=s7xrSbX6Lid2YMJFKBnyzZDkF5zAOI9pNfT/ARNu3dRXMmVU1NGoDsnCO0lPGktTgG
	WIvbSIiNvep6AFeLEuYeZMjJpBquV81ZVcEeVfIUIm9N+udLvmytkEkKDL7F6FHPV/Nn
	57jg5C79PzcR8+gMp9SG8yWp46ljzOF9udS5ACkUrcpGcY90m5o9g0gBJ9LnmrUvrLho
	7dLBAaQNNHkZq+Mi0IAbAB05ta8rHxdGWdwxrF307Wk/PMG2n6ZAohnJusIquDG6NZ3L
	ODFsIqx8pQfmaS4JQQ8mazziIXsrSm+4AXRuKn7uaT8PlIgG1IXZJZsXEnrarGwVR6Wq
	mmnw==
X-Gm-Message-State: APt69E31aFH8J8ealIdAkcTxT0A5Dri8MCGABgp93zOs4r1Rrx4ZpkOK
	8cvsaczJ2HlcrAgU//VwfJs=
X-Received: by 2002:a0c:e80b:: with SMTP id
	y11-v6mr6819845qvn.10.1529813223376; 
	Sat, 23 Jun 2018 21:07:03 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.07.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:07:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:07 -0300
Message-Id: <20180624040609.17572-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v3 14/16] hw/net/smc91c111: Use
 qemu_log_mask(UNIMP) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmfcGdLcrU8f

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/smc91c111.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 9094c0b47c..d2fd2040e8 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -362,10 +362,14 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             SET_HIGH(gpr, value);
             return;
         case 12: /* Control */
-            if (value & 1)
-                fprintf(stderr, "smc91c111:EEPROM store not implemented\n");
-            if (value & 2)
-                fprintf(stderr, "smc91c111:EEPROM reload not implemented\n");
+            if (value & 1) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM store not implemented\n");
+            }
+            if (value & 2) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM reload not implemented\n");
+            }
             value &= ~3;
             SET_LOW(ctr, value);
             return;
-- 
2.18.0

