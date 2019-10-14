Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4512964wrm;
        Mon, 14 Oct 2019 07:34:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzGjKUR0xg9gzIDqto7Uw/DzPHYoxWU0Mvt0wn0rE74hADtcL5wl/IXtw29RI6eXYiAW32
X-Received: by 2002:a17:906:8391:: with SMTP id p17mr27903618ejx.216.1571063674623;
        Mon, 14 Oct 2019 07:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063674; cv=none;
        d=google.com; s=arc-20160816;
        b=pCa10pUNJlViDEOr4lzr/UCKZFfzjNODz6CWnhWV9oUDXNLWTBF/iBuzWABTPWO62o
         DFGo+10MLASUEowAe0ouXTAleqqYRJ8YuUHjVVGSVfVKeVC/u4/hVojsmm4cjEpzXVCj
         m6C7pxkt+0sUiC51QGJ8LjeEaFjVVcTXMLdjW11dQX0mU6CMTy05yQpxtnmTTHu6RlR9
         fFy8rpljcIl1qk/HX+Atzhcf8soHdiO9AYSa5Ttmh3MZbAfmGlbIclrs+H4NtxSTPb49
         k9/dsV4LCzPzHfpUG0K1PIlDkKnoEC0a5Lq0NDRxQe2hu3RJg1pAp4cQk7ALob267seT
         du5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=b+N3SfYHdzyojlcBlumPKIhf1MGxIzygdYnWtYcA2iM=;
        b=HaIBd3BD8TkgU4Bq7/nBLPGjRqpXMCGUJ9Khx2BF7mQqcIcwb0rD61ixib4oSBYgpO
         TX2QDuodOBo9IvtBi4OH3S06HarFvF/yF53dQA/BSC51/2k9L5CSzdtPqp8jrkuU5xyY
         etLHKQAc06+M95AQvurr1+xqo4bAt0DxgcqDz5HxxsVjrThXw0fJX1Uvw9OsWGmuAvQq
         PmJ0aBbXJPoPSFGKl4mVaKT9DIAbr7inAJr8mDndNJCcM6Vfra3Gdo5dwhi/k1EXQXO5
         1DebOndsXW9gqCpZ3WIs8wUACCGSMx8XlenLTm4QZ60AARoD0xM4iv9wh6Sy1acfN1Xw
         iaHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20si10079553eju.109.2019.10.14.07.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Qf-00004w-EQ
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1MR-0004Dv-Mj
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:30:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1MQ-0002AQ-KP
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:30:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45148)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1MQ-00028r-FI; Mon, 14 Oct 2019 10:30:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 546E62108;
 Mon, 14 Oct 2019 14:30:09 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D59E0600CD;
 Mon, 14 Oct 2019 14:29:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 14/20] hw/pci-host/q35: Include "qemu/range.h"
Date: Mon, 14 Oct 2019 16:22:40 +0200
Message-Id: <20191014142246.4538-15-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 14 Oct 2019 14:30:09 +0000 (UTC)
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
X-TUID: fsbfMbTosohn

The MCHPCIState structure uses the Range type which is declared in
"qemu/range.h". Include it.

This fixes (when modifying unrelated headers):

  In file included from hw/pci-host/q35.c:32:
  include/hw/pci-host/q35.h:57:11: error: field has incomplete type 'Rang=
e' (aka 'struct Range')
      Range pci_hole;
            ^
  include/qemu/typedefs.h:116:16: note: forward declaration of 'struct Ra=
nge'
  typedef struct Range Range;
                 ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/pci-host/q35.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index b3bcf2e632..79a88d67b1 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -32,6 +32,7 @@
 #include "hw/acpi/ich9.h"
 #include "hw/pci-host/pam.h"
 #include "hw/i386/intel_iommu.h"
+#include "qemu/range.h"
=20
 #define TYPE_Q35_HOST_DEVICE "q35-pcihost"
 #define Q35_HOST_DEVICE(obj) \
--=20
2.21.0

