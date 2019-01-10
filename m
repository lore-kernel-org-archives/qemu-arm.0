Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1615772wrt;
        Thu, 10 Jan 2019 01:41:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN42YBTegjciz/ZkEK0511HEEaNrppp6B+i27hkn4MF7v5QB5rat2sp1935gtfontETzFuiG
X-Received: by 2002:adf:83a7:: with SMTP id 36mr8431615wre.13.1547113291019;
        Thu, 10 Jan 2019 01:41:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547113291; cv=none;
        d=google.com; s=arc-20160816;
        b=DFF/v4GkbIBBoXn/JcyWwmDBWcLd6nHeU6WjhstD5YLcZJ2aTPbwXfXKez8XbriRJh
         u9dRXlM4OqEVMHy5O/iv+PCCQkeFmI7iHx7xcvVwE78fYgeZoqFjeVtMDne8JS/BuTO9
         8iJr3scSCe1DcfAhmjoHYNwG6IorG7Rb2YbEaGAN25rLH16rChvGey4tdPjvJzD/6XFg
         VNyhnmC54h4jM1uI5OzGTpc9JdgLL1J5ZTCaU+SY2PjJ0rZigzizFSbYPdYXMnw2r8q1
         c32fHCt+uiyDOyu5r2s2+Bj/PyNY4x6ddLuEatS4+KSLV4E6SZO+VMF8tGTLfzT+vGYC
         UmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=LQAaCNPw3LAKyry0i+t0jfrC7MTjAs1oYJYD1eAkZhE=;
        b=EqMQJYfKx7G5m2MTFP18ucqm37sr/A3+xMpFaz1kqUWAvJEf60jwSL4BT4YUQCxCqL
         +Vbgm0RM4vozVH7XbAaykytOAIx1qtgecT1IHKbTJLbIY+Dq2RouArw8lh2bqgTuzljQ
         w0LvVnCEz6cxS3kN7/90giqxHUh6igXOMt31+8I6d2WmIcbslAMFqKJU1EDARHBMpm6E
         eK5HkkwLEC9slsubf0QXBLjqwvWvTBG81w06ayBXW3wmIMsaPkySLIQBHUdk9IvnCfYv
         vORlKRd8qN6cADRi9f9cxLzwGZMFSeiMp9Hg8z+ywKBBTfBaNAY+mqRmsX6JeNgT+qnv
         l/Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h124si10567337wmf.39.2019.01.10.01.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 01:41:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghWqA-0000hp-3g
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 04:41:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ghWpH-0000GA-5l
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 04:40:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ghWpF-0007Vf-Nm
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 04:40:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1ghWpF-0007Ri-Gi; Thu, 10 Jan 2019 04:40:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15EF3C05B003;
	Thu, 10 Jan 2019 09:40:26 +0000 (UTC)
Received: from localhost (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37172451B;
	Thu, 10 Jan 2019 09:40:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 10 Jan 2019 09:40:18 +0000
Message-Id: <20190110094020.18354-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 10 Jan 2019 09:40:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/2] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	contrib@steffen-goertz.de, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2mEX/mRKbWDZ

v2:
 * Move stub code into a separate device [Peter]
 * Instantiate stub from microbit board instead of nRF51 SoC since this i=
s
   microbit-specific.  Other boards using the nRF51 wouldn't necessarily =
want
   to see these TWI/I2C devices.
 * Add test case

This series stubs out the microbit's TWI/I2C devices so the microbit-dal
firmware boots successfully.  The accelerometer and magnetometer are prob=
ed at
startup.  If they are not found the firmware panics.

Stefan Hajnoczi (1):
  tests/microbit-test: add TWI stub device test

Steffen G=C3=B6rtz (1):
  arm: Stub out NRF51 TWI magnetometer/accelerometer detection

 hw/i2c/Makefile.objs          |   1 +
 include/hw/arm/nrf51.h        |   2 +
 include/hw/arm/nrf51_soc.h    |   1 +
 include/hw/i2c/microbit_i2c.h |  42 +++++++++++
 hw/arm/microbit.c             |  15 ++++
 hw/i2c/microbit_i2c.c         | 127 ++++++++++++++++++++++++++++++++++
 tests/microbit-test.c         |  44 ++++++++++++
 7 files changed, 232 insertions(+)
 create mode 100644 include/hw/i2c/microbit_i2c.h
 create mode 100644 hw/i2c/microbit_i2c.c

--=20
2.20.1

