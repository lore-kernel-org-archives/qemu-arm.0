Received: by 10.223.172.38 with SMTP id v35csp3732273wrc;
        Tue, 26 Sep 2017 08:52:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDlwff1o8pYOyTvpue17gOj8FzvQUvCll0K8RLrQXnBwVGysKQodqgrOfLCSFEIroJ6slTc
X-Received: by 10.55.76.134 with SMTP id z128mr15930746qka.183.1506441134434;
        Tue, 26 Sep 2017 08:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506441134; cv=none;
        d=google.com; s=arc-20160816;
        b=dbSMCBynlPFyRSlzEREzPpCQsbvKVCuYCtewspncR7yOKYGbbBNoS+oJGRudDuT9+v
         +3WMzw8BmLlbG/Xn7cEXyBnUGwPSLqotrhZu2L1yZpTVS6IgeJYZD1bvO/vKlJLdPwVd
         5SF+dvhyl/qNcWHGaTiypLUvOg5twcshSQT2osJj1VKi7EzFmBT3N+kOsILbT1B5A8eC
         ZEHXNO+draJ0f5boVqilucZUA5vcj5oEtftMdZzQf7pJRKoHARXrE9tEkkdGI3hJLhKP
         3nb3Jfh/B1+pfkuTcslmOtXhXcgIA1TiKs1abyDWGUOxPT1n+s+gDvo96Cs/w56uMNsW
         q+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=jtG6EsjOpIW3+AU/XjtKZW/Sci3kcHmasl8WA+RAzEc=;
        b=TGzTjHnbUrR6m8TFSi7yw5qJ6SepVs72SAD+iQ9xekYjclUUeIzNt7sz8/neOeT442
         CwYGOED+UNWl+hPOgOw4DqpV3HyUh5OWAHTimAy33TwKGN1jSvj6B6sAZF09sg42ITkU
         cYqJCkdzeDYAJX2H4EDeWUhQM7EnAvRxsD4NxRiMG5Xv9nQbR7SgdOecJ0XLV+xq+Gtr
         gGXOSROYuzF3GFOfGsBY7KyK9MSrJgOlpqQMKdnpz1b43sN/Fib1EN7y5EySbT3JzXqD
         YD7A4iauSKuhH6/qMowsmTJ+gDBz+uTPXMSG49+bhJVj3/BzvuGi/tmdXQ1/Hv3Hmw16
         7V2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a187si5130990qke.173.2017.09.26.08.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 08:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dws9c-0006EH-81
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 11:52:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dws9V-0006EB-Tx
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 11:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dws9R-0005vy-00
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 11:52:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37454)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dws9Q-0005vd-Pt; Tue, 26 Sep 2017 11:52:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8BBBC04B946;
	Tue, 26 Sep 2017 15:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B8BBBC04B946
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08C4169A66;
	Tue, 26 Sep 2017 15:51:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Date: Tue, 26 Sep 2017 17:51:56 +0200
Message-Id: <1506441116-16627-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 26 Sep 2017 15:51:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/xlnx-zynqmp: Mark the "xlnx,
 zynqmp" device with user_creatable = false
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QHqylRMzK5tI

The device uses serial_hds in its realize function and thus can't be
used twice. Apart from that, the comma in its name makes it quite hard
to use for the user anyway, since a comma is normally used to separate
the device name from its properties when using the "-device" parameter
or the "device_add" HMP command.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/xlnx-zynqmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 2b27daf..d4b6560 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -440,6 +440,8 @@ static void xlnx_zynqmp_class_init(ObjectClass *oc, void *data)
 
     dc->props = xlnx_zynqmp_props;
     dc->realize = xlnx_zynqmp_realize;
+    /* Reason: Uses serial_hds in realize function, thus can't be used twice */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo xlnx_zynqmp_type_info = {
-- 
1.8.3.1

