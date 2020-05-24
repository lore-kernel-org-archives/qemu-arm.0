Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1100796lfc;
        Sun, 24 May 2020 03:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCItx1f2SOW8Iw5ODyE8iNUzicZQLs/n6C148UEOPblxN4/m/kM402HT5ziXOWU9avLYDJ
X-Received: by 2002:a25:9387:: with SMTP id a7mr5684105ybm.1.1590316727616;
        Sun, 24 May 2020 03:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590316727; cv=none;
        d=google.com; s=arc-20160816;
        b=KBlcsuNDjr7UFrQEyxqY7vUIwePYtAd/RkXgYhRIYc4RJYZMR+i8gnH+ngO6srl5R6
         P6lLIWn9E1srT3xjMXgz2d8Fu2o7OhAmTyCn1OMFKMmll9v1VxU738F8sqWSbXmyPy8O
         O36CDfQq5jJM1P/2UIPqMLrUof0rvhiPJaxbX35HdQCEsfYHWRrUMBrMXcytz6jbx+px
         N4pE3fl0Dk0QMQ5mlLC2pf3XJhQ7KNDYTS3ZYxMHEIinSC1/Q2FvebJOAReQ8T8HgfPe
         7YULR0zzoRZT7jL6CFlWQ3c343V8NkBM9ryokCZHY4LN9jshWiFLLzRRuqIeViEZJGUb
         B1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xv8ZA3fcUN8kM/s02kASb+D+Ei0KDbMU50VMBXHzoSE=;
        b=qUxZ1ZjyamIbFY+m453ZtFlI4Ro9D9ySx+MLE8LaCyJhftnwj/g7hnvq/vp+pk5gbx
         UqciCLzQQdJXuYgPn7Fhb7rcw9Mf2/aOTkIJd1GAu2NnsIzD+POO6WQXAhdS920wAwki
         ZwtYV6ZuxVfF8hrww1oDfdggN98uGVT65g2om0plFoWtWN6bxJ8G9wv/rZimMA7rsnvq
         H6e13LuTsXKtWEQK9lFxurUWeptc01w/3Rkzg64Qja5l4xXp9nI3ZWCBl8NLfZ46xMbz
         3ugqoJk4vTgsg2xgAncZ5Vm1H3lH8Nzby7Y4c2olauSmk2p64oWJsvfb1LcPIhkQiyul
         c1aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SIhhXM4w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si13228807ybc.321.2020.05.24.03.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 May 2020 03:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SIhhXM4w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jco1n-0002lG-1k
	for alex.bennee@linaro.org; Sun, 24 May 2020 06:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jco1f-0002jr-7D; Sun, 24 May 2020 06:38:39 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jco1e-0004S2-8K; Sun, 24 May 2020 06:38:38 -0400
Received: by mail-wm1-x343.google.com with SMTP id c71so2370418wmd.5;
 Sun, 24 May 2020 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xv8ZA3fcUN8kM/s02kASb+D+Ei0KDbMU50VMBXHzoSE=;
 b=SIhhXM4wgwVlI4cuHyQpklStTQeh0Pdq9F4pPBRupwUR6mJtyLttXJBWzOqjnp9iC4
 5uEj0YCrK06BkerjHJ2eBLEwNhabYzaXwVXg0+QFClZkrQ+EaPq2eXLR+4zcIPQjJLVQ
 dlgWY0/t94iEfaIKk1SKJo+36dAJoL4g8fHFE226nIACE4S38QPhsFnVD5jgMYsv0BYG
 wTpqC6VMnLka2ntquHWOdHi42sHNWcAWnOPC9mUVT1nOP2cpvdZi4GvnZoSDzl57ZRBu
 FJWSZ2J24t+3UymcBbr4zcLdeCoZTBqB7BgxTZjL56r2MbAicWzE6pZzMiu0xvaNsqGL
 IkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xv8ZA3fcUN8kM/s02kASb+D+Ei0KDbMU50VMBXHzoSE=;
 b=Y2USKM11wMKLZhmbGdNe+fQoiadFEJMM09SMJs6XbqTmGlYLzQEvOjYxics7/FOluf
 kSVCl7TukhbxPMHB0OXpdK4bKJIYB0JBJl/cGJNBOP+4ryfdGe5MDWjfpL3ePPgsPdJa
 HTCHniwILzvn/JJYj2aSL83Af1hu3kW44UphxaueOE6K5fiaqQALCYWC74+LNCUXg3zf
 TWUYd+Q9UB+uyQSnan56wpJaCvC+xtV++QKE1Ecn7t0rNSgLqsjOjHtC9U0mXGxuH0mr
 lYbmL5UBG1/iKA+UbVyH+kMC3yP9iKuhDnFdT/1NiMeieRrpRdSQx13v+d6fU7P95s02
 4+CQ==
X-Gm-Message-State: AOAM5317lyc5i0W7bSBnU635PLUAJjcHLKt9IT9ADhPjML9esYM5Vtvk
 B6wginGiktHz+GY2aAKQNDNEE+YioOk=
X-Received: by 2002:a1c:1d94:: with SMTP id d142mr872506wmd.42.1590316715790; 
 Sun, 24 May 2020 03:38:35 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id k17sm1141504wrp.28.2020.05.24.03.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 03:38:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/omap_dss: Replace fprintf() call by
 qemu_log_mask(LOG_UNIMP)
Date: Sun, 24 May 2020 12:38:33 +0200
Message-Id: <20200524103833.8188-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fGtDbB46swaH

Replace fprintf() call by qemu_log_mask(LOG_UNIMP), which is
disabled by default. This avoid flooding the terminal when
fuzzing the device.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/omap_dss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 32dc0d6aa7..21fde58a26 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -619,7 +619,7 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
     if (s->rfbi.control & (1 << 1)) {				/* BYPASS */
         /* TODO: in non-Bypass mode we probably need to just assert the
          * DRQ and wait for DMA to write the pixels.  */
-        fprintf(stderr, "%s: Bypass mode unimplemented\n", __func__);
+        qemu_log_mask(LOG_UNIMP, "%s: Bypass mode unimplemented\n", __func__);
         return;
     }
 
-- 
2.21.3

