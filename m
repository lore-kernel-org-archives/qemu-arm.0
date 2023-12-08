Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2255510ejb;
        Fri, 8 Dec 2023 03:36:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe2E9oq0LF+g8Rh0NMVmakStqAqvTbsvgmQvBOb812uLqKVM5+kJ6gHVNilqNrhoWm697Y
X-Received: by 2002:ac8:5cc5:0:b0:423:a6cd:66ad with SMTP id s5-20020ac85cc5000000b00423a6cd66admr5035851qta.30.1702035377113;
        Fri, 08 Dec 2023 03:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702035377; cv=none;
        d=google.com; s=arc-20160816;
        b=DqiuoTHqWyxy91fQVfIBhpWdqSYTjaYjbHMlCsD413eLgsoS1GIHa01NkxkSJuqpmf
         8+MzZdIDf7EFOkobXAyqmC0prA7s50GBUoiGJnXviXgBTSS7jCB9rr89OUY1jCFSWIiC
         KHJZlnpV5F8RKUZcK7a8oiwrHmimIhCsk9FlrNDrlaVYRiQgVmfBHsBEGdZ3CuuxIyvm
         TzLl4kZpzlhbZB0z7UeG7uhL+TWTcPpc46HjkM34C+jnYh2u3LtnuCJufT7zXgSW3ukd
         OxZXMZm1/f+t2XkeTOICoUMxoDs7TwAnVEDFtg6YEQzD4QcW8Nwz7Jew/jZ/onHopeNk
         wQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0bGgQr6byLDy4jY9fxc2ABAiH5gCgejb87jGCILL1Kk=;
        fh=QdevGGL2LydCvB/btUcdJnXEA7h6h6ICE8REXL8PVZU=;
        b=ffA0NK+M7teQeIetdFogV+kZEy1sbCX9aGtWa4Nn9CdIJeqSBWZb6RWWId9vxNYsAr
         cGbb/UXoZqitHxghjG+C/nElajXOB1m/xr774SaKmS5mPXJivhZuVw3pv2opZRvHcY4X
         4tFdxKeGSwvErbT6G7SGgOCWK4fayQ6sor6cewe0WHKlfRK8g1ArMWDn5Fb/HitPoBBB
         mWe6aTmk9ZrciNzqRDm0Jj8RTXymFgTfrOid2Zp9JkUchm6/0CyNq7l1YyM4NhlhJv2D
         OF7vzS/MaEnjD/Vg++Luy6pqY0xKe9RxbXAsgwqQ+2au8zM85joHFfPpkehg1s3eQwI0
         /Org==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ugonQN7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4-20020ac84544000000b0042402e7ac65si1783685qtn.132.2023.12.08.03.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:36:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ugonQN7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBZ98-0003xn-VX; Fri, 08 Dec 2023 06:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ93-0003tW-6s
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:35:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ8n-0003NF-O8
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:35:48 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33339d843b9so2087957f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035332; x=1702640132; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0bGgQr6byLDy4jY9fxc2ABAiH5gCgejb87jGCILL1Kk=;
 b=ugonQN7TvEdtddE34ujJPoiukY1xjft7seRajcC9W4ccT8ljOqcKDvGV1hIEup+iWV
 jQnAcHPVYmAHtzkP8A7gtKCbkOU+Mo12v3yLKNr3FlEq0/tTBssKIVKpvtN1f/RU6Nao
 J6l3dEkHaHo9mqEs09FkDe+ENRtIwmyxoRh/D5PKXrGI1yaa0BivlurGPEkzpXZXo3nl
 xca5L/WKrdPsbivYH9OmqjWfFz275eHnQXW5zY230hJ9jNT/sAymh3XlVdYfykvivZqF
 1D5/KBQk5y2Obq3LLwsK8kgSDuMRS6kCDkaBuCDofe8Y/+n+g3TRog3ehrkG7GsO8kVh
 IZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035332; x=1702640132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0bGgQr6byLDy4jY9fxc2ABAiH5gCgejb87jGCILL1Kk=;
 b=TFVCO9NMVhGNSfa7YYa9X0hVgbfitD5secGfqZ40J4WDkD3oDY/VPdwPU4u2g2fN9K
 TJEfuEBQYbLueh/JBedVMnVpEp3Oy9D49naympMsfJA5j9FNxI7RKi8itpBDocQBQ8Ee
 Zn7N1vjJgCAQWTYc3SPzJrvkpgslOWLuOPKMn8RmItnli0Iu+mqtADebfeqFJjjeFYxC
 exfWi3VNWT1fJIB3E1K64GkSQ0JKKTw6PYPJBzUXvE7GQdps6MeqjUvVw50xEj0n7zMA
 jiJA9vv5CFRh3KmSVyX6J4oYQEUlMDkBqkPyOurKF81sHknOzjsL7Y7LdNO23mlTyoV5
 lY3A==
X-Gm-Message-State: AOJu0Yw29s6XtHNEHP8Ah8yWt0tvorUb5CCo4lTPYlCa05pQ3pRcpXy4
 QFQCNVN0sLSG3RehQMWF/f+ldA==
X-Received: by 2002:a5d:448a:0:b0:31a:ed75:75df with SMTP id
 j10-20020a5d448a000000b0031aed7575dfmr2319997wrq.15.1702035331963; 
 Fri, 08 Dec 2023 03:35:31 -0800 (PST)
Received: from m1x-phil.lan ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d4644000000b003333bd63792sm1821183wrs.117.2023.12.08.03.35.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Dec 2023 03:35:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/6] sysemu/replay: Restrict icount to TCG system emulation
Date: Fri,  8 Dec 2023 12:35:22 +0100
Message-ID: <20231208113529.74067-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8vNffGHojZwT

Slightly simplify non-TCG and user emulation code.

This series still adds assertions in ARM INST_RETIRED
PMU events, in order to bypass a linking failure. Better
would be to restrict ARM PMU events to TCG. Left for
another series.

Since v2:
- Have icount_configure() return bool
- Addressed rth's review comments

Since v1:
- Introduce enum of icount modes
- Fix ARM INST_RETIRED event

Philippe Mathieu-Daudé (6):
  sysemu/cpu-timers: Have icount_configure() return a boolean
  system/vl: Evaluate icount after accelerator options are parsed
  sysemu/cpu-timers: Introduce ICountMode enumerator
  target/arm: Ensure icount is enabled when emulating INST_RETIRED
  util/async: Only call icount_notify_exit() if icount is enabled
  sysemu/replay: Restrict icount to system emulation

 include/sysemu/cpu-timers.h | 32 ++++++++++++++++++++++----------
 include/sysemu/replay.h     | 11 ++++++++---
 accel/tcg/icount-common.c   | 36 +++++++++++++++++++-----------------
 stubs/icount.c              | 29 ++---------------------------
 system/cpu-timers.c         |  2 +-
 system/vl.c                 | 19 ++++++++++---------
 target/arm/helper.c         |  5 ++++-
 util/async.c                | 16 +++++++++-------
 8 files changed, 75 insertions(+), 75 deletions(-)

-- 
2.41.0

