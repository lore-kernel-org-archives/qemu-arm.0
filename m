Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp614600ejc;
        Sun, 30 Oct 2022 19:18:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GBJawYxxFSLKTobkohpKK1cQi+CTR14RgQkLP5C7loO0fdSWvgetAXzYFrPUegwWyI0wn
X-Received: by 2002:ac8:5c12:0:b0:3a4:ecf9:51d1 with SMTP id i18-20020ac85c12000000b003a4ecf951d1mr8892236qti.548.1667182691844;
        Sun, 30 Oct 2022 19:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182691; cv=none;
        d=google.com; s=arc-20160816;
        b=nrd6QXDZBb9vEU3JnBFTjwb6fQVclgy3JIubgHaryKuc7rXwL1bMzzY4I1EkZ9Rn5e
         we/85xPodiITVeZigXKSePZIe4/+IgKk6IdGhuxbJZ74l5YYFeYGEOJYrVHKCccL0W5M
         RNgFJ6ux1nUyXJtFSBlnbLbD7IgiKES92c0auZ72k06ai+B4mzQyJUtU30KbbZHKYSkE
         DjjkuOe9uS61ghG87rFTGQ7MJtz70Y4lNqFDAuS4X0t9eTwskB0w/fQE86EjqBostM3J
         w2cQN/Aiui6JlBq9AaVR4LdiKPT8DIWic/hhWWvVfUTVIYjjym8s8KVaZ3PBXg2QJKV3
         YoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=giM/wNIPLOx+p1p/V7aG+dUU3z5psLYpc5tSCLuV/xI=;
        b=LyHrFUAPnG3PjpICifmeenDFLOxDQJdG7QMEiqaRb4uVgC3+KGXoVQunvv0D3x5HaQ
         OwrcYd+fMqevO9jj0vQPdE3PiXAUmtN3SJY5984K2xzvnDiEDeEjOypkZ5OdnZzBK/Ni
         TY835/LTUqirvrwwDMSnIRSFqqUx2uQuzzEk1YYwxSFRB/AoeGABh5D6ceGQmw1bt6G8
         Lfx1jcH3GGpNb602twr+8I0WVvbLWMpBbvqRY78x2txT3/IgIlXUYtSTvBWzIC0mQL3p
         isuCfC9GQP1/Z+Jc+HVFOaI64SksIiqUjuwGklo9oufGesgbY2UIvnXyOpKnRPqeRqI2
         BFfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a05621420c600b004bba8a1d203si3329196qve.218.2022.10.30.19.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opKL8-00015T-Qx; Sun, 30 Oct 2022 22:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL7-00014V-2Y; Sun, 30 Oct 2022 22:15:49 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL5-00033t-FT; Sun, 30 Oct 2022 22:15:48 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 96B9A11F257;
 Mon, 31 Oct 2022 02:15:45 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 02:15:45 +0000
Subject: [PATCH qemu.git 00/11] improve hw/timer/imx_epit
MIME-Version: 1.0
Message-ID: <166718254546.5893.5075929684621857903-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S9hxKKNKqi4Q

This is a follow-up on my initial work to fix https://gitlab.com/qemu-
project/qemu/-/issues/1263.
- fix #1263 for CR writes
- fix compare timer update
- software reset clears the interrupt
- do not persist CR.SWR bit
- general code cleanup and comment improvements

Axel Heider (11):
  hw/timer/imx_epit: fix typo in comment
  hw/timer/imx_epit: improve comments
  hw/timer/imx_epit: factor out register write handlers
  hw/timer/imx_epit: remove explicit fields cnt and freq
  hw/timer/imx_epit: simplify interrupt logic
  hw/timer/imx_epit: software reset clears the interrupt
  hw/timer/imx_epit: do not persist CR.SWR bit
  hw/timer/imx_epit: simplify CR.ENMOD handling
  hw/timer/imx_epit: cleanup CR defines
  hw/timer/imx_epit: fix compare timer update
  hw/timer/imx_epit: rework CR write handling

 hw/timer/imx_epit.c         | 372 +++++++++++++++++++-----------------
 include/hw/timer/imx_epit.h |   6 +-
 2 files changed, 200 insertions(+), 178 deletions(-)

-- 
2.34.5
