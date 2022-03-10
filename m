Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp837351lfo;
        Wed, 9 Mar 2022 21:22:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTB8A6QmOV6+/ZfkILyxkDiWb8ngWk5x3AAFIDjyljBcxG1Zn2n6ob7/lVE3rEdVjUuidC
X-Received: by 2002:a0d:d6c2:0:b0:2dc:a9b0:d22 with SMTP id y185-20020a0dd6c2000000b002dca9b00d22mr2704393ywd.194.1646889754643;
        Wed, 09 Mar 2022 21:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646889754; cv=none;
        d=google.com; s=arc-20160816;
        b=i6jCgtz4ZM8Mox0mnwNtcRgfMXnShkaqmJIHRDzFQ1QEt9B5YTDB7cT+OSy7bNBbez
         Zdolmld4DitGLo33J8d8Z4D7re9zD8UBEaz7SJ/yNUoaE9EKhx2RZ+5xx9uhXJg7mQkX
         m320v8a5iI+fo+y0bK4UfVVOMQDs+j2oTcvrjtlqWw0nGd3xbTaU4KBKV5TBk8FBKEBN
         ItHuN4ycVwdwHv5sPelX+JQeHdVM80V3rudTkH6mT+SzP3k9TXFaC7zHYyn4sSXoqzhT
         280T+0INKMetYHhBDP+dVNVYc2jxJKyVqqhsLjHZXfUc5Ccri2uTuH3IuZcZD9ZtiuQE
         15Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=OBQTtlB0KqlIMhJnql0rNU1+jRIZv2h/2JcGaWNnNiA=;
        b=PRq+6UD58UzVqzcIC6FBj4ttBtG5Eck6uS3qzjPFO32/ak7vYuegP4SSNv77tK64H0
         ntAFlrUmXCVidfYccvGeQPbFs5DhsmE3zVfSgxeAbfzgs+0aJGFMPoPbuaHdMChFuHE+
         2ijauGCMQs7AxNOcTOS9awrQg7vbauA9bIq6rXNd8OhLv1V0Ycqt2X+1H1zP5z70fA/P
         gV51mO5tzadjoFZTw4bBgTQ19S3xmLf+4wKCC08lMfpF5cjIPIPCCP0DonwELqoTU9SG
         lASUALcmJ3ZN5q0deJOSYIbQ12TUgTpHDyZPtkonjnNKmI1c7MXNvgnXvr+qmOeo2H7L
         81cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=JIrXjceN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l206-20020a8125d7000000b002dc5913fc58si2157515ywl.478.2022.03.09.21.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Mar 2022 21:22:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=JIrXjceN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nSBFx-0003c0-Vu
	for alex.bennee@linaro.org; Thu, 10 Mar 2022 00:22:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nSBFj-0003bT-My; Thu, 10 Mar 2022 00:22:19 -0500
Received: from [2607:f8b0:4864:20::436] (port=44608
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nSBFh-0000ze-Gd; Thu, 10 Mar 2022 00:22:19 -0500
Received: by mail-pf1-x436.google.com with SMTP id u17so1987472pfk.11;
 Wed, 09 Mar 2022 21:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBQTtlB0KqlIMhJnql0rNU1+jRIZv2h/2JcGaWNnNiA=;
 b=JIrXjceNk7xl5elE6naIXZ06Umw8/iT7fhV9k6CsQPFEBBM8WSsg+Pp9pkLh+2OdCv
 +ncyV6F0Lmk8mC4OZWi4abmPwq6/+rOQ+VA6n6dSkWR8Tgp+PcpdNhtA4Vz8JU/J6gO5
 PLz1MUDp9JdYNOYQEeEFZrNzZULo2z8n4q7TKEEWH3Uplm46ko82XHodGeTfzINyz2R+
 5X1vXQSgIAMUpjY5bmBSI3jPJrO7vQ6c4boeICwY/C3ZfJofi+L7IGuJTnbrlP807hTS
 8Pj8yk1niivYbv5FBjHJVYRX6VU3YIroa0eTea72538oTDLTi/ywX1IucVTjxouawONg
 1lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OBQTtlB0KqlIMhJnql0rNU1+jRIZv2h/2JcGaWNnNiA=;
 b=p4Upw86EkyGNKRohygEqieFuDi+XuBV5gbNG3abPmW595/YrFSpNw9D2BV3t6OcHQA
 j29vE1wjm0DydTNqbRhh3FmhiuEG6Dcx9/APCksCXmPbiJAcr9xfzBMZ1NBpZRppEi5L
 fxBjPLFjYQFOdQYNAUBaAqv37onhyuyBuOSigo3r20J9qKHZayczhKGYExfDz0S0kYst
 YzXkcKSGkB32FFQEdbiqbaBKz7I1/KuHtfm8zr+Ug2+LSyLWJQ5wnD5qc2tdn2J1b2XR
 amdckXHHT/boUzCaeWutWblO5Jw14nwYf+qrnBcBdBstttGDLKQK/b0V07R0qlbbtawQ
 Im5A==
X-Gm-Message-State: AOAM530vLNW1VKN3y5llHSdTj4ncdvDQBfbJePT4+0zh1yLWbfTed9Ei
 y2JeczRjtoAsYuRClZfatpc=
X-Received: by 2002:a63:7158:0:b0:37d:f96f:3c78 with SMTP id
 b24-20020a637158000000b0037df96f3c78mr2601238pgn.378.1646889734784; 
 Wed, 09 Mar 2022 21:22:14 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056a0015c500b004f76735be68sm2237242pfu.216.2022.03.09.21.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 21:22:13 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] aspeed: sbc: Correct default reset values
Date: Thu, 10 Mar 2022 15:51:59 +1030
Message-Id: <20220310052159.183975-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YP/u49JjTW9m

In order to correctly report secure boot running firmware, these values
must be set. They are taken from a running machine when secure boot is
enabled.

We don't yet have documentation from ASPEED on what they mean. Set the
raw values for now, and in the future improve the model with properties
to set these on a per-machine basis.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sbc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index 40f2a8c6312f..857a947b68a2 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -17,6 +17,7 @@
 
 #define R_PROT          (0x000 / 4)
 #define R_STATUS        (0x014 / 4)
+#define R_QSR           (0x040 / 4)
 
 static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -50,6 +51,7 @@ static void aspeed_sbc_write(void *opaque, hwaddr addr, uint64_t data,
 
     switch (addr) {
     case R_STATUS:
+    case R_QSR:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: write to read only register 0x%" HWADDR_PRIx "\n",
                       __func__, addr << 2);
@@ -77,8 +79,9 @@ static void aspeed_sbc_reset(DeviceState *dev)
 
     memset(s->regs, 0, sizeof(s->regs));
 
-    /* Set secure boot enabled, and boot from emmc/spi */
-    s->regs[R_STATUS] = 1 << 6 | 1 << 5;
+    /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
+    s->regs[R_STATUS] = 0x000044C6;
+    s->regs[R_QSR] = 0x07C07C89;
 }
 
 static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
-- 
2.34.1

