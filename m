Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2089233wrq;
        Sat, 9 Jun 2018 07:23:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK7lyH8hC8BeZFO128F1ARYEIsAtqoBsiZZndOngl4UbSbQJNCFxrR1q1au+5I+65F5VlI6
X-Received: by 2002:a37:9984:: with SMTP id b126-v6mr8626140qke.307.1528554217868;
        Sat, 09 Jun 2018 07:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528554217; cv=none;
        d=google.com; s=arc-20160816;
        b=lnwI/FEo+cvIw1/TOnMKeKsjblL5qgjgktrPF45yyFk/0tJP8Cmrv8JOa1wHMc4zFS
         o0ummRVQzj3q52y/18BrMZ4rJHBbfZT+U1GRNfBBotU12s6CgEbRmz5JKNIlz9KbU2Ld
         CAUUr6SgwXC2tXiYayjaWZW6HcN8VREs2/XZC2tzPoo5dj5Q+PRyGjF5McAkBgWWXqjc
         8Yp6eG1mh9o5IKfLKxHMEzgeg8MNic46j7skAjvE0xJ1gFKTDbADAhuqtN0n+mVj/Bwz
         KNKSNE7ACkueSSrRKGJsX8dC47gOsr5bkRiAU49YUAh3VBHVi8OsHDcmbI/n3dilqiem
         BD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=e+uXbeHgmAmKrfNMaXkBy9JGkBWWkKKMOBJnK6hxVB4=;
        b=jECyn68GkdIwVs7KLll6yOkPmv0Kf3ZVlYhpRfPsvCwoy6britCHpjtDPSs5JFCRwy
         7y9Ai4yLtJPuADQNWUA2/3pj9ePh/Ck47aTZz3UAVgVlG0RiTHv0YT81XBsX828skGOU
         za/Rbu89wbQ5ZIkTFEnpCeZlzG21IOoWb7qxqWSUY/jtokYT5i7MKB4RgjnUB/AP7hbx
         2XgWHNMOtlZo79Q48u06rdbDYXeLAOQprxLmJNqxdBU4uQ37gyJXTJDGYnXCoO+h68Qy
         LjgbR/lk4ab9p2Mosttg2iqqUwRSQSJBkWnSVm3M0Ua+k53DsLshlO67JE28qIm9o+M7
         C/hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s7-v6si13295726qtn.23.2018.06.09.07.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jun 2018 07:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRemH-0007eJ-8j
	for alex.bennee@linaro.org; Sat, 09 Jun 2018 10:23:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fRem4-0007e3-U1
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fRem1-0004MM-Qb
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:23:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53692 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fRem1-0004Kh-Lb; Sat, 09 Jun 2018 10:23:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D10A88867;
	Sat,  9 Jun 2018 14:23:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20214217B409;
	Sat,  9 Jun 2018 14:23:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  9 Jun 2018 16:23:11 +0200
Message-Id: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 09 Jun 2018 14:23:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 09 Jun 2018 14:23:18 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 0/2] ARM virt: Silence dtc warnings
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
X-TUID: WX3fnJlGPr4u

When running dtc on the guest /proc/device-tree, we get the
following warnings: "Warning (unit_address_vs_reg): Node <name>
has a reg or ranges property, but no unit name", with name:
/intc, /intc/its, /intc/v2m, /memory.

This series removes those warnings by adding the unit address to
the corresponding node names.

Best Regards

Eric

Eric Auger (2):
  hw/arm/virt: Silence dtc /intc warnings
  hw/arm/virt: Silence dtc /memory warning

 hw/arm/boot.c | 20 ++++++++++++------
 hw/arm/virt.c | 65 ++++++++++++++++++++++++++++++++++-------------------------
 2 files changed, 51 insertions(+), 34 deletions(-)

-- 
2.5.5

