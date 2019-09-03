Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp651059wrp;
        Tue, 3 Sep 2019 09:11:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxprbHTkkg7nDc2PdOoWS8AcpeIuHXffbfJV+j7nyqwPgb3SlRKTyUygk6qlJ2a0tsmk3Nm
X-Received: by 2002:a50:f5ab:: with SMTP id u40mr15143764edm.90.1567527087356;
        Tue, 03 Sep 2019 09:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567527087; cv=none;
        d=google.com; s=arc-20160816;
        b=iEloIaYZHnz93i/PTvp7DZRWZ72dOicldT4LvhbVgXKiDV3B7KzNqwQTC0aqqIUxGM
         PKUiwcgbX8EtMhDDqQIjd79drUB5LZXTUYN3ULZnri2cthoQLyLfL1hONGKNMMTboD6X
         EF6aPnjREARF+ujeqdYBwCqPsWxbWcDCsM728A3csuWn6O6ZKYyTbTbiwhFcXp4R1Irs
         jraiqJTPi9dXvH7XIxKD5GesZyE0vbIrM6WKGUxaluKleNgwfXccqQhGdlhJDuVtD6AJ
         ROI72VzjVVcC8R6Q341+jGKw/yHNE2jpWFekLDQlXEMAYIcP+oSwZeiSZTdPCZPS9TxR
         0iSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=0Pouik+jnCs2utlXxoyxAck603y8TgwWCyrVzUJ9xNE=;
        b=Ux3eUAMPKHvgrVz5qAVMO2oBm6jDg84C1nEymxD9SGhooxgcqAJByBRK0Y4URuw/QD
         PfuznH/srLQEkZWeK+PX+HppXNQszhwnTzjmwhHe4seakaqUJacKBdY1BF4tY5e7Xvq0
         1vXfaf9kyLcL68v005pEEKcZlyciGum9rIFTGZ+EL2xKIWhTuwX4RvOc5vQcDDKADLFz
         84QJezXYgOrhv4QTVweIEp59UYDEvlEbN2PP0Qtd7loTM5HgUlolCATu50KNCvWITvvx
         WYZ1xddA1t/LtIQFo1tIUwMMxxf0nwqfIASwv3ngGGsV5Q5o3uNcf8kXg6Vzfl4DJyw4
         2oQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t57si7221887edb.0.2019.09.03.09.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 09:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5BOv-0003S7-Sr
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 12:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5B2d-0004p3-2m
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 11:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5B2a-0005Qm-BC
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 11:48:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23881)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1i5B2Y-0005Oq-EB; Tue, 03 Sep 2019 11:48:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E443D3175289;
 Tue,  3 Sep 2019 15:48:16 +0000 (UTC)
Received: from thuth.com (ovpn-117-51.ams2.redhat.com [10.36.117.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F6BC19D7A;
 Tue,  3 Sep 2019 15:48:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue,  3 Sep 2019 17:48:07 +0200
Message-Id: <20190903154810.27365-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 03 Sep 2019 15:48:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC PATCH 0/3] Make it possible to compile with
 CONFIG_ARM_V7M=n
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aTzfjAuQSbSB

We've got CONFIG_ARM_V7M, but it currently can't be disabled.
Here are some patches that should allow to disable the switch
(if the corresponding boards are disabled, too).

I'm mainly posting this patches for Philippe and his current TCG-disablement
work, maybe some of this is useful for him, too. I've marked the patches
as RFC since they are hardly tested.

Thomas Huth (3):
  target/arm: Make cpu_register() and set_feature() available for other
    files
  target/arm: Move cortex-m related functions to m_helper.c
  target/arm: Make m_helper.c optional via CONFIG_ARM_V7M

 target/arm/Makefile.objs   |   3 +-
 target/arm/cpu.c           | 166 +------------------------------------
 target/arm/cpu.h           |  18 ++++
 target/arm/cpu64.c         |  16 ----
 target/arm/m_helper-stub.c |  58 +++++++++++++
 target/arm/m_helper.c      | 164 ++++++++++++++++++++++++++++++++++++
 6 files changed, 244 insertions(+), 181 deletions(-)
 create mode 100644 target/arm/m_helper-stub.c

-- 
2.18.1

