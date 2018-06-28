Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7191386wrq;
        Thu, 28 Jun 2018 02:18:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeJR/VHG90sPGP/nC5/aJewPcYl8G0mBqUYXzFSHgndbedWRiKSsYi+oYvcdF1HsPZ2F5bc
X-Received: by 2002:aed:3e13:: with SMTP id l19-v6mr8848921qtf.345.1530177484686;
        Thu, 28 Jun 2018 02:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530177484; cv=none;
        d=google.com; s=arc-20160816;
        b=wqvpFknEvDySEd8fZ+LuO3OLtebZ/lfFZz0QegNDNpKb6s/ztTLDneHSHqZ/gTIDB4
         Rm4JJGZaPODG719NhWQRgG3xq72aJHN9Vo6KWqHeCv/meQo2h9oM0ZIHbfiDfbZHMWm9
         pHh3c3/Jw9XCPGOHsimMA5wi5021e+exl+HZ3lj/qn7WDhnk/+AmlqbfBZpbu/2a+vGS
         ghC2QZVlE7wsBGEojoxXzCIE/a3KFXRYsJ49j+UnZw4R+OJBQvTB0HRa6Q7zdFA3eH7I
         YTynCPWLhTGbeOFiUkKqW2xR94v/STGtPlPBwH+COjjaXLyM10FCAzVFRWWEKnmJD8QY
         eB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=DBIo+ak4F5or9D2GaGqUDQlmaZj2JugDGF5FSsJRI4M=;
        b=yzwNhclXmlWgdYBpMOhFpOJ+mtiGxE3UJ155HpV9Bbsc3tqc75Ogg/eA/+EN+VK7gh
         D4Pl/plIbfaJ2Q6NUdfvCg9vNY1jV5lWBv/+/PUMKeBvaThBMrkqM2bT5g8jkJSDA8f/
         7Iq19dcKseCEVIHFu8CvgjBEU24jka69FazpA04QTnndiaT+MN4IkvpON+prR5HXGTpF
         XYiQZgd+gfvzIOOS3vRRFopyyvtkOg0TiD94+yBpNFYq5yjFlKXJJcOS9RpTiI5oXPUj
         Yi37DKlvik2+WJQj8Nh1Fja6ARk/sfrOaIa/9v5TfxsDb7KmJwD9+IlqM3N5otCN6CWv
         E2pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f74-v6si4552173qka.393.2018.06.28.02.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 02:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYT40-0005vp-6T
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 05:18:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fYT3s-0005vW-QW
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fYT3p-00068H-Lh
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:17:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2630 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fYT3p-00062b-8B; Thu, 28 Jun 2018 05:17:53 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 7B1B7906162A4;
	Thu, 28 Jun 2018 17:17:33 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 28 Jun 2018 17:17:23 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <zhengxiang9@huawei.com>, <gengdongjiu@huawei.com>,
	<linuxarm@huawei.com>
Date: Fri, 29 Jun 2018 01:22:39 +0800
Message-ID: <1530206561-22348-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v4 RFC 0/2] add support for VCPU event states
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
X-TUID: 4Edh5vYGwXkm

Support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

change since v3:
1. Add a new new subsection with a suitable 'ras_needed' function
controlling whether it is present
2. Add a ARM_FEATURE_RAS feature bit for CPUARMState

change since v2:
1. add header definition for arm platform

change since v1:
1. update the code to fix the build errors


The corresponding kernel patch is here:
https://lkml.org/lkml/2018/6/25/374

Dongjiu Geng (2):
  linux-headers: sync linux header
  target: arm: Add support for VCPU event states

 linux-headers/asm-arm64/kvm.h | 13 ++++++++++
 linux-headers/linux/kvm.h     |  1 +
 target/arm/cpu.h              |  6 +++++
 target/arm/kvm64.c            | 59 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c          | 22 ++++++++++++++++
 5 files changed, 101 insertions(+)

-- 
1.8.3.1

