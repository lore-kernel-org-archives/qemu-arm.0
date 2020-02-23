Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4425088lfg;
        Sun, 23 Feb 2020 15:31:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxb11gxL79jxbZyO1HzGqgbRsWRrmEiucHN4MBrCN32LzBesJf2wVqx0M/RdftzR8rkeD3G
X-Received: by 2002:ac8:4244:: with SMTP id r4mr43997695qtm.169.1582500706288;
        Sun, 23 Feb 2020 15:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582500706; cv=none;
        d=google.com; s=arc-20160816;
        b=NWHYuYA3hBbnKYXIIPXqAGfhR06W9/T5Bxw/+Wku0AKRf5BD7a6zl3OTt6TbFodueY
         DVOrMQCpqrddqpteoqoEMx/KoM2twOkzXX6Kw/6asV35d6vz0sqQYRGJ9s04jyv+97ip
         w0XMxpZa7saJ8FW8bSkIuZsbNoB2H5kLYpKvm900h+Nm5N6k+a0zKJmgn4bkBXB+BIgd
         DIGm/w/Jn9LwjRM0z/vneKvkKepgCnjb1VOmfzwuuFiW8LPZfZHUvw8L2xYPhoNA5/3I
         ZecD7TWL186mAo9eIZ3dXgMHwJ8gW/qqyBu3V0yCLBQYDv9iYIHkXSYR8PMQWEegalzZ
         rMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=j1ogJKVBWHqReHbmQkbG99tKnkOAXccMLToC4p/H3N4=;
        b=rpxxH7t/4DBTqwI7l/Fu41Vl11BTus7wlja9zsdLqkZlk3Py2rg64d12ygAUPr6BUk
         cHsB1oTYEiSzIYTAbGMFOoK46GoO7SVw424T6rjWs5rtbTbNyg50iSuA+GFnHQdOHD8E
         bMLX02rIdm+EXZwDWhBNUa2XmAO/4Kyuds/GTxHZVNK+YuDXsgyHkYMYO7s4Q0hX/jOZ
         KW50FoWtPq7BWbFt16v0/Auq9yaFKp8raAN/8GlbcDGVb9Mb+2dKuUpHGhMZje9IEAF3
         2HgQBGooXWC5XiIia/fCNHpbkx8wjJTuHnWbug87jf9tkWbWHobnCfH7YZI3OAoZ+zx5
         elaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qz5V0tpp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21si4952971qks.279.2020.02.23.15.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 15:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qz5V0tpp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j60iv-0002fm-Np
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 18:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j60hr-0001lq-Ed
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 18:30:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j60hq-0006ZV-83
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 18:30:39 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j60hq-0006Yv-2L; Sun, 23 Feb 2020 18:30:38 -0500
Received: by mail-wr1-x441.google.com with SMTP id m16so8223798wrx.11;
 Sun, 23 Feb 2020 15:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j1ogJKVBWHqReHbmQkbG99tKnkOAXccMLToC4p/H3N4=;
 b=qz5V0tppNYoSp1b8tbXQGamO3jO7x2tSIDAoqI5qMwOXneI8AzzW9NH4gaP0ba+q4x
 ozhCjsQdZvrslYtrMsUeSK3OQ9g2PPtsbBG8KktcmzWpBQydR9uIQWxy3/NuXrqfqWaN
 gwh4R3YCYYfP/73AVgZymEVlQIWHrTxLy5ZY6+5G9GplRQi/nvQ3guWZOPtnfzKz+M6I
 C0FA3qmTQBoLFpgx/G+uTcWTq2pDcyas+9OH0hBwn5/M1iUZX8gzglAZcnX8RAhLJZZN
 ThSZs7YP4jsT9sN2lrsvuSsfpmOwqVI4W8/6U/JCEUQRgZGqDf3v+9dKlh/9Po8UjPxs
 qvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j1ogJKVBWHqReHbmQkbG99tKnkOAXccMLToC4p/H3N4=;
 b=GZFwoCUvakNIL/cPs4szKC5ldOYEXlM9umlth0I9aRdNtFN0UNLjrwFsGLmgEWhbZ+
 gf25w/hWN4UwEwxsdpX7EMGuoDNTnvcnjQWpEHZGW/tiMYthaTIDCRDZ4Lv7AqtMzogI
 my+5UR+K2prDYBdsfpLYGo+V9vtj1sRAvwOKxmnt2DB9orU0h9IV1VUdmUdUN5zxZ6IT
 53K29GLleeHgBiAQkOZ3vExAlSXfiB/xRSQpRjAYLwvkdmtfFZpK5aqKYQtfXpngWN1E
 NolL+BGOzjTnokwuQz80R81LqER65YSQVwc858XexLfR39CyjKijsnyukufOr0m/iL+b
 0Wew==
X-Gm-Message-State: APjAAAXWmLYMNwwf0eFJvWLu3dWzRphFOgAEeUpsBltGd9eDnOYKk00A
 T0v9fMCRjpAug8OmM2ExsodRdvu29D0=
X-Received: by 2002:a5d:5148:: with SMTP id u8mr65661639wrt.132.1582500636417; 
 Sun, 23 Feb 2020 15:30:36 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j11sm15322117wmi.3.2020.02.23.15.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:30:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/integratorcp: Map Audio controller and parallel
 flash
Date: Mon, 24 Feb 2020 00:30:31 +0100
Message-Id: <20200223233033.15371-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2qUrwW/bkHWl

While looking whether Thomas's test patch [*] requires a respin
or not, I noticed we could complete the integrator model.
Thomas patch still applies properly ;)

Since v1:
- Added uncommitted Kconfig
- Use hobbyist git-identity

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675828.html

Philippe Mathieu-Daudé (2):
  hw/arm/integratorcp: Map the audio codec controller
  hw/arm/integratorcp: Map a CFI parallel flash

 hw/arm/integratorcp.c | 12 ++++++++++++
 hw/arm/Kconfig        |  2 ++
 2 files changed, 14 insertions(+)

-- 
2.21.1

