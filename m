Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2332138qvk;
        Fri, 4 Sep 2020 08:46:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWbWcJfFeSFUJozP36VEuTKw04t3mHir4GuhPJe/UM3YJldyNs1yatKHc1jUHJ5IUQ15MY
X-Received: by 2002:a25:2fcf:: with SMTP id v198mr12035156ybv.33.1599234361640;
        Fri, 04 Sep 2020 08:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234361; cv=none;
        d=google.com; s=arc-20160816;
        b=fnLdHUKJVkOdIDdzYkZklyDqzSlD15RviBHtNHcd6QRxHVICtZ93/784ART512g3nG
         g3QBembibk9GqA/tE/PTGrC0Xzax84fTiONRYYrhWe9Cd5TejK43hjvv1iAIGTVV90Te
         l3kbbw/wFweW+TcgskEGp/8LADHP+8c1u4iHriAnKQOlg54gjHLgCXhG4Ts7woRgRO4f
         9jcwh6tr7+vLps7/lebxgDhki3AhV5wr6zxdQoEVSkvCdi1p8GkwsSAmcXlVcgOAoOhL
         ni201m8ufK6/a/OKf0+GcyzGBS2KeTLuloK3NCL2mUrBt7ZAY7pC7T4LydoxbOQq926A
         vJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=TrCc5tJ7tNpb4UHqNYewv5YRJY1ciA4UDwcY4eIZ444=;
        b=tAtWbcxpSPGiDmJhk8EufsEHnGNSDuS26KLcKkzbLXDQfzDHe3YqM8EohhE0l8/8D2
         DGEqgRJMuL1mIBi+KxtpbEKNG+EfVazEpIJlumZJEks/d85m4deDFwFsV/pFem6hnumK
         +uLIbQWdJjB+DbBKIpXN4h2edAajpSM8Ed9fd672N7yI3DIU0VW4wgAMtBS/D6ZUbvU8
         V93cmSAhEn7fiYd0xlXTw0ibUHcnDxwH/pGg6bgtNHA72SGYKatrBLCNoev8p4WVPRf4
         re56WUfhkQI96E+rJkkU+fWwZCV7DmSjD5TTdShSIO8ddkBWI4HW+uTRQhLaBDzrMejf
         lNtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m130si6458540ybb.279.2020.09.04.08.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:46:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDub-0001vi-30
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtX-0000c3-6h
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:44:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29675
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDtV-0007PY-Kq
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:44:54 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389--TnNoxH1OG2Ko-o5NNnf9w-1; Fri, 04 Sep 2020 11:44:50 -0400
X-MC-Unique: -TnNoxH1OG2Ko-o5NNnf9w-1
Received: by mail-wr1-f69.google.com with SMTP id 3so2471161wrm.4
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrCc5tJ7tNpb4UHqNYewv5YRJY1ciA4UDwcY4eIZ444=;
 b=q6Z5iSaq1Mb2T4FX5svyUzAh5rG99BBQgKioEYmydCdYh7Cf6KqEsqpV4N41ufD4Ny
 tgQ1JTvW9y6PzcOL89JULw+Q5sagYbmq96D0TTrl8UkTgKWQ7argtcydNPbDeKK17KXE
 i4fOedkC+tzOYbK+LGz+FsvIKRPRfJFgIwb/3VbqJTtwbCo1F02qYF8qFutZxljBXQiN
 BFmVdWqGIvkWFrHOpExRAbvPyvb9m8ukmp0z1rBOAngq7a/D8O+G3pwO48D25FCLy+Y7
 7/Gggg4LY8JOxwtRQR5KdeKvNMRJu5T7QEhj9VnX0ADPvexr3vBmilm3a7mRSy8zvoFY
 ZYwA==
X-Gm-Message-State: AOAM531pMPjpVN2tdefiDCzjfA1tv/lWQsJRaPrGgoNqYoY0VeMzJffU
 AxIOQEDCY2gJj8TnbjSeoxYBwfA9iW2hIuR7WHjou4EC8Myec8h2ZNvNxIUOHkOEVxMponRQ4YP
 FHVe/QwxR9TrT
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr8593990wmn.78.1599234288854; 
 Fri, 04 Sep 2020 08:44:48 -0700 (PDT)
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr8593957wmn.78.1599234288655; 
 Fri, 04 Sep 2020 08:44:48 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id t22sm3697253wmt.1.2020.09.04.08.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:44:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/13] pci: pass along the return value of dma_memory_rw
Date: Fri,  4 Sep 2020 17:44:27 +0200
Message-Id: <20200904154439.643272-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
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
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QVNg0MsKl3EA

From: Klaus Jensen <k.jensen@samsung.com>

Some might actually care about the return value of dma_memory_rw. So
let us pass it along instead of ignoring it.

There are no existing users of the return value, so this patch should be
safe.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Message-Id: <20191011070141.188713-2-its@irrelevant.dk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4ca7258b5b7..896cef9ad47 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -788,8 +788,7 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
 static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                              void *buf, dma_addr_t len, DMADirection dir)
 {
-    dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
-    return 0;
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
 }
 
 static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
-- 
2.26.2

