Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4516737wrm;
        Mon, 14 Oct 2019 07:37:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcKKzCwGSfIVvu0hF8RFiEcl2is/3i0/seUd3H+GfvFI9+eL/hNhakRcEsAqCpJmfQH/1I
X-Received: by 2002:ac8:714e:: with SMTP id h14mr33063558qtp.65.1571063878910;
        Mon, 14 Oct 2019 07:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063878; cv=none;
        d=google.com; s=arc-20160816;
        b=ILEpzKW2eGiHHyTKKNivbHLqnP8C1pDu5dwkxqinJBlp9ds8gl3gGrbPECsFomN2hG
         ZhBcgpU/Rv4VzpeqzyaGZyYaGS4/aTIUm5LY6o/48slh0X9ulgJA+D7ZnMxMnULDHk8i
         nShn213aDqwt2eqMhTdgKKtbYSnoFwBncU4kZGtdaDZSl+IszAeg1xmidv4e/+y3tDoV
         BqD65GS1tWdmw6GLlzERL8Ckbs8TKZ+TxFaXXz7oCOkaYZb+MSLdOxB5YZAOrhvX7B4n
         Ds45cx4aHKQprOc6j5ZSCgCx5AXDZucp0Bur4SQx2oTmJUMgK4UjLtChTSAod7O88AJ5
         /DwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=uny8Q5kablNdx9qHTNoU3WPHi8ngGpNNX5yzby2f4Ew=;
        b=nyLjXo2FyMxmMNY7CvYBhOpnTTD8EKAohVFirowwC9K1X5xhDrCuXl5z+6n46kaK9q
         8yIQ6YXKg4s+vanJx5ico0u/KZQCFqbyMw8zoHuTq52v+cGDW6Mig6TcQWNLbFBO8TFd
         45IJFlw4HUXCZr910jrJb9xL3nSQ63tFR3iyeq7GPSYjfegrBxJWF9Xb1hc5P7xqMdXz
         95BO0e+zt8jj3awHwVFM9ftl+tD+I5NLpASg8MsVhhLhQ1TV8J/i0eJ+ganBJBPsJshZ
         b4BvGVhNFOaFAdZfzqEpEbZFU9fOIb2FT9u8XzzGX7ObcspYMr5J+izj2L/Nmdb9m2aJ
         0Gsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si17011117qvp.51.2019.10.14.07.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Ty-0004M4-0u
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1ND-000509-7x
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1NC-0002Ri-3q
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:30:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1NB-0002RB-QH; Mon, 14 Oct 2019 10:30:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C908C80166C;
 Mon, 14 Oct 2019 14:30:56 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A245600CD;
 Mon, 14 Oct 2019 14:30:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 16/20] hw/pci-host/piix: Include "qemu/range.h"
Date: Mon, 14 Oct 2019 16:22:42 +0200
Message-Id: <20191014142246.4538-17-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 14 Oct 2019 14:30:57 +0000 (UTC)
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
X-TUID: +8gL9B5k2d8k

hw/pci-host/piix.c calls various functions from the Range API.
Include "qemu/range.h" which declares them.

This fixes (when modifying unrelated headers):

  hw/pci-host/i440fx.c:54:11: error: field has incomplete type 'Range' (a=
ka 'struct Range')
      Range pci_hole;
           ^
  include/qemu/typedefs.h:116:16: note: forward declaration of 'struct Ra=
nge'
  typedef struct Range Range;
                 ^
  hw/pci-host/i440fx.c:126:9: error: implicit declaration of function 'ra=
nges_overlap' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      if (ranges_overlap(address, len, I440FX_PAM, I440FX_PAM_SIZE) ||
          ^
  hw/pci-host/i440fx.c:126:9: error: this function declaration is not a p=
rototype [-Werror,-Wstrict-prototypes]
  hw/pci-host/i440fx.c:127:9: error: implicit declaration of function 'ra=
nge_covers_byte' is invalid in C99 [-Werror,-Wimplicit-function-declarati=
on]
          range_covers_byte(address, len, I440FX_SMRAM)) {
          ^
  hw/pci-host/i440fx.c:127:9: error: this function declaration is not a p=
rototype [-Werror,-Wstrict-prototypes]
  hw/pci-host/i440fx.c:189:13: error: implicit declaration of function 'r=
ange_is_empty' is invalid in C99 [-Werror,-Wimplicit-function-declaration=
]
      val64 =3D range_is_empty(&s->pci_hole) ? 0 : range_lob(&s->pci_hole=
);
              ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/pci-host/piix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 135c645535..76ed252a60 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
--=20
2.21.0

