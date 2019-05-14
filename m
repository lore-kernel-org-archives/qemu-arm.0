Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3806838wrg;
        Tue, 14 May 2019 03:00:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbYUJ86ePNezmUQq5nhM3cwTjeq3C+dNpIFnLLUAzTFovpCVr3ETwP7+sL1jchH0OuES7R
X-Received: by 2002:a50:95b0:: with SMTP id w45mr35276134eda.221.1557828054968;
        Tue, 14 May 2019 03:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828054; cv=none;
        d=google.com; s=arc-20160816;
        b=pI6uk8B9fOEXWDoYlAQkd/W9iVPxPyUWgJBcWlgRgItQxFZW7qgCodktTxjuyBJeHc
         qz2EIGDse3QEMGmr19dSNqYxF95yRO0XPjUsORMK7OyChfRf9Ftn/J/khGIPSKOtjvcQ
         H895yl58ylTMT7oI2YwLjZLVn5l1qfNps7y3g+fsLSMeVFKMK6++J6J+IaoIp6HhCrgg
         gxtTEkPNYfE8AaTpFIbpG0i9IGMEmoW0QJzX5OHn9LY4ABYYUQGobcRxJj2l33gfSwXR
         dhKo03vyO7FuYdi6+SnKrMCfEarAH3zij3RBG4QjULabcBfUNRg8ys6mlCuBHTj35EDP
         +4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=PKMb4WyZT8VYf93tl1OOLr+2k06ufsO5g64/amSOomo=;
        b=YC1lzISfEyzpMQ59aIksdtw42PEYt3SbcGk0zxiq9azEkvR9gHyGqQsZjWVb9EON/D
         u+UQghWU/3DP2aqcB2/VEOMAfhx2CJbyU/S972AyCdwnT2GKfEwXmNIoc/dM9Qg6ZdMK
         EfzjjUagnVlOawfcRpgPmp3gAbmguZdLvnmxN6hRvugHThZQVPdelUmXSEoDdUiDA2Hq
         OCX3vkPdJLQLLP8vjTM2b7lAcCh7vDA2rOiztafqDjpx6lIYec2nT9ye0zMn9EzKLEzs
         M8za1Siah4DPlIefZA2CoqjhjS/yURGJn2f+9+BmohpNYt4ymf7kM6r2Y5WG4itzZmaK
         mIXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si2195641ejs.241.2019.05.14.03.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:00:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUEw-0006WM-2a
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:00:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEd-0006SG-3K
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEY-0003MW-Ae
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQUEY-0003EK-4j; Tue, 14 May 2019 06:00:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51CCB308A963;
	Tue, 14 May 2019 10:00:27 +0000 (UTC)
Received: from thuth.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDBB85C207;
	Tue, 14 May 2019 10:00:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:00:15 +0200
Message-Id: <20190514100019.13263-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 14 May 2019 10:00:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/4] Kconfig switches for core / misc devices
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BMUhCwQrqzw8

Here are some more Kconfig patches that introduce proper config
switches for some devices in the hw/core and hw/misc directories.

Thomas Huth (4):
  hw/core: Add a config switch for the "register" device
  hw/core: Add a config switch for the "or-irq" device
  hw/core: Add a config switch for the "split-irq" device
  hw/misc: Add a config switch for the "unimplemented" device

 hw/arm/Kconfig        | 12 ++++++++++++
 hw/core/Kconfig       |  9 +++++++++
 hw/core/Makefile.objs |  6 +++---
 hw/dma/Kconfig        |  1 +
 hw/microblaze/Kconfig |  1 +
 hw/misc/Kconfig       |  3 +++
 hw/misc/Makefile.objs |  2 +-
 hw/pci-host/Kconfig   |  3 ++-
 hw/sparc64/Kconfig    |  1 +
 hw/timer/Kconfig      |  1 +
 10 files changed, 34 insertions(+), 5 deletions(-)

--=20
2.21.0

