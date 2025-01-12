Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1448225njn;
        Sun, 12 Jan 2025 14:57:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXOwQO5Zr8syJnfelSaVOr7M9Pn9OPJweNi4fC4iPjtv5m0iQets3wzZ0iyXBSWgFwR4y9oaF1cXvrQ4w==@linaro.org
X-Google-Smtp-Source: AGHT+IEu0H6Nrz2Ky6kPr9a15ZFluwCs0gRwc+4GWESbtNbBZKIrSXdCV+4k4ZexI14WwIJXFrky
X-Received: by 2002:a05:620a:4626:b0:7b6:eab3:cdd6 with SMTP id af79cd13be357-7bcd9762276mr3013922485a.46.1736722645868;
        Sun, 12 Jan 2025 14:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736722645; cv=none;
        d=google.com; s=arc-20240605;
        b=A+MIFLmnu7sseYfM0BrvucnICFi4i9nBkCmB5FL9cOiTMOhGfTTHfnMevFUlSbemJ/
         Jzdv/zljTdDs0pAD4mvdMd2lv/8jB0eEHfnQVWr9UQ4g1NVa2FFO0GHj+OIUVfLxhIv0
         gQYnTIj0gMd4bV15mgCwg/zwnyw/nvjRvnygBmOHKufsovBycKhti2oix6OlN5Tqnpa3
         wDh35rHj42ESmIg5nDFpfYBj+vTqBCLvMJZDunwlYQ+P3fmVv3ubq7OxV40rm/ZCfoca
         qIsumBQFc96OWcCiZQF2xH5GVxeRcwtNlViNyBfZwS2UUVs7eEnq3iIsNtEMQKX5CWTR
         jgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=IOAYRcEECAAnm/ibPu65QtP1Fqg4u5OgmCZcVVc+/O8=;
        fh=DF2NIb+N0CqV3t200NonzP1Z+7HuUkgCcwu6aInqRiw=;
        b=RZx/K92cXu69+OQ/0RWegKAHPf8/uCOmEZFgbv0mjIfzQ4OnGUhA85OEGzTsBCOmmR
         bd3HB6SgNPv+dgPjh+KnjuKyTxcJU7b0DppOjxnSSaYPKwwU2Zd8hzerolKkd2lb9qIB
         Aai0PVjG9AUs/6RXrCwihMTf+s0wMKLQ198QjzcNYYqXHrpYw820jAXzG2ylAnKtlDQ0
         bmqvuEvBSuoBDr2F7iWxL7zOpNH14NcL3Yx6pOjzGv9lTToBNRxa43313Av83E8y25Hg
         BfoofBR1EPnmePYNLCHQrrI4m0c5wZTJ+CFS1JL3OmI5zEfOzxUYsmBJ9IWLvmZp+/RX
         5AQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYyrTqSC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce34fdb89si1051411485a.413.2025.01.12.14.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 14:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYyrTqSC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tX6sX-000723-DU; Sun, 12 Jan 2025 17:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX6sV-00071Q-U2
 for qemu-devel@nongnu.org; Sun, 12 Jan 2025 17:56:19 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tX6sU-0001Yb-58
 for qemu-devel@nongnu.org; Sun, 12 Jan 2025 17:56:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so38191365e9.2
 for <qemu-devel@nongnu.org>; Sun, 12 Jan 2025 14:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736722576; x=1737327376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IOAYRcEECAAnm/ibPu65QtP1Fqg4u5OgmCZcVVc+/O8=;
 b=ZYyrTqSC3piZlIWUd9Y7/IiU46oz1PK4EWkGKuJfLVR6T8IRFl7wnSRdT6OOpVeqjj
 DR9fSrAjPeD5wdeL+tX/qAJSIAlTiMnmy0W4HKnIYo0xL9x3kcsQsutp0XvhcBTYWNWJ
 11ERdy9bsm+T62pmz3hC1zRfPAW4QdZnHxcmgEF9maBvjtpeb+XRScGi7rD0Pw/ObyeE
 pQHHcPxMV3tpd/FanpRwE8Q/vlVEHKFjp2XDn/bT4h/BvsPC47dNLDutnb4Y87451XlF
 DeZDpUl/GXsCpetWbncmvTZkaspAu/FgvyZywdqdzfjmd0R5EdE7cY5UjCG4miYB/928
 xeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736722576; x=1737327376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOAYRcEECAAnm/ibPu65QtP1Fqg4u5OgmCZcVVc+/O8=;
 b=ujnQm2hMGewpzZrIevGLJ3RKf1Y75ehw0HSseFsF8oRYpywpzDpMvz/tGaEs9sKkw/
 YAZ8Ab662X1QhfvROmxyglCivEn4D4UqZHOs4hfvUixXD6rGY5FkmCUc5XrFX9Q5H2xJ
 XPEDxYIa8Ib/lNRSoBpUoxQzf91mEFGr1Rppy2xfLP2Aez6vRK8dYO4Dv4scI9JQxuV5
 XIRUWdXeYMM3Cuu4Wc3j7o0QtHlTUuyhy+b3fJfYc5N+dhZQ+1dgnyX9Y6kDa63U20f5
 Sc+QNeWWlm0a3fp3fj5wco9v0TVAmUpneamQJzX71LcntOis3hZYNtpPWzGxGAAQ9XdT
 /qZg==
X-Gm-Message-State: AOJu0Yxc2BlAh9SSKnuR13fxQM80/roB2Dp/Nww/dWtchu/ngh5rL0S6
 tLaPRysQIM4L6gmvFzGbat8cE6EYqrBwvdM7xkpFfMqPYXtdy9291uJ5BHZCpubNsSOExqNUMMz
 gsNw=
X-Gm-Gg: ASbGncsAogPYVWxwZnAi1IvwzCEVKQaS699tZ4EOlAG34GpzjPJTaGokVk8harugpkY
 mBP+JAjUmkHJHDKapRi/qijZsEqDlGYMoycVyU5wiysR1tSL/diaI7I/RneIcj7I209a7pNmv+G
 1zn4tPR3OtLEH4LT1gR4A/5143M4kChBpkulrQ3sWoID9M75h9qEUDYhzTvKJImby/4FczulpUg
 MVh67aQ2W5/1n1wgtEopWQ0JjLEqschU0BAte2B9HVEeLpvHphRLRm/A5i4Vgnugs3dG4LpShk0
 +gxBcbwd4zHiOk3G7ykbPeLOLxb4L+E=
X-Received: by 2002:a05:600c:1c1a:b0:434:a802:e9a6 with SMTP id
 5b1f17b1804b1-436e2679a94mr177277555e9.7.1736722576040; 
 Sun, 12 Jan 2025 14:56:16 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da65a3sm160930895e9.7.2025.01.12.14.56.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 14:56:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Samuel Tardieu <sam@rfc1149.net>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/arm/v7m: Remove Cortex-M &first_cpu uses
Date: Sun, 12 Jan 2025 23:56:11 +0100
Message-ID: <20250112225614.33723-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: 8fGCz26GUSfL

After renaming a pair of fields in NRF51 & Stellaris boards,
remove the &first_cpu global uses in Cortex-M boards.

Rational is &first_cpu is going to be restricted to generic
accelerator code, then be removed. Similarly the global
'cpus_queue' containing target-agnostic CPUs is going to be
restricted to generic accelerator, thus hw/ won't have direct
access to it anymore.

Note, Cortex-A boards already have been dealt with in
https://lore.kernel.org/qemu-devel/20231212162935.42910-1-philmd@linaro.org/
"hw/cpu/arm: Remove one use of qemu_get_cpu() in A7/A15 MPCore priv"

Philippe Mathieu-Daudé (3):
  hw/arm/nrf51: Rename ARMv7MState 'cpu' -> 'armv7m'
  hw/arm/stellaris: Add 'armv7m' local variable
  hw/arm/v7m: Remove use of &first_cpu in machine_init()

 include/hw/arm/nrf51_soc.h |  2 +-
 hw/arm/b-l475e-iot01a.c    |  2 +-
 hw/arm/microbit.c          |  2 +-
 hw/arm/mps2-tz.c           |  2 +-
 hw/arm/mps2.c              |  2 +-
 hw/arm/msf2-som.c          |  2 +-
 hw/arm/musca.c             |  2 +-
 hw/arm/netduino2.c         |  2 +-
 hw/arm/netduinoplus2.c     |  2 +-
 hw/arm/nrf51_soc.c         | 18 +++++++++---------
 hw/arm/olimex-stm32-h405.c |  2 +-
 hw/arm/stellaris.c         | 23 ++++++++++++-----------
 hw/arm/stm32vldiscovery.c  |  2 +-
 13 files changed, 32 insertions(+), 31 deletions(-)

-- 
2.47.1

