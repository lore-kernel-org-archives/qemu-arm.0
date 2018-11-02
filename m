Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1462683wro;
        Thu, 1 Nov 2018 17:17:06 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fc3FeGZ4Nz+SwNA6PBf91sFbJqlFI9KEuCwDncfgTvSfa9rc+7DZg1Ww9QA6hCY8+QFH58
X-Received: by 2002:aed:36c1:: with SMTP id f59mr1242756qtb.250.1541117826904;
        Thu, 01 Nov 2018 17:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541117826; cv=none;
        d=google.com; s=arc-20160816;
        b=J4Og2GzlTH2lzpK2hrCdQ/JSuVyER2dXN6C1vhNNHNufgR1C/bl4Csb/xkuHCeACX6
         kxLHz6HkvaEDqbwLV1CmHNp0ZMoHoZFQ2MzXJrXAesKNxZcwMesNoQbJXdwI5jHG2D/v
         u79uXmoZfefs8FUPkP4zB/v4T7ih5hrYMUTHz0bwcmje5+R5G0QIR3noWEAXHfA4hWfX
         zpFp1+BJuLhFt/z73WqHzHLTP2ApLVtqSMacavLMEA8GM8JseyGQYPpP/kfh9UG72MtL
         WAGEzjAVlNRWs75e3i6Ge1zufBzxi8nbFnwNB7/GMXRg1IpB9ism2ZAQvYFtG65grAGo
         9SDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=3fIzfciebXaRtXQKxF53ySOqNXXwcY7w4/I5QL91gg8=;
        b=FZpbVjHa3mvzE+LO2EeG1+Ex6yRjc0PRrk2lXYM91HM6SnhmLdhDLvGUkTO6fLasEM
         BOWtPIkVUIOfYE3cybRi89mKUcwlERmwNa6avvnbgzi168kRcip7ZfHyGM5kpFDmmXDT
         mzRMW1/oW+uV7jWmANFEM7Cca9VHjmb8MszLHRZEUqL2bxH1K1HwMgedYoKMmkV7u+l7
         gqg9ER+Q3frNXYIfl+IEQjaP7RyIPScByi45N231e2Yw0TydE+xQ21gWjcojRgDTryE6
         yftZhRoYYFvaHmwaLWg45kxiiiK+FtWi5g7wpmq265WkD/J3InZHehr2bd/q4jtmDf9e
         O4wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bKvDTvAc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h189-v6si3458880qkf.234.2018.11.01.17.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:17:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bKvDTvAc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIN98-0003rN-CV
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:17:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5a-0000pU-GJ
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5V-0004yp-G9
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:25 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5V-0004xq-7g; Thu, 01 Nov 2018 20:13:21 -0400
Received: by mail-wr1-x442.google.com with SMTP id z16-v6so247142wrv.2;
	Thu, 01 Nov 2018 17:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3fIzfciebXaRtXQKxF53ySOqNXXwcY7w4/I5QL91gg8=;
	b=bKvDTvAc5I+RIUNVbQ0o1cejCfjpaseegr83Nxd12UdSiaUaDENkE1L10LS6+bo7CP
	1FSH7kSNroi7ku6uGCvu1MXakjovouHNyghfsTLE9WDOLdrnKOdXFP9NJWA3OGPlZ3x9
	EGep0PS3GvWt5RqB2SPLQQFgkarIb2W83R8itqBcD1QwYGJ7+4Hzp+nPfW/xdmgPXkr5
	0ePfpW36WIi9qxcdvugYtuip38I3i8uL5nE77svgD8W/D3n/RVXrR55Clim8aP909tsK
	V9mn+/46r0zKtMRMzYojbnzmp+JpE6+P7tglDz/oO7mKtNX+7/s+9wvIMJlaF1YP2BwY
	zSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=3fIzfciebXaRtXQKxF53ySOqNXXwcY7w4/I5QL91gg8=;
	b=bg+r4FXNaFtjLAVbXAmjH0CzLqaJCSEpJRJK4UlvrvKY8QPTOEgGY7bmD0dypay0vK
	ivnRSFH3dDhcyCyM3Pqhn3p03aUT+hLAYgomaU61mKHWe7SaGToyIZdoGOxc2n5zm0Zc
	5Z+rC74d9TUtelpkjudzUqb+E13dGaBi1OPn1zbiXm/dyV4MHSf0sWnSksz+PjDojHDj
	jyUTAGLqZ9WkAWPymp0jIDPySLTFFJY7h+fysTF9KrtQJrcwLYdI3DQdOIK+6plNTXaC
	1aNAY/LZnyAIlCZjOoN72RXSpiW7iF2r5yYBVsR/Y+wbVECVMTBobWcW5RPOh0B2hSQB
	z71Q==
X-Gm-Message-State: AGRZ1gJw60yUPvbRuDV0u4bahKhMFY1HxrJCDccW+yF3tmW/tBVJEuk/
	NBE5wfdYTy+uehDIVaARey8=
X-Received: by 2002:adf:a2cc:: with SMTP id
	t12-v6mr7560500wra.100.1541117599806; 
	Thu, 01 Nov 2018 17:13:19 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:12:56 +0100
Message-Id: <20181102001303.32640-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH for 3.2 v2 0/7] hw/arm/bcm2835: Add basic
 support for cprman (clock subsystem)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eMpIfruyMFso

Hi,

This series is a mix of a previous work I had for the raspi, and a patch from
Guenter: https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg03153.html

The final patch keep Guenter ideas and comments, but is mostly a rewrite.
I dropped the A2W code from this work, it doesn't seems unuseful to me.

Guenter can you test this series?

I kept Guenter S-o-b and (C), is that OK? (Guenter?, Peter?)

- patches 1, 7: obvious updates in MAINTAINERS
- patches 3, 4: simple cleanups
- patches 2, 5: add UNIMP code
- patch 6: add the cprman (KISS init values from Guenter)

Peter: can you take patch #1 for 3.1?

Regards,

Phil.

Philippe Mathieu-Daudé (7):
  MAINTAINERS: Add an entry for the Raspberry Pi machines
  hw/misc/bcm2835_property: Handle the 'domain state' property
  hw/arm/bcm2835: Use 0x prefix for hex numbers
  hw/arm/bcm2835: Rename some definitions
  hw/arm/bcm2835: Add various unimplemented peripherals
  hw/arm/bcm2835: Add basic support for cprman (clock subsystem)
  MAINTAINERS: Volunteer to review Raspi patches

 MAINTAINERS                          |   7 +
 hw/arm/bcm2835_peripherals.c         |  42 +++-
 hw/char/bcm2835_aux.c                |   2 +-
 hw/intc/bcm2836_control.c            |   4 +-
 hw/misc/Makefile.objs                |   1 +
 hw/misc/bcm2835_cprman.c             | 277 +++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c           |   8 +-
 hw/misc/trace-events                 |   8 +
 include/hw/arm/bcm2835_peripherals.h |  11 ++
 include/hw/arm/raspi_platform.h      |   6 +-
 include/hw/misc/bcm2835_cprman.h     |  28 +++
 11 files changed, 387 insertions(+), 7 deletions(-)
 create mode 100644 hw/misc/bcm2835_cprman.c
 create mode 100644 include/hw/misc/bcm2835_cprman.h

-- 
2.17.2

