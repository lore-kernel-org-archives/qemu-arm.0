Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp389171njb;
        Wed, 10 Jul 2024 07:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvYje9uOnXu+hv9jA1BejUVAcmP+eOKyz5BiXp4YItgbo9fvvA33F+njDoKSrZsHHT2RMUtvcLifA3/eJsD40IkVoPIlHA
X-Google-Smtp-Source: AGHT+IGlKTjem9SxokxcCbLJVMhz9oaxhmOlCGHYfXWvjb7NZsMPVLhT7qJOR6ZuJ600IGC7gbBE
X-Received: by 2002:a05:622a:2ca:b0:446:67ad:ed5e with SMTP id d75a77b69052e-447fa91eebbmr71151781cf.30.1720620868030;
        Wed, 10 Jul 2024 07:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720620868; cv=none;
        d=google.com; s=arc-20160816;
        b=WSIH68LLkRMmorU5VI5KeyPv/cs7+jkZWea94T5uLmbp+SpG/nipEsz38ZNu3UnhQX
         jLOS04pYKrImbC5SmNkB+IA5M6BpAaJaGtTtQbvhjQ7XX29scgobgfN2H65DF5YoPi0t
         FQy2i4zRbdcE6DNNH0g547adSAC0A8ncgxawvxJOJOSH2lWbmRPdGZVMv29pKNC3CB4a
         RNRMBT/v0dtnUjRPZ4ryjyZPYWGhoFbJxYv/uOAsGRFMOpHYx0iN+x7YsKTrU9UzcWIM
         b5/zZ+dBID9ithJIc+KEDijQcAVwX4BuZdOmvYKzfISj2pQThjNVa3TRWpb8zXE9tl8x
         Kndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9xETedJR2BfeiJWzg9JjuUfyJ/0K4iLRZm8ojwa4zvI=;
        fh=1yMWdjA4Hvf19phwiocF06KqfEe+g4ebJEKRD2AE9eM=;
        b=icU9juBNA1RXEBZbnP326+Mi2Bk2SyM8vZlTdN5iLId8sqTcD1MhQG4aFrFfAvXjJ1
         1JLppb7c/xlPWBTu2ugVQSwPc5mwlL/ENpIgwwqnbBbfwHIXxhLyo8zPsEBeZ55diiKF
         5N5Y5ruJMZAI5u7U+eCjxOD+7I1mAASLFv1PPV7fCt7ZryX1zOOxOkQXv+BxCmKeo3eC
         aaajpzEsm0BNAG/fzusQSwvE++mu7w7vx5qMPu21NLsmIlG/L+/TBaIp18ms1acFoSxE
         3yzoGzxiFAORymlLpIpZ6P6drqToZn6Qo5aI88ZM0ssv7aqQVWc2khJalEcRE44XruOz
         kHiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbXvsbCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bc40fdsi51937691cf.465.2024.07.10.07.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbXvsbCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRY5L-0004l0-84; Wed, 10 Jul 2024 10:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5K-0004gW-58
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5H-0003nB-2N
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so778075e9.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620853; x=1721225653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9xETedJR2BfeiJWzg9JjuUfyJ/0K4iLRZm8ojwa4zvI=;
 b=wbXvsbCvBJW3SEiCwa9TX51YPwxM2rnRc3nrwdKvgKsTwxtOfGZSwvK9teyjdIOr6U
 4OgKo2aadUoUXbRhbNG92+AeJ0He0QA/QSbJyK46KmQkGCckA8QXMyg6WAUywS1GMv5V
 +9ITGg8o6GeS8K9KekYsrGK9uD8bTFvLpxNJFHBOlKM0UHJWeRKkvu8a05MjVx19Fa+U
 YNf+hLlSeniqHtvq2J0uoU1i7YHJaBRqofgGVGM75RMbr9KNHnZF6amSiD2Vm29iLbKu
 w64580Asit64h8VJEGax+ZY+pmrKLYVzrC0p4FKSEl/6ZMerr0xKBnRx/n2OWviUgrFW
 nZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620853; x=1721225653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9xETedJR2BfeiJWzg9JjuUfyJ/0K4iLRZm8ojwa4zvI=;
 b=Xy3E85JhYvjw64JDCuc8pJvRmrG2EJkgIEtgjzzcsP/e4R29o1L/WqepXWa7daqBdx
 Vr6a0dMgfgDMN6ED10pQH7VWGnYuxilmDuL3ug087af/+ceDrUuWrXIt9NFHkUe4lPYw
 4AdksbJeaNBYFhXpDhYuc+G8J0KH987ovxSHb1fGjXmWaNktbaS5jkkAduz/3isE3wAH
 9ZZYJH2fCLIc16UwuMMiLbo8SUtNUt4Gurpm+7a//icBPiqMdypT4STu6J4Zds5+Bnah
 m8v9xWevbjg654npEIopgSw3zWBpKnqq4KAV2yuWtlvho7x+K42Wa3GUIZNDUB09x9Vo
 7iTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNmGHh05OT9jsXzbCZq9yU81DL4swROvLol5Tkc7KZdyYkglk4nY2v17eQjbTt6S3zX3kmv91u0/MRbZXk0gkoZJ9m
X-Gm-Message-State: AOJu0Yw9061zZuELcgEBBAVvQ5Os2+XuP5Myf04pwT7WI27iau4RKJiB
 KFmbydBbTjSwUyowjHxx1lNjAub9d1Aaw2YwJO3HTiMKn4EZnAUSB2g1xpf9ggQ=
X-Received: by 2002:a7b:c412:0:b0:426:618f:1a31 with SMTP id
 5b1f17b1804b1-426708fa731mr40091535e9.34.1720620852768; 
 Wed, 10 Jul 2024 07:14:12 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426e7638d1dsm64198045e9.25.2024.07.10.07.14.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:14:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v48 00/12] hw/sd/sdcard: Add eMMC support
Date: Wed, 10 Jul 2024 16:13:56 +0200
Message-ID: <20240710141408.69275-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cZ5+b+Neg2OB

Tag to test Aspeed tree:
  https://gitlab.com/philmd/qemu/-/tags/aspeed_emmc-v8

Since v43:
- Reordered and squashed commits (Cédric)

Since v42:
- Stick to spec v4.3 (re-simplified EXT_CSD register & migrate)
- Fill CID register
- Few changes to CSD register
- Implement 'boot-mode' reset timing
- Add 'boot-size' property

Cédric Le Goater (2):
  hw/sd/sdcard: Add emmc_cmd_SET_RELATIVE_ADDR handler (CMD3)
  hw/sd/sdcard: Fix SET_BLOCK_COUNT command argument on eMMC (CMD23)

Joel Stanley (1):
  hw/sd/sdcard: Support boot area in emmc image

Luc Michel (1):
  hw/sd/sdcard: Implement eMMC sleep state (CMD5)

Philippe Mathieu-Daudé (6):
  hw/sd/sdcard: Basis for eMMC support
  hw/sd/sdcard: Register generic command handlers
  hw/sd/sdcard: Register unimplemented command handlers
  hw/sd/sdcard: Add mmc_cmd_PROGRAM_CID handler (CMD26)
  hw/sd/sdcard: Add eMMC 'boot-size' property
  hw/sd/sdcard: Implement eMMC 'boot-mode'

Sai Pavan Boddu (1):
  hw/sd/sdcard: Add mmc SWITCH function support (CMD6)

Vincent Palatin (1):
  hw/sd/sdcard: Add emmc_cmd_SEND_EXT_CSD handler (CMD8)

 include/hw/sd/sd.h |   3 +
 hw/sd/sd.c         | 418 ++++++++++++++++++++++++++++++++++++++++++++-
 hw/sd/trace-events |   3 +
 3 files changed, 418 insertions(+), 6 deletions(-)

-- 
2.41.0

