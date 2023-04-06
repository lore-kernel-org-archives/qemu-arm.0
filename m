Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp739376ejb;
        Wed, 5 Apr 2023 17:25:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUfO5c++q0VN/zBWc0fXp5f6Xd6DKyphJX6ZvF58AegvLvg6R5Z+FtilXnrEg3N3HOOW8a
X-Received: by 2002:ac8:59ca:0:b0:3db:e078:2886 with SMTP id f10-20020ac859ca000000b003dbe0782886mr7933862qtf.38.1680740723621;
        Wed, 05 Apr 2023 17:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680740723; cv=none;
        d=google.com; s=arc-20160816;
        b=pI0dsuZRCDSWB3PZbjzoH1Oqb81WpZyRZWbasWtbQnTG3L4RmN+qJWlcKwkopxRXUT
         1/AYPj0+MqoSP9rq6OM+t4qEsnf8g1RV8mc5dzBICwG2kyyLGRRXbSFI2skGUVsaFoq+
         wL8TGoul1oWWKo0rgDn2h9SQqPmZlgNWRGJP2RAOTD9eGl5HGnSpBOIiWZDnDZZ7lyl2
         zE1AIH7ctTjtOoHPe9nAdMcLWgx/x8S56il1bNzOeeGksoyIlARtqOthoNmm56h+8QvC
         v0PMz5edXJlYZlhG6awOo+2TTv3w+lLByeEiSLq6ZykusvUwm2D1iHtrTqIYTjVgITrY
         PN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=m8tjpnf+cHao99aT7XBTFSlb0niM4wdXOo9nIIJzY/0=;
        b=oYPHnpEYSGRFaNojQM6+8xhZbQZMtNLA2PpGtGhNOk18TRqCHme8wa9hRKjR24i/nF
         /b+65uArflJ0YtobNVOh0gaZ92p005OSwlUM063AvXEuWsnV2bIDmqRnlW1iKK0V7azq
         y1dos/D+JTRXeoBlbNPOX61tkoz0oKO12mc6wDnMnuNvVg9B++9SYEH56b45agAH0L/c
         Ppk3m8GHOcZ52f0flbZeOjtzPG76hcFfZ99IN2JaXDhmrNbH5+x50OZ5VcIoVbpBk5Wg
         dQJx8C+X9fk0lsnxuP1SrG2lgB2KHn9kSTy0YHGQdoBQP2EEco/s3CIqfNLUi/P3bSJR
         hyHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mUMyDnIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq31-20020a05620a469f00b0073ba1bc114dsi162946qkb.360.2023.04.05.17.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Apr 2023 17:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mUMyDnIL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkDR5-0004qT-3m; Wed, 05 Apr 2023 20:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UREuZAcKCFQ6A87Az42AA270.yA8C08G-wD89A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1pkDR4-0004nV-0E
 for qemu-arm@nongnu.org; Wed, 05 Apr 2023 20:25:06 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UREuZAcKCFQ6A87Az42AA270.yA8C08G-wD89A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1pkDR0-0005CJ-GZ
 for qemu-arm@nongnu.org; Wed, 05 Apr 2023 20:25:05 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 d34-20020a630e22000000b005039e28b68cso11235659pgl.13
 for <qemu-arm@nongnu.org>; Wed, 05 Apr 2023 17:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680740689;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=m8tjpnf+cHao99aT7XBTFSlb0niM4wdXOo9nIIJzY/0=;
 b=mUMyDnILMAEzoqBJA2qc00QHg3xmx7ewTp+036PbRUjQi/W/EBLMAiordN95KgF9ZW
 xU+3CVFMR2aF8juJ5mnRQ9mnQa+c934YO8qDbBVKl1cU1dz46Xbk0KqApRAy8rm45DMI
 acn8ew/XtguuzL2CrFE/Wg5MXXvuBhwFv2lLVJp9Pj/YUFWCnjDNuVyI83ajhxHKYaVG
 54tcL18vJCE9zYWWFBQ+RrLnlsskU9a8OIKMfmfTVph8hj5b28nQePF24iHhPfuXnsvd
 048GCJd+j+dBm4YChXhJsDyms/ap3ERy0FfkGOCrEOz+/D/f3yG+9VR+kMyEu8hoxU5R
 u33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740689;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8tjpnf+cHao99aT7XBTFSlb0niM4wdXOo9nIIJzY/0=;
 b=X1/KUPExlRD2AiaGNJtsl3wcRkwvBeNZq2Q5VRQKBBI1Y13kHOf1GotPTdEqLiDv3X
 SW2VcX0kT3aYZP+mYxwHOWFspIQzM9jBuwVRh4og5W4u8X6Msc+1S/ndS/Dm8OnrcTY2
 omeA2FdUly7PyuuHJQ2TkESDhvcULKgcTdHRUH9cgrNC5ktWtmhe/wNReEA36Pj3wZRa
 ZttBJYGc81Wgb+W0EnSGn9Ah2G3TKTNDh/4QaGTiP15wl78QorPuvY/9j9luRtofwFbV
 ez1vgVdtGJ3vONkBmpgV5PFhgzKdYgToX8/2b6zMsv1JDUdhzRp9i31cR8SrRQKnGb+y
 Cyng==
X-Gm-Message-State: AAQBX9f+HINjwjU4U+Gqa6DAQt4IsKcSmQkbs7SoJhk7q8C8MyKCqlcF
 x8eKm47LmAndeqKKYK7NVgSFyjJjKvCl
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:902:a70d:b0:1a1:ffc6:de9b with SMTP id
 w13-20020a170902a70d00b001a1ffc6de9bmr3151017plq.6.1680740689415; Wed, 05 Apr
 2023 17:24:49 -0700 (PDT)
Date: Thu,  6 Apr 2023 00:24:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230406002447.4046378-1-komlodi@google.com>
Subject: [PATCH 0/2] hw/arm/npcm7xx_gpio: Add some pin state QOM
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, wuhaotsh@google.com, kfting@nuvoton.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3UREuZAcKCFQ6A87Az42AA270.yA8C08G-wD89A929G.AD2@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2pZwGD39z98M

Hi all,

This series adds a couple QOM properties for retrieving and setting pin
state via qom-get and qom-get.

We ran into a situation in multi-SoC simulation where the BMC would need
to update its input pin state based on behavior from the other SoC. It
made the most sense to expose this over QMP, so this adds properties to
allow people to do so.

Since the NPCM7xx is typically used to help manage other SoCs, hopefully
other people will find this useful as well.

Thanks!
Joe

Joe Komlodi (2):
  hw/gpio/npcm7xx: Add GPIO DIN object property
  hw/gpio/npcm7xx: Support qom-get on GPIO pin level

 hw/gpio/npcm7xx_gpio.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

-- 
2.40.0.348.gf938b09366-goog

