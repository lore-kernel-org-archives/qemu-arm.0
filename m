Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp429749lfc;
        Thu, 3 Sep 2020 04:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4oobgMoZDjBLdqciBUyvK2q6ZxGvbrnOspfKDL1tEyanY3MoIGN7hXJFN4Op/Qh2/9IJM
X-Received: by 2002:a25:bcd2:: with SMTP id l18mr1870535ybm.290.1599131344627;
        Thu, 03 Sep 2020 04:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131344; cv=none;
        d=google.com; s=arc-20160816;
        b=sxb2J9QDVK56exZzf4OM9ML8cqEdkYSvEE9oxNoWv8saWrvjBUY31YZHVcTbJFPdGu
         6MtlewpvVXbAUl54rzL4/5PZb+HdJftvgThBF7sgE1oiF9m4Qb1DWL7/O+r5tNBS68uo
         Us4QOs2TrbxUi9Au8P8+jP+HR7wjZeE1l6uSwmH0uXc/LqGaVpEOXV803ZjKuhSO2yQD
         Sfi6oN3NULGmobjTB51jMNgEiejYmflB27kEV2161w8donAsdpaQW/zoMoVdoKvRdzOW
         pGFcMfgsh86a3b5q5AjdeyRcyqsTzADaYfZCxWfHB+wjou8sMz/0h2+q/S+FOoqqZAe4
         wB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nruMQlHxT2HZJRXPESpouaZWFiIsjV8XHOgEIt8o5lI=;
        b=DUFnmUHlw+amffOTcgRcbFvoz0UcnL5xxONggMRa5bTHgfmg8WIedgvoG6k1NqpCA3
         jhdVtGMIusPLVN+UIXY9DjK6dU/JZZHiF7XCUOqvfmpEVU5n8weeZbfeczwxfMruGWl/
         D47kGaNJA6CB6KUthWkY6hF419C2qXEWst5Ud8Fk/X6qmjVhdeE2hspu+IUQjUczltQy
         9bJpV1Wu7E5bCJPx59IiOf0/Fhss88VuvTBBsajQM2S7eIHSJxr63CpY6kQ48B9N9GE5
         LI1JICE94DP7yG6Ewl0ntuuX1Ou368cAiK9a0bfjN2eqtkKbz2TwDHnx/JUyz1vFEnrw
         8puA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VWbYzox3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si3390269ybo.258.2020.09.03.04.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VWbYzox3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDn71-0007wA-Tk
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn6r-0007rS-DW
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:08:53 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40733
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn6p-0005nO-Dw
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nruMQlHxT2HZJRXPESpouaZWFiIsjV8XHOgEIt8o5lI=;
 b=VWbYzox3QjKA9jJ+O6GjdFzIELQ2SoyDG26lHSs/qg4AGo+RnTBGkQ7fgBetAFVU9y8X7b
 kUvZJ1NT/wJI56i3otaHxrGE4Q2dwPZnNTfEF7+8kxP8bvydbCEeby0JnuSXhpd7FNhWtG
 l0Iqb4RT6+p2HHlkCdeTnTHQm0B4mME=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-BQkKbLOCOkqhdAhLtw5pvg-1; Thu, 03 Sep 2020 07:08:48 -0400
X-MC-Unique: BQkKbLOCOkqhdAhLtw5pvg-1
Received: by mail-wr1-f71.google.com with SMTP id k11so941633wrw.16
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nruMQlHxT2HZJRXPESpouaZWFiIsjV8XHOgEIt8o5lI=;
 b=AF06sEw+ggp0BzXGx/7+Fw6Zv1/YlxeB7jYcbKTnFM3SelXtbhHV10iRcE79X9nwD/
 V2JyZ1lFkKnHPS32zyohbJyoXPqTjI9a7eM/4v0tRaMYOY1pwol1Y+TGp33YkHuSrwQ8
 bROrQDDyHx9M8cqwSPLM0UPwSFpEFlRWO9m6tzmvwi40ccNGG94WGHTkLrKq2MPy5rEe
 0lofAseVqKRJOGI6gjILM8QR7HeQ8DduJwE3IlmzNZ9iXY7A0EzQy+wNf9StQ6aFBHdm
 ODiuyVeZOvIjJxUJQXUutp0s66xk7tVb8yOsmyN3Zr6ZpVTk7BUGaO8Bj70X/3ATIkA7
 WoyA==
X-Gm-Message-State: AOAM530952C4J9fLTrNRqpb194/PYe0CD57t2N+mqm224sHe9GX40WqR
 FFxzoxabQdGNK+1+022DsG3uEZTV73H+RgMTDLT/cGM9uEdBhtTMe9yuG5usU3Up0rMiyHU/zx+
 dvRq639uhFc0h
X-Received: by 2002:a05:600c:210c:: with SMTP id
 u12mr2040145wml.185.1599131327263; 
 Thu, 03 Sep 2020 04:08:47 -0700 (PDT)
X-Received: by 2002:a05:600c:210c:: with SMTP id
 u12mr2040078wml.185.1599131326964; 
 Thu, 03 Sep 2020 04:08:46 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id a85sm4028592wmd.26.2020.09.03.04.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:08:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] dma: Let dma_memory_valid() take MemTxAttrs argument
Date: Thu,  3 Sep 2020 13:08:21 +0200
Message-Id: <20200903110831.353476-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903110831.353476-1-philmd@redhat.com>
References: <20200903110831.353476-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+Mi9V+4WrcY

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 2 +-
 include/sysemu/dma.h       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index bed7df60e35..f134f6cf574 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -96,7 +96,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
 static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t taddr,
                                        uint32_t size, DMADirection dir)
 {
-    return dma_memory_valid(&dev->as, taddr, size, dir);
+    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr,
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 80c5bc3e02d..fe3999dba59 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -73,11 +73,11 @@ static inline void dma_barrier(AddressSpace *as, DMADirection dir)
  * dma_memory_{read,write}() and check for errors */
 static inline bool dma_memory_valid(AddressSpace *as,
                                     dma_addr_t addr, dma_addr_t len,
-                                    DMADirection dir)
+                                    DMADirection dir, MemTxAttrs attrs)
 {
     return address_space_access_valid(as, addr, len,
                                       dir == DMA_DIRECTION_FROM_DEVICE,
-                                      MEMTXATTRS_UNSPECIFIED);
+                                      attrs);
 }
 
 static inline int dma_memory_rw_relaxed(AddressSpace *as, dma_addr_t addr,
-- 
2.26.2

