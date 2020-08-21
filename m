Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp485941lfy;
        Fri, 21 Aug 2020 10:30:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzycSes5pLLjQCvH4DpvBrdnQimg/mW15AwrxGM2H/mMCDoyjyHSJ3syjIwfeb+pEO9PAY
X-Received: by 2002:a25:35c2:: with SMTP id c185mr5027695yba.304.1598031024845;
        Fri, 21 Aug 2020 10:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031024; cv=none;
        d=google.com; s=arc-20160816;
        b=weOurJWTa1jO6Xvx1KRXU4xQFpPoJ7Ua6C9VaForBynvjNWJkBeD1Ba53jyIqBLvFE
         125o/T6I2maP7lxrTx0b8WPD78ehpyNzDGQNHF65BWgRtSimFkVinJ4FfqekM1GPLpAU
         usetOHO8KBE4QZ7zbzuaqdwy5F//EyqL3a5QWGbU9ZNujOEdIgjYj9+RD53D37kq8p9r
         Bgr+lgn4Fu09wCILWdq5mquGi0FjF5EMemMGvUx6G8qBs/zTj+Qs5mGXhOwO014ZApkW
         +WygQ8p12uyRa6LHuPTFpsVR3X9BZ1Sj2V5iVN9uealBtnuJmcDAOE/nPCu8MVyC5LYD
         MWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T3HxLggQDXKqoaLt6TAzlir0cuy+gHIPYF6cAJuIjDs=;
        b=M1wF4YeS+x7lJ6XxhnhyZo9/FS/gc749emDkVRFq4yapn/Tqaad6NC/3YpX2wj66XO
         iX+l6K3oehVwOZ2H9grKPk/2tDUW4Acpr5BwYkn/JBew8qAY3sPOFW4nytqw95OYXMYk
         UiotnwNyDjAag7X+oDrepJJKfCPxayeM5wYXqvYB2MPFMzcJlBANxuutDPmpgZBMuJRR
         2P5Np4keGlQue3TpAMbVDIGMvCUYL0m1WrPmCJ8BlRXevMSbLRT9JXMkSqYTxYbUlDtr
         /8RD81uBfIi0rq7+BdHA/nXyE1UWrqedLeiwf7npLbjhuFkyfQV7GUYIhoS+Xs0ne7kR
         FTkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PdBV2wva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 79si2555828ybn.237.2020.08.21.10.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PdBV2wva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9Arw-0002a1-3T
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar6-0001IA-8o; Fri, 21 Aug 2020 13:29:32 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar4-0001AU-I5; Fri, 21 Aug 2020 13:29:31 -0400
Received: by mail-wm1-x344.google.com with SMTP id k8so2576007wma.2;
 Fri, 21 Aug 2020 10:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3HxLggQDXKqoaLt6TAzlir0cuy+gHIPYF6cAJuIjDs=;
 b=PdBV2wvaScYeh72kjjasn+X9vauoXQeDUGSWRXQOa8x8VmbDlTu4yVSaWyKi2U4Aov
 9W78o93CNRKvrS64s7/qKjuWJT00VWL1tn3TQyPaHC9qltUC2zYWiA+qw06c3HvdlQZ5
 0JLei/B/4Ap9h9AX3fLZSl7sOKXLfNzNzIEHdEU0q51sJ4NR9gAovBXVia2ZfcmUkPTC
 uE1feC8BvX2zpAzFMFKl/uu91DiQEzTQXrNjkKOS1i4ZJVkUCHzmfhhN0WOGGuF4NjnY
 omo7eozIODPHSYYYvmL96iEquGBGbtJE1AHkog9RRVfAav0+SjzH0r4WwiVPzLgXK88M
 VjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T3HxLggQDXKqoaLt6TAzlir0cuy+gHIPYF6cAJuIjDs=;
 b=XX99aslR+IQEwKCJEp13HWgSjLTi6wam4LkBIMbCootz2Wu+a2vZCzy13UGRBpOiqY
 rGYb8fNhzypX+j7z2O4Jb+uta978viw24SkAqfWJuaGz0oibtrnfpC1rj6M/f7ownkUD
 cs3kc0krlrPbT45Mkko734ELFxDChn5rXNP7yjNrLCYxNRASOtvubAb24IUYSTHFmH7L
 QLWcZ7GSbf9KuocCtBCDCm8faZyD9q4RoO5XODlUygCKc0GrrEV8oMK+UHLGniS5XYCq
 zLF2v7hz2fbWCjlD9r248kMnxEmNkJFXpQVr3pZKqKFg1LckZ3AiSKxAsZKPX/bzOeh1
 YvZw==
X-Gm-Message-State: AOAM5319Z3fbOMgy7u3XsqRIDAAhTmhxpd1K+E+gr2hKB/ZEeSWjBZfc
 URq3VtHVxGrTC8rVKM62ua7G1ZGsk/I=
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4180819wmd.10.1598030968201; 
 Fri, 21 Aug 2020 10:29:28 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] hw/sd/pl181: Replace fprintf(stderr,
 "*\n") with error_report()
Date: Fri, 21 Aug 2020 19:28:59 +0200
Message-Id: <20200821172916.1260954-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c3p6UTEV8+JT

From: Alistair Francis <alistair.francis@xilinx.com>

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Message-Id: <488ba8d4c562ea44119de8ea0f385a898bd8fa1e.1513790495.git.alistair.francis@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/pl181.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 2b3776a6a0f..649386ec3d1 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -15,6 +15,7 @@
 #include "hw/sd/sd.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 
 //#define DEBUG_PL181 1
@@ -148,7 +149,7 @@ static void pl181_fifo_push(PL181State *s, uint32_t value)
     int n;
 
     if (s->fifo_len == PL181_FIFO_LEN) {
-        fprintf(stderr, "pl181: FIFO overflow\n");
+        error_report("%s: FIFO overflow", __func__);
         return;
     }
     n = (s->fifo_pos + s->fifo_len) & (PL181_FIFO_LEN - 1);
@@ -162,7 +163,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
     uint32_t value;
 
     if (s->fifo_len == 0) {
-        fprintf(stderr, "pl181: FIFO underflow\n");
+        error_report("%s: FIFO underflow", __func__);
         return 0;
     }
     value = s->fifo[s->fifo_pos];
-- 
2.26.2

