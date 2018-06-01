Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp719964wre;
        Fri, 1 Jun 2018 07:56:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLbHj+obKqjHPoKh6E6pDtEZ+8lTe92supaI5shgEp/OWSCoP9ULfotEGR6ki0WZZ3oRWHI
X-Received: by 2002:ac8:8b8:: with SMTP id v53-v6mr11473069qth.373.1527864996061;
        Fri, 01 Jun 2018 07:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527864996; cv=none;
        d=google.com; s=arc-20160816;
        b=d54mev90O6Gm2TUW+PT6mJZADBb+4BboU1gdqC4uJJOzsz9KLtymxfupvXNBMcNhQf
         Jhel31MdHbu0zd3j4BEFBUDVKzVuuJo5Hf8Q4Glz2QAhkuzV7wbHPUzdoSNUe/c4X8RS
         Ofpj23GP5Iw+dF3YXctWT6wuVHnhuZdkS9iJtEF6Bq0XPyU4T5r5Hi0hI8Mb+Js3oBXA
         PwQKnqSZLE+/uYoKfcOf+bTLbh2qo9X3Q5KPxZwLvG9WU1GqiPSiryZJNyQeWF+NRnQt
         DFmkofhMgxkIvSgkSgiUOxI88PN7OiXKzX4oX7UY2fVn4tftp4/GxKigtFmUzW9nenMP
         o/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=UMce9Xyzs4XW629Y6lYOMz4Vrzq0XJxkm6338mM9900=;
        b=h/o2TXlonVNqE4kWdsRJGxVyZt5tMsQXCIgcTQeQr4Xw80mAQBRtjKy4wHzyVPunaN
         sG39bhKJL0fYLROviCu2ekULBiPENQgh0ObJUzStHSoQpukYvTZUYUdiODnwMGhz+7/U
         npUlQvgOiPvT3mwO8EyZ6q49PTS1Oy+YGQMQqbxbQNIVTQU2EhYoz1Y6QjRuCeVSUapV
         Hjbedxp+OAvrlTJRAabovEQ3fXXUjceVAnJnlQ7kDIwifzAlnOU6FnO80LVNe+cOCHTj
         OezU0QcRMNcuz7/4wzW0YyQYX0OmhcNh98oCCJK8admFNPqqkfVaZmm9FGKKKeaC9ZHQ
         LuwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w140-v6si2775985qkw.211.2018.06.01.07.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 07:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOlTn-00067y-GX
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 10:56:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOlTY-00066k-PE
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOlTY-0006PF-1a
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:56:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fOlTX-0006Nu-Qe; Fri, 01 Jun 2018 10:56:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fOlH7-00047J-Hw; Fri, 01 Jun 2018 15:43:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  1 Jun 2018 15:43:26 +0100
Message-Id: <20180601144328.23817-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] armv7m: Remove armv7m_init() function
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <mail@steffen-goertz.de>,
	patches@linaro.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B4AI9xb25sKF

The armv7m_init() function is a legacy from before we properly QOMified
ARMv7M, and it has some flaws:
    
 * it combines work that needs to be done by an SoC object (creating
   and initializing the TYPE_ARMV7M object) with work that needs to
   be done by the board model (setting the system up to load the ELF
   file specified with -kernel)
 * TYPE_ARMV7M creation failure is fatal, but an SoC object wants to
   arrange to propagate the failure outward
 * it uses allocate-and-create via qdev_create() whereas the current
   preferred style for SoC objects is to do creation in-place

This patchset fixes the only current caller (the stellaris board)
to not use it, and then removes the function.
    
New board and SoC models should do the two jobs this function
was doing themselves, in the right places and with whatever their
preferred style/error handling is.

(I've cc'd the people working on the nRF51 SoC model, as a heads-up
that they'll need to update their code so it compiles once this
hits master.)

thanks
-- PMM

Peter Maydell (2):
  stellaris: Stop using armv7m_init()
  hw/arm/armv7m: Remove unused armv7m_init() function

 include/hw/arm/arm.h |  8 ++------
 hw/arm/armv7m.c      | 21 ---------------------
 hw/arm/stellaris.c   | 12 ++++++++++--
 3 files changed, 12 insertions(+), 29 deletions(-)

-- 
2.17.1

