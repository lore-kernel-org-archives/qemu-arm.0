Received: by 10.25.159.19 with SMTP id i19csp60119lfe;
        Wed, 27 Jan 2016 15:43:54 -0800 (PST)
X-Received: by 10.140.81.80 with SMTP id e74mr38842572qgd.27.1453938233995;
        Wed, 27 Jan 2016 15:43:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w19si8468494qhw.97.2016.01.27.15.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 15:43:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOZkf-0004fz-GG
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 18:43:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aOZkF-0003mZ-C8
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 18:43:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aOZkE-0006SQ-KI
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 18:43:27 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aOZk9-0006Qm-H7; Wed, 27 Jan 2016 18:43:21 -0500
Received: by mail-pa0-x242.google.com with SMTP id gi1so1049821pac.2;
	Wed, 27 Jan 2016 15:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SKmDNrd21hHw8BLRIuXoi94RonCe8a/CqaOcNxZxZL8=;
	b=w0m0sLD0fZ2oOB8uQS2LjytYZAxV/FKgOtWH0G5gc0+Sue1o5yyKoVkr6Yitj7udwL
	2OONG3JmINBTvvAXMz96FIl/6TgQ+ehiBZ0TvKHgbBgMnfGBHKClQrm9w735As8Vysgw
	J8jyTTLkVCObmDPpRySKAZ69NXd/c5oUSOe48FVuH5KRbJzjvH0qlSntKNDtts+KUCUN
	l/TwMIW5rgz2wWlaPUlkAzYSUykbo9FhmKh7J/9ob1LqbZyBsddIaBb9uGowDXsRfeq+
	i+SW0PVsatZBQAhpbGyKbjj+4SEEOXrDdnh4tYRohhFJL4AoPcCrcvbsb8sShRMuOE3d
	HRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SKmDNrd21hHw8BLRIuXoi94RonCe8a/CqaOcNxZxZL8=;
	b=JH9RL9h+7JIpVMC9ADnY1CvQ/WXIkUJhdgA0myeDZYX2Drr91A/UzumsUpK/3ApuW1
	yq/KXmfwilvrQY5cxDrAN4Tv+9Jff0k2C7xRG0HnviYqSCqGubzs0Duj7jH1GuRUTqM+
	6AycSEoW2YHUzGAdgGIf9jwn+aac4V67l/cjf6ZMOJJ2yDnDB5jPTW+L8mJLd6D47IPN
	8r/r01LrHNnZdiNzZI78L+H7nBpkfpEw0+KyFlQWEIHvOdo7Ojqch65+e+avq66va30L
	lAebFM3eySniHkHpZUBoIm23A876gSB7aYbRsIkKwPTczOosTLswVZBQ5yEZIsIulX9d
	Rhbg==
X-Gm-Message-State: AG10YOTpygaqZ3qJhiGVmBoEpptwsJStYt8nOqAbC8ePq6MA7FVFCgI7c26jW5SQmeA4oA==
X-Received: by 10.66.163.196 with SMTP id yk4mr46975217pab.115.1453938200632; 
	Wed, 27 Jan 2016 15:43:20 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	a62sm11480794pfj.40.2016.01.27.15.43.19
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 15:43:19 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 28 Jan 2016 00:42:50 +0100
Message-Id: <1453938171-13665-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: edgar.iglesias@xilinx.com, qemu-arm@nongnu.org
Subject: [Qemu-arm] [RFC 0/1] arm: Setup EL1 and EL2 in AArch64 mode for
	64bit Linux boots
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fIfmloIiOv4h

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

I've seen some regressions in my test runs lately when enabling
EL2 and EL3. It turns out we are not setting RW when booting 64bit
Linux kernels.

In the long run, I'm not sure if this does the right thing, for
example we might need to revisit if we ever want to support direct
loading of 32bit kernels on an AArch64 core.
Anyway, this fixes my testruns for now.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: Setup EL1 and EL2 in AArch64 mode for 64bit Linux boots

 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1

