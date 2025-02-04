Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp407338njb;
        Tue, 4 Feb 2025 10:29:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfPVWU9SnAsw8NF87wgnyE7QMdOoWqiABK2F+350pq+ZwpnI/TuIJAluk32/EzUqlhN1hFVjFssKfVIw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsUGoDKWg0NGjvaWQCUWYkHjecdZcxz2bi+/gIZ+94Ei0vSMLGKs3uHeF6HON9YeTXjYw0
X-Received: by 2002:a05:6102:3ece:b0:4b0:2d7c:43e1 with SMTP id ada2fe7eead31-4ba47a8da5amr53659137.20.1738693770838;
        Tue, 04 Feb 2025 10:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693770; cv=none;
        d=google.com; s=arc-20240605;
        b=AVl+m0p1JMMVADHeRq70qG4bHP/rEkDtc9JMVIi5TI7KuULN7wMOG4WcHeZTxv0E3K
         gOQJBv8b1YaP2b+UFxyLIrGMbvB1yGVQU2G6/yqbrKktrd0MPy2j3aKnGqDS1/FE3M+Z
         GkP0wBK2NYDadCld2vPS/QJUnLgm9mT+nGQ6aXPkIdxcSS9ggxO+AhZOe5OAUtW/3SqV
         uzFxvss0d6mZuNUf5DyLelgvdUwsCKNfTp3TVh2qoBy5RkoNNr5iDsE0nk0fcCeoHky0
         4NFG83x1DsFwfOQ3j9brz9QCWHSaoXPvvNhyVL7La046dS6fdB8aCx9P4yPGcu4hzkAc
         Degg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ykqranp7X4nBDBQjg4lR9yhZHLNN6ITQwGAO0yzpXkM=;
        fh=a940+mRxz5q0zFWdN3BXhPniAhVJlJ4pLRnI77KJyDA=;
        b=A4P/YQIRfFb9A+do2VdTUAUaELjXJ4h+V06YMUXE/ppZFa2hSmxl+XG5T+pgW+29M4
         U4f3Qu0EguZV0az3l/u90RwtYN89UNzuc/+93bDKFikKo26hQqxMwQcgjIrl6R6lxwwO
         5EWLoipTaAQUzE+kmmm5y561vNOsuh4Mme+hRtFme1i2kZimPX2tbzgacLTBKvRI6EuE
         tZyb6kaJE4H5N48I7uzZ5ucxs58E505yKR1vhkEGxApbn0IBtVYqkUq5b7AUsVvLx7Io
         0mtOgK1UA/6JFGREkyprkdUDM7pT7Rki9dhTCAGHA3AqP/TqAK0exIk10LH6yB6wnxIX
         FTSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/ly31RN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866e4bda7b5si272712241.128.2025.02.04.10.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:29:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/ly31RN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNfg-0000K5-6U; Tue, 04 Feb 2025 13:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNfe-0000Jl-2r
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:29:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNfa-0004mc-FY
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:29:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso356725e9.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738693746; x=1739298546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ykqranp7X4nBDBQjg4lR9yhZHLNN6ITQwGAO0yzpXkM=;
 b=K/ly31RNmCq4PH2GUmW0rKwKND5khicvbw1lfL2gi5NeN6M/6CHz7hauwqZ7+a7/Ae
 hWUS6t8VTS3HtaddpC1+J8Pf3UuASyMj+KqtkZGdTk4FwR+W4wIJfX4w811mI6uh6KqK
 +6rk6AgsuHV2oCbC+9yVHDJ0QlmgDLXdfWNzP/uRvlw5fdc9hirWecCmX8rb6eM3EEEf
 81QpgYZfx2me+znEVIeI88Tc/vdGh0RkWGlYmd25BorrQu+s3SudkxGytHlUa8B4eokS
 t5qkBDNLilaeF6JK2jcL5vxOfx24EOL2VaDQVzTmsPPtrmzClBh+rrfty5fQFAknZTgu
 yLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693746; x=1739298546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ykqranp7X4nBDBQjg4lR9yhZHLNN6ITQwGAO0yzpXkM=;
 b=oYi98cEvAIs9TXlVG0xB2wVoy1hx6jWOqv/S0F0IC29eYhGY2JacWGrvWiZmv8yJeT
 9CLKle2ur+iXwgW2aBXpKHryN+YIHFnr9cZB+gc9UiPKc/SVya9IgMIhXtF8v0wylKwd
 ntcWw3Z82K7BmbU6MUoe5zlrt7SIe1N1NKF/JMQ7GbYtPpBDM1luQxbN84YU+u/dvP+7
 w4XXKPdmszwLqIa+lsN6a56HS7YZAmS6X7IT4PpeTngVbqnQ0IPSH66Os7x/kGyerB0s
 vZHkOJErR6ZIXXxz3H/PHfltLj3EvBdNi/vtF85qYKpuLX+o0rAfr+wqEXCnQ78hVKXB
 hreg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+nmG/YRr6PWmmBkSNtPHvlJ9j9ALEhmWMdg+Xyb6hv3C0JBQNuPYghAWWA7iisqEU94V/21Df3g==@nongnu.org
X-Gm-Message-State: AOJu0YyPbYAQi4fHFvp3G1UAFaRSfOQw5uFWB2sE+9Uczs2fI44kWeu1
 5fDZbiyerGGNmTFSZ/04XgG0JbrFdb5Os8hnNZ90kupt617Qb26znNV1XPGgcX8=
X-Gm-Gg: ASbGncuKGyhuCawZp8m4cy7RRtoWri/vc0EmzeLcrAh+HADMMrcunPN3LjXkR3+0ZHc
 v0D2BvMXC5DelzuAtjLMu0+JfKp56KVld7JNZwtFfFEMtxnk9rrdC5wisGDs32I0cdxi/ytXPjA
 qjrPAvOqFz8x+3bWUVndXrIRcMdZFiVTWtbdpSQqQUpZpTl76cVYR8qBd9YyBVXmyAu2yUiw80V
 Cja18+lihTd8feTYbm+VnYLtB5CnxsWTYwBqiZfcoWPDt30oqO0Lr+wVasOVhZG+DIr65v17xWF
 xCxr/o+QjppqjPOx5xxZUyYuAEvJCqRTMAq2VrobU6MaDXAOVheSUSb+wkGGbIPO+w==
X-Received: by 2002:a05:600c:1784:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-43905f99943mr34458085e9.15.1738693745465; 
 Tue, 04 Feb 2025 10:29:05 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc26d6fsm231220125e9.14.2025.02.04.10.29.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:29:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/7] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
Date: Tue,  4 Feb 2025 19:28:56 +0100
Message-ID: <20250204182903.59200-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: dwFJKh6NNEZV

Invert MachineClass 'no_sdcard' flag logic and rename it
to 'create_default_sdcard_drive' to make sense of this
default value applied to all machines.
We use the OnOffAuto tri-state to catch implicit default
values. Then we toggle the logic and remove invalid uses.
No logical change intended (except the assertion added).

Since v2:
- Fixed mis-rebase catched by Thomas

Philippe Mathieu-Daudé (7):
  hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
  hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
  hw/boards: Rename no_sdcard -> auto_create_sdcard
  hw/boards: Remove all invalid uses of auto_create_sdcard=true
  hw/arm: Remove all invalid uses of auto_create_sdcard=true
  hw/riscv: Remove all invalid uses of auto_create_sdcard=true
  hw/boards: Ensure machine setting auto_create_sdcard expose a SD Bus

 include/hw/boards.h        |  2 +-
 hw/arm/cubieboard.c        |  1 +
 hw/arm/integratorcp.c      |  1 +
 hw/arm/mcimx7d-sabre.c     |  2 ++
 hw/arm/npcm7xx_boards.c    |  5 +++++
 hw/arm/omap_sx1.c          |  2 ++
 hw/arm/orangepi.c          |  1 +
 hw/arm/realview.c          |  4 ++++
 hw/arm/stellaris.c         |  1 +
 hw/arm/vexpress.c          |  2 ++
 hw/arm/xilinx_zynq.c       |  1 -
 hw/core/null-machine.c     |  1 -
 hw/riscv/microchip_pfsoc.c |  1 +
 hw/riscv/sifive_u.c        |  1 +
 hw/s390x/s390-virtio-ccw.c |  1 -
 system/vl.c                | 16 ++++++++++++----
 16 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.47.1

