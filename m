Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1510055lfb;
        Fri, 20 Nov 2020 09:40:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwENHqc8WVBl088AG1X2eAqHkG9U2QmAgItfg3os9HbiP+/3/a2mHqYuk/rQ6dweA/O7GV8
X-Received: by 2002:a05:6902:4c7:: with SMTP id v7mr26401049ybs.226.1605894033822;
        Fri, 20 Nov 2020 09:40:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605894033; cv=none;
        d=google.com; s=arc-20160816;
        b=QiI/b+4hPvj3HU7/xQ+tg5JKWHf2mo2f+lXwqojrFIdImxeL8rQy6AhZBxhJ7Zjd4Y
         FJZS73tgzANLdiniqlA7IRhn0s+tTprNuwIbUVmr4+laECOcYMMYgj7Npri+3ntvc1b1
         XIT0CD0smupyH4loqS4XtlGPqgZ7FyukM8mEVzBlFk/o6o5DQ5imfcXOncvjK7c74BPG
         A6isiow7Kawff8TeLNT3ycVzEMA2XbGGzbmOC1+0crlzHW/YUzd5F2dTW6RmkKjNxMSB
         oVWpzlMR9WK/3PEUCgB4nMWmgAP+AGGbLZROyJeAFhL9YzPvFS0y/YUcCiuGr0VqKelm
         LP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=AC14N5xfCbjMUA6muLrA74/gSYP8aDIrEBKWYrFlBcU=;
        b=1AQvf5e0csqOD6+tHUH6JkHpcebHOXNjooRDk+eLbW1KicQ3SaLEsMfpjjr36aUQW2
         7LWsVgOnrlhMCcj87Dh11SHOBvPjrhNHZa5YIZT2Y9U/CqSL5z97lZoGZANvbTl4bVmr
         X+cojl0IblRo84ffLPSQ3cwCiKuWWa+s/61hNNsprgTEdd8/y1K9lrKWNQ0ii/YrEDMG
         Gb9Z/MkXnTSN0KRabXlB6FT7cot9GXzsQ47DIEizZvJPEajSmNlMWhKnvAlewjD0kSUC
         aPktzeIT2arKDfP1m0Z6yMmurG62U783FgUq6zEIbCF/3Y6GzhrP+0rj4Ouq5WMwsdyp
         GDXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b73YMYvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si3170995yba.439.2020.11.20.09.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 09:40:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b73YMYvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kgAOf-0001cF-7b
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 12:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAO7-0001bC-6F; Fri, 20 Nov 2020 12:39:59 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAO5-00047I-K2; Fri, 20 Nov 2020 12:39:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id p19so8812186wmg.0;
 Fri, 20 Nov 2020 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AC14N5xfCbjMUA6muLrA74/gSYP8aDIrEBKWYrFlBcU=;
 b=b73YMYvZ6PMJDujEG+Azitv4CfhXiWJz3jf6kDpz1Fg/j/qIMu9gJYErUw3kXJ72Ss
 fUj/RuEaudk73PgSvDfJHxGxLjhzxivUzNCUXSrnhixSaPg5AtCndma2f49ht+KMIwUy
 JaRDNTGlG7spnu42SDnpKKtb0t2Ox/md2xgMsOCoJJTZO5bhYlid9JL5XeC8mUu5UoZF
 hTttUDcGq9TGBidJa7glGeIBZz5lXJFqR6qkedaW8ojXCnwKUlOQ/1TTLjuGsVk7cfv4
 EfI/XpjmBu30/6ksVIqexGZxfXzrkVCx3OaHxpJDfqa6BVHmpyPaJ9g3tg7VRoM5Mg0Q
 utMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AC14N5xfCbjMUA6muLrA74/gSYP8aDIrEBKWYrFlBcU=;
 b=OsTNpxrm9ITgxhiliGl7yK7RDj2y+8hQ84gWP/qAkPRHUgwtLVX8Rwa7vDIVq01QqV
 7qWmfHEgKHwcJ0pvtaR3RDuXtSRtJXZLDeNteZn7frzNI4Hw4N7EFkb8cAJek40B62WO
 UUCf8vaFRygczLInbVRkZarauBTNgQo7pF1kJGnV90PaHQ7bfWaTRdV5cIRaKQqUc+gl
 vI2ObyV8UYFpm9+giZHErZoYMGCrpigqas8b6wf0X6MofqcZjQbyRUMe4UGOz48HKQYj
 XZBF748KoRUDy1JzvJvoX6ix9JqjFM29d9t7AtuvD5fbg4tKXYnoDdhYPot6/oJTH79X
 Q+MA==
X-Gm-Message-State: AOAM532SXPfKjXjUToMcjIhNGybhD1e5QxCULLmLc8yBx0vMsn4LaDzc
 +/oMERfDQGYemdJ0vlnJdDygg+Ttg0s=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr11322011wmb.16.1605893995473; 
 Fri, 20 Nov 2020 09:39:55 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q17sm6557597wro.36.2020.11.20.09.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 09:39:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 0/4] docs/system/arm: Document raspi/tosa boards
Date: Fri, 20 Nov 2020 18:39:49 +0100
Message-Id: <20201120173953.2539469-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yfi19y/0Gmc5

- Deprecate raspi2/raspi3 machine aliases=0D
- Document the Raspberry Pi boards=0D
- Document LED on OpenPOWER Witherspoon=0D
- Document Sharp Zaurus SL-6000 Tosa=0D
=0D
Since v1:=0D
- cover docs/system/arm/raspi.rst in MAINTAINERS=0D
- Addressed Peter review comments=0D
- Added R-b tags=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  docs/system: Deprecate raspi2/raspi3 machine aliases=0D
  docs/system/arm: Document the various raspi boards=0D
  docs/system/arm: Document OpenPOWER Witherspoon BMC model Front LEDs=0D
  docs/system/arm: Document the Sharp Zaurus SL-6000=0D
=0D
 docs/system/arm/aspeed.rst |  1 +=0D
 docs/system/arm/raspi.rst  | 43 ++++++++++++++++++++++++++++++++++++++=0D
 docs/system/arm/xscale.rst | 20 +++++++++++-------=0D
 docs/system/deprecated.rst |  7 +++++++=0D
 docs/system/target-arm.rst |  1 +=0D
 MAINTAINERS                |  1 +=0D
 6 files changed, 66 insertions(+), 7 deletions(-)=0D
 create mode 100644 docs/system/arm/raspi.rst=0D
=0D
-- =0D
2.26.2=0D
=0D
