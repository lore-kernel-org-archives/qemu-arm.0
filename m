Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4425116lfg;
        Sun, 23 Feb 2020 15:31:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQvhA3/1uU0sPwBfxmKpcuAGJoX9XcyLDz/Dj0fEgbU7aK6aXBIQUn/xBsEbrkn8HRbULd
X-Received: by 2002:a37:a0d4:: with SMTP id j203mr791812qke.184.1582500708285;
        Sun, 23 Feb 2020 15:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582500708; cv=none;
        d=google.com; s=arc-20160816;
        b=srqPiakp8X8wGU5gBYPnh02uHmezFIYwqy0LfhopAhFH21kfjaqQav4q0kFtAELIER
         KeMkucuia67nVHDfaRDUX7yXOvgBKBDyp50U0drCU9xDkfdB+1S9G0tSFHZ4TP9p2Kp7
         tGf6sPWV3QmiPA3NFu9l+hUXzISkEt1P1nT6ha8vwkmimHfjihkn5hHVG3nddel/rY0e
         D73eesknYiQ5ORIK7+B2iVVuRExY3D/auXs/bUVS+EehDiPp+1WhZjaTMVKMzeVq1QGe
         TYBna5VF0Z5B3vCsaCrmF2vDVTLo4vV3G7gWiXNeWluNkVAEHg+WJaVIdX7EI0HX5KZP
         v65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=La3cNuySg7AvW4GmOXYMUpGVVY/iiFpjp6iEqmCbx0k=;
        b=ZFKv6twDINXe7sBTvmbThd4cWG5kSEbphqWIPHcP/O+qprAo3afszD5BikadjQsOvR
         ssRXlgIsP+uPknvse6C77MJcp9axBzJtOx4vNUfhmtJtVxAgGIxqIwBvlckMv7ewuV1k
         ZU7lGWzQxg0WioFAJTUFr33meF/dE7PwEQivqow5skbYUH3Gbdar+PCd38ngHo0Q5NPg
         A4C7gMABX8sdoq1VUwaVq4EV3xZY6DYPeFAt6W0kPRZxg0EmxYI7kNiuPc4+twsbpYrY
         t5ids2DeQUzktJDKSaIJHoMJZxlECYu0hzAyNlPU59y4tmnvHce5bMwOrjpxYGAdaoJN
         8v3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IjuY+e0S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si61572qkg.301.2020.02.23.15.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 15:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IjuY+e0S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j60ix-0002iv-Np
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 18:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j60hs-0001lt-6y
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 18:30:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j60hq-0006Zv-Vd
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 18:30:40 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j60hq-0006ZS-Pc; Sun, 23 Feb 2020 18:30:38 -0500
Received: by mail-wm1-x344.google.com with SMTP id a9so7472584wmj.3;
 Sun, 23 Feb 2020 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=La3cNuySg7AvW4GmOXYMUpGVVY/iiFpjp6iEqmCbx0k=;
 b=IjuY+e0S9ggGxJslwi56PZ/GXrgJo7mN5OLotADSFCPd5qSKsNs/w8V45wSyn+wDY2
 Z4E9TcRdH2n6yfk/nigU3yTfVDIzs0fLagMhT9EgalqBSCDhDebx6sjzu/ZXvhLl0oBV
 ZK8OeJik6RyV781WV5RgXKhbvpVNOznZyppd0g53CK6HpcjIKcYbCpaWOYMpjOjeVUFn
 raKxIMQaxVmGRTkjju1nPEd/gr4J3ZftiYjEh2PXYdUtHyHWCSvYR4JlQpxv2DO/DYoL
 X3lBLToj89K7sh2ClfOFBm3HR+weEf4W+rH2SSa0aA+w9NWtPXU9F0+NMxie42K5NFv/
 EQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=La3cNuySg7AvW4GmOXYMUpGVVY/iiFpjp6iEqmCbx0k=;
 b=J4OcE2ByEmInwOg83nX25Prf668pUlOGKAfZxfPJ2s8AmUpZ+2esShTmn4zT0NJGkW
 IXcouT70gDAtN2sgXz3UpyeSyYjlKiZ9fhse+Se6aNA2x/ktv9J9rOO62LeyZh4dBNwz
 TCmPHsNLQqIqQrufu1KOydJuTDZVKGgUHZ2cnt92+XFLdzeeu6QS46xeuk6KVG2vrsRw
 kM1+uNOSlABU1xdVv8OyGyv4nYmQAZ9ZTTVayb2ExyHobzHMM6VauTKKKuF0Qq0S6Rlj
 mFTHHYbDsxU9rrpPXV2wAoYq0iJ+j09O+dPbBd0WLBWUYkADyHbX4oL6GxCdvCgVeaE4
 5gdw==
X-Gm-Message-State: APjAAAVML5xu0G5laufowKZqRmuWbqDn1dk5PrqPSJUWuStncB2Lv0ik
 34DJVjS7VGBGJkwpKtz4t4GdQ8qo4sY=
X-Received: by 2002:a05:600c:291d:: with SMTP id
 i29mr18830025wmd.39.1582500637568; 
 Sun, 23 Feb 2020 15:30:37 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j11sm15322117wmi.3.2020.02.23.15.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 15:30:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/arm/integratorcp: Map the audio codec controller
Date: Mon, 24 Feb 2020 00:30:32 +0100
Message-Id: <20200223233033.15371-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200223233033.15371-1-f4bug@amsat.org>
References: <20200223233033.15371-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
X-TUID: bSj/efyS+PC5

The Linux kernel displays errors why trying to detect the PL041
audio interface:

  Linux version 4.16.0 (linus@genomnajs) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #142 PREEMPT Wed May 9 13:24:55 CEST 2018
  CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
  CPU: VIVT data cache, VIVT instruction cache
  OF: fdt: Machine model: ARM Integrator/CP
  ...
  OF: amba_device_add() failed (-19) for /fpga/aaci@1d000000

Since we have it already modelled, simply plug it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Kconfig change was not committed
---
 hw/arm/integratorcp.c | 1 +
 hw/arm/Kconfig        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 0cd94d9f09..59804140cd 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -644,6 +644,7 @@ static void integratorcp_init(MachineState *machine)
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_WPROT, 0));
     qdev_connect_gpio_out(dev, 1,
                           qdev_get_gpio_in_named(icp, ICP_GPIO_MMC_CARDIN, 0));
+    sysbus_create_varargs("pl041", 0x1d000000, pic[25], NULL);
 
     if (nd_table[0].used)
         smc91c111_init(&nd_table[0], 0xc8000000, pic[27]);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3d86691ae0..61635f52c4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -69,6 +69,7 @@ config INTEGRATOR
     select INTEGRATOR_DEBUG
     select PL011 # UART
     select PL031 # RTC
+    select PL041 # audio
     select PL050 # keyboard/mouse
     select PL110 # pl111 LCD controller
     select PL181 # display
-- 
2.21.1

