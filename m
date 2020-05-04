Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp150464lfb;
        Mon, 4 May 2020 00:29:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypIiQHjenX0cUNfgqf5eFdcBo2L16TrIvMH+7nW590oxtEsEIUkI1sTa7cCNZyyh7tLoS5qw
X-Received: by 2002:ac8:164e:: with SMTP id x14mr15895938qtk.196.1588577370275;
        Mon, 04 May 2020 00:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588577370; cv=none;
        d=google.com; s=arc-20160816;
        b=b3sS8hT6HPT738vjxPcCojtYgQdxGH40KaVZxG/10aRgvcV8PJSwa1AGXmNfrpckXV
         Zli6Wil1yd5QsuK45Aq/M99kFnmmy3oCf8sRBqsCddlrPtPi++KnjBqKYlFeSEnyNaRI
         KfAlVQcCR/yjXEoQmlw74Hzaub+gGTE2m1azjbiQn3pzoBqCHw43CVCI1FiNZD8eBLJT
         R6kxhZzA/3DmCn0vO0zKMCbQeeMmAWA5z3FKmdc/r19OahACXXVf7ZlFq5wCMc2HHXKg
         DG4HFlXKfvTO4H1sa3NFVZaLkL45n1Lxo80n+koSJQ1L9Q27LeQXtnjmtdtyZ2PyNKUQ
         WhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=96iBzta4O9kSIgAh9Y5rJmFbm049HKou78PdDPCrlZs=;
        b=Z94tP14fRBLqLimkkkcogALWDLb5Hwqr44EFYWD9gU3/fnldczifRbIAuZhcho7Ojb
         R1CVHBJs28TYuRHSiYWscp4SePjObvBZIykEmG2wDcRW+kqJJaEj48feCfs7SvgRvgxa
         2HSE+sTJFSgzpycztkYSpvPIifs8qo26q7ZxTBirWaGIHCJHkjjoX9PXx2WvEIknQW1A
         m1soqnYJYdDnrqIwc3EsQIWEdWiAM4CY2oUgfbzhC+BFcfakC5F6118BCNqC3VeS88Bt
         2wcjNjEKjyJvEtNpIbPZeIsVANxhHi9xqv/ssyC+6BjzkvzsFz3fVNLm0JhP3gjYdRCN
         pDug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KK4n3KdS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o55si6123921qtf.240.2020.05.04.00.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 00:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KK4n3KdS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVVXd-0007ST-NP
	for alex.bennee@linaro.org; Mon, 04 May 2020 03:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVVWe-0005yt-K1; Mon, 04 May 2020 03:28:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVVWd-00063I-3e; Mon, 04 May 2020 03:28:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e16so14504685wra.7;
 Mon, 04 May 2020 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96iBzta4O9kSIgAh9Y5rJmFbm049HKou78PdDPCrlZs=;
 b=KK4n3KdSiRBhzMyGrF7B5DqOwpI3ssvm4mTqX+C4IxIwWAoCDdGiyptc2V0CSeQcve
 Z1Qy0ScxwxuSQ0LoIBUn7UuW2eqd7a9XrMcsO0VvPQTDJ3GEWZwfHvp4BB2hi7kgKf6J
 4282JKXZsrqFPkwKLEXtQ3n2SedjBN8w6Vh4rsdEYerZZu+4zc7w9XIUis5YC/A6ZXXY
 0WM9vzvB3a9Qyd/BrDw8xl+KdB3GXwkRt23nslI5WWtmKmZgMkbPDteyHrnWkVqxt27p
 rbjQm2yWdSocXzxVcv9KkuKMVfxpPz0CHn8gO/JoWwg/0TD20hRJogmbU6kvOdnF1HsL
 RRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=96iBzta4O9kSIgAh9Y5rJmFbm049HKou78PdDPCrlZs=;
 b=BebqYPKBjVZ1Mhq25Dnl4CJ3YbdnsapvlolmCXdFElnU/d5f3cuOlSVC+IOYchDk0g
 j6T/OLBC/wB++zrVnpU71aAPWW6HK28zSGWfYlMzXWPZWbfdRs9hg6c2t12ALvu0L79l
 SM6TTsgN3oIWYU8rFLvmViRNT9AGhQeI1YligNtJlw1vbpIebk1NJnWVQP2CbEqYAQwR
 NqqstaEdr8Tr7XNuLue/kasPE6MUlf0B3oxD6cvm9MmnqGJlE77QZ94BGp7O8OYBmWzD
 g4fcfK0hB07F3pMK4broi1w+o5OL6mkqX8OvVG3VQkqb8xAJb0/EuyBfvhUV9LUOm25y
 GiVw==
X-Gm-Message-State: AGi0PubBUytPRHDJrcCp5hZm21J5JpfhzLQ6KVpULvXeiYYRLJmPaieK
 qdQAWbkYLxkMC5owlcmZOZsdPXoo
X-Received: by 2002:a5d:6582:: with SMTP id q2mr17729016wru.343.1588577304812; 
 Mon, 04 May 2020 00:28:24 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id w83sm12590159wmb.37.2020.05.04.00.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 00:28:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/arm/nrf51: Extend tracing
Date: Mon,  4 May 2020 09:28:18 +0200
Message-Id: <20200504072822.18799-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j85H1y9MBO+v

Few patches while playing with the Zephyr Project.

- better display of unimplemented peripheral accesses,
- better display of timers use.

Philippe Mathieu-Daudé (4):
  hw/arm/nrf51: Add NRF51_PERIPHERAL_SIZE definition
  hw/arm/nrf51_soc: Mark some peripherals as unimplemented
  hw/timer/nrf51_timer: Display timer ID in trace events
  hw/timer/nrf51_timer: Add trace event of counter value update

 include/hw/arm/nrf51.h         |  7 +++++--
 include/hw/i2c/microbit_i2c.h  |  2 +-
 include/hw/timer/nrf51_timer.h |  1 +
 hw/arm/nrf51_soc.c             | 20 ++++++++++++++++++--
 hw/i2c/microbit_i2c.c          |  2 +-
 hw/timer/nrf51_timer.c         | 14 +++++++++++---
 hw/timer/trace-events          |  5 +++--
 7 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.21.3

