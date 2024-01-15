Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp366050ejf;
        Mon, 15 Jan 2024 08:57:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVvE1EX76ui2dphInDJuDT1GJcMsTKJMQs2jvZ90ra5BrklbgUSyJ+uHT7W6feIx/oucTa
X-Received: by 2002:ac8:7c52:0:b0:429:98a4:dedb with SMTP id o18-20020ac87c52000000b0042998a4dedbmr8561496qtv.97.1705337838600;
        Mon, 15 Jan 2024 08:57:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705337838; cv=none;
        d=google.com; s=arc-20160816;
        b=kH/gLQzUYl93ninT3xiw04uYWa/I9acMwo2bZBRxjSsNt9ZP5jxONpnaA8lG8IrdbY
         MF2nzXtQMJbnL/URemBm8ERFnzY5lUpa5PFv4Nlp7XTCr/xqJJazk20zCt2kjYzPVxR/
         9Z8xU0kTzrlnB1GRxRVTT+Hk6VDp4g9CpRPYjzFiadbDvTNsXAMDYhLQchZizFFIjwon
         RpS6pwJjJAWhBnpEkFGIZnWkEn+0VBckwMpcJbDtvgKpssrZUv2DxRuAwagJfapsFff1
         F7qMwvauQLpUJcotzuU6C89I65HM2xIUkS3nMWH8vjiA5HI2WFemQpbfgY/BC35AyB2Z
         XWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=G5MCkR7FWMOFNxlqR+QuPvNAiySpq5CrE/hsZe8v380=;
        fh=YgJ9cQ4aL7HaYd+8R0MIBXgkJmL8Yh6LbzLNatL7VKg=;
        b=PjVuL/wExf9xtXWrcQybvxygyXWUV7SkiCHqXkn+h5NTSy6cmJwhwibXi8MXDuxJat
         nSSsHgYQth73LStsdiPVxAX7t/MoWVQZytda2Cjip/Fcmzs7d67NuPSozdJDumBNa7jl
         D6k7gqKUhy6WbPudAEGn57iOB85aavw6Q8A3LeWTndzSTy6fC+I/SW0xSLkoCERpIvUv
         qwnI+AW5MjR+Rf158M2LWARW1m73nNrNwTeMI9WY4joFdwrMkEfMM/ooMBP6jFLMlUmZ
         AK25/A6k8s9YQMBhoW7nzzE0lNMxJ7aQjE4+LbvM1O0BZ5sHlVd6bpkqnf5Etnx457dW
         /tiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJIBwC3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac8584d000000b00429f93d989asi1057936qth.765.2024.01.15.08.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 08:57:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJIBwC3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPQGA-0006FK-Cx; Mon, 15 Jan 2024 11:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPQG8-0006Ez-Ba
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 11:56:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPQG4-0001Wb-Hb
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 11:56:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e67e90d5aso29998915e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 08:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705337778; x=1705942578; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G5MCkR7FWMOFNxlqR+QuPvNAiySpq5CrE/hsZe8v380=;
 b=OJIBwC3YI/RWkiXAZVjNomnLRHf9y9gG0FOkCjdQkRXvgJkTis0rP4vIfpkqvvUezE
 WOwP/qqJ6C3TGwOJmARwAeVCGKpCv5w4l2r2wUvdXlxrTh5rGIWhw7CQliZ31+OhV5SP
 tqvdg48vr2HsGMNdP1zg7a1cmeJ3t5LoG0k+B/d5V3lUrFNBG48QkTNLCSG0edl6MU79
 75Im8r+zlwwk1ddLC+SuyMQs64euR1tI2UGoD8vTFPz/u13nWizZbQaEXBi+yDWjUKmv
 jYCsLLbiN5L3yYT7xag+lQMARd7xgMZfict8DrHmI+x3gVN3imdGGzWt9jEALG1ByNcU
 rK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705337778; x=1705942578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G5MCkR7FWMOFNxlqR+QuPvNAiySpq5CrE/hsZe8v380=;
 b=NZdKhiqg6qFlYqSlHbAGmT9d9CU1O6Tdo+rwjVCbijpL/mBvuCj3F3MRDQe6CSq1PU
 q93oGO58kpWU3TMYo5lwSUV6aVyMTMCt7pCpnQz0siEUzS89YyhsYwExh/fPqWV6GrOm
 G3KTWAY/tuVMkiUgMbqycFgRdLFrPm9r4ceiX4nJneOv4HD4EXcwGdTHAQAtLLTdpC24
 fqlepRZCFKxuIBcdJgNF1oRejeyKrI7s/P2Hp/qEJHHsQoPsPTO/XcqiCHG7DVYvELNt
 +Wb49r/Pz9TRGAwPcT6G31XW+KVzUm3YNKeCl6Ry8mAMinGXesUi/pl109UFIBsrtatF
 h8Ng==
X-Gm-Message-State: AOJu0Yy9eyESL8jLbG2EjgFqOgFMXzrikXTycv8ZVXrWhbQm0OVyEvWk
 AahaEropIu5xdKPM+c+U6JQbsKe+vN5SxQ==
X-Received: by 2002:a05:600c:3115:b0:40c:66bf:c6a2 with SMTP id
 g21-20020a05600c311500b0040c66bfc6a2mr2601862wmo.92.1705337777845; 
 Mon, 15 Jan 2024 08:56:17 -0800 (PST)
Received: from m1x-phil.lan ([176.187.209.30])
 by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b0040e6726befcsm12689460wms.10.2024.01.15.08.56.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 15 Jan 2024 08:56:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/arm: Unconditionally map MMIO-based USB host
 controllers
Date: Mon, 15 Jan 2024 17:56:13 +0100
Message-ID: <20240115165615.78323-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rdR6vObJuYmo

When a chipset contain a USB controller, we can not simply
remove it. We could disable it, but that requires more changes
this series isn't aiming for. For more context:
https://lore.kernel.org/qemu-devel/56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@roeck-us.net/

Philippe Mathieu-Daudé (2):
  hw/arm/allwinner-a10: Unconditionally map the USB Host controllers
  hw/arm/nseries: Unconditionally map the TUSB6010 USB Host controller

 hw/arm/allwinner-a10.c | 49 +++++++++++++++++-------------------------
 hw/arm/nseries.c       |  4 +---
 2 files changed, 21 insertions(+), 32 deletions(-)

-- 
2.41.0

