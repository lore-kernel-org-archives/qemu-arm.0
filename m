Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1919910lfp;
        Sat, 8 Feb 2020 08:58:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOVXhEWG0LbOwPMcmOaXaCYSWm2s84xFH201xH8v1K6ciUb8z5luwsxCspP5JK7HhQbPrI
X-Received: by 2002:a05:620a:20d4:: with SMTP id f20mr3757441qka.343.1581181116759;
        Sat, 08 Feb 2020 08:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181116; cv=none;
        d=google.com; s=arc-20160816;
        b=KxAXGM1NGZotUHYOuIV+Q/iSHeygFvSiMMQ7gpBR9WoU/HFD9MQJ0jsFJ3Zo4SxM+i
         4t+0pfT6ZbQXSQnDWNmz9u4VqNcRUiX17/4795ftINoE3SmVGau6uZ0jSIxeG/dGQqg/
         7CYriqt914R9B7Nl82vAVFNCUILbnqt3NFuKK1Lwp/rD4T8IY12L9xwgutsvBQQl6f0k
         4QRpEleuquQicbAbcE/uFIMU9eyKb8S9kPObpe+UuAHR49Qw0osmfvzLZP3M9O0I69Sn
         1hzTLTWSClEscE4ldZZG3Y/X1mTYYeGY/krP0PLj3itT8ukzxPdurGvkGkI0Ge6azvLF
         Oy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uyF64iuYYQw6zbyIHAWavbNHZnEbok8Q/hkHcClOAlo=;
        b=zmnzwX6hBmgJ1S7Oa+1yHZyDIteOk56p2WumLRUF3X/szkunPX22kniywVz/GUZ3R3
         XhgQlxtOG9NmOzsLoCA3uGeHBb++DzLDdxGBUO5GkkOUzCtWbIeWS2QoJ8EjIVI0y5UB
         LOB8aBV25GEGQHdQoFY0VDlhKCdRiYnosmGsM0tSTGJ12ewYVRHrheydqz1sot74//EG
         T1yBjfk32W3UAdsP29jakzqkc5M5NdXyIqQJrfKbqgzezwU4ru+9OHrE71hIiDEvTeSh
         WHHpuvgAto7+mmwIyqMg69Ib4bWpdid+lUwD3Mkf5+E+b/Om4mGvaAhhn/Tod0EHqB8+
         O1sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WS+jnCCv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si1764615qkl.329.2020.02.08.08.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 08:58:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WS+jnCCv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TRE-0007MY-5D
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 11:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPm-0005We-8o
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPl-0001eM-38
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41485)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPk-0001dc-Tc; Sat, 08 Feb 2020 11:57:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id c9so2479961wrw.8;
 Sat, 08 Feb 2020 08:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uyF64iuYYQw6zbyIHAWavbNHZnEbok8Q/hkHcClOAlo=;
 b=WS+jnCCvhSX08Yh+/2ERV1butvw2ZyT88wXj7VUUHARHvX4odpwAVXj27g1Z/H7nic
 d354oEju46FU/95lJUdzL1qq5ryIKo8hUgBmMLsDt0EiwHbaBjEeDKOtG8Pfeoz8HjsC
 unioHcxZIHCVRLjvY9qtuhhq9F6dkBQTveVDcdYa1u5DuE1nbP2xiyGVOgfSCXioLnwv
 fQuybsW1KMv9phVHXqfFhC8haXM6Jep9tHf2AQguLw0BnU5F6gnFYSnx38FDhjjeHDCa
 zKpBSzFL8Zo+7Te4j6inLO8F8S7WapYBB5THlkO32AIKgVN7oVNio98LIB+HQg9KpWul
 sMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uyF64iuYYQw6zbyIHAWavbNHZnEbok8Q/hkHcClOAlo=;
 b=QYOlFmtDSzukXwaF7AtHNXYvG5+qtIO4Sffqb+ghIjg/ObDI81S4bhi6OUq1gOJvDD
 wM0DZiyqgHUmZh82Lbrts8tziGKOqUNtULzJwomeCVASg5tg9Xoy08o2O9K0eiYIJE3F
 BwU+IbuAuPv2WUOLl2bIke0qZtJcFQlfVW2QTf3ExKhf/orXnjd3eCdeNFgeFuUPJghE
 73b+4eQUh2qn44ULgIG9FfxgL+weQsIZiBLWdEjMpWZrN1GCmU1Kukbc3RCn7WEX/ppA
 AOMt4Rjex2tDjamQzy18OW1eB4jfMB+XE9YcPTgoNacIMCOsnSAStxG9YnnuaUKMpaMj
 bTDA==
X-Gm-Message-State: APjAAAWBu4zoMOn85a3RinBfHAxGwwzQpYyrd1D5xj9ZRRsqAFlDhYtn
 m3Sit0Qr9lZKlx9oplpEpLS+sNBH
X-Received: by 2002:a5d:6692:: with SMTP id l18mr5918288wru.382.1581181023754; 
 Sat, 08 Feb 2020 08:57:03 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] hw/arm/raspi: Correct the board descriptions
Date: Sat,  8 Feb 2020 17:56:34 +0100
Message-Id: <20200208165645.15657-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GPLScRd4+bSr

We hardcode the board revision as 0xa21041 for the raspi2, and
0xa02082 for the raspi3:

  166 static void raspi_init(MachineState *machine, int version)
  167 {
  ...
  194     int board_rev = version == 3 ? 0xa02082 : 0xa21041;

These revision codes are for the 2B and 3B models, see:
https://www.raspberrypi.org/documentation/hardware/raspberrypi/revision-codes/README.md

Correct the board description.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index f2ccabc662..818146fdbb 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -221,7 +221,7 @@ static void raspi2_init(MachineState *machine)
 
 static void raspi2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 2";
+    mc->desc = "Raspberry Pi 2B";
     mc->init = raspi2_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
@@ -243,7 +243,7 @@ static void raspi3_init(MachineState *machine)
 
 static void raspi3_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 3";
+    mc->desc = "Raspberry Pi 3B";
     mc->init = raspi3_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
-- 
2.21.1

