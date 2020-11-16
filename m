Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3928981lfb;
        Mon, 16 Nov 2020 10:16:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9AoZlbXleaiNOBGym+abYukWfZzual3PDeNfvbHwYimoZrdEW9vCxN0xu4uiCk5D5of4H
X-Received: by 2002:a25:905:: with SMTP id 5mr22051084ybj.44.1605550576642;
        Mon, 16 Nov 2020 10:16:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605550576; cv=none;
        d=google.com; s=arc-20160816;
        b=wljATIu5KXNCzJmCj82WlL6zMAmuU/ppX97mJ2HT9NHi3RFE6knsNz9pRI9Wceyk8H
         njERRIH7IrvwZnD9PVHXaSm6xWUMd2mR2dZR5BXoPjyDaMrlLrM9cm+J8+FoNhDR7LRc
         inq36vGBVJzc7uEuiP7dq8zPFeZr5BWlUfwmg1Nz8uB5jM21DSNzt2d9SfQu5MIySvvD
         QF38AKYzs7fwHJc0mFmlGRYVhbvXnkc7JUJk3Lk/sU/dQnAGTwtcXfPQ4kLK2wMIb7mq
         9xvl89SaUR0lGxsf4hvc7AsXurVhYJkUEeG1DVpLTNs+iDARfHznqoLZls7GSkWMiKgu
         9HgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aVLg5TvF8ndU9d8/hKdmWRCgV/cIYGxsYSMndhLF04M=;
        b=QwjjLXlDR3x3XYO/44GdlRlDblAL+3m7wbcRDMHo8IUzLmplex61oIZYTLQS3LB8qD
         MEGEUQaXHiTcGjsCaQ5qr+6LXpm9rIAZrAO9AZjxSHZuyuNfVtWPpzKc+49bFlWanEHq
         ZHcX7nCY43MbSkjZnWNbTWz2u1r/jtTNbEN9PDpEmOCjrwZ0lLHA3IUez7/rvx3UqZKY
         Hzu3vrxvSioxzpGURssMT2gnWk3uUBhld1SOAiHSMAE1tlKmT70cwc2/VuyUC799Un1D
         6e9qE4FjhQEzNJj1UwxU28HIrPBD/FD+tpvyyqxz04U65r2d5jXa7wdpOxc4yRkrjbZ+
         7zmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cLOcAJ3V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j200si7333205ybg.106.2020.11.16.10.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cLOcAJ3V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kej31-00082B-Tb
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej1c-0007zl-Dd
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej1Z-0000gt-GN
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVLg5TvF8ndU9d8/hKdmWRCgV/cIYGxsYSMndhLF04M=;
 b=cLOcAJ3VqFpuhegTAdyes97TVoqwPvPIsH/OXIUPMLAlNJ9Spc3+aqIr9hCgSZ8/0ec+Tq
 6T00OT8sJ5xIm2aLJJiDjdmjqteS/i2tL2fWK+9065/Ecm8ylD8q2wKj/zioycTZWmrTOi
 bGpC7Vb630jzlejm1XHPnQI/u5S0hIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-2eSXoT8yNLeVmfMcJ1roxQ-1; Mon, 16 Nov 2020 13:14:41 -0500
X-MC-Unique: 2eSXoT8yNLeVmfMcJ1roxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 478441882FA0;
 Mon, 16 Nov 2020 18:14:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69E0E5C1CF;
 Mon, 16 Nov 2020 18:14:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 04/26] memory: Add IOMMU_ATTR_MSI_TRANSLATE IOMMU memory
 region attribute
Date: Mon, 16 Nov 2020 19:13:27 +0100
Message-Id: <20201116181349.11908-5-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: tZVIjExa3pIT

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_MSI_TRANSLATE
which tells whether the virtual IOMMU translates MSIs. ARM SMMU
will expose this attribute since, as opposed to Intel DMAR, MSIs
are translated as any other DMA requests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index d9261337c1..023aa83c55 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -225,6 +225,7 @@ typedef struct MemoryRegionClass {
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD,
     IOMMU_ATTR_VFIO_NESTED,
+    IOMMU_ATTR_MSI_TRANSLATE,
 };
 
 /*
-- 
2.21.3

