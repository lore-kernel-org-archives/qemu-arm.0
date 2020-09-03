Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp429936lfc;
        Thu, 3 Sep 2020 04:09:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQrRPugJFvcZM5H5UQCRiUWm+fplhUVdaaIICIhiePY64S/YvH5qlpWZxs+DrDEBLRoU+u
X-Received: by 2002:a25:e683:: with SMTP id d125mr1856225ybh.1.1599131358126;
        Thu, 03 Sep 2020 04:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131358; cv=none;
        d=google.com; s=arc-20160816;
        b=s1Au7IwvWfI67tHTLciKcCj076UYjGQCMnWDEV9nsWerzofTq2woAME1UHpVJbNp0s
         ZiUR28fCVo0zx9E2EPdxHZXv23hTST8SjDIWV8B4yz//0eiue6rIkAqM2tL3Jr+YBg+5
         bReQ21rFSu3/y5hYmU6AbDoFW4O0WGIfH7KY8qMWLL7R2s/P1tkFXUQtrRH93HmJ8yWJ
         5Qu8ZU+TlK0a1NBfwRug6RyIzMfG2VRtCmACKN5/2kg5yHjydFp5+rU7H1D/UMxOD5hn
         aA66+m2nHV6TZ/gBhDD9uEjm9V2eFVe2hZv1rCg3trC+8OcOG+/1IdMyYjlfsIq6AhW2
         FiUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TrCc5tJ7tNpb4UHqNYewv5YRJY1ciA4UDwcY4eIZ444=;
        b=TEFBg0zxelyu9DEDWak/JTYV8od7oBEa6/z2U8eZc2xWYRzuOXMgzjlsBt5evwjMgu
         PzT+ghzQMXA9uxjk5TKxz9MqrOw6W+uDSnyjIElmNneMlxEvGezn88S8qP2cmhk3/bHE
         buHTWeOqUGYLkkzsTQ+aqozRfNLBKjdtCWnmWH0YYyr5rjKnpkyBPa6w56VXjfkQuYVM
         oq9X4VmYA/h8xLoXTcoKowf/KYXFYLR/yoASxQRCDrw+aRzyQX7LddYKTxzc9KEqNv3G
         Zud4PJvPTUXbI2+xbjmG1W95HM2ToHPB61nxR5b34SW9+NajnXUPdJu9JO+zhHPU9+Qb
         /Exg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PNfEj1Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si3066497ybe.485.2020.09.03.04.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PNfEj1Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDn7F-0008Pk-F3
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn6n-0007gt-3E
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:08:49 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36226
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn6i-0005le-Nh
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TrCc5tJ7tNpb4UHqNYewv5YRJY1ciA4UDwcY4eIZ444=;
 b=PNfEj1BoFwynfDZ7hx6Udrbub8GNuTyNABqAWrqYLcvZ6uLN1hsPJk9aDua2GedQ0zIycM
 FAyPFV/A8zJHBWukB+FTAQ0/yO3yLXjZyBFbdvLOKWc4T/DpvmBLWs6WuKfOkCH/CEBa9y
 gYVP+WIIuBqozPpmtFVTYsm2lG3l7a4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-ymQ4-j_mPxasW5rUWAj94g-1; Thu, 03 Sep 2020 07:08:42 -0400
X-MC-Unique: ymQ4-j_mPxasW5rUWAj94g-1
Received: by mail-wm1-f72.google.com with SMTP id 23so837633wmk.8
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrCc5tJ7tNpb4UHqNYewv5YRJY1ciA4UDwcY4eIZ444=;
 b=P0xIaoaho2ePRk18bzZwgrJtXcZqk6r9pf7lbVJGvDjM/rYWjBq8ifmLFR7yspIBMl
 fbLgFHed7eJRd8kSm9DcOza0dQ/XNpozEw7dzvOhb0XHdHz5D7YYX3rNcaAJEWDiwYOt
 VDnbiTqH3zRitZ2Z3xRmTYo5ai4Yf+dNHyMqazynXeET0k2kAvHm3rIlx7ApcgsroXkW
 0XDl35PDy+zsBtIx2hXkZaOHRW3QiJHbAOCwt/HHzJYLfGtnff8N/tGKgyV2a7aDRoeK
 fyzKmQkiOBqP+nNrwTQiXYweUX52wWqHYDNELADV24q6ipTqCn1ZzXCq6PUT574qOFQE
 Olmw==
X-Gm-Message-State: AOAM532Y9hmLdmHpRg/953aOBIOX8U90d+xFW3BuG9Uij+riHz7A04TD
 H6Shwd9CdHckqED0pgXFWkiREdc0KhthwiE1P0Qi81tY6E8EcpmZha9uFn/HdlvtsmRZnre5FRO
 3WMmIZLwTA+ki
X-Received: by 2002:adf:ef45:: with SMTP id c5mr1787465wrp.37.1599131321243;
 Thu, 03 Sep 2020 04:08:41 -0700 (PDT)
X-Received: by 2002:adf:ef45:: with SMTP id c5mr1787437wrp.37.1599131321081;
 Thu, 03 Sep 2020 04:08:41 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id t203sm3782107wmg.43.2020.09.03.04.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:08:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/12] pci: pass along the return value of dma_memory_rw
Date: Thu,  3 Sep 2020 13:08:20 +0200
Message-Id: <20200903110831.353476-2-philmd@redhat.com>
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
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Tony Nguyen <tony.nguyen@bt.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rY3X18XNnjin

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

