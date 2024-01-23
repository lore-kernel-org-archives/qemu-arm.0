Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp135884ejc;
        Mon, 22 Jan 2024 22:39:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFVHIiaPjtSejMyKULRlMUabBvoxM8XTnRtZS4JOMjZHxzSou0XSXFkJXzdoUGeG/Xj0jA
X-Received: by 2002:a05:6214:c8c:b0:67f:6ddb:58c4 with SMTP id r12-20020a0562140c8c00b0067f6ddb58c4mr481885qvr.45.1705991955065;
        Mon, 22 Jan 2024 22:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705991955; cv=none;
        d=google.com; s=arc-20160816;
        b=MgK0gxZ1pqSKD/0IWSsyhkqcuBJyfj5bOUXAhAlAYkFUMyzMXc5RxEGmPyaFMDFi/4
         w++W5WAEqICSkCOZIDUXuUsU88OJeWcjMGv6GHWefMsCJxRm6Mjo3AIPlPtaNU8tivIC
         hISBChTZyKVTX64hf3UxagKqnYcNo8t05pLM7R+QhKTaov5iZAw8MlJPbfhUPl72phZG
         Rf1hfnAx4/uuwbmaIskKVL75frAQSELcVzrUU2ZjLQy3rXTkTqPUVrQwYaqEMth1hEL1
         cuooNrp61UQDJa4Kp8qypp/IZLdSf/Seaf1Jx5//V+a0j1ABtnaukSUMkkCuwnP5Ozaq
         Uzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1S3Kb8X6+oHdxd8A/86ZJwcoceMTfTdBEBzF8MGKUDU=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=WuVfdGwwwYa+RWPAXwt2MSH5ROSu1ZqYjHirtH0fmTdUwll+YaqEvSozB6rtaQExRV
         lTfK+vrtwZtF5EuIt5brXmiLjUp7fzoIBxgpNXRvvKyL63eoiW+Dn1T1Dz5YmfAuEPmf
         gVCzeuXQeWB0E/JaFze77xfsiblobesnTIqRH2I5PodCR14pqZ5APvkMrOwNFg2C4TTn
         nnri82y3Lma+FR2Z7NuPTIZI4qlqpTx7fuwMpUP+35HV4GogDnYtSMvKAZoDytJQLLpS
         4SAUlLd7UybBrJQq3glv40PQ0pZludgNw/1X6P2ZzkvJQhS3hp2iyGUIqCKNIwDiqA1Q
         6Fig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QiTaolEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020a0c8c0c000000b00681944692bcsi7402006qvb.233.2024.01.22.22.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QiTaolEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSAR5-0003Wt-0S; Tue, 23 Jan 2024 01:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSAQt-0003Um-9a
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:38:51 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSAQp-000825-UD
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:38:51 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a349cf29cso4502991a12.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 22:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991926; x=1706596726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1S3Kb8X6+oHdxd8A/86ZJwcoceMTfTdBEBzF8MGKUDU=;
 b=QiTaolEqHsGwPcXcBnbgMsh6gmibdTxjGAlLhjC0VpElbatdNgU82DeaHT/79x8WPM
 Zl5jST5m/LreZlkGN2iETCdqrBNOs/OQO/vOx+YmVhRc2HaizSRlfLQeteFO40+r2ZYa
 FlUpq0aIoFmt8PXszPjr7zKn8h/pxKMGXRzK8QBGgK3buLIX0WwPBh83iP+wEcRayn3w
 FHWIB5BN5FJrvXpiNgsAPUvHtuf97U66Ldcs0y/LDW0KLBluqZ9qGGBRR6wYZuoAZv7c
 x2HVSSiYjmN7axlsT5JrtMicbPRi8yA132d/SoPIDtwtTr1RJ0i2Ku2mYacT3md3XLIg
 HnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991926; x=1706596726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1S3Kb8X6+oHdxd8A/86ZJwcoceMTfTdBEBzF8MGKUDU=;
 b=vjQlPNXKvKGxRSIPzjezGkAzJgT/92JoBn6aE95M44OwC4WWqJ6ViV4kKyXg5Tl19t
 7q6Kudj68AqB9Rp9YQqxlv/LO/6w4YZJ5kXOY7k0sGZBuanvbAHiu+YNcqKP87RFOntE
 4zou1crgF1unnIQJRbhHm+hvZ1XX7UjzEoAH6lZZ5iDa+N9uVlBNnzLoTjb9TqoXUtn3
 nCmVcIA9nT3zEw1RaUuUf4QHc9n6DnzrUkFkKVg19UQ2FyJsHx2P0mbZniXHBM/IFBbL
 rTkiGvneIhPejvUlrPeneFZraX7etqim55hNS7cfqSF+9DVL20tiLC70Sx5aPy9I6sZn
 8KSg==
X-Gm-Message-State: AOJu0Yygm5QhIuY22Q5TCCMeXOwGla8S+EdRjEluPp9UyfwV1cRIBMp0
 xGHpLrz+kPLmSs6mrhpjYRzojv+EACuWm+PoOIVoiJjIkFNto6leiWjx3CvRkio=
X-Received: by 2002:a17:907:8749:b0:a2f:ba67:cdd3 with SMTP id
 qo9-20020a170907874900b00a2fba67cdd3mr2766929ejc.78.1705991925893; 
 Mon, 22 Jan 2024 22:38:45 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 vg17-20020a170907d31100b00a30d2406871sm108238ejc.128.2024.01.22.22.38.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:38:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/8] hw/arm/cortex-a: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:34 +0100
Message-ID: <20240123063842.35255-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5lOT5u/ngcrM

Following Gavin recent CPU type enforcement cleanups,
restrict more single-CPU ARM machines (here Cortex-A SoC).

Based-on: <20240118200643.29037-1-philmd@linaro.org> (arm-next)

Philippe Mathieu-Daudé (8):
  hw/arm/exynos: Check for CPU types in machine_run_board_init()
  hw/arm/highbank: Check for CPU types in machine_run_board_init()
  hw/arm/vexpress: Check for CPU types in machine_run_board_init()
  hw/arm/aspeed/2400: Check for CPU types in machine_run_board_init()
  hw/arm/aspeed/2500: Check for CPU types in machine_run_board_init()
  hw/arm/aspeed/2600: Check for CPU types in machine_run_board_init()
  hw/arm/aspeed/1030: Check for CPU types in machine_run_board_init()
  hw/arm/zynq: Check for CPU types in machine_run_board_init()

 hw/arm/aspeed.c         | 40 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/exynos4_boards.c |  8 ++++++++
 hw/arm/highbank.c       | 10 ++++++++++
 hw/arm/vexpress.c       | 10 ++++++++++
 hw/arm/xilinx_zynq.c    |  5 +++++
 5 files changed, 73 insertions(+)

-- 
2.41.0

