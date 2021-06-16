Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp68828lff;
        Wed, 16 Jun 2021 00:35:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcqwrWARV4LoRNCLt5bCwxHA7+SIvCXULDUe3GCOYU53Ue2XY3SBTrq2fUOph9nX3quzXR
X-Received: by 2002:a1f:46:: with SMTP id 67mr8221115vka.24.1623828901314;
        Wed, 16 Jun 2021 00:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623828901; cv=none;
        d=google.com; s=arc-20160816;
        b=0tvM5diQ01cZ+vCjjlrhHzLH4hy0w1SZHEBSr8klCMWR7zjlO8AuBOXwF3GCkViG6F
         PoNuhidEkZE2hdOe2B2bdyKEj9Uw0cML14rStm5880Vbc6zvOPfXVPG4v4owGKk3XnYb
         bZrttnTHkzGs+BFZjtLBdMIfLfkSF2K9nXbrUHmdf2CQhhvJ/ADOlS5PtVK1bu6/tOAO
         oHQBz//2dI8LpjwgMO2Q9JIwGUWplJQSupx5JcqBQLBNsYuM50AjQG0FyVrsQrvS9s9g
         EjpAD9tI0PmhH7lBPVBO92kOSLxnXd+AuOEiqLW+rtC2G39k9Czf9/6sNZ0duBTkRbDF
         uu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4DtrUP/MiMzrX0T5UIQ4BfAJOymoToD8UJQg58+oReo=;
        b=qxEQrBYCaOUafRL7jtctOlR/TPWMk+TIRC9d397A0XWAOj5kIkLeXiejD495OoqCf+
         QLcBKCsCNVDxvIPUC+bRarNyZQwdfud5NIQa8NdD4SlMZDOn01OY1VBKAs2TKGt2Ugh4
         6yQltbBmQLHWphEzzv9nZvBEbXZx5KiKKPSUWmK5LfCwIyydA4TIGlPtgoTgx7DONVPa
         PVMM6QNK6h5R4KDerIV79FB8FtJixGmUpCrDTyEp4rAAQlWn37Jgu01EhlOjWulW1TMd
         Lw5MWCiFuYiBQc6JbH97T/QiqKfuDnF+Ugv4ooqFZXrkXr/NoM3Tk1i2C+AxvHvVH0/c
         TN2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hE1VcQli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n30si1204913vsl.34.2021.06.16.00.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 00:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hE1VcQli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltQ4i-0001FZ-GP
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 03:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ltQ3v-0001FM-QB; Wed, 16 Jun 2021 03:34:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ltQ3t-00019a-QL; Wed, 16 Jun 2021 03:34:11 -0400
Received: by mail-pg1-x530.google.com with SMTP id q15so1237065pgg.12;
 Wed, 16 Jun 2021 00:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4DtrUP/MiMzrX0T5UIQ4BfAJOymoToD8UJQg58+oReo=;
 b=hE1VcQliZ+X52eb89Cvmt3qSaK7N9I393kQJUYYssPFNxg4OG2CUPp7D2MuiOYZeDf
 b+3TIow6HYBaMBppvWi/3Eqm/OYXnqcx/lKE21wiA+JeA5ndkkLJvuzs8CsRVqOSgcCN
 E7lfkCdTT+68bbqnO/hcep8JMdPO+rtdsenBhsJNqfCiK0RMqCraw9zMuH7qZVGtb310
 kajTZ2bhLXBoTyjvu5zDgAZ52dQ1t0bUAJmE5nXehWHjAbu1B0IWzw5yuNfXbDlFqxPa
 V59tqwwAGqlz9XKfHic18+3sWgMvbhmLFzYLut0OwDFg9KUlgWQh7ax/h7fu4ZZZfPzu
 39FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4DtrUP/MiMzrX0T5UIQ4BfAJOymoToD8UJQg58+oReo=;
 b=K09L1vvgYVOgGsFgF97hrZn3E1csiFOK9+jDhUnCHSOXEyWC1CBtY3pjYQcdFvIqS1
 4ZxtpWplbAYTB8Tc7MJXDLgep86HEVqx/dzZTz6Ba2cZ1DTgzZdtxGXynBXWJrF8R/o+
 yHsri3xA8mOST81SNf0nSMkiWTVUisgI6qNKremk6fFVC+eg06z/eqGJIGq9nSwCBoSl
 RzpcHQ1zpF4sWYg5+PN3UltOna51QyuANMgmuQfmPJCZjuZ1OW26Gs6tM3aagA6dtNHd
 zqtgj/yiZCM0snjU6cGZsBp7dxzsVeH1GPcsWcEqvbxFK239TSCOJTsjEh/uHK2dL++f
 AWJA==
X-Gm-Message-State: AOAM530SSTAbdGTMPLpHBn5Z7HqU+gbBEKwmU2y51GQpiA3codq0zUzo
 /mGBu3wkyD3X/0/btittGXc=
X-Received: by 2002:aa7:9988:0:b029:2fa:c8cd:eb66 with SMTP id
 k8-20020aa799880000b02902fac8cdeb66mr8336344pfh.62.1623828846430; 
 Wed, 16 Jun 2021 00:34:06 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id a25sm1208420pff.54.2021.06.16.00.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 00:34:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/2] hw/misc: DPS310 temp and pressure sensor model
Date: Wed, 16 Jun 2021 17:03:56 +0930
Message-Id: <20210616073358.750472-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x530.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J4ooszW4Zdh6

v2 addresses the review from Cédric. I chose to drop the qom get/setters
as the logic was quite involved, and requires more work to get right.

This is a model for the Infineon DPS310 temperature and barometric
pressure sensor.

Joel Stanley (2):
  hw/misc: Add Infineon DPS310 sensor model
  arm/aspeed: Add DPS310 to Witherspoon and Rainier

 hw/arm/aspeed.c     |   4 +-
 hw/misc/dps310.c    | 231 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig      |   1 +
 hw/misc/Kconfig     |   4 +
 hw/misc/meson.build |   1 +
 5 files changed, 239 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/dps310.c

-- 
2.32.0

