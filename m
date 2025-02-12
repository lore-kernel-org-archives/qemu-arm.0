Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp925258njb;
        Wed, 12 Feb 2025 03:26:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUmMShtEATH7pndAQqAFnpymN/6+fZtsG9V0uwmYu3dG6AzWfgtkMBJwXt6lSdIUwhpnE+W6M+BS+2Xw==@linaro.org
X-Google-Smtp-Source: AGHT+IHvd6iFGL8k1bw6j8iog4B1uHTkTUjq/EIQZ1xf/lSVqFd8i+Sa9Lbgwhm0cof7LPxYGljF
X-Received: by 2002:a05:620a:2955:b0:7c0:6ae3:884c with SMTP id af79cd13be357-7c06fc57a06mr301325085a.3.1739359581474;
        Wed, 12 Feb 2025 03:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739359581; cv=none;
        d=google.com; s=arc-20240605;
        b=Fc6P7HDb9kJiZMEkbZW+5hRc8105gAcxkyENSR8+KvnTM8cUrz8fRMcCDS1eoa9M+c
         x0oq+T+LLGmLTdrqvVGRMBYHbepiiPGIYg5FkOUx1scjbNV/sii+k+8XfNDmC4bcZxEM
         488BF+7iFH82mLYg28XkTZfGJ2WU3xit2wmF6dOk4wbS2U8394RBtdobwuB48CJalHbI
         SVUPUtVtD8gEpXlFD3+bmxnhu1BJ0VvWZIHwn2IDCI+yi1IxEh58Y0c9ij/J9or1AjnX
         0+2XlaaYSlRoDyv6Xliv1S2+VYPm7VN/ebMDQpxF5BtAX8GF7BsMU2IDyK8TurLvR5/X
         xOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=v0lKQ188Fqhtlt77kv+yVBP0rRi7j4Hamor1/xZAokE=;
        fh=mytzLkJCpjb3zcLDKHrvua8B5lJ6JqbPSTeoOtYfCFE=;
        b=c4OwH0MyCsn095puj6oJ3ttcihDn1xZ8G8SYWqtNlZcSzULO6Pc3t7/I8p7pgxT1hK
         EhwxWAW42oyoTdzFrJj2G2GHrz/f+yF/s18T+4cBmyZJwmK81miLjZHslbKnrO4P5KEz
         70UFzBjc334KAIHGmySp2S43XTrBdudKIWaXa8G9UMOcwlBOfPDZE2ywDNdLjwpUhEvJ
         L7zVu+yBe/24uFiPLlzQrcPaghwm4/6Y0xNnCZqZEvI/tBA8DzH/bVQ3TnfP4HlNN6zv
         N17xmMA2bwgZtQamGSDcYFsFQcW4HwH7XVXMFU5CXKUOxMNhHqzSz1+/rnHzjRYoV1Lo
         02BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gAwVzIzm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c05bfb9d06si667310285a.336.2025.02.12.03.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:26:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gAwVzIzm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiAqz-0005xM-IT; Wed, 12 Feb 2025 06:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiAqq-0005vm-9s
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiAqn-0004QW-V1
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:19 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38dc6d55ebaso467214f8f.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359456; x=1739964256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0lKQ188Fqhtlt77kv+yVBP0rRi7j4Hamor1/xZAokE=;
 b=gAwVzIzm5gnWRoCysx51Ed6LxyK59i4FNfe88/Tb6hJm+b3jEUzbWgmcPjQVZTvr5V
 jGiQliCe/Xg+4aNq6eooCiqZ6yybj8wH3hEQJqw/nI6OucuMME7ObncYLmNdT4wi23W3
 EWbCevenrOp6D1SUD7S9z+XapemJvoeS12OAPk3cbXTJaMTCMcBOzZloj9nq7qFfCBiK
 fvv3J4AyYPivrHcQDTvSP0V/gxJ3Cwed2XQ1voGfp4PWSSMjZUWQhBlkt5tHf8f3nx5x
 9l1qCEte0ukd3V4ZoO5ZX9gaZ4nYjh/Np4oLQRE58Pc5RWOPfLgqsIg2oSOuQPawuiXP
 io5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359456; x=1739964256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0lKQ188Fqhtlt77kv+yVBP0rRi7j4Hamor1/xZAokE=;
 b=SD5bl6cClOwxjmiB67u/DpxLSAtMxhUMBi8fKgmI93ZXhcrTeQgCGTQalyzZo7irO+
 e6WLdaoMIE5vdGmRJuw4NLAapJOm6sttCnvn6Jns3bGFonD8v1byfYaf2bRj1pisWNrq
 Jxiptu5G8AApTou3u1rzEFVgCSA5d9s6q6wy+GNCo/tE5XFkh+swoEkME6LQ3yw4T/tn
 HzcJ4o6psqjThne6euBYvfjYJPIett9/gNhDXdveY6//0AhFAUTrXiGgi62zxET9b1q+
 1e4th743kL2DANxZsPgK7RXC8iXbZp03UoppvdAHjczWyp5U2jQ5FaoLcbSAbrgRL13Y
 BrxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGgvzJcq1BIW+AO4ilTRaw+BIevcNZG9GKkQwQZGMRmHwpJOy6/b2jWCwKktAYAsCBQYmdRGmB2Q==@nongnu.org
X-Gm-Message-State: AOJu0YyJCn62vbd+LfFgFOjEEd7zd4d8BwL7MHo/7rQ+v2Vcuw8C5HIM
 dw55vqAXq5XltHJtPP8BrJT1D9nzp35/9of2zq0oKl4nrNpPekWLzISvzTl6jQI=
X-Gm-Gg: ASbGncu/RxCiGBOhy3Z0Y4wfNESY3dJlcrbsH0xwDXqGn3Q/Za6pv+7p8tO7DyJ+FHc
 7CDBj/o3+iYFwobD2kZNTDHFNIc6g95DL9F8UgvkG03YTPvZyFLi2r46Hj3QhFLxjNeHvz+s6nj
 KXg2rsq9k9PXNV2Va/GmhTYWJmErZM2FLYSveIxzgBO876Gf4Zyab1JF3wQmQWLBfJICpDJwlOL
 bqzWJe152g9D+7l2CMY8buvtLT7b/JcQ5fBs6qH9Upr3ZJ4wF8FASmOrUf1bFgVj2pJHbpbiXwI
 rYcQYFvN21QM2HsH+iU+QiQLNJkhElSw1utr5Zm0LDtJ+/Se66xMm+x7+5U23Gv+wQ==
X-Received: by 2002:a5d:5885:0:b0:38d:dcbe:91fd with SMTP id
 ffacd0b85a97d-38de43c7377mr6776481f8f.22.1739359455994; 
 Wed, 12 Feb 2025 03:24:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm16584455e9.36.2025.02.12.03.24.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 00/11] hw/microblaze: Allow running cross-endian vCPUs
Date: Wed, 12 Feb 2025 12:24:02 +0100
Message-ID: <20250212112413.37553-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: aHlpmb7apSho

Since v5:
- Introduce QAPI EndianMode
- Update RISCV machine while rebasing
- Fixed INTC use on PPC (Thomas)
- Dropped patch adding more machines (Daniel)

Since v4 & v3:
- Addressed Thomas review comments

Since v2:
- Addressed Richard's review comments

Since v1:
- Make device endianness configurable (Edgar)
- Convert more Xilinx devices
- Avoid preprocessor #if (Richard)
- Add R-b tags

Philippe Mathieu-Daudé (11):
  hw/qdev-properties-system: Introduce EndianMode QAPI enum
  hw/intc/xilinx_intc: Make device endianness configurable
  hw/net/xilinx_ethlite: Make device endianness configurable
  hw/timer/xilinx_timer: Make device endianness configurable
  hw/char/xilinx_uartlite: Make device endianness configurable
  hw/ssi/xilinx_spi: Make device endianness configurable
  tests/functional: Avoid using www.qemu-advent-calendar.org URL
  tests/functional: Explicit endianness of microblaze assets
  tests/functional: Allow microblaze tests to take a machine name
    argument
  tests/functional: Remove sleep() kludges from microblaze tests
  tests/functional: Have microblaze tests inherit common parent class

 qapi/common.json                              | 16 +++++
 include/hw/qdev-properties-system.h           |  7 +++
 hw/char/xilinx_uartlite.c                     | 34 +++++++----
 hw/core/qdev-properties-system.c              | 11 ++++
 hw/intc/xilinx_intc.c                         | 60 ++++++++++++++-----
 hw/microblaze/petalogix_ml605_mmu.c           |  3 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c      |  6 ++
 hw/net/xilinx_ethlite.c                       | 27 +++++++--
 hw/ppc/virtex_ml507.c                         |  2 +
 hw/riscv/microblaze-v-generic.c               |  5 ++
 hw/ssi/xilinx_spi.c                           | 32 +++++++---
 hw/timer/xilinx_timer.c                       | 43 +++++++++----
 .../functional/test_microblaze_s3adsp1800.py  | 35 +++++++++--
 .../test_microblazeel_s3adsp1800.py           | 32 ++--------
 14 files changed, 229 insertions(+), 84 deletions(-)

-- 
2.47.1

