Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3124589ejc;
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDWf2CtrsW2VDMYFcZMtj98VidCu0BEtyhrluj4v+LlrWUfGjr4e9UyxUHzOd1J2fb1Owj
X-Received: by 2002:a05:620a:4001:b0:77b:d668:dfaf with SMTP id h1-20020a05620a400100b0077bd668dfafmr8112613qko.49.1700090587368;
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700090587; cv=none;
        d=google.com; s=arc-20160816;
        b=pNWRDzzyb7MlZwP/xXFygzv5Gf4SGvmj4Z2l4qffNLUDUj9YkCtkbVxNP9Q+UBMFel
         hbooV+9+cv4EQaWpf8EdYs8EGCwOlpcAbEm+HG0kmqzFeJDGNFIn3/rOgwOKjIFcY3+k
         huuw6ATTI/1hJfU+O6izH8E29N8s6OH0IP1xWVN6AZiweou3/Avz523rLAsR6BKMLRZl
         sLMkiWjff23neSHL3auXlarkxOD6p8MxU4vzvhLhg15l/B3GJdHMRUeLZYUqHlYhK+gX
         P1jSU6BR4OR5cddumLhiJunNd9JoCuoxofYt/g83rJYkpu+giqkUqpXMCCYyN9LCQ7zX
         uibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=kkOZV3biFdXSEp/vYh8ReEbONrvb3kSMa+0ggMMO8o0=;
        fh=uMNkG2qG0zUfNX9Dd8yIHy0nhEp+iUPJbdGoU1GKRvc=;
        b=pObqMYmLdCW7zZZ13z0Sc8RdLChJLsOs443ynTxSzYE3oFeFY7wkpbuqmnllbrEGRz
         adSKKpnB8+OE296aIbZV7Gh4TUqig1qz4v1HbkXvetWv6+MZ/1aNNs6VLZAa4DaJEHVE
         sHAvgBK4x+sB2sqpyAoKVQ7pcZjwysxbNPxyPCChZRLdYe9r2S9NsYAqdSOQhB+jQYf6
         H/WTMh8t5g/pqZFx/gb3W2SmNN4prUxm/onW2ke/apQDC99qMDFin2SjwDwjvOCRaCRt
         TK2kP+skX7ueOuv+7TK3cbQFU+OXUC6TbPLHOEgk7z7CPeBCcmCWfcR1ssg2G0B8SX12
         f5rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrX2IwIE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020a05620a44d300b00776f2642d26si10138568qkp.729.2023.11.15.15.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 15:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrX2IwIE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3PDF-0007YR-1n; Wed, 15 Nov 2023 18:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDB-0007WP-H6
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:21 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PCt-0003IF-An
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:21 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53d9f001b35so314426a12.2
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 15:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700090518; x=1700695318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kkOZV3biFdXSEp/vYh8ReEbONrvb3kSMa+0ggMMO8o0=;
 b=YrX2IwIELFkdal7kNL8agK0O1lig8RVkWIcLUaBmjLwcDkYEbAatmR3/IXs2FRtrhB
 dTUZEe0vl9o8UCWgNQmpvZSjruLm56eRKJofuJVCQL6ghJvthMhllH+JVHSFjgNjJzYv
 MIG+xDPcdcO2HvVFaOF1qVwWhINK6F9uxrWtIF4ugOBDZhP13voYD5MJ1ZpyouvRDy2X
 Y/xhY9mTw6r2GemuWw2QbFFp3QxP49cDqDCt1PYMwMU8DauU6n0Ut2DRw9A63eu5IMfb
 UWjIWKRsupe2fJojkLyYv5pZNZTR2vcj4NfrbJXaOQxYVE69uCsqu24zewEk4p96MG8Y
 bo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090518; x=1700695318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkOZV3biFdXSEp/vYh8ReEbONrvb3kSMa+0ggMMO8o0=;
 b=qjAdKm4l5I4pUTjwiPyliwS/QFbc85pqRMoXcHjJ6xe2wSBI3qJsfchI00Zjip8zBy
 nA2Kr46nLkFXhEzg898MEKdu8Bh6Zf5hUo1WA/TaQIhWAOPPgTGuQXOAAX87YkPIAtJv
 f+lMrGR6mOeiSTqiAb7R74kC9gO+3ukb+qxVIfsGw7Gv840Pdc/kiTv99Ae5lNY2GASA
 5gGNkOWOyaphe9sMpctXcMbOBlWO+K5/FsbFHeG1Znq/9qfrz3abW4jo+7Oqd312ZXON
 wQvXszP2QtTnlpsjJQvyjD1cpSVmtf1d4GYwLwsD432cIscUz77gckTK0gfbTd5XEU9P
 x0kg==
X-Gm-Message-State: AOJu0Yxm8X/NN9NwoexHE2sAXq48X4vraUz46DBig6k57DBad5FoPjRI
 ISFXRS7lNWgcVQ0yJj9emR6tVQ==
X-Received: by 2002:a05:6402:40e:b0:542:d8a6:bf14 with SMTP id
 q14-20020a056402040e00b00542d8a6bf14mr10711894edv.33.1700090518116; 
 Wed, 15 Nov 2023 15:21:58 -0800 (PST)
Received: from m1x-phil.lan ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a056402174600b00530a9488623sm7063267edx.46.2023.11.15.15.21.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Nov 2023 15:21:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Tyrone Ting <kfting@nuvoton.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Hao Wu <wuhaotsh@google.com>, Felipe Balbi <balbi@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair@alistair23.me>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.2? 0/6] hw/arm/stm32xxx: Report error when incorrect CPU
 is used
Date: Thu, 16 Nov 2023 00:21:47 +0100
Message-ID: <20231115232154.4515-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uyssh9+KsgfS

Hi,

While reviewing this [1] series from Arnaud and Inès,
I realized STM32 based boards don't check the requested
CPU type is correct, and ignore it. Possibly confusing
users.
Since these simple boards code is used as template,
I took the opportunity to sanitize it a bit, using the
MachineClass::valid_cpu_types which seems simpler (to me)
for newcomers.

First 3 patches are candidate for 8.2 but this is a long
standing issue, not a regression from 8.1.

Other patches are similar cleanups, for 9.0. Besides, the
CPU list output will be nicer with Gavin Shan work [2]
integrated.

Regards,

Phil.

[1] https://lore.kernel.org/qemu-devel/170003673257.14701.8139061802716120109-0@git.sr.ht/
[2] https://lore.kernel.org/qemu-devel/20231114235628.534334-1-gshan@redhat.com/

Philippe Mathieu-Daudé (6):
  hw/arm/stm32f405: Report error when incorrect CPU is used
  hw/arm/stm32f205: Report error when incorrect CPU is used
  hw/arm/stm32f100: Report error when incorrect CPU is used
  hw/arm/msf2: Simplify setting MachineClass::valid_cpu_types[]
  hw/arm/npcm7xx_boards: Simplify setting
    MachineClass::valid_cpu_types[]
  hw/arm/musca: Simplify setting MachineClass::valid_cpu_types[]

 include/hw/arm/msf2-soc.h      |  3 ---
 include/hw/arm/stm32f100_soc.h |  4 ----
 include/hw/arm/stm32f205_soc.h |  4 ----
 include/hw/arm/stm32f405_soc.h |  4 ----
 hw/arm/msf2-soc.c              |  3 +--
 hw/arm/msf2-som.c              | 16 ++++++----------
 hw/arm/musca.c                 | 13 +++++--------
 hw/arm/netduino2.c             |  7 ++++++-
 hw/arm/netduinoplus2.c         |  7 ++++++-
 hw/arm/npcm7xx_boards.c        | 13 +++++--------
 hw/arm/olimex-stm32-h405.c     |  8 ++++++--
 hw/arm/stm32f100_soc.c         |  9 ++-------
 hw/arm/stm32f205_soc.c         |  9 ++-------
 hw/arm/stm32f405_soc.c         |  8 +-------
 hw/arm/stm32vldiscovery.c      |  7 ++++++-
 15 files changed, 46 insertions(+), 69 deletions(-)

-- 
2.41.0

