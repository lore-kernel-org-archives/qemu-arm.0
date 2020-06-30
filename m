Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3766562lfm;
        Tue, 30 Jun 2020 02:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPLo8GY6aGLBIIi/qg9G2+3Wjo1eOuzltlSXR/x1Y/cJaXqyN+boDlbANsjnaRvjt57mKJ
X-Received: by 2002:a25:c647:: with SMTP id k68mr31680525ybf.345.1593508098010;
        Tue, 30 Jun 2020 02:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593508098; cv=none;
        d=google.com; s=arc-20160816;
        b=j4k35rpSWMfq0C+XVtASLCWUl5zitF94kzRFSvOcBpNt64DoLxdYKSxXbAfjQGsgUK
         JSm9+Q4+MQ3dJGeYaVzGWNFr0uwfiBnRvSm4HIqwUmHRyDfMexc6XM29uwiXcraiMzKf
         JLVJ2hTpy3W9ieBIgJooiarGFk0PphGzAyr+ekIyMHXppkLxjNsrrxm2cLpn4yHIitTK
         duUVRUX4Cfrj4i0hfELt6xm3IxedZIe0nw5oOHNEZlghwddgFm9cioUJHWH6uS9Z+pSA
         is8z3+7WF5zsIBWnVuzgY862SzmShhJTVzPy8eezXS/M3vO/keTLWHQ+2aNQawQ+cEsz
         VkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HbX+F0YOBtVPOL7TP27P03pO8+dHGl4EEswJatoom00=;
        b=xIfuHp86riea4YKm0wij+lYlkdvJmgf4DZeYOC0Zwf+WBd4WVzq5i3NXVoM9ZM38a2
         //FCrbfGCbzEetbleU5tFQ5Qx5ZSUd+51v5m1D7xpWw1Ipz6nPAbtPCMXF6qxEfnPm6g
         iPnjtUmdgSzLQztKfkOWhrkdFjgew5jN6+Tbf/Bgres55QPQLkKc7yLG3uI8TE/rTq98
         JE2imKYnbIe71z8RFLv3kG6aJF/VWRUAoBzU+tKQq4M4zIN0H7zH4j+9vaj9FdgFtFB8
         KB29tm3UDC/QrhB+crWHcoCU5vDb4V5+tVUYrqYZcBTbiVcQNHC/CxiqgknZmk++z+J3
         29VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GiBNkKhP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si2322934yba.347.2020.06.30.02.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 02:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GiBNkKhP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqCFV-0002Pv-Cj
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 05:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBT-0002cZ-3z
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:04:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58301
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBN-0002vo-Jf
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbX+F0YOBtVPOL7TP27P03pO8+dHGl4EEswJatoom00=;
 b=GiBNkKhPzFPSK4i8hLF4bMhER4HIMjNrp/alp+0V9PtjvX9PKvfnEt8YI18M1KZeH0ROx2
 DNvnBO3kYstHNbzESvvf/p99uYFWFx0nXKRyJIO7ffpooyxeheCNIdeQV+sxuuq3yzhy7G
 kze1jfq97cBINjcrQ9efzRc6HfzCRwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-NM0l2at7OIuTdB4I2TmKQg-1; Tue, 30 Jun 2020 05:03:59 -0400
X-MC-Unique: NM0l2at7OIuTdB4I2TmKQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63EF18015F7;
 Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3102710023A6;
 Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 38A161138484; Tue, 30 Jun 2020 11:03:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/26] hw/arm/armsse: Fix armsse_realize() error API
 violation
Date: Tue, 30 Jun 2020 11:03:49 +0200
Message-Id: <20200630090351.1247703-25-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 00:34:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LxA+Ylj0BaTc

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

armsse_realize() is wrong that way: it passes &err to
object_property_set_int() multiple times without checking it, and then
to sysbus_realize().  Harmless, because the former can't actually fail
here.

Fix by passing &error_abort instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/armsse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index c73cc6badf..e2cf43ee0b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -991,13 +991,13 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
     /* System control registers */
     object_property_set_int(OBJECT(&s->sysctl), info->sys_version,
-                            "SYS_VERSION", &err);
+                            "SYS_VERSION", &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), info->cpuwait_rst,
-                            "CPUWAIT_RST", &err);
+                            "CPUWAIT_RST", &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), s->init_svtor,
-                            "INITSVTOR0_RST", &err);
+                            "INITSVTOR0_RST", &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), s->init_svtor,
-                            "INITSVTOR1_RST", &err);
+                            "INITSVTOR1_RST", &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->sysctl), &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.26.2

