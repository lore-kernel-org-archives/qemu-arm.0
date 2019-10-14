Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4512575wrm;
        Mon, 14 Oct 2019 07:34:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxY0DpqliMMICNszbxKp7+mRg4er49W81zXS0KWtRFtVs3mcrxk6H1d17LZ5qV1e5vbKuwO
X-Received: by 2002:a17:906:f2c1:: with SMTP id gz1mr28651948ejb.51.1571063656699;
        Mon, 14 Oct 2019 07:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063656; cv=none;
        d=google.com; s=arc-20160816;
        b=aiF7KdAR5ug7Zz4n/m/xxIkbuUnLiW0zIeWZNzA68fLwOaLEFSU2C0nPKsEvMNYvge
         fSKlrTwAQo+HiUeBUFnUoi+EThEjwsxY5fy38Gy9/NOfIMh0k5Pxwg9l6P8AFfqjLzO6
         waCt8F8OeKb14EKzWXrVkdea8Ov4dVIYjlaoWMUKU4XMar5J4I202nqdA4jP5Gsd0GeL
         r+1E/ZxoIEkiHVbbhhQ/cwfj+UQB0PDVI1gCAfgqelefPpmZLiRTARLTSXijSzBCuv+U
         Ln2JFclrshZ4S0fKepFILRVHRwUyeY6W/5/Gj2e3EUlueY5VfGkJdukdRys/0ZBrNXH2
         dSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7Lx3eCfMtxgD5QnQkM1AjbkKhj/bKsvy4PkaXxtk3ng=;
        b=b0dycQLlykI4USbBrGNkv3Chef2yw9QyO2r/GGUDwdnGkbBfdY0JW0OAo4tFhK/ysb
         SGgz7GFzpnbp8BVaEq1tXydsPeUkilP03NKYrTneInt0KO2/YFGp8rBrzyaWKSDGtaz5
         W2Me/Ca4LJ75lZvSgqsE5RMNAuKhLT0fO6mi1IgOQjEG+gwyIu1jTFJ4v16dKOnAnij4
         LEclfyxbWhTxYtdpU3Nm5HqKG/i+0KzUrBhk3lBAe0yNlURR1wmtS0VuZwQlOR1ESyxW
         X/b9A1R+pPPpra3i2Bt+lRCO6+hnXamcV4SJoTsgnTtIQVhtUm1FzjfciZCUN7rgYvk7
         vO3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21si11331833ejm.122.2019.10.14.07.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:34:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1QM-0008A2-Uo
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1M2-0003xf-VC
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1M1-00020h-9C
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:29:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1M0-00020O-VR; Mon, 14 Oct 2019 10:29:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 168D7300BEAF;
 Mon, 14 Oct 2019 14:29:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28912600CD;
 Mon, 14 Oct 2019 14:29:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 13/20] hw/timer/hpet: Include "exec/address-spaces.h"
Date: Mon, 14 Oct 2019 16:22:39 +0200
Message-Id: <20191014142246.4538-14-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 14 Oct 2019 14:29:42 +0000 (UTC)
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
X-TUID: 9JcPOLvceHbf

hw/timer/hpet.c calls address_space_stl_le() declared in
"exec/address-spaces.h". Include it.

This fixes (when modifying unrelated headers):

  hw/timer/hpet.c:210:31: error: use of undeclared identifier 'address_sp=
ace_memory'
          address_space_stl_le(&address_space_memory, timer->fsb >> 32,
                               ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/hpet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 4772cccfe3..6589d63ebb 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -35,6 +35,7 @@
 #include "hw/timer/mc146818rtc.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
+#include "exec/address-spaces.h"
=20
 //#define HPET_DEBUG
 #ifdef HPET_DEBUG
--=20
2.21.0

