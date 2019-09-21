Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp711844wrp;
        Sat, 21 Sep 2019 08:04:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCYwfeNfsHdLrvyDpTEt9FyvDGf6R/xvH4mVPka53Q5KUMdDPRRpxl6NkDBWxnV7mMkoG9
X-Received: by 2002:a1c:9c51:: with SMTP id f78mr6971887wme.144.1569078299208;
        Sat, 21 Sep 2019 08:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569078299; cv=none;
        d=google.com; s=arc-20160816;
        b=rlHaF+64gRUDjNQP/NCm1FMw7EwMshPAhr47Vc80JIJyy6D/romRBaS0XJBN3R5FuK
         gcNFwVZlrE/VH4Ri/hN+IS3p11rVF0IYfS0tQHIHUwFz8nLX/z4f1Jviag4CTLsROReb
         GIs8sX3P7QQDm6Mk2gBIKI80Byvf0NvrCXs8Qp5Pjd3kB/K3iYpslijtJYOxWy7cbgLY
         6gblueutLzr0RmFpYAO4wRNlw/IU4CJpLIuWfJ/POclPIHUL0oDPzwo5xjJpQSl3JrEx
         HayTibO9hHoFOzzo02u9axrDXiUrS4M6Im8BEBRzlyYW7A5XzRHvQ/euhu6PJjSV/zQl
         q0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from;
        bh=XWKR+GI4RANhME/sZVwF+joaD6fkq7djqJEa84ehpQ8=;
        b=VmdXuovL4OwVr89n5FoXhuemJMkR+awuvkf9RGjwzxzzoY7cYVRr0Vxc3lqsRWCYZQ
         IfRLeTzHXx50YOZp4T9EAorx8Sz5/imI9eTWzWZGlG4cyCH0Fx+FXyXSF5LS5kBos/iX
         VeZWbkpuwmjlAQitr14n6D05hXjspFNwORdKiezXmIxc66wIvk9MjTL/i5DUfFsTUUGD
         clqxDoNDoPYwvZqT5TTUt0LcFGr1lzfIgI6CFTKnjR5LCqCCpWmah4MTeWX40BGxlS4G
         8NVLNO0YAXXycQkVhaYkvCW7+UgGQlcV0x6sV1ux7vwLAG8TBncgQfr95mH5+mfNy4Ed
         sDzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si3324860edq.391.2019.09.21.08.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 08:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBgwT-0004Km-D7
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 11:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iBgw3-0004KD-Or
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 11:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iBgw1-0003Ck-EO
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 11:04:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iBgw1-0003CV-9R; Sat, 21 Sep 2019 11:04:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A54088535D;
 Sat, 21 Sep 2019 15:04:27 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2025E608A5;
 Sat, 21 Sep 2019 15:04:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/4] Make it possible to compile with CONFIG_ARM_V7M=n
Date: Sat, 21 Sep 2019 17:04:16 +0200
Message-Id: <20190921150420.30743-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Sat, 21 Sep 2019 15:04:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6oQqj9KvH3tj

We've got CONFIG_ARM_V7M, but it currently can't be disabled.
Here are some patches that should allow to disable the switch
(if the corresponding boards are disabled, too).

RFC -> v1:
 - Move the definitions into internals.h instead of cpu.h in the 1st patch
 - Instead of creating an ugly stubs file, simply make armv7m_nvic.c
   mandatory for linking.

Thomas Huth (4):
  target/arm: Make cpu_register() and set_feature() available for other
    files
  target/arm: Move cortex-m related functions to new file v7m.c
  hw/arm: Move armv7m_nvic.c to hw/arm/ and always enable it for arm
    builds
  default-configs: Do not enforce CONFIG_ARM_V7M anymore

 default-configs/arm-softmmu.mak |   3 -
 hw/arm/Makefile.objs            |   2 +
 hw/{intc => arm}/armv7m_nvic.c  |   0
 hw/arm/trace-events             |  17 +++
 hw/intc/Makefile.objs           |   1 -
 hw/intc/trace-events            |  17 ---
 target/arm/Makefile.objs        |   1 +
 target/arm/cpu.c                | 166 +--------------------------
 target/arm/cpu64.c              |  17 +--
 target/arm/internals.h          |  18 +++
 target/arm/v7m.c                | 193 ++++++++++++++++++++++++++++++++
 11 files changed, 234 insertions(+), 201 deletions(-)
 rename hw/{intc => arm}/armv7m_nvic.c (100%)
 create mode 100644 target/arm/v7m.c

-- 
2.18.1

