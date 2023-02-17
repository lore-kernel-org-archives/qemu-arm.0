Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1535211ejb;
        Fri, 17 Feb 2023 06:19:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8uCXZe606msPtGMdvssSNx0kTjF7JdHUP1cXB06cELLGHev7qp32GIQlDONkWV1VkvU7vH
X-Received: by 2002:ad4:5fc8:0:b0:56e:bdf4:d213 with SMTP id jq8-20020ad45fc8000000b0056ebdf4d213mr2301131qvb.10.1676643547682;
        Fri, 17 Feb 2023 06:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676643547; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlLcExHsQrtBpgLhDyU5Xr5tZF43KBz9csgO5mHcLuwnATwm6s3BlrLzfC7ZlGZBuu
         7UadCSCqUwS9y8e5dPLeuqlRN6OFM8fQNPIhGsbd0HvOjW6t0S+z4vnGZA8gtnxXafiI
         kXj0ebvzA+Q++woIuvR3+wtLCTu4pWNWKJD6DGRiV3106bPaC3v9m4+es7c7Ox/MuKrJ
         w1zAIRkSLwQWYwBjKYuV7IzVgseIYW1kFdn6j27nwseH3dn5UrlDnDZ003ncMLKDWhh+
         vuZn09r/yYw3iOrw0tk8J5sgBcHhauB8wvE1VIjQgNM0AtJYAjLUZkehRIzTGL+Z2rPA
         jD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GMB2dD5lCH2dHu+DW95zlHGEg0teFHAondWvf3QDOdE=;
        b=tYo2NzSdYwVCohWcR5jR/6bz9/+UIDOyT/ktWaln4EwBCirGPNNu3MnY95RfFMk6CO
         z3IvEEXCiqq2QuKRQdCzZa7s9EPhLVCv2ZoFao5G7XphquPzoY7GnSqyaFe1shvfV9jI
         cpEiyCMBqAp5uBGkdOTXqDI7KhMhQQaK6y1sPcoi7CoHAH67tGhYg6FIkBDtt9sPLHiw
         J1+yuHJUDlTIZ5SPzMKEEqdS311gIgRqyrkzZXOfko/KGsObQP4znFvV44811Y96CWw5
         Cl4zsPLOiqpi8k6VcLC8PUW6P5AVKcz7Sy2EXn1i11GBU68CGI7GPnbj/u+t2YH8GRJA
         9Hqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILF7lQmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19-20020a05620a299300b0071cb5762182si4018713qkp.261.2023.02.17.06.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 06:19:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILF7lQmU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pT1Zq-0004nz-Uj; Fri, 17 Feb 2023 09:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZP-0004YC-4Y
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 09:18:39 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZM-0005SI-Lm
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 09:18:38 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 8-20020a05600c230800b003ddca7a2bcbso1003005wmo.3
 for <qemu-arm@nongnu.org>; Fri, 17 Feb 2023 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMB2dD5lCH2dHu+DW95zlHGEg0teFHAondWvf3QDOdE=;
 b=ILF7lQmUy7pIw30jIw3uXlSTwt4Rz45Px1s6ub/dnBNHOZXyP266rcPGucCib6hLI9
 IreIzc34OLTWq51hO8tsy1PrIOUBE2nci9AmRtU+ywnFcOTnPraNzDJ30aKp7CIBRqmH
 XrocoT0UjEz4o72MJwa0YjgVWOqTxhYURfvk8GB8v1TZSjTJVmwrpdIPb/hy14vtH/tE
 b+0sWXgPOt/3d1osck0Ny8V9Nr2tunA1RRHWBHhT1+CF+yf8YpM0wyDdoQuLFGMbKBUD
 WF4A9y63ZiWCltcQiT2BowIdIyGIHM//OG0OUYfkcnSQpKL5ctP/HGhuYzaJKQ8gB9lh
 APWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMB2dD5lCH2dHu+DW95zlHGEg0teFHAondWvf3QDOdE=;
 b=ltUB4GfTMnGlE0h/JE3/aczuHkzqPJ76+CGLxXGIXMyKQA0W0dXsUTItlpYpqlvTdV
 Ic3bjL0mbl7vCb1fHAebxvzm7tB+qpUYFmUEqIgHEzu+CJtatONeTiatF97O9ZAIybRT
 gbplO936UI26DJKfNBp9d3EPYj3GZF28REqcFuhiMPMUhTF1oemBj2CQHPn/zU7CW+H9
 IOmV5/8atB5urixZadoUUtZuPQcGZ9z133J+VnAIgrmg14hPeoLGZqHJsnTUKaicR75F
 6HycR5lNvj8PrVblztMwFMyAoVVu69nkAUBzdA2dlTWaKozXZSrk51RGHewG4Yl/9Gic
 BJWQ==
X-Gm-Message-State: AO0yUKUbvFSjzfEhQkaHHiojaweE4cJt+QoS8q1mexEKkWey46MoJkaQ
 q1mOhEF7qKCdWMjQOabPMnKVhg==
X-Received: by 2002:a05:600c:4918:b0:3dc:42d2:aee4 with SMTP id
 f24-20020a05600c491800b003dc42d2aee4mr542863wmp.25.1676643514850; 
 Fri, 17 Feb 2023 06:18:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1ced13000000b003e1f6e18c95sm8823263wmh.21.2023.02.17.06.18.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Feb 2023 06:18:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
Date: Fri, 17 Feb 2023 15:18:30 +0100
Message-Id: <20230217141832.24777-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CbM8Kr317UNQ

Yet another "try to reduce build-time" series.

Philippe Mathieu-Daudé (2):
  qemu/typedefs: Sort in case-insensitive alphabetical order (again)
  hw/timer: Reduce 'hw/ptimer.h' inclusion

 hw/display/xlnx_dp.c                     |  1 +
 hw/net/can/xlnx-zynqmp-can.c             |  1 +
 hw/net/fsl_etsec/etsec.h                 |  3 +--
 hw/timer/allwinner-a10-pit.c             |  1 +
 hw/timer/arm_mptimer.c                   |  4 ++--
 hw/timer/armv7m_systick.c                |  1 +
 hw/timer/cmsdk-apb-dualtimer.c           |  1 +
 hw/timer/cmsdk-apb-timer.c               |  1 +
 hw/timer/grlib_gptimer.c                 |  2 +-
 hw/timer/imx_epit.c                      |  1 +
 hw/timer/imx_gpt.c                       |  1 +
 hw/timer/mss-timer.c                     |  1 +
 hw/watchdog/cmsdk-apb-watchdog.c         |  1 +
 hw/watchdog/wdt_imx2.c                   |  1 +
 include/hw/display/xlnx_dp.h             |  1 -
 include/hw/dma/xlnx_csu_dma.h            |  1 -
 include/hw/net/xlnx-zynqmp-can.h         |  1 -
 include/hw/ptimer.h                      |  1 -
 include/hw/timer/allwinner-a10-pit.h     |  1 -
 include/hw/timer/arm_mptimer.h           |  2 +-
 include/hw/timer/armv7m_systick.h        |  1 -
 include/hw/timer/cmsdk-apb-dualtimer.h   |  3 +--
 include/hw/timer/cmsdk-apb-timer.h       |  3 +--
 include/hw/timer/digic-timer.h           |  1 -
 include/hw/timer/imx_epit.h              |  1 -
 include/hw/timer/imx_gpt.h               |  1 -
 include/hw/timer/mss-timer.h             |  1 -
 include/hw/watchdog/cmsdk-apb-watchdog.h |  3 +--
 include/hw/watchdog/wdt_imx2.h           |  5 ++---
 include/qemu/typedefs.h                  | 11 ++++++-----
 30 files changed, 27 insertions(+), 30 deletions(-)

-- 
2.38.1

