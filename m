Received: by 10.223.159.82 with SMTP id f18csp390135wrg;
        Thu, 30 Nov 2017 00:53:32 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaak1E4MfCWtnZPQZBDdyH+Hdo1fQeEFnJm0QR0mA9g3S5TELJkvZj7ifHdPqMM0gFWyuna
X-Received: by 10.129.65.3 with SMTP id o3mr987790ywa.105.1512032012197;
        Thu, 30 Nov 2017 00:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032012; cv=none;
        d=google.com; s=arc-20160816;
        b=HZPXYYvsvVGL/uieqlVD+JXsPAbpzQPhE81z4rs21nfY3nkdGnAv2F9cwTBfWh4yAu
         9KbiLBgAkwTr3fzJqXj7kHP7wFrkUUoP0+MiLLrEiTtk+UjiKhH580a6paFP+Ixx2/aP
         bZR271Cl+kbDGPL1hEOdkNj8Ucz1lNrXEz7yVjfCUJ60cR6AusufJiN3THJanO0ZUzK0
         2AIQIDy3EHmgh0g3kqZdUe8Qkqpp48AV9c6wK8PPWrRIElnkg2k4uyh4oSJaF4A8ncIu
         6ZhmeD3S5vJndrUE6Hi5buMha+CmVAkwgMqCWeQ+5evlLqIgMHjkGoGp/HI4xVpHnaBk
         FxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=P7ucVjxX+sYnSX52080OabnQ7pGQ9acQmtq+F9koZW4=;
        b=nwx7fwjpiVsx8vka01e3xtSdKdrORK9IWQDmRULGZR+3Jk3txAEoX0pBHOWWBPjKai
         iqux6PtvnWXlN37+BHXujzFwXn0LnukWBH9jnV2jzZaMCF0typCn9p+bmBsGhW5o1khv
         9lW7h5+tqONlssLJqBukBMAqWqVBk5ZldbeeVtxNvuXvT9iZjuv15M6WAFHcR+vIFa7+
         2TMRw+hrp6AnCQqdQf7QIOUz8wWslPafplQpcFJcPjQ4vHnv8kT3aRH5aoZDkbyB1CzX
         jwiQSxPnYrj5Ms8AvFawCdxIYpymBA3d9eXBoZy3OEhIErZqFa9rdm5IxY/vfUaTrzv6
         kkuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f187si717922ywb.266.2017.11.30.00.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKb5-0005AU-L5
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:53:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKar-0005A1-D5
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKam-0006cd-IP
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32806)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKam-0006cP-C7; Thu, 30 Nov 2017 03:53:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E0224E4C2;
	Thu, 30 Nov 2017 08:53:11 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4497F5D6A5;
	Thu, 30 Nov 2017 08:53:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:01 +0100
Message-Id: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 Nov 2017 08:53:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.12 0/7] Test more machines and TCG CPUs
 automatically
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
Cc: Anthony Green <green@moxielogic.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fIhGbGFX5mkL

During the 2.11 development cycle, a bunch of ARM boards were broken
completely, and nobody noticed it for a couple of weeks. Also a lot
of TCG CPUs do not get any test coverage at all yet (especially since
the old tests in the tests/tcg/ are still pretty much dead today).
So we really should improve our testing in this area.

This patch series now tries to improve the test coverage at least a
little bit: The second patch adds the possibility to the boot-serial
test to also load home-brew mini-kernels and firmware blobs, and the
following patches then add some tests for various boards / CPUs with
some few lines of self-made assembly.

Thomas Huth (7):
  tests/boot-serial-test: Make sure that we check the timeout regularly
  tests/boot-serial-test: Add code to allow to specify our own kernel or
    bios
  tests/boot-serial-test: Add support for the mcf5208evb board
  tests/boot-serial-test: Add tests for microblaze boards
  hw/moxie/moxiesim: Add support for loading a BIOS on moxiesim
  tests/boot-serial-test: Add a test for the moxiesim machine
  tests/boot-serial-test: Add support for the raspi2 machine

 hw/moxie/moxiesim.c      |  12 +++++-
 tests/Makefile.include   |   7 ++++
 tests/boot-serial-test.c | 106 ++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 109 insertions(+), 16 deletions(-)

-- 
1.8.3.1

