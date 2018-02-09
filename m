Received: by 10.28.71.27 with SMTP id u27csp663287wma;
        Fri, 9 Feb 2018 01:04:03 -0800 (PST)
X-Google-Smtp-Source: AH8x227hVcbZUz7q3RgxF3d2gJ2DkDoz6HIRUz7OOopJAAEhbIDd92HbPgo8i7pTvG4uzZMpeSOO
X-Received: by 10.129.175.95 with SMTP id x31mr1308166ywj.219.1518167043377;
        Fri, 09 Feb 2018 01:04:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518167043; cv=none;
        d=google.com; s=arc-20160816;
        b=IGFzB5aKXVpTVExyFWLE4zmuaBBqEi2w8afzxkepqOhNkc4H59Dis2T1Qm4bieT4tC
         EpYLFP91KV7fb/WrAlBCY32CTY0KwJH8gagohA7OUg/0DTFugpFxEI+bfzkSYNmpcdgI
         DdzOH7aFSCmuYSx8Qfxqsr7lbmg6fQZFfcXi68fw2IrofwwuNRh4NaVNZLJkViLuzCt3
         9vlbSJRi+T6RQQJvyui0IYZHfn6JWG53m9KwfeYix8H3fyTlQHOHeEzP1NNvPnH2nDjP
         evamQSCgR8XaHYjJ9rXcZyR/VsNoVHQBVFPdrHz5HipYpfEk0Ot5XKEqxYg44WmTs5Dr
         WWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=bJDblqhHPJFOM/mjUGKS4/Y+cvaBmgRkPG+mwbeXEjM=;
        b=CkKyGkRNvUYjXyz490uktpIdoNGsCReAKOvwVqpA5FrruhW0HPKZ69YgKKhj6R8Jqt
         4YUUMbgnD+pAOqQQVIFacgf3oxhlC9z4wokDJ2mpF1a9qlhTWakrpgrSEVPBJ29S5eyV
         FumanWcOpQhwB/cgT7AWZS7cb+4AigxW+fVS1oXfLV399B703lhzrnfKkpQisPuzrTr7
         E6//OXB1jXU+TiDQ/EPIRaJ+Vos/RpDgZETB5YDzq16HFDHtbkgRpHGta2KGUqjVAHUw
         lVsytbfJwQeSLZ8mOCmhaEj+LqtR+rDcvbkVXzGcdrU+BGVSb5rjRfTOfsUsSN6Pwcbh
         LFmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=slQJb8ZR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a17si338984ywh.414.2018.02.09.01.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 01:04:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=slQJb8ZR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ek4bC-0005bp-O4
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 04:04:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VR-0001KS-Co
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 03:58:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VN-0006Av-Fl
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 03:58:05 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:32825)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VN-0006AX-9f; Fri, 09 Feb 2018 03:58:01 -0500
Received: by mail-qk0-x243.google.com with SMTP id c82so9113330qka.0;
	Fri, 09 Feb 2018 00:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bJDblqhHPJFOM/mjUGKS4/Y+cvaBmgRkPG+mwbeXEjM=;
	b=slQJb8ZR2g87E9MpaeKgbcQ144RwMLII0Rkt/uRlHdd9h/NLWf/o0xdichIdQw9VvJ
	9uFYKbEJkO3vAjF3R46DK13E4BpUFhmONnosKIvIVF64L/xJ+B/haOL0INyAhRRWwV1N
	Ftvjq1ZIPToHJftYbpoq+zAj01AaSHlaONa2r8jPLG5YTbXGvNIz1EKrYW6lO525kjvI
	sDx02PLA2iiw0pUoL3r2km8N7n4pEnpdvXrrBN/xAFwPQedDkFIGkhrHfULC3PysWN/1
	F2UFh9lNT7KYET2NxN3FjX7Yl70vpb01FBA23yq+Lu+qwuzSSKb055k+Wofg678MJf+U
	9wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=bJDblqhHPJFOM/mjUGKS4/Y+cvaBmgRkPG+mwbeXEjM=;
	b=c4mJca0DioXA33MHg6GN4PdWcGxyHo5bIqwJKFSDmuJsp2uWLTSKK5W6roEAQz9pP/
	YZPgBjG4h5tTlxlTyMBECUatzrlKiY6HKGdGQtsuKuKbsW5bfGzxSxIyp+4krOe8dMzH
	J1uZuef9SnwkLSlrk5IQdhSUpqxI5ltlGMxkT1II6mJ9wDzWnXT+uL0FIRTFTu95qaSf
	sIfShcqbQkUZIud7AbX9Ddpu1WjDA87y0T0V2gEQ6jq6BPxVZP7ufwX/cFrwDyZtJ9Rh
	P2LwUwPNUe8E75ToDy/bYf2d/FzRryVG+MaBYUf1CQQTD3xZghFV5eKe2AoAJYDSemAy
	ze0A==
X-Gm-Message-State: APf1xPDwhG3Vx2m1SIA7ghE1YX2ZVhwcvzxc6wY+t18skEZb0jsizAKq
	CTSsGRNdh2fGsfnvLPD6h2g=
X-Received: by 10.55.154.195 with SMTP id c186mr2873424qke.313.1518166680636; 
	Fri, 09 Feb 2018 00:58:00 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	h195sm1363819qke.66.2018.02.09.00.57.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 00:58:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Fri,  9 Feb 2018 05:57:53 -0300
Message-Id: <20180209085755.30414-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v2 0/2] aspeed: simplify using the
 'unimplemented device'
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
X-TUID: M5YYNT5+kNQM

Since v1:
- corrected buggy UART base address (noticed by Peter)
- tested using openbmc-build provided by Andrew
- added Cédric R-b

tested with:

  $ qemu-system-arm -M romulus-bmc -m 512 \
    -drive file=image-bmc,if=mtd,format=raw -nographic

using this image:

  https://openpower.xyz/job/openbmc-build/1240/distro=ubuntu,target=romulus/artifact/deploy/images/romulus/image-bmc

(which is a good candidate for an Avocado / pyexpect test).

Philippe Mathieu-Daudé (2):
  hw/arm/aspeed: directly map the serial device to the system address
    space
  hw/arm/aspeed: simplify using the 'unimplemented device' for
    aspeed_soc.io

 include/hw/arm/aspeed_soc.h |  1 -
 hw/arm/aspeed_soc.c         | 35 +++++------------------------------
 2 files changed, 5 insertions(+), 31 deletions(-)

-- 
2.16.1

