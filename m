Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114080njk;
        Thu, 17 Apr 2025 16:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyD5Wi46qy8A/z246PLZlgooCOy5GL8a4hTykkQLZ2uoDWACIo6RsYdtgrWLi4baMYIaAh2oUmyG7m1g==@linaro.org
X-Google-Smtp-Source: AGHT+IFc4CIJBj22VGJcdBtJaxFOiqtkUZikFtM3RsMMatiX7/oJ64Czfy8KeZooLcsE/Tt6AIX+
X-Received: by 2002:a05:6214:21e7:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f2c4656c2cmr17509606d6.31.1744934345236;
        Thu, 17 Apr 2025 16:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934345; cv=none;
        d=google.com; s=arc-20240605;
        b=XDcEuwoxjnMufdtQN18uPbfdA48o8LPNkjw3Ngx0gYcj7xMKachhD67ohtP95b9enS
         PWdzQGkbowQH0J4AkUkfCsIzqauuBwtXWw+eRh/roH2GfIgbG4QY8iUdtjcDOaY1woSG
         Yil5LIuidQszNw0P1Oj3wfYpo9Du7gw0LxaKGPszlvMOejICPkhzvhKx6TviICPlB2Zy
         bA353PNfQPSb4fxl9ETsJcZvxlzOp8QW51ZAXtLdEcLNj96i2YdOumxpCSRB9+GpbL0q
         Vi6VRyChEe2SOZd7m3X3jsckOF0KSIAOcPawG+Y/AwYcnj9WU4ttGQ5yklEsmK9Jsre9
         f+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4TIB71h4VciWszybxzcEl/xd/juHd0n+DW/Cdreo9tI=;
        fh=vIwuqrkqJsYbbDyvMi0ZY6mjlzIin6b2DwYOsAn/b/k=;
        b=bcNAIPR5WJhf1b1sb9B1VOpiFHW9FXfub5J4JM9qAEC7939YIZ5b6yils4zyHY51sf
         1YwJKQTjv6DYLF/LNaCBGuIuNxZF5qoSJ1GivrI38xdg90Gf47rv+LjuQshXLOuKNKIu
         bSp9cHnwmeL7cJGJktHuDWx18+UqFEk+GTPhqinhjj7GIAWcHvaIBhUD9YxQkYKACFn/
         QKT5HmgYHu6y7XNhKHzHbVzNL7rvlkupHjHxBripT0tC/ce9rmIpNYAmCGdF0+Pcc5UB
         7ijy0MBFuaYrc2SbquXRIkFlhnCI8dj8HCCSEAsnJJCbBkQ2UEQDn5zN2xE/S1eN/gDl
         p0+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uuGMMlBP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9ca411fsi9163311cf.289.2025.04.17.16.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 16:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uuGMMlBP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z7p-0006mT-FU; Thu, 17 Apr 2025 19:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7h-0006jg-6Z
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7b-0003mu-E7
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so10675435e9.3
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934297; x=1745539097; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4TIB71h4VciWszybxzcEl/xd/juHd0n+DW/Cdreo9tI=;
 b=uuGMMlBPgeJEegXvcbGHHyNSDP33Dv+ZqT0BzaoKTypcQ4/rEHtYTRN59mN7f9AVY7
 9FV6Iekr7OJ1CtiUVBWacAZL7+lhmzT6zCargteWK32NMRQ4L6vMwG4OWThjzP18uWRU
 wPCzAkba99yZOYQ9/jd9cV5j2Mgt/3isD27/lsgBLzjn1qeTslwqD/8sA6x1xUiOxD3y
 PCaO0XB7NnDGAR1je8k0Y/PNIGpxcA10/cv0236y03Aop2Lk6FUCLj7+6Qn8mSVZDA92
 n+pMTH+xeAOLbzDzy+/kcRXONfxoh0jycZdEqRIOMXzzmfoPqggRsZBFPzx8zu0ySgFr
 olRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934297; x=1745539097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TIB71h4VciWszybxzcEl/xd/juHd0n+DW/Cdreo9tI=;
 b=hpcVZWIHDJ1MiPp+lCyUeI/h8nROsXL5MwNye6klkYQDVmZHzD3Bvfr7AHJnBnbJ6/
 axYX1mZhkfev5P1ptr7n1ZWuj5WeWLvKj4il5i4XHFX7Rdac1raRmEV45b0I+rQEc4ez
 FaFskoxY/awZlgvHQC+CovJNJnA8SJlw3QqGCgbjU3pw7mRAEYerRvXlsXJ0vc1jUE3x
 MTrIHy8MTV58uR3CLzLiP0oWyVEj1S+0UbHt3SYpe4VA/gsaulV8nb6K99JW5JSLtrgv
 qRqSfHo+iuA3DOSTpvBVYXa6O6XlSulHYn9UyskkBEzC02p+f0hBIB2zPggNSEJHbSQS
 rNLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAgyFniwhSvteDFwLzbKcEpgXvql1WJF03jzb49e/GoVn0FG6/b7xDYM2wGXviuH2fLkmHXXa9EA==@nongnu.org
X-Gm-Message-State: AOJu0YxN0gEAEOqj94RQih0zKBSMxDjhZx9cknNWNwzKDaIRIz8tVijW
 7y98iWlvOu7UaDwDc7/b2lj9SBiCUar+eXp9ZdviF01xeeWXXqaIZqZKskyDO7A=
X-Gm-Gg: ASbGncsOrXgOzaFqP1L+WWJ4CVRPmPRakAO+SclAnJ51PZTMkElDSN1Aavk/xENLB+Y
 2UR9SdjgjQqNvg0Sgyqv4zrnq8F+EOTrzQqgHHoT6DDUZhx6pNtDsjsoIHaw8Uecrd7K/pGDdt0
 MoJagw389bt4XZd9Td+Ydwr66o86TXIMjY11LarPbCOlgW43MKyatyqcSeX9csWdJDYx+3e6rRi
 ZdYq7zZ28eblgCZ6tCxL6Ndq37/EdqqPTQzL0wRpw0mzfeSY18j6ncUpeKEOsGvpmqalrQZmHNa
 KQ7/3ftMLSzVlzj0gc5JXT1dTiEqoKj/3PF0+zheC7l2YaNkWlr4mIo0xD04dbQnz5lc1tOrckq
 sToHekuxUZZOBeAITScLx
X-Received: by 2002:a5d:588b:0:b0:39c:dfa:e1bb with SMTP id
 ffacd0b85a97d-39efbae03damr482392f8f.42.1744934296815; 
 Thu, 17 Apr 2025 16:58:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5cf2dfsm952955e9.29.2025.04.17.16.58.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:58:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 00/11] hw/arm: Define machines as generic QOM types
Date: Fri, 18 Apr 2025 01:58:03 +0200
Message-ID: <20250417235814.98677-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 8GRRBehJoVPj

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Philippe Mathieu-Daudé (11):
  hw/core/null-machine: Define machine as generic QOM type
  hw/arm/bananapi: Define machine as generic QOM type
  hw/arm/cubieboard: Define machine as generic QOM type
  hw/arm/digic: Define machine as generic QOM type
  hw/arm/imx: Define machines as generic QOM types
  hw/arm/integratorcp: Define machine as generic QOM type
  hw/arm/kzm: Define machine as generic QOM type
  hw/arm/msf2: Define machine as generic QOM type
  hw/arm/musicpal: Define machine as generic QOM type
  hw/arm/orangepi: Define machine as generic QOM type
  hw/arm/stm32: Define machines as generic QOM types

 hw/arm/bananapi_m2u.c      | 13 +++++++++++--
 hw/arm/cubieboard.c        | 13 +++++++++++--
 hw/arm/digic_boards.c      | 14 ++++++++++++--
 hw/arm/imx25_pdk.c         | 14 ++++++++++++--
 hw/arm/imx8mp-evk.c        | 15 +++++++++++++--
 hw/arm/integratorcp.c      | 16 +++++++++++++---
 hw/arm/kzm.c               | 14 ++++++++++++--
 hw/arm/mcimx6ul-evk.c      | 15 +++++++++++++--
 hw/arm/mcimx7d-sabre.c     | 15 +++++++++++++--
 hw/arm/msf2-som.c          | 13 +++++++++++--
 hw/arm/musicpal.c          | 16 +++++++++++++---
 hw/arm/netduino2.c         | 13 +++++++++++--
 hw/arm/netduinoplus2.c     | 13 +++++++++++--
 hw/arm/olimex-stm32-h405.c | 13 +++++++++++--
 hw/arm/orangepi.c          | 13 +++++++++++--
 hw/arm/sabrelite.c         | 14 ++++++++++++--
 hw/arm/stm32vldiscovery.c  | 13 +++++++++++--
 hw/core/null-machine.c     | 14 ++++++++++++--
 18 files changed, 213 insertions(+), 38 deletions(-)

-- 
2.47.1

