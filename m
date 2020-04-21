Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5085282lfm;
        Tue, 21 Apr 2020 06:19:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypK/QUBvPeoO0cCek/spTsyCoAX4SLx04jNGu7rN7ZjPCggdOq/6fBY/hMfyhUzT0WmZwngZ
X-Received: by 2002:ac8:6753:: with SMTP id n19mr21686586qtp.353.1587475187552;
        Tue, 21 Apr 2020 06:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587475187; cv=none;
        d=google.com; s=arc-20160816;
        b=U9v77Uz1hIFIYnSFnnC+a5L9PYUSpIXWkN+ub+TMnCwdMANnyNw4e4c83gYUM5EBNG
         XBVvaTlcbfKCIRz8jlx15I6++wtt57AbJZyOC953lUg3wO2DRrqV/VT0Mgkqu/ZGzUoW
         TLC5QyT9IztbrcM3PZ7JlK33ch3SnoPyeU/fzMj8WD8IV0c/gLFO8LKPbQndf/Ri6DcR
         fPIxAaIKT8UnzBe73bNhq9zZK1b5fPFDICdHgS9Upgvi8SGDdHPDc7YDObP0NXhiXwhh
         tnWStOXrKLP0TAUicDeJ9oAV1OXiZ1PFom5UU+R5n7uhawORGgq3YsVNRPk4gXPJQ0Gm
         mO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+3dL7HK3IprfglwxQAI6iAJf43RxdhDjeGz0/Y+AVYw=;
        b=yk9nQxHQvN4uLGVqQm/8TLEWd0/4zxTO6laMsmWngofdmssIWWcsLFHxIP/XBCcGIg
         RstHxXtUWZuTIrNL1ECmMnAf2a9d73t3/2AEr9ZQNUGHYmIdqL4BmmG6IyZobqIwMpVj
         er6OHRHzFw2WQ9+e7C5ox+fOURqum0h7Op0BdekBfU7qNOfBy63o2fU4+g9MAdOYiBdH
         qmCbSUMEJKJiIH8mt6dYuLHpLjeBqzLjU08PwiopXJ86gOe9TT33OYfDxlO8WksR+Mdt
         E4VLAU7UwLY7vNBcpp7LeLqUKX/Gxxjj8FGemnvpCnSc4qGOWWzORNWYSYU6qQOWAKU1
         1FTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H4R6WnOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si1445738qkk.305.2020.04.21.06.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H4R6WnOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsoU-0000vc-Va
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoL-0000vI-MN
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoK-0007Fe-GO
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43967
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jQsoK-0007De-0E
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587475174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+3dL7HK3IprfglwxQAI6iAJf43RxdhDjeGz0/Y+AVYw=;
 b=H4R6WnOqJyVAJRGD+UQfxcbDYTLct+5RcMcWVOESAClRyGE16aQnr6kxEfSmkktGDtv4SK
 +9gelKm7KrSEIl/qYLBv7U51/mIDKbM27+XCVb7IPQ58iphMI7N/gQxYxD+058x0OlFMQR
 HYpybTw3Znr0BDA9mODFlUrbISwO/VU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-_qMrddBsNhWdsKzg84yocw-1; Tue, 21 Apr 2020 09:19:30 -0400
X-MC-Unique: _qMrddBsNhWdsKzg84yocw-1
Received: by mail-wr1-f71.google.com with SMTP id j16so7453498wrw.20
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 06:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WpjSjga3RuM/g/+6VzdeggLnv5t7E2VEFN3uiqBE20A=;
 b=o4cNnC3oIso+SY9zJWg7HspIm0gqwJ1aAnFMDOFnBEOcr+jXId8+glv1+zfikyBfWx
 t42QFk0r8sSRyngJVsVeY2ygTee3rM9asnXahJBV29X5kZLGAcQoCCPSmxBtgfLURvlu
 cLw8R1QvsaH8jCMk4eJR01x/h0HtfajHVySlvorxKQbzOlRHHnnwF1J6aVh0WM6l1cBQ
 KlEvNoVn5zOTL9SFOwVru1goSNmF3PEBF1Llz1e7g/r7i7tMnFCGW6V+9uOIM8mHDHoh
 3PCvp0zwnL6w36n7uC2ZDTYPxBx+O5ODcZie5EjVMux+Uj4zNmj0leiojoAnyA6zTrZk
 0BsQ==
X-Gm-Message-State: AGi0PuYYg0U3+0D2ajdEPGf7cjGZ1kDT1CXcGnCiQW78YLib8aU2rq3M
 Uvf12yP8/M9bmACSTxZ1kT8kmcavv7XuHD71kqF8nJsUU84pnXRFF1ebk5ZOeaHykIulIoL7evI
 1D3XYWgt6DEUL
X-Received: by 2002:adf:fac8:: with SMTP id a8mr15975718wrs.311.1587475169308; 
 Tue, 21 Apr 2020 06:19:29 -0700 (PDT)
X-Received: by 2002:adf:fac8:: with SMTP id a8mr15975698wrs.311.1587475168992; 
 Tue, 21 Apr 2020 06:19:28 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id u3sm3538698wrt.93.2020.04.21.06.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:19:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/arm: Restrict TCG cpus to TCG accel
Date: Tue, 21 Apr 2020 15:19:20 +0200
Message-Id: <20200421131926.12116-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 03:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Tt1ez/JH1ey

These are the uncontroversial patches from "Support disabling
TCG on ARM (part 2)"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html

The other patches are blocked by the "accel: Allow targets to
use Kconfig" series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html

Sending this series now for review for 5.1.

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (4):
  target/arm: Restric the Address Translate write operation to TCG accel
  target/arm/cpu: Use ARRAY_SIZE() to iterate over ARMCPUInfo[]
  target/arm/cpu: Update coding style to make checkpatch.pl happy
  target/arm: Restrict TCG cpus to TCG accel

Thomas Huth (2):
  target/arm: Make set_feature() available for other files
  target/arm: Make cpu_register() available for other files

 target/arm/cpu-qom.h     |   9 +-
 target/arm/cpu.h         |  10 +
 target/arm/cpu.c         | 657 +-------------------------------------
 target/arm/cpu64.c       |  27 +-
 target/arm/cpu_tcg.c     | 663 +++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c      |  17 +
 target/arm/Makefile.objs |   1 +
 7 files changed, 708 insertions(+), 676 deletions(-)
 create mode 100644 target/arm/cpu_tcg.c

--=20
2.21.1

