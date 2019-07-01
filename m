Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2446110wru;
        Mon, 1 Jul 2019 02:31:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwd9J9vzTKAAoeJKQ8r682OQsICLGzbXFxe+G3xNHSGk9nz558rLHNLtff9bi5ygP5Eh9u8
X-Received: by 2002:a17:906:7e4b:: with SMTP id z11mr22314548ejr.214.1561973515367;
        Mon, 01 Jul 2019 02:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561973515; cv=none;
        d=google.com; s=arc-20160816;
        b=hU45c5DJmsk4Tr7aohmJkLR2v6RZuxNGPwD3CmUc9AVm/SIisYnK+vTOw6UQsQah/R
         YLg7HgW32ohIpcpJWxSfGhsV2dj9JcfzUHhOgmfeiO5TaldoQXXNXYyTfu2tOQvh7kbj
         YQdOR+C243x3HO8idLNCWyXhp1YbpEVZsmwlvIk/qYmK+J6D3HQRA7JCewT05838s3uF
         Rago8bVlPB4fNfY7DojKUTnXmiY2yeGwg4FI4j5me6+Bslk8KTzl8p12SJNVoIskEj5Z
         I5yeRJsoLLy+YpJyd/Z6wnLI2CBicvPoAX6ikytSD3nFlFnmh6GhYjfgzPUlSNze7FAh
         J38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QJOz5IxboWBUAR0WhSEvSs4gEZE6WbU5uudqeG1JbUc=;
        b=iPyaPZOsN4xRxuL2rEtJdV2VVRpxajxdlU8XwbEKrDWYLSyKGH0iHk6Ca3piXSVyQq
         0ihSE+6Z6aUUpEbcAin3LoYH3gwF0BnCQUZzM61hzvDvbOWXCnzM4p/E3TZimIX+Sp0G
         rLQIge5eAXBxrhu+qGpf7oRbk17k7bBQ3adNMANjfh9y6YCECEnwzJj16i8ZacEn69E9
         wOEhZMXsLZRTkyfwJRqzM6SJfywqLOyoeYYoGhuleM5zfcxa/Q0TadhXPoEzrCyn3aaP
         uUA7Zg86Zwrv0tWWDt7agP3uTDs1HsNEn9ZCVpj/kfN/0c0zhxTunXa/c6rYzps5hLPq
         q90g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si6575616ejb.289.2019.07.01.02.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 02:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhsfC-0002YV-Fq
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 05:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhsef-0002Je-LB
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhsee-0000MC-Dv
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhsee-00009G-50; Mon, 01 Jul 2019 05:31:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35B66811D8;
 Mon,  1 Jul 2019 09:30:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C02C7DF6B;
 Mon,  1 Jul 2019 09:30:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Mon,  1 Jul 2019 11:30:30 +0200
Message-Id: <20190701093034.18873-3-eric.auger@redhat.com>
In-Reply-To: <20190701093034.18873-1-eric.auger@redhat.com>
References: <20190701093034.18873-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 01 Jul 2019 09:31:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/6] memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU
 memory region attribute
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ts2wT0v3FISG

We introduce a new IOMMU Memory Region attribute,
IOMMU_ATTR_VFIO_NESTED that tells whether the virtual IOMMU
requires physical nested stages for VFIO integration.

Current Intel virtual IOMMU device supports "Caching
Mode" and does not require 2 stages at physical level to be
integrated with VFIO. However SMMUv3 does not implement such
"caching mode" and requires to use physical stage 1 for VFIO
integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index bdd76653a8..dd7ef23f96 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -204,7 +204,8 @@ struct MemoryRegionOps {
 };
=20
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_VFIO_NESTED,
 };
=20
 /**
--=20
2.20.1

