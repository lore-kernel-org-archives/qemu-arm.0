Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp416157lfa;
        Thu, 3 Jun 2021 10:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuus81v7j8RavElOTj2I0895xCTK2XyFI2jWy8q1Y8B20kK6q9QZAANUL4SJ95ItGOqfjR
X-Received: by 2002:a67:fe57:: with SMTP id m23mr260628vsr.47.1622740395921;
        Thu, 03 Jun 2021 10:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622740395; cv=none;
        d=google.com; s=arc-20160816;
        b=CVQ5j3/gHx5+tHKL9IUGZU9EwqDZ0lBA6v4Cv3hyhXdG4/J/T5XQ9jqGRkl7txpwTa
         KGeXhJBLqfkl5q1eLfBKSAJQijEZhFouuv+JmENHJVYQD/jIcLA7LDeTyQF+wKrPHtci
         HwTU0wpLYT7cfdDUlSJrjD6IM7PTTwwAida6OHXyMzeIwfEEJrx74CiLC/UD2pmhe/8G
         EWyiIvSdApKeGTeYp4KeeYv2RgX/w/WCSRMshnxv2pRr4FgigzMsgqagCxpUp+06xxxF
         rZLxBn3E4Ymlb8lBKdxHebZjt4RZc6CZzceYJW+d2vzbUzMr3xqrBChVo1qsUbjoeU7X
         vebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=m51+sIPoEGhMaWZf4hgHR8aYAnr1Re61ef82SgF3zgg=;
        b=ZNXmR0b6Me2sU0NrfMjcxaBXrZj48xjBYVDODxltrR3nRCQTvyxOxNhQofLDAlXS9x
         UzjUyN/SLPovZp9RlX/ao3T3Z7qJ01UbFi5c6MU1KeZfWIb6hTbp6jfnDK7IeWBGzPvN
         KrSw2rkJG8jA2nSGtSnBL8EOGEa86SqYM8HY1YTm4URmuq5tzidjL0JPYSAdDPDOVlMn
         IIGpEId1/oERr3zmMXxXTRbPueY+eWkV/k6eLAdAhSXyol3Jr4VGH4G1gwnuZBpcr7Hs
         PVQgchVrnhkElMouypbZwajg/aTcs/ZwiFOf9vyXXM3njwkqMxPbgfZftwNjaxeZk9a/
         38HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VTsaJNsF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si761719vsk.176.2021.06.03.10.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 10:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VTsaJNsF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loquB-0002Bi-7R
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 13:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu0-0002AP-RO
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqtz-0005QT-4p
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso4137840wmq.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m51+sIPoEGhMaWZf4hgHR8aYAnr1Re61ef82SgF3zgg=;
 b=VTsaJNsFWFNoGKuUyJSu6xv3yC8FYVYBlDPadmNwD7T5SNQvp6s89+XiUIL7Ex6NLj
 sQ1yDyf1s1L2zGoS290+jhx0fU9KZ2Kvr15I7R47xqzp6Om1Q2o2TF262NNvSViaCciA
 xNsNTDTgaPnIqgj70E5IuadOYUFtR1Bm0s+kDoVBw38GspXHJzhL4meZJw1Y/vgeYk1B
 dBpqLhmWGduYnGn5tR0tWUA+EH+GhTUTQAgEnuFhbgQeCjyxrWcF3Pq6dPegb1QsMv7C
 zkzMQxak0wp0Hm9GJrCKySn9/jyUG5iC+LptXHOdu7pYmagcS5Z4ALNDRuGLjYISP/gO
 PAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m51+sIPoEGhMaWZf4hgHR8aYAnr1Re61ef82SgF3zgg=;
 b=GL/WtMC8OuX62vwPf+m0/iRKPiKuJNGYinKBNPNBEBwRWtiXOA/nx/h+usz03G3KsH
 Ar19g6ls3YPzjJJk4oX2y635vFU+TKYfBzpInZ/Ai56yuyURUxm/TwsHj40ye76VvxSt
 Eli8kSEENGxyiWQySUpsTluU2JC8dRpOKlOOurNbFqxC8KLh74/Dq9Hp1BPOXLvMypJf
 qUHe06c6TvxtZtT2wx3Gk6XymEIb739Y7/TjX3x5pIa2xCWT0lPjCKIqq4xkEJhMwXNi
 YCrMZoXaNpji3aSEwMDMLwNRGuzLnU3eHOoomlq0OEjRLgWxYP0RMtiyjKF3r5rrH2G1
 Odjg==
X-Gm-Message-State: AOAM5312myL6PUDO52Za+qy/uUBuzXANVUfIs0V2gpGuSVgX9cIznkDm
 GlSUJwilgyCTmIXQiAWICwUcRhZkQZSCZlPD
X-Received: by 2002:a1c:7508:: with SMTP id o8mr10837736wmc.70.1622740381410; 
 Thu, 03 Jun 2021 10:13:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/acpi, arm: Provide and use acpi_ghes_present()
Date: Thu,  3 Jun 2021 18:12:56 +0100
Message-Id: <20210603171259.27962-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KnO49Sn73xtc

Currently the Arm code in target/arm/kvm64.c which decides whether
it should report memory errors via the ACPI GHES table works
only with the 'virt' board; in fact it won't even link if the
virt board is configured out of the QEMU binary.

This patchset replaces those virt-specific checks with a single
new acpi_ghes_present() function which tells the caller whether
it's OK to report errors by calling acpi_ghes_record_errors().
The mechanism we use is a simple flag in the AcpiGhesState
which gets sent if the board calls acpi_ghes_add_fw_cfg() to
set up the GHES stuff.

We need also to provide 'stub' versions of both acpi_ghes_present()
and acpi_ghes_record_errors() so that we can link even if no
board using ACPI GHES has been configured into the binary.

(You can test that this series is necessary by commenting out the
'CONFIG_ARM_VIRT=y' line in default-configs/devices/arm-softmmu.mak
and building with KVM enabled on an AArch64 host.)

I have tested with 'make' and 'make check' but nothing beyond
that; testing by somebody who has a guest setup that uses GHES
would be helpful just to check I haven't accidentally broken it.

thanks
-- PMM

Peter Maydell (3):
  hw/acpi: Provide stub version of acpi_ghes_record_errors()
  hw/acpi: Provide function acpi_ghes_present()
  target/arm: Use acpi_ghes_present() to see if we report ACPI memory
    errors

 include/hw/acpi/ghes.h |  9 +++++++++
 hw/acpi/ghes-stub.c    | 22 ++++++++++++++++++++++
 hw/acpi/ghes.c         | 17 +++++++++++++++++
 target/arm/kvm64.c     |  6 +-----
 hw/acpi/meson.build    |  6 +++---
 5 files changed, 52 insertions(+), 8 deletions(-)
 create mode 100644 hw/acpi/ghes-stub.c

-- 
2.20.1

