Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp493742ejx;
        Wed, 7 Dec 2022 05:38:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5L+ai9OcEehBCLev82iZK6/nCpXhbC+WQm+cFoGlAwwPjUWFkF6mnJmBvc8vI0y8EYsw+M
X-Received: by 2002:a0c:c3ca:0:b0:4ba:8938:7d18 with SMTP id p10-20020a0cc3ca000000b004ba89387d18mr64949239qvi.54.1670420291596;
        Wed, 07 Dec 2022 05:38:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670420291; cv=none;
        d=google.com; s=arc-20160816;
        b=Dx2l9QA349naC0erz2b/AgdcsslMsy6tv34N4nZWzpPKQ1WdQzRV89ZcGrY+3bSqLd
         GxWwjZaALUk5EuR92C3cFiUI2iv23o0UyAgctxrk752NzqB4nw1xVOryGoRREZ/Lfi3p
         rkmOolb+IskD9kSF+2PZ8K1NBZC1/yOBzzmgY9PyPrhwLiIKRrnP55hZhwiQPjrmAwf4
         8PJWZOS4W5ZsKWyxyLs9eQMB8iHlQdR1h42kAjFRwlDlGfFL/VBt86PyRVbAE549GiDu
         NpT1DGbkupP9vXbw2P7kUCO1zPvCMjQmHBdyeMuAq1GGXJ0DV8vFQjBvR0USDu3lbUzR
         YmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7tnKkh2H991EuhWAO/Xp+JQeGePEbB2PoZpX19x2WTg=;
        b=lJo052IFZZOLblet2fX0UUPIDGOVw5uNKzSfDicxNzQp9kt2taFM41b/TrxMPuhzxD
         jw1t3uGCHpE62PcVELUgNO5p6YXa02Vo28j9yS4QkIqbDKV9h/McF9HPTNtgVM25B67N
         dyL2C6tN+OWQqYCkx+K7P5N88hL+LKohjI4rHWJnDzEnQbzriL0d57FdUAtjt10mQZwB
         1Dj1pJcXb/Lp8kc2Tr0pZSmdqRYAGRInbkyUjI3B68J2z6sLyN/kacOpG5m1BfWEcsvt
         cwQzv/iw6H7qKJZvM1A+9LhRzJQsHFSGolXc4csdiCz0NDzgQq1UoLAPwZ2TIptaGWrV
         2YiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DY86nv+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4-20020a05620a14a400b006fa40a468c7si9229806qkj.129.2022.12.07.05.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Dec 2022 05:38:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DY86nv+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p2ubz-0002Iy-5w; Wed, 07 Dec 2022 08:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ubr-0002Fv-40
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 08:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ubj-0006SD-H7
 for qemu-arm@nongnu.org; Wed, 07 Dec 2022 08:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670420224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tnKkh2H991EuhWAO/Xp+JQeGePEbB2PoZpX19x2WTg=;
 b=DY86nv+cQf1Onu+ojHFW1Tx68f/oTqG8TTr4f/qRrwfy4gjW2KVPH26bPP668hLdPcdSf0
 QifYTZQt+YbAS8DK/E+SnrXnLTXhJkOZxIX1/bOcMZNSdPyjd8ovX07SxKaEUHinPlpHAL
 jwK2Y44dq6rAjR+CFXGB+zliPAJx3GI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-fbEJDFEqOMWbpRtmD3ehzQ-1; Wed, 07 Dec 2022 08:37:01 -0500
X-MC-Unique: fbEJDFEqOMWbpRtmD3ehzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81CE886F130;
 Wed,  7 Dec 2022 13:37:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B969E70;
 Wed,  7 Dec 2022 13:36:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 peterx@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
Subject: [PATCH for 8.0 1/2] virtio-iommu: Add unmap on virtio_iommu_remap()
Date: Wed,  7 Dec 2022 14:36:45 +0100
Message-Id: <20221207133646.635760-2-eric.auger@redhat.com>
In-Reply-To: <20221207133646.635760-1-eric.auger@redhat.com>
References: <20221207133646.635760-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mB2L/8T7ZMbt

following replay() callback documentation in memory.h we
shall first invalidate (notify with flag == IOMMU_NONE) and
then map for existing mappings. The code currently skips the
unmap and just do map. This may lead to duplicate mapping
attempts on VFIO side (leading to spurious -EEXIST DMA_MAP
failures). Add the unmap.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes 308e5e1b5f8 ("virtio-iommu: Add replay() memory region callback")
---
 hw/virtio/virtio-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 62e07ec2e4..30334c85aa 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1034,6 +1034,7 @@ static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
 
     trace_virtio_iommu_remap(mr->parent_obj.name, interval->low, interval->high,
                              mapping->phys_addr);
+    virtio_iommu_notify_unmap(mr, interval->low, interval->high);
     virtio_iommu_notify_map(mr, interval->low, interval->high,
                             mapping->phys_addr, mapping->flags);
     return false;
-- 
2.37.3

