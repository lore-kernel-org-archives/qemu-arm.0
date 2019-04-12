Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp366937wrx;
        Fri, 12 Apr 2019 03:11:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQb7Roen4wlR1Kz3yql12CU3YFzSratNUsGqckSmHBIlPYamrNOrZnXY8+IjBGgpv2qiI0
X-Received: by 2002:a1c:2087:: with SMTP id g129mr10391209wmg.114.1555063882954;
        Fri, 12 Apr 2019 03:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063882; cv=none;
        d=google.com; s=arc-20160816;
        b=n73X39Oo8wj7eDk414QJ8NONxP8UpxkZNKkqDXEXRlhU/zd4zLo5y5NBdR70uhd3EK
         kw86EyZwvdOrMcsm1BUHIkrnFpD0zhBWKHsF0uz1PRM2NxskKjNX2kxsDvRcOMVCAz2/
         9Wrr5JnDXzDGp1IPnQVcOIjNdjCEfZULtafC4ofkHxIKLmk4ZIhZT5C1vI/dnO/qnig6
         XIkEknQkvBkv5zJRpqqdFmFSshMB/1nwe0X/zapG0mzihjlCyluNzc1CJEjCPtaV+k5I
         ljLwMjaltKh0b2sMmydd4BINyKTfOTZT/IuXTJqzOoWVuxdETV/F7MADl6ibitnMsgx5
         xOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3RBwQoOdtCY7H8pBUOvq+Z7nG8pml8/8kX64rg7v0G4=;
        b=bgkfxVQYI7s2k9QZAE17oITIAKuwwmOaxPDzSn+oPTJMwlJ/Wa5yZ8YaQpLZy0xSN1
         lhQlUQ41owMeGYQnvC/bhKL0RTl19n87nLeFd0I65z4b11uEbnLlCoxPZ9bAA+IVzKlv
         +RF7naQGgP8HEuWIbrnP3V7LyU+f6IJ/KLswZNe7QCBxhDAKkQgt1paA1hXmvGI/v75y
         cUC5ShcCpo2d1pyl8RpUZMvjEgOUoWf5oGj1+xfiJN9yQTe/JwSBINeDNzkvcZMcg47G
         akNo03FSSZxZK4QQ/wAlYAw+aJajZqXMeMsLEk+UvV0wxdR0tW2qqATSnQwo5C3Jl8p2
         cx+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si26344314wrv.79.2019.04.12.03.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEt9V-0007em-Sa
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:11:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3i-0001Y0-Px
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3f-0004Fn-13
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt3d-0004El-9x; Fri, 12 Apr 2019 06:05:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 562C1308FBB1;
	Fri, 12 Apr 2019 10:05:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2D3A19C65;
	Fri, 12 Apr 2019 10:05:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:38 +0200
Message-Id: <20190412100354.6409-12-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 12 Apr 2019 10:05:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 11/27] memory: Add arch_id and leaf fields in
 IOTLBEntry
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+o6fLfoRiYa

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
index f54052e9b3..aedebc8471 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -69,12 +69,30 @@ typedef enum {
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
 typedef struct IOMMUConfig {
--=20
2.20.1

