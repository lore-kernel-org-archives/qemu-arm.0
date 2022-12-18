Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2844031ejb;
        Sun, 18 Dec 2022 07:23:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgibw2bw+GexM/RqrUD6u+kNw4mK7ZXy+4IFKmohBXs66kNugPEyYBT91HUg54RV0RW8aZ
X-Received: by 2002:a05:622a:22a7:b0:3a9:7e3f:2646 with SMTP id ay39-20020a05622a22a700b003a97e3f2646mr7188279qtb.11.1671377017874;
        Sun, 18 Dec 2022 07:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671377017; cv=none;
        d=google.com; s=arc-20160816;
        b=mZWXRF2Xg5thMC+xYHU5Tf06cXUWYzYEI/R/kMVDEYxuj+RyXSxxyOdqf5iORBZ4h+
         b7KhxjOFX7EKlE3yZ/oLLDHiX6nShqvp8klxAmi1CLIqhWrR7o5e9Oj3ezDlAGTN5Ys1
         Cfx6lV1WaVxqoCMkA6hSQVhwZ+BO+br3LiCjvf8QG4jC4t5Uii7EnNLa106LBDA0bJ39
         K8XhXZ8HZYGL5gFtVJ2/0OK6aaEb/VBystYUeDimoqarIorafnZN7Zvcw8I1UYEJQNJL
         dAFkdmZP9FJwdi3XXg/t446t3YnmpmXlgi3hgwaZOkGa22spvs4x/P66D8E1ey+tF5Cw
         lIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jGulxA82juDG0jPHwcUEsFsW8ZBArzi37ZKN0P+bYOk=;
        b=XPaDSx9roI56r9c1vuJacjOa6gLsiH9jkINcB1/OisGMVTZxdubcHxRl+XhSGEYIik
         bm5+rmC/RoZLXzbx/EphsrGQ+EWYbpvQ8qDUIKjJntf9qrqHyZPg+7mn12Va5K5Ay3KG
         Ka4fL9WbNXJ8pkLVKO6N86un2N4QDBCYIAX/Y3bHZqfd+Jn/Mj437Uall2iqQF1M8g4o
         pC7Qr+npU8H18Qk3kOMp4xDxof+t/wsJxYIevn5EjKC3BOd4rwsdKQAaFJWpORSMFP/6
         3fSGf0tBlVUQ+S56mxycPwBJNcpsmacBH7uRNmDt1RiH6GjU/2yo3vFSQ5iTsakFXTE4
         NYCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="F4k/KTSY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y206-20020a3764d7000000b006ee78f6635esi3007863qkb.278.2022.12.18.07.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 07:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="F4k/KTSY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p6vVZ-0005Gp-VN; Sun, 18 Dec 2022 10:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqo-0008Ay-7o; Sun, 18 Dec 2022 02:12:46 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqm-0000lE-D7; Sun, 18 Dec 2022 02:12:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBE9560C55;
 Sun, 18 Dec 2022 07:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AD3C433D2;
 Sun, 18 Dec 2022 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671347555;
 bh=c1XmusrCQSDhjrjqD8NYv7uTw9yPJTWMLhWJ+qDZIns=;
 h=From:To:Cc:Subject:Date:From;
 b=F4k/KTSY+QIHNeniPwz3Ca+otPYCJFRNJBt4jaQ4RJ48n6LOLZbsLCWUxBSFlRHIn
 xX6fD6rw2MldIvmsSwo2QqiCncqSimt4V/zajIMl145hVxXt2HDPGxSp5eHyvyV5Gb
 /3QBMiEPFVAA3NmSYSA5mwyjmMvjy5SQcCAMyJYxEpQ7jgwugvEobSu1thaYGX8/Ub
 pd1LAbWJ2gR2SpudAJpsYKRU76ev2KPLzm4y6URw9N9vpqmOzSedFQSVFuG9J50/RN
 4qk0jMMFXYRAWOZAPh9hf/WLfopuO4W27FNFIyIwcE/jwyrpwJa9igGOttISxnSXEM
 TzldzQwG++3Cg==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 0/2] hw/arm: Add support for STM32 H405 and fix STM32F405
 memory layout
Date: Sun, 18 Dec 2022 09:12:27 +0200
Message-Id: <20221218071229.484944-1-balbi@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=balbi@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 18 Dec 2022 10:23:20 -0500
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
X-TUID: vs8UFAlG5sGD

Hi,

The following patches pass checkpatch.pl and have been tested against today's
HEAD (55745005e90a).

Felipe Balbi (2):
  hw/arm/stm32f405: correctly describe the memory layout
  hw/arm: Add Olimex H405

 MAINTAINERS                             |  6 +++
 configs/devices/arm-softmmu/default.mak |  1 +
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 hw/arm/olimex-stm32-h405.c              | 65 +++++++++++++++++++++++++
 hw/arm/stm32f405_soc.c                  |  8 +++
 include/hw/arm/stm32f405_soc.h          |  5 +-
 7 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/olimex-stm32-h405.c

-- 
2.38.1

