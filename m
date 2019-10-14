Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4515551wrm;
        Mon, 14 Oct 2019 07:36:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeLzPtr4ZK7Zhfv9WjmrrAaxoFiWcoiRCXVxwd7/2zChljHy33UQh97O0fmaatsubmbE9Y
X-Received: by 2002:aed:2796:: with SMTP id a22mr32310288qtd.324.1571063809086;
        Mon, 14 Oct 2019 07:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063809; cv=none;
        d=google.com; s=arc-20160816;
        b=hbAJZVKvg8nj7go5MGk5xgtaTCse6ZbrvNVm0c6D4wKCUfVBpb0Wli0+M0+GvIXhYC
         vXbo2uWLIRBqOK3hvELNzFrdzqj346eGGQjil5SNUqKAzpwws8WMWe/QPFSPBs2DEDZn
         Tlse3JMwQdUn7T8VxNlhSNMaczX1ArDKXpbe5VBlzj2KETSGx8uGPwL0U+BMqbQC/2rQ
         KI3uY/WlOd3nHuAs+nYDAMxDNfe2H/bD53Gr7IfYh7xw99+5mR9ZUuKYkGW0hExin1ww
         ARX6mgaf9RqNmYMbqPcwImg199QkQwaUHPRMxpoOmITsZBJih2cGwQSqg2w4V79eInP/
         Kvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ms703TrmWxRWYpFM6v9ncRXzN1nvPbg7KRlcGrLTniw=;
        b=VRBV+nyaDjXoVsz/5usZB76TzxMamV7HJP5XFTEXnzOdTtrriiVjd/Zl10wPW1Neog
         VdGX/Ptt0YyGji2/+KLct1eCmz3q+oi5qcRxXe5EykfQspLRhqitkBZYFg59hcwRLvar
         D5Sx14O2MoN7Mg2cudPgDsfxuVkcxgFp6HRR96t8oDusWUyQpKsAF7EvEIsFi+gLgtTe
         XGg8j8YUVTHT+AuBE7JGlpmu/GoffTczvgpa3n8OeH95G1erfFBGX8J6lJrfxopJKBoD
         P8qlcUlsHI2P69vQ+eGm83g1AiBlcNdVTNS6lHmVIrwDrDJa5XdPY1bpeN+6hUC2DsYG
         X8Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si17540559qtb.287.2019.10.14.07.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Sq-0002cc-1e
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1KU-0002Ey-Lr
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1KS-0001UQ-Id
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:28:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1KQ-0001TQ-KT; Mon, 14 Oct 2019 10:28:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F33301017C0F;
 Mon, 14 Oct 2019 14:28:03 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB003600CD;
 Mon, 14 Oct 2019 14:27:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 10/20] hw/alpha/dp264: Include "net/net.h"
Date: Mon, 14 Oct 2019 16:22:36 +0200
Message-Id: <20191014142246.4538-11-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 14 Oct 2019 14:28:04 +0000 (UTC)
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
X-TUID: b5Ji17Y/6hPB

hw/alpha/dp264.c uses NICInfo variables which are declared in
"net/net.h". Include it.

This fixes (when modifying unrelated headers):

  hw/alpha/dp264.c:89:21: error: use of undeclared identifier 'nb_nics'
      for (i =3D 0; i < nb_nics; i++) {
                      ^
  hw/alpha/dp264.c:90:30: error: use of undeclared identifier 'nd_table'
          pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
                               ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/alpha/dp264.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 51feee8558..013a9d3510 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -20,6 +20,7 @@
 #include "hw/isa/superio.h"
 #include "hw/dma/i8257.h"
 #include "qemu/cutils.h"
+#include "net/net.h"
=20
 #define MAX_IDE_BUS 2
=20
--=20
2.21.0

