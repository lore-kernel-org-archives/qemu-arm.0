Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp367556wrx;
        Fri, 12 Apr 2019 03:11:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzh40ma4r6WJYVCllFxjCHgMTvSUfnCSUEZ8hIrMLeSH02bbnIiKoXl8EzkzAUQPwLbbxN6
X-Received: by 2002:a1c:6783:: with SMTP id b125mr10203716wmc.79.1555063914836;
        Fri, 12 Apr 2019 03:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063914; cv=none;
        d=google.com; s=arc-20160816;
        b=qa2ZNtd10+LqW9asaqstUv7NOLGd8qopcpWnv/oGz08S4mMopTje/ktjXk/eFJGF92
         lLUK/VadtW/GHlQbCokHN32VDEM3TtvyWn3mVudXX6TEnHQvgXanZHF0iXQcFIASH0Z5
         gs/PFvtC9LF1E9xDmf+1sZFd/VtNbXilUNW7yQ9vBjRgGyZOEhMWBHg0KfY8P/Nez9Ao
         FwvMU7MmHeRu1M5eShuDNGqTiTRrCZEFPLl90ItZFTcDh9v3uMiEBN7oz6za+mzDnb40
         /c8Fc44cZVWWailmmEYbHP6GsALVm/eesEyB864YcmrO52mSysNjXRlj52YSpyNZD8U0
         NA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nYhtzfw200B1krz2qXZLWSU/OmlfbODwSBf3ari3hyM=;
        b=1KQJ0PvEw7YIiAZ/m91IswQt8W2Cbrm/wdDx2g4YEDRSv3j6E3gKb3iv8oYWxZrlKX
         E8aO6T280Kp0+q24vgOnYNZfblBUKG7HrqyrRk4yRE0lAyCSQwZEzM4sZWFbxPy9YuCa
         5dxJcZ1TsZSZsAUXVbQKoMUicOMIjpwzKoyDl5b+Ixw5YCdKqHAFhfWPOfeQ97FdVgeG
         WkuIy7eXDTyO1QjaqypqOds9DPVDfzWLqJQwsyLmUWh9FO4nMixgGVqRnHgfpWm9TiNv
         zx99Tv3zQCjQVsXywJe5eEgciqXSJhfZzd/sNyiUPgCG4nTfSAls6Dljs+KygTlnuhOb
         AJDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1si26755084wrp.456.2019.04.12.03.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtA1-0007al-Pw
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:11:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3K-000178-OJ
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3J-0003vO-Pj
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:04:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt3G-0003rz-OI; Fri, 12 Apr 2019 06:04:54 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9590B8831E;
	Fri, 12 Apr 2019 10:04:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0554619C65;
	Fri, 12 Apr 2019 10:04:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:33 +0200
Message-Id: <20190412100354.6409-7-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 12 Apr 2019 10:04:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 06/27] memory: add IOMMU_ATTR_MSI_TRANSLATE
 IOMMU memory region attribute
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +x8apel5iqHq

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_MSI_TRANSLAT=
E
which tells whether the virtual IOMMU translates MSIs. ARM SMMU
will expose this attribute since, as opposed to Intel DMAR, MSIs
are translated as any other DMA requests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e4ee1d8b9b..ac4d06379f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -206,6 +206,7 @@ struct MemoryRegionOps {
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD,
     IOMMU_ATTR_VFIO_NESTED,
+    IOMMU_ATTR_MSI_TRANSLATE,
 };
=20
 /**
--=20
2.20.1

