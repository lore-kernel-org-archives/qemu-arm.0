Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2321352wrx;
        Thu, 25 Apr 2019 15:33:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0d1Xqd2Un/igPNxNDGQYXjwM6FeKemiTY9rZDmD43nVuuupxHCnxiCwquzd/RTVNnd1B7
X-Received: by 2002:adf:fc47:: with SMTP id e7mr29164170wrs.100.1556231593980;
        Thu, 25 Apr 2019 15:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556231593; cv=none;
        d=google.com; s=arc-20160816;
        b=pAxQZ1dX6/IAHZjih4UhDqaeqV0X5ypm9nBCSfjrZI8Orlsv7nLR7AnQNZCPlYjqR7
         fS2FAyEvTfVOvWTxBc4UXmTB2N/k/x3YFiUnEWT3me7hb2TnOzexyo4YnUDPo9m8aBU2
         MBo2aarvJl2nwdIlftPeclPcv0U+k2wB3T7mgTGlzLOSfUYTcpapbbgcGiruJ5JNWuYw
         b3/mjSCaZHNPSkGjw23t6I2yFuqz8qH8+KvsWA7Zjuwg2zptkdBpJePsxpzrIV+7WKvw
         9RQmYueis/5xowyyHn1KVqvPfns+RPXCSk2ZRySqHOacaLMAxEGsQp+FK+HVCjT9tyOR
         F+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:sensitivity:importance
         :date:to:from:message-id:mime-version:dkim-signature;
        bh=RuEJFIRQ2i7/ahMQtYNtQGKtWspDv6i3GrE7BMGYUbw=;
        b=Eie4uZpQzHYW6Sy/ns8qrdYAchzRk52VH7LTtGTf1jKMWQFkqaQP8Tr0+9aTpoWZr6
         QOAOKlj7XFp/WOv9VO1uhVuB3KlVDr4yJFXiwRrt2M7ac9W4+Qt4F02lGpkLHCRygV7I
         /9eqq4W5qNok27jGSwBFDnTLC/G0CwkiKqgTXqYZ5srAOqKcUt4XWV+2n/egC82Ld9ay
         8CwzboZE81oztYxpQlD3x2y4r3RrQs9revAumULZxeTV1QHhbZR3BswVDILtzIX5gW9k
         05nRe5+1zzmHLDJcBlU3MFYFSLa+h8J7aPHnBZ3jqSjeLMlFqNI4TYhXw/PxI5avcL8C
         RcSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@web.de header.s=dbaedf251592 header.b=OWWLALOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u138si6476700wmu.59.2019.04.25.15.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 15:33:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@web.de header.s=dbaedf251592 header.b=OWWLALOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJmvY-0001Ze-TA
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 18:33:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bjoern.M.Haase@web.de>) id 1hJiso-0003QY-6c
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 14:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bjoern.M.Haase@web.de>) id 1hJism-0002Y3-LR
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 14:14:06 -0400
Received: from mout.web.de ([212.227.15.14]:35225)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <Bjoern.M.Haase@web.de>)
	id 1hJism-0002UQ-AY
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 14:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1556216041;
	bh=RuEJFIRQ2i7/ahMQtYNtQGKtWspDv6i3GrE7BMGYUbw=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=OWWLALOu+aptJoNuD4qnPr4aGZzBxknvOHawMEifr8ddD9tmeLrfLyTcGkCr5rrFM
	q66BPNrDa42rpKKs/FAmz+LOjMLs/EMieuwUJu5jZQAtu76jbBekwvCFlaEaVjqVwh
	kPllrIP0X15GkptzWQkrpklmJq9RbCeFF5KrGtc0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [109.90.240.132] ([109.90.240.132]) by web-mail.web.de
	(3c-app-webde-bs13.server.lan [172.19.170.13]) (via HTTP);
	Thu, 25 Apr 2019 20:14:01 +0200
MIME-Version: 1.0
Message-ID: <trinity-1f7e0bc4-e787-4b8e-9ba2-9e458d88c7ca-1556216041544@3c-app-webde-bs13>
From: =?UTF-8?Q?=22Bj=C3=B6rn_Haase=22?= <Bjoern.M.Haase@web.de>
To: qemu-arm@nongnu.org
Content-Type: text/html; charset=UTF-8
Date: Thu, 25 Apr 2019 20:14:01 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:wBxKDibmTnCe8d7/aAfI5vnINLCIYsO2FGH7SjMgEBufYN3Sn+7NtIQwH2/nyDM8AFfeU
	Ytzcbju1VtzFu03xwW6vanyqomOVPxnYKIi3b1Gzzi8LMYLxy3oqrMoFga9QzlA7xigy1+MDpTsc
	Opge1+laDgn3ehWmTcVP74Dezoah+3t6eqsK7To2TsNWRX6Mrp4iI0AOylauI8cBSjWGdxrmE2yt
	nAXRWmHVTw8z22Kh051yr4Cm7us5vhsNeZPajz4sPdmNrq4pUnyJUlGXBvSJ9j9kg2aTwGitMWVQ
	to=
X-UI-Out-Filterresults: notjunk:1;V03:K0:SdTdgJPXQzo=:Yn62tvzud+tFGXibRWMRbt
	V7dgGcWet+tLgdWo+RQBMJqi06OpEqZUtHnmcD6te290wqLpSlXkTqSGJx+rH0vXQpL+ryK/K
	m+D5C0RDcGfjpC0d6tbbO/Tq0kNaR0boYWsNzFrqJ6iVk+pHNblVpIEiYvZIUXHy5UNejruR4
	qiuFWQZ0wjdxGGM8PgW/61p//lvMR6dUNhtFpVEhvM3wDCu+MYgHbLGnykdA0pLub+lsXtl37
	E23k+KmgI16dtJoDL2WBUYGPc8iSHUODhHR7ZPZszi7Vxj2IjwGSXhO/Cwj8WLb+iORLO1EXz
	HP3+0fil/6i3YiI9h8BFOQXkXOkMLERNkrLfrl9lqrIMZ8/81GjNzDtK+USYep6IvXXHBayVt
	zl42ydkuYiPBLGk4tdXASP95yEnhOK+7/AQDFM7S0Ay+MYsP1bhGACQz0MsDlkoUw7sf9WfkD
	zuuMoL8c57c+m9ZhIFa8q/QIYP2ac+EZBoqtOaLF6Sf3QQIn9If3lv9vgOy6go6m2nhKbUt6M
	1RPHTUhCJyeaiuVrdtFSfVxztfVF0pJPRkuIDGwoa3PvyI3/jq0zagmP6egZ+O6oXTWouzHz+
	oRMeKeagQUlOjvp0gtTlPkfCfMT5DawV7HyKDYYR7148DxrRREqFouAA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.14
X-Mailman-Approved-At: Thu, 25 Apr 2019 18:32:50 -0400
Subject: [Qemu-arm] Regression tests for Assembly libraries for Cortex-M:
 More recent qemu versions core-dump or fail with warnings
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
X-TUID: ALpUs7cbK/Qr

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hello to all,</div>

<div>&nbsp;</div>

<div>I&#39;d appreciate some advice on how to</div>

<div>- simulate a ARM Cortex-M4 system with large amount of RAM</div>

<div>- together with semihosting (stdin, stdout and files) on the host CPU.</div>

<div>&nbsp;</div>

<div>The background of my question is a bit different from the conventional QEMU use-case for full-system simulation:</div>

<div>&nbsp;</div>

<div>I am working on CC0 crypto libraries for the Arm Cortex-M series (see e.g. https://github.com/BjoernMHaase/fe25519). There is a lot of assembly optimization and assembly code-generators behind the scenes which need extensive tests. I&#39;d like to publish my code together with a regression test library running on Qemu (specifically regarding the asm stuff). The regression tests best have access to files and need to be executed without the code-size-restriction and memory constraints of the tiny embedded targets (which might not even allow for stl containers, e.g.).</div>

<div>&nbsp;</div>

<div>The problem is that the regression suite code is too big to fit onto any embedded target. I.e. I&#39;d need to simulate a cortex-m4 system with, e.g. 256 MByte RAM and with file access using the semihosting support. So just running on the embedded target is not an option :-(. The use case is, thus, not to simulate real-world CPUs but to simulate CPUs that are not available in the real world.</div>

<div>&nbsp;</div>

<div>With the older versions of QEMU, I succeeded with using</div>

<div>&nbsp;</div>

<div>qemu-system-arm -nographic -monitor null -serial null -semihosting -cpu cortex-m4 -m 256M -M integratorcp -kernel ./test_naclM4</div>

<div>&nbsp;</div>

<div>where I have used a combination of an ARM9 machine together with the &quot;-cpu cortex-m4&quot; switch. This worked perfectly. When compiling the testsuite with arm-none-eabi-gcc with -lrdimon and -lc and the corresponding linker specs, I was able to use the semihosting, just as for the integratorcp simulation.</div>

<div>&nbsp;</div>

<div>Unfortunately the more recent versions of QEMU either core-dump or give warnings.</div>

<div>
<div>On Qemo 4.0 I get the result &quot;qemu-system-arm: This board cannot be used with Cortex-M CPUs&quot;.</div>
I did some attempts using e.g. the lm3s811evb targets. However, I constantly get failures such as</div>

<div>&nbsp;</div>

<div>&quot;qemu-system-arm: Trying to execute code outside RAM or ROM&quot;</div>

<div>&nbsp;</div>

<div>most surely since qemu checks for the limitations of this specific microcontroller memory sizes, which I want to exceed intentionally!</div>

<div>&nbsp;</div>

<div>Also I believe that semihosting will not be supported on any of the native cortex-m machines? Any advice would be very appreciated.</div>

<div>&nbsp;</div>

<div>- Would it be necessary to add a separate &quot;cortex-m-semihosting&quot; target to the qemu code or is there possibly another way to proceed?</div>

<div>- Is there some documentation on how to add a new machine to the qemu code? I did not actually find the place where e.g. the lm3s811evb configuration is stored within the source trees.</div>

<div>&nbsp;</div>

<div>Any feedback would be appreciated.</div>

<div>&nbsp;</div>

<div>Yours,</div>

<div>&nbsp;</div>

<div>Bj&ouml;rn.</div></div></body></html>
