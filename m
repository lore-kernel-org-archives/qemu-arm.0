Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1139893ejm;
        Fri, 21 Apr 2023 06:16:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZIfeWJLgvi1LgHRnGM4alRdFVNb5Hl3mxXJxTCuUyZ77CqXTG36mX0obIfv9r25fyhuLyp
X-Received: by 2002:ac8:5846:0:b0:3e6:2bba:87f3 with SMTP id h6-20020ac85846000000b003e62bba87f3mr8803818qth.47.1682082995250;
        Fri, 21 Apr 2023 06:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682082995; cv=none;
        d=google.com; s=arc-20160816;
        b=LIKJzNQINdYB4IEnoqaF3iDUwiUl8d3fE5LhDwNvbji9Z06EAuMHbH1CQDInxXLth6
         +ye1wv5iIocloORdrOpaEmNYc08DV3lrYlxuR0xE1n71iMQoaNkP+PxRuiEnQc4tFDZr
         o4ZCxAw787RQLRRot8IuwKPwWT/XeM/fw77YqH4CdNmtaxvcq6C1QSzjPK4gx/mibI8m
         CNrPIYhSE4ul6ZyUuomCdXBWKBU5wtKAemgrkHEBP8Xpbu0Kq5f5IG4Dz30mPjXgEHdg
         90OYSEBp3hDXgcJBQaTh89W6JssWCHZofvsrjtV578fcXujP3evi0VTjNUzdptmsc0Lz
         9Z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=oZZ1dIWjEpEagmgP4f492Dmhz/+KLemo28kqwaulj3U=;
        b=v7ubLF4Z4qPhLXsSZdCWsf6/rR754W1ooeJD2G+4Xe67jK/1NvPoBxFSSmT2YgijXz
         iCOhs8R0mIXtplhNUaBCEr1HllwR9x/3vWLhL6HEbq1AccIHVMzHSRaqAqVs4/R3OVUG
         K9/km3D9m4BTNrlSCTXk5qViXS1XN9xrfUZb+5Y/oQvjBclst4LiAztN4fRenYHtxFk3
         1tuoPQVAm5MnajwUrYszUMvsDtz304tkXCsYeKMh8Y7pIuO8NKpeCM21v7Rc6lhuk5Wc
         ivAEYRpdPnq0j43ROgHzy4VZtaTptCn8rNoFpVdUdOdVYnu8lMiDfTjfJznMWZXhmmYi
         xnrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl11-20020a05620a1a8b00b0074b1936bdb3si3070432qkb.451.2023.04.21.06.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 06:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppqcj-0001oU-RR; Fri, 21 Apr 2023 09:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8BaR=AM=kaod.org=clg@ozlabs.org>)
 id 1ppqcc-0001mC-IA; Fri, 21 Apr 2023 09:16:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8BaR=AM=kaod.org=clg@ozlabs.org>)
 id 1ppqcZ-00015t-5L; Fri, 21 Apr 2023 09:16:17 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q2w575Ntrz4xDt;
 Fri, 21 Apr 2023 23:15:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q2w541Lttz4xFn;
 Fri, 21 Apr 2023 23:15:51 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH] aspeed/hace: Initialize g_autofree pointer
Date: Fri, 21 Apr 2023 15:15:47 +0200
Message-Id: <20230421131547.2177449-1-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=8BaR=AM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +BgoBXkLlwz1

As mentioned in docs/devel/style.rst "Automatic memory deallocation":

* Variables declared with g_auto* MUST always be initialized,
  otherwise the cleanup function will use uninitialized stack memory

This avoids QEMU to coredump when running the "hash test" command
under Zephyr.

Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>
Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 12a761f1f5..b07506ec04 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
     struct iovec iov[ASPEED_HACE_MAX_SG];
-    g_autofree uint8_t *digest_buf;
+    g_autofree uint8_t *digest_buf = NULL;
     size_t digest_len = 0;
     int niov = 0;
     int i;
-- 
2.40.0

