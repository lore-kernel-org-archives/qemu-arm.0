Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp597496wru;
        Fri, 27 Jul 2018 04:39:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfga9aNyVBjX50hXdcv70xcM+ZFkBK+EawdedfHDNhWg8idPPc+wwgQxMSxI56iDlh2/7l+
X-Received: by 2002:ae9:dc43:: with SMTP id q64-v6mr5531982qkf.62.1532691560661;
        Fri, 27 Jul 2018 04:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532691560; cv=none;
        d=google.com; s=arc-20160816;
        b=wAkhpX5OsfBxpWqVmoiPw5J8UZbOeAdzMCSZAglNUnBoeYIUQkQVEFDHtjgl4wZXhx
         F77IYv+jNc8ndkjZGXSl42LLSygE7vCUBnsLYSMcCsgQMq3b6aHZaujkR3ZMnk+KMOFW
         2niJZa7gi50GQTnZotyqtjbcpxq5mx+21UWvJFN6SEPLrHrza/ETS9+MVTDE0VKndP9n
         s8Ymuyba5oCKMFdvOwFknhYG0wlSnnrFhtKnMHvDQgCAIgOvBQbsU0APfbCj6Uh5bzM6
         oYoWnR5RwoLYH3VJe651nCEeeLTVL6nsVylSCfMV0VsdqNtltxo4M5mlHnu2Nv1AsN3L
         l6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=+hvkGEKCgNXQlvQC2qg76979eCLA6cx2YCUde9JgGQg=;
        b=dMDyQpO8HW5HWQZjxy2LIw+/67tlJvBvjmPAC6gQcP1DjdTturN6OF9nofyFFEdr/i
         aAZJpw9nDz1EqNrvFtFzf6ogqzuZ0AXn7Ymknry6fFBFRNusIQ2JqPunaxxapfI5WWE/
         vZFKm8aXVTARt5nppNXtptnS35KxBgEnIkCErTcDHq4v1hOCzoI576onYh5GF8c4VfTa
         4LT5gAkgI4Mdm0DJ/ZCxosD90a8lJD6oBn60gNCV6h9PR5cah4zAUVMiA890iJ1fjkmS
         SJqgOdAX/2NXcTOnE2wyVf+IUPr26kl+PO6ZHx/BDQHvrx2BWJ4dtvili7ujKMr5wq9v
         7isg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b88-v6si3732518qkj.67.2018.07.27.04.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 04:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj15c-0006Gl-4v
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 07:39:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fj15M-0006Fx-8R
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 07:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fj15L-0004xN-IU
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 07:39:04 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fj15L-0004rg-AW; Fri, 27 Jul 2018 07:39:03 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fj15D-0002Fx-IK; Fri, 27 Jul 2018 12:38:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 12:38:52 +0100
Message-Id: <20180727113854.20283-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 0/2] MPS/v8M bug fixes
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
X-TUID: gBOFpSib449J

This patchset fixes a couple of bugs I found in the v8M
and MPS board code:
 * migration wasn't working because of an incorrect
   subsection name in the NVIC vmstate
 * the timer1 IRQ line was miswired in the iotkit

Neither of these are strictly speaking regressions
from 2.12, but because they're so simple they seem
worth getting into 3.0 (especially the first one,
which means migration of any v8M system won't work
at all.)

thanks
-- PMM

Peter Maydell (2):
  armv7m_nvic: Fix m-security subsection name
  hw/arm/iotkit: Fix IRQ number for timer1

 hw/arm/iotkit.c       | 2 +-
 hw/intc/armv7m_nvic.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

