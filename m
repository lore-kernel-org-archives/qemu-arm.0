Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2131721wrd;
        Tue, 21 Aug 2018 09:52:47 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZBfa4qgP3rSMOroye1Jhca6GjHcynrNxynqeeRcoz3oBBhHke1V8te8Rw77q2t+Ri4JWfP
X-Received: by 2002:a37:2990:: with SMTP id p16-v6mr12439569qkp.331.1534870366803;
        Tue, 21 Aug 2018 09:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534870366; cv=none;
        d=google.com; s=arc-20160816;
        b=FFAw4hjmQm4A2mZwxdHO8kcF3it9lYu72TIM62lUvHakW91FhrI6NuwxoHsM1TTCtJ
         IgEZzk0rJjm6DeGyHJgO2subgfwZ58+CE9kPNHxbLtjWRygwD1oJbD+QXT6NDeqq6Pbv
         FH4AdckTOW+KEYDteEnK7N8fXcBXzs8zXUMWy3/DVrGwzhgWIHJibaD3VSMNcK/8TZI3
         /VFivknZALequ4w/w+6szc62gdr5GwvjfBmZ8mE3rPyhll88mBcjAmWBykjx7oCppvZG
         H6z+nkm67AF12uE/xjfBhVLx4P8jBehPk+gpyRkt0dwKPwq1YQF3ABN350fSxJ5ERcnV
         jeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=dThV6YT07iEVQxgQP8zGrPTvynCfSY+zJZqz7p5tifE=;
        b=JA0y80K7YcoHOhnKlfZUpCsnP39m3QDOZzEc1DCJLKn9dKDdrAryiY0T3oki3leGqM
         49j/2PN27T/VUbweETIGTKKJZP+xeBD7NiZKUl0jOJJGWrcwtoKBclDqH+QAjss7TFCE
         zW8CbkvO2qZZhyqZRRV/1AD29LBKPpe7Vv4fIKUKQ6G/fTsEAn62e1oErpuFqNCajM7t
         lcIISue6SWqeGl9+103fSw4nWtxY1y8q7fcKeyF11DJzpq0o5tVts24U8gFJHGSN6ZSG
         sZ1kz3cDj+Uha/FMEGQ9TIHVZUP16CYQjFirX4sOUKFU8/zUVjocSmiQ0CqEFX0D0fI9
         t4IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p80-v6si2498567qka.200.2018.08.21.09.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 09:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs9te-0008L0-7J
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 12:52:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs9tP-0008Jf-OW
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 12:52:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs9tM-0004uw-0W
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 12:52:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs9tG-0004di-P3; Tue, 21 Aug 2018 12:52:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs9tC-0004JH-6h; Tue, 21 Aug 2018 17:52:18 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 17:52:12 +0100
Message-Id: <20180821165215.29069-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] Detabify target/arm
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
X-TUID: HSsuJGRbQ2AJ

This patchset removes hardcoded tabs from target/arm.

Normally we're generally against patches which only do style
fixups, preferring to fix up code as we need to touch it.
But in this case, almost all of the tabs are in the old
iwMMXt instruction set handling, which we have not needed
to touch in years, so the "fix as we touch it" process isn't
going to adjust them. Also, since they're changes to
barely-touched code they're not going to cause conflicts with
other work-in-progress in that area or be likely to result in
future pain trying to do stable backports of bugfixes.
So I think it's reasonable to do a bulk fixup in this case,
especially for translate.c, which is a file that sees active
development in other parts of the same file.

This isn't intended to announce an open season for
coding style fixup patches -- that is up to the individual
submaintainer and should not be done unsolicited.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Untabify translate.c
  target/arm: Untabify iwmmxt_helper.c
  target/arm: Remove a handful of stray tabs

 target/arm/cpu.h           |  16 +--
 target/arm/arm-semi.c      |   2 +-
 target/arm/iwmmxt_helper.c | 234 ++++++++++++++++++-------------------
 target/arm/translate.c     | 122 +++++++++----------
 4 files changed, 187 insertions(+), 187 deletions(-)

-- 
2.18.0

