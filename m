Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp421888ejf;
        Mon, 15 Jan 2024 10:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE09gwLSwbSAFlgHzFTiHM2liX4T540nFdPnHHGG4gbk0SKdUa896OSzA13w/JtHEy0pNnJ
X-Received: by 2002:ae9:e316:0:b0:783:2d02:7692 with SMTP id v22-20020ae9e316000000b007832d027692mr5843653qkf.103.1705343352688;
        Mon, 15 Jan 2024 10:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705343352; cv=none;
        d=google.com; s=arc-20160816;
        b=pPcxRksUp10ehVwZKcJH/J+Ao/TW2zsWm65K/ZMU5vmGOaxqIcBh5OfKuXvct0CTrH
         QR1j3s2DOeHdXGKjnVYuz1Ax0FW4rSbVPrjJZuyOmMBhiqHK2nQNWUDe2YYsb4lXAwvR
         rQEc4YjjlJY4P2LsvahhHP7pU82/vDHXMe5cS2ZdZtAB9YVRUmkKHyeSIXffAQ/IJAdQ
         4HjRyrIDcoDsE6RKcMM3wz5Zut517fqeX4w6a4K8LKiXfbpbgSDQRtmrDy6433zK+n9r
         zJ8md2L3SVdodc9EWpUIPGcUU4p2MGj74ii56V4e4+N1iYgsJNIz/XJv3NAgjbP2Quye
         3/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=rlspaFi+NeGcIROaNLyHbGyy0VCFeJHW9E4/5Rm5W+U=;
        fh=iZ5aizxLdCGVu5REqOBn2Q9N1PphBwZZ8KuDLD3B8yA=;
        b=KdEmMgTu1BSegitkv+smfa54Mz5zwq/TJvFnOln/Lx9u/u9wUIFAdslpMoQX2LcVka
         M7+c7rOBzOr1vHmVTkLSxmWunEnmgjuxGIV7HDnIMmv/H+P3CcZtRorv/FvrIW/tz361
         2AvhFLkr6UcH8JAtJSh9D2V3TbRB7nxWps0cuOtQEQEXZMweDlzOkIomL759TU1Rssyx
         Iq1UH0LlRbAnqUQCZh3t6VGktM6COswL1zMBzD0VJiosSYjIxhwL+zN9r2n2FOiZa/H4
         zcWifF9L7be3k3hf1ap4KV1ZI/boOG0kspAcNqbR0+hVb7Tx2700vQv6xRCWOl+tVABH
         kl5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=ErZnQX5b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020ae9e00b000000b007831806c3a7si8376131qkk.758.2024.01.15.10.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 10:29:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=ErZnQX5b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rPRh0-0007Kr-St; Mon, 15 Jan 2024 13:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1rPRgp-0007KL-UT; Mon, 15 Jan 2024 13:28:05 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1rPRgn-0007U8-Vk; Mon, 15 Jan 2024 13:28:03 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-28e703fd835so47674a91.1; 
 Mon, 15 Jan 2024 10:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705343280; x=1705948080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=rlspaFi+NeGcIROaNLyHbGyy0VCFeJHW9E4/5Rm5W+U=;
 b=ErZnQX5bc1OA6xVtziEqM76epaS6OEc/iid8wfi+qbGG/S5+PYOARMzOPB54PfV82Y
 yxL6J7+hElimlJdciDpPi8K2C8yXQz3qJpjWp5SByXVSDb0A+JhVLQjj1ddOQmm1tSvW
 GZFA9+mfja6LdQ877Ul7FCVDjPgLsmTC7zq7d+nzwAC6GPEsSG1sBS7PoAg1WKjtXHOR
 ZTpNU55I6GwNJRG9Al6pPdwlSO7qKeSObXgs+jyijPP816GuqpN4Bp3uddITUNpjn9Zx
 9M9AKb2y/NPbE9qX1LzAn94RCRTB7G7KZ/gz7Mxll6m5kqN9YtjZVHnX5VMyR8kvisF7
 6MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705343280; x=1705948080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlspaFi+NeGcIROaNLyHbGyy0VCFeJHW9E4/5Rm5W+U=;
 b=JiqnpTTfbxIxN1x6iGcGj9qrF8YJAl0fgdoTgMYHJsgwMaVFqFMyCbpsbdsTD+q+1A
 17BKm18B5vF6gUewOvoiSzD9RqQ04MD22KOK10emdF2Jg0/WjQRGy1c1i/Wh8fBB4Mkn
 6NVDG3yW4ZPdxn5lUadGHmt8ZfI4mpn9k3p2s+XgeGFaXfC0d5dspzDYUJrJsR8wzkJI
 u86BKQptYpQWonIFQaSGBorhDrf6eGpyPrOf02ijBLbs/HDTBy37oYYiOM92gxFyz7D5
 tXl9EuWdeng+gjBc1apnorNjx8M8QN6yDqL2yQd7eqpYrtxSXGLPMLjGVAPwpVYwUtmy
 DtPg==
X-Gm-Message-State: AOJu0YzP//Ipm7aQxb9jZNKmVRteFQeqtJwhVv37azYmGDC1Y4yZqfV+
 ajpK/kWpQycxgKf7ffed7D0=
X-Received: by 2002:a17:90b:1894:b0:28c:825e:2cf4 with SMTP id
 mn20-20020a17090b189400b0028c825e2cf4mr4153060pjb.41.1705343280037; 
 Mon, 15 Jan 2024 10:28:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 sb15-20020a17090b50cf00b0028adcc0f2c4sm10162200pjb.18.2024.01.15.10.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 10:27:59 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 0/3] hw/arm: Add support for USB, SATA,
 and watchdog to Allwinner R40
Date: Mon, 15 Jan 2024 10:27:54 -0800
Message-Id: <20240115182757.1095012-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=groeck7@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: hpjETD0lEKYi

Add support for

- USB 2.0 EHCI/OHCI
- SATA/AHCI
- Watchdog

to Allwinner R40. The hardware is quite similar to Allwinner A10 and H3,
so the code is derived from the implementations for those SOCs.

Tested with bpim2u emulation by instantiating EHCI and OHCI keyboards,
by booting from USB, by booting from ATA/SATA drive, and by manually
testing watchdog operation.

v2:
- The USB Controllers are part of the chipset, so instantiate them
  unconditionally
- Add Reviewed-by: tag to patch 2/3

----------------------------------------------------------------
Guenter Roeck (3):
      hw/arm: Add EHCI/OHCI controllers to Allwinner R40 and Bananapi board
      hw/arm: Add AHCI/SATA controller to Allwinner R40 and Bananapi board
      hw/arm: Add watchdog timer to Allwinner H40 and Bananapi board

 docs/system/arm/bananapi_m2u.rst |  5 +--
 hw/arm/Kconfig                   |  4 +++
 hw/arm/allwinner-r40.c           | 67 ++++++++++++++++++++++++++++++++++++++--
 include/hw/arm/allwinner-r40.h   | 15 +++++++++
 4 files changed, 86 insertions(+), 5 deletions(-)
