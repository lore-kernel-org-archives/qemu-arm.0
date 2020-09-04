Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2332539qvk;
        Fri, 4 Sep 2020 08:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg8wW/oUdY5SfctnkLosK4UsbAcPGhBYBxKZ/OpJ4pc958m7oBEZtVpkLOO0POwFFN0hRR
X-Received: by 2002:a5b:744:: with SMTP id s4mr11361884ybq.26.1599234397525;
        Fri, 04 Sep 2020 08:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234397; cv=none;
        d=google.com; s=arc-20160816;
        b=jzesU64QRYdNO2yOQY/h7tWQEEUxIhLvRX28+uxhtS+ZauDAnNwStyho7VpMT6u3bu
         PAxuOQkw1Q57A0XLJj4RTg5RHmKd2Rz5ZQqyzWBy695kubAujUpxtWb/LJQZmz3Gnyrw
         aI3GNUS4Dwgzcu4hJHT7G10z9sDm9MrmiDe234nFUx0gVPZGb1Pw0wEpcHVjRH5SXlhE
         QeFypjqoPhPgj8946/CRbrzbQE/9LWkay/AHT1+v8BgCI/9GJXt4oNhLhOahohxVmulu
         QUFkpLjhloIRoa5h9dnOBU4isVXhYCFp9CrPLH3Zzl5pwlLfzIbWepZ1G8KlGK13hT/f
         McyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=i7iJC1mwPlkCljaia40Coq6k2ckspF1fbeJzPRIKgYw=;
        b=wSmSj0/a01nvZ1gmjKFVPHXKNVf9X72XVN69YpDYdZIkUvf6Veb3bgZMhP1/n2A7YA
         4OoxfeBo/oARdJQ8eNUPbLnvZqZ41CdT40QSqGQ+vl2STHjo7zT7Z3o6/GK/pQp+S9B/
         nNWIZ3HRCnLw8B6/T6xKAcECA38KgNvVYK+5iLBjQGQVzS4Z3/wWNfXzKpaC30PsdHut
         Eh0uxt/T9jIneOMVt2I6l3IitH5JCU7Fm/aqcuXcYHSJRkjQhQ8RndUgGWc/QtBJzt9j
         OLnyg7c82ndHFBE0shWRjCqb9YmGj09Sbl5xmqRXBVr0jPQNXd4/J1WQoxD5Guvy0bea
         SYyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si6045115ybk.309.2020.09.04.08.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDvA-0003Dd-Qh
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtv-0001Nx-J9
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44811
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDts-0007V1-UH
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:45:18 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-MDv-FJHLNWmymI127x87Jg-1; Fri, 04 Sep 2020 11:45:15 -0400
X-MC-Unique: MDv-FJHLNWmymI127x87Jg-1
Received: by mail-wm1-f71.google.com with SMTP id l26so1834357wmg.7
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7iJC1mwPlkCljaia40Coq6k2ckspF1fbeJzPRIKgYw=;
 b=F+8CElRY05AQV64xsMNYuYvro0Ago4NwNpWkdeq3l1vx5UsJm8vArPl1aFgFsyCzDb
 OgsMWlulKA/GF8vCAE6ISeGhgAylpFStr3Hd6uAV0gWecE7hq6ZYi/1wyxkD7wvfgvUJ
 LrUAwkHemri2Uh1ffcMdXFa5IP8xDikO3dSPlv17E+Oj6eagrLi1ctnqsiKiEBe82tt9
 zxCe1vzd1KeCGPJBC0Nb2Iuy/PlikSoKlMnnNZNWK/MBtVlmlMmnsBq3goLyBQiYML4U
 ocZt7kqJsSb9nz2n5RRUlv5Y2MYJZF2JV/m+QdcMdODshdu8/tSPFlX2M589mr5TVDYi
 dssg==
X-Gm-Message-State: AOAM5316ieQ9sq3JSiwms8SeTO9nzvuUYhuaelN82fefthoqCQjwfL8/
 qojYrR8ealLbugT/1QyS1xePv3j49PPMDAncUhLbjSgNg/FTpiDqqWL9H3eyohL14iTQ7s7OLfF
 kHOLebC5xxE1k
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr8238153wma.18.1599234311161; 
 Fri, 04 Sep 2020 08:45:11 -0700 (PDT)
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr8238120wma.18.1599234310985; 
 Fri, 04 Sep 2020 08:45:10 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id 92sm13343137wra.19.2020.09.04.08.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:45:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 05/13] dma: Let dma_memory_rw() propagate MemTxResult
Date: Fri,  4 Sep 2020 17:44:31 +0200
Message-Id: <20200904154439.643272-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: wBoMXAKCi7wR

address_space_rw() returns a MemTxResult type.
Do not discard it, return it to the caller.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index ad8a3f82f47..661d7d0ca88 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -80,12 +80,13 @@ static inline bool dma_memory_valid(AddressSpace *as,
                                       MEMTXATTRS_UNSPECIFIED);
 }
 
-static inline int dma_memory_rw_relaxed(AddressSpace *as, dma_addr_t addr,
-                                        void *buf, dma_addr_t len,
-                                        DMADirection dir)
+static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
+                                                dma_addr_t addr,
+                                                void *buf, dma_addr_t len,
+                                                DMADirection dir)
 {
-    return (bool)address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                  buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
+    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+                            buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
 static inline int dma_memory_read_relaxed(AddressSpace *as, dma_addr_t addr,
@@ -101,9 +102,22 @@ static inline int dma_memory_write_relaxed(AddressSpace *as, dma_addr_t addr,
                                  DMA_DIRECTION_FROM_DEVICE);
 }
 
-static inline int dma_memory_rw(AddressSpace *as, dma_addr_t addr,
-                                void *buf, dma_addr_t len,
-                                DMADirection dir)
+/**
+ * dma_memory_rw: Read from or write to an address space from DMA controller.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @buf: buffer with the data transferred
+ * @len: the number of bytes to read or write
+ * @dir: indicates the transfer direction
+ */
+static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
+                                        void *buf, dma_addr_t len,
+                                        DMADirection dir)
 {
     dma_barrier(as, dir);
 
-- 
2.26.2

