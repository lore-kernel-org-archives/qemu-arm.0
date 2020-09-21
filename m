Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3625000lfq;
        Sun, 20 Sep 2020 20:54:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKiqRCM9tb2FmzOU5I/ArM7zOGt+YF4iSIGIdO2gJ2x1Gdd5SCF+FFulnrUxQGDBfskXoC
X-Received: by 2002:a25:4f88:: with SMTP id d130mr58206277ybb.228.1600660489938;
        Sun, 20 Sep 2020 20:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600660489; cv=none;
        d=google.com; s=arc-20160816;
        b=gZDtwKHcBlLu0NRKyvIL+Uj75r93RRyR+R4czTBq8BIycl3HxVjaphAoOKnAVO2DPX
         PkN4QuC1fBNCcXrDEgSNaM3NIuO57K03SxqJUeYvhu0znWae5sVNlgGF3Z22LjrWckCJ
         ZGBSuuGRUWl3My79iUcWvb1lV/uXN3cALl6Xv/SoLC2eqkXnQJk4q43uFM10FBri0VjQ
         2Ad46FAIGvCEo5JXwfbUnhIHuKNtMmtV+sXNKn0BWOXLlUKCM37hgZaE8+jXPGTh905E
         hT9gIzMtf4VOSczjefDGTtoHDtPBEg3EFE4DJBRi51ogVvlR2ICRAPRQIyBW6F+5x1P3
         ur0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=eMGxJsP/XV9ZaclU9UPc3RpZWVI8bwkuQY3IaryKxOg=;
        b=lkBWvI1QxX71IS5QnbIvt1Z2qRtAYPa8II034fHGMhLkDjLLhpTUtudBGpjzYvOn+5
         280w5ijkFUZIigWMcrzujF48p19Vx0/Nh+CejuFA7YJSYioRS7UyJlfw9SvI5m5jUeyW
         dSm43zDP9XGpn6AN8/Jw54+mkv44IKeokk2IYQ4oJWMzn+RCq83yihqSxcsGE9sRx7J+
         5uaM28kKpJ6WNnEfLj7dgDH/7ASxDQNnsfum/nsaIRs0lBxF+eXYsyf0Coxt9vmtlQHc
         yUGV3O1FdbNC1V9QtF7IXiVWl/CwmGHK8L+A95hAxFSwnRz05yidSMfS29kC+Tp62Efm
         9oyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WsE9sT9j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b91si11684539ybi.233.2020.09.20.20.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 20:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WsE9sT9j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKCuf-0005lg-Bv
	for alex.bennee@linaro.org; Sun, 20 Sep 2020 23:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKCsx-0004Kb-RJ; Sun, 20 Sep 2020 23:53:03 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kKCsv-0002z1-UJ; Sun, 20 Sep 2020 23:53:03 -0400
Received: by mail-wr1-x444.google.com with SMTP id k15so11153731wrn.10;
 Sun, 20 Sep 2020 20:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eMGxJsP/XV9ZaclU9UPc3RpZWVI8bwkuQY3IaryKxOg=;
 b=WsE9sT9jXWXrmtRZi9y2glEVJzIZYpOORuh2yRP51CQFdsBxjzppWiQAxPG4D3DaKe
 eyhkW+JRTyVy5mPumgaHwZmeEg0CgG6t8if+/OZtpW9TpLL00w/VAC4QN/r9Kb0f5H3/
 66WQUgGS9Fp+j+lei7oRAEMWIfwM/ZTyQqJPEZGM7KYCtBeSu33cjJywkaMELUwTdIMY
 V/QyHH17P1zV80vfpEu9JtZS6IxrOq5qvWUGqmetP54tUwjYkRnCxfGY8YKNspWxbk+A
 vwHsy8pKcV0dcwir7dIy0C0Gpug5Rot5DIjAijel6B4flPYPJY+Gz5bD7gkZpJOpSlBq
 9yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eMGxJsP/XV9ZaclU9UPc3RpZWVI8bwkuQY3IaryKxOg=;
 b=RvcO+QfLbi/rwFH82AGLkjKqESvEHd7GkYVO+iyn8SFQ2xlI4bpr5ie8Y++iVKOFf2
 kyKwgSkvCnPJ27yJuEJ8+bSfbUcRDZlSSncZhGg25xYhdwULxH4hy0bSVEtsF0CU12jY
 sRQx6BvvWwf4ZAVgxbP04h9STK/v+MqA9S/xlg7btrvTAQykttMKuZ649aBgu7qV4j8e
 8Wn+889y7U+AtFceG/oqufz3V5ul8zgUC70GnVKn5g1/L0JrKr8jNxTVzi5fozLFbrdG
 oGLIm9kgiemv2s24jmVm0h9CmUL3d6+bje86tYvLz5P1yBnlyOaoAN2YGmYbPQ2whXrb
 yV6g==
X-Gm-Message-State: AOAM533qDVVtGiW4rlJFH06hz3EirIEahapqcLqzNZy8JInzJQvU+XER
 +ZySuuo3fE5+FRqKNN6aQgeQblUdNG4=
X-Received: by 2002:a5d:680b:: with SMTP id w11mr53323417wru.73.1600660379770; 
 Sun, 20 Sep 2020 20:52:59 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id a17sm19633754wra.24.2020.09.20.20.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 20:52:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/arm/raspi: Fix SYS_timer to unbrick Linux kernels
 v3.7+
Date: Mon, 21 Sep 2020 05:52:52 +0200
Message-Id: <20200921035257.434532-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZkLhzI5Qjkfs

In this series we implement the COMPARE registers of the
SYS_timer, since they are used by Linux.

This fixes the hang reported by Niek here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg682090.html

Since v1:
- Extracted unrelated patches to previous series
  (which happened to be mis-rebased)

Based-on: <20200921034729.432931-1-f4bug@amsat.org>
Supersedes: <20200920175825.417680-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (5):
  hw/intc/bcm2835_ic: Trace GPU/CPU IRQ handlers
  hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT definition
  hw/timer/bcm2835: Rename variable holding CTRL_STATUS register
  hw/timer/bcm2835: Support the timer COMPARE registers
  hw/arm/bcm2835_peripherals: Correctly wire the SYS_timer IRQs

 include/hw/timer/bcm2835_systmr.h | 17 ++++++++---
 hw/arm/bcm2835_peripherals.c      | 13 ++++++--
 hw/intc/bcm2835_ic.c              |  4 ++-
 hw/timer/bcm2835_systmr.c         | 50 ++++++++++++++++++-------------
 hw/intc/trace-events              |  4 +++
 hw/timer/trace-events             |  4 ++-
 6 files changed, 64 insertions(+), 28 deletions(-)

-- 
2.26.2

