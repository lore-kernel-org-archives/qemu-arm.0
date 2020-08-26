Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp815570lfc;
        Wed, 26 Aug 2020 07:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG0B+XIt+H3Sllne7dw4a0ceps67ipEtDLiXhT+oC/+NLpu+ihqIbw9nSqL1z4PUAWCzeF
X-Received: by 2002:a25:5556:: with SMTP id j83mr23617881ybb.385.1598452830741;
        Wed, 26 Aug 2020 07:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598452830; cv=none;
        d=google.com; s=arc-20160816;
        b=kTRI7s3OUaBHOIyOXaxbcEm5S1rwikOa9n2iNRDGNg6ieuO9aYSjocHLyEis+ZDWpG
         WAcQDAW/hr9RVcw8VO2BDJdsS0rnnYuMdsAm/Bn59/SfhZm5CRPpiR1pKtg38U2UpL4O
         R7+xN5mRBHQWkQ346cj43tzUmTYLPGhab+gpO7UOJoncfLy9KV7tztOkRabwIagLnDik
         QyQqstmAXZZu2ryW1L0VJXE3JkhadiyGVWKGLOM3Sq1OrCUqdRE+KkVcyzdTvprbSMCT
         oldXmv55Z1/6xctUXWlQ3Xlqtt1W2hmTnMk9FweQGp/eTAhf+glQRCR0HqPv9GM/iwCL
         J9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KaGyxX2iurcUU1VjRNA2tYBF2S9PFsb51ufyJr6sbM4=;
        b=Vf6efocpNUcme9eSpM3qeG7QCBa2zQw4RYeJckKkN/adQfeojVtYcbjdUNT9Lu5+jn
         2r75f/OAC7Kkl+WUwH7lEW5b8b8/kl+avr4NDip4tKMcmtEcEXeQ+NIHw0dLJ26PZ78G
         ZnLGJ56JD7RxaI5QkXWMn6i/sw2Qql80rvGGN7KdOPNlJbNT+4dRgkvA0i5yJqQSb0Z7
         oXi/ylqvkVXsYVz93Tzc0vAjdb27EM1cGWBnWqdlaEQLNVFntpPoOI7fmRMD1gUZRY6g
         WeeGNh1RbJP4OQtlaqeQiglkpX2LvceSbKuUqOCeTUImSY6hKNRPi6g9ynqIxv4T/V4u
         4YOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jT4VNCd/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w67si2363170ybc.303.2020.08.26.07.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jT4VNCd/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAwbG-0002GF-1m
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwZo-000875-23
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwZm-0006KP-EG
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598452737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KaGyxX2iurcUU1VjRNA2tYBF2S9PFsb51ufyJr6sbM4=;
 b=jT4VNCd/YZwICgLTPg1Lt28TTP0MxkTS24ON0SmNSA88cvePFZRvecxWtk2r35i0NHPrXq
 r9dQAD+53FlUUb18e8zw8Sr/9gPVUbAR/IGSzYNkrmwSSm8RvPLD+ye3bao386Rju4z/n/
 fop1AUvo2MW4nnUWHEN5y6d3w1Xns6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-7KLE7cvNMXm15MpKIEaYMA-1; Wed, 26 Aug 2020 10:38:53 -0400
X-MC-Unique: 7KLE7cvNMXm15MpKIEaYMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE9E801AE5;
 Wed, 26 Aug 2020 14:38:52 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-59.ams2.redhat.com [10.36.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B41576E00;
 Wed, 26 Aug 2020 14:38:38 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v6 09/13] intel_iommu: Set IOMMUTLBEntry type in
 vtd_page_walk_level
Date: Wed, 26 Aug 2020 16:36:47 +0200
Message-Id: <20200826143651.7915-10-eperezma@redhat.com>
In-Reply-To: <20200826143651.7915-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wryweshXsEza

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/i386/intel_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index ed83e496b8..0b3399874f 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1251,6 +1251,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
             entry.addr_mask = ~subpage_mask;
             /* NOTE: this is only meaningful if entry_valid == true */
             entry.translated_addr = vtd_get_slpte_addr(slpte, info->aw);
+            entry.type = entry.perm ? IOMMU_IOTLB_MAP : IOMMU_IOTLB_UNMAP;
             ret = vtd_page_walk_one(&entry, info);
         }
 
-- 
2.18.1

