Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp488051njc;
        Thu, 5 Jun 2025 12:36:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSW8pj/3/Fi4nwLaKo5XtfNmCIIyKeWlJ8498DjZ0qHmzS7v8u8B5o64ZFWiVbbZKbVQ6BYqSdlWetzA==@linaro.org
X-Google-Smtp-Source: AGHT+IEfdGq9oPRF3OiGXtDzI+/zh05AgKhkChGiPzJND2Kp9Lxr9ve6hAY9LFkVd01BXtNNK3l8
X-Received: by 2002:a05:620a:4112:b0:7cd:1d87:6c79 with SMTP id af79cd13be357-7d2298eba35mr134490585a.53.1749152191083;
        Thu, 05 Jun 2025 12:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749152191; cv=none;
        d=google.com; s=arc-20240605;
        b=ZzmJR3ovjNJjBUfuHfBwrTYRHngM7JRwRf1Ty69NWzqaKZuWzYIARC6V0tApPChDds
         b9SI7n95uczCCXpPINv419M76pXW7WDf4RwQqsvcwbf7E6FIek637RfhEV8e2+2USYKG
         qAbu8Z7rPrEiYScekcSrQhhrcfD1wQ4jxydgG4L1hn3Q9GnS+465c43O5ts60VzgGeVB
         EdyEUG2VMMqIUljq8B2v2N38c7sb6vkn0o7ObIDo09iccY57N1zhRxGcMkYeVrHgM/Cz
         4S1gauMjINdxf6oZk2yK0fHKGl/hoCt5yHcQnN7A4XgveB5UntswQDolGIIMNzX2GJiX
         SGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ACcXdrmAYYNSlTqlDqHpslwOf43nPNTD1Sa9tjGMI5o=;
        fh=Q8aF5ETIIcfPZIp3ZdPELSyTUa987MyOJMgBvIbCOqM=;
        b=PlYEQJ/Y4n7IhEHy75P/RiXshDh3TkVmUrSaZ0fA5UgfrWpOJcR3XUdzWT23f6g8h5
         6itaU/iNuoK7zOVabsQHh7uSAesZ1/oVIDtmISetkoV6gRW4Pnl7k0ioIz4sBboZd57v
         7cWTtKro3GZdBVyqakEY/7500yxUadgH9I2NXmJJ/Ejv5dmDREa9n1hrkIC/OZt+Gczq
         xd2cTGR3G7yI2iFs6sgKxGP/ogevREe0uWojzrCg/nqrMSAB4SVbLje0+DpjDb5LgH9R
         0/rurbP0sMAcySxIdSVYx3V6AOoHqUJ8PyyyN3+ENWc6AW8GBXdoZ+7jKQ+XC5L5DwkF
         aI9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tb+gOf8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a60f39csi12835085a.379.2025.06.05.12.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 12:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tb+gOf8y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNGNa-0006hd-1m; Thu, 05 Jun 2025 15:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNO-0006gP-Oh
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 15:35:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNN-00015K-5u
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 15:35:46 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so11250935e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749152143; x=1749756943; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ACcXdrmAYYNSlTqlDqHpslwOf43nPNTD1Sa9tjGMI5o=;
 b=tb+gOf8yyzSgEbplq/aOHjCFzqleIzyjdAUJwgV96kgD7hSEl3fXmxNKebTr9NBV1/
 csJ0MmTP5vsV62x6M0G0CwYLmXaqBPq7e35OQUTQTpITyHMEmMkR965iCiwdTRVofYaS
 YpMLIUiGmMbPqhxTwWI9PNE0Dcq6RlwVzYM/sCmeqWvGRWRUFPFxFggIEy0VrHf1L8zn
 9C7rAgTSasp5swFJAcYi2LolWcOILpS7EwjQ9yXIRD9qo2Z7Uh07clAYkz2VWc1O3W/d
 afDLWMDm7QQkNjYeKrB/jGAaT0qMMUyX1I1Cuh+3c5LRYed0JmF37wMHsmQHjR4jxpZu
 kvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749152143; x=1749756943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ACcXdrmAYYNSlTqlDqHpslwOf43nPNTD1Sa9tjGMI5o=;
 b=hN0kAUe3ho71HN001g2KpNpZbmiOZzBiILinvQ19Q1ntSxRXRiw9oF7QGf/FRhGWYo
 8HANwKFN0Ybc9fAFHBZr6Jq/7WEEJrkBCH/ptpLxT5cqgVwFIelBE0r5hOViMisaAwso
 aWbHXO4ZdZg30+ofanpND8S+9R+Xy3vFQRNNXPLmYVcxDCmltCdUL4XIrHOlPId3ReO5
 /ftRLqqYPdWtp5JaDkRMovZR4pAQro6mmChfVa4tfMBJWKWMEmCEElWshKUb5NBOxdkb
 btwkb7utm8zp69D6/2loEDEx66gVu7OjoMEzOjgLFPWFWmfdVvo0XGszY+RfQ44mCoRR
 dOBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNWeIthpcoF/Z0ViGBRYBBXqT8SlD2mDAAMOLxFLDwPLzN+IeSZBFzDbGjkiOADeHStQ+9BbxQpg==@nongnu.org
X-Gm-Message-State: AOJu0YyP15GBO4fj63pdcGBb8/vixWeCC8H2zAZjvWM8EO3N+9CaUcG8
 Fu9f4MUfbrLtQKXdMh+BZZIPKPIp+UM4HbLhWZjI4IizP2mBzHm6t509A6pLsJZLY8k=
X-Gm-Gg: ASbGncv8vpKCeQk9+lw3vmDyKkSFUXcXCiFGzBgMAMxPLbSV5NK/EuLbH0QQ0ysfAmI
 90uGaPD/X5dIXIyaknIF1Hr2dbKUi1MeC+4YZSbYR3iRhD2d5ROT5pNIZxKz1Ns1sv42MiR8JVW
 bq/fgXt6Plb7/U5065GW6+3S9siqwJAyWg4O7S3xUdsvf3eJWVpIjLWN/70NRJ9SUD+mont3DFz
 On6nszPBXBfMRnOzSv/ElX0CGyp6sSaQTMOcNVz+zJqi1zyKxIBPBf/wZYpXJ/fGo713/3aHOoG
 khf9ZZY9YGKVZEl8429gLBKi0C/DhBmCxKpbuNRgcy1Eb5ysjGCF21enK8uDcOVDhkDXv82g4lK
 HfttSPB3iSBZBf/N9GYf7/ao1Sg==
X-Received: by 2002:a05:600c:6989:b0:442:e9eb:1b48 with SMTP id
 5b1f17b1804b1-452014977f7mr5652195e9.24.1749152143192; 
 Thu, 05 Jun 2025 12:35:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5322ab845sm76228f8f.24.2025.06.05.12.35.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jun 2025 12:35:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/4] system: Forbid alloca()
Date: Thu,  5 Jun 2025 21:35:36 +0200
Message-ID: <20250605193540.59874-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: f2rTPvjCl/BX

Eradicate alloca() uses on system code, then enable
-Walloca to prevent new ones to creep back in.

Philippe Mathieu-Daudé (4):
  hw/gpio/pca9552: Avoid using g_newa()
  backends/tpmL Avoid using g_alloca()
  tests/unit/test-char: Avoid using g_alloca()
  buildsys: Prohibit alloca() use on system code

 meson.build                 | 4 ++++
 backends/tpm/tpm_emulator.c | 4 ++--
 hw/gpio/pca9552.c           | 2 +-
 tests/unit/test-char.c      | 3 +--
 4 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.49.0

