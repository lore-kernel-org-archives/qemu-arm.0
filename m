Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp662301lfm;
        Fri, 19 Jun 2020 07:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydA3XRqPy/zOJEXSW8tY1JxKC4cVdgiDswQAiDAqhjLgZHYmSRxAcvG7YGX3v8XUXBGDei
X-Received: by 2002:a25:5044:: with SMTP id e65mr6622955ybb.98.1592578497909;
        Fri, 19 Jun 2020 07:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592578497; cv=none;
        d=google.com; s=arc-20160816;
        b=XJSzREKC/WO/nX6xtNA2Stkn1yCvxbmjZPkHAcbWKe3WSZeFE+Yeir0Li9d9bYrag5
         xE4QKRMnXT/CbhYtVBkoeFe6eIdHDTb8l7zeK/ufy6UBwpDf+mrpWN5eV3MOXHxd33tz
         2XWsAZ0T6K8LW9qcxNC4Ba1u/GnD8k31nlzYaDDCDJwxTH3gK7R5M6gaqMXZujT26Qvu
         XxIxzNK+mCwIZzvqJL+Yy5rIZ+Y5VASJGc51rx93VD3Jd3gFe6VRjBbXK34DdhCp5CSl
         s+vzimXQQS/AltkNMoocCmWTJ6XzwY4z/6aw7WHtHHJR6WRlqbwf83iPa6VyJsFe6iEU
         x5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hlW8G4yJ34f0vynTy4tG90YnknQAoEqpm5MZOqmTBCQ=;
        b=NIt/mXnTRAnz7lzwo9jJNV4PMfv9+xptQmWmoIMgvtWq3qxF1qVV/zoJI2OgVj/FWc
         wGajMWs3ZaPB/+u8v124epEaq9DTUmRXgffvDdADN5zQ/W6J26R1pK3RN/MlYinN5Ko5
         y68FADScVs7IijT4slwWCLTRGam+ZTD0d8RgPDfxQMsSWGsRZPID2hZAWJFFtb7obmX+
         ZjHTVqb2GzQQ1LQO6OtmwS8HgidF9U3HW8E2/YtFT/zPyvv67KII65+8pUh08xt2sbRN
         ownM8wxDqKqB+uFfPGIGOeSaDwQIYSjXqz/uKbhPshf/V2mE6+xQ8fsHqdbEJqjwDuEp
         BVQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NUqnMPMA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si5301308ybl.343.2020.06.19.07.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NUqnMPMA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmIPx-00025I-Aa
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmIMO-000441-5h; Fri, 19 Jun 2020 10:51:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmIMF-0003fn-JK; Fri, 19 Jun 2020 10:51:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id v3so2477308wrc.1;
 Fri, 19 Jun 2020 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hlW8G4yJ34f0vynTy4tG90YnknQAoEqpm5MZOqmTBCQ=;
 b=NUqnMPMAqDOv5fMbVb6JNPuJiIMTEFmJ5QZ7ywbAd6XpOgCVudatv2rgGyxfIeH0EO
 k191b1SwL4K4t04+L2LyHtlFdQV6cxecV1CooXVH0Mk6QLMK2JLbaDAKdTHF0v/guk1z
 VbFs2E93kbfsNCyv8LugsbOT8PQkLPySMi2MuzOoOtok55x5v4qvDMmTm6AkKOgQmAHZ
 qTSF6kPTTYmU2OEoInlrgmC++46ojn4Rv5KkWNyOwrYDMdcfFMow3X+qrRul9qtVYk4L
 +KW913GINz4kuQpDP5OVnsKYh5p2EGC422pHEYetv35qYSmaVTuhndzvJRQpisO14ox2
 JKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hlW8G4yJ34f0vynTy4tG90YnknQAoEqpm5MZOqmTBCQ=;
 b=QwCTK1P2fOd26f7q0Q6EiwhsS44LT9PaRqxg9VNW/2YqD40oufIei7DdHbOoGFKfwU
 cUiZSKhKWbAAa6F+o9sOXM1MiwXDLJuqL25pgGI75+kFY41EjLRLjP1s3aDhmjMVMvTA
 5zeDxw96/8UroG3esWK5RSFkhgibsjvlhAMyrRhCw/WXKUgo26eibq59Tx1ckDROr5Ow
 9wtcd7djpmfYIJDFOV/xMUD7nb/MztuJdvjv5gXAn++TJjFN0RK59HZPcdkPdF1n2gNk
 Zeo10hjHp9gp9sp1Q/uRhlIlM0w76em3amvxZW4cTrs6jJ54chJoZ341wUrfPReAh1XN
 CpPg==
X-Gm-Message-State: AOAM530yqIBQaqISTOH4We1UDJkgvVeVXKfdalMNa+jYnruStstbphnt
 EAG07TqTHvbQPXygRaPNe2nCCMNx
X-Received: by 2002:adf:ff8c:: with SMTP id j12mr4472155wrr.230.1592578264046; 
 Fri, 19 Jun 2020 07:51:04 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id e12sm7512548wro.52.2020.06.19.07.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 07:51:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] hw/misc/pca9552: Trace LED On/Off events
Date: Fri, 19 Jun 2020 16:50:57 +0200
Message-Id: <20200619145101.1637-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZRw/COTiaEOG

This series add trace events to better display LEDs changes.
This helps me to work on a generic LED device, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg711917.html

Example when booting an obmc-phosphor-image, we can see the LED #14
(front-power LED) starting to blink.

- ASCII LED bar view:

  $ qemu-system-arm -M witherspoon-bmc -trace pca9552_leds_status
  19286@1592574170.202791:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [*...............]
  19286@1592574170.203609:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [**..............]
  19286@1592574170.204102:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [***.............]
  19286@1592574170.204415:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****............]
  19286@1592574170.204758:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*..]
  19286@1592574170.205070:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........**.]
  19286@1592574170.205380:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
  19286@1592574235.384845:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]
  19286@1592574235.894049:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
  19286@1592574236.404277:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]
  19286@1592574236.914644:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
  19286@1592574237.424558:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]
  19286@1592574237.934580:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
  19286@1592574238.444688:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]

- Only display LEDs which status changes:

  $ qemu-system-arm -M witherspoon-bmc -trace pca9552_led_change
  23367@1592575218.896117:pca9552_led_change 0x557cb6896d80 LED id:0 status: 0 -> 1
  23367@1592575218.897072:pca9552_led_change 0x557cb6896d80 LED id:1 status: 0 -> 1
  23367@1592575218.897487:pca9552_led_change 0x557cb6896d80 LED id:2 status: 0 -> 1
  23367@1592575218.897855:pca9552_led_change 0x557cb6896d80 LED id:3 status: 0 -> 1
  23367@1592575218.898256:pca9552_led_change 0x557cb6896d80 LED id:13 status: 0 -> 1
  23367@1592575218.898663:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1
  23367@1592575218.899138:pca9552_led_change 0x557cb6896d80 LED id:15 status: 0 -> 1
  23367@1592575281.593379:pca9552_led_change 0x557cb6896d80 LED id:14 status: 1 -> 0
  23367@1592575282.102994:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1
  23367@1592575282.613558:pca9552_led_change 0x557cb6896d80 LED id:14 status: 1 -> 0
  23367@1592575283.122774:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1

For information about how to test the obmc-phosphor-image, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg712911.html

Supersedes: <20200617064734.26956-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (4):
  hw/misc/pca9552: Replace magic value by PCA9552_LED_COUNT definition
  hw/misc/pca9552: Add a PCA955X_LED_MAX definition
  hw/misc/pca9552: Trace LED On/Off events
  hw/misc/pca9552: Trace LED change events

 include/hw/misc/pca9552.h |  2 ++
 hw/misc/pca9552.c         | 60 ++++++++++++++++++++++++++++++++++++++-
 hw/misc/trace-events      |  4 +++
 3 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.21.3

