Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4611582lfc;
        Tue, 1 Sep 2020 06:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUCiQ3FTPEV4KAuyQxRdpIQUgr/ZRDyud5e3rLo9i9TjdQsQ0FpWCge5S9F61DNCA8BRt6
X-Received: by 2002:a25:c43:: with SMTP id 64mr2840792ybm.436.1598968642338;
        Tue, 01 Sep 2020 06:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598968642; cv=none;
        d=google.com; s=arc-20160816;
        b=Hs+qhR8M90gBK8e8sUBwdTB4K7/57e32AqqXkVZXA5YteLB9yjf0Ypnt1FgrfNN56B
         5tzXz+9K9PnXet5PdMvHxLEW7rApOWR7QPN9DTzEydv5ppuUFxh+S/26eKfRTLJs5vH7
         AwrDWXRYEkgsw9xMnfDCBQkC/cqCfJS9J5+IO6L1sIUBVhWhNv0jT98RIINsCZUSldZK
         EUnV/tMlHmz37///PHByDQB7KzDZf+wQbaljsNdNzPExWQLlLqt3I68ZqxyjtSmMiSL4
         XhZwhQzCS2PhTc/BlKeRlkA+cc1ZRn89hmggKD4d9Nc6CA6dU1zOJTVOIUgIltAcVGZ7
         AsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G8SjgyO6NF4SRPaQEFysirCpasoZJlLDbkIU4JNiAJ0=;
        b=rLpgzvOGZVDTuULSKcZnZJ2JuDA2U+DoG7ysvHEuljfUFP2Nbc/UtHZNVYz3Djshvj
         VHkzS0U+sGnB5LGYyWhR6lo7XAmnW7+CArDHLt/JAaTMxOTVhbE3P2j17rgQ2uDWnn9m
         Hb2NzE4vUzrxoz52bzsl4LyoQptWmL2qWBJvaOe5WF902f0C8cRB3nkfgFkFPwg38HDR
         V12aSpQmtDIr3d8FHWEqqFPPk3FCe+UT9BHp17BvOMNzt3hzpyTAOcaJdhbLpx2RgvOd
         gxgyUePhoT9QHnfHu5akKQoO3LbZ0DdPhnUojJX77BegpzBIb7eCggFeq+wt1jb8COir
         xg+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DIdYffHS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si1096106ybp.68.2020.09.01.06.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 06:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DIdYffHS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD6mn-00048y-P8
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 09:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD6lX-0002JU-2f
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:56:03 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40341
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD6lU-0001kF-6V
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598968559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8SjgyO6NF4SRPaQEFysirCpasoZJlLDbkIU4JNiAJ0=;
 b=DIdYffHSSyCnEW619poIJ/54ybJ8iHZAmGhgVhgXaik4UfnomhTKnOFpufbUeMKdZI6Pp8
 3x/VFyE8c4YIC1smb76Pq8r0yLOqxowhslIStcEK2B4pxhcsKxQw8Qs1b93UjL30j5oZ0y
 6UMeqTTH2EWmCZYmkU230qzn47wh3fQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-sXQCcR3jNVWTJjuj9FDKQA-1; Tue, 01 Sep 2020 09:55:57 -0400
X-MC-Unique: sXQCcR3jNVWTJjuj9FDKQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA4081007B04;
 Tue,  1 Sep 2020 13:55:51 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-114-76.ams2.redhat.com [10.36.114.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B47C89513;
 Tue,  1 Sep 2020 13:55:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v7 4/5] intel_iommu: Do not notify regular iotlb to device-iotlb
 notifiers
Date: Tue,  1 Sep 2020 15:53:42 +0200
Message-Id: <20200901135343.22136-5-eperezma@redhat.com>
In-Reply-To: <20200901135343.22136-1-eperezma@redhat.com>
References: <20200901135343.22136-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 02:08:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sr9GjDaJw7E3

This improves performance in case of netperf with vhost-net:
* TCP_STREAM: From 1923.6Mbit/s to 2175.13Mbit/s (13%)
* TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
* UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
* UDP_STREAM: No change observed (insignificant 0.1% improvement)

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/i386/intel_iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index cdddb089e7..fe82391b73 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1964,6 +1964,12 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
     vtd_iommu_unlock(s);
 
     QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
+        if (vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_DEVIOTLB) {
+            /* If IOMMU memory region is DEVICE IOTLB type, it does not make
+             * sense to send regular IOMMU notifications. */
+            continue;
+        }
+
         if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                       vtd_as->devfn, &ce) &&
             domain_id == vtd_get_domain_id(s, &ce)) {
-- 
2.18.1

