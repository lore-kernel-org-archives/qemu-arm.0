Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp173871njk;
        Thu, 20 Feb 2025 08:15:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdBt7g91p6Upn9mu4/oEshONhyENQ2LR/6hVmN8vHmIo4bol00LrbtIJjPcbI3X288oJW8qzqEDWK2wQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHeatXEUXdNy4dszQzOzHd+pNzOIvCu1xm/olyH1AJe2+XZoWjMoCoBZ/+7POUL7X69EGp/
X-Received: by 2002:a05:620a:468b:b0:7b6:c324:d3a5 with SMTP id af79cd13be357-7c0c227c7demr489053585a.19.1740068114244;
        Thu, 20 Feb 2025 08:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740068114; cv=none;
        d=google.com; s=arc-20240605;
        b=b6ArBamRcaPHnT6jXUJDWlOWqoymi0EuaxH1MvMlZIg0S595bCWDuqAdIw9jeilpMs
         FIS36MrmOeZyFIq14kboyn5fjgXxIlSS0eUgaIFOecpxl47O77dtGavNLmzFUTagK1MQ
         KLoBxvecSrVadIE9SlLqeMjYhNMV5J+qOwc5LMF9MvS72cfSU6rzF00jUzLkPsxFEcVR
         RBRg551H+sPgxNq576scCeHya+PYoimrzCWeHUI6/seNv8S79fbJXkoqJjHwhnrxh4/I
         JvR9kOzwE0d3X2aktyKJvypy09oGb79xkEyhDucQGrUCkq+YWEH27CtvjeEZDIrDsG8c
         cfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kENStpThkhA218ElrNVw08IlCWz7oMFEaESrcUq7Xls=;
        fh=JDXHve6qnD88iE6DwtOfC+AkduqpqmCc4btGyRRWhPQ=;
        b=LGF3gnv7PrcC7uYS9vJ7K3eOLSwZvU2+Vr9vhpg0sNrjL8QuyPPAAdJn7iwL7uj6Tz
         entdPS0SS96YouXhB4TfOcW1QgsyOHVk+LGRMw6xNqft/N5yNap/ApbTkVXXMjusUV2Y
         cgP606u54QBv8uHx7fgYTus/h9J/CyT8zNypNnHnXjg2aA9rDZxXuI7/z7P6INJRoV/i
         bKvCop7Ktx1NrP+MXOQCGCFhyyTDBq7T6mFzCayMOYQ+itedPWPBUpj3q/lgJCK7sIZT
         AmHaFg/UhFOZhrkhW/P1jynlqq/3U8npdf64WsTanNj4bg3an7uLboXYP3Y7ibuKVAeV
         0dyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=INZSVVqD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0b0738df2si479172185a.545.2025.02.20.08.15.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 08:15:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=INZSVVqD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tl9CW-0002UO-T0; Thu, 20 Feb 2025 11:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1tl9CU-0002TR-O0
 for qemu-devel@nongnu.org; Thu, 20 Feb 2025 11:14:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1tl9CS-0007Lq-Nw
 for qemu-devel@nongnu.org; Thu, 20 Feb 2025 11:14:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso11529135e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2025 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740068094; x=1740672894; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kENStpThkhA218ElrNVw08IlCWz7oMFEaESrcUq7Xls=;
 b=INZSVVqDCa3QxbMSxMqxHJrGKL8i4pLqW3329S8CJOkkUSKz5mcV8gDZA4D1nKH6v9
 SX1WuayngAATwpyI+Vc4S7L2jtF4xZ6U9+h8u5Op78RBJ0rNx9bkb3WGIrL3jwaZa5Lf
 LzhY2Dkm38cSdzT5IXouAbh0pKt9+kfzTCSo9/U47PxXly8VH8RI5T89rPSPh/qqX253
 EPPqhI1syWHwSTsPJmtdQkZDbb/yRWKjpmppa90qE15p6a5JrmS8mRuXZOlsYKOgrdnx
 FtcpDK9Jp+CHSvPYSdAPL+I2k8sEN+GeZRO0AVuVx5bHtQy0RvLVVsQQvViKesRkeGTi
 rHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068094; x=1740672894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kENStpThkhA218ElrNVw08IlCWz7oMFEaESrcUq7Xls=;
 b=hw9xwoKROzNIBo2Pb77AqA4xGDw43Ab6y6bds8Pek5rQaZsMRC8UnwJ8Xecg/JwXbi
 VkPJmF1FjPXdSzSncNkLBvqje7XmMhboJv0ZLA2d9qFfXoIna3U7LRDOjs5RxzOUwJ11
 5D9zAhRqsPIp0HFaaZ6ZH2dQNJUFt5bjcRPYXo0rt2tL/oHvdPvMZViTbFfSOeXKp24W
 N7SNenniHbpxfUE+QyrEkwiJAuJQ/AR0DSmpVVtYDdKthTQLSXi49HHUXX2HzYZ0iVp6
 srY2bW31oOFVVPtz9bYJzRUKazW1v1uEFVNw7jpL8a+cJskmXL8nWm8acyIUxeA+Y7ZB
 WJPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVgnJRxWqoAXq0adVv/Iv6XWxbzSKYA16CiluvBgYQ1k0mOBciKf7pj/f6mbmSXtqso7MissVi7eks@nongnu.org
X-Gm-Message-State: AOJu0YwnlG18KCxXqXrLJTfXx5pn0ygJ4ez+0wDQo4xB298Y1Kiwyck5
 Jj5CM3LRKMsVJCz9KkgYQKI8vBLsDNEZRNtuUUqebQKIl/elqzirVii1Fus30Qo=
X-Gm-Gg: ASbGncsqu+cE9FhwY9UwTJb1JyYtZKzCm7LO3nq5SPC2Q/3NdjUD5dEsJFiKR0WPM1U
 2z8a+xb7SCAPGAM17bNFxy7+Til/7JRCZC1wZn6JuvqBJvrvBWwdj4GQX+fTsOstPLxdpT9Ypyc
 xyaYxKkjuqktitSMbz9QcTIJanQCCHhRVYz+dYF05YGFvTrx0zOLegZC7P5B8s5qmBZ9WjQUmEd
 Dh5LPQe5hkGRgQ7PBmyunnDaGh3jO0pqsetKv3DCNGoDS7/m7eDyRCfh2RT2JmmafHSVX4+Lqcy
 VpuE13ikAlZMnX47nhxym6U14GCe/sqo7g==
X-Received: by 2002:a5d:64aa:0:b0:38f:516b:5416 with SMTP id
 ffacd0b85a97d-38f516b557dmr15167907f8f.21.1740068093685; 
 Thu, 20 Feb 2025 08:14:53 -0800 (PST)
Received: from localhost.localdomain ([2.221.137.100])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259fe1efsm21197741f8f.97.2025.02.20.08.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:14:53 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC 1/2] system/memory: Allow creating IOMMU mappings from RAM
 discard populate notifiers
Date: Thu, 20 Feb 2025 16:13:20 +0000
Message-ID: <20250220161320.518450-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220161320.518450-2-jean-philippe@linaro.org>
References: <20250220161320.518450-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6TdufXEMc9Sy

For Arm CCA we'd like the guest_memfd discard notifier to call the IOMMU
notifiers and create e.g. VFIO mappings. The default VFIO discard
notifier isn't sufficient for CCA because the DMA addresses need a
translation (even without vIOMMU).

At the moment:
* guest_memfd_state_change() calls the populate() notifier
* the populate notifier() calls IOMMU notifiers
* the IOMMU notifier handler calls memory_get_xlat_addr() to get a VA
* it calls ram_discard_manager_is_populated() which fails.

guest_memfd_state_change() only changes the section's state after
calling the populate() notifier. We can't easily invert the order of
operation because it uses the old state bitmap to know which pages need
the populate() notifier.

For now add a flag to the IOMMU notifier to tell memory_get_xlat_addr()
that we're aware of the RAM discard manager state.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---

Definitely not the prettiest hack, any idea how to do this cleanly?
---
 include/exec/memory.h | 5 +++++
 system/memory.c       | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9f73b59867..6fcd98fe58 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -116,6 +116,11 @@ typedef enum {
     IOMMU_RO   = 1,
     IOMMU_WO   = 2,
     IOMMU_RW   = 3,
+    /*
+     * Allow mapping a discarded page, because we're in the process of
+     * populating it.
+     */
+    IOMMU_POPULATING = 4,
 } IOMMUAccessFlags;
 
 #define IOMMU_ACCESS_FLAG(r, w) (((r) ? IOMMU_RO : 0) | ((w) ? IOMMU_WO : 0))
diff --git a/system/memory.c b/system/memory.c
index 4c829793a0..8e884f9c15 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -2221,7 +2221,8 @@ bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
          * Disallow that. vmstate priorities make sure any RamDiscardManager
          * were already restored before IOMMUs are restored.
          */
-        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
+        if (!(iotlb->perm & IOMMU_POPULATING) &&
+            !ram_discard_manager_is_populated(rdm, &tmp)) {
             error_setg(errp, "iommu map to discarded memory (e.g., unplugged"
                          " via virtio-mem): %" HWADDR_PRIx "",
                          iotlb->translated_addr);
-- 
2.48.1

