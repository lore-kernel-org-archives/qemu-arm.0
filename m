Received: by 10.182.158.201 with SMTP id ww9csp400830obb;
        Mon, 16 Nov 2015 15:52:25 -0800 (PST)
X-Received: by 10.31.47.140 with SMTP id v134mr595769vkv.114.1447717945799;
        Mon, 16 Nov 2015 15:52:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q189si507250vkq.12.2015.11.16.15.52.25
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 15:52:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyTZR-00087M-GF
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 18:52:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZyPYF-00062k-QS
	for qemu-arm@nongnu.org; Mon, 16 Nov 2015 14:34:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZyPYE-0001PI-Ox
	for qemu-arm@nongnu.org; Mon, 16 Nov 2015 14:34:55 -0500
Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d]:35510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZyPY8-0001MH-Nu; Mon, 16 Nov 2015 14:34:48 -0500
Received: by lfdo63 with SMTP id o63so93121023lfd.2;
	Mon, 16 Nov 2015 11:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2WYkktlIYG95Vk9X/If7fbyIkJZJM5gy1eohQ52WX4Q=;
	b=XlR0s7ZQSbGlPkWq8Mhu8vqYMBDirwQP1s5A0lkcAP9V3ZCW7a7vr0F8UqGQL/rlba
	4tFSyDWTuVvaXvbCxeUoThYGKWvYHW4zVYc2kprT4XSXnHO012F0WgtlFQWchp6dyls1
	aq02+YMEfcf5NeL5ESAuj0ex22GZh+XFkLC3Rfj6NC7pdJHWhtVcHjFxFOZADff7gBjT
	ladj4NHTvhs0aEijQB2MBeYyxPXQKPUgP4wM6xCqGLhYDyibH3nX6H69EYttsxvqkcFN
	2QhWbuZWTqtotnQRiSxPKIqEry1r88fvEbceybIDbsKnqBBtniRY5Z2Bp0TbI0yp6kB4
	W4fw==
X-Received: by 10.25.89.210 with SMTP id n201mr17455163lfb.87.1447702487924;
	Mon, 16 Nov 2015 11:34:47 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id a2sm5709847lbc.20.2015.11.16.11.34.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 11:34:46 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Nov 2015 22:34:37 +0300
Message-Id: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::22d
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-arm] [PATCH 0/2] target-arm: Missed gen_set_condexec() in
	AA32 translation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qrqPODUaAhWZ

Sergey Fedorov (2):
  target-arm: Update condexec before CP access check in AA32 translation
  target-arm: Update condexec before arch BP check in AA32 translation

 target-arm/translate.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1

