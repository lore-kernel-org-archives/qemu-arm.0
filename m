Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp332144lfq;
        Fri, 8 Jan 2021 01:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/T/jD0p1hjqj4QxFknYuxODMkIdCVTh6qT2QIe1BGaCy140hE4ALvhnC4yShV9MPGY7Uw
X-Received: by 2002:a25:dc7:: with SMTP id 190mr4314136ybn.73.1610096932469;
        Fri, 08 Jan 2021 01:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610096932; cv=none;
        d=google.com; s=arc-20160816;
        b=e26/tRFpoSdQNZ0ORi18lbJeU+sMWABt9Hmixtqctu6xsJOh58qMuq07w3/luHVURC
         m33b5P1XWaFPTIL9rtLJBbQU6omCxOMg4RU3rnlX9CjaSWdoSEkRUNGv2uvQZDHzt+In
         51KHTCjbMyd2dOp8Ekg79YRFCzTOqlHkQOXz4WC6SLJvDorbuyAjcDqA7uWwgLrTKXsu
         LOUDb6tdWPA7Fl0RnX7LnKpINr0bz3Yunv4Ftztm14Vn7ZRsrvyJMCIRg8eoXRy63YuB
         /p/Q1B5+H2KpAKUi3rqlNEMvHtQHHsfR61zpsPfTR442AjB6BZL9SxR+pCNyYLT+8gJY
         CCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Bfq/DPhZlOiFa7c29bCin35uw55zaDNERk+B2hF6PbE=;
        b=aK7z9tZ+p+j1j2/BRKTJ/3iEttRmk3bt4MNPyozCAHbdYYjBQHoMI8E2DO2SGTmMdt
         VtoaBL99OBHixtqXtmNQpog647ZAwzjg9UvZZGL+HkrJItGjinn4NVE98xxsk7ASFf2A
         QkrrPAe2AnUzDGBAdizID09CgC33OXEyZV8qOxYTDjh2wfTcwOq0FJ6sv+xlmI8ao7+u
         haKFMs9K925Z7zJ7D+Mhgaal/SIGoalKLjqFE1Tm8vXFKEQHDSDsWNZECAylTj3lto3f
         0GinUQFKtoIboU8u8rUwUw1cS+o8tscv9J6cWJ/WjBFpfF9bl8Mn78TdH7mXv1JTFZ2g
         ID6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si7834653ybd.395.2021.01.08.01.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 01:08:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxnlL-00047I-RK
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 04:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kxnkz-0003py-Dr; Fri, 08 Jan 2021 04:08:29 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:42252
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kxnku-00007F-LW; Fri, 08 Jan 2021 04:08:26 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 2F94C5FECC;
 Fri,  8 Jan 2021 10:08:18 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCHv2 2/2] target/arm: enable Small Translation tables in max CPU
Date: Fri,  8 Jan 2021 11:08:17 +0200
Message-Id: <20210108090817.6127-2-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JfZd+Nh/rKhx

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7cf9fc4bc6..da24f94baa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -669,6 +669,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr2;
         t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
         t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
+        t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.30.0

