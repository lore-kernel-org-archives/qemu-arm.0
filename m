Received: by 10.223.159.82 with SMTP id f18csp328885wrg;
        Wed, 29 Nov 2017 23:24:47 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZyh4tRtZgdrjBakO6k+Mt9Vz4k/PMroSVcjTFUroyqjpao+Il4Pxav6dpPT/HAKCgTjgKN
X-Received: by 10.129.87.3 with SMTP id l3mr929827ywb.386.1512026686994;
        Wed, 29 Nov 2017 23:24:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512026686; cv=none;
        d=google.com; s=arc-20160816;
        b=SO1poPZm9/d6dAFEex6DyAWcRBtFMDh+81dpwrvr2rXN6N9aFtH+c3ZHxoUzh4R2kv
         4uwqeTAKPgJYzTxAUr9zMGYZC5xE7Ivk1yV70Jt0BniNlWSOb906M0LpQAo8XnmzFZkE
         aIuOSi4LD14FEZgt8xkI47o26BP19dXrnzN4RLhN/Mq//FTUZqqWK6uq5OpGOngTy+mj
         U5umGIJZyDi1UaFBrZxBM0aeP03NZBKOYr3+Ths9m7MEyGSB63TLwlQaKV9tLgmGqFCc
         cm8RaFEh25tMbhkrMk6tJGBbRxcZZ4pNoe5c9Btcd5O7sCtQVo5kU8DxHJvcnzC7MC9Q
         CAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Qbv0vygRJ2GuHGrIGjRXfeOUATpTo6SB7f8ldpIfX2c=;
        b=v0it7YA9UTMA3/QRENJT/v1aqUU6jAj/3tGG4oj+csa0TMIThcbApKn5newBVs63dD
         Tpi7v1V8xuqywz6FzzfFitPXj67yj2xOxbKcHWud5N1BiQeukVO6CowbuVFEY+eDvzXW
         55SmK8TqIHOOj6Gmp0ctNTyZqiMRu9ncOUT7J7i1FqbRS+J3qXkuiteL/ZtLZFrxYfmZ
         zxd4xADed+s5OIjsC4dPzfqlWlq0PVbAJpGOJQh35DDtTq+4g3y65iepI+Z6VTMp+Wrf
         xv4RemPQ384fyMz8DJM9esu/p8nBaaXPXYy1gKPqANUtR0hHLDwxzBh+d32zF/Ghdy4s
         1P0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X49qdG9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j133si677194ywc.803.2017.11.29.23.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Nov 2017 23:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X49qdG9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKJDC-0004GL-BK
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 02:24:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <beyond2002@gmail.com>) id 1eKJ8A-0002mA-6c
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 02:19:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <beyond2002@gmail.com>) id 1eKJ89-0004fq-C1
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 02:19:34 -0500
Received: from mail-pg0-x236.google.com ([2607:f8b0:400e:c05::236]:36987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <beyond2002@gmail.com>)
	id 1eKJ89-0004eW-5h
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 02:19:33 -0500
Received: by mail-pg0-x236.google.com with SMTP id y6so2659450pgp.4
	for <qemu-arm@nongnu.org>; Wed, 29 Nov 2017 23:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Qbv0vygRJ2GuHGrIGjRXfeOUATpTo6SB7f8ldpIfX2c=;
	b=X49qdG9sDU5+W8Mq2kzGtclF5cOf6iQLH77vLnRxGeESoutYHkMOj/ivtpFXfJGdOu
	qQNiutjtW/l3MGnsLjclmknYMdla9aZSiXYnC+3By9vjq74J+38urTdjVZpRjpvLlvix
	O1B9xSiv+icSjYTtPQBdKAVwPXKO4/X4JPYL1NaFIuZOEtAd41IidoJxluOhTK2d/kMF
	ECbmnztopwTGSj2Rm+RYTjacoaZHq+MR/TQUXPFftoLzmDNzlhYtz0Npmk6kXEEpA2X+
	heTeWT/aDL6l5SBwNYnYcilG58e6fgzFJfwW93Z9HpkBH4aiIGLnxDlLMOGiV/w+G1hY
	xupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Qbv0vygRJ2GuHGrIGjRXfeOUATpTo6SB7f8ldpIfX2c=;
	b=BUd6yk+jSdqjeKtZEnMJNxFdILigBI/0/oWYkEeLEfwAoXu2eIZ2nMqxP3poSGXooK
	ByoEn/wBjQom8OiC/evRDJ0qukq6LFYacbYHXuO77b3jEvgdKmMOVMeApO36aU427sf2
	YY+QOrEIVLnsKmWjXIxFdV+8F5QA1qqrdLwnrzluLY6nDYpwcEh+MlOXTEBErRIA6f1R
	fnnPCxK0df+U0NGjFAOUO+hQLr4bbKMcOt1xofJR3GDvdiDkfBRSbraNdiGIRnHW6m5f
	VLe7qwcv2pGt/BGawSpY/uK93hoSEk1/+2m74uepRGh/L8UqnoEDNcozdXoE72gi15NI
	CdrQ==
X-Gm-Message-State: AJaThX6Pw1tqLZlBWH4mR8ABTaPMmbtJcpFU0Ecank1654wfCqGGn9UB
	5aURdkcqNLwt8SXreZ6LrpByUG00JKVEi7rjkkTBMw==
X-Received: by 10.98.74.148 with SMTP id c20mr5683233pfj.200.1512026371552;
	Wed, 29 Nov 2017 23:19:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.187.166 with HTTP; Wed, 29 Nov 2017 23:19:30 -0800 (PST)
From: Beyond <beyond2002@gmail.com>
Date: Thu, 30 Nov 2017 15:19:30 +0800
Message-ID: <CAFdaLgCSe_1P424cSdDnjEauUPV72zs7ttXpdRSKEdfXWAXXBQ@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="001a1145ba5cc47b0c055f2e1282"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::236
X-Mailman-Approved-At: Thu, 30 Nov 2017 02:24:32 -0500
Subject: [Qemu-arm] machine virt and cpu cortex-a7 not supported?
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l8jXUl2jC7px

--001a1145ba5cc47b0c055f2e1282
Content-Type: text/plain; charset="UTF-8"

When I run QEMU with such parameters:
qemu-system-arm -M virt -cpu cortex-a7 -smp 4 -m 2G

It failed with errors:
qemu-system-arm: mach-virt: CPU type cortex-a7-arm-cpu not supported

I don't know how to emulate quad-core cortex-a7 board.
Any suggestions? Thanks!

--001a1145ba5cc47b0c055f2e1282
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When I run QEMU with such parameters:<div>qemu-system-arm =
-M virt -cpu cortex-a7 -smp 4 -m 2G<br></div><div><br></div><div>It failed =
with errors:=C2=A0</div><div>qemu-system-arm: mach-virt: CPU type cortex-a7=
-arm-cpu not supported<br></div><div><br></div><div>I don&#39;t know how to=
 emulate quad-core cortex-a7 board.</div><div>Any suggestions? Thanks!=C2=
=A0</div></div>

--001a1145ba5cc47b0c055f2e1282--
