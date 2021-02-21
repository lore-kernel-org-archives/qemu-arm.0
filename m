Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1276178lfc;
        Sun, 21 Feb 2021 14:26:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG/zuIYaOcF0Bf7NXDOHhLi8HU9gCd4BgUOSY2UccMOMvm9hLeBVyp9ha7BqjBugtoUwQ/
X-Received: by 2002:a92:6b10:: with SMTP id g16mr7373654ilc.26.1613946413698;
        Sun, 21 Feb 2021 14:26:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613946413; cv=none;
        d=google.com; s=arc-20160816;
        b=L9Rq8EUOUuph/vFszlMEQT8YA4wED+krDpZEA8UqvAnN8vPDDO7fnS5n6pMgWuIMwo
         sdXaN5LCCrI9sV9I1Zf6qBhfKtWuN3Lj2j1s5nr9zZHjL/P040e8FVKUofDtsEn3lfE8
         XkFM1ofrNMucj9mPlaG2gLnOW1iiqI+Lp2RAzE4j1snGxFQhFV9OZjx+1RncMALLUj5I
         DfwB+msNnc/dfZ1f+eNKweFqunBMS88Plul6Zhv/DuFmfwbJffdCYMddh/M9gJ6eISwa
         Cia7o1QgYCOQaDBEjJiSQYun6Y+U7qbMjotDnbSwaQIEaNLtmaODaEELfFLkei7t0Bxp
         lL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=l7kGV8BCSlV/22uKIKSaj5ga01T9HW6SOkPfs1f0tT8=;
        b=v/+NucePEqBYbKCg5rl0u515HOWUOdJjToIBZG7BFLNMly4sYY/M/4Q/p4xgsQxivW
         K0EdYbT482yfx1qJlz1Xt+TKMRYcmT52PTxHmYmh4xKc5KJzVNXryISUiHOd4eBGU3lg
         GpPcH7FwAM/G7mptyZqgRgNTVnsx5epFLsgnrCxuWC7ZAGjynEp0s5d6kistzzveaEBJ
         SA3JufTHFj1Fn4n03nPzBx55B1m55Dw81sq/iSYvnQ6e+zxUzFVh84OmP5achjAfcm/j
         maaf/Htn1F9F5jo4CoWSzhz7Ct4CX+xmqsvoWMNc/WUCiwdtswvEV3Q87/MT9R4nQZay
         VS/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qewQNxzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si15356942ilo.145.2021.02.21.14.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 14:26:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qewQNxzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDxBk-0006Mm-UK
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 17:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBN-0006Kc-Hi; Sun, 21 Feb 2021 17:26:31 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBI-0004Ix-Vx; Sun, 21 Feb 2021 17:26:27 -0500
Received: by mail-wr1-x435.google.com with SMTP id l30so1435875wrb.12;
 Sun, 21 Feb 2021 14:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7kGV8BCSlV/22uKIKSaj5ga01T9HW6SOkPfs1f0tT8=;
 b=qewQNxzl73gtCogP0xSm52S0nm1u/PgocBmaQV4WLIwzXKFHsgpvlz5sfyA8/49H49
 44CWgTlUx8mx6ltTdi3Lz1YywcCwn/LpmVlmy8dmfmQgn/MTCPgh76yCFzTNqsCB9dxx
 lZpRfuA27s6X+1pFxIoheUVVnsNzXbYeg6qkC5TeuZ+1aQBIxJbYtLWvB1DvQ93ERrmA
 w2nwUNn0x58KiLZIdTdjqG3r83+2yH+FeiTcczcgEkjpGd/T1tqp/CMXjj0N3ZCo4skW
 KR1YntGBknG4AJgbHHDj1cPo8T8Uho8n1OaNV3WXUg5V7dNHG8QiJrvzCJuujJewKE2b
 Gk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=l7kGV8BCSlV/22uKIKSaj5ga01T9HW6SOkPfs1f0tT8=;
 b=sS67fx4jQG2IUpqU7suPgkCPy1fos0DBacX9NMg18Mrwjq7t/pODBNvVZmHTmnzaTX
 rFuqxuw2h40QF5vjOFQPeKzpVUnpfiEoKVB80f1wmImez2YOZHzJYMGGEFGrBqfbkxon
 5MLmeBI+myG1wIOk7JwGXN9+a3vWokrlIbAnD5qjuXDTZhUz6WoOTf7f5VtV02DO2S2w
 YHRfszyEsdypCI+JpEp6NPWauJqJR+E0bI7fVXn5UB94EsO5nvkTTIaF2INm7IVj+zS5
 EHPYBWBu2hefHrTmtcCGqvA8P1kWiGieZYRU+r/5oeYzoqXhq+TXxtDg4M5JNLL05uNk
 6l8g==
X-Gm-Message-State: AOAM530/UAXXLB0j4gL88B6aHa5uKvkAg3q3kU3iMeYA+mJPBm6E7gbs
 yIT0gOHkXrkc2B5TXdjkVIwgnHpSaSU=
X-Received: by 2002:adf:9f54:: with SMTP id f20mr18703165wrg.362.1613946379525; 
 Sun, 21 Feb 2021 14:26:19 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y1sm26297302wrr.41.2021.02.21.14.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:26:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Restrict v7A TCG cpus to TCG accel
Date: Sun, 21 Feb 2021 23:26:14 +0100
Message-Id: <20210221222617.2579610-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eig5/4v0GSgf

KVM requires the target cpu to be at least ARMv8 architecture.=0D
=0D
Restrict the last ARMv7 CPUs (A-profile) to TCG.=0D
=0D
Series almost fully reviewed (missing review is trivial code style).=0D
=0D
Since v1: Only include patches which don't depends on  previous series=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/arm: Restrict v8M IDAU to TCG=0D
  target/arm/cpu: Update coding style to make checkpatch.pl happy=0D
  target/arm: Restrict v7A TCG cpus to TCG accel=0D
=0D
 target/arm/cpu.c     | 334 -------------------------------------------=0D
 target/arm/cpu_tcg.c | 322 +++++++++++++++++++++++++++++++++++++++++=0D
 2 files changed, 322 insertions(+), 334 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D
