Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3940358lfb;
        Mon, 16 Nov 2020 10:30:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLC23URZphk6ID3O0LcxKay/mady08K0WmL44GcgaSLTXpeI2/GL9oRzRwTlSMrohNkXus
X-Received: by 2002:a25:aa63:: with SMTP id s90mr21962384ybi.340.1605551446422;
        Mon, 16 Nov 2020 10:30:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605551446; cv=none;
        d=google.com; s=arc-20160816;
        b=g3sUZiC+b1Oo2jHlXboIxYc61Som9S0MH3Zjh8gNpe1b+er1FZqS88+kMJ8LEQkJ3a
         EcRblZ67LDprP6wHhuwcFxPxeOHitw6FQGz+1WJtk7BqQTScrOLFpZ8I0/I0CG0bZ6WL
         /i/YVw29a0nS1O8P6kG7HSnYN5XTp1U/qMNDAb9MEdvyGN8CBcrj/r608Z8Yaz5KJf3O
         acVFJ56o6E8VAyLu8VzXhOGolQvI60N4EViJ2Xt/hPSVxWooqpmMG98JnB8Rag4Uzt21
         oUlsDyhDhe27MpEZ3O8MhMt6IOk64y402hJOhE/GJPAytkAVQyzvbiwPZIJfJYGh6yU8
         YPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ggQit1RgH0yZThe4/XKFSk7HmP+4GmQIfPuwULIsekA=;
        b=vfMc1qoW6NjCLGQLFHYr+f45Vdl8vuNoexXGb4Ccpvb5RuJQ4jVXHscBW3ZNKsuVDe
         InHFXhrDT/Hus6/5tHFe08qt69PcaAOikEYQGhZjMTbojZc445KpXo9UhHcI4A7xq+6s
         iMhGLxpPv3fmcB4TacRHPI2a5Ra+lMe48/+QdPZzlmL06V9V667D1I5gqU3XK8OeGpUT
         be8PcjAD1k3UkVBUPUtcZX/jCqh+930HzwfHJcNkxmCK1+gXjlqwCTIrbj32OKlQbDhA
         te0CgAkVKH9SDlmfJKyWbmC6E6sZqEMump1wLo4Vdk1dl7VZ0Dda6ypV1KPkeD0hZXZG
         mbrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZHLvvSqn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si19119037ybc.206.2020.11.16.10.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:30:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZHLvvSqn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kejH3-0001U6-Oa
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4D-0002PV-Mr
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4C-0001iV-4V
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggQit1RgH0yZThe4/XKFSk7HmP+4GmQIfPuwULIsekA=;
 b=ZHLvvSqnXfGZKEnfJJoaEvwpT5Cy+6IwDAhDUI2eNK2FPWPHIFsRvh1pFsHCqC5QuBgI3n
 0zMkG+3ySbWoRJg+mCaRoNzCjOknFTC3DHSak/5vHhbvruV04KhgpSOJDvxYlQmsRu/ZSz
 N1Pf8IMaucNDqODo6oN+ntSe1Y2UnCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-g2IV2g8hN0qlzQfjvAgMNA-1; Mon, 16 Nov 2020 13:17:24 -0500
X-MC-Unique: g2IV2g8hN0qlzQfjvAgMNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0197E57201;
 Mon, 16 Nov 2020 18:17:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFCA75C1CF;
 Mon, 16 Nov 2020 18:17:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 20/26] hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA
 invalidation
Date: Mon, 16 Nov 2020 19:13:43 +0100
Message-Id: <20201116181349.11908-21-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PvXGsqZhVNtg

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8a01382255..553b785fda 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -828,6 +828,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova = iova;
     entry.addr_mask = num_pages * (1 << granule) - 1;
     entry.perm = IOMMU_NONE;
+    entry.arch_id = asid;
 
     memory_region_notify_one(n, &entry);
 }
-- 
2.21.3

