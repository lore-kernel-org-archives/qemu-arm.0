Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp992635wrt;
        Thu, 22 Nov 2018 10:02:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5d/3NuVRKQJTLnisYjNfeevnagbv5V5Bz3JukvrxLAZkfJXi8pBBwVAKm/aM63D6pfz42l/
X-Received: by 2002:a81:4316:: with SMTP id q22mr12352893ywa.339.1542909768941;
        Thu, 22 Nov 2018 10:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542909768; cv=none;
        d=google.com; s=arc-20160816;
        b=D+WFN0FnAcgADseh0ZfrAvkqoLBw4QzKn53w7uZo7aEs6DHqQovqMHLR54eS3QX/VI
         T4IjIuxTT4cZYNdsdqso3GT1ktgkmWEkDBaL7tdq/AZzG/wy9+yKc2dXv4D0PA942LpJ
         1sbmHutTpckIIKBevqb4/MEIYJhcJaYTZdLaIzMfxfbjtk1PHwFgB5uEAK7iUvYc+KcI
         b456M/wq4fv7DZrr+Bgw/7kk7AJe0DkneDVYPOHfd+5AKZdTtJgFQcAX4rTuZ4EBY6+n
         6Aq5rW76MlufvmJVrUAXub9gqrbuGDP0Zf1XQWlJTpRlMaWhdIjCQUFbuK/9glJBWPVm
         wd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=xOzk3WDffnoMtAw7sCrWJ5sBtEOaJjdSTDWfdhezazQ=;
        b=hpfKDygVdfJgtADV6P6+ENdFlmEk6wiVVw7uogVGFaXHs1Dh7CbI0jHLikOHUEWqbU
         2brXF8l70m/8N5M2w6jb/atrvgGQWOLy3VfCU1jT/BcFkbNO6xSPj08iI2jGxkp5rMI5
         mHOX8yj4B8d5921f3VbNYWTGptl0wFBmhcdjzUF9fGAJdTtCqWlEEuEiO4HzUmoTQ2y+
         vDwcLqu5HmNbMwxTk3VG0HWiENSlrMZLBlV4Tr238gLyGshImx8uGuB1Y8Ni9Zz/4b6q
         49Nr1I+TkJqutZdFVfNBFk9uvpHoBbh/qSC8NDmDjgfVkKmfDJWpF8nUjMxV6mzAa/Q8
         Q3/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3-v6si3685394ybd.304.2018.11.22.10.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 10:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPtJQ-00032Y-CC
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 13:02:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPtIb-0002Si-JG
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 13:02:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPtIW-0000C5-97
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 13:01:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34082)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPtIW-0000A8-1A; Thu, 22 Nov 2018 13:01:52 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 292F330DDBC4;
	Thu, 22 Nov 2018 18:01:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6912B452;
	Thu, 22 Nov 2018 18:01:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, thuth@redhat.com
Date: Thu, 22 Nov 2018 19:01:43 +0100
Message-Id: <20181122180143.14237-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 22 Nov 2018 18:01:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.1] MAINTAINERS: Add an ARM SMMU section
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
X-TUID: Bkx54dUFGjJ4

Add a new ARM SMMU section and set Eric Auger as the maintainer
for ARM SMMU emulation sources.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1032406c56..3cac9f0a0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -151,6 +151,13 @@ F: disas/arm.c
 F: disas/arm-a64.cc
 F: disas/libvixl/
 
+ARM SMMU
+M: Eric Auger <eric.auger@redhat.com>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/smmu*
+F: include/hw/arm/smmu*
+
 CRIS
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
-- 
2.17.2

