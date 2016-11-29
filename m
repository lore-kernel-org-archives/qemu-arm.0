Received: by 10.25.150.194 with SMTP id y185csp2231883lfd;
        Tue, 29 Nov 2016 01:16:53 -0800 (PST)
X-Received: by 10.55.66.73 with SMTP id p70mr25792115qka.63.1480411013818;
        Tue, 29 Nov 2016 01:16:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m73si34346119qki.220.2016.11.29.01.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 01:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@livius-net.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBeWy-0005JG-MX
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 04:16:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1cBeWv-0005Iv-9C
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 04:16:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ilg@livius.net>) id 1cBeWr-0006tU-Qp
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 04:16:49 -0500
Received: from mail-wj0-f180.google.com ([209.85.210.180]:34165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ilg@livius.net>) id 1cBeWr-0006t0-JA
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 04:16:45 -0500
Received: by mail-wj0-f180.google.com with SMTP id mp19so139351066wjc.1
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 01:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=livius-net.20150623.gappssmtp.com; s=20150623;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=rn59x0HwLGBddoBfhTk/SWSUTe1j8hlUhI7X5vFV9EY=;
	b=hxV8vjIWvv3pqd6h9rzH8s7f2Ux4q/UNa6p4bcdc3+uFRi+aMeoj3TNDC5zLVn1ye5
	wZer1e6YTrjzNs2ZLtyrPu4M7gTA+xVGelawv204qhFBL/fenhJ43GQ/sQqLTLTNl7BR
	f5FiqZG+5uU9mQWdCX0jcx88f85ydPiXvrQzTTpPi/hGE/ArpUIOM6/RVMbeLV4uxEQo
	mlto7SishLYTF0Vi68kSSlOMMDAcf8DQEdqczEl2QgpIGpcNZqXYuDEQ3K+cIAJxtBHZ
	kewHt1euC/xf+e1J4ORVdo44hXz07H1PS9XIFkPcCE03hzAZ+NVsfrhdnND+SriSJV1o
	y+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=rn59x0HwLGBddoBfhTk/SWSUTe1j8hlUhI7X5vFV9EY=;
	b=d7PhaiFhB+J503ikjnlEPWc1eN7fTXMbJLAgcMbey0674PhdRjs1JN2iszFoMjbwNZ
	aO0xZxZldjXoYIqBPm0dxDH30GQjOD+FBfGyAR3jAcs/smAFwG2NgHwQDCmHmBTnmtcp
	2wPwmNWVQJdtO7nM35kHDtzYsgWoPncdWXLz54VXG0EOVgErrpkwf7F7BY7YphZgcCqr
	SIipoa1bIOi/uYC4xpt9z8GUB2CEwg0GdcX4Yaf8WY+BaqspIK4dddgtGQeyH7rAc+Dw
	lH2YJf326vPw+Ch4yFpbBP2cHJlP6B93rOi4ElMJfgeadFfFZf0C9HqKbS8ZoKAawOnl
	SQHw==
X-Gm-Message-State: AKaTC01CsCKFwmn5jwQtz9L2hJqQ7q3X88Jd0r/KNhEEYE/iiZNLyCx1DSad+isTdVPTbQ==
X-Received: by 10.194.238.163 with SMTP id vl3mr22208854wjc.169.1480410944431; 
	Tue, 29 Nov 2016 01:15:44 -0800 (PST)
Received: from [172.16.62.12] ([109.99.239.84])
	by smtp.gmail.com with ESMTPSA id
	f134sm1705501wmf.19.2016.11.29.01.15.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 01:15:43 -0800 (PST)
From: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Message-Id: <31636028-96EF-4040-9AB6-410DA3B0E514@livius.net>
Date: Tue, 29 Nov 2016 11:15:42 +0200
To: qemu-devel qemu-devel <Qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	qemu-discuss@nongnu.org
X-Mailer: Apple Mail (2.3251)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.180
Subject: [Qemu-arm] GNU ARM Eclipse QEMU: support for active graphical
 buttons added
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
X-TUID: Es385rz4UmmE

For those interested in Cortex-M boards emulation:

http://gnuarmeclipse.github.io/blog/2016/11/28/qemu-v2-7-0-20161128-released/

Any feedback is highly appreciated.


Regards,

Liviu

