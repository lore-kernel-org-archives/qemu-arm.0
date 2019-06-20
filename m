Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2407159wrg;
        Thu, 20 Jun 2019 15:25:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoqxf9SF8gvjlOA7PO17VWBUX4/46cHeXO4Hdasq7F5CH9xoumTuPh1poadXLjrhy1T5Oi
X-Received: by 2002:a50:8b9c:: with SMTP id m28mr99762778edm.53.1561069541742;
        Thu, 20 Jun 2019 15:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561069541; cv=none;
        d=google.com; s=arc-20160816;
        b=0+OU1hf2TJyYcqCk/wl626pyG4xLHBCfQNszNaPq2LUikjZ6Wj36FIV4sFG6CJwd9Y
         oybUSn8yOkkdsrUUToupKKyN2eCQh/lWC1hUtoZaZm+gPott64zi+lStI2FWyXidPZJv
         iYIkcdmVMVyefuNKrqaUP+exFZkB/G835yLAmARrq2hV/dfZu5drldr6HuQgd7b/oudb
         vzWsw7lZtTs8r1FWAGYufS04OPr57dz5JbmvCiDcI3v9XoqCivzJrWIMwjfIzMZeA+cl
         MGBqDCW6Mmc0KC2pR928UEEw3COFEdj+3/o8SRXdw1iHmJosk0uEbLlRqu+A7chI9kN/
         ncGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=OtkuAF/cEH0y05UKdOwKeWXdiaMWj7A32zCOWt9FkeY=;
        b=n4OHHKFIHiZHOtUlPRdOKGUTO7WgKcElHVZ2ow8R5JXWXeXRPsC4k3iDk5e3tJ158c
         0NUCnLstQG9UbarHK8LWpER7H/BpXEKa7llg/mS/JilhEtGhJGpKcFqAXZ0L6BgBYgXU
         xgls0la0jGWygzfSIVxUaYOn1TQKtjaTkHqtJ15DXeY8EtkTXhF4qnw3F+LNMJgfytpy
         JyrB+BiLkv07ZyR53kYjRUmebuiLJ3DvaeTwfQ7mF6H3T2EfGJOIpLjX+nNqP6fegE2h
         u3GT46qnJDVcB4Yc1iONhD7xarGt41qlWLDjkmfgYIeesxm767OoIjO4cRvxzcpZf36T
         FL+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22si634266ejk.371.2019.06.20.15.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 15:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1he5Uy-0005SF-Q0
	for alex.bennee@linaro.org; Thu, 20 Jun 2019 18:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40811)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wainersm@redhat.com>) id 1he5U3-0005S7-GA
 for qemu-arm@nongnu.org; Thu, 20 Jun 2019 18:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1he5Ty-0004vD-Sn
 for qemu-arm@nongnu.org; Thu, 20 Jun 2019 18:24:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42482)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>)
 id 1he5Tl-0004Wx-QL; Thu, 20 Jun 2019 18:24:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D40A45D5E6;
 Thu, 20 Jun 2019 22:23:18 +0000 (UTC)
Received: from hp-moonshot-03-c05.lab.eng.rdu2.redhat.com
 (hp-moonshot-03-c05.lab.eng.rdu2.redhat.com [10.8.2.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE406090E;
 Thu, 20 Jun 2019 22:23:16 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 18:23:14 -0400
Message-Id: <20190620222314.2670-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 20 Jun 2019 22:23:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 PATCH] hw/arm/virt: makes virt a default machine
 type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, crosa@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C5qNyWzMAg3G

Peter, Cleber,

Re-sending this email because I forgot to copy the mailing listing.
Sorry. Original message below.

==
Hi Peter et al.,

I came across this when running the acceptance tests in an aarch64 host.
The arch-independent tests fail because, in general, they don't set a
machine type. In order to avoid treating arm targets as special cases
on avocado_qemu framework I prefered to attempt to promote virt as
default for ARM emulation. Moreover since it represents a generic hardware
and its used is broaden advised [1], I found it the right choice.

Maybe that topic was discussed already but I didn't find any reference on
either the mailing list and git logs. It is also true
that I am an ignorant on ARM platform, thus I might be missing
something. Those explain why I send this patch as RFC.

[1] https://wiki.qemu.org/Documentation/Platforms/ARM

Thanks,

Wainer
-- >8 --
Currently none arm target has a default machine type, unlike
others as x86_64 and ppc64. The 'virt' (alias) type represents a
generic ARM hardware, so let's specify it the default machine for
ARM emulation.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 431e2900fd..2f8aa2bfb7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -74,6 +74,7 @@
         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
         if (latest) { \
             mc->alias = "virt"; \
+            mc->is_default = 1; \
         } \
     } \
     static const TypeInfo machvirt_##major##_##minor##_info = { \
-- 
2.18.1

