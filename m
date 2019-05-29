Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp9344559pjq;
        Wed, 29 May 2019 07:03:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyk/mvopB003+LK7QAXtTawf7WbdwiPy6pH0xOEHPaB00g6S326lMvzee9rlt1gzAkfAzTH
X-Received: by 2002:a0c:ad02:: with SMTP id u2mr63344108qvc.90.1559138586001;
        Wed, 29 May 2019 07:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559138585; cv=none;
        d=google.com; s=arc-20160816;
        b=clKAKiqK3uGHpHq34OS3ijfr5pgQ7HPhEbCAz/z7J9+jE58PHukNij4GCd0CLrHuq4
         yVegxS+7WUh1IUCm8aP7ndHY9jpZrcPo9YHsAls1gg6tApT8ZvmWD9HQoLcIADQ227GF
         sVmfDGZWAFayeWUyu3agB41n9INS/51vZbfIrRLENkugM2VCr84EXEeecEVMYXBBAFIQ
         lqxdvHkjj5yHEHY4iH0Ldui+e9Ezd7wlB6Hkd7yN0t+WTwfGIh4JZzPZjbEj3jN/T07P
         OtIl5OwdvA1WHo41i7g8rjwmuFbIlDcLWrcHYotJqK3xZKqyWCE6/RcY15N8VdK5Qoeb
         Fw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=hNpxpLQm/tgWAYyZuZ+M61bpEgEWvcxEEJq6nRK4tzw=;
        b=fOc/OK2jAxiLxfdH6eizt+ivbLNZHQ2L2NG+uscXVeXqs3qGsJE1F2oWtMGv6cqHsd
         Z7KKrhLVvYuR32b1H4poqXCGhczWRV1oOrz1Gv6TvOOdj+06kOu9X1CgMfoswrKtLRbM
         8XCFQM/UxD3oGytg3GY/bcmZ6lOkaB+G14lEdZkm+iVSJbwQwqJGZzhxGC+ol8O+eAIt
         zl40oFeU4Wa3eRy1zb+oSbliK5u4A75I/Rib8ZG342FrYqtSxNLJXIL27zrYdURBIFFa
         74Wg5NZ7vY+YNuYIz4GesV/Nc84HdGIr6FHf0XoVXY8ILOKISt6/d0IbXTdl1ZR90mGP
         nG1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si2343076qkl.59.2019.05.29.07.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 May 2019 07:03:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVzAX-0000Hj-Em
	for alex.bennee@linaro.org; Wed, 29 May 2019 10:03:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVzA3-000084-AE
	for qemu-arm@nongnu.org; Wed, 29 May 2019 10:02:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVzA2-0003BY-8q
	for qemu-arm@nongnu.org; Wed, 29 May 2019 10:02:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hVzA2-00030e-3m; Wed, 29 May 2019 10:02:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B9BFB0AA6;
	Wed, 29 May 2019 14:02:12 +0000 (UTC)
Received: from x1w.bcn.redhat.com (unknown [10.32.224.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ECA32CFE2;
	Wed, 29 May 2019 14:02:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <claudio.fontana@gmail.com>
Date: Wed, 29 May 2019 16:02:07 +0200
Message-Id: <20190529140207.20719-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 29 May 2019 14:02:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Remove bouncing email in AArch64
 target
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aVos2lNubGXK

Claudio Fontana's email at Huawei is bouncing: remove it.

    From: Mail Delivery Subsystem <mailer-daemon@googlemail.com>
    Auto-Submitted: auto-replied
    Subject: Delivery Status Notification (Failure)
    X-Failed-Recipients: claudio.fontana@huawei.com
    ** Address not found **
    Your message wasn't delivered to claudio.fontana@huawei.com because t=
he address couldn't be found, or is unable to receive mail.

Note that the section still contains his personal email.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f5f8b7a2c..5ed917329d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2290,7 +2290,6 @@ S: Maintained
 F: tcg/
=20
 AArch64 target
-M: Claudio Fontana <claudio.fontana@huawei.com>
 M: Claudio Fontana <claudio.fontana@gmail.com>
 S: Maintained
 L: qemu-arm@nongnu.org
--=20
2.20.1

