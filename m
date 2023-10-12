Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp764738ejc;
        Thu, 12 Oct 2023 05:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh0CtceXpxhmdLShVnEIlgXf3XNRfc/maOoLA1wOv451/uX/mdRoyDf+lvV0hT7lvVdIiC
X-Received: by 2002:a05:6122:201e:b0:4a4:156e:6bd9 with SMTP id l30-20020a056122201e00b004a4156e6bd9mr699705vkd.5.1697113250142;
        Thu, 12 Oct 2023 05:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113250; cv=none;
        d=google.com; s=arc-20160816;
        b=ntQ3Nz9snXwmW1lJVUGWbTsutcJOJAKxHr7rS06MH0FG6Fyp5uS7fW09ENm3wZnCEc
         UbGLOjS6kcx3bZTEjfCtzXlf8g6uUx6m505fd1XyaKuKXi8IEM1u0F7sU0yim1OOdCJB
         7RRsplVzSZeqjhqlt0naDacGvGEps4GiuRiMPMB/kVmK10D6bS9xZr1wEaPORmUM3PsR
         vNADh+hyiKBmWQg32RWD+OaSPpbU7Zk4n+sqJE/0zinhMfSo0CHQVJeb8mriYHfjc4Wr
         mzVchFt712hupUjsaK6dl0TRQdH+g1/dvNA6tFIwoQXr2erly61KLjzzJXrlkP1jjG2R
         iT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vd06sYB52yhekTeF3eyRbvf+2Ug3vpYQ4rXLu4x9Xkw=;
        fh=uMYo3jOuXUsDthaXCE4/M6n3+voY5rtHQA7Grzg1cYU=;
        b=XQmj/WfDUOsNjn8Ask7IyA4vK271RTRcSZxomA8/ObB+9by48xRWQrKQFAv6cnbuB2
         0fFNuZfdGAMZchlwmQjtFH/2yDi0d0Naojgi3hN2FclNxZ9ZEYh4pyjZig0rXmY/xIi+
         AuErxPb1y4/9HTWXVWVjJeBHNGAt41yLiEmT46leD3bSj6oujKNbonntBhHOYcCvahOX
         5MN1JPiyHdgSPKHkIZzejPkUN1EQFJmO7jnnSOsgZONiymkGcwFm1lUABtLtEnKr4EaL
         hGMAkPhuAPGqpGEEwwJATk9tsfMW8c55dxNb55UG/ELsNLwvliIINDfZKbdf2JyNozWM
         WewA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/OkS7nC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020ac85d42000000b0041812c64682si10788708qtx.112.2023.10.12.05.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 05:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/OkS7nC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qquem-0002ic-7p; Thu, 12 Oct 2023 08:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qquek-0002hy-G3
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:10 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqueg-0001jL-6w
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 08:19:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9a9f139cd94so142495066b.2
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697113140; x=1697717940; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vd06sYB52yhekTeF3eyRbvf+2Ug3vpYQ4rXLu4x9Xkw=;
 b=a/OkS7nCbB0mIRw5tH9xnptcBtYKf1Z1jvByfiFdsj7wZWBlWp/ZppW78BTA2TeYIg
 AH3+VU5Cn7pOZ6w530FAVNtuYkxO/K/VoAm+SmY6g2gdlOeiky/jBrGODqheVY+pDHCJ
 bC8gvJedbUmZZyHRKutaHXKykJ8uRYEOHPAa4mB4NRWZEeAmJXoDS+Gdu1zfolwd4oSM
 W1+f7ZH46kCAVJt6De50shkGAqhNX+vuTJl6VnAe/61fUEUae6CisldHNS+ZOq9Buhxn
 kiMVyt0HL+aEZbIyRax/PJwZuAFQk8yLchFe/URvNYwrVO9wB5gxLqzXRql4QwlP5cjT
 ZurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697113140; x=1697717940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vd06sYB52yhekTeF3eyRbvf+2Ug3vpYQ4rXLu4x9Xkw=;
 b=WWkZJ+cPzBshfLmACRm5jvIcm3pcX7VSeYxvDXFMVaJHi/RV0fH0lC+BVBPjfb7N2L
 8cePdeAB0FvBea9FlDn3RlPXzESjVgfVfE9MNq8PKin5AmQjDsOSZi+T+pzh7RkuPdMc
 X3ferDBmuUjw2SORLMCL4QfXrRk0QlaXSlevxwr+6HhAJOuh0/1xBWbdefa0q30+D0k2
 8IMljBmz2PnDz4R2BVVwVVnzliJTG2fYiDdRcE9Yyl8Oq5oKaGtkDkpweH9tQwbXWEWz
 ccGMBNLUnRNppAGkGIWKHz4Fo8wSIxuzWUkMxFhLMKlq0eFalXii+6dIojT61Iwvvh2O
 njng==
X-Gm-Message-State: AOJu0YxEVJs636++phXADrEX/UdXbJ1vC1Qwji0Sd8cKTzgnfI2wQCgz
 61i/yd4wKirRa6N7BlgxF5wbvaGx4e/widhFVuYsCA==
X-Received: by 2002:a17:907:6c14:b0:9b6:f0e2:3c00 with SMTP id
 rl20-20020a1709076c1400b009b6f0e23c00mr19423868ejc.71.1697113140094; 
 Thu, 12 Oct 2023 05:19:00 -0700 (PDT)
Received: from m1x-phil.lan (176-131-211-232.abo.bbox.fr. [176.131.211.232])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170906b08600b009a19701e7b5sm11036107ejy.96.2023.10.12.05.18.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Oct 2023 05:18:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/8] hw/pci-host/designware: QOM shuffling (Host bridge <->
 Root function)
Date: Thu, 12 Oct 2023 14:18:48 +0200
Message-ID: <20231012121857.31873-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: zVPnQpdk5M0Y

Hi,

While trying this PCI host bridge in a hegerogeneous setup
I noticed few discrepancies due to the fact that host bridge
pieces were managed by the root function.

This series move these pieces (ViewPort and MSI regs) to the
host bridge side where they belong. Unfortunately this is
a migration breakage.

I recommend reviewing using 'git-diff --color-moved=dimmed-zebra'.

Regards,

Phil.

Philippe Mathieu-Daudé (8):
  hw/pci-host/designware: Declare CPU QOM types using DEFINE_TYPES()
    macro
  hw/pci-host/designware: Initialize root function in host bridge
    realize
  hw/pci-host/designware: Add 'host_mem' variable for clarity
  hw/pci-host/designware: Hoist host controller in root function #0
  hw/pci-host/designware: Keep host reference in DesignwarePCIEViewport
  hw/pci-host/designware: Move viewports from root func to host bridge
  hw/pci-host/designware: Move MSI registers from root func to host
    bridge
  hw/pci-host/designware: Create ViewPorts during host bridge
    realization

 include/hw/pci-host/designware.h |  20 +-
 hw/pci-host/designware.c         | 376 +++++++++++++++----------------
 2 files changed, 187 insertions(+), 209 deletions(-)

-- 
2.41.0

