Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4062979njc;
        Mon, 26 May 2025 01:55:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlgYHPQvbPIJE63C4Fj8vLawsleC+Rnv9xIjnTE0XaFDzl1e8Wln0FTjDB4Q37kcdPA+3aisKDZIyNOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHp1FvVPKcy9XSG4qAGyPP3ZCa2di4Yky7wr5L9gt4Jz5zLNWh0TO4JrXd3d++4iKLW/PTW
X-Received: by 2002:ac8:6908:0:b0:490:8cc3:d111 with SMTP id d75a77b69052e-49f4713decemr144081341cf.27.1748249744292;
        Mon, 26 May 2025 01:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748249744; cv=none;
        d=google.com; s=arc-20240605;
        b=dDrfShcl4LkLMeKRwadUL3akPfLiFbZKzEyi8LYFKDf5PHwx/2UHmjSOQylXI2fXSY
         cEfoFswU6BoR6N3LS/LzXDEqgNtQD5efqGHKwVoz7kodGDddvabckuN7DqIUcwfXCxB+
         VZhbvS1Rru4v+tGicjdcIUHGrssHXWicW03uH44/Zf97umzbxZHcLg736QcmUAeVK/Fp
         XGyV7Knj6/ydvCud4EYKpferdSfgQHXMl3q9dYoDNrXfE/tLraushbfPrq9Z8oQSNqKP
         TCduwv8EvlAievNxoe8kuB7V1lUDGPkqLn0EHryMCrkTq/SuzZqK4QJl84joQx89geEC
         RcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=h/Kh0vlsUmDeZGS0m/0HStbc4MTMQHVDFXchMhdkFP4=;
        fh=ZZwLt5H82yHLOWpnvJwJfXwO1u4fGNY7kNtWC/UDUJc=;
        b=gCPoeEZM5Z/GYqfNwliMaItm96F6t7QC8yFwhZXTPVfIw1ZfYMEFKHfO/o/3XGQmL6
         tlfm0gC7Tvv7Yiy4gti01GVSvKZ25VKLkTRNLCnFVDIT5+D/d9R0hCjJw8/KNFH+B9Hn
         7Ca8aegbjtjk3vl0x6uiVkZ8/6QeHt8pttA6/H6ohMOy19uog6ihQrz8/zY6ha333DVl
         FX6ZsIjN4OR8SdoRBXmw96I9QXTug2H4TpmH0dwtNQdhKn65vEIvbXmEb+hQjH53FYDD
         7XLnd3JrBk3eSk5B5tt2cxgoYuJj0lsJzcB8QmKDwOnXJWEZYFYH/9ubXZHMZWobQkno
         RQAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=Wabx1IH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae5aa1ecsi253882411cf.614.2025.05.26.01.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=Wabx1IH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJTcQ-0004TS-FJ; Mon, 26 May 2025 04:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uJTcK-0004RW-SK
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:55:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uJTcH-00082U-RE
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:55:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso15269365e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 May 2025 01:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1748249726; x=1748854526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h/Kh0vlsUmDeZGS0m/0HStbc4MTMQHVDFXchMhdkFP4=;
 b=Wabx1IH+vgxVqzHDXiaMdOlXdKWVC8jk0ZfLPXlsI5l5RVVBaYxjnCDXdoxQvy2HeT
 KYBu4D+C9oys0UvyfuG+6qSFJ700PYtNYB0DGdN+GpZR8c9iw2m7BNlXgViv2P5OmikI
 ZSi9lNvDmlW0EeOtCSUChAXqD0N6chNopFsYxF7C+kHl2PK/0mHLWemfHjp7jklVYHiI
 Jnd8GONxcSDRyTH1qXwMQYneJCmUcJgSAAfx/cBthyuIgraGTfauFCJMUVWoyxcyURJ1
 m1zY2yFowI240MozfVBJTnQPexo4/+OIe8/kzme8hAaKhAGV3kkcGtuey/z8Dl6Si+5u
 6AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748249726; x=1748854526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/Kh0vlsUmDeZGS0m/0HStbc4MTMQHVDFXchMhdkFP4=;
 b=wE1XEvf42VGFVJVxzuzf3U34tymsstfrH2LLmdromQsyrbz7VioVOaXbnVPkp3mdGw
 Bx8b0Nlg/0KGvF4bfJPJONKT9dt/B1cfzlYBr/qBcJEQEITMqIkoyUDdK9YFm+bE1cB5
 xPQzXlQwYnyHJfMtPVerAiXMA9BeSqBBv7y7c7IbQ/liXW/aaObjwYlXSW4lSJdGOVGO
 UTlJ9M3IsDmGRxZzbncph7ajAvYJ1eTHfVu1kiu3gec3paqHFC9ZXjR90/qdjvG4sAGV
 1P/oBd24t49s5ZGLr8p7OYMXa7uPtvcgiOUVCYT881KEkByQM5hs5d4BZWW1MaQ/2zly
 SiCQ==
X-Gm-Message-State: AOJu0YzljB5ZaeozSJYmSaubEyDRGCoZsOP42U5xPIRsT6H/XEaQjp5A
 67+EKdCP1XEb1RCoQ1H4QDWVMRMpwE2PVdu+2eVjezFmRGGtshfi2S/dyi4yLMtKeA==
X-Gm-Gg: ASbGncuJSI2lffknsaaa+PfkgmyuNR1dGgJtKUWpS3CP2cVJYxjLoUJouc7NFIV9qxe
 ZQDeTMsSkGV8DKmX3IN1D0PKDApjT2sXXmg1BDnzDxOpdGQ2SuXSSvPBd0jE2MsDGF8buxh35lb
 CNiWzuS25zljSi6BHTAE1h1Pv8jx3999MGO86yKvHWUGx80G9/bofiOwuElGGxjvQu80lsFJDJa
 rQ5PP4Fw4eutUjcYQ8f6AKWsE9bv1KRqUx1QoaOmFTwqcqgWHLthYqnlE2caa2yOhZ8mw6cPgIn
 YnyHCqkViIUs14NK09PNRcS1f2wEE4l+plxiQ41sg5MTL6Y7OxicrfCgNT749ZWG+GsO5fn2r2y
 tjRpEOJKQ/xMt6l6Qn36Fc+4bbkY+3mnZVXHblW6H+oT/1m6g
X-Received: by 2002:a05:600c:3c84:b0:442:d9f2:c6ef with SMTP id
 5b1f17b1804b1-44c9301660cmr84939245e9.2.1748249726089; 
 Mon, 26 May 2025 01:55:26 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23bfd54sm238911675e9.17.2025.05.26.01.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 01:55:25 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v2 0/4] xlnx-zynqmp: add support to boot on RPUs
Date: Mon, 26 May 2025 10:55:19 +0200
Message-Id: <20250526085523.809003-1-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 06KVtLH8nC3P

This series enhances Xilinx ZynqMP support to allow booting on RPUs and
ease gdb connections to them.

It was validated with home-made binaries. FreeRTOS was tested but without
success: outputs/IRQ seems broken. AFAICT, FreeRTOS is expecting Xilinx's
QEMU thus I didn't investigate further, but I'd still like advice
on the 3rd patch ("wire a second GIC") since it could be related to it.

Changes since v1:
 - add doc for "first-cpu-index" new property in arm_gic.h.

Clément Chigot (2):
  hw/arm: make cpu targeted by arm_load_kernel the primary CPU.
  hw/arm/xlnx-zynqmp: adapt cluster-id based on the boot cpu

Frederic Konrad (2):
  hw/intc/arm_gic: introduce a first-cpu-index property
  hw/arm/xlnx-zynqmp: wire a second GIC for the Cortex-R5

 hw/arm/boot.c                    |  15 +++--
 hw/arm/xlnx-zynqmp.c             | 104 ++++++++++++++++++++++++++++---
 hw/intc/arm_gic.c                |   2 +-
 hw/intc/arm_gic_common.c         |   1 +
 include/hw/arm/boot.h            |   3 +
 include/hw/arm/xlnx-zynqmp.h     |   6 ++
 include/hw/intc/arm_gic.h        |   2 +
 include/hw/intc/arm_gic_common.h |   2 +
 8 files changed, 117 insertions(+), 18 deletions(-)

-- 
2.34.1

