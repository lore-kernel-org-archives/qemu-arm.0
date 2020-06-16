Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2458820lfm;
        Tue, 16 Jun 2020 02:45:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEWSvWkugszmyzerPVDCq0WLyAjZoo4q6tZYqy0Xi2Tmrfw5uVyWuHe9PvHTnuhSVQ/eDA
X-Received: by 2002:a25:c507:: with SMTP id v7mr2724818ybe.306.1592300758652;
        Tue, 16 Jun 2020 02:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592300758; cv=none;
        d=google.com; s=arc-20160816;
        b=v1eVp7KAmn1Sl7tKJGRsYvqHRj89WRS5ZoCE27WXptxjeGMmZL3AsfL30qo+Zd/BZw
         lv8C6gB+x0TmTy6fK2TbDqDDekBkojEMZhka5PNp8fnYIds6AFdd/mvz5hMAwmaay0mk
         ynhnJcubm2/d26bUrVHtBAgdIdVOHSuN7lf0lTRC7/38fOS/XADNNdZSONvDd3B3hQFg
         5lXDrbQcq6Wbdtt8LYFJARiI3Lp3HPMQ6kY0mWN5whlckHCzqWA2+dW20yvoFZ2AbV/X
         9CaKNFpeMJr7jWgkCW8Ja3KYSZ+RjuiXuXdtfZuHcQlzguQsw5L84yK+/kLAaC5yJKCj
         XZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=BkfrXS6jUPlOeSckQNT81vLmPXJox8SVcSY2Hn3/dQU=;
        b=06rxLiOJF2G824jXygldv/Iap4jrranK+0XYF14OddWwLK447uz4xBQOUbkvizO/Zq
         iieihgDvW+trF5hDZpZI9cJpt2P6+f58o5fNIF5a0RyPg4MnpQ3PBE8gQRIiMfoH/nOZ
         a93ch2I5kaWwcxMXHg6hALeLgDJ51dihSU48khIk1eStKMk6Rg4moPowBkvE5qGKvVjO
         eeyXajF07OnEHrNof49UldYXydoDO8yHmvkNa3q7LLhhBvmCABmFOWtK+UTyjM7rEiRq
         BQOe94zxsgwMldx0dftIZSr3PsTZ5LbW+T9oxQt3VBLylB7rDUq+amnIJTj7Kgy6DRP1
         vTtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X5xFtwLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si16441409ybl.32.2020.06.16.02.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 02:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X5xFtwLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8AI-0000p7-0n
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 05:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8A8-0000ok-IH; Tue, 16 Jun 2020 05:45:48 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8A7-00023o-4I; Tue, 16 Jun 2020 05:45:48 -0400
Received: by mail-wr1-x442.google.com with SMTP id p5so20015348wrw.9;
 Tue, 16 Jun 2020 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BkfrXS6jUPlOeSckQNT81vLmPXJox8SVcSY2Hn3/dQU=;
 b=X5xFtwLtOOEPDu0XJMfuwgOijMyOKlho5ap4523Ap0QtiJ+AbQF1TQ/08/8QQ8sMFf
 vxFP0joX+6+Hx0RnwQ3FGwIotstkyizRgUcBB1Rq4iQUVYR5AUd7bNmLgi7tItR8IGrf
 MiRZDPnqsEC98BuFIUDPAqzTi2i1Nm9ACMSAqOkpk5VAaVxjLUsoUkGCv1YIXLs9FcWw
 uJRBmElBvPTITsT0yXMy3ksMeUXng0QIv4b1R87a6woicM2B6gae/zh4eWqsPaDZmlwe
 oHzHDelx28QdtJOvpSi+SnVxqhydoim9pAgvPD11tX4oceRsNerWwU9QbS19URDR7lHb
 7WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BkfrXS6jUPlOeSckQNT81vLmPXJox8SVcSY2Hn3/dQU=;
 b=fTpVIK8iabNa0cEF/R3P6QQyYTfTfBY7HyoOen81cX+SF+kRNszeoLTzer3izghaMP
 BNNcrQ3BV+/EsExLT8iEKPshddchaQZTLCDHSjifAc5WjTxyVS3gJvgSP8iRcy27/m/Q
 TyujDbR8UFAo9mSVyTetyW/FYOwAP7th/XkyDjFYmjfXdCax+PcCzeKMCAK7X/npfyJn
 kwXiZQrDGVOIYrn75DVqHRHWcbVHudFCa6hKNdGakK61HfokIUUT2zAB6HX5qZNDExxb
 tOUmCDty4MvoOwsf5IilKPv5DCC+JOqkPeaBlxBGXgJeKoQnhDyL81Vq2sW0nMxW/ZZT
 VQ9A==
X-Gm-Message-State: AOAM532e7VePo7IuAgNRnBU95bCmvnLYv46/lHf8VHKIIkMKaHdbBwPY
 T/CoM0U/CUYLwUXmms+upF7qVG/t
X-Received: by 2002:adf:e587:: with SMTP id l7mr2155993wrm.352.1592300745151; 
 Tue, 16 Jun 2020 02:45:45 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o82sm3254017wmo.40.2020.06.16.02.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 02:45:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/misc/pca9552: Trace LEDs events,
 make LEDs 13-15 as GPIOs
Date: Tue, 16 Jun 2020 11:45:40 +0200
Message-Id: <20200616094542.25415-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U+7dEtnpDvI0

The PCA9552 LEDs 13-15 can also be used as GPIOs.

Philippe Mathieu-Daudé (2):
  hw/misc/pca9552: Trace LED On/Off events
  hw/misc/pca9552: Make LEDs 13-15 also GPIOs

 include/hw/misc/pca9552.h |  2 ++
 hw/misc/pca9552.c         | 25 +++++++++++++++++++++++++
 hw/misc/trace-events      |  3 +++
 3 files changed, 30 insertions(+)

-- 
2.21.3

