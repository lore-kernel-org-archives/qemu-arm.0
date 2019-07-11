Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp987709wrv;
        Thu, 11 Jul 2019 10:41:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxd/I51P+/iru/5wU5uBsVWrQR/Jgh0nKn39OOpr16YTmyeH8kW5IMG0EEIMPv687HQ17U8
X-Received: by 2002:a50:b803:: with SMTP id j3mr4701663ede.208.1562866893455;
        Thu, 11 Jul 2019 10:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866893; cv=none;
        d=google.com; s=arc-20160816;
        b=NeTCLoEQ7H8MKPL/z0kaN5taNbNXv3c8JqgI8ookJKVaaGWUM43yE9Vi3EEhkQqtjx
         aXDEb6ZIk7Fl59uHsC8OzBzz/N9SsWN6ooF8pZdxWBS/kfwX6EdJP+LZgsu4jg+cCtQI
         TETwqWnpxTq39kTHwZOLjRbRXYOyFdIRJdRiyDnAOPvPQH+guvD1s8XsBxfLWYHAyPAm
         ZAVqJUVE+/T+/sEp3YMHTEX/aSI+T6JtBPqWqvpDnb51Yp9NWbJUaD+G8hN6pO7UH0Re
         WnRFyYxxCs8YyaLp8VfE7loQdyUrixH8v0D2CPfWrpsYas3ozVXuVnfGDwL/9rWmUvma
         2QtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EDENHb0WVO88PucTw+lsKE0YuADlhtP81aPiqiRX9g0=;
        b=cYVd2iMsSReTWSSmtZ01nZVTTK55m2bgA2axG7llDYwPHoTVORQfUpaSFhxIa2CllX
         KioUo5mpJj4GhtvNSJEUfOz0YJx36q+c95c8co1XApXzprOcOw2ObM62+zo1yGnlJW2i
         pLwYmY5Z/rTkRgNjUgkW6v+bavpjDDGZdH9m+9kORwAKVyArvGC5ZsxIjYqhY9qkKoxN
         dTQEXn8PMzMC9Hu8UowfkZ5MlJhpOo044+M+JOCyeQ59vjGqumME9doKM74PDjJEiYQr
         qJLQ035oHlt1FOertctil2hI9dTo0SEfqVm9eo6YYfredx2fCtU/q8et0J6vOBWxwXZS
         9meA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si3474252ejb.77.2019.07.11.10.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld4V-0005Wf-VN
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38363)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld4N-0005F4-C4
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld4L-0004uB-3C
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:41:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld4K-0004jr-TN; Thu, 11 Jul 2019 13:41:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 62C6030832C2;
 Thu, 11 Jul 2019 17:41:04 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C851C6092E;
 Thu, 11 Jul 2019 17:40:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:15 +0200
Message-Id: <20190711173933.31203-12-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 11 Jul 2019 17:41:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 11/29] memory: Add arch_id and leaf fields in
 IOTLBEntry
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U9kabyCbu+xH

TLB entries are usually tagged with some ids such as the asid
or pasid. When propagating an invalidation command from the
guest to the host, we need to pass this id.

Also we add a leaf field which indicates, in case of invalidation
notification whether only cache entries for the last level of
translation are required to be invalidated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index d0de192887..8dd4d787d4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -68,12 +68,30 @@ typedef enum {
=20
 #define IOMMU_ACCESS_FLAG(r, w) (((r) ? IOMMU_RO : 0) | ((w) ? IOMMU_WO =
: 0))
=20
+/**
+ * IOMMUTLBEntry - IOMMU TLB entry
+ *
+ * Structure used when performing a translation or when notifying MAP or
+ * UNMAP (invalidation) events
+ *
+ * @target_as: target address space
+ * @iova: IO virtual address (input)
+ * @translated_addr: translated address (output)
+ * @addr_mask: address mask (0xfff means 4K binding), must be multiple o=
f 2
+ * @perm: permission flag of the mapping (NONE encodes no mapping or
+ * invalidation notification)
+ * @arch_id: architecture specific ID tagging the TLB
+ * @leaf: when @perm is NONE, indicates whether only caches for the last
+ * level of translation need to be invalidated.
+ */
 struct IOMMUTLBEntry {
     AddressSpace    *target_as;
     hwaddr           iova;
     hwaddr           translated_addr;
-    hwaddr           addr_mask;  /* 0xfff =3D 4k translation */
+    hwaddr           addr_mask;
     IOMMUAccessFlags perm;
+    uint32_t         arch_id;
+    bool             leaf;
 };
=20
 /*
--=20
2.20.1

