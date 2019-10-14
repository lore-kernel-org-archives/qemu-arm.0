Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4502134wrm;
        Mon, 14 Oct 2019 07:25:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwikE9OdJGwFLpQ+ovYRthXzjz8Q6ZnE7pjY7oxKuYqyvLX/9+pvRwjmagUeqhEJ3Kcw5Yn
X-Received: by 2002:a17:906:3016:: with SMTP id 22mr28218426ejz.227.1571063104769;
        Mon, 14 Oct 2019 07:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063104; cv=none;
        d=google.com; s=arc-20160816;
        b=QwjAyP8kvn/v0XGmgf45lhN/c5IKRx99M0hGGsbVXG0QLvx6P81+eLUacjVMP2f3lE
         NDY6p39UpbezDZ6MGZFukWAl25Z4X9s76QmP0+0nvcQJ0c5rW6yxI815bSfRwcuWdfPc
         otBKJAHZ9vzAyu7Lb0RH6uVdo7/id6NmH+r2Gp4DHB2Rm7eh/D1RRzRyG5uqyHGoZuXK
         SI5aXQcRJ3un0MOLqw/oXzLfiXJC4raFMRW+N0L9ZVyjeE1m96t6ytfDn4DlUj/BFNfw
         0UYNHuBHwAC5Cv1fBhYiN+oAckc44I+5DMWK+WQhK1TnHoy/OOwq6aFowQTPmBZMOOU/
         EMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Zn0L3UkbHN07y7/3DEcmABvEQG8v3eUBO7dsQfzppY8=;
        b=oy77yipuRUrp3H5XM0WbF4ZfhVoMiyyCH6k2bCKEJS3efAtKbJaDpvwUv2H7PV15vo
         EvB2TgAnrk8o7C6fI6DzSS7jBdyI6NPJ5xCg0JgCzLHb3vvKKaQSPE5VO+tvlGX5aQuL
         XlhoF/SKj1N9noOTjv7AazeCZhCl5Azf9fLnl9CQZ/V1nIKQCFvpme7huv5KZ/9UVzQA
         zeFxFdLWTIx1kRWFgiQCiXv5bCrFolz9n1PpnGGjOlXm3l0neV5YRD2nIWEjAeKssEGE
         zn2SOG2wmXmmSG5t6VCd3cSw59Ha6HltGNuT27niuORVE8PcA49ddarC57woaWnQQaU5
         YIjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si11111017ejx.236.2019.10.14.07.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:25:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1HT-0005ro-Fe
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1GS-0005na-75
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1GN-00006E-C0
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:24:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1GD-0008Tu-Ba; Mon, 14 Oct 2019 10:23:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E2BB3086228;
 Mon, 14 Oct 2019 14:23:43 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A45FB600CD;
 Mon, 14 Oct 2019 14:23:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 01/20] vl: Add missing "hw/boards.h" include
Date: Mon, 14 Oct 2019 16:22:27 +0200
Message-Id: <20191014142246.4538-2-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 14 Oct 2019 14:23:43 +0000 (UTC)
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
X-TUID: 6+Y899ZoC0Hu

vl.c calls machine_usb() declared in "hw/boards.h". Include it.

This fixes (when modifying unrelated headers):

  vl.c:1283:10: error: implicit declaration of function 'machine_usb' is =
invalid in C99 [-Werror,-Wimplicit-function-declaration]
      if (!machine_usb(current_machine)) {
           ^
  vl.c:1283:10: error: this function declaration is not a prototype [-Wer=
ror,-Wstrict-prototypes]
  vl.c:1283:22: error: use of undeclared identifier 'current_machine'
      if (!machine_usb(current_machine)) {
                       ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index 002bf4919e..e85b31df1b 100644
--- a/vl.c
+++ b/vl.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
+#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-version.h"
--=20
2.21.0

