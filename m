Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4511914wrm;
        Mon, 14 Oct 2019 07:33:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkXpmJNm5uTfwWGpE1nn9dIKucb/M5FUA5+13n0Dr35lqln6mwcze7qnqt5RuIDHbogTBg
X-Received: by 2002:a37:7604:: with SMTP id r4mr30566101qkc.293.1571063626509;
        Mon, 14 Oct 2019 07:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063626; cv=none;
        d=google.com; s=arc-20160816;
        b=R/V4bfWVu8cU3b2oq0LpLIXIwkX+ij+r94MqQ/Tl+NCtNaBD4Jz8FxGRbytYkj66c3
         LIx2MvdD51QequRkxUxHOqOJyoDEnGVmkNJ3Pb8louMR5qT/w33Og1dr+9ca+H24tth4
         e3mmDN5InJAokvwrgqdb9CtHsUxIdN1jNBYA4Qy2WwnNz9sWEqwRcIg0JyZZ+H9Pp5jO
         kSyHvX1EryGWjjLbx0rNsOdRSGE53olRnn4zgYN8ci9mednn6bt69/QeMoH/nU5QRCFi
         yJnEDFjzbJQfW6ndHSZUuouZrgdmbLG6Qa1wXUnVkCzADsy/1/mMXT1Yu9Gxs1jFYcz/
         +KtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=m75eqrj005aMDC9KdHgOZZgd0Fo5WKF2LxZeHvz69Ew=;
        b=C9whVVQUSvFH/+I/aPUdsmMN40IEDPrrf1XFFWXN9lJ6AsuLjHrP0XS1imHCQyafME
         It/YWrV+IB+TWWuixfkRAfTVlJmPPXmGZHvQ3PeVAQ4+G5weAR6NJnRFNFATfMNxjO0d
         doGQkpVeV0L+TjgXRDW9gWnowWDPWRYwDoE0R3avoKQkIWviWvRe3aAcLlma0vGsKL5C
         AVKIXfKxXQD41v5FUqi3QF5uV7az3Voko5VzUIVvRxb5lNLfucWlmXiYvT4NZ6rVP3vK
         a+pwXA5nPBS38G8ZysCJO0vgRM8ws/dT9g/pC18jwgGe6pUIG00lKP9Gcp1U9YfDe/Vi
         p8uA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si17159347qvg.144.2019.10.14.07.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Pt-0007XN-60
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49307)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1K1-0001sd-C6
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1K0-0001Nx-Bm
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 10:27:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1K0-0001NU-67; Mon, 14 Oct 2019 10:27:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3584A12BE;
 Mon, 14 Oct 2019 14:27:39 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CE1600CD;
 Mon, 14 Oct 2019 14:27:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 09/20] hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
Date: Mon, 14 Oct 2019 16:22:35 +0200
Message-Id: <20191014142246.4538-10-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 14 Oct 2019 14:27:39 +0000 (UTC)
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
X-TUID: lQ2cqjkWnDoM

alpha_sys.h does not use anything from the "hw/ide.h" header.
Remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/alpha/alpha_sys.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index 4e127a6de8..9991535c0d 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -6,7 +6,6 @@
 #include "target/alpha/cpu-qom.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
-#include "hw/ide.h"
 #include "hw/i386/pc.h"
=20
=20
--=20
2.21.0

