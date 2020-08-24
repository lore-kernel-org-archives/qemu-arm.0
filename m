Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2454810lfy;
        Mon, 24 Aug 2020 03:50:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS2/KwMiwOI4iipPlsPVqLCjqfLk+CCuVeVfdvM11yn4r10AJbc+d3rMR6Yv7y9pQ3rWQ1
X-Received: by 2002:a25:c791:: with SMTP id w139mr6459460ybe.345.1598266231989;
        Mon, 24 Aug 2020 03:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598266231; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9rouHvETvHJ03UN13kSbxfPSKtTrSWF6CakYgwiKvfLSHEubr3dcA57HJ797qXV2C
         s39smitcaqqq7fU7zuS5OZbMvzC+Iel+U+FE1NlZxO4w31w51UJLkiazdgMxoGaEIjD7
         xLZ63Mz/e8T4ZTeVehyXS6tgWCIjSnzHbbCxjVt3oZG+47GjQJHmtHc6WIrWmlvPRt2N
         dn7PToGSYT+q9Bj2s6zyIM3CCE0gLSMTeVq5ZcLvUECxBv7bR3+SkDle0zvSP0tNA3fZ
         541oaSLrT60jN3Ebn/iC2AImjrcfGCWZg93ZffxN1c5A+ceuFvN1RhhSVEieEisXLQTG
         O87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eIIssfzSqH4QPm17XRgwhAA0VNgowwwIIZ9QyQ8HVHA=;
        b=PqC0TizpyY19b2/wcTmRqhResEsleqMKItYA97af6seWfSub+1aY8Q9i+NUzVeuqZQ
         xKoGRC/vTUueZUpPaO+cie3I7DL6OPUDDoWNGHOjwsNcT6VDYyYU2pAeOp/cxSH7i8df
         NB9Rg7gpewOWRcPm8Ehbk9qjlbjLGyiUM2kAuu269GsF7PBCjwEpdhVJSHSS9llm0E+u
         oSTKjUMpjSWx/FGfP5siR99QOI42be38+piIEjSu4vTU59WuWUYoAF0rHlUEkRcED8mD
         4dUxsxGPA7K1EflsilR6n/vCL6obygJYm6qLCFFxy1dqh7nh7OKotxrMTLRo67xco5XN
         Q16g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dl3aGSO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n126si11116233yba.429.2020.08.24.03.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 03:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dl3aGSO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAA3b-0008Hg-B7
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 06:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAA1c-0005H8-PY
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 06:48:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51550
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAA1b-0004L1-EF
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 06:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598266106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIIssfzSqH4QPm17XRgwhAA0VNgowwwIIZ9QyQ8HVHA=;
 b=dl3aGSO8Zx9OMQzAdnoqWqhG5CcXl5sJyUglc54ZaIEYR2H3vKR+sjrf6XtmYEmtkGnDwN
 NLvZeNTh+BJQ+ikWgtmgguGf2mY977RwxEfHWZRUjnxhG11HSQ7ojj9uwLGMGa6x0FBAjB
 jhHkhuAMc/QqKnwx9VS2kfIivNDjmds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-Vfj3Z9HuOlWlWrczM8QB6Q-1; Mon, 24 Aug 2020 06:48:23 -0400
X-MC-Unique: Vfj3Z9HuOlWlWrczM8QB6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2952180F057;
 Mon, 24 Aug 2020 10:48:22 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-176.ams2.redhat.com
 [10.36.112.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF09660FC2;
 Mon, 24 Aug 2020 10:48:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: Peter Xu <peterx@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC v5 3/3] intel_iommu: Do not notify regular iotlb to device-iotlb
 notifiers
Date: Mon, 24 Aug 2020 12:47:38 +0200
Message-Id: <20200824104738.20664-4-eperezma@redhat.com>
In-Reply-To: <20200824104738.20664-1-eperezma@redhat.com>
References: <20200824104738.20664-1-eperezma@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 06:40:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJTxFdATHmrj

This improves performance in case of netperf with vhost-net:
* TCP_STREAM: From 1374.81Mbit/s to 1845Mbit/s (37%)
* TCP_RR: From 6559.36 trans/s to 7916.29/s (21%)
* UDP_RR: From 6705.39 trans/s to 8199.39/s (22%)
* UDP_STREAM: No change observed (not significant 0.1% improvement)

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/i386/intel_iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 2ad6b9d796..d539a9f281 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1959,6 +1959,12 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
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

