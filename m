Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1516165lfg;
        Sun, 1 Mar 2020 09:05:03 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsCeL3jaU9az5Pf6gyUyy5AROhlypXKHxqsawlhuYKL03qsQMKEwoUYYC3G/1HVCIQskXUR
X-Received: by 2002:ad4:4351:: with SMTP id q17mr5343678qvs.248.1583082303313;
        Sun, 01 Mar 2020 09:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583082303; cv=none;
        d=google.com; s=arc-20160816;
        b=knonfSHG/LebWzSQkZeUbN0cwN61N0d9ZK44Te3DnpFnmJpVI6+geCoex+w8RFf2DS
         qXX/SAomnRQaaeZ+HqcWtgxJwQEJAAhWbAOh41TvgqOLO5X4HM7v+paICWETpRkDN/GL
         c4NJcwueu8AIT5/U1VB4BnzEgWDowMw53ShIKYbczonkfOF56TK2l6pJw9XEMofVLtq6
         B6TsXVkU9n9f34soT2xrfgwoP66Tx6vJIY8UylyvN2zaYwZPbh4Nlikyo4cdWMLFMFhz
         YaMNYvbeQ3TzMzNLLTC/VoloRpK/3J1uUlhTr7dWwW3OnqvfBapymy4/KELpSOpuNih5
         VliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=lc1bYhcnqPFlmGbgR5g3n8tVkAtrQ0yFMcwg1XhjNQ0=;
        b=JSS1pDkVruD4pzZCPFLHZRvK1f2JLIEm7UdxdATS05a7lARY8djR7ftww40Ox+tha0
         mPs9I2t4lEy8M4W3XQYlEBiaU4OsJHU4pUdK5d4LtaTZyaC33rmkxxpPai4z4C/V+zKI
         pYMuY3sYjkcBatZZg0cMu8U8yVz9kYCPC7KdLjGXa4Yd/CZUrK3Cbr3VYUXL0TssxGb6
         A1aGv3CHAi2S8IKRyE0JnVtyeItQ4RLqEaU1It8VXvN8gmi/Pewzhe1sPmZ9T9Si4nwV
         0+eJ98P1t6c9+kHUcb1iZP1EP1CJNVXxlN0tmkAazPfmb7cbEjM6aX/Otp9uHBOCv6su
         UB/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZFrpcICa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26si2313164qtm.388.2020.03.01.09.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:05:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZFrpcICa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8S1W-0005qu-Lj
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j8S1N-0005pF-JV
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:04:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j8S1M-0001f1-I7
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:04:53 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35201)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j8S1M-0001eZ-DC; Sun, 01 Mar 2020 12:04:52 -0500
Received: by mail-pl1-x643.google.com with SMTP id g6so3230186plt.2;
 Sun, 01 Mar 2020 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=lc1bYhcnqPFlmGbgR5g3n8tVkAtrQ0yFMcwg1XhjNQ0=;
 b=ZFrpcICaWwXThfkufMdPHgSpHrfyorhQjdKSLmHNJSlewSa09bKkJDa0xCZ3RI1tbw
 qQVI+HTmF5Tmkkqg6M3jZAB+OXoAMTQxbFctpOe3mstkaDRHTiN9nnqFHs6jRYe5lKLO
 +a/p6bIsKccitkJGGgdFftx3H2ZizRRNE3iaE9W24l4PkAPtXrw4u2rq7Ha113y35AoC
 WGaMHL6BZC9OhwPl78rtzBM4pZEkTGMiRTr0W2uZEFliixuadMozibkMpTRjdyH2T2Yp
 RuENomUk4+StVIDlR2dE7aVyaYddGUbnw/MTzK6z6x8qAjT/zKZK6hnHtO+LtoEC/JWb
 rQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=lc1bYhcnqPFlmGbgR5g3n8tVkAtrQ0yFMcwg1XhjNQ0=;
 b=qILtqOA2dKVjPGkBBYouckqWRVskHgw6oep9jaH/ytJzfizmoTY7QbEIxKhKjKFOBa
 yhDBfdvD2bPDe5cOwLR+nU/zGR2FRE2d+8C0EUhKl+GuB/hVzXhnbP4FJTKBJPr9Ueaq
 c6J1qIHCNfS+3/OvK9CbxZw3O60xnZmD8ubx4fsE91P/QcmH7IKsX9eNFOApPPuoPJRz
 iHKLtdvmPRWFwEp5CzIU9cu9rCCHCNJxaonKv8y1elSOoSrirl0+equHrHwRfyJHDyWL
 wXOBVYnYM+MiMV3nPnpxvzjczuczOoSblpZFa9nztheq4cCsH6Aeuqvl0YBiurRE2Dx9
 r5KA==
X-Gm-Message-State: APjAAAV9L08978BaxcmFZb6iLc/0M6VLJj29pF+EdeEje1RL+NmuPpI3
 tV5yA23n6oXVhEO/wpEzYSE=
X-Received: by 2002:a17:902:7046:: with SMTP id
 h6mr13075808plt.231.1583082290624; 
 Sun, 01 Mar 2020 09:04:50 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y5sm17791710pfr.169.2020.03.01.09.04.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 09:04:49 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/3] Wire up USB controllers on fsl-imx6 and fsl-imx6ul
Date: Sun,  1 Mar 2020 09:04:40 -0800
Message-Id: <20200301170443.12904-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jQS+/Y7AFwCA

This patch series wires up the USB controllers on fsl-imx6 and fsl-imx6ul
emulations.

The first patch is a prerequisite for the following patches. It provides
a dummy implementation of a register widely used on i.MX systems, and
specifically the reset behavior of this register. This is needed to make
the USB ports operational without full implementation of an emulation
of its PHY controller.

----------------------------------------------------------------
Guenter Roeck (3):
      Add dummy i.MXS STMP register support
      arm: fsl-imx6ul: Wire up USB controllers
      hw/arm/fsl-imx6: Wire up USB controllers

 hw/arm/Kconfig              |   3 ++
 hw/arm/fsl-imx6.c           |  36 +++++++++++++
 hw/arm/fsl-imx6ul.c         |  35 +++++++++++++
 hw/misc/Kconfig             |   3 ++
 hw/misc/Makefile.objs       |   1 +
 hw/misc/stmp.c              | 121 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx6.h   |   3 ++
 include/hw/arm/fsl-imx6ul.h |   7 +++
 include/hw/misc/stmp.h      |  47 +++++++++++++++++
 9 files changed, 256 insertions(+)
 create mode 100644 hw/misc/stmp.c
 create mode 100644 include/hw/misc/stmp.h
