Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp675763lfc;
        Thu, 3 Sep 2020 09:22:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykXY9HVkuQkUWfcLYeYmTTqKTxd4BecmZobivl2w4YMiXSeVzSOBUiB+qQHJ992dAfPCJe
X-Received: by 2002:a5b:990:: with SMTP id c16mr3633194ybq.303.1599150144061;
        Thu, 03 Sep 2020 09:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599150144; cv=none;
        d=google.com; s=arc-20160816;
        b=aYbr+UOxDE4nrLXq39XrdVx18y+BNv7AMb7cJWSpW2a5IQcRfM9HoJUlyrv/cZ1jT7
         HMiU92ws+SY9Uo3jNuAQfc8eyeWNHE3VA4i9CtgsZBtVwlQncvcpHhV6rLjZluUGp2Ze
         wWO8gLzlGusCD2tg5AbP8uXBjlNvnPwNU+DeTxhTjtJTaXk6uQ0Ckp6X7Le6aBd1WAyZ
         yUTG+05xiFQzFnORmcuVJXSmqtvN89PX+dmnLM/fXf678IxvO7xcLKMM/jSLzKaxv30E
         H/fWM7mJrrEnl5CaVQVStWSgOjwxc2wHjBAtrbHJp3S5jgAT0tU5uj+hip8yKallCoi1
         sTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eT0EEa82buNGU2M6NCOdQv5kzk8iyJg5XUwD3IgGAms=;
        b=UftOk4rr4XYrvAm6ZLCoQ6lxlmQJBezmT0VAte03rqS3MvYE+CiaCG8oFwVjY4gr6s
         JYNIAWz8MLYJijIe0sV3WwBwK62X3OHlOoS/+Q/oJac/sMGJJt3amvpuP5L/b2a/40Xg
         yDSenyU0CvdJKnzte+46uFWe2mcZLjlvsM5ue7LAkINxFZHtuPcFEvXDs6EYwCPrD+J6
         X04ryDv3br1AWUjIkKbSCmNAmXrXJYi2Fr/ZYlJKtk9IdZMx0td0JoERTNFyjlVaoTJJ
         5AwBkMWRm+g37Y44L5lk7FPsiin9cMllHOFg2VswnKOmIOVImhU0yM7P0xd9rioFUncO
         75ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jRhw+TPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m186si3276749yba.147.2020.09.03.09.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 09:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jRhw+TPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDs0F-0002Z7-GR
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 12:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDru8-0004HL-Bg
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:16:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39970
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDru6-0000kH-L4
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599149761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eT0EEa82buNGU2M6NCOdQv5kzk8iyJg5XUwD3IgGAms=;
 b=jRhw+TPfYoUs6959iyki2xJECAA7049W4b7j1YwsY1eLJ024GBEolrgFI5vtYdART5S8Dr
 ut9TQy5bnf27/rI2AXK5n7+o96DsoBkLVftA67PXAB4rC069y+aFJs+xu+K4sbty2CZLB/
 YGPch1N7r+E1Bc2oAaYV46Nc6loFs20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-3nfKtPf6MimaMeVL3OrNTQ-1; Thu, 03 Sep 2020 12:15:57 -0400
X-MC-Unique: 3nfKtPf6MimaMeVL3OrNTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A879510082E8;
 Thu,  3 Sep 2020 16:15:55 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-236.ams2.redhat.com
 [10.36.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E59D5C1C2;
 Thu,  3 Sep 2020 16:15:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: Peter Xu <peterx@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] intel_iommu: Skip page walking on device iotlb
 invalidations
Date: Thu,  3 Sep 2020 18:14:45 +0200
Message-Id: <20200903161446.29615-5-eperezma@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: tv5X3vr5ix3w

Although they didn't reach the notifier because of the filtering in
memory_region_notify_iommu_one, the vt-d was still splitting huge
memory invalidations in chunks. Skipping it.

This improves performance in case of netperf with vhost-net:
* TCP_STREAM: From 1923.6Mbit/s to 2175.13Mbit/s (13%)
* TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
* UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
* UDP_STREAM: No change observed (insignificant 0.1% improvement)

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/i386/intel_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index ab6833d5a0..fbbda0c87e 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1478,6 +1478,10 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
     VTDContextEntry ce;
     IOMMUNotifier *n;
 
+    if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
+        return 0;
+    }
+
     ret = vtd_dev_to_context_entry(vtd_as->iommu_state,
                                    pci_bus_num(vtd_as->bus),
                                    vtd_as->devfn, &ce);
-- 
2.18.1

