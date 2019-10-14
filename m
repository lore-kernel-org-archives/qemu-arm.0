Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4514396wrm;
        Mon, 14 Oct 2019 07:35:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwia3FrzYLbeynJBqHX7JLGnccIedauZs24x+p40CBVhYUjLTxfnzBYNiXOnoAOhTFI3xiH
X-Received: by 2002:a17:906:cc85:: with SMTP id oq5mr28197391ejb.81.1571063746000;
        Mon, 14 Oct 2019 07:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063745; cv=none;
        d=google.com; s=arc-20160816;
        b=m+bORpLSLnqBkkW4duiuR9v0CpXX1D8IyNpKaNSPxRHJcRD4z2mZljpvJ5TO4p09o2
         cWTuDUgTRHowWP2khmygDHkZkeqfrfHNCxj0ZR4olF50L1LUxSVWAjNOONUlyUv6drdY
         C0r1VWsiiVtkPR/4914ZOERA2x2asY8o4pH5d/4yavlLLaJipyw024msW5TMlvqvDxEU
         mjN6xS5f/hPNUTMw9GgQofHKXeZrBvm1mnYYTqMePrSWL3c1ct9EctbjuQROw5ZiJ8W3
         33RaiMHY6/jmiKfs9R0LwW7CHtlcrdw79wtw1D+r3Oz87ZfOyRiYRQn3jD7G/8sMjDCF
         KV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7Q5YtBjZTD6wKmSt17IUPvfSKzBi4K14Lr11Roui7lI=;
        b=DWoab9yfeTqRTmOI+4IWUcN+Ow5LpAPg+PS/gbbKMgXezCwEuT/JCPbTdobwff9GIF
         pZEWmsLzWsYOr9UkyGP/xGru3mHVkNqKRTdoYufCiV8hmTDlEQwR/QtcOlnM+L5CctXS
         qH9q/VQyToQEuZxbFpInmu31zovTJC1G8gGy9IsOWXJgTUQ6RcZUMVYx388Z6wI/2AVW
         fHoH2DA3z9EA7jAZY6YaNGevzAh/S9WtWBZw7n61iqGMd44Lw2kz54PVmTx2JXzhgZxf
         oJJAk9Oj9Q0ILIDcolKGyKKRKRKX6ywtX5F6L3pSTKDEszxTYej2/U03ekWU1O4d0U7O
         oiXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si11761792edb.286.2019.10.14.07.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Ro-0000dg-Ph
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Mv-0004cL-4D
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Mu-0002KM-24
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:30:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Mo-0002Hn-KB; Mon, 14 Oct 2019 10:30:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 478AE3CA06;
 Mon, 14 Oct 2019 14:30:33 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDDF3600CD;
 Mon, 14 Oct 2019 14:30:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 15/20] hw/i2c/smbus_ich9: Include "qemu/range.h"
Date: Mon, 14 Oct 2019 16:22:41 +0200
Message-Id: <20191014142246.4538-16-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 14 Oct 2019 14:30:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EHMfFLFvzYxN

hw/i2c/smbus_ich9.c calls range_covers_byte(). Include "qemu/range.h"
which declares it.

This fixes (when modifying unrelated headers):

  hw/i2c/smbus_ich9.c:66:9: error: implicit declaration of function 'rang=
e_covers_byte' is invalid in C99 [-Werror,-Wimplicit-function-declaration=
]
      if (range_covers_byte(address, len, ICH9_SMB_HOSTC)) {
          ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i2c/smbus_ich9.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index fd50fb851a..48f1ff4191 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -21,6 +21,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/range.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
--=20
2.21.0

