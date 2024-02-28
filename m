Received: by 2002:a17:906:a892:b0:a44:c09:7745 with SMTP id ha18csp175666ejb;
        Wed, 28 Feb 2024 04:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1oxo4rE8ejilpMXQexdOfDrifLDPWURO/hr0tl86KUMRsMqB7n/cuL8Awrt6wkwMOS+dg8axrssRWSphWAUXW/qvft8tR
X-Google-Smtp-Source: AGHT+IEMBjjG5ejJJvXOSbxAK7ylCdvngxKFRtUSLa6lm8xrwQ3SQCcnaMhigPun1V1YQ+giXczG
X-Received: by 2002:a05:620a:45a8:b0:787:bd92:4881 with SMTP id bp40-20020a05620a45a800b00787bd924881mr6095558qkb.76.1709121806930;
        Wed, 28 Feb 2024 04:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709121806; cv=none;
        d=google.com; s=arc-20160816;
        b=JpFFast60NpD99Xm1bxcSNkPh9P6tHhK0wKQKE5/CMu6cSYHY+jkGIgdXXQ0yJ4k6u
         Ta8pYgJar0sKyjJ1eGpH39sxO9edalnofeU2NOMO6/OVZZMB+3DLdqlnNGziWl8KHQwC
         EkngvXdH9zo+3i5RLp4WLtfL/zNd/rc29vvUiKWDxk3vqcVT5gAotw+uifEn1EReE1Ar
         xFDAu6izLSae3Kr9uQl4z5ICgcYrZJ+cOltqvewspebuG5mKx273Qlq3Wp/+fGpjP6/k
         PtVvAWq0RyLEGZygILust6eBLzT/+/OSfX7RJaffpu5f8FINRyOitG6DH0bBJTfbdi3J
         t7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=81OPFLabJjQLGoGF7rqIGlf7aZpPyHQQQLV+Wf1sKSs=;
        fh=YkzlLM/B5rINvM6IVNmtbeUPm8x2JYcYDb51Z7uR+U4=;
        b=Nhaaor7gcMz9Gau05NZWpSx1tT+KcSOZ9l8p1l+Fdz9g/sqwr56PxDK6Enhvqeq/1q
         9TwNtkQeJQ3pRD6Dc/t03bJBixNu3RI0ctX9/kEnH194y61C9Gj5tTMMuHILZgQjZeRk
         SgCKIc2OjhssdaZQq/34uunRDpnKKMw88OyHpRQdLrwGQPQzd+cgeQKT8qaszGAAGfui
         bqjHpCWdzwb8mV+lP9I/NoeUTG88QmmpPnLDYsnNg1STc2eY1/L88sNMXqXDNYPuIMkP
         WjE2Xr3Xt+ttpCxHVKC0+vf0Fegc0DijG/9vRs9Mmgv0B2jjpACIU8lCBERrfVMfDJzE
         1uTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=S7nyRucm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05620a084d00b00785d846cf6asi9092549qku.393.2024.02.28.04.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 04:03:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=S7nyRucm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfIdv-00047Q-0A; Wed, 28 Feb 2024 07:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIdq-00044C-WD; Wed, 28 Feb 2024 07:02:32 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rfIdm-0002yy-61; Wed, 28 Feb 2024 07:02:29 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 7A427A06BE;
 Wed, 28 Feb 2024 13:02:23 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id a2QUqr8VwY_6; Wed, 28 Feb 2024 13:02:22 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id D6253A05ED;
 Wed, 28 Feb 2024 13:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr D6253A05ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1709121742;
 bh=81OPFLabJjQLGoGF7rqIGlf7aZpPyHQQQLV+Wf1sKSs=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=S7nyRucmrlNMYTJ71In+phBNA5pL83Gz8hXR2/V5qbS+3AyZljJnxndY3QteXZk6V
 Op5RV6DWWnPx1l7QnNEW1z6P8jS8GCv7BwuGn/b3BKugbY1MJv6DeGm65sF7GToCSV
 zdPumHBcgFhtiCeTs/NiZrMcKmrCn6dokJF6MIMA=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id ILa6BLElPGGt; Wed, 28 Feb 2024 13:02:22 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 376C2A054C;
 Wed, 28 Feb 2024 13:02:22 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/5] Add device DM163 (led driver,
 matrix colors shield & display)
Date: Wed, 28 Feb 2024 13:01:03 +0100
Message-ID: <20240228120215.277717-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
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
X-TUID: Emn9/nvPi9hT

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



Changes from v2 : Corrected typo in the Based-on message id

Changes from v1 :
- moving the DM163 from the SoC to the B-L475E-IOT01A machine
(changing config files and tests accordingly)
- restricting DM163 test to ARM & DM163 availability
- using `object_class_by_name()` to check for DM163 presence at run-time
- exporting SYSCFG inputs to the SoC (and adapting tests accordingly)

Thank you for your review Philippe :)

Based-on: 20240224105417.195674-1-ines.varhol@telecom-paris.fr
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

