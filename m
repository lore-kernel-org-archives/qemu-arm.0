Received: by 10.25.205.13 with SMTP id d13csp10446781lfg;
        Fri, 6 Jan 2017 10:51:16 -0800 (PST)
X-Received: by 10.55.65.82 with SMTP id o79mr72912716qka.136.1483728676865;
        Fri, 06 Jan 2017 10:51:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si50750056qtf.321.2017.01.06.10.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 10:51:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPZbe-0004gc-6W
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 13:51:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaT-0004dm-Ho
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaQ-0006bu-EN
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:01 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cPZaQ-0006bc-7d; Fri, 06 Jan 2017 13:49:58 -0500
Received: by mail-lf0-x242.google.com with SMTP id k62so3957448lfg.0;
	Fri, 06 Jan 2017 10:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YB2IO/6CzIu+Z52Er5SgL5krnm7TPzcPFpYcdaKrHvg=;
	b=TWXgCdE9YHP+x0Nc9sEAKl5pL3ANK/J3sbvwwIROI6t0S8H4zD03SZpk70WCsQ6Jqz
	EtOd2sFgCzkbWstdY/HrALY/IBpn++8mVX7FxdBCtrqChC4kzKkcbbthfQurkj2q5j50
	gMGVn31/pW1wUbBLmG0d6z9TKXZASxdBUv6tmopk2vDMIfrS9I43x3bhurOvAUmPA7Qc
	mNqmynDG3aftqfYKZzS9S2UDELyWvwqteMO0D5wMYkckgdJRYVMtw/pzKw7Azb3eJLxc
	lz28Q0dtQW3lzeIrM14ciG9pXcDvLLAXpb3bQpWGf3ww3/QoM6/AUuB9MmVJRWWbB5Sc
	UP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YB2IO/6CzIu+Z52Er5SgL5krnm7TPzcPFpYcdaKrHvg=;
	b=fIIkVvbCQ4fw4N5OxJgGt7hqtAXkMogxNllyCtK7JkcBeYvucrxcGFD8Ul2QZMqM4Q
	3EMxDdDHEcG6YRy5HZF2Y2wE6DZXY+iNzBWJpqVDvyJDYEtbwRdFV7cPW/8esmIH4pnB
	4ghKFzyWsiPddOjLYikOIVJYOrjiBV93qdb6Bitv/xZolpgKsaMw/fPhZbbyjNHgbPOP
	I4ILK2eyqMzdPejL38UdKQ91YSr806i5Sq0FIkHAk7eWVH5XUJXdMdMzhypCt9Zy4V1A
	5tsqU5+hhwWF4WxaxfchlEchAaZ9joQ8DAP9cp//taa4q7QJE7gQytxEQV3U6yZpZPE/
	i8WQ==
X-Gm-Message-State: AIkVDXJxU5bb0yeI4nGiwpL9NeZCWw5HnsBxMkA6uSJ0IOjQedT9diEekq1U8n+VoDecOg==
X-Received: by 10.46.78.26 with SMTP id c26mr29097610ljb.46.1483728596836;
	Fri, 06 Jan 2017 10:49:56 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50]) by smtp.gmail.com with ESMTPSA id
	f42sm19448777lji.2.2017.01.06.10.49.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 10:49:56 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Fri,  6 Jan 2017 19:49:45 +0100
Message-Id: <20170106184948.3422-1-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v2 0/3] block: m25p80: Improve mt25qu01g chip
 model
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MpNbUmVQo/LO

This series introduce some improvememnt targeting mt25qu01g and adds
support for n25q00 device.

v2:
* Rework die erase command functionality. Since the number of dies
is constant per chip, new field to flash description structure has
been added (instead of dynamic code from v1).
* Add definition for n25q00.

Marcin Krzeminski (3):
  block: m25p80: Add Quad Page Program 4byte
  block: m25p80: Introduce die erase command
  block: m25p80: Improve 1GiB Micron flash definition

 hw/block/m25p80.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

-- 
2.9.3

