Received: by 2002:a17:906:a892:b0:a44:c09:7745 with SMTP id ha18csp168495ejb;
        Wed, 28 Feb 2024 03:47:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXjMGY4w5ZyCSHSeXPosano60J4tiMYUutXjL01lA0rrUcCwrKLGrTq6tdy1ZthVgdrAoa9CrCiDeuNEta7LMm0GI1zeAS2
X-Google-Smtp-Source: AGHT+IEyqhnBOkX37/o4UQF8cJPEUEFZWzQheR+zO/1J9TCwR9ZvhDw5Zov09ktLqCuAgaHXKjin
X-Received: by 2002:a0c:cb11:0:b0:68f:d85b:13ed with SMTP id o17-20020a0ccb11000000b0068fd85b13edmr3096631qvk.0.1709120841913;
        Wed, 28 Feb 2024 03:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709120841; cv=none;
        d=google.com; s=arc-20160816;
        b=J4TaRYDI0OTgI+omvdhoohcj0R8ZPSFIwa9ketW53kfXoHkQcHu2s15noK746/FsBV
         UUIB2hpzZw/IGASt/f+s+L9s5fTPuT5ngsQ8SSSccI+A7sFsNXDRBVm11urFRBy1m2EY
         Bxjn/PKFpKo4rRLmwhYqw2d++NhMO9vSN3wnkmy2dtlr7BlvfYuPvmDH2Uuf9lRx8XSo
         WwBLVpqwP+PkF77UJH803k9h48V+GPazuDwhcfQWnaEeVYtRV/pcL8Ol8XvlIxPgceSd
         SydYMmhwnWQQ9OSyLNz1qa9u7KWrGgPIZUpqfJ49irj6m1u3pZhhUiGes0aT7elFs05l
         o8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=dPnBu8+dKbPC6ql4/GI3FJ5qa0bDJpIOeWW/cyFLSp4=;
        fh=SXEQ4uOOc3uDrzcMFkl93DTKd5A7MrL4ch0TU9ebRdg=;
        b=JkQa+xreiwkUVo75EKNXe9ogM8qjadxOAwfSBNR8aLQmAyBJFXIb9wUcKim3sRdaaJ
         zZQ8hV4OV4NZJ2sJMMZzapRyCben20uMD1NKKKKcY9wPh1f4ECPL4kODTyPUkvOG6yCV
         PEXKgwMx0iBHTqlt95Nf6/c+Ly9HybvBzETVTnaTH6/SxrhAGGS63KjWKlfbw2TAxoV5
         UigAHFRl5e8ldzPyod0+BcrFvnmUbnTi2bpujjSkICu8hnaYVhC8xPR9TkNb4M/W1cMx
         85op1+/WjXEvTu9pQ4ljbDM4eOu1rPz5VDgGCATOmD4gjjC39Vb07xCy1YaZx6nCgf32
         k6uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="3xs24gV/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn8-20020ad45d68000000b0068cbae9b4f7si9418001qvb.201.2024.02.28.03.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 03:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="3xs24gV/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfIOU-00067e-Pq; Wed, 28 Feb 2024 06:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIO6-0005sq-6j; Wed, 28 Feb 2024 06:46:19 -0500
Received: from zproxy2.enst.fr ([2001:660:330f:2::dd])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIO1-0002AA-8U; Wed, 28 Feb 2024 06:46:13 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 44002806D4;
 Wed, 28 Feb 2024 12:46:03 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id a_KiOHOQbytv; Wed, 28 Feb 2024 12:46:02 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 0969A8063C;
 Wed, 28 Feb 2024 12:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr 0969A8063C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1709120762;
 bh=dPnBu8+dKbPC6ql4/GI3FJ5qa0bDJpIOeWW/cyFLSp4=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=3xs24gV/C18TFIZOStwFI7Fbtfx+Ejh+Qoq12EgxlIj2pIAuB1i6S/SG9A3oBrXf3
 p8x/pFgJIJD0vCj9nUiJeEpnoDZVFoqcLQR3gJZmvJnwsUZv4ZpTEP4iEa1f42X/mW
 yPQ8COlai9H9OeOcC8BL8sMtj53rprohrBW2aJ7U=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id YdGviqkdIoCS; Wed, 28 Feb 2024 12:46:01 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 234E1805D9;
 Wed, 28 Feb 2024 12:46:01 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/5] Add device DM163 (led driver,
 matrix colors shield & display)
Date: Wed, 28 Feb 2024 12:31:58 +0100
Message-ID: <20240228114555.192175-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dd;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /FwqvmcTKAzD

This device implements the IM120417002 colors shield v1.1 for Arduino
(which relies on the DM163 8x3-channel led driving logic) and features
a simple display of an 8x8 RGB matrix. This color shield can be plugged
on the Arduino board (or the B-L475E-IOT01A board) to drive an 8x8
RGB led matrix. This RGB led matrix takes advantage of retinal persistanc=
e
to seemingly display different colors in each row.



I'm stuck on some issues with this implementation :

1. Tests

TLDR: how can I provide a test or an example?

I've tested the display by running custom executables and
comparing to the result on the real board, but I don't
know how to test it using a QTest.

`qtest_init_internal` sets `-display none`
so there's no way to test the display visually.

There's no `visit_type_*` for arrays so accessing the DM163
buffer to check its content is complicated. I could technically
access all the elements in the array (returning a different element
each time in the getter for example), but that seems sketchy.

2. Frame Rate

It'd be convenient to set the QEMU console's refresh rate
in order to ensure that the delay before turning off rows
(4 frames currently) isn't too short. However
`dpy_ui_info_supported(s->console)` returns false.



Changes from v1 :
- moving the DM163 from the SoC to the B-L475E-IOT01A machine
(changing config files and tests accordingly)
- restricting DM163 test to ARM & DM163 availability
- using `object_class_by_name()` to check for DM163 presence at run-time
- exporting SYSCFG inputs to the SoC (and adapting tests accordingly)

Thank you for your review Philippe :)

Based-on: 220240224105417.195674-1-ines.varhol@telecom-paris.fr
([PATCH v6 0/3] Add device STM32L4x5 GPIO)

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (5):
  hw/display : Add device DM163
  hw/arm : Pass STM32L4x5 SYSCFG gpios to STM32L4x5 SoC
  hw/arm : Create Bl475eMachineState
  hw/arm : Connect DM163 to B-L475E-IOT01A
  tests/qtest : Add testcase for DM163

 docs/system/arm/b-l475e-iot01a.rst  |   3 +-
 include/hw/display/dm163.h          |  57 +++++
 hw/arm/b-l475e-iot01a.c             | 103 ++++++++--
 hw/arm/stm32l4x5_soc.c              |   6 +-
 hw/display/dm163.c                  | 308 ++++++++++++++++++++++++++++
 tests/qtest/dm163-test.c            | 192 +++++++++++++++++
 tests/qtest/stm32l4x5_gpio-test.c   |  12 +-
 tests/qtest/stm32l4x5_syscfg-test.c |  16 +-
 hw/arm/Kconfig                      |   1 +
 hw/display/Kconfig                  |   3 +
 hw/display/meson.build              |   1 +
 hw/display/trace-events             |  13 ++
 tests/qtest/meson.build             |   5 +
 13 files changed, 690 insertions(+), 30 deletions(-)
 create mode 100644 include/hw/display/dm163.h
 create mode 100644 hw/display/dm163.c
 create mode 100644 tests/qtest/dm163-test.c

--=20
2.43.2

