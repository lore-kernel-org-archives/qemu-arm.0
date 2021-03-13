Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2254128lfg;
        Sat, 13 Mar 2021 09:12:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1YPBJqi9kaB2LO44AfkDXVRBvH40oU6DSZ098ryf0s8aFXGDt4hYrCK8f2B5jAQ3lb4YE
X-Received: by 2002:a92:da91:: with SMTP id u17mr6497929iln.27.1615655546876;
        Sat, 13 Mar 2021 09:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615655546; cv=none;
        d=google.com; s=arc-20160816;
        b=GGT+bDW+tm2I4ekX8pEq7zbOl9utWnyhl7tnDupjj1HqNOL7ZFweN3XugIeVnoadWC
         rMwPFpG39sKwG9FoOrSOAaBJiogoC53YHbIqyxGLhzDa7vriabLCm0jHh9MS98FqVo0L
         +Xz1EGvWVZmCU46kzw86GNW8sZgaVdSNZPmnXpqpbtdTSQKnvgrXMQB5U6DKP2qlNpHT
         zjEMYjUfbJlFEM4EJgWkXAYeG4quImwcGOZywZqrU+bxYztOa8zMjdscE7gKMfr1Q7ie
         /vUxtPzSHvV9XO/Eztc/Uo+FOXIh8E85vPDMXDZ34H/aZKbyxvF693X+X8Itz//VZuR0
         U8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=YUEARRun798+nh7MINi50vXMqDU+cTmUPB2cqCr7TCU=;
        b=yoj1bW1NoG9/hj0bcQdSxfHZF4vecgVngsYOkQVCPG3DVcTPbJQSbQbcYZB2ybJLib
         DwtgfIduowD7rl5oFz9YzNTeRuU33bt3+dfX0sswK3AYQHAcY7vJwQHwynuBXjV1A9Co
         voOTZfIIrAEPJcrw79EKTFQny5DwlUIIouIYpvqj1XaqDO8J+ewU9ujXxwXfzQJMlNOn
         AIp5EZll2e/C0/riBp7VpF9qzAx0XhyYtuomiE8r7zhvIEpzfVZlS1xYgBQqT/LfyUMo
         mW8R37bPm9CQoyRZFC0HfdTln5UqWXTa6i4mSytqx2fA/61qmpUE0q/0Ml3Usxumwmtv
         6zxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TAOYj8E5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si425582jav.44.2021.03.13.09.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 09:12:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TAOYj8E5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lL7oQ-0005BE-5n
	for alex.bennee@linaro.org; Sat, 13 Mar 2021 12:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7nx-00056z-E6; Sat, 13 Mar 2021 12:11:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7nv-0001uQ-Vy; Sat, 13 Mar 2021 12:11:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so17632316wmy.5; 
 Sat, 13 Mar 2021 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUEARRun798+nh7MINi50vXMqDU+cTmUPB2cqCr7TCU=;
 b=TAOYj8E5L4hYB0STOiauw0k5ue2hv3kAyvz8n8QFezr2fKxq6rg0tG4i6OLndqDWWV
 2t4CNP5qxF8AnuApR1ESnk2X8DQHuTpusEdnMwxGWorDInxQmS8tTZyzaeJbNSI61ru8
 Kuvf58pcNbBpeAoeM4vVS/cuj7zvDen3NDSgGxgaaHlQmZ0CqS089L+DGdV32YdAze8C
 O7QI56ZRaFNjChCXDIkA6oU59r2l9eCpN67spgecN4x8h0pC1z3pqn9VYEfkfYUlnuZc
 Jx4LGHK3SYmNqxfK0LUv8wTBaEObHBlLaFSnx9F1W+uKIKSw1QOaxq/3PHmkkj9xg8yo
 djwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YUEARRun798+nh7MINi50vXMqDU+cTmUPB2cqCr7TCU=;
 b=OfqsYt/iEvpWfoQHXHZX0fGg4mAlIoYXJRjOwmOSbSXowoYbWFZPzUQTu3cmcttahc
 AwQHqurbj2Rttzc9xqGTPpfi5x8aXJkbNzCBHnJK6s662GSrDCOA2zVhOBkP8w7GzHNG
 JIX+LfW8pOXH909dWle3C13aL0FVKCNeaj0A2E0hEpfrbydtDGDGqflPUXaTOt6hYRKV
 m6Now/rWuVxoPbuIPYPzxY3Xehfp8H5GYxWHE8WpYwfzriVuKLNcuWy4W6SNhxCA0vfu
 w8LWTNfSocWsjC2Lq2U5xceQlUppjzJoiUzeMFBut6CpxqdemhYyvPKoIRMlNPO2Vm/R
 oSRA==
X-Gm-Message-State: AOAM532RAZBnQtoteT0P+atD4asCZ+HZNj8SVkrsPMI5Vy+g7p8YQhSW
 9BhLEneZr6IzvvnvJzPktVRUDnlekKrifQ==
X-Received: by 2002:a1c:3b42:: with SMTP id i63mr18843594wma.124.1615655513158; 
 Sat, 13 Mar 2021 09:11:53 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o188sm7470325wme.7.2021.03.13.09.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 09:11:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw: Constify VMStateDescription
Date: Sat, 13 Mar 2021 18:11:47 +0100
Message-Id: <20210313171150.2122409-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8L516Oz3FEJ7

VMStateDescription isn't supposed to be modified.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/arm: Constify VMStateDescription=0D
  hw/display/qxl: Constify VMStateDescription=0D
  hw/usb: Constify VMStateDescription=0D
=0D
 hw/arm/highbank.c             | 2 +-=0D
 hw/arm/pxa2xx_pic.c           | 2 +-=0D
 hw/arm/spitz.c                | 4 ++--=0D
 hw/arm/strongarm.c            | 2 +-=0D
 hw/arm/z2.c                   | 4 ++--=0D
 hw/display/qxl.c              | 8 ++++----=0D
 hw/dma/pxa2xx_dma.c           | 4 ++--=0D
 hw/misc/mst_fpga.c            | 2 +-=0D
 hw/usb/ccid-card-passthru.c   | 2 +-=0D
 hw/usb/dev-smartcard-reader.c | 8 ++++----=0D
 10 files changed, 19 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D
