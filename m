Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2308486wrr;
        Mon, 11 Nov 2019 22:41:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbrkZwimZcUhnWF1nIqYhErNfQGnpBmJb5W4EV+nUe/Duj4mpXTpWpP9N/LLKSG+iyPc/6
X-Received: by 2002:a17:906:1611:: with SMTP id m17mr27473004ejd.281.1573540910584;
        Mon, 11 Nov 2019 22:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573540910; cv=none;
        d=google.com; s=arc-20160816;
        b=uxm9qcECBdGdd1l9iU8qx5poWwno9LNNfAOElVMLJnFiS0kyLmL9WCuUN3lh9k2I6o
         bl2laNGgFHoS2K7Sm5MV3BmWwK6Y0l8PBVIhfsZoLsjp2HIAKYK0khpfjIQulkKV8BZX
         aN4mJwfXnO7oLDi67tUWAK6wGsur7gwP/HmEexzSpQADRFmWsZNWjUVMBzx1HCsbBr/z
         jr5kySU5eBnom1DCUpUv4uOKZTxq9cbGh0ASitRNlAsLlLbG+wMYPZ1P7atmlK0thvZI
         bFgBtAY1e4JBjv7++NHSHp6BaWkhr5jqxWnN3Ko7lGIk78uy+GhHCtu/NAoLkIajUit1
         lTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sjve1OM0Uk+8Kz/y9+LRf9Q2kVMunPP7oZCcDeTVT8o=;
        b=xaKxeOBZJK3yBX36l3oTa128sfOcUpflsn9lHuX5549jIt5TnGSHz7K4hjQPOfwOE8
         qCCgo4ByK01qk4uXggL9aEDjQNNHp5Tbb2Rf4OFRiVKj8WLb0oRzFQCcwpbcwyV90w9a
         +0qJmAfRL5/yarvTZmmOg7H7vtAfCjVjWUOV6Johjk0Z72agaQyc0t7sUZDJFPKK6VAc
         GRg8IqrGc5nKddTFBz979EQuYO1baIksOtIN4Y3Kh0wtdwHLs7d7pIlNk2ImJ4n0gwrm
         v2VPgDqOeiPloq5Mem7S07XFalKIjZW+nmYxriPoXhVlaP9l8bE9iYhIjKltbAcfSO8H
         mdcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mDuppKwh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si10716380ejd.401.2019.11.11.22.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 22:41:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mDuppKwh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUPs5-0003IJ-H2
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 01:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrQ-0003I8-Ic
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUPrP-0007Js-HL
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 01:41:08 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36243)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUPrP-0007JQ-AR; Tue, 12 Nov 2019 01:41:07 -0500
Received: by mail-pl1-x642.google.com with SMTP id d7so7069389pls.3;
 Mon, 11 Nov 2019 22:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sjve1OM0Uk+8Kz/y9+LRf9Q2kVMunPP7oZCcDeTVT8o=;
 b=mDuppKwheRmMgWpThI5vViBHoJm3Rbavdl4fIlkev0q7l3uY67qMWcuE6/Ek5GBuaA
 GD0SMcvhDbIOIOGu4adEkPxCPVfY48RvyUKlcNrm+qMC/rGI8s2q8s3LBuRaz3KO1A+t
 VXZzpa2kGl14e1cBXXTGO89GgOB5QzX78CGX5OJuWicZgvG9z1ICNxbPZdqv+5JNW44T
 xr4ZMo1nOTdkKM4Q5AFGYGsv1iFUbz8mZA+fN/M/R+RgGrI/rdGDvM11Jad//8kefxrj
 HG/044ehBM3sHeuuT/PT9U6Ks7vkbOeUqwslLIZhxOl1R1vX8XgSz09uNLm8zv8mPf1G
 rhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sjve1OM0Uk+8Kz/y9+LRf9Q2kVMunPP7oZCcDeTVT8o=;
 b=YQ/TB2+pqEsjKzLHo3GsfQZaE2opvZZ6KoqLfh2yFRtq8IyFyWcbnGwt9FMkNV3Wuo
 fhekwdkDl77C3KG+UEZQYrsAwjk8xpeBiGRMq1qYRwLgsL5gS98ayujKamsrsKxe4rCR
 t9toEdGWOXlVeCZH292i4frV+Xi38I1XoMfKW1eP+WpIl/UFahkUHJNZf0qeioHn1omW
 uam8enb7kd39X17YMBGUNMD6LuwYodJc3ezE6w74yg/3xpBUA9Em7DBQtHzcAeARkyeQ
 QL+kZHRoW2qQWYu3ciZ3l9+FSbvDNo0mL6Qvn9AppCn/6JBULCcELPOn32WcR0PHJLY7
 Hrgg==
X-Gm-Message-State: APjAAAVMEWW9HqCB+Jaqt2siarRUwxcZfEDGaXIljl86lKa8norzoNGf
 5mDnvPqSVbtqjNqZXkhJ9jA=
X-Received: by 2002:a17:902:be14:: with SMTP id
 r20mr24799228pls.297.1573540865798; 
 Mon, 11 Nov 2019 22:41:05 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id q8sm16375590pgg.15.2019.11.11.22.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:41:04 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/4] arm/aspeed: Watchdog and SDRAM fixes
Date: Tue, 12 Nov 2019 17:10:54 +1030
Message-Id: <20191112064058.13275-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4+DnycrH9nZn

Three of these are fixes for ast2600 models that I found when testing
master. The forth is a usability improvement that is helpful when
diagnosing why a watchdog is biting.

Joel Stanley (4):
  aspeed/sdmc: Make ast2600 default 1G
  aspeed/scu: Fix W1C behavior
  watchdog/aspeed: Improve watchdog timeout message
  watchdog/aspeed: Fix AST2600 frequency behaviour

 hw/misc/aspeed_scu.c             | 11 ++++++++---
 hw/misc/aspeed_sdmc.c            |  6 +++---
 hw/watchdog/wdt_aspeed.c         | 24 +++++++++++++++++++-----
 include/hw/watchdog/wdt_aspeed.h |  1 +
 4 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.24.0

