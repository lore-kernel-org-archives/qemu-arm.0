Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2867136wru;
        Fri, 20 Jul 2018 07:57:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfjE9NwxDoq8bKWbXFfrcUKJNvbmFGz5Zbijp8RsIRmLjtazufAgEuq1ia2NsgRrt6+FYW3
X-Received: by 2002:a37:8b47:: with SMTP id n68-v6mr2087788qkd.27.1532098629974;
        Fri, 20 Jul 2018 07:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532098629; cv=none;
        d=google.com; s=arc-20160816;
        b=XhAkt79pceyMbDRdhhvWDa26BE5wf8PUDbduejjzsfecgQpKuToi/juiZCwA01zHWd
         BfBpDMkMXK7fyNdIWhJ1HJhS1m8jtik8uIX9YACKhLXEllCve9RAZLOK5pQYB1UKmdHS
         eSTjcLDHcyEqV4wiDzYeP7Qq6hqltTp+RkVevrbWqtA/G0Ls86sNr9u6tXVCKJnFRcyV
         HAz2jRELI8h5lS91CWHxEvac5cx/p3OJurWmNEhxyINMc5nV/EWEcN4SUlRG8UzW0x9U
         cTfJdmsWjU6ZsQ2+/wuiiD2vSJiUKO8yAlbTWJRa52iGiTJZyzklCif8rsVWIlMvkmFy
         SyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=HuGmAKcKLNDvQg/W7JHxxGpKQ6pEYafK5BhbvbXb0Zw=;
        b=zUiHUKHXPzGIBDlzvYHBOK3rY7Al+4PLOlEBiqKDgw/nJGIlyIfTIt7T+V91i7JRkB
         37EUlWa0jQYpcaafUTiRQ1+2HDDQzrVJpzDsHPKlQWxjm774BRQMJcxXunD+E3wx4MWB
         dv/sJ9Rtkty3OLLWiuZBgrXSoeWP31wiIdjbQgTjGK+zAB9p2JDrQWNNL9QNginrxLaB
         YZDmFAOEfofPUhOg3LibJkCewYUz0mbgMcrjKzCExAPVSw5DUUaDRcfxgTYGpfF3yUv/
         UZ3gw73t9vWJBdpNwC9wjkKbbi0Wn6eML4H/3qoJEmq8uOtbnnAc8XhUfXdWjKZe5PR1
         odlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q17-v6si2162511qtf.187.2018.07.20.07.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 07:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgWqD-0000Sl-DI
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 10:57:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq1-0000SI-8o
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:56:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq0-0005zQ-Gf
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:56:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fgWq0-0005xz-8q; Fri, 20 Jul 2018 10:56:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fgWps-0004zT-Em; Fri, 20 Jul 2018 15:56:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jul 2018 15:56:43 +0100
Message-Id: <20180720145647.8810-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/4] target/arm: Implement tailchaining for M
 profile cores
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Na0677UL3Pz7

Tailchaining is an optimization in handling of exception return
for M-profile cores: if we are about to pop the exception stack
for an exception return, but there is a pending exception which
is higher priority than the priority we are returning to, then
instead of unstacking and then immediately taking the exception
and stacking registers again, we can chain to the pending
exception without unstacking and stacking.

For v6M and v7M it is IMPDEF whether tailchaining happens for pending
exceptions; for v8M this is architecturally required.  Implement it
in QEMU for all M-profile cores, since in practice v6M and v7M
hardware implementations generally do have it.

(We were already doing tailchaining for derived exceptions which
happened during exception return, like the validity checks and
stack access failures; these have always been required to be
tailchained for all versions of the architecture.)

The first few patches here do some minor cleanup and bug fixing
that I noticed while working on this; patch 4 is the actual
implementation, which turns out to be pretty trivial.

thanks
-- PMM

Peter Maydell (4):
  target/arm: Improve exception-taken logging
  target/arm: Initialize exc_secure correctly in do_v7m_exception_exit()
  target/arm: Restore M-profile CONTROL.SPSEL before any tailchaining
  target/arm: Implement tailchaining for M profile cores

 target/arm/helper.c | 47 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

-- 
2.17.1
