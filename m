Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp842502njc;
        Sun, 9 Mar 2025 17:07:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOBjZr31z29kx4t7jpFBoo032y5IPcYoTMWynDy4lYTNBcjKtYDuHFfzcvEHYRMYMXcj+kczta8pFHVA==@linaro.org
X-Google-Smtp-Source: AGHT+IF3RlxLzW4I9ntUVTrZyqKD8l7Z0U7k9FjwrPvXBBN3/jOHMHd7WanBpuaW5B9WEJEo+86Q
X-Received: by 2002:a05:620a:8801:b0:7c5:57b2:2cb7 with SMTP id af79cd13be357-7c557b22d79mr34610485a.56.1741565271022;
        Sun, 09 Mar 2025 17:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565271; cv=none;
        d=google.com; s=arc-20240605;
        b=fVz2uYAi1mVlLiv05C0waal2vqQ0XdPZxTW1YEXBIFUNEW7SREcQ0PJ/hPrr/f7Oye
         Omzk4VwSfWO6rFIS01Za8OgNj9WzIUHZUyRBgqNFFEX9XVdRtZp0F4D0Riyt3WBYeAak
         IFdDSglkAS7guZY8JPJ5wnFMClmDiNvuWSFpPCIgx3kEZ4P4JyYyI1YEfjHv+XQVBRt3
         7jTaukUcSSrE461s+B1qaIpjF+/odu/qR5Z96hyA6hwa5uZBNhLyp2Rhp6W7M9c7wg1A
         0UlJ69fxyMlV/HY7uQzFOKHXImMcWzQTqdBs6ELuymlxpiwYy9dJJb9qDCUx35QpMsll
         rySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vluwFSKp6e7zoU80eebsr7FlbxAE5fBxSqh6kQbHYLQ=;
        fh=wDGKg6cZmrix67R+18hJf9mKvD0oMiSMqDpzIWSIMPE=;
        b=SLKM+8e5bBShjAnzPCs6TAZE05hQPAkDnsy/WEh8dgPrthyzggRkmRW1xVmEqZ1aZK
         rb59IoYq14I7n4Q/iz5HnHYS2i7oEGRD0T40OLy/VQhC26FAH9T8SVw2eiC9vlInueEQ
         b0ih9gk6oFr0iMINsKtof7ogyDOxOH58u3G/VzMBwfXoEMr2sq5dOabAkWAv/fC+KByk
         QeonTzM5bEPbfPn31c3/xUCOh45QRoOxFHv6qnkTO3OQWkCu6A+8y7pjICoBc+eWJZjh
         P1zUcLhWBNSbo/Tkx5GdcNzHRBb384CUC9nwBGJXNsNKwutpgBmOe2vQXU0xH6xyLFyw
         GF+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KWF8VMPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf8d85si83733011cf.329.2025.03.09.17.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KWF8VMPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQfA-0001ly-08; Sun, 09 Mar 2025 20:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQf6-0001ko-KV
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQf3-0007GH-2r
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so7288405e9.1
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565183; x=1742169983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vluwFSKp6e7zoU80eebsr7FlbxAE5fBxSqh6kQbHYLQ=;
 b=KWF8VMPUgkgBl+NQu/36q1Sii3Go+nz/wZzd40CGS4mPelfzqlsW2QWEphCONnnp4d
 g6X5QuMhVwRxXGOyZIkLSwzEGDXHHZ+4btKl9/ly0i5JjOg9vtzn/JRAoztwg++rCjGk
 Sy/mtgX3dSvZejhF/dXpfhEdpAJ8fZpuCensZFC2c2Zni3p68XzIlCbJJcLjIOvMcllV
 ijS42ZDTBONIFwcxmFUK68NdRb8HUupkC/FWeFHOyS24FOsmF1ptXVTG6Pr42Tjnic5K
 Hd9V2HRdmryDRGkNjgH4iA71wh/gf7zl/wt6nhDnUToy20mPqRkIlS60aaS9qRRFCa1F
 5lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565183; x=1742169983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vluwFSKp6e7zoU80eebsr7FlbxAE5fBxSqh6kQbHYLQ=;
 b=YpLMvmEYiKdrvbiCvjhi9pFhVNCeWhYwoQFdeMRxX0QMC/mMho/F9UTLSsSvz9VJBC
 PCWOu4M9fsgS0hf8gc3rEubXl697xNa06NmJ0zuJWoEkQWsDeXEMPqVTYcrsCYXizWFI
 q6Q5Xm8Ew5WRWDl3pFjiwP+rbfBSlfODJuz2rWfjY87xFAFcISxMo6mRaOBhT3yg6QSt
 yoD1ig0lSxrQ+/G0m9Uy7TQLsmQLkhu2W9HAMgU4uPfyvzLDxgSonLENfptL402/ozwy
 UkbYQuhw1f6/XQys/9OfXWjm3P6FjDqrwBCTTSiLpOGxo3Q9xdMzkIT2psfVrlgexMbZ
 QH+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHSB3P2FRlGN1IHEZZiauBoDxzm8uk713BKWs5nAjyHxtJkCjtOn+ZU7zXLicfJb81kqIhRF1oIQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSiPff7bGzUCb+n3+6irAeP2Vabd6SrEtYpu0bRGJ3hLsGqeXl
 I911dNXO1A7OnhGlzeX/sFwJwhUTbi5EiMO0CY8Zgz7CBcsCPjrxgjg1yYitIms=
X-Gm-Gg: ASbGncv5GqJFoF+ZC6VGOioQxcFuiaLhDwjg2NhWnVeQCL3X6TXVOq5xHbKAIjOX84B
 U4+r6MuCttDGI+78KR/O19zDAsX0564nqF8Nh2j+03G4Kls+AKLrRwsKwy5pI99p+BrsHimHJgs
 eR3NAEgYJGBfaE/E3NLrK9Pkyamsvpya+j1nAR0kOgf+r1LxlqWRVthCc07Ehs74v5vWYATv0VB
 ZnFdiHN47wsPpI6KaRpuS1HD6S1n8BV8xkptWa1BSbvliDgvlaug/QviQ6I660r55SvSDr+WKzN
 zwarlNgdEGD65QUC77j0RcB018E7B/YvToY33o/rbka8yWGsx6RWUBPwmzK7yUBb+YWD07kSQOq
 7YQF5La0zjyaIDjz0kZpwUFg3KuXkSQ==
X-Received: by 2002:a05:600c:5103:b0:439:685e:d4c8 with SMTP id
 5b1f17b1804b1-43c5a60eda3mr70337825e9.15.1741565183204; 
 Sun, 09 Mar 2025 17:06:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cfbae50aasm4329205e9.8.2025.03.09.17.06.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:06:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 00/14] hw/sd/sdhci: Set reset value of interrupt registers
Date: Mon, 10 Mar 2025 01:06:06 +0100
Message-ID: <20250310000620.70120-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: y6CZDiPwoILR

Since v4:
- Convert quirks (Zoltan)
- Cache class to avoid invalid cast with PCI
- Remove 'endianness' property (Bernhard)

Since v3:
- Fix "hw/qdev-properties-system.h" (first patch)
- Convert to EndianMode (patch #10)

Rainy saturday, time for some hobbyist contributions :)

In this series we try to address the issue Zoltan reported
and try to fix in [*], but using a more generic approach.
The SDHCI code ends up better consolidated and ready to
scale for more vendor implementations.

[*] https://lore.kernel.org/qemu-devel/20250210160329.DDA7F4E600E@zero.eik.bme.hu/

Philippe Mathieu-Daudé (14):
  hw/qdev-properties-system: Include missing 'qapi/qapi-types-common.h'
  hw/sd/sdhci: Remove need for SDHCIState::vendor field
  hw/sd/sdhci: Redefine SDHCI_QUIRK_NO_BUSY_IRQ bitmask as bit
  hw/sd/sdhci: Include 'wp-inverted' property in quirk bitmask
  hw/sd/sdhci: Include 'pending-insert-quirk' property in quirk bitmask
  hw/sd/sdhci: Introduce SDHCIClass stub
  hw/sd/sdhci: Make quirks a class property
  hw/sd/sdhci: Make I/O region size a class property
  hw/sd/sdhci: Allow SDHCI classes to register their own MemoryRegionOps
  hw/sd/sdhci: Allow SDHCI classes to register their own read-only regs
  hw/sd/sdhci: Allow SDHCI classes to have different register reset
    values
  hw/sd/sdhci: Implement Freescale eSDHC as TYPE_FSL_ESDHC
  hw/ppc/e500: Replace generic SDHCI by Freescale eSDHC
  hw/sd/sdhci: Remove unnecessary 'endianness' property

 hw/sd/sdhci-internal.h              |  26 ++---
 include/hw/qdev-properties-system.h |   1 +
 include/hw/sd/sdhci.h               |  83 ++++++++++----
 hw/arm/aspeed.c                     |   2 +-
 hw/arm/fsl-imx25.c                  |   2 -
 hw/arm/fsl-imx6.c                   |   2 -
 hw/arm/fsl-imx6ul.c                 |   2 -
 hw/arm/fsl-imx7.c                   |   2 -
 hw/arm/fsl-imx8mp.c                 |   2 -
 hw/ppc/e500.c                       |  12 +-
 hw/sd/sdhci-pci.c                   |   1 +
 hw/sd/sdhci.c                       | 166 ++++++++++++++++++----------
 12 files changed, 184 insertions(+), 117 deletions(-)

-- 
2.47.1

