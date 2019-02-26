Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10720669wrx;
        Mon, 25 Feb 2019 22:07:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib9mQT3bTPnNUl9Z22Yu7MG2IaaSe2xYbmAM8eRpaU/TR7rEWsWGO0Uscg3UyyqlRijGgzN
X-Received: by 2002:a25:6890:: with SMTP id d138mr7762078ybc.18.1551161237971;
        Mon, 25 Feb 2019 22:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551161237; cv=none;
        d=google.com; s=arc-20160816;
        b=PoO7BxEAAXp/m4SOlbVF5i+DvxZ/fCJLUwrTcYJ78YNCOaWoqMNpFV3FUvG2ip7vyq
         GPf/9BGIwH4JBPNxEkJnhvVUcyXbbEHslxWDv0HoVLoG0Thd88waAHUY5VfYYXIjtlm0
         ws6WhLugTDIRk2EdAk4LZQXgkHnNPXUYAatLnilVJuD9m1UFKn0pB/RiMHYdeNDvSxB6
         F21Z62NIlUqP75ItZ2rdsyuHMyVUS4awNl6lGf1yIg8Kdxl1933v8tVl98PnNOBtFka2
         Im4TTffj4RXOehSTvZYJMW+fQIxcCH4GhcY38y8LYZt3yMMA2NhhiE0wwgG7uXYtTEqL
         q5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=nVpoN4Pbn0OgjdVWK8bMyMG5hQ9EmnQXz0Rad7T+rOM=;
        b=FLznQcG56HX3CNEB/yOU47XWeIIYH3O/Y7GQ8Bm2W49+rCpdLhtSkZmOIdtsdK+447
         U7nmh0A0RpaWdVx5jbVJwFy2RAIGE27oBDXrjjuQBH9Uca+i5YPmhb7Od/xUHFxozdKs
         42K7Q07NTfb3hHmpe8/1F9mfiWTahsoxnEZ72iaY38y1cGmuT8P8fKTcSlGMCEHmOFzb
         p8tg1vQ292HiRpmCgc27w0E5i9LuV2mjituEKd7+b/80Hg/vOvy1DHRGT0Rre3HUIt+r
         53MrEzUVx4M/gzVjyWwfCqoWI4OEF7s5r1FrQXK+jPMIap/lGGy9ye0mZzdIXIcJx1Jp
         +wFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@hexatier-com.20150623.gappssmtp.com header.s=20150623 header.b=ldAYHbXj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23si6351559ywe.367.2019.02.25.22.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 22:07:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@hexatier-com.20150623.gappssmtp.com header.s=20150623 header.b=ldAYHbXj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyVtd-0004xU-F1
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 01:07:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benny.baraz@greensql.com>) id 1gyVtW-0004vx-5P
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 01:07:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benny.baraz@greensql.com>) id 1gyVtV-0002K4-FJ
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 01:07:10 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:33760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <benny.baraz@greensql.com>)
	id 1gyVtV-0002EQ-1e
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 01:07:09 -0500
Received: by mail-qt1-x82d.google.com with SMTP id z39so13645300qtz.0
	for <qemu-arm@nongnu.org>; Mon, 25 Feb 2019 22:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hexatier-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=nVpoN4Pbn0OgjdVWK8bMyMG5hQ9EmnQXz0Rad7T+rOM=;
	b=ldAYHbXjFU3Rrz4+TNc0Weqr0Wrwenne4DI7d085qN/XcZ5fn3CjZK8CN8CmMi0wdr
	B1DdxA9QJHLmDrjjd/53MbMQ7bXv7iZDqz41IH5yAu+LRjepVx1nxDwrB97zNDKOf218
	zlRA9bYivesMUGj7107CJiQztQQcKQnYeufrWdiO79KyuHJrK+YQo47i5KH1tHQhHgnR
	K0YyrcVx/LT8knoTtyVxWxUu6kuKBaT4aoNx4LyJtCzqyheHzN642UHF+0qnffzkkDu6
	+BKAW3hQuFsCZRMvCzuaDnnltFKQsDQq79y7gzyL6prAH1FYfNywMNI+Of6VjrO5LZ5y
	8RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nVpoN4Pbn0OgjdVWK8bMyMG5hQ9EmnQXz0Rad7T+rOM=;
	b=rpy1YhArIfoWS3fi+YC+rAWGIqylPU2b6oVGQkG2hl1pwax8I9SjSDOlp+aZglPO9I
	kmCVNO8/Okr5DDo3J8f70b4CKlFnDkN/c0dg1b5UBArQ25odNbqCPyq7cgKcRVxnvygI
	rA/pqYsMHAunu7RTtXrFazWKc7+WKusLXTgiRpOlwj1uUw6IsvGHZ4yirYFh5ha5fp/0
	o+DvXHZ5ITSIWqpHm5jSR2fBhsmuf3OKVG2GSlKF8v8MnADPBfdyYJGQvvG4PYMBKLhA
	J2tq+N37x0tS1BjVltyxs5T5NUXAiMrwi3N3r7bwyzC5px0S5R27p8eEQJpB509f0YSE
	LeVg==
X-Gm-Message-State: AHQUAuYaKkyDfsNvihEF3AgD3dqH8M+454BzhTR3Ani3WlZPo34GQb+o
	GBNC819kM2tzfggcFQkO/zIp6DubKtiF2sFQuT8uypDOFZk=
X-Received: by 2002:aed:22c2:: with SMTP id q2mr17528871qtc.289.1551161212038; 
	Mon, 25 Feb 2019 22:06:52 -0800 (PST)
MIME-Version: 1.0
From: Benny Baraz <benny.baraz@hexatier.com>
Date: Tue, 26 Feb 2019 08:06:41 +0200
Message-ID: <CADdcL-_dA=xQ7dur=ZMWPVhSx=jWk=eF2GDMvp5Pt4RbrT3Lvg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000008a6170582c5dda1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82d
Subject: [Qemu-arm] QEMU host
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
X-TUID: BhtDt/Vr9SVG

--00000000000008a6170582c5dda1
Content-Type: text/plain; charset="UTF-8"

I wonder if there are restrictions on the host running QEMU emulator.

Can it run on VM (on XEN or ESX) or it has to be a physical machine?

Thank you in advance

--00000000000008a6170582c5dda1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wonder if there are restrictions on the host running QEM=
U emulator.<div><br></div><div>Can it run on VM (on XEN or ESX) or it has t=
o be a physical machine?</div><div><br></div><div>Thank you in advance</div=
><div><br></div><div><br></div></div>

--00000000000008a6170582c5dda1--
