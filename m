Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4643860lfc;
        Tue, 1 Sep 2020 07:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7j4xAzKaScSoQkUtPRVNUEwagIvGoncZS3VdPFacCemW+jCpA3Ld5N8IMW+oMdX7hbucB
X-Received: by 2002:ab0:6596:: with SMTP id v22mr1549368uam.63.1598970870577;
        Tue, 01 Sep 2020 07:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598970870; cv=none;
        d=google.com; s=arc-20160816;
        b=LIytvzSxVzm1eCB9wksFB1Pg3a+YbwB5YQSPPh91874Erhd2X0r0Hszinl9GXXp28b
         Q9HzCQH1kCPCIc105mNuRwl3791yB9u7ZzFFj3zHAD1vCb35a9sW6Jq4WHl3uF85ozg8
         bZskRtY3BihU/jbugo3dS9aKIVP2ZMPIKo7Zo18NIgSaDighDCDPwJzgYqcusGHbtPpZ
         ysSwAt7DSjiiBp92lSaus5jq7kTC04kl1JO0b454a/SY3+87gjjECu8yzCv/CRXks9vT
         3MYcDBwohnXpWEjhKUl6B0kfBtSdAdLhtz3ieD4l5BFQfWdvKt+OpG03aH/d0qNAtd+W
         ePOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G8SjgyO6NF4SRPaQEFysirCpasoZJlLDbkIU4JNiAJ0=;
        b=RY7xrhPWEJGcU1YdQmfAs2dzjpOu5nClKgLeafZEoX+Cd1ywhSVcVEslDjkXHD6Jin
         zy9QcIP9InsQShxu5jDuT0Hy46Gi0liQA39+LEwMwPPy5fv+wfQjUvt5vYRwxV1BxFyp
         8lGKI4egJVU7Ojfi+szn/qkTAamGvNGLhpwxyl+ajqVujrF6bOmwV0igAeadzXLexU4G
         St9d7np5Mg4UPtWC5Zg72DcKIFQFBP2u+QtvDL7c8UQhcvnKg7EkRl+iAwha9OFMfCbQ
         O4bAYcH1MWu6mV7aJ7y48KGDiIABxo+W5kV8IHNQLsc1jmJIWtXbmJQ5Coueeu7BfMds
         IXAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G3Zaidbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123si393838vsk.417.2020.09.01.07.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 07:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G3Zaidbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD7Mj-0006Hn-TV
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 10:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD7Fz-0000Qn-Kg
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 10:27:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21323
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD7Fl-0005yQ-Pg
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 10:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598970437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8SjgyO6NF4SRPaQEFysirCpasoZJlLDbkIU4JNiAJ0=;
 b=G3ZaidbhqzA02L+xCYX61URLNsEuoKYckx7uuy0734m9h9eHNw3xYgIIqDWy1jvuUGiuF1
 Mp7Y7RhcENq39lYVd1yy1+oKbVTb4BQV6ni0c8DWyZbQIXfZRfLV/95lBtlWZMdWkZCZRR
 M03p1pZbic1Ce/W+FP3Bz3wl65MHn4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-SKZ4JIM-MyySoJe3jcBjag-1; Tue, 01 Sep 2020 10:27:14 -0400
X-MC-Unique: SKZ4JIM-MyySoJe3jcBjag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B2532FD05;
 Tue,  1 Sep 2020 14:27:12 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-114-76.ams2.redhat.com [10.36.114.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 129066715F;
 Tue,  1 Sep 2020 14:27:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: Peter Xu <peterx@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC v8 4/5] intel_iommu: Do not notify regular iotlb to device-iotlb
 notifiers
Date: Tue,  1 Sep 2020 16:26:07 +0200
Message-Id: <20200901142608.24481-5-eperezma@redhat.com>
In-Reply-To: <20200901142608.24481-1-eperezma@redhat.com>
References: <20200901142608.24481-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:11:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zp2hQr3zfmEi

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

