Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6393187lff;
        Tue, 17 Dec 2019 10:29:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/UEYuQaGdc50FJbCF5pekCwo5cXrvkKikseiD273UuRya2Igff8hO7nbaBo7ZNPod6R55
X-Received: by 2002:a37:2751:: with SMTP id n78mr6671267qkn.177.1576607358809;
        Tue, 17 Dec 2019 10:29:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576607358; cv=none;
        d=google.com; s=arc-20160816;
        b=MP5t1ck0T/n7c3q18Eyl1ayU9rDpb1EWDvM1J/oRI4z/lSAD+tKm+5Iucaj5rxFvn1
         2mb35wEJsQqHBkYEtZ2gwW2u/KerVDcITPEdSrvgUNy2IArhxocAEObc5InJkV7L84TR
         d8qZ2iLtSiXJpfYh6Wzs+wskhC/i7J+J7zyjstIb5exPUzUXUWmZHo5BZr3+X568kX8y
         GnPktEWXwEodo80eau7P9bcxdtJEzGnxT1CIP5Bs+6cnHxg8AZDQ0cXvfU/iZoJRA1ih
         adcaI6E+Mk1zjRprNydl+QgyVv7ryFkX+DiXUMdDjsIsaqzgerh9mKQ+rVtdcjnWnT2+
         2AOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sWACAQsf60rInZdjnYNJIzYNJovtyKvCUnze/9ZfBDg=;
        b=ZLrj6wfW+ZxmsSA5xzT9+f994hN5QD6TXVD8BbjWPciesu2QTzDflysNxoILbKnVg+
         xTxT/V1pwfyklfqKWSLHFHgbRT9lraiD3Ig8rqtYAKSmK/Cebo/y+Ah9l+AyHQkSsAUE
         woc1B3T2auMksDw2AZTAlMGCyoG+IZIYiOtXI9AsVzXUnwkEc8HwKUL6dono+Ix2uqLp
         +5esqZ97iYCtfeLHlNjUFEGxu1ehfySBx0VRNv9moOysfCushTKRQ4P062fCbMPzycWU
         52MBNLOfEQm+yq4hkf+RC4lCvY1jggOWPNiZGFXz3cieV9qAd20BtQuKtCdlLds7U7jh
         N7Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cj4L/hfr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si8372909qkj.374.2019.12.17.10.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 10:29:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cj4L/hfr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihHaw-0002SM-6B
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 13:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZI-00014D-MY
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:27:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZG-0003XI-Kf
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:27:36 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40352)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZG-0003X4-F2; Tue, 17 Dec 2019 13:27:34 -0500
Received: by mail-wr1-x441.google.com with SMTP id c14so12407099wrn.7;
 Tue, 17 Dec 2019 10:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWACAQsf60rInZdjnYNJIzYNJovtyKvCUnze/9ZfBDg=;
 b=cj4L/hfrqJ1dS8TQp6lUfRYWKHFhndilaAQXzyv04YBZe5enQgyzB6HZEmOrFQmGeQ
 Eg/0khdTe2ZlrfqPZksbu3OYIs3mAE4030q6rabkxsBiYqvmnVni0ccEncTgmMR/dJ8d
 RhWX6CBaAdjXyyHLoI+p4ShOCNtA0j3pB6kqcrEuftcSv7CRDFKb2WE5nNnrQFI+WBgG
 5mKeJ0tllZx98t87/RmyZPneN/uMO/Dwn3j7c55MviZQb7bzzRIgFIBUXg9G43OasMlf
 PfBJBNzboHCB1R77wlrF+XT4JD/7EyETnthW3uCRPYkkokb5Ue7gb3sHj48TfticjB+z
 vg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sWACAQsf60rInZdjnYNJIzYNJovtyKvCUnze/9ZfBDg=;
 b=uY0Tdyv6W876gz5wHs7w3KoVm10H04RqF2J6NA+JHzKMfF2FRGGjAvCc7Rx9Um5xpl
 VSfuyqxIoqBupDwfx3I1rydqgOyztflzra4VrMYSAZjr+yh5xOevy/l7lCiJlFzh+jIG
 UTOm1VQdnppiSRZkj55arlEDPV+OZR6HrB5fSMacZjkf1V30vwsQ4Tf74UszQ47RITI7
 M4Or3whgn6lqstqOIhCCNOpkCUo/jyhOJkZyn0Hk1LbZJ3JRdUuJHPZJeXg6wIZJmBwS
 IYpxpWxZIJULRHJWFVpW3Whl4lrE8siPq+N7hx+y8YkT/LL+b/DFpX/Y0vsTw+RWsj5F
 zrSA==
X-Gm-Message-State: APjAAAUSj4p61B4JpnsQaxat8ZqzFJW7inlHnYfgYdvggNkk6q/UlBPI
 5Eb9P1B8WrqF15r/pQ859vP3Tps3
X-Received: by 2002:a5d:6ac5:: with SMTP id u5mr2863265wrw.271.1576607252684; 
 Tue, 17 Dec 2019 10:27:32 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id u18sm26006975wrt.26.2019.12.17.10.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 10:27:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] tests/boot_linux_console: Add various OrangePi PC tests
Date: Tue, 17 Dec 2019 19:27:25 +0100
Message-Id: <20191217182730.943-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kWwKi0fUF69w

This series collect the examples given by Niek on:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg665532.html

Based-on: <20191216233519.29030-1-nieklinnenbank@gmail.com>

Philippe Mathieu-Daudé (5):
  tests/boot_linux_console: Add a quick test for the OrangePi PC board
  tests/boot_linux_console: Add initrd test for the Orange Pi PC board
  tests/boot_linux_console: Add a SD card test for the OrangePi PC board
  !fixup "hw: arm: add Xunlong Orange Pi PC machine"
  tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi
    PC

 hw/arm/orangepi.c                      |   1 +
 tests/acceptance/boot_linux_console.py | 150 +++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

-- 
2.21.0

