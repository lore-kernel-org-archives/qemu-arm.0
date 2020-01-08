Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp920631lff;
        Wed, 8 Jan 2020 08:03:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxq9h+Apqzzl1kKcE7p5jzeVORUXViWBtwj28gqqubhXzCi8fCbc3qBkhNpWizz8du2olc8
X-Received: by 2002:a0c:e7c7:: with SMTP id c7mr4819159qvo.222.1578499402488;
        Wed, 08 Jan 2020 08:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578499402; cv=none;
        d=google.com; s=arc-20160816;
        b=oJRczcJb6DcL6o9SYliZknFPtQSSOUeeoyhf+gFVyZRS/cNPVEaeI7oFsYEThx6faF
         u7Fq5i5h8Zap8P+UzLX9wBWaiEdk+l0xWnnXtZ0YPw/XE2ojNlcpVFiofp0MXQ17Unan
         xeIf4hHKzeq/VTS/ktGQwSNAWJlPXM+qdf+hMnVbt9xSNR44wgDcmHqzkHkRNeJnXGb3
         jeoxkwgcNEXJr8+Kodxk+aYvwvpoKmhg5RNCSXvsmpy8WXXyC10ln6KM3c3E3rcpMU8r
         UcQVjixPO5/m8s2+6Ku1+GzU7ctqKukNxqQ1bDVdK7exGaq/K8tqdve++FpD3HGZPiU6
         VQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Oq08PVcgfFAqAPSQacGWuHGFNy2M1KXaS/Ob1R/Iaz8=;
        b=DWa64q+FbwD8+RQhY2YtJ0mD2N02y4Rvlw5lUSpFTscAo0AnhKpXCE85yugVLELJ3b
         ZNXsOyJ6I/YlQIdteMvppjz/Gp59DIvBc1MTR553RyvUDiQAlZ2d9YCTIQ7AGuJtMato
         Fz15fL5QwfUPl4SBhwAW/GH0HLZmIX3Mph5bSC6aOrQyOTw7VbQ6kpfGyt7re4kYAePn
         9GTAJI1hbN3f9/CE1YypQ2A7RtosPJCavPMxS/areSvcsUqPakQoaLXOWSf4UXT8dh0I
         1XpimmS3GY/rX9yKY5MQtAg4alwG8RK5api/QuQHPBpY4Y4xcIS2Z3m941Yv0lfxtxtA
         jSOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p205si1792218qke.299.2020.01.08.08.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipDnk-0005cc-S5
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 11:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnB-0005WB-F6
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnA-0001kB-FB
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:02:45 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:34921)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDn8-0001gz-1e; Wed, 08 Jan 2020 11:02:42 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M277h-1ir8Wz0iYT-002XWE; Wed, 08 Jan 2020 17:02:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Trivial branch patches
Date: Wed,  8 Jan 2020 17:02:28 +0100
Message-Id: <20200108160233.991134-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:han+nQkylqe3A/S2HyNMjDndNNoLes/6ZXbcmTOqTLGOql7VtAZ
 vFG+8g/DmLaIK00zox4v8ZHUrBHbbBi1VIZW10zTM3fTLgR4uvpL4GdyJ8N381+U4L2QREp
 kpgj3Ol/tdUHYgqTiWdjH+023REbGh+hAfkCefv/8loJmOMxsO/5y/iwtIlYhhC6CtPsW+l
 9kHo02yTnD0Sl8wR0QJjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UAiyEN2Cc2A=:FBcDX6ha6plWvQaSp6P//S
 PWh3vGUu+H2Q5WlNMT31qZiYJDzsLfrr//SEz2hXLdxNDftTeTIcW9HH0soV30Tu9xWFBW1JB
 MWZ2FZHtE3syVyRsrU3fgv3UgN+/ANmjBcKSTwdHIwwOOS5uWDhy3fjD+pHNDhRH8cfQHCIsX
 ez5bSPAn41qrcQlF9z0VQgv6OYnVHMWGvx1QMs02gn4mKYA75Jun6tZhh6cbrmmHDGoSwiw/P
 3kG4ZKbzzxLYn9XmjHjYZahnl+CuB6Xuj2PvnYD9qo+xy0JiFpCa9ploNDCgy5Dm2qflwDADt
 QJ8tMoqrh/mhlIEumuKJtgm89oJGzvNUKsp0NMCxzR0C9mZ+U9pMovfa77l70UHXiaitD0AAD
 Wp4nrH3n8KWRJaERuX/cZtBzXzXJN05/iVd5CFe/fFENZvd7wx9qpUJH7hcONVawJK/t7TXcB
 XWIXIRC2hs/qSWXIXxRD+ceY64ZkrwcykOjDv/ZSsdObQhr2FspvlArl3Znfi7Jbsn8x3NBG2
 CrNpxkxH4inNtcBCXSDHNU9ASW+a2dx83FhibVnYNxH7QKXgG68k3p4YSw953Fu4DKLf8KDHV
 UUpZldV78b4nJO6sxy3r7h2umUD8QUnJx91Y+e64mx2KAFSmTyg7rH61shDNJjXKWHtfts8O0
 xlC2kKhQ0iGHaitwSga+oTa279qKXqwK84nodunLyy6/p/a3IjT3fCMaOCluFEcRtu9uDDfcc
 Zzdxu+eX8inGtwqI4BKLK8cNjoifOzMb5E3FqAClEp8oEeeVVkjTlVTESzfsOgeeDgWkhxtXz
 qM0Hr/VYqKYGp5MGowsSQYmkNF1AkyHywm8px4VMYhwqik9rVOG5E2E+j0oaDP1Y68sBpQS46
 lPVer/PeySBo7BLO5TdUnFs1GwojAkuuld1bK7EyY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /L8R1TKarP7F

The following changes since commit 035eed4c0d257c905a556fa0f4865a0c077b4e7f:

  Merge remote-tracking branch 'remotes/vivier/tags/q800-for-5.0-pull-request' into staging (2020-01-07 17:08:21 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to adb464ff671d124010953aad48dd9194cedc6ff6:

  vl: fix memory leak in configure_accelerators (2020-01-08 16:12:39 +0100)

----------------------------------------------------------------
Fix some uninitialized variable warnings,
some memory leak warnings and update MAINTAINERS file.

----------------------------------------------------------------

Chen Qun (1):
  vl: fix memory leak in configure_accelerators

Pan Nengyuan (3):
  util/module: fix a memory leak
  nbd: fix uninitialized variable warning
  arm/translate-a64: fix uninitialized variable warning

Yuval Shaia (1):
  MAINTAINERS: Update Yuval Shaia's email address

 MAINTAINERS                |  2 +-
 nbd/server.c               | 10 +---------
 target/arm/translate-a64.c |  2 ++
 util/module.c              |  1 +
 vl.c                       |  1 +
 5 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.24.1

