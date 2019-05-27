Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6316552wrg;
        Mon, 27 May 2019 04:54:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAwq7mhlII2XHMP40+cu8aVSKu1gcvun3llpqGTAAKhSJODOyeFEQ3xJV57Jl3Zv8MCds0
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr58451223qvd.51.1558958055790;
        Mon, 27 May 2019 04:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958055; cv=none;
        d=google.com; s=arc-20160816;
        b=A8m+azXy8VnFmFlAiCknclL4a5blfs1GFU7FyrOWnMRgkTG8+kA2bOCEhYVhzASw6k
         6JgmDxoamLR5PZPDHCJgZD/z9DJkgtxwQjB0biYGIuwXA8v3uzRAdbHpAdflkUOM1fYY
         BTg8khVhY5JSJYbV+o7aGhTstn6HCRC9wNHWO7Z6SYPWEOHd14UKlPw7Wyvee5UbuEGp
         /ZBYVeWdKi7Zjt2M1Wl2XL1inG85jr/MDz121uJs/Nfb1oJzF8DZKGzKH+rw3c2E7yP6
         DJz4nCb77+LlIIlpDh/EzvdDATWexoTPLWQ9Njf7oYXid5yA7xFtDGUhFlX8i+W684LT
         UKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=T81og2nCqamRrBvHojY5ICgxKA+dN67XZZQvwvvVvm0=;
        b=YNtd0BaAj6UDJpHGPsSWENpnJKNLIpyKrBWyJ6fBkyXG26d3cvg821QmUBXTNiIBhQ
         Ie/AI8PYuiBN7NySHrWKtEcQL7VVGkl1cPf08KWn8r39LRmCyR0sglZuo8gz9FNNfth1
         6Q3m4hfcTivw2c77v/3ZvswmQzkh3SGlO3vTZCyJt7+WWna1hYte6B2zWU4O24cZ+ZfN
         n77UABMBQXrQsf06bisOfPXCp8BFd2NeOf+lUAl8+nlxSS5EPTrg9AaVKAGhzGbmaS45
         +ngazIb0HmdnJinr6dpkptHnBw7vhPjHeU6evpkFt0zLlI6GI61I0XACyKaK/2VglQ5r
         7qLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si4255663qkg.103.2019.05.27.04.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVECl-0002xO-91
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:54:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2e-0003m9-Bo
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2d-0003r1-E2
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE2b-0003pT-9l; Mon, 27 May 2019 07:43:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 913AE5D61E;
	Mon, 27 May 2019 11:43:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D3525D978;
	Mon, 27 May 2019 11:43:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:47 +0200
Message-Id: <20190527114203.2762-12-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 27 May 2019 11:43:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 11/27] memory: Add arch_id and leaf fields in
 IOTLBEntry
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xTMbc4k/aLBk

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
index 701cb83367..9f107ebedb 100644
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

