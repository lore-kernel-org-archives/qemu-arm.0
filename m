Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp832794wrt;
        Fri, 25 Jan 2019 15:02:33 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7IQOit/lc8ttsZDtpMM7sAt2nobLz8hd6pMJgQeEIhmp2maQn8V9JT1mU6y1Y4FEUN3S6C
X-Received: by 2002:a7b:cb18:: with SMTP id u24mr8087394wmj.138.1548457353291;
        Fri, 25 Jan 2019 15:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548457353; cv=none;
        d=google.com; s=arc-20160816;
        b=adx+Ar2XDI3gFFkaivSMba976Xjh69ci+gh5b5AMr8vAdtFgLJ8z7h46rgjaPCTByd
         XFXp39M4NnAzd3tP6WAZgyt1hDjzrbPa7EuO9gTk5OwEOJ+zvCqqcOWWZfTp9mhJ/Xtx
         yU7yqnkTM3h0q2MbQANR3xXC94npc3sTI4ZxGo21Wot6zDxbAT0/bSYPoEQpsIsd11sd
         9OfWQwPJxncqz2PO4qUNmYHEN/oTgcM3tXF8XpiqRmBGYNBaiemZPiCqjaoLmj/UhMiP
         hhfTJJsh6DvvsvobAJ5YlcwIFcwQDO/T/b19HhLXYQkWEmdmHL6Iv0MrqZwmNVvkXVIi
         jt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:message-id:date
         :to:from;
        bh=sQCR3xSCEBDm9fprIaE09kVdPBXmsVng3UlxyBNUU0o=;
        b=dZP7Bzd1WE/ujlJFfYB9k6SaUxTKHTnpH2Bh/iYBlxGsEuHz09Hz/J/r0wq0cK58aP
         RdQ4YBxsfDMVAYKit/dLzCkwtnCDvv/ULId393An1BqihlBWXxBlUMKKltMtLVij2kJi
         EclBuT2ekex2IK11o3QJRYKh8qvkoZQLBSpjHGpqzxHfKmkXaloliqmgU+N/bPgmZDbA
         oDDMmx64foc5CTd7pYsgzGM2U2FMmayz1kHJwDM7WSRKroT/LWl2aZDyQwgNg8BUxr2W
         slTKsjUfClO7hJ0Rd7uoRNJPa3d6HwYq4YEcLA4/fEsaNP3r/owYUBR0NQ3M88G+7A1l
         dlHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si53029838wrh.224.2019.01.25.15.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:02:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnAUa-00016B-C9
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:02:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9LE-0001HC-M0
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 16:48:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9LD-0002SG-NQ
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 16:48:48 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:42966
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gn9LD-0002Mv-Ei; Fri, 25 Jan 2019 16:48:47 -0500
Received: from basile.remlab.net (dbfyyyyy6f5dmhghlbr-t-3.rev.dnainternet.fi
	[IPv6:2001:14ba:900:0:1a26:46a3:14c9:bbf])
	(Authenticated sender: remi)
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 297135FBCB;
	Fri, 25 Jan 2019 22:48:40 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Date: Fri, 25 Jan 2019 23:48:35 +0200
Message-ID: <1648289.tQCHxfjYn9@basile.remlab.net>
Organization: Remlab
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
X-Mailman-Approved-At: Fri, 25 Jan 2019 18:02:18 -0500
Subject: [Qemu-arm] [PATCH 0/3] target/arm: fix PAuth in user mode
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kqF/Lctg5bW

	Hello,

As things stand, ARMv8.3-PAuth does not work in user mode. These tiny patch=
es=20
attempt to fix that.

Br,

=2D---------------------------------------------------------------
Remi Denis-Courmont (3):
      target/arm: fix AArch64 virtual address space size
      target/arm: actually enable PAuth in user mode
      target/arm: fix decoding of B{,L}RA{A,B}

 target/arm/cpu.h           | 2 +-
 target/arm/cpu64.c         | 4 ++--
 target/arm/translate-a64.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

=2D-=20
R=C3=A9mi Denis-Courmont
http://www.remlab.net/



