Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1076072lfc;
        Sun, 21 Feb 2021 07:29:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMSVkKmGDjbuU/NkIvXxbMO0t2picloq/G68UB9NJcf4F7zHFSNfjP3+idaeJWS/N+6S6v
X-Received: by 2002:a25:390:: with SMTP id 138mr26695387ybd.130.1613921391367;
        Sun, 21 Feb 2021 07:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613921391; cv=none;
        d=google.com; s=arc-20160816;
        b=RPixyNFD1Pax8g5g/tPlGwffPyq3xpOkc7JH+beSygWluoPs3pC7mz1TeMmOW8jpG9
         1J+WtPEDFyzpU8ytAxou6/JVbQ6W0aRw3ui+HY73xu9g72V3DCG+olRCoLxVt8gEMPTh
         w2nvXr5c8rr7v1NE5V0IzYUBifFWLj1ZMA75boT4Fc3PNGTK6wJgglPbEPkeSYPnwlnX
         6DZOvbAYS4NydOvOTutVPPZ4/iuYyY9s/eW4CjI0A2xvSwbxgAULffEEeNClnUaAHMe2
         ahI6yw3nlxT9/EAietYxjaU0BpOsA4fWpnVp3pKU6asWskSSrPLPGwoOuW9wLoqQw22b
         AmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=C6z2cTHx/CdvWfBU2fviDIPD/Eoc+hYJ1XRwM47VC4Q=;
        b=fFC9Rl808oPiDZ3dIZiSWjiPWuWQV6LRaPmL/crUQyOEYQSSV75Rj5qnmEiY7LP7MH
         sECD5c9Reb3HttGv+r4rLF1tmGlPmI1vYg2b0GUoxF8HyoFCUY1rVKASF4mCkVMH16Rm
         yeDYWYZ0Gr+eVELSVp6l5hzK0v6q3HQI8XYU/3PmYvwoGxOiz75EluUFtq3wCYGsV5sg
         O6lU4A3deHf8NHfNhvCMi9Dx2MkjyCxJVCe3+L/8huQw6tjzdDPYDudxgC8Cjpqg0WY6
         U8vD7G/ouZ9SHX8aOc//0dspSF/iPPe4OdZ4cnJHJxl6H+JWc0xZtsNq2HIOSO6xsGD6
         724A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="N8yXj/qB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r133si16182082ybc.364.2021.02.21.07.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 07:29:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="N8yXj/qB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDqgA-0008P4-Pq
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 10:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDqHp-0001Fe-70; Sun, 21 Feb 2021 10:04:41 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDqHl-0006Fz-4m; Sun, 21 Feb 2021 10:04:40 -0500
Received: by mail-io1-xd2f.google.com with SMTP id n14so10644880iog.3;
 Sun, 21 Feb 2021 07:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6z2cTHx/CdvWfBU2fviDIPD/Eoc+hYJ1XRwM47VC4Q=;
 b=N8yXj/qBrJ+1AAQwPn+XAbvKp0ccEVJ3JrmG7K06JN1dEQNL886omeo0tmhc399XO0
 srCM9BJw5ZadxE+Kklw0fYy4gHlcg2nTUmfmNFxoNw7DaWuI/SbaY3NKPkdBlQ5j+YPv
 hTn/BDzpzfntOMwfutLOqhBjD69dg4AQm0T1eujXkZEvGJupO5maZBIult41pFtTeATM
 oIvHod+DR6KMRCDK3hVd+QS6lTj6XIbxW4GQSFtnPVbKNu2Vy3HiJSeEwmEmwtjTjQql
 jMG4BQlkggmhY8ODd4uRKkZXi0PZ1/yO8g5WaangkqOjl5NBqa9tSDfUoO+yl9yDfqgs
 OjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C6z2cTHx/CdvWfBU2fviDIPD/Eoc+hYJ1XRwM47VC4Q=;
 b=bzFNjhCVcPEpBEEgi8y60g2/gVQEnzDZF4ETY1wWItnGwN8l5B4JBMoz99JfedMKQ1
 NRYyQu/0Zg2mZjKPtzdPik3dtGhXyMJxcUlDdTZJkL6MNvs89CBMxgGBEE3MaWIhGEym
 z40qsCDZGG8LvLEy9q2SgWotHTuvhP4OJqeCU+10qp0uFfblg8aMeZZl01WU2w376/v+
 2MGgeMVXh/H1+k9oMZFs8l2JFV6rTFub5+qeH+MH27IXmAPBAbYSUWzKKPdvtBcOzquZ
 vsAdzNYhFoklKl9xgLvtsKeTVApc2wogWTmAqX14FjpIiCOBaf8U75RypN7abokyRTuQ
 26qQ==
X-Gm-Message-State: AOAM530EU8J7X7TFbTt7McZxGIQ6bRB9pSnSZ6mWczh2E9UPpLLqeICW
 hvdd6ukKf/SKo5d1wso6TQE=
X-Received: by 2002:a02:866d:: with SMTP id
 e100mr17934515jai.139.1613919873425; 
 Sun, 21 Feb 2021 07:04:33 -0800 (PST)
Received: from gastly (c-67-177-215-41.hsd1.co.comcast.net. [67.177.215.41])
 by smtp.gmail.com with ESMTPSA id n23sm11226275iog.3.2021.02.21.07.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 07:04:32 -0800 (PST)
Received: from zack by gastly with local (Exim 4.92)
 (envelope-from <zpmarvel@gmail.com>)
 id 1lDqHg-0001d8-3w; Sun, 21 Feb 2021 08:04:32 -0700
From: Zack Marvel <zpmarvel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/char/pl011: fix receiving multiple chars
Date: Sun, 21 Feb 2021 08:04:30 -0700
Message-Id: <20210221150430.6223-1-zpmarvel@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=zpmarvel@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Feb 2021 10:29:43 -0500
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zack Marvel <zpmarvel@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1PvNkDLFE0Zu

When using the GTK UI with libvte, multicharacter keystrokes are not
sent correctly (such as arrow keys). This is not an issue for e.g. the
SDL UI because qemu_chr_be_write is called with len=1 for each character
(SDL sends more than once keystroke).

Buglink: https://bugs.launchpad.net/qemu/+bug/1407808

Signed-off-by: Zack Marvel <zpmarvel@gmail.com>
---
 hw/char/pl011.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index ea4a4e5235..2ea8fd2685 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -300,7 +300,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
 
 static void pl011_receive(void *opaque, const uint8_t *buf, int size)
 {
-    pl011_put_fifo(opaque, *buf);
+    for (int i = 0; i < size; i++) {
+        pl011_put_fifo(opaque, buf[i]);
+    }
 }
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
-- 
2.20.1

