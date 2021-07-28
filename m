Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp4904577lfc;
        Wed, 28 Jul 2021 11:17:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBdJtGtmgHTaDLlg4WwMpHgPFysLLxzY7U1OazTcv2QQKqhL6WoKzOut3Ysc572JO87anc
X-Received: by 2002:ab0:48d1:: with SMTP id y17mr1397910uac.96.1627496273768;
        Wed, 28 Jul 2021 11:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627496273; cv=none;
        d=google.com; s=arc-20160816;
        b=sJp3/una6OzHzDClAe+9+yOLKcMeqULoYpVJUkvp9fA6nfS9aBqXo4cKNVtnh1EjXG
         D5OvnTPdP5vZylevSPw93L1fsaP9rYizekiPSugY7eSYH0whGLKgif04yCq4hAwxec8e
         2tvLwXRxg0h7WPjitWA/R4fSJJF/BFCt2tz0gawZ4xQP6NnSr9zjwH5VwtoOPhnkJykG
         wRFNFfcO/RLPiUNnTWkGbWhE2GiEcKSzlNSF9Pyjg+oOdbpXglKPs9SA0sY5BiuMZkpN
         CAKrr+OrS1Soat7dUEziv3PsxPYGUE9YkzI08tKDJJsN6p0dXbiexa5yzJsRRX64KzEL
         AiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=w2YlGZlqmGy9fxIGnOnIJxf1hY3ar9R5jXqRYjY7DfE=;
        b=NPjc6O+z5xdFBENi3VgQ3wufhiasAiNSIh3LgSHStycV6O/Yj1mBmBAKBmIrpC0uKa
         R4f2YPNQQz4YitCuqm46JNaxl5nVhrR/7nJq1UYxVx7Ect3cjzQbGGu3lJmGjiyAquIn
         NC0+eS05RIBzZVFjRV29vncC78AuiinDI2ExagkwMU878oQ9X7qmQNCfPFQEgNi8fmZk
         ALcHEQMgL4c2a4QhfGpcD4oysbe3ERAapqeWtrSeqirdJM2CB36W5kHUhVp+iACBkpKa
         RqgglhxTtU+FRUl3QSoAA+TEjSecXqtpeRPrhLK6PeZQPFZS7Be3dSBZig2eelPNwDlZ
         8EFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KsmoGymD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si274633vsk.434.2021.07.28.11.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jul 2021 11:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KsmoGymD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8o7t-0002C3-2H
	for alex.bennee@linaro.org; Wed, 28 Jul 2021 14:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7b-0001tL-2c; Wed, 28 Jul 2021 14:17:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7Z-0005CJ-LJ; Wed, 28 Jul 2021 14:17:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b7so3663212wri.8;
 Wed, 28 Jul 2021 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2YlGZlqmGy9fxIGnOnIJxf1hY3ar9R5jXqRYjY7DfE=;
 b=KsmoGymDGPVIjrwTr3rWkduBkogYKqCrlzTznv+SfYAEEN9PdhtmY9h2rYE6yry0Mg
 8jFiqoUssx3NDdqpzxjCTWuETi/ajjpwzowYEfZ2MlPliu5LsKq6Gc+F0ybbcZ8XZ9xP
 KI9WoJnK2UX/wDtw/ZCJNo56O2MJu0YGL22MMXCl4Iv0ndyQSehI3n9O5aYP0osPLmU9
 CHf7a0oT9EnYtV1HrGJWOHa3PX2UJU2YRZSRefTXNk3YOr7xs6y/+Tc0NmJ7z4FiUPgl
 eCe3Jg+pbs/tintKJPdLHTTvjGndBI3/QR4tqRCaIjET0C+b1LHIRvwI1FozGanj93ve
 4zjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=w2YlGZlqmGy9fxIGnOnIJxf1hY3ar9R5jXqRYjY7DfE=;
 b=fc9R7FLDI3kgpniGKdWb5wDcCczqYY/R27yI8sUkgXUSRfobE5qtGIT0AFqttZx+ll
 /zkIE54zsqXOojLL+e1q0uQ5+DFojUsq2OCrEm5f7uOIIJvXDqFbBHDCat17Pb+kbRSm
 T6HuctsjrUezg/Rq5q+4Wy9Z6LvJtQdRfMnNYdEVu93cDOhcrM8UGRUpAHphZCKHdakZ
 ojxm4kA49FKawVZ4l0n1xnR8izG+6hElROAFbWnL9rWgQ0Y8miCgK9Kq86F2Tz0Q5Rmb
 Rblm8fgTRheJajVnpvYc3Pw9TYPLU3l8DogiHeRWGQIxEPhjyp9zQXGGLEJCs8Jy/p7O
 mRRg==
X-Gm-Message-State: AOAM530VXYYc6g95LLuGBw3iRbP5JaEHzYPdqAu2wLhnZQlwt1JEdqiC
 MU0T8JEIDf8ap2CiAKEWCnUoX7CPYhwoxA==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr697144wrw.364.1627496250667; 
 Wed, 28 Jul 2021 11:17:30 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 l2sm548069wru.67.2021.07.28.11.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:17:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 0/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
Date: Wed, 28 Jul 2021 20:17:25 +0200
Message-Id: <20210728181728.2012952-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SFhb1JYK41PM

Fix an assertion reported by OSS-Fuzz, add corresponding qtest.=0D
=0D
The change simple enough for the next rc.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT=0D
  hw/sd/sdcard: Fix assertion accessing out-of-range addresses with=0D
    CMD30=0D
  hw/sd/sdcard: Rename Write Protect Group variables=0D
=0D
 hw/sd/sd.c                     | 37 ++++++++++++++++++++--------------=0D
 tests/qtest/fuzz-sdcard-test.c | 36 +++++++++++++++++++++++++++++++++=0D
 2 files changed, 58 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
