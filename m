Received: by 10.28.71.27 with SMTP id u27csp2339632wma;
        Thu, 8 Feb 2018 09:35:08 -0800 (PST)
X-Google-Smtp-Source: AH8x226OhtzDsCk2lJRvOIA3MMX7KkuO3rXreExwJzPkFgOy2w6zXxWyLR6OKSVJ7g9slzIBgRNx
X-Received: by 10.37.230.205 with SMTP id d196mr1150617ybh.326.1518111308762;
        Thu, 08 Feb 2018 09:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518111308; cv=none;
        d=google.com; s=arc-20160816;
        b=m0zdJ4zZ7zMlA1nrjY3J1a6N3WyWkbHb5xUPy6apEGkH3QMUxVFA3Yj6o0pHQwvB3o
         E5lGLcjgPv6Vg25c8y+JVMsphQyk8PmF4eYtPWDhEIYKBSPm8w3nWQ6SWYXp4CGUXf9R
         iTmzEK+Tzy3TXz+1PGNm/cSLANG87Eza6oBZKqFI2I4CnlZtuosdZq9QeLHnqiINNigY
         PHuVzJlSdDUMbSSua+RStxb0VZ8i0uPxdQPG0uXUuVexem2LuflM3p1gq0P5wVPNA8AW
         CLFDIvBEsIOXGQ0auBrwbrhkQfnsawAtBvang/3WZI50v0iQ7tiUm6POHyKvuFpM3PSA
         tAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=CF712unz81CJNSLiABzsD2QXyoE0lfFVU2uiREElnQg=;
        b=fcA46F/1yx7Zsjbm4E1CvJmMEE37QNZiDuTPYfFiCyw+dpXXaJZ47gjvzBwsjHcsmx
         yNz045poPLf9RyNCRj9kWxkEf7/M7clxh7sZmQHsKpaiiRoweljtNiU8UDlS991iiSw4
         n29oaACMn6NXXMIwV8y5adKSTo4V8aVKEUHBvOaCjPXMN7U5GkOxcMa4rirJxCywk+3+
         cBER2lON900n1bg0Z14cO2ukIqes9gQ+c96JBDFgf7Pwyr7HmMlKuolKi2aJnxv9/ZEL
         v5Z16Wd1OZVlPOV/6Wbm/dKMeX0rr1AvJLbppennBGwyWrDKIirkPbccW3CggRPYgVbN
         1SFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TCsSb2P/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s85si72959ywg.522.2018.02.08.09.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:35:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TCsSb2P/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejq6G-0005qP-5u
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:35:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptp-00033s-To
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:22:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptp-0006hO-4h
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:22:17 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptj-0006e8-RH; Thu, 08 Feb 2018 12:22:11 -0500
Received: by mail-qk0-x241.google.com with SMTP id c128so6581663qkb.4;
	Thu, 08 Feb 2018 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CF712unz81CJNSLiABzsD2QXyoE0lfFVU2uiREElnQg=;
	b=TCsSb2P/jwE09fWEgcvwludukvjmJRFYBAXVLZc71mKhG1Z4Q024LPcmOK6Ajo7b9q
	/MhyYleUTnmcmaWDl6vVQHv8/WRlr0OqjztHqqJrH8CObSYoWJvOFUDbz/b/GK69fWSb
	8LBRf2+7tHznSCR1D78cjO52gYr3XfIC7iy8IkVoK650JHO21glMLyBIRta90vDcJTzZ
	+7DqQg3wcZbEpLL3Q5xkAIP1DZujHTk7aQn9XBlN64IND4SiVzMDnc/o7b3WhMSKKyBD
	cioFuYqqm4VRe/BghJGPJhCQJvmaEOa6khprMYLC5siRxSk6bjKOTGuWY2xgVIP/ZX5d
	YZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=CF712unz81CJNSLiABzsD2QXyoE0lfFVU2uiREElnQg=;
	b=ZWaYteIb2I2F0TlL3NeO4w2vCMb03q4f6a6QKoWkP+p6UGAzo6LA/BWOK7h8Ab3FYE
	6jP47AWuJ8lB90/7xWgRmJucDRHM6W+T6M1nM77ftldDgCemNdRTFWkqyIBTYYCGOjsw
	+zjgjY15Q28Ug4cUqdANewA1D1QRFrVfTjsW+j32QypVTuVcyaXgRSqZ4DiSTAUl6cvC
	LaCh/YIt2+1Dl/vRbV9fZwlQmGUk2gIwyjshGME/INX9mKSapKiTOj9OhnB+RZmdtXJb
	8ZSVAHHRo04nCqnUZeHOwznwFDtXZrVDQLgs8o4ARUjpDgH2X5AOvsJ4bykuvV8/0rvz
	noQw==
X-Gm-Message-State: APf1xPBUBCrnLNu4R8P9ncqOj4xVNua5II8MsOjW38irCPDXxHZiZKfS
	7yyu3rMXvdxqTQN2OwoifAA=
X-Received: by 10.55.217.65 with SMTP id u62mr2192421qki.44.1518110531342;
	Thu, 08 Feb 2018 09:22:11 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id l66sm253466qkf.87.2018.02.08.09.22.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 09:22:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Thu,  8 Feb 2018 14:22:00 -0300
Message-Id: <20180208172202.9984-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH 0/2] aspeed: simplify using the 'unimplemented
 device' for aspeed_soc.io
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7SCUgN0kAVWG

The diffstat prooves it :)

Philippe Mathieu-Daudé (2):
  hw/arm/aspeed: directly map the serial device to the system address space
  hw/arm/aspeed: simplify using the 'unimplemented device' for aspeed_soc.io

 include/hw/arm/aspeed_soc.h |  1 -
 hw/arm/aspeed_soc.c         | 34 ++++------------------------------
 2 files changed, 4 insertions(+), 31 deletions(-)

-- 
2.16.1

