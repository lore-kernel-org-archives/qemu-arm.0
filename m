Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3835575lfg;
        Wed, 26 Feb 2020 18:35:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/j7p35vMkGqMiiO2ATaM8VYiuwMz5wkY9z0xwwoN2/UoDyNZssysJju7kKfOB2/Pl1JUY
X-Received: by 2002:a05:620a:15f4:: with SMTP id p20mr2453485qkm.272.1582770947493;
        Wed, 26 Feb 2020 18:35:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582770947; cv=none;
        d=google.com; s=arc-20160816;
        b=PCdk94vqyrxI6OGA+yNXdBTHDVhb4p7tRmT/T2KeSG09CYLDG5zFwIudNeeeDweu55
         dAl1h89wEhYqExduxlbJexbdtx0ZZbTz/hKSae2zWm2OoZ4WpmC1j2HuRuuSDXVKuyAv
         Hr3mtGP9g1+Z34CJsDL2d2yX6EKSPn+fMnwZm1V3u5nb+R5Kj1c4z4RdmFUGfQaQd0oK
         1G7Ir+6YySvWtSUdR1zhNfSe487Q/eUqo/tUGe80A8jZpYenY7047gLQHvTwJAXjKojQ
         qalTo5vevQz7y+IClqtAc3mcFYvbqkS+SKGViLc/R7ca5OF2OSoJxy2uUPoJKGjKNcLE
         2FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=3LcDXgceVNisdaTcuqXxC+eeR9uWhy9s+fxASSuY6AM=;
        b=y3vL5c8dVL6nYpL6Trs2vzrjqh6Qs6Wmv0xb7ZjwmOclWAXVRtMcBl3Mx0h3BINUOc
         JQMfFo2Z//5MqnUW/pNaTImRG13q01H40RJF/HXiYio0aK8RKVa6c8E2Oz1WVYn03QMi
         UWFmEGgmbaY5uS575AIhY+cqd8uUARdLxKNB7H+pGrmcwC9DXO3mQYXbNu2g6eUoVc3e
         cgjMbmEyBl4QAgM/AyQQPcLeZIGgLD1MMurVnBiahb61Z3754LHYFrhGmXUhXxtrBNpJ
         faaNGUBWvGsbJ3vXApYXdeiJW1Y5TIAIG2EzL5hTVJuYlvdR+RrPB2b3DLChs9mAw/jX
         TTMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si709492qki.109.2020.02.26.18.35.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 18:35:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j791d-0007wm-TC
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 21:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j791O-0007wF-Oe
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j791N-0001UK-Jc
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:30 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:52400 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j791N-0001F8-7W; Wed, 26 Feb 2020 21:35:29 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 71FF85D8E690F1870F94;
 Thu, 27 Feb 2020 10:35:21 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 10:35:14 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v3 0/6] delay timer_new from init to realize to fix memleaks.
Date: Thu, 27 Feb 2020 10:50:49 +0800
Message-ID: <20200227025055.14341-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: euler.robot@huawei.com, qemu-arm@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /yawjRe8IDg6

This series delay timer_new from init into realize to avoid memleaks when=
 we call 'device_list_properties'.
And do timer_free only in s390x_cpu_finalize because it's hotplugable. Ho=
wever, It's not valid in mos6522
if we move timer_new from init to realize, because it's never called at a=
ll. So we also add calls to mos6522_realize()
in mac_via_realize to make this move to be valid.

v1:
   - Delay timer_new() from init() to realize() to fix memleaks.
v2:
   - Similarly to other cleanups, move timer_new into realize in target/s=
390x/cpu.c (Suggested by Philippe Mathieu-Daud=C3=A9).
   - Send these two patches as a series instead of send each as a single =
patch but with wrong subject in v1.
v3:
   - It's not valid in mos6522 if we move timer_new from init to realize,=
 because it's never called at all.
     Thus, we remove null check in reset, and add calls to mos6522_realiz=
e() in mac_via_realize to make this move to be valid.
   - split patch by device to make it more clear.

Pan Nengyuan (6):
  s390x: fix memleaks in cpu_finalize
  hw/arm/pxa2xx: move timer_new from init() into realize() to avoid
    memleaks
  hw/arm/spitz: move timer_new from init() into realize() to avoid
    memleaks
  hw/arm/strongarm: move timer_new from init() into realize() to avoid
    memleaks
  hw/misc/mos6522: move timer_new from init() into realize() to avoid
    memleaks
  hw/timer/cadence_ttc: move timer_new from init() into realize() to
    avoid memleaks

 hw/arm/pxa2xx.c        | 17 +++++++++++------
 hw/arm/spitz.c         |  8 +++++++-
 hw/arm/strongarm.c     | 18 ++++++++++++------
 hw/misc/mac_via.c      |  5 +++++
 hw/misc/mos6522.c      |  6 ++++++
 hw/timer/cadence_ttc.c | 16 +++++++++++-----
 target/s390x/cpu.c     | 22 ++++++++++++++++++----
 7 files changed, 70 insertions(+), 22 deletions(-)

--=20
2.18.2

