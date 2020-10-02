Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1714687lfq;
        Fri, 2 Oct 2020 09:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyu60j7kmHL0RPt1IuEm2hjowmAbD9R8Qw1RXgVW5M3l7ALwnNNBbfq5pFOzf8RUi0GIDa
X-Received: by 2002:a25:8047:: with SMTP id a7mr4266676ybn.11.1601656954673;
        Fri, 02 Oct 2020 09:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601656954; cv=none;
        d=google.com; s=arc-20160816;
        b=t6RAWUO+rAtCyofgqRsgW9sdp7DPov7BDV/+Xa7qO1Wj590u4/BULAk6G/XUfimCHZ
         ZI07ddABD/HxTqq4ZggG7PyRAi8uQoU942v+67FugKYIMhAqpT0bLagI5FRJd9JXZSK0
         ord92m2yD/ZAbueaRIhrqYWpOqiww6sV9aZpcnoGatOFm1wkVkjyQETr2t2xoWqvB3oj
         909jWZxlxoflpA5l2BOuuCTFDP+KJtXtIisWJTuslxCKDp6LEcEVh8cUWGYsUIkX6Bc1
         3mKfewfNZc+Yx9TBZcja7/QNvzI3BIji8/4NZeuy+pABnoZu0/EQVI1QodO7T2y/dsQZ
         FLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=em2nDQodvZ5go6Gon5+MVnza6F8SqPaC6fferMnTT10=;
        b=oNq9cgU9O2tJjIK9XBlG9Qjl2/DTj92J3qPXso7KIIDxqGqqEPECfQBfhCGr/UTo8Z
         moC4NojwEm2BBCbBQX45Pk9viUSVYEtqzsONJ13miIypdXSK+Cwcy/65yt62Bq7FIjkW
         PKEM/sZ5Z1EzE7mv7Wi8pan1dU066bESzC9g15Fb+bXTpZsIbkBW5z01wSknLPtMFbim
         nSqNc6MLCDlKHyDIp6myflqzekvk6Nl0RJPQiuhD0VZeyBEfUaF7bi6l/b9hHpwDuKdK
         UP9FnFuSEnEOvxdVhrzVnP+8HcREsZfhXjpbGzSBuGcuMTJGEYFmOtx4lS2ck0MefLtL
         BCeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DpYLEzvh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si2689989ybp.482.2020.10.02.09.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DpYLEzvh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOO8f-0004A3-W7
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 12:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOO8U-00049p-S6; Fri, 02 Oct 2020 12:42:22 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOO8T-0005ce-Ay; Fri, 02 Oct 2020 12:42:22 -0400
Received: by mail-wr1-x444.google.com with SMTP id k10so2511859wru.6;
 Fri, 02 Oct 2020 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=em2nDQodvZ5go6Gon5+MVnza6F8SqPaC6fferMnTT10=;
 b=DpYLEzvh365GPPLrinnZ3HjOPpoPjq+5CnTfa/16nmvLVpYVb9IEEjrKNluGCP8pvx
 vo18joDSHtatnnMhcIkNmpNJSX+Llo7793hV8fd++H4WJJZsonH/Sfy5aOAFykYrF23U
 QvhVFvikW8lU63jnaZ0qcKdqajFM8kMlIOSPVF4MjE8t1RuFXxxGon7QsPQilzh4Xf2g
 9W8zaDOUUfNGutDr7Yb9+Jpu70CZYfYRUCaskHZ58+G5RKZ2QfrtJIATgJQE1SEA9AWu
 bKg1UJgVFCTW7fnejUQth9y2fst+EuAKVPZp7JPB/o59fyGg7vbhDAtJ0X/O5qlFnpUu
 NkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=em2nDQodvZ5go6Gon5+MVnza6F8SqPaC6fferMnTT10=;
 b=ggoZ1yutusL/KKDsJY3r7U1U5e65q9c/+3aaA9Po7jshLO2o1XGRpKx2VwhXAedBYx
 USvd5Mvm3gb9OdQmmxB0ASYSLAQEXHtnd6E0Bt8zrCjh4UupoM/LSO0x5lYfFNm/FgOh
 H/wQmhEPSmAv+A9VN2Zf7DnTFIgXfTasd+kFdgQ6G2NIZpa/l0jR7fA9L+RNkP9eVzc4
 xJWSNzdwmp2lbB6Dn38ieb+d0rzXXVwoIG4ifGrvjmwSYU9eNwXWoELl9dxNKUK2LKxr
 NL81fV64+V2GCHlBd61Xq96InKwxqZUVCiVvsLgSpKSqDzp3+oy+7/Ss8YHTrxETWmZp
 SIjg==
X-Gm-Message-State: AOAM531jV+VAs0X2oxMSEFFf0nCaw9gYbFKM4WtsNlkntrZdMoFFFkpq
 2ayDRZqd9waPdR5Em2LRNYAc8N+eGqs=
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr4009160wrt.366.1601656938855; 
 Fri, 02 Oct 2020 09:42:18 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id t17sm2378673wrx.82.2020.10.02.09.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 09:42:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] hw/arm/raspi: Fix SYS_timer to unbrick Linux kernels
 v3.7+
Date: Fri,  2 Oct 2020 18:42:12 +0200
Message-Id: <20201002164216.1741110-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DS9izRuqBYLC

In this series we implement the COMPARE registers of the
SYS_timer, since they are used by Linux.

This fixes the hang reported by Niek here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg682090.html

Since v2:
- Fixed issue in COMPARE register reported by Luc

Since v1:
- Extracted unrelated patches to previous series
  (which happened to be mis-rebased)

Philippe Mathieu-Daudé (4):
  hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT definition
  hw/timer/bcm2835: Rename variable holding CTRL_STATUS register
  hw/timer/bcm2835: Support the timer COMPARE registers
  hw/arm/bcm2835_peripherals: Correctly wire the SYS_timer IRQs

 include/hw/timer/bcm2835_systmr.h | 17 +++++++---
 hw/arm/bcm2835_peripherals.c      | 13 ++++++--
 hw/timer/bcm2835_systmr.c         | 54 +++++++++++++++++++------------
 hw/timer/trace-events             |  4 ++-
 4 files changed, 61 insertions(+), 27 deletions(-)

-- 
2.26.2

