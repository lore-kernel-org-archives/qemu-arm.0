Received: by 10.25.21.156 with SMTP id 28csp1233096lfv;
        Thu, 4 Aug 2016 05:16:42 -0700 (PDT)
X-Received: by 10.237.44.195 with SMTP id g61mr5915432qtd.105.1470313002080;
        Thu, 04 Aug 2016 05:16:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u65si5445330qkd.117.2016.08.04.05.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Aug 2016 05:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVHZp-00071R-GY
	for alex.bennee@linaro.org; Thu, 04 Aug 2016 08:16:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bVHZf-0006ye-O9
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 08:16:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bVHZa-00051h-U0
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 08:16:31 -0400
Received: from mx5-phx2.redhat.com ([209.132.183.37]:42726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bVHZQ-00050j-29; Thu, 04 Aug 2016 08:16:16 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx5-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u74CGAfv034789;
	Thu, 4 Aug 2016 08:16:10 -0400
Date: Thu, 4 Aug 2016 08:16:10 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Message-ID: <1648819381.13532219.1470312970610.JavaMail.zimbra@redhat.com>
In-Reply-To: <CALicx6uuXv=Vnt_H6P2=5EKVAC80Tp7EQVKvE0Fcy0eoUBVNag@mail.gmail.com>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
	<1470133216-6758-2-git-send-email-vijay.kilari@gmail.com>
	<107219873.13018814.1470134892902.JavaMail.zimbra@redhat.com>
	<CALicx6uuXv=Vnt_H6P2=5EKVAC80Tp7EQVKvE0Fcy0eoUBVNag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.100.50]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: utils: Add helper to read arm MIDR_EL1 register
Thread-Index: VxXQrIN41M3JpjBmfLayT57WFQ98fg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.37
Subject: Re: [Qemu-arm] [RFC PATCH v1 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: peter maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHe1n5Qp/omC


> > Third, it's probably a bad idea to call this function from generic code, so
> > make it static and add the detection function from patch 2/2 already here.
> > By making it static, it's also possible to define it only if CONFIG_LINUX
> > is defined; the ThunderX detection will then return false if !CONFIG_LINUX.
> >
> 
>   You mean to say, move contents of this patch to util/cutils.c and make it
> static and define under __aarch64__ and CONFIG_LINUX?.

I don't think util/cutils.c is the right file.  It should be a new file, something
like util/aarch64-cpuid.c.

If CONFIG_LINUX is not defined, the ThunderX detection function should return
zero.

If __aarch64__ is not defined, the function should not be defined at all.

Paolo
