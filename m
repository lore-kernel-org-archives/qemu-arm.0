Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp977971wrv;
        Thu, 11 Jul 2019 10:30:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBNUqAZFvCHLWkY1x4n9QKHcQ7onSVbbgiYJecch0DJKqJ52E8wVKk70lgPPXEYKstGuhJ
X-Received: by 2002:a17:906:3d69:: with SMTP id r9mr4244492ejf.28.1562866250993;
        Thu, 11 Jul 2019 10:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866250; cv=none;
        d=google.com; s=arc-20160816;
        b=N8ZBgq1QK1XZFD13rudiRZCHezp20sCBgfdMEINjHQb00a3vOPLz6ldXUqh3fqZIlX
         wlFbVStawWCrrsWuhx2F+JLrvJx/NIRES4opAbuxqt3Sqh6wtGcVv2zu9r6I5XBxcpwe
         bsCvlGONn1n0jLFW50qUT+pJkDiBFe9MhJJDxR66qM0IbWSpxcnULD1W2dc8I4KAHZ3M
         giR+MwH34FRjQUb3oZ7LGO7qapb0Mq1JyDSze20DpajaZ38J/IGCAb6RIybxi7qG6yDX
         SOx4/g3cF9qEjVYyaqka5lXj5iuU1uYDStdLTvpZE9lyIYI6mWLFqnteYDcBMVFHB7ro
         S3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EDENHb0WVO88PucTw+lsKE0YuADlhtP81aPiqiRX9g0=;
        b=Z9Ukw9W5a8Fy1s0xN/y3plow/VI2sZZ1CuKm5z+IWci9rfkmr8/GDCzQAaG9Z89Gh7
         5e95cuDwdmcTZAcQM1Mt2PFPFREFHBoD9ad9gEC1pid/WpfVT1DcElNKLdgy/oV/MktI
         Awo6VRCwQms+SvMAbAabq//qXbxUEt4aiAIZLXXuqMb4Ai5sjrEtc5O93R2RDnsQKDWo
         E2BnF8TMkZ9PeRD+FQgJvX68uF1NNrpqVkFahbZWLvGKmH6CWXAMO9i7iRc+gHNviZ/1
         crWU7Kvdk7M4Tepu39G6mX3SH7RKMwCn8cz+HhiI5RE9Z5+0BlFCHvoxtmljtAB5URaA
         1bFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si3491429eja.9.2019.07.11.10.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:30:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcu9-0000qu-E7
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34268)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcty-0000aA-6T
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:30:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlctu-0002s6-IV
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:30:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlctu-0002pq-8B; Thu, 11 Jul 2019 13:30:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3DC830C31AA;
 Thu, 11 Jul 2019 17:30:31 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4B865C1B4;
 Thu, 11 Jul 2019 17:30:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:27 +0200
Message-Id: <20190711172845.31035-12-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 11 Jul 2019 17:30:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 11/29] memory: Add arch_id and leaf fields in
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
X-TUID: oKEq/lNTE9+0

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

