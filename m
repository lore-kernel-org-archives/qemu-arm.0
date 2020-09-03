Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp673348lfc;
        Thu, 3 Sep 2020 09:19:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOn3ieMyylpDWmYmjCcFBtZ04P6pKk1fbCtLNLHHwnINnRKTRtbwD1+9NzJviTW/8BOSYm
X-Received: by 2002:a25:238d:: with SMTP id j135mr3927525ybj.206.1599149962569;
        Thu, 03 Sep 2020 09:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599149962; cv=none;
        d=google.com; s=arc-20160816;
        b=uZTeeGIDsyJx8uQTvnlrQnRFidmZxfjkQFRG3np8NGyQx1ua2c01fS/byn/Q/dhTMA
         qvjHLvkFolxOrl9jvi2AczhmNnihN2hHtMqocy1qt3QsVreybHVX4MpdGA+tUBMjL5q6
         +qhQNuwP4pP670X2oDxeHIqt6m1nUE5GYbwW86MfXpDbKvb6P5h4FXpRoTKuQIf+6gPP
         AwJFqnhLlK8vxGzacCXqFqRhBHYwMXd6bGRMT/X56Ma0JqIADBb257ttEOMRqWCyUAMd
         8dE+0iewYJaA7ybA/3Dm4pN0cBMB3yc8eOBbYni4gevGD1P7awFNLyOgZ4nIm2mB+v/n
         8Kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pi4j9IwYca8Ff7bM22GVmBPYTiBZQNG/6icR4yOdY5I=;
        b=P6ExxXhooI07eGTeWYmoOPMfAJC35y3WqiXBLNagy8xvEBKzsQriNTZ8mp5aClu5Q/
         iyL6ObhllamdOmkUlMGHKcQ33eJcxkTH6kh3PfpQKAekyOGMz1znwSomYhfal5Vochk6
         r0aqVmFmTp09ccMX/uLtNS9xS6oCnT8XClxWAIV209628qK25EhEiV4fMDO+nVS+8DPv
         Sw8qqqdnj6yv6jHfTEv3CXl+h9p8OHcdqfJanvgYCZIsA9wdFDlHYchyk0i2AX69rov+
         d5AZItaD+kUqXgwKOG2pPOf0BLZnI3WzkZGrY3vZTpQ2cMu7lQBaP4eoY0xjzhi5Q10V
         u17A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SKaq0HA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si3636146ybd.311.2020.09.03.09.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 09:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SKaq0HA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDrxK-0007Mi-1B
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 12:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDruN-0004QZ-20
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:16:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22872
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDruI-0000mm-51
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599149773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pi4j9IwYca8Ff7bM22GVmBPYTiBZQNG/6icR4yOdY5I=;
 b=SKaq0HA7FS/xSUhG4N57ozfQRSroQXyaQC0PGhBswttEyIbw0GWwb7kZgJiYsun5sRvTqu
 nk4FyD10LF4nbsQbwoAIyDRWLF5gRgi49KsBckzEO108mJoDTDxDZe36fgn8Jb2X5JtCcd
 cJ3DFt5bAwXubvxTnSrgLfbs4W1f/+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-siiQPCEsOZCQKclMkNbeTA-1; Thu, 03 Sep 2020 12:16:11 -0400
X-MC-Unique: siiQPCEsOZCQKclMkNbeTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF2F8015A8;
 Thu,  3 Sep 2020 16:16:09 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-236.ams2.redhat.com
 [10.36.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5230A5C1C2;
 Thu,  3 Sep 2020 16:15:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: Peter Xu <peterx@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
Date: Thu,  3 Sep 2020 18:14:46 +0200
Message-Id: <20200903161446.29615-6-eperezma@redhat.com>
In-Reply-To: <20200903161446.29615-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200903161446.29615-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxjyXjsDJWXt

Device IOTLB invalidations can unmap arbitrary ranges, eiter outside of
the memory region or even [0, ~0ULL] for all the space. The assertion
could be hit by a guest, and rhel7 guest effectively hit it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 softmmu/memory.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 8694fc7cf7..e723fcbaa1 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1895,6 +1895,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
 {
     IOMMUTLBEntry *entry = &event->entry;
     hwaddr entry_end = entry->iova + entry->addr_mask;
+    IOMMUTLBEntry tmp = *entry;
 
     if (event->type == IOMMU_NOTIFIER_UNMAP) {
         assert(entry->perm == IOMMU_NONE);
@@ -1908,10 +1909,18 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        /* Crop (iova, addr_mask) to range */
+        tmp.iova = MAX(tmp.iova, notifier->start);
+        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
+        /* Confirm no underflow */
+        assert(MIN(entry_end, notifier->end) >= tmp.iova);
+    } else {
+        assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    }
 
     if (event->type & notifier->notifier_flags) {
-        notifier->notify(notifier, entry);
+        notifier->notify(notifier, &tmp);
     }
 }
 
-- 
2.18.1

