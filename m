Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp169947lfg;
        Wed, 27 Jul 2022 03:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/P4vaTKNy2d6J6N/PjNrgiozcY+sKvEjc4jEGrOzZe3Sb2/lvev3i4fEhS8gqA2SbuCcH
X-Received: by 2002:a37:bc82:0:b0:6b5:7a17:bf1c with SMTP id m124-20020a37bc82000000b006b57a17bf1cmr15529388qkf.97.1658917712395;
        Wed, 27 Jul 2022 03:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658917712; cv=none;
        d=google.com; s=arc-20160816;
        b=IanpXpPMkD8bMmezDkeAr6aJKdd/AM5+LYU3neJs3RQQsgxvAkuYgaqR+wf4wCrcZj
         HU7Ff6QCLiiLeD8zOPX3Ej0IuVgUZLsnGBSyA7ne+A8wrEGmpi9jSoFbxARiFWv0KcwR
         B1zdE6U8RXTVh4yYGo7a4R3y8rA/vz5CqmzPJh2lih2rT289elZx6YYv89TAZGX5ptwA
         /3gF9p0+Rdg69Z4R5bDZnfiFR7Dwx8GmFCgkq/5hTxwHWbOCPDYBjWsbbWEvs9+OIDQL
         Jx7dJjC/wnBC6njSDsJx3aA4wyhttFcI2Lxb9HDW/qWbTHpjoYGBBuwaTyA2RudqUf9A
         GpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=G8ZksOHUY8aWot2afeL2+8dRJXqgetE6lhkDnsFjrXw=;
        b=tVfZJvGRJcfTz3zG98V2nFYjFkrXx53u1xFjEujeh3geWv84tseuyP27lg2Be7VMc6
         2WTeBBJOiCkVFHS7ZlRwJduOiXHR8kuL86SuzgpyeB+9HC+nroDKKk3boXXvTzPdCQyq
         ESVbeizexmo0ECGZlMOVIRjBcdI6BRBlIOJq9x0MgS+uJoqZzjlSkfP42hL74uyAU3cV
         vG9yWAgvmYm/+OFqD5UOAlzPCoGGqjRs80c8G4jmnnvbjKwb6XY7BLPkTLZei6VGWBHG
         2ME2f0Cyb2eDtZjYNE2/EMO8vjxibehTQDrZN00jqL5ZFVHxhe/E6cIVFhlP1N1eiCcc
         gv0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020a05620a2a0300b006b5e1d2fca4si13535656qkp.0.2022.07.27.03.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 03:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGeHH-0006EA-MY
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 06:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGQ-00069o-As; Wed, 27 Jul 2022 06:27:38 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39889
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGI-0004To-8o; Wed, 27 Jul 2022 06:27:32 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lt92K5lgKz4x1k;
 Wed, 27 Jul 2022 20:27:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lt92G5Rw6z4x1N;
 Wed, 27 Jul 2022 20:27:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH for 7.1 0/2] aspeed: QOM fixes
Date: Wed, 27 Jul 2022 12:27:12 +0200
Message-Id: <20220727102714.803041-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=RDWM=YA=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: weoBZok9XJvl

Hello,

Compiling with CONFIG_QOM_CAST_DEBUG caught a QOM issue in the fby35
machine. The series also includes a trivial cleanup of unused code.

Thanks,

C. 

Cédric Le Goater (2):
  aspeed: Remove unused fields from AspeedMachineState
  aspeed/fby35: Fix owner of the BMC RAM memory region

 hw/arm/aspeed.c |  2 --
 hw/arm/fby35.c  | 14 +++++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.37.1

