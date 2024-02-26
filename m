Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1911930ejf;
        Mon, 26 Feb 2024 00:08:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcsN62bZyhSNeGjl8kDvFQhT7BBWqKGHTn5rC2xXjs960BxByt/axxsUCwmTuI//56SI42VekGxdjY2Q2ZSBUZmYQWctg1
X-Google-Smtp-Source: AGHT+IFYif7NA0KaPsZFiG49dh5f8MKf+LpA/YJJUwq68n0FcZt5gKAsxFZivyITqEjKt3yKcY0U
X-Received: by 2002:a05:620a:4495:b0:787:c62f:3fbf with SMTP id x21-20020a05620a449500b00787c62f3fbfmr7251228qkp.31.1708934884429;
        Mon, 26 Feb 2024 00:08:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708934884; cv=none;
        d=google.com; s=arc-20160816;
        b=H+Ve3Y3lhv8Akobpg7bl10hhk+j+KJiyPI5mdm0IAdoxCgXqNN3g9x6TNQ826f4IH4
         k5cmyNO4j6IYoJxUsLYmMDDgt6cNfk8eWdOnsSjlcMG118YMNuvEhbMYEBlOwHu6QQDJ
         8+r/vt34SkDlDF7p8WMgF/UmnsUbTdGrfIj0ZtNDMKXYkfiDREYVw2H5FCjFykEUBdCJ
         4zH3y10zCDRu+mLVQ4uzAUKiBctsoU8Pb+Y+MtXIYhHEMNUtM/kkkgOJ3f7antAd9UCz
         xNOYpX+Ly57VBjJgH621O9eg3+zHdcS7iosqZaZH4KS6Q4MgLDViVwi7WhyC6VgE3xuo
         sDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QpvoCsIbtwiY1HT5bcdk+eqvDrOmo4Ep9MNjGeKLbL8=;
        fh=mjuSup+hwjtLXqK/ySKb9Dbl7jNMbqLUaLLXZTKGB0M=;
        b=G4mEmINecvPmNE287KknkhkKuw5vuNpt8caP1rdtkkZt5+3qTvh1nIP7MSch8XrZgf
         whg3BfIgYIZz52TmM2Qi8v+fYBsSxyXHA1MTbcUx6gBhbcMSMu3Fr7cf7FURdEq6aino
         0c2niDqHKwMpZYL3d1UwakBN3jS/UVG1mCKqBwv9BSHCgfpKhsMh5DrlxBYuatgz8k4I
         +hQJQMv5NXMhsrGpmTozIO8crjKULfkVpFpLE7oarfX5+m3PVnC3oIwc6i7OhJbNJVWb
         qqfGZ1Tsyv2TTbZJ1v9kUGstDnErWOeEUz6x1tL3vnxbu651EwNeo0HsC9VmKUBy3X9V
         9tPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRHjyq9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21-20020a05620a229500b00787a73a6ba1si4553424qkh.458.2024.02.26.00.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 00:08:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRHjyq9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reW0X-0004XU-6G; Mon, 26 Feb 2024 03:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0W-0004WI-5D
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:06:40 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0U-0001bb-Jv
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:06:39 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512f1c95a06so1783366e87.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 00:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708934797; x=1709539597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QpvoCsIbtwiY1HT5bcdk+eqvDrOmo4Ep9MNjGeKLbL8=;
 b=qRHjyq9OIgfdfugl3Xq2T/6C9wQ/PYGwWWXEUrz84CRdyHWO0CeHS0nyNZuU8/6l0/
 qkMa2V8Np7wxlRk/vRanLGJ8ndtYsICY4+hF+AhVY6EB/2fdg1fsa2bQnlGGLAbOfTEb
 z2TR7OqyFWiI+/+pulbYrwVSQq/fEy+teiaXaOMxyxdUw6T4l92oh3E221GlvXcuGv6D
 XqAqw+3txazo4wzWuv8VVX1ERi9Qqa/9VPean86ng55TAiidOlVA+mP82GELyJf/BZKM
 oUttJLIhK+33o27QGsmaR5a417GQqidhmnnbqI4HRPIuoCYoWVnBZ+HynYgkOxBx2SAa
 NumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708934797; x=1709539597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QpvoCsIbtwiY1HT5bcdk+eqvDrOmo4Ep9MNjGeKLbL8=;
 b=VUj12SSjmdKdu030YvBdnV16ERe6P4uuFC+l51McNDNdBSfll8Fans0RhXi4Yd3dgy
 JQYazE+sU4uoSr+mbSwrlYXGw9jH3J2i0pKf3jSsoApazx2Q9/BpjPeTazdn87M3jia/
 kCSI41y48+f1qtmEbmDgR9cCEhUW7TLTHrMGQ+qMZJRWe5UX7OGxrNXbrfLP9hO8Jmy2
 bEiEALtfIyMwFDJDhTJqdLGpPcUlGFvs8/L5leUkjVkrKzSTaCMvZ+vy5qfQ7gHDMTnw
 luh6H1YrZScUhqxOFXezsXxCDfVVQXXWm8l62P/XBm864A/HbQgyDlK+GLgh8VTSbW4k
 vkmg==
X-Gm-Message-State: AOJu0YzXQ2iyqGMK5eaSm3q4c2oJqBcQU1uyJg5P9MN/OlvNCinAnQll
 qoqf4oS7t6TOdgKbOfDk3yqeOfSRT/4rjUthWCRWkDVSSszEWqsnh6Z1lpi1LxY=
X-Received: by 2002:ac2:4145:0:b0:511:463c:32c1 with SMTP id
 c5-20020ac24145000000b00511463c32c1mr1591499lfi.19.1708934796730; 
 Mon, 26 Feb 2024 00:06:36 -0800 (PST)
Received: from m1x-phil.lan ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 o26-20020ac25b9a000000b00512e1361dacsm754030lfn.299.2024.02.26.00.06.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 00:06:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-block@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/3] hw/ide: Make "ide_internal.h" really internal
Date: Mon, 26 Feb 2024 09:06:28 +0100
Message-ID: <20240226080632.9596-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
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
X-TUID: lUvxPxuv/hLb

Missing review: 3

Since v2:
- Remove local 'ahci' variable
- Rename "ide_internal.h" -> "ide-internal.h" (Zoltan)

Since v1:
- Remove use of "ahci_internal.h" in SBSA-Ref
- Rename "internal.h" -> "ide_internal.h"

Supersedes: <20240223142633.933694E6004@zero.eik.bme.hu>

BALATON Zoltan (1):
  hw/ide: Remove last two uses of ide/internal.h outside of hw/ide/

Philippe Mathieu-Daudé (2):
  hw/arm/sbsa-ref: Do not open-code ahci_ide_create_devs()
  hw/ide: Include 'ide_internal.h' from current path

 hw/ide/ahci_internal.h                             |  2 +-
 include/hw/ide/internal.h => hw/ide/ide-internal.h |  0
 include/hw/misc/macio/macio.h                      |  2 +-
 hw/arm/sbsa-ref.c                                  | 13 ++-----------
 hw/ide/ahci.c                                      |  2 +-
 hw/ide/atapi.c                                     |  2 +-
 hw/ide/cmd646.c                                    |  2 +-
 hw/ide/core.c                                      |  2 +-
 hw/ide/ide-bus.c                                   |  2 +-
 hw/ide/ide-dev.c                                   |  2 +-
 hw/ide/ioport.c                                    |  2 +-
 hw/ide/isa.c                                       |  2 +-
 hw/ide/macio.c                                     |  2 +-
 hw/ide/microdrive.c                                |  2 +-
 hw/ide/mmio.c                                      |  2 +-
 hw/ide/pci.c                                       |  2 +-
 hw/ide/piix.c                                      |  2 +-
 hw/ide/sii3112.c                                   |  2 +-
 hw/ide/via.c                                       |  2 +-
 19 files changed, 19 insertions(+), 28 deletions(-)
 rename include/hw/ide/internal.h => hw/ide/ide-internal.h (100%)

-- 
2.41.0

