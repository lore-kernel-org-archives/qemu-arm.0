Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2334806qvk;
        Fri, 4 Sep 2020 08:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSYYopRxa50Nu9zsZ1naOHur8R15GTdnVOqG68Hx5e1k/wR55tbWcIJDJFdfc5PnM5CLa5
X-Received: by 2002:a25:9886:: with SMTP id l6mr8682871ybo.428.1599234596007;
        Fri, 04 Sep 2020 08:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234596; cv=none;
        d=google.com; s=arc-20160816;
        b=ASin2P5xLV7i+Cy+H2dohzSABnMajTGNidCz9dxHq5BBuvRaOGEiuCxFpMH8pcf6Vm
         uHR02g66LQKoczHyvP1OjlYEAffyKiUWB0sBHr+wdI21bcnM/Htvou1fGHUmC/O9/4aZ
         qbjvSiAIBdvPVehhRrHwIxYUjLsVahCjQXRPEtC1XU5NZHiSSAREBD88nQmAg7AsSHXV
         2tDyoL4Vjbq085Xfuqlm6k9uGM7bo2a+TTxU1c2oxiQGQlh41lc692bKZWbWetaIAbJ3
         7IEAN3LfdlglsTD1HkH9FJ+pk+vSNXKsSn+NZyQnQGOHYaYWuhsqv82hn9y5Ldpxb4Nl
         3tOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ZKu32NjwGavdXRIU1N5tUoqjwLuYO41YyQt79mWEprg=;
        b=QUuuX3smqUARmgodpcpMkhPZBBw395SnW9W++oCiQ5M7UZLZWaqJqAp8sSC7Mq3tXK
         1AD3tV0BFpRfrBdu7VmmIkDdc/wLNVl7nmd6Dr4sicJWrYV2r7NRzr4DmVcgyAoXd/Vh
         NJ1BU2mMQRK2jj3tVU4W1+mcdqh5VlX+fB4CDE9JlmGLZCB8eVuSoaisQtNKIT0dJ2eK
         bvBRDK8f9RYOg7tvgHc0Yq7gAzoctNqLFFtQa5jyu9op4jqrih9Xm1c/DLvyk+aGNZp5
         fh0sWClYhuxQKXPuRuWTQ0JMlUBVNK0e4apfx5bwp0dKHq2RMTq2PAt1beRi54GWrucO
         Xg0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si3958246ybp.430.2020.09.04.08.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDyN-0001HR-Ej
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDu0-0001Zg-Re
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44802
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtw-0007WG-C7
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:24 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309--uuCjldSPtqtw46qdUmOSw-1; Fri, 04 Sep 2020 11:45:17 -0400
X-MC-Unique: -uuCjldSPtqtw46qdUmOSw-1
Received: by mail-wm1-f70.google.com with SMTP id u5so2073217wme.3
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKu32NjwGavdXRIU1N5tUoqjwLuYO41YyQt79mWEprg=;
 b=qGimvygPlnbgCTpyd6G3646G1tiWi1lYPQ8DrTe/3Sbww25GchO3skxyz2nyjNlfI8
 JZFxhpV+eCs4JVi3QuyEuvzJWjhEkQKxt2HKrM3JCAcfJlmP2aj046zTyTZFBjNi188c
 u0UD5cHwY1Y7F2L6d/k/60cJyCasQknf9ZIjC1j69pt+BXx6s2GrswMpIFndSHsxPGic
 PWjv2apok4ZkimsMutXmgm/arJ8vlOSsQXCJNO9wok2k09vIZs4BiMVUjh38iv5ZcNG1
 d6+108ru+4YPHqvCV51xV+QtB7qm0TNda/xJ+2bczQ+E8QbxP2betgdRd3c++tp/SSrP
 ahsQ==
X-Gm-Message-State: AOAM532Ws+Ijr5Mtmx/OBfB/azxJQQQanEW+q3hjs4jcgXBB45tUIx3Q
 AoPF3C6M/hjQ2QssOIpzOUFDzl3jy9U+95K7bENimM+vEm0H/1Q533O63JwkLp6pwSJ6MQiXRDB
 sG3EAKXsFwgPm
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr8173806wmg.50.1599234316736; 
 Fri, 04 Sep 2020 08:45:16 -0700 (PDT)
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr8173787wmg.50.1599234316558; 
 Fri, 04 Sep 2020 08:45:16 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id b76sm12067956wme.45.2020.09.04.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:45:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 06/13] dma: Let dma_memory_read() propagate MemTxResult
Date: Fri,  4 Sep 2020 17:44:32 +0200
Message-Id: <20200904154439.643272-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:57:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jb5QombRQXCu

dma_memory_rw_relaxed() returns a MemTxResult type.
Do not discard it, return it to the caller.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 661d7d0ca88..2961a96ad67 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -89,8 +89,9 @@ static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
                             buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
-static inline int dma_memory_read_relaxed(AddressSpace *as, dma_addr_t addr,
-                                          void *buf, dma_addr_t len)
+static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
+                                                  dma_addr_t addr,
+                                                  void *buf, dma_addr_t len)
 {
     return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
 }
@@ -124,8 +125,20 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
     return dma_memory_rw_relaxed(as, addr, buf, len, dir);
 }
 
-static inline int dma_memory_read(AddressSpace *as, dma_addr_t addr,
-                                  void *buf, dma_addr_t len)
+/**
+ * dma_memory_read: Read from an address space from DMA controller.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).  Called within RCU critical section.
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @buf: buffer with the data transferred
+ * @len: length of the data transferred
+ */
+static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
+                                          void *buf, dma_addr_t len)
 {
     return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
 }
-- 
2.26.2

