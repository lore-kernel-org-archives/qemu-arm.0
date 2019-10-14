Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4503208wrm;
        Mon, 14 Oct 2019 07:26:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcdnfdvTKdNvnDJecKbjD4vCJeksDPlKMQ3EFOX4SSZQ0sQSwc74AYz+Q8AQFvaY39YvzC
X-Received: by 2002:ac8:5401:: with SMTP id b1mr31768845qtq.356.1571063163791;
        Mon, 14 Oct 2019 07:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063163; cv=none;
        d=google.com; s=arc-20160816;
        b=z5+eOnE/cHXVsFXTJMQJWfi2ZtrkCJKffCy9L36zOPj8SSnODqHx2cSMxBQNEOQvRS
         38CNUtsiezIj9RTKRXu4Sq0X9PEmaZIubeSMOI0lmGvVKzwJpLuY8Cz7O5+WcgIOzW6m
         IRzp7khNJ+ItSO87bg2D6xFhzMl0AMKFK+piGCWFH7meXCeSRWQ+tFyGk+cT5LWGz7wn
         3IDThqF6HRMOM7xwlhLPce/tb9oFrmYW4CnDC/UV02C1tqJiYh5E5kAncVCcdHge7jmg
         TXEXacKEKpEd/ELseCovLYCMpNwst30tusyU3Oe8pgdjKZCBx0LzbP2BflPD04xupdqN
         qUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=NEJPKq/0ImB1SSgsZxD/UjTaknWzTkxOUHlK2blMPMg=;
        b=lpzR7qpb2XHu0N9cpo43BnjiHNbGi/SWmCjQv5JnLwHkclEhRkN5J20rKP2wy3Pn7k
         k5Jx6UKVbf90WsNdUW9Ypp/z8AGO41FB6TSAFLnVHbuWRmpOQWbW67y3kBnW+lJjiO6C
         vEXCp1qcMUwhRMQUugGuursxf/BjhRaIsqylAZSGNMA7juraRrzekiVedg8yWXn/FUxg
         wMDY4QpfswgIQFGjjdrXlpnYLJZ3RCIryfGDIOiTsUs+r7RdNvfKE2kZNc2Fr3LXoidJ
         5fr8AQTzy8znADCkfi0QqKDa/o0aroRQ2pyiNnhr3VxWw2Pzw9z568Bwu0tz2H1Y9qXu
         komg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o32si17348561qvh.190.2019.10.14.07.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1IQ-00085P-M2
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1HR-0006rP-9y
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1HQ-0000Vu-8C
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:25:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59486)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1HP-0000V4-VQ; Mon, 14 Oct 2019 10:25:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06D467FDFC;
 Mon, 14 Oct 2019 14:24:58 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E544600CD;
 Mon, 14 Oct 2019 14:24:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 04/20] hw/i386/ioapic_internal: Remove unused
 "hw/i386/ioapic.h" header
Date: Mon, 14 Oct 2019 16:22:30 +0200
Message-Id: <20191014142246.4538-5-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 14 Oct 2019 14:24:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UbS5FOcjhIXZ

The "ioapic_internal.h" does not use anything from
"hw/i386/ioapic.h", remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/ioapic_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_i=
nternal.h
index d46c87c510..fe06938bda 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -23,7 +23,6 @@
 #define QEMU_IOAPIC_INTERNAL_H
=20
 #include "exec/memory.h"
-#include "hw/i386/ioapic.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
=20
--=20
2.21.0

