Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3804289wrt;
        Fri, 19 Oct 2018 06:14:28 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63wZOpB75Ske69RCOA7jFqKli+OWVlAfWqOx4yFwK/R9PBScz/k5d1KRme6SAdcfCK5sosJ
X-Received: by 2002:a0c:959a:: with SMTP id s26mr34139961qvs.199.1539954868301;
        Fri, 19 Oct 2018 06:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539954868; cv=none;
        d=google.com; s=arc-20160816;
        b=EJ/VTauMigZV4G7KjtiGvIkEYgAITZ3whyrwA7QwMUJU0i9hCnLUDFIGtrKHWnivRg
         oUb4LNEFt9GyoQnYVbvToZj0ePULOFPRMwfOAYMNOjJfeNVTnY/l+jE6SClaJgQnq4xf
         mIbZlMa24f/bFqD22vVwwxepgTK5w9P3QxjhsAO/ax7j6hkYy8D4IiLcvaW3gxS5eeuq
         tfsHcYKu5cQ1GR+XDwMl44bCtddVZZmgHyvTIVIXFlb0+/TZ5K8GFcIJ1+WDluyojuaB
         8EGrrf9A63fmZ8qM+fa1eXl+BiB884qsvtWi7fRPoUb+/hX8Ulek6p09H92Z0X12sADU
         73Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=5N2Oac+sChemWp+ddSKeu4kkUNFeJA1opD2WVIAPFGM=;
        b=YM879QZG2n6AJIVKjqAyPZBGxhBNQGGYCxCmaaN2FzsDnnxy95WzOoa+YYDg8nIe4O
         e0GY2FZNGNzb9h05b+ckr3phRjGds6HFa+Sd7ZEL6CWBNWBu0V/ixLvZ/VIH2H/WyqvV
         uRM6k4edida/NZqh4B7hv91+pV8hJK2KXW+yYt2fuul0N/h/uE6o61aEfWKpp3o6YhhQ
         uAOPMldFAPg0DJHY8eD3ewC4hDdJCSIQ1J7TUxXMgLPbtDwZYQwSSr2NMey6ScpqM4er
         SRKxCXcB6WSR5rdSvtag7hZe+9xeW6au7/Jjl9jqx8Lwmf3NidiZDaOWfCJOD9ZLp9m8
         +3xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s86-v6si2139515qki.14.2018.10.19.06.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDUbj-0007rg-Kw
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:14:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbT-0007pb-Ep
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbS-0005ja-Oh
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50326)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gDUbS-0005iR-IK; Fri, 19 Oct 2018 09:14:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98AE943A33;
	Fri, 19 Oct 2018 13:14:09 +0000 (UTC)
Received: from thuth.com (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C888D612BF;
	Fri, 19 Oct 2018 13:14:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:14:00 +0200
Message-Id: <1539954845-26716-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 19 Oct 2018 13:14:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/5] Add more CONFIG switches to make the build
 more modular
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B+OFW1os0xSy

We've got many devices that can not be created directly by the user
and which are only used on some few target architectures. When the
user does not compile the corresponding qemu-softmmu-xxx target, we
should also not compile these devices. Add some CONFIG switches to
make our build system a little bit more flexible here.

Thomas Huth (5):
  configs: Add a CONFIG_OR_IRQ switch for the or-irq device
  configs: Add a CONFIG_SPLIT_IRQ switch for the split-irq device
  configs: Add a CONFIG_REGISTER switch for the "register" device
  configs: Add a CONFIG_UNIMP switch for the "unimplemented-device"
  configs: Add a CONFIG_SMC37C669 switch for the "smc37c669-superio"
    device

 default-configs/alpha-softmmu.mak      | 1 +
 default-configs/arm-softmmu.mak        | 4 ++++
 default-configs/microblaze-softmmu.mak | 1 +
 default-configs/ppc-softmmu.mak        | 1 +
 hw/core/Makefile.objs                  | 6 +++---
 hw/isa/Makefile.objs                   | 3 ++-
 hw/misc/Makefile.objs                  | 2 +-
 7 files changed, 13 insertions(+), 5 deletions(-)

-- 
1.8.3.1

