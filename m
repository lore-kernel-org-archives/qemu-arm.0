Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4982084wrm;
        Mon, 21 Oct 2019 12:09:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhcWs5sgX1H5HrspckzeDq1qJ+h2/qCc+v0cU+x1ZVXTxyKXIbfn2fdgvbqCLUvJ43zTdY
X-Received: by 2002:a0c:ee86:: with SMTP id u6mr11569664qvr.48.1571684944061;
        Mon, 21 Oct 2019 12:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571684944; cv=none;
        d=google.com; s=arc-20160816;
        b=SPN2BWggPpO0pqHzsTLlYgTGKZBx3idxUZ2SITaiM+ocKyCQ1mTNJI+mYSdnpWOkG4
         cIlXd1zHtyaNzGuRcbN2LuqM57wYBVhgBpeIwxXpa0yxqcpM74sA5xQ20hffBkCR6DZo
         cjPoZGoTwihHn+mCSMrth5twEoU1t+KRbzF0BEc2qBiaBUz95OaMqjGz4WCmQ/YLUOI1
         UPQdNglCYokSmaGeT4YmA0tV3p/4FNzXfKTiqfZvVKrKlWnm60fM94ARhArpmgCUT9ag
         urGIZ34KkWVKS1+0Bca05LfbqLCdsi/oR3HZrc69bfoB/evs/TLhubbEw55HJaMOlDAG
         sqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PxxT2q26ZZUAHp7TQylAM5LKENoqgx0DKKAcchaygfY=;
        b=devy/SsdfY62lWM9pLcJfKjA96IseLA0S4QXytc1jKKrBQvCL0qyg/j9AecZJUQwmS
         eJEILjsAkQE1ZyGaR1XzPsg2sKrSOCKTnoseEvNMDZL+UeNXeFEQUmNtJo8H+fKK+1FS
         UBb/2KVjMxYKag8jrX6Jxn1UimRsccEgaGpIZwIVAoph5zzkfU0ljSpwp73592N8mHKm
         aSiA1z6hQVGfKzOGkqfRTQhMnVau/6qSnSPupiwh/xtevy0ECv4x7bz/hTJ9tH3XfZo7
         75g1TapfOerheTctIkQSZyzsVxSUtjBjz3XhoCQoeljjKxXQtMQsN4Aw7zT3w2R3e9gJ
         j3hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V/Rov3R8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si9432470qkk.50.2019.10.21.12.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 12:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V/Rov3R8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMd39-0005BW-1t
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 15:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMd1Q-0003md-6I
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMd1L-0001r0-83
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMd1L-0001qa-4W
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxxT2q26ZZUAHp7TQylAM5LKENoqgx0DKKAcchaygfY=;
 b=V/Rov3R8BA2o7MJrr4zEXbxI9gq3J7FR/DOJSJvKGhm0JfDRnxFd4u/SJgVVFVXDgribtV
 0FgdOblB3Xi2TFnbWOkKpFfA5BsLmNKlopc7NSLeduU9UvikI/WfQScujqBr5rXIUe/tKB
 /oYls7MKPnaN1mEPXsT5fkQesrK8dfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-QaTmpAHUNfmX5dOoxMB3Xw-1; Mon, 21 Oct 2019 15:07:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA11107AD31;
 Mon, 21 Oct 2019 19:07:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-124.brq.redhat.com [10.40.204.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B81196AE;
 Mon, 21 Oct 2019 19:07:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/6] hw/arm/xilinx_zynq: Use the IEC binary prefix
 definitions
Date: Mon, 21 Oct 2019 21:06:48 +0200
Message-Id: <20191021190653.9511-2-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
References: <20191021190653.9511-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: QaTmpAHUNfmX5dOoxMB3Xw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xC+nYDh7ObPF

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/xilinx_zynq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index c14774e542..3a0fa5b23f 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -16,6 +16,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -194,7 +195,7 @@ static void zynq_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0, ext_ram);
=20
     /* 256K of on-chip memory */
-    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 << 10,
+    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
                            &error_fatal);
     memory_region_add_subregion(address_space_mem, 0xFFFC0000, ocm_ram);
=20
--=20
2.21.0

