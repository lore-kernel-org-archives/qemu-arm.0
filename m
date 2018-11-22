Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp951089wrt;
        Thu, 22 Nov 2018 09:20:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5c8qH7BfhEaXos5Dt3UG9EbWxzTGexoVHMkHehQEGwxR233JhXXkC02ojxNQ28DX4iiLjM2
X-Received: by 2002:a81:6b57:: with SMTP id g84mr12303377ywc.108.1542907218014;
        Thu, 22 Nov 2018 09:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907218; cv=none;
        d=google.com; s=arc-20160816;
        b=0H8JSdD+WFHC8os75hcKJ3AGWrRWEZHEZ7eE/DJu6UVRru7Qb2pLXfxKcZDIXt+bvw
         pk0a5Pt+wXcmRghnSW7fAQCg7d6WePmmK75Ml+qCpfiaR7GqBQVcUxKd3pmomyOHeT5p
         eRGJeFdwB2/SVank0CVdGnwvqdVUgzeOUFJUxM6+E+VzRGFpjv0zxy8Xeg7QSwf846+f
         EhvgVaS+uaZiSCdtINNHvXm09Lr2joaKaY39pBXN0rziDQkQ/JoqGJAjXMylBdyiALMo
         nG9LO9aLwQvEx6VdT+PkxTrqtpuqmSnD6EjwYRGrZKTsFoirVukqxjgiJJk6cdAB/TO1
         KBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=jsP3ZwToTRgn4oK9gM70v/AV62jZLI5S5BkS76Q2Moo=;
        b=QgfFmYdWRLMhb/Zd2/LLNRH+iQt1DUNN1rzgI0mA+qKjBykEjxmsQWa9voSBq50pE+
         IGZHnuNKA7ASYh7E+V43LI0zapnUhgyQBGkIueKRvPQXLsEZJP/bJQtucOS4tSkJTGZZ
         LjeQtuZt91JB+6FGzOOY9JjTxkSTfXWz4FdWg7UM7pt538Q/CriO2i+USbUaUEzd1Ohh
         6JKIbmMoRuPQh/57PUF/fZRtccv2KjeXDTte949X6cwuMv0OIg4hBbCvsUQYoN8bC/MK
         X1HM+4SWAfOdKgoEJe+iDCO3hMD4Gdubu56JypwbIyZnZ5F8orc2F9/MSxPjUIDQKJk1
         eEPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b186-v6si30767169ywf.379.2018.11.22.09.20.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:20:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPseH-0000Xb-9j
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:20:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaK-0004iu-Sb
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaE-0005WN-Vj
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:16:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsaC-0005SS-Pj; Thu, 22 Nov 2018 12:16:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EE8E3084026;
	Thu, 22 Nov 2018 17:15:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B878D60610;
	Thu, 22 Nov 2018 17:15:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:22 +0100
Message-Id: <20181122171538.12359-2-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 22 Nov 2018 17:15:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v9 01/17] update-linux-headers: Import
 virtio_iommu.h
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DcKKXgdStziV

Update the script to update the virtio_iommu.h header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 0a964fe240..55fd271a32 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -159,6 +159,9 @@ fi
 cat <<EOF >$output/linux-headers/linux/virtio_config.h
 #include "standard-headers/linux/virtio_config.h"
 EOF
+cat <<EOF >$output/linux-headers/linux/virtio_iommu.h
+#include "standard-headers/linux/virtio_iommu.h"
+EOF
 cat <<EOF >$output/linux-headers/linux/virtio_ring.h
 #include "standard-headers/linux/virtio_ring.h"
 EOF
-- 
2.17.2

