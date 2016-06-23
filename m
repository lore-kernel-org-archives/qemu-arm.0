Received: by 10.25.21.96 with SMTP id l93csp713893lfi;
        Thu, 23 Jun 2016 13:56:52 -0700 (PDT)
X-Received: by 10.55.167.19 with SMTP id q19mr632889qke.7.1466715412263;
        Thu, 23 Jun 2016 13:56:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z145si2022748qkb.120.2016.06.23.13.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 13:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGBgB-0002LA-NH
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 16:56:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <y.usishchev@samsung.com>) id 1bGADe-0003jJ-UA
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:23:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <y.usishchev@samsung.com>) id 1bGADZ-0005K2-Rf
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:23:18 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <y.usishchev@samsung.com>) id 1bGADZ-0005IA-Lt
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:23:13 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
	by mailout1.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0O98000GOOIL5MA0@mailout1.w1.samsung.com> for
	qemu-arm@nongnu.org; Thu, 23 Jun 2016 20:23:09 +0100 (BST)
X-AuditID: cbfec7f5-f792a6d000001302-3d-576c371dc795
Received: from eusync2.samsung.com ( [203.254.199.212])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id E3.80.04866.D173C675;
	Thu, 23 Jun 2016 20:23:09 +0100 (BST)
Received: from samsung.com ([106.109.129.221])
	by eusync2.samsung.com (Oracle Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with ESMTPA id <0O98000CROIJNB30@eusync2.samsung.com> for
	qemu-arm@nongnu.org; Thu, 23 Jun 2016 20:23:09 +0100 (BST)
Received: by samsung.com (sSMTP sendmail emulation); Thu,
	23 Jun 2016 22:22:06 +0300
From: Yury Usishchev <y.usishchev@samsung.com>
To: qemu-arm <qemu-arm@nongnu.org>
Date: Thu, 23 Jun 2016 22:22:06 +0300
Message-id: <8760szvhgh.fsf@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-version: 1.0
Content-type: text/plain
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsVy+t/xK7qy5jnhBtMOs1ks6F7I5sDo8eTa
	ZqYAxigum5TUnMyy1CJ9uwSujL+PljIWbGav6Pl8hL2BsZ+ti5GTQ0LAROL0nNusELaYxIV7
	64HiXBxCAksZJdZdvsgI4Uxgkmj8cxusQ0ggTGLmvYlgNpuAnsS3FU9ZQGwRASWJyS87weLC
	AnISF1r2MoPYLAKqEm/W/QWL8wpoSGya1Q+2TVTAUuJe312ouKDEj8n3gOZwcDALSEg8/6w0
	gZF3FpLMLITMAkamVYyiqaXJBcVJ6blGesWJucWleel6yfm5mxghAfJ1B+PSY1aHGAU4GJV4
	eF+I54QLsSaWFVfmHmKU4GBWEuHlNgUK8aYkVlalFuXHF5XmpBYfYpTmYFES5525632IkEB6
	YklqdmpqQWoRTJaJg1OqgZHzWGnShJaO4t0JlodjY50iFZi2f3xptSz59KG8CHHFH+J/Fl7m
	tE6u5FfUvvpkatEEdW6r++5ud/fU77S5xcYuteV41F+P307CCTuF3v5M+nglwF7hzxYtqQ3i
	4sduMkz+H3o4KMVEPmvn8iXfTFfIqmtYx66PXnti8/ITld+mTZ8ZlV56s1WJpTgj0VCLuag4
	EQD8YrqvDAIAAA==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.11
X-Mailman-Approved-At: Thu, 23 Jun 2016 16:56:36 -0400
Subject: [Qemu-arm] AArch64 memory layout
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
X-TUID: 9VDIAH+X+GsP

Hello!

I found that address space for AArch64 is considered to be 64bit:

target-arm/cpu.h:1776:
#if defined(TARGET_AARCH64)
#  define TARGET_PHYS_ADDR_SPACE_BITS 48
#  define TARGET_VIRT_ADDR_SPACE_BITS 64
#else
#  define TARGET_PHYS_ADDR_SPACE_BITS 40
#  define TARGET_VIRT_ADDR_SPACE_BITS 32
#endif

But from kernel side it is either 39 or 42 or 48 bit:
https://www.kernel.org/doc/Documentation/arm64/memory.txt

This causes problems with address sanitizer usage under qemu. ASAN under qemu detects address space as 39 bits. When
host mmap returns value over 1<<39 (this can happen on x86_64) ASAN causes segmentation fault.

If TARGET_VIRT_ADDR_SPACE_BITS is changed to 39, runtime checks prevents mapping from bigger addresses and everything is
fine. But this is not a correct solution as mappings can be also 42 or 48.

So the question is should TARGET_VIRT_ADDR_SPACE_BITS be changed and how?

BR,
Yury Usishchev
