Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1213893wrw;
        Tue, 6 Nov 2018 10:22:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5cVblMjiRhPQ2s9Dba8DGkLrMwr600kvSSA1/pwHQp41jFyMTvw4kzR+mvyLGI9L9qp511y
X-Received: by 2002:a0c:9626:: with SMTP id 35mr26751814qvx.207.1541528553653;
        Tue, 06 Nov 2018 10:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541528553; cv=none;
        d=google.com; s=arc-20160816;
        b=m+nIVEWuRl0UhRBMwWYsQsWyz1ob4+B47TKYkSFhGjxoYo447IbeiioGMv4QxUauPj
         GkWMOiKupvhbrS4Zbz2fn1opxcGc/PFPqTGV4n6N3Sf7+tRXCdznrsGw1CXfSMfs0VNa
         R78m/1Rri/+MpwWnNBPpui1ulxjwbqgyGVziD49n3WIJkOblRXLx+iWhDgG2XSS2L/Sm
         qZ83XEbjIi5FpM8cSJMHwF6sfJz01QyoSTrDB847Q4yoqZkWThVENBGDtn9Z9dP14Dmj
         8AgQUG6O/UexFIs36OnsyJUVruUtj+qPo3P6+3ClB3kq6A1ADxoMUS39+ZtNRvQNQhzb
         4DRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=okTIS3qKOJlihVflqSw6OlUZwdzl9IkAh+/ZSVNiIto=;
        b=Zztt5UliWVEwQgUY2q/G6L9zpa/0tuuHc6xist/9Q3YbP+UBTjJQC88u7r8HE+wUIL
         ARnMm+O1KPGbVzocYVbxIZobFtxAlBvbriSt8QpWFewm847KDxkQI3RTcwhLBbjM1Q3q
         qA84JF86MjPc2XEAXXxllkdZkyxHjs1gVDy/oYMzIgTO9taLn6rOXzQbwZrC5pEkXfX8
         aVl6fg7kuLxk98ahD5uH/59R3SeMBmBKRevnZ2T6pux2OhlNPd2/HJTIJSrhi46U/RDG
         sMYwzNuqCdDEme8juLbvG1RcagR1snlvWCtzDYAfl6tDBmwr5eEIWLsEJMSgnZTtDPUb
         25tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x24si2230643qtp.214.2018.11.06.10.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 10:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK5zl-0003Op-3F
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 13:22:33 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gK5y0-0002NZ-7u
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 13:20:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gK5vL-0005TZ-Vp
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 13:18:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gK5vB-0004ID-Rg; Tue, 06 Nov 2018 13:17:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13888307D85B;
	Tue,  6 Nov 2018 18:17:19 +0000 (UTC)
Received: from thuth.com (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A523566D55;
	Tue,  6 Nov 2018 18:17:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  6 Nov 2018 19:17:10 +0100
Message-Id: <1541528230-31817-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 06 Nov 2018 18:17:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] MAINTAINERS: Add an entry for the 'collie'
 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9rm2YA7vPFsQ

There is no active maintainer, but since Peter is picking up
patches via qemu-arm@nongnu.org, I think we could at least use
"Odd Fixes" as status here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0499e11..471cf72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -592,6 +592,12 @@ F: hw/*/pxa2xx*
 F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
 
+Sharp SL-5500 (Collie) PDA
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/arm/collie.c
+F: hw/arm/strongarm*
+
 Stellaris
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
-- 
1.8.3.1

