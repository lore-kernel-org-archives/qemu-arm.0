Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5182188ejb;
        Tue, 7 Feb 2023 02:09:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/o9/jlSfSBctLik0RMj+QeH8y1wTf3zMzRtVvDbDcmrRCtxvs8P0+6Bou6L9VU0y51pdsz
X-Received: by 2002:a05:622a:110c:b0:3ba:1acd:4da with SMTP id e12-20020a05622a110c00b003ba1acd04damr4364713qty.60.1675764595162;
        Tue, 07 Feb 2023 02:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764595; cv=none;
        d=google.com; s=arc-20160816;
        b=cx9HS3uBD2/kRRJSXBjFANH8pUahfL3Xi8MF3uB+mwemCvS0QwbtlLavFuf2oICOho
         lZxwlxNmbIytDocC8TPsNERRlxbbt/jwoLRrIegedB/NGPerVuiPlz2ATNSTPTRjiWn4
         OD1nUsfbDMl0HzJUDHxeoEWG75mP4gyTalVkx7V93fXWCZZbz6Uegmk0cGLNHU8hRFN1
         Ygne9oB2at0INUZWokefoRkK8J8FmVSWKsGk1wrCQ8JLxJWj1HzBuei2DBX5jgpM1JFn
         kLtLjkOSf4bH+ZSnY/TujsZa3gY+2K5l86RuTArr0erRZ4YMjB7X6MmBvPC1xXersbzX
         qJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=WTRJx573F1g76LyXW1h0flKwIQJR8ubYoqE3RoOHtjI=;
        b=yl0/YLsiBZJIGAt5WMbbm+sobK3l0ssU7mZtce7pXk/gx7VXZNmavQsxXhgsfwWRZv
         KWC/u+5+lDhdHWohmMDov83rsmUKk4UTNdK/VMmJ5WzBx8aNFvNi2GcyjauzF2WBaIjx
         UVvMrr2gkRtFjfnVUHnWx/HJVUeHdkQ4xjUxgjHDib/91IPRnNuqnQwFBHj1GsC4fF2x
         Sh/LzyiDvek7qmDB2hK1KG5aq/AS0cX7tcfwOmDXuqHDhrC0nbqekSBciMq+5uLF6b8z
         IqBikBNav8aMJG/PpZWrxwuG2LxOKft4+aBA/1PZD4zpbReN4Dm6Obj+OQRYMWrB1Egc
         BwCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020ac807c3000000b003b9c57746besi9021119qth.622.2023.02.07.02.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:09:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuV-0001LR-DQ; Tue, 07 Feb 2023 05:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKuN-00016C-Qs; Tue, 07 Feb 2023 05:09:07 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKuM-0002aJ-2q; Tue, 07 Feb 2023 05:09:03 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zP705XWz4xyB;
 Tue,  7 Feb 2023 21:08:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zP46xp8z4xGR;
 Tue,  7 Feb 2023 21:08:56 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 25/25] aspeed/sdmc: Drop unnecessary scu include
Date: Tue,  7 Feb 2023 11:07:44 +0100
Message-Id: <20230207100744.698694-26-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mPWjn/JdnVZ/

From: Joel Stanley <joel@jms.id.au>

The model includes aspeed_scu.h but doesn't appear to require it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230124062022.298230-1-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index d2a3931033..abb2727933 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -12,7 +12,6 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/misc/aspeed_sdmc.h"
-#include "hw/misc/aspeed_scu.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-- 
2.39.1

