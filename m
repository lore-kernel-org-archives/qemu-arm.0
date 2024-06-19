Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1371127ejb;
        Wed, 19 Jun 2024 05:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmoQL9eR/Z0913R5ZEGxBOus0BwD7hJ2O5AImygoiI8NvCbaWa+aAcOiH2SFzYvv61s1nZ4JbovJtdukb779RN3YG5NuOC
X-Google-Smtp-Source: AGHT+IHY01wQo9D80zmnts8naaBe8fjIfVsorwRWr3nQukbEvsCoPhj0smKIvcP01uhGPZIT1MHs
X-Received: by 2002:a05:620a:4089:b0:794:7a88:e387 with SMTP id af79cd13be357-79bb3e54e80mr249237585a.38.1718801400499;
        Wed, 19 Jun 2024 05:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718801400; cv=none;
        d=google.com; s=arc-20160816;
        b=Bj0W6xQs6xZpYdBIg9nkun/BR+6ScugziHUaGF6pFFRk4rwfHziGDrD1rVwHpFVoQB
         flH5ufsildIpU7SIImdxDUsQLtYjCijfxeVDIPZQqI5bBLFBSTYSYbycF+TQ9rbUj8Rl
         DL1y20b5Mso3Jrmd4mZTx/3Pg/e4G2kTZ5XxJW/oPmBHc8/ZPdG/lpxBp65gfNhuQYt0
         tZd6fkTUEV3fZ3R1u60ZJTbmDYYn5XJrOU41ZXH0i3YPU87YnPMt6htkcMnWMH6ccOZH
         TYmp/GX02RRNHZxvRYO0Gol9JhvSY/YKaEOvYtrUAvuol2MVh8cuFNbgW1ZcBY7N2TL+
         v9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GcVbfAkS8W8gQIjPCN8HOtm0HdYc+tEWdN0wNBVQ5yM=;
        fh=Bl6nFBO88SqhrSHkw9a1OdXofKMpAfQHieKpdV7Bevc=;
        b=rjN6dqPkbCHbGUQpzwksEBd3Kh4nPkg6KBIeq/aMX7LaBMrlDeD/ra/++5rKKh5yCf
         WK5UVG5aCU1XRgIUTbRrijncV0F+yOyr0lSKl3U2j4Ru9jPu9c9Ya5U7DXgVbbr8cbSx
         urloJtBwFxlc4wRMxMMFOpm3L8AMZ125r71TbVb3IqtN6QFXqc3lrysbuS7iXDca4TQ5
         gyE1Ngp48jKDUTyJaTZro6+ubgHW2i9/K15U9ERooou5h7f6j6StcSK+vyV47BjHKRxA
         XPu0hzyrF++3V5TBpCiNp4DF9YxiiF6DfWS6qB8TCIh0YjJnu5CNX8oCQhbn4dNvTTAt
         UhVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxM+0tH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798aac9f0cbsi1425956985a.8.2024.06.19.05.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 05:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxM+0tH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJukV-0005YP-Na; Wed, 19 Jun 2024 08:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJukT-0005W6-HQ
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 08:49:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJukP-0008LF-Iz
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 08:49:12 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57cd26347d3so4500487a12.1
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 05:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718801347; x=1719406147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GcVbfAkS8W8gQIjPCN8HOtm0HdYc+tEWdN0wNBVQ5yM=;
 b=ZxM+0tH0YIP9VzwgH9BUQr8jCA9EsXRa9zROCuOVUzR+N+6tZwCLP1Hrx+GMUs2zuT
 F6VM51xUuABYxUeEa1+MNHqa4PKtbj1XTm3itOvrzsTzHCTe8seIXkKCkXzvoZbJ9GUw
 ijQyJyO5bBV9I+ypwKN/sdsMm6U31ExRhEVS4PbN03NmoAzKg0gCqO2MXUUloxNEgv8p
 Gsx0hEStvHiRLe/aJ4AemimInim+RkSfu/sOOYuOa+LMB3TgcCc0i9CgDiY8QYsEdGM6
 oncADI3gQbN5YR5PdpvtjPOqM8xQtxP1rCBxixNNeK51rOv1Anu/v/GT1QNwi+QJlTV0
 rn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718801347; x=1719406147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GcVbfAkS8W8gQIjPCN8HOtm0HdYc+tEWdN0wNBVQ5yM=;
 b=JLEmX87jfxZD0NSx5Ukc4TgiTS8wgk5/MX+bZSlOBEMuYoWwOmnCqgMJ1781aWA/ZI
 uNtbMztqaE++QFSq41NeZLWwjHdH9tF4+z66kJjucRt42tN9BWqNP/8WH23akI0eYFlT
 1NND4L3aoVrsWv2NDuW93RyNySeYL6uTCgQ/TaBU+dypAuzYBM6SovTZbFD89mG9UfX0
 lyUTK1guYGviK85+d/iP771kDsCxq7xB1XkSXdAPXJO3Ra4NqB0Arr2gsw9u7tll7YYp
 LUfOepMMRhFxR61ZROJjLERDXUpIFN8k8Q57jOQHwFCo0gQ5fye5P/lXQCUiDCtInKIc
 5ubg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZZZr0UC7Uh5M0x+PxsLmk7R1s2vl3/8f8VKsoGLHTPYWoGvcGdKaXdE+1n+EE5xDzsj+UtbMSkztZYOgQTegojokd
X-Gm-Message-State: AOJu0YwuJcs0E7AQyq9Y9csU90q0C+8GNKsIXH+zuhkDbHHgkS0WXcaE
 oqzaqN+4BmXsX3Jrsrv0jYwE+rfZwyMgj5x91BkLwEYEWlZIK7DqJROHNtvYeg4=
X-Received: by 2002:a50:9982:0:b0:57a:2ccb:b3e5 with SMTP id
 4fb4d7f45d1cf-57d07ec1e50mr1289195a12.42.1718801346616; 
 Wed, 19 Jun 2024 05:49:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.133.105])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e758sm8309727a12.68.2024.06.19.05.49.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jun 2024 05:49:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] target/arm: Always build Aarch64 gdbstub helpers
Date: Wed, 19 Jun 2024 14:49:01 +0200
Message-ID: <20240619124903.56898-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: dm+7RTPoc/b8

Merge gdbstub64.c in gdbstub.c and remove uses of
target specific TARGET_AARCH64 definition.
Small step toward single ARM/Aarch64 binary.

Philippe Mathieu-Daudé (2):
  target/arm: Merge gdbstub64.c within gdbstub.c
  target/arm: Always build Aarch64 gdbstub helpers

 target/arm/cpu.h       |   8 +-
 target/arm/internals.h |   2 -
 target/arm/gdbstub.c   | 363 +++++++++++++++++++++++++++++++++++++-
 target/arm/gdbstub64.c | 383 -----------------------------------------
 target/arm/meson.build |   1 -
 5 files changed, 364 insertions(+), 393 deletions(-)
 delete mode 100644 target/arm/gdbstub64.c

-- 
2.41.0

