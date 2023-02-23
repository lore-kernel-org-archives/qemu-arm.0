Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp688083ejc;
        Thu, 23 Feb 2023 04:44:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+c73yGjxUN17LmXLDln0SU85+lO5EBgMdzh7Yl7meqPWHb8EA2kHwaOArCDqiOfQgzufRH
X-Received: by 2002:ad4:5765:0:b0:56e:b5a1:b521 with SMTP id r5-20020ad45765000000b0056eb5a1b521mr18878165qvx.51.1677156291307;
        Thu, 23 Feb 2023 04:44:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677156291; cv=none;
        d=google.com; s=arc-20160816;
        b=xBgfxn0FkpOwFbY6FX5ekyheZwslG3yDA6Mv97sCK5+bM+I6oCYKTrT87qQmf4rU1U
         UbplM3iGHKV14evchS7MWpkkte2+eHPgywruS97QrNShKywHYF2DCQoLsMZyRVKnwOnM
         82/8K1oG0mYS0ZtfcYBFKSIZARjmX2UjGOKtG/wX9wY8KOl5hvEvIfPJ+DVFwsv2r8Q3
         D8kt/5ONbV5PqASv1ZF6jq3dVeWEeSrsSADIg/OTw6J+l4x0tPf9v+khVjU1mVRqr+Ey
         a4+gu3GmELEEaopWFasbToMrGxdanLxmT7H5wSeJRirgCrZ9mdzBcY8PDC9Ib6bk+D0q
         JzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0C0W7DRuTxPbJ5vnoxhjoJPFeysFShmh2ZHIgNuAzoI=;
        b=PCW/NfbBB4HvVj2IkoCGtcm73loD2iMa9ZwdJnHhxEigYzJSxR7IP9tile8PJBrvGS
         x/iSP790KeDfllSUOJqoLEIemzffDGTapCVAfs6LYLqcTK5j52YhhivFzKcuX29hJ/QA
         sMM3gjIKGhjRAPglOhTdNqMjsITzb0gbMt3IC1qUw0EM837Pdvbab9DpgSV+TYdzUhOq
         7Sm5jQmWZMr3RCqmIjTL+Fdf/1e44GQq4x80cmpxMQ6mijiUcNsNjiZtqd3WYSuvOeQE
         vCTGA9wSejkG+zjAO5aOz1pC4U6IQOmZPwgDgtWtGPpjpgXxw+4D2FXzKIMpUO5TTgq5
         OJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=axeQOIk6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14-20020a0cf08e000000b005318cf5172asi1380225qvk.520.2023.02.23.04.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 04:44:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=axeQOIk6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAww-0007YQ-0A; Thu, 23 Feb 2023 07:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAwt-0007Xb-NJ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:43:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAwq-00030z-M3
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:43:47 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c18so4119570wmr.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 04:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0C0W7DRuTxPbJ5vnoxhjoJPFeysFShmh2ZHIgNuAzoI=;
 b=axeQOIk6d9fabG8Vlw/CTlS2bhQZMpAZhFmCYL8ryIir+Aq3KSS2yGW1y3r/+6KqRw
 myQSic4WF1qFYHaH0G3/zUQSIXlexrwEzesESdlLE4I8tzT5idvg1arj6YbiWXEnl6Tq
 5D2Fq7fI6N+QgBz+VZqvL5WkbMKmhFIDdRy1PMg4vV8BBrvHum1Qyz+CIDpSNPHv+q9V
 Y/bXhZkj71BmIMj9uph9MLniSRJeLXsOP4/U1DIzLquw4fSx9JHFS+zOA6xnODB+bA3D
 ZafuH8JGVPjPU6Hwz4oUSkNGY88aUK4Hur+OEXDU2k1Up8Nv4k3KTyyYoLtL741jO3TN
 o2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0C0W7DRuTxPbJ5vnoxhjoJPFeysFShmh2ZHIgNuAzoI=;
 b=xojM5fO+elbVfPlT/L4J9KzN3zt678ian2aEJcRCJc5vztNtP0B2TlLILDFRkkVLdF
 7XdRsSrUU3C7Wo51G0Gy7LvRY8CVBPUQTLX9qDTCtoKvgYeSDPXpVmxU3HjmPYK4aVWi
 zsuhTfMcYGFJoAnX8hH8FCXhR2J5ZUK47KJA532+HdX95KEShBYI9lzdqtU7cMzV7Now
 KZOm8V6/txJ5fqBoWNJIu5LVQU+MCYhik+igC+ykzY3BXDnKmCgvbhBxIhoa4ile/E/N
 KD3xsDJw9L6ac43gWJ5j1G25jg0SZ704wZz/Mc++1l9n6c+W+6iwYdA6lIdOz5IkMGsN
 HeTw==
X-Gm-Message-State: AO0yUKUGjvZpjIwC6IFkg5V2unsw1xwijDp4a6xmCG228R1jTvzKiQmk
 jrR3QQ6avPgoqNzN+WfOw2KN6g==
X-Received: by 2002:a05:600c:160a:b0:3ea:bc08:a75a with SMTP id
 m10-20020a05600c160a00b003eabc08a75amr638549wmn.27.1677156222835; 
 Thu, 23 Feb 2023 04:43:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a1c4b06000000b003dc4baaedd3sm10076054wma.37.2023.02.23.04.43.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 04:43:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/4] target: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Thu, 23 Feb 2023 13:43:36 +0100
Message-Id: <20230223124340.95367-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SdhJEuEboYTq

All series reviewed, can patches be picked by corresponding
maintainers, or should I include them in on of my PRs?

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Since v2:
- Rebased
- Renamed target/$foo/monitor.c -> target/$foo/$foo-qmp-cmds.c (Markus)

Since v1:
- renamed cpu-monitor.c -> monitor.c on loongarch

Philippe Mathieu-Daudé (4):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/i386: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/{monitor.c => arm-qmp-cmds.c} | 28 +++++++++
 target/arm/helper.c                      | 29 ----------
 target/arm/meson.build                   |  2 +-
 target/i386/cpu.c                        | 74 +++++++++++++-----------
 target/loongarch/cpu.c                   | 27 ---------
 target/loongarch/loongarch-qmp-cmds.c    | 37 ++++++++++++
 target/loongarch/meson.build             |  1 +
 target/ppc/cpu-qom.h                     |  2 +
 target/ppc/cpu_init.c                    | 48 +--------------
 target/ppc/meson.build                   |  2 +-
 target/ppc/{monitor.c => ppc-qmp-cmds.c} | 50 +++++++++++++++-
 11 files changed, 159 insertions(+), 141 deletions(-)
 rename target/arm/{monitor.c => arm-qmp-cmds.c} (90%)
 create mode 100644 target/loongarch/loongarch-qmp-cmds.c
 rename target/ppc/{monitor.c => ppc-qmp-cmds.c} (78%)

-- 
2.38.1

