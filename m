Received: by 2002:a17:906:4e11:b0:a23:2eff:81d7 with SMTP id z17csp289766eju;
        Sat, 16 Dec 2023 10:28:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIkTjdYptfy2NUemtAuDn7z2ojS/UjLuyq5g/kw3KO1HXYz+QG6C6+SqhzjvSkB6ZYdUUW
X-Received: by 2002:a05:620a:468d:b0:77f:afbc:99d8 with SMTP id bq13-20020a05620a468d00b0077fafbc99d8mr4085467qkb.103.1702751333886;
        Sat, 16 Dec 2023 10:28:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702751333; cv=none;
        d=google.com; s=arc-20160816;
        b=Xew7kf7wAp3CwydR1IezFNzgnlNLSsTRa+TYfdL1kV09D/qN6hgXIjkDUJXQ2oZ8+P
         rVzt09CmWqxTayeMlDqaBdAEz9Zm62q7uKGmlQ2Roen8wWs+BmLxoHCct4e9oX2cj8k6
         +JExWdMd4n2PEVdR5bjH4be1noB8PPWCnEVLiAkc0CuEtvn9VARnhnIw1vV8i8PQs4mW
         SFcSI76N7t5W89a5AVIojje1nfnr6RMEReiHiuOs33BBJ1yOyXq1Pb7Z8TaESkl37hAl
         BbZ6ckQjTSlFw4Qq7JAHaIhneigxZOQ4Lg98H2HKEG/HCbgYdvoHECvkUJNv46FMu7Qy
         SC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=8c8fO2J4P0ZAt6rtGDf2cDa84AEUmZR49PnfpkUC9FM=;
        fh=oGKIVXcH1r9KL/hdyO5aIi4Tl7S6YUHGM7njmdJqg74=;
        b=qOO+10UCpDOF4ZogDNuIciNNyItpcgQpMzR0k8Z/NFWp3ZKL62yIFXD+iJlFYPq/DV
         Dkc9730MZRpDQTPwn03pF+cmPRa9+rRtKpo9oiR54D/uQaMOoiEbHbX6365/W3Hh3iBa
         UTcccQM64EkDgkObm0rJsU0gAsQCt47A9PwKrntDXVsZbYENXRvSyuLwnEptaln4VMNu
         ddbKvaODPxmYPoH4uD15tUYwPN85dsMjg9ioSFy1wj5ICidYShRwoNpVCzgda9R1EtU+
         JR/Lhm8Vd+slYEg8l1+hfphhYZqzCN07fQt9wByDcvwMq6mSDWhVi8rz8PXvZOIPeCi7
         dtDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo22-20020a05620a531600b0077fb9d708b4si2723571qkn.662.2023.12.16.10.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Dec 2023 10:28:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rEZOH-0000TK-Jv; Sat, 16 Dec 2023 13:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEZOF-0000Qh-TE; Sat, 16 Dec 2023 13:27:55 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEZOC-0006Wn-OM; Sat, 16 Dec 2023 13:27:55 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id CBEC980025;
 Sat, 16 Dec 2023 19:27:46 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH 0/3] Add "num-prio-bits" property for Cortex-M devices
Date: Sat, 16 Dec 2023 19:27:37 +0100
Message-ID: <20231216182740.3305724-1-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Cxqxxf1Sp/eG

This patch series builds on a discussion initiated by Anton Kochkov on this
list in 2022. It allows setting the appropriate number of priority bits for
Cortex-M devices. For example, FreeRTOS checks at startup that the right
number of priority bits is available in order to guarantee its runtime
structures safety. They added a configuration option specially for QEMU
to disable this check because QEMU always use 2 bits for Cortex-M0/M0+/M1
and 8 bits for other devices.

While this change allows the number of priority bits to be properly
configured, it keeps the same default as before in order to preserve
backward compatibility.

Based-on: <20220813112559.1974427-1-anton.kochkov@proton.me>
([PATCH] hw/arm/nvic: implement "num-prio-bits" property)

Samuel Tardieu (3):
  hw/intc/armv7m_nvic: add "num-prio-bits" property
  hw/arm/armv7m: alias the NVIC "num-prio-bits" property
  hw/arm/socs: configure priority bits for existing SOCs

 hw/arm/armv7m.c        |  2 ++
 hw/arm/stellaris.c     |  2 ++
 hw/arm/stm32f100_soc.c |  1 +
 hw/arm/stm32f205_soc.c |  1 +
 hw/arm/stm32f405_soc.c |  1 +
 hw/intc/armv7m_nvic.c  | 23 ++++++++++++++++++++++-
 6 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.42.0

