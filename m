Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp657581ejb;
        Wed, 26 Jul 2023 09:12:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGIVqAAJdctMlLcQgXv9gTt7ogw9XqaWxrhRbF//DovabnjleFM7pCq7oRUjPSRnyhS77JV
X-Received: by 2002:a37:9341:0:b0:76c:5952:7317 with SMTP id v62-20020a379341000000b0076c59527317mr1832221qkd.3.1690387943616;
        Wed, 26 Jul 2023 09:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690387943; cv=none;
        d=google.com; s=arc-20160816;
        b=NnEd2YJWIv6vn8Tungbhy8bzGjrcXgCNqf1o7jqrz2i6xvU9bMUXqPaj/l6zjh9hOB
         3LgQbsSWGl2DhuYHqMxqG2BJRl7xwzXbSmXUlLYZ64BWSpnkPv4Xvk0gvKPDvf2GM7xW
         FcxNmwA4R3cRmQfHsYR2oBAqfbDkNFUi39dSCz2jD5UWF3lcigAHL2ZvEDWXm0G2jVZz
         FHx7XEhecPda6+F9zMTnVrFp8vIqSSXmbVOiqMKGMHrzTrI0NpxyhHxOUIDWvOMlFb2M
         adjSe65wQIMqh6lKUje/0Dn7jY7IN84TO+6WF1Z2CGmFqCBV/IL9mSHxN2TCFAJTJ9nk
         zbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=vGd9BO2gWsDD5jiD7uGX7NI67n8YdnepoA7sxpi283w=;
        fh=+WBZG3uX9FXOqUEW7dRrAA3LgeoMrjfTvks8rWRkhTI=;
        b=BNj4Vdt/Fct2ijWItrpQfAd2jnzMpxSIIfpdIIlntzWNUFPMn2eg1cvCW5MGpnITYc
         kVKxLWRSJ0ZH1bx9jFaLdUr/tWKjAYqlehNDbjmWYeKPs+xeakPS2XdPIPORQRKU+J/S
         I5g+K2ApYebL1O0YUht7atMg8imWiqaDql0sbgvJezJ/kUE18+W3ErLjNkc/zup8drD9
         nfXA8RVyRqdemRACOhg3zy3xWk9cRijFIgieaCJuYe6xwdDwCKOOq+Y+bmdS8jU8odZ4
         te3YHfrYrgg1DscKztONXg6+BCbHCGZ7UWisoPL5oZ3IXBJ6T8+FdSO7wwKEUDx+I+ah
         F52g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17-20020a05620a409100b00767d0e9d838si8489169qko.396.2023.07.26.09.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 09:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOghW-00068T-B5; Wed, 26 Jul 2023 11:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qOgfZ-0003Y5-Af; Wed, 26 Jul 2023 11:43:21 -0400
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qOgfX-0006B0-Ek; Wed, 26 Jul 2023 11:43:21 -0400
Received: by mail.gandi.net (Postfix) with ESMTPA id 718CF60006;
 Wed, 26 Jul 2023 15:43:13 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] Complete i.MX6UL and i.MX7 processor for bare metal
 application.
Date: Wed, 26 Jul 2023 17:43:05 +0200
Message-Id: <cover.1690385928.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::223;
 envelope-from=jcd@tribudubois.net; helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2njgKyT8gFBD

This patch adds a few unimplemented TZ devices (TZASC and CSU) to
i.MX6UL and i.MX7 processors to avoid bare metal application to
experiment "bus error" when acccessing these devices.

It also adds some internal memory segments (OCRAM) to the i.MX7 to
allow bare metal application to use them.

Last, it adds the SRC device to the i.MX7 processor to allow bare
metal application to start the secondary Cortex-A7 core.

Note: When running Linux inside Qemu, the secondary core is started
by calling PSCI API and Qemu is emulating PSCI without needing access
to the SRC device. This is why Linux is using the 2 cores in Qemu
even if the SRC is not implemented. This is not the case when running
bare metal application (like u-boot itself) that do not rely on the
PSCI service being available.

Jean-Christophe Dubois (3):
  Rework i.MX6UL device implementation/instantiation
  Rework i.MX7 device implementation/instantiation
  Add i.MX7 SRC device implementation

 hw/arm/fsl-imx6ul.c         | 163 ++++++++++++-----
 hw/arm/fsl-imx7.c           | 204 ++++++++++++++++-----
 hw/misc/imx7_src.c          | 289 ++++++++++++++++++++++++++++++
 hw/misc/meson.build         |   1 +
 include/hw/arm/fsl-imx6ul.h | 149 +++++++++++++--
 include/hw/arm/fsl-imx7.h   | 348 +++++++++++++++++++++++++++---------
 include/hw/misc/imx7_src.h  |  68 +++++++
 7 files changed, 1038 insertions(+), 184 deletions(-)
 create mode 100644 hw/misc/imx7_src.c
 create mode 100644 include/hw/misc/imx7_src.h

-- 
2.34.1

