Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1133258wrt;
        Fri, 25 Jan 2019 22:47:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4QCZCyGPywA30nmL7ijMEetCBBk5wIZjyZtLgvwRjQUWPOnu6O/zLzsE78nrLW0h0ykrTb
X-Received: by 2002:a5d:410e:: with SMTP id l14mr14085122wrp.61.1548485224431;
        Fri, 25 Jan 2019 22:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548485224; cv=none;
        d=google.com; s=arc-20160816;
        b=Aa1sDYBfggWWttvDk0O1eWcUbXE7jKQlZUHtV7kdqdqd03edBg1db9pTSiyn9ZNrey
         S4P/+KDnZK5gRbmmfiTPTAie+59YE6O7xAna2fcw7CZWECAQqID0Kik16nRMT8h+rWIE
         Nw5r8hj2Maa8mBZYJ5hkXPIVCdkki8C+21nSH48kDq0AuoYTTTfhY9vu7nn2dbjQCVJb
         7zDDw2vj4+pKu2GGigQjNTTZjL0YXLAlQ94q8kSryP1Pjej54EjXNTBamfd6h7dPJcfx
         boq8nC0hrMixt0+/nUW0kDFxgK7mrR6ZoVkIa/ABy/EPhxqu/N/nIVghS4cUUJ8quTPt
         Uklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :organization:message-id:date:to:from;
        bh=0YbLCMHgBnO6HEGGbdPjMKAJZOUEUb393wmzhdjSqYU=;
        b=xINGj7tIxC3rms750MjpsOJlM4IR3eYo0HNIrm9kkT9ETqTfT43JwxuUz8bISRvKzT
         3hMANxpDwhWy+OP/8VyzAHNFF4EHeN+vGJpFJS5lmRW8AiSnNx6pO3tp8wtwOHjIK+lo
         228DKxcDvvEM6PjrugRgnsseF9pTctZYvoCIStgH37L1/Spo2qHd1GZ3nGh2YxSPrQjI
         3suMd8LIIaOylmIY+XYqAQTOfNxjidSzL8DWxhoK90FcV1phcvXIO8cZwQSagCrNpqqL
         1y242ylqd8hkpIdyphkMCTZfZKDWUd44Z/+m7UdSk9ZKiianBBODf23/C1IKvtREgohn
         MhDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si78084176wrv.58.2019.01.25.22.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 22:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnHk7-0003HH-HL
	for alex.bennee@linaro.org; Sat, 26 Jan 2019 01:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHjv-0003Gr-30
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHjt-0004LU-Th
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:46:50 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48068
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gnHjq-00047k-9w; Sat, 26 Jan 2019 01:46:48 -0500
Received: from basile.remlab.net (dbfyyyyy6f5dmhghlbr-t-3.rev.dnainternet.fi
	[IPv6:2001:14ba:900:0:1a26:46a3:14c9:bbf])
	(Authenticated sender: remi)
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 2D9835FA43;
	Sat, 26 Jan 2019 07:46:31 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sat, 26 Jan 2019 08:46:30 +0200
Message-ID: <2184988.RNmFpAbUkI@basile.remlab.net>
Organization: Remlab
In-Reply-To: <1738864.GFcTaivyIR@basile.remlab.net>
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<02a680e1-c20c-2ecb-2926-6250fddf9e76@linaro.org>
	<1738864.GFcTaivyIR@basile.remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] target/arm: fix AArch64
 virtual address space size
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
X-TUID: ORsOPZjrJbes

Le lauantaina 26. tammikuuta 2019, 8.36.00 EET R=C3=A9mi Denis-Courmont a =
=C3=A9crit :
> I believe that TARGET_PHYS_ADDR_SPACE_BITS could be reduced to 56 bits.
> Anything less would presumably break handling of the address "sign" bit 5=
5.

Err, sorry. That is already 48 bits and that is the correct value of course=
=2E=20
There is no sign bit in physical address space.

=2D-=20
=E3=83=AC=E3=83=9F=E3=83=BB=E3=83=87=E3=83=8B-=E3=82=AF=E3=83=BC=E3=83=AB=
=E3=83=A2=E3=83=B3
http://www.remlab.net/



