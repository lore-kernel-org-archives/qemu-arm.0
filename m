Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3867874lfb;
        Mon, 16 Nov 2020 08:58:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHoxWTNJWz2Q7PJJeBT5LTw+TKcdspNVulYPo7JqsVestUQ7ALPzC2Br6+a/M1bG5JJPLd
X-Received: by 2002:a25:42c6:: with SMTP id p189mr19983572yba.255.1605545906326;
        Mon, 16 Nov 2020 08:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605545906; cv=none;
        d=google.com; s=arc-20160816;
        b=aeLSd/pvfw9wuopALIP2LkLUEXkzw9XTbhctF7dOfHR6+HO/CpyX6fMfZXzfvkHeKM
         kBE5MAnVL4/E8NvX8mnENXujj1F6I5X/oZp4tvub7pjaLUTZWfOfl+c+tjULaovvNuKx
         8MoMcqAiaxMuwNPIs/1FNTm+AeNbqcpvX67IxDlEOQ47YnMAwitKEhtrPiZhjMu5yYv5
         ja4yxzndaXf/H2Vi5nUIFbLgNkke+MOaNbydmXe1wMvLbVg+HbwKvTYpYRyziMoffRP0
         8OEZEWBSdiS0a8wXp2dj1aAjVKm7GRpBEK3sEXkxvVrGcjk303BPWtTtb8nbW6xzSE0V
         pbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=te/LGP4MEKOHFzI2ew2SXawtf+K8KzijGMWYw/0CPKs=;
        b=j0jXKvJE03tBiwCPq7eVNVC/ChpX/uNCnweHCuki4txgGY3cc2G+65wfMYx8b1SWAk
         qkKtl7DXU1Kld/oHoUhG+X+JKHQJmtoUGZh/gbcSsrcnHcIeUwBGPE8rfANMbNTVCcpY
         DCL/uandlJSxI0tABoQNOC5QG3L6PGTtcONMFNj1ZqF9T+Sy5NV2ipOs4e1a4SYaxJEv
         81zFEVGyXmEo3yIKZTI7p+o9KDqeuBfErrShRNhuKzfg3DLnqzPDqpjYk0S2AMOiorys
         oN63GzOguqEr7S9+e6XwS9iwNZ5Wz/DBxmMb1Ma++7pbiHssOyzG6UO+IeFFCSt24x8F
         JO4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F9fTRa9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b205si19181484ybg.296.2020.11.16.08.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:58:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F9fTRa9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehph-00064G-LU
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehpN-00060o-MF
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kehpI-000856-RM
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605545878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=te/LGP4MEKOHFzI2ew2SXawtf+K8KzijGMWYw/0CPKs=;
 b=F9fTRa9LYOVAixMZqBuEXyvSQst3FVCBI7uVeFBGFlwtdq6LJsKgbJN4igZPIs1pFSJDKT
 xWKILWbQSwjpYUWuNPjlMFlp6zQAb/feu1h/bOZvW50fDAww4LbDqtBAgRIEiQNGS67bkL
 tc6pEYMsFgvcxqJFac2wWX+S7CHbbvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-V6T__JIQPEyr3SvD7M6xag-1; Mon, 16 Nov 2020 11:57:57 -0500
X-MC-Unique: V6T__JIQPEyr3SvD7M6xag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D6CC1008550;
 Mon, 16 Nov 2020 16:57:55 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-134.ams2.redhat.com
 [10.36.115.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10FD55D9CC;
 Mon, 16 Nov 2020 16:57:33 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
Date: Mon, 16 Nov 2020 17:55:06 +0100
Message-Id: <20201116165506.31315-6-eperezma@redhat.com>
In-Reply-To: <20201116165506.31315-1-eperezma@redhat.com>
References: <20201116165506.31315-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Juan Quintela <quintela@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4lX0PNdPclm4

Device IOTLB invalidations can unmap arbitrary ranges, eiter outside of
the memory region or even [0, ~0ULL] for all the space. The assertion
could be hit by a guest, and rhel7 guest effectively hit it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 softmmu/memory.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index ca281edaea..f1b6ba35f2 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1937,6 +1937,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
 {
     IOMMUTLBEntry *entry = &event->entry;
     hwaddr entry_end = entry->iova + entry->addr_mask;
+    IOMMUTLBEntry tmp = *entry;
 
     if (event->type == IOMMU_NOTIFIER_UNMAP) {
         assert(entry->perm == IOMMU_NONE);
@@ -1950,10 +1951,16 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        /* Crop (iova, addr_mask) to range */
+        tmp.iova = MAX(tmp.iova, notifier->start);
+        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
+    } else {
+        assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    }
 
     if (event->type & notifier->notifier_flags) {
-        notifier->notify(notifier, entry);
+        notifier->notify(notifier, &tmp);
     }
 }
 
-- 
2.18.4

