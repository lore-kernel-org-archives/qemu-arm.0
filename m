Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp918652wrv;
        Fri, 12 Jul 2019 06:39:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmQaEPZ9fcNVkxj/CO375A2P62Kuf4W0JAj98T0kXsvczL+XHOdTMKFwDZJP04LKcoJW0X
X-Received: by 2002:aa7:c3d8:: with SMTP id l24mr9605752edr.58.1562938787963;
        Fri, 12 Jul 2019 06:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938787; cv=none;
        d=google.com; s=arc-20160816;
        b=uG5YqxB5lYr4HErM6JuGZkD7+nksQyod/6hhKv7FrPt81a67pV3rigotWU8U/KqvjC
         viWtgvWgSvEc4ovo60grlVvzpoqxPad6zKg5UP8LlsEY23jzjB+YZQ0JiHreUhYlIlQV
         ADdXnudav/FA7F7cQX00z5PAZLbQGhdgtey4Hc4zBLfgLTvU+95dmNvURXNJOrBS9pBI
         Enjk8SOplpsYzbEahAPraUeX1aOvZGRQm1jecjJkhK0k5GQsfIbyltVj4gG2+i/D41vb
         Q/FHN55ecLCQEn552KhYt0+UQiZ0Gm0ny6ifWHEDPupDDEIWx+0YHjBpPcEGidTvg2bS
         h5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=YkBrVx7mjAdPdMosOOY2jjzWlEH75SXgMUaGCaKHurw=;
        b=FTKcUffomceyLidbnoefbg6QEqfbURqVFtmA2Ee6mUNw9ehIKCVJ4yuvdOjXG8WNPw
         0y3cT4WP9ue2Pk6gKeHiRI8qyAqf477+CIsUTEG1BILeGankcliGfu3hjW0C1W3WSxvG
         +j+9f5oOF055Xs0W2F2qE4IPTJ+kY3a1TD229sdXklkjI0q3XVjw2imz+N603FSedz8i
         hUyOidpbTceR9jYVMQcMHyS5GNH8lPkqgMcjp/dXxPa2T1V34ViDHxACoNAtF2V0DDG+
         t72jtPn9c9Mrt1dX2MPoyAVoGYhqgZouL1HDI1JQRbWBXFIdAzRt2DAKIDU9KhYvCBIQ
         vHnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si5702731edd.121.2019.07.12.06.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvm6-0003pu-Sk
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57317)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvm2-0003oB-Px
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvm0-00063M-T2
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvm0-0005zJ-NE; Fri, 12 Jul 2019 09:39:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1620D308FC4B;
 Fri, 12 Jul 2019 13:39:39 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3B9019C67;
 Fri, 12 Jul 2019 13:39:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:21 +0200
Message-Id: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 12 Jul 2019 13:39:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1? 0/7] vl: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FF5J0uZMNrtV

A series of obvious patches to build without the deprecated
bluetooth devices. Still worth for 4.1 or too late?
It is clearly not a bugfix.

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (7):
  hw/arm: Nokia N-series tablet requires Bluetooth
  hw/usb: Bluetooth HCI USB depends on USB & BLUETOOTH
  MAINTAINERS: Add a Bluetooth entry
  vl: Fix 'braces' coding style issues
  vl: Use qemu_strtoi() instead of strtol()
  vl: Extract bt_parse() into its own file
  hw/bt: Allow building with CONFIG_BLUETOOTH disabled

 MAINTAINERS         |   7 +++
 Makefile.objs       |   3 +-
 bt-opts.c           | 140 ++++++++++++++++++++++++++++++++++++++++++++
 bt-stubs.c          |  18 ++++++
 hw/arm/Kconfig      |   1 +
 hw/bt/Makefile.objs |   4 +-
 hw/usb/Kconfig      |   2 +-
 include/sysemu/bt.h |   3 +
 vl.c                | 121 --------------------------------------
 9 files changed, 174 insertions(+), 125 deletions(-)
 create mode 100644 bt-opts.c
 create mode 100644 bt-stubs.c

--=20
2.20.1

