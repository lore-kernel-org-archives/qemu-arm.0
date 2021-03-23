Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4711748lfg;
        Tue, 23 Mar 2021 09:49:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtKWcgvISmwsdIC/MaaYcIEccPaqwubAapgS2HjZkDftNlmVFYVI9Zg2utvEEAA8ulYKf2
X-Received: by 2002:a6b:7e02:: with SMTP id i2mr5044028iom.120.1616518184544;
        Tue, 23 Mar 2021 09:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616518184; cv=none;
        d=google.com; s=arc-20160816;
        b=PImYzwixkRENO5dBzYSB9+3qcjx9KxDQCREJeXs0POYzWqHdOT5IRGihNGMH4kLlc3
         wa31TxeXdqxCwhq4Ui93PcbcmWyrSDIAYQ2L1QsQ5QHqBod9I3bjfHB0bFtjTXzAGAns
         Tqy480f3oq6zpA8BmXyDLgqk3yGs31DoWhLqBorqPvaqZoqoFE3pclkkdZtnxbGpdBz2
         39tAn/dcgRrSRsbG5rnKpZ5Z3/SbIsOlSjYrk64WPdfpZxyhSJsLzjMJ6e5K+0WHeXMz
         JBGHLC0iv1npx+qgvGen5ycBSWT658r3Gyig6qC+A9i8QKO4/A5TQIi4daOPYA9Idzml
         Kzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DSeqnX5N97W9rEK9WSPE4QKFRME0UciPhX0NyqSn+M8=;
        b=o6W22SFSosQ4WKW9NDLb4NQZ9tsRE+fd1x7uejpqjufPzvxDb9o+XWOQI9rdPFxpAA
         AaJc6F0MCBA2KjEEbIZg/dG/pZ50U+dbq21cci6YtmKF//sF8BJuWIAG5r9xSUt3EQFH
         zTvVZulZSb3hCiWxsWg2yqgs0xUkrCk+7N5SkWiKL2mXKlIAce79WKl+ivm5dwqhqvVS
         Sz+sk2j3rn+mTkJCFsE7y4CE9IcNOfnCnZMq3BMqS5qCkOZXE9HvdFPPkCEaCxksyhuY
         2gkEKDzmeWuQi54oapYCR4mkW0TxPwDMkMq0mUlMIbsXEZd4/AqXpZf+xOA2URatIoXM
         vz9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R7dUzghB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si12939788ilm.18.2021.03.23.09.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Mar 2021 09:49:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R7dUzghB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOkDv-0000k1-Re
	for alex.bennee@linaro.org; Tue, 23 Mar 2021 12:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgJ-0005La-Ci; Tue, 23 Mar 2021 12:14:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgH-0007h2-T7; Tue, 23 Mar 2021 12:14:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v11so21353304wro.7;
 Tue, 23 Mar 2021 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSeqnX5N97W9rEK9WSPE4QKFRME0UciPhX0NyqSn+M8=;
 b=R7dUzghB9unldNEhViaM1UR8ta25tikMbx6NJdZbQSUvKkIS7hkxVseKMPFTqBHGt2
 OoTRjGw+iYnT+pJaUrjgMSp+fhVu3GNtFWimL98vV5r3ARRERo2QjAkVs386MEEqPHu8
 nVQmaJPBKa9g614UD52Ye+/nZw5Rs+Kum8PucvJL/wBK0a+Qvvde6yBH2cojhO8vmMhd
 7lKMfCy1HsZLeC5bw1NREPHYH3jsO7yTeYfJlmtos/oIfx+Cvb7RBQcNJ3AxRYq/iVq5
 7Ys06xZlAqsdDafhVAtxTeXwB1yKq7mQhJzbcyJVlOHSCHCLIPb0rVWwUZYz1NulOl7E
 VFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DSeqnX5N97W9rEK9WSPE4QKFRME0UciPhX0NyqSn+M8=;
 b=mD6DIjTk1MhO37n4/fugKxWrZP6o8+k95BUngQOSIWQCdeX3J7RrE4X/YDlGEi5fmb
 cskIzY75XTLjK54OS4hZ6j1Qz5epxfdlZeQYWuncgYIaeq/rn4NY7cG4q+UArEn3ilE/
 0jt5tdzR2ghEjjXhsyAkA2i5WEJPB5nw0ZB1MDnUaIDc+SzPDsrqy42vw7/Ni6XnhPKd
 F8SMCyUeGSOg5sECbJKnra2ImW007pS+bLdeyBjEYt6uZp5vtucBvpdSOrOW305RzpUV
 zsoe2QSeZQFAu7YH467B0ILVIa64f3NN7jqIN00ikwpSzF+IK8wBG5ATlczo4gVml5IY
 KAwQ==
X-Gm-Message-State: AOAM530vZe+drHqjX2O2I8F8YQSvicbDXJRGomYPDRG0+nSVu5Extn9b
 RcPNUPOKd6FvE2aP0sT3jhekd4r7P4qrHg==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr4597775wrm.321.1616516095976; 
 Tue, 23 Mar 2021 09:14:55 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q4sm2934464wma.20.2021.03.23.09.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:14:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/display/bcm2835_fb: Use bcm2835_fb_reconfigure in
 bcm2835_fb_reset
Date: Tue, 23 Mar 2021 17:14:42 +0100
Message-Id: <20210323161443.245636-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323161443.245636-1-f4bug@amsat.org>
References: <20210323161443.245636-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R92v09M4vZjr

Directly use bcm2835_fb_reconfigure() instead of open coding it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/bcm2835_fb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 3e63d58e0b2..a9c2e57d1c6 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -396,11 +396,7 @@ static void bcm2835_fb_reset(DeviceState *dev)
 
     s->pending = false;
 
-    s->config = s->initial_config;
-
-    s->invalidate = true;
-    qemu_console_resize(s->con, s->initial_config.xres, s->initial_config.yres);
-    s->lock = false;
+    bcm2835_fb_reconfigure(s, &s->initial_config);
 }
 
 static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
-- 
2.26.2

