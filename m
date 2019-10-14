Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4514481wrm;
        Mon, 14 Oct 2019 07:35:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzz4pNdMcCstSOwU2xwbuuNY2nAD/825xCVcHMvAWGFPYZqxCpEN/l3zcDlpmmGLCjtuCiC
X-Received: by 2002:a17:906:28ce:: with SMTP id p14mr29444589ejd.164.1571063750200;
        Mon, 14 Oct 2019 07:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063750; cv=none;
        d=google.com; s=arc-20160816;
        b=wuYxnhQwDc2DH2kSZXMrNisv7nzWSI7ZVeYpMSqGwCmJ+I02eVhuxfThHGAaArY2wt
         yVlsZem/UTMJw8QbQUtqmRts1PecX7GiYFP1CMDhSTf/sF7i14RYRlnKrY4FyCQqv13V
         JOpowKWUtMk3vw6wOu51Mub1I8TpWKkkETZPSdBXE+DXFgWqVgfR72Qfsjm7PiI/599i
         d79IW1zGF4DYVaoh00MaejDwSetnCIF/XRYzWJOcgeYFJXFDN1rgMJFL8WMed/rJ3pP8
         05et/bp+PoeGMnu2Xwvs7YoYMy3IwD+E/nxp1b0nngWBawVuqaSAtRro+BnnVJg7Is38
         2O+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=568BYYKyDrE+Y6oW6YbPLks5G+i+o2GCbI8iSnM+gP4=;
        b=ezpKNxcBqTNW2dTFVozLQ+MxoDFC5KVl67kDUje58sdm85rKGE19tGw4wbqDmX0PqS
         hj5i7L6dYx0c+vHblR45UT7lCJfzAaPgJsmsh189d6tt5FVG9SGpMiEquTXHeBYogTJb
         RLesNdrZ1TGvOyVu3ITrSVlUAz6pIIZiJLXfVG+TEbiBfzmWVRF5qFu9M3TbPy9u370v
         RLoLGT7mRxQqWOk2n1KRHKEqS3lX0tLg1rGPuI+DXmRyZp1uIK9GTytSzNrHcGbuoCil
         RnvJZqu4wsgEOHb/iC+rfLERzV3AHGFDVNJw/onq479H2r8/UTva4n1BUGlz+ciZ9FCT
         QicA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qo6si11296499ejb.386.2019.10.14.07.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Rs-0001i7-Kp
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1Kv-0002s0-9G
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1Ku-0001kG-7t
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:28:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14148)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1Ku-0001k3-2V; Mon, 14 Oct 2019 10:28:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 052D510F2E89;
 Mon, 14 Oct 2019 14:28:35 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F361600CD;
 Mon, 14 Oct 2019 14:28:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 11/20] hw/hppa/machine: Include "net/net.h"
Date: Mon, 14 Oct 2019 16:22:37 +0200
Message-Id: <20191014142246.4538-12-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 14 Oct 2019 14:28:35 +0000 (UTC)
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
X-TUID: hG7U8WpjV8Rz

hw/hppa/machine.c uses NICInfo variables which are declared in
"net/net.h". Include it.

This fixes (when modifying unrelated headers):

  hw/hppa/machine.c:126:21: error: use of undeclared identifier 'nb_nics'
      for (i =3D 0; i < nb_nics; i++) {
                      ^
  hw/hppa/machine.c:127:30: error: use of undeclared identifier 'nd_table=
'
          pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
                               ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/hppa/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 7e23675429..6c55ed0af1 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -20,6 +20,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "net/net.h"
=20
 #define MAX_IDE_BUS 2
=20
--=20
2.21.0

