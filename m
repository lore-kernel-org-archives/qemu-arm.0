Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3331198lfb;
        Thu, 23 Dec 2021 04:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo5j+1a6FHltmaf5ql5Qd37GupHms8ac23o/ep7rsDLCNSBv+qOLbL5teQ6XE7DAKdEdSo
X-Received: by 2002:a25:a262:: with SMTP id b89mr2929821ybi.434.1640262872345;
        Thu, 23 Dec 2021 04:34:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640262872; cv=none;
        d=google.com; s=arc-20160816;
        b=atxHSYRCyxwU/dJfjG8GnjkDL5tUJJWm/wmAmii9vDpOhZfEbrSHBG8Ai0DBQheLkY
         zQl2K9y+UODXShhimd8Q7RSNhyRru9t8tatZiY85hkbp2g9EkoN0hru21iWLC3XUlZ24
         TGTFGDQQY5kqtxeE1neHc+0LlRGP9gG01eQq59OK5OSSWuWz6106IrjnoxTeEZs+4tO4
         pXVwI+zQpfJ6uBL0mR7ZGhOUmIsMaB3rUobSw5970V0x/jB/DZVJZy8uzJmrgVRzjcNz
         GMyjS2ZBqjNLpkyxr5+eFBJ8hjOLy74sN/r/4RFhW7peAT7873MFsGraKIeCpcTi5wjm
         VOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xe1vuKIn+V7zfO3YKXmpVrbFyeoxlWXQr1Mcr+LUv2s=;
        b=IPFxGJnn8IwJtXsFAXO0whK1Z/jXe12OFp+iTQUgz38mlPgk6wf1qlRchfBbx8cQVv
         ZGIUJtAMWMqYgzSzEg8AJcSKljQqMdSEfTOR0JaJ5bF3yIuqg3xTU/hFVxINIo3TDhXm
         KOObDqw7LS6bBB2DHnfMQ2Ii1amvidDKarugYOg9xP1TG4dZWm0JBC+wqibRNK7OyKcj
         oMQ3ffs/mzoTsP/cDAWjS6gpHIIZPbQqRHDH7140FijXBhELVitvs0Ycq1g3AbjAXJb0
         O5n/0gw/0FRuIeAUv3MHiMPPlXoXq6gvTxOoDAjua5FX8GkkoD/sO01GJU6TUDVb1+FT
         5zYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OduHoNVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si4765716ybb.606.2021.12.23.04.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:34:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OduHoNVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0NIl-0001Bl-Pc
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:34:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MmZ-00064V-Rt
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:01:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MmP-0001aq-47
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xe1vuKIn+V7zfO3YKXmpVrbFyeoxlWXQr1Mcr+LUv2s=;
 b=OduHoNVKM5lUpZHODOYsMjk3X7aKJwtxxNnMoKozvh0wDjtY8lsfTQq32ToFqEZ8Xw6u0X
 ilV+jxdo0iTZbEARA7Sc2gMgZn8NDULNpKBL8p1fOIrVWSVNkADHCoEp/IwmhSnHfow4fK
 mWuNPFVfD0PmH2J56e00hUsolUiae6M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-xzFU0Un5M5qliWCTf_1Gqg-1; Thu, 23 Dec 2021 07:01:03 -0500
X-MC-Unique: xzFU0Un5M5qliWCTf_1Gqg-1
Received: by mail-wm1-f69.google.com with SMTP id
 a69-20020a1c7f48000000b00345d3d135caso757201wmd.7
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 04:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xe1vuKIn+V7zfO3YKXmpVrbFyeoxlWXQr1Mcr+LUv2s=;
 b=TXlnj3bQUP0jq6T48LhSlTnfQWFPkgOpz71xgGzWty2nMAbzCf1EQbbLk/reKuG/ED
 3FUOBS5UBBmxH6YHtwi8dwqY1CSGKf7UljrZXcSJe+koPX/EUaxkPH7Yk2MEJ/ZosVID
 93tvZLNJdHQFY4JhAVXZYZJ8NtwhZYzxyb6gla2YDz67E5vpj13msMEIzISF8lOOX66B
 fdCR4uKjq/woJSLKxWPbSS3QzaWSb51ZrbhS6BfhXVgvatsjLgjJozmv0HQ4gzrKX/y/
 cy2PSX+P43nNA8xOTkIdVCBcs78WFilWEsfu/afNhbaIzm1FprwBEmxpjOP1WoBVXnVD
 Gp0w==
X-Gm-Message-State: AOAM530zTi48+Lg2Zd0gpMhpqvmh+dVvgYF9Mhe+MRbUezjFFbgADeMp
 QVHCMUDT7q/m69AMSZCBGOT/Eo6u+6PKwoePyiXc1F6Jg/PTuqQLcsQXGclO+cODRY9Sbv0vws4
 o7Dl1l8j36hJoATsieVOs+qiy1GHhPkAFcUF7eUJsIJbVXtpfpol9SlS3IZFb0ivU
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr1580247wmi.90.1640260862086;
 Thu, 23 Dec 2021 04:01:02 -0800 (PST)
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr1580192wmi.90.1640260861824;
 Thu, 23 Dec 2021 04:01:01 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id l2sm4925992wrs.43.2021.12.23.04.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 04:01:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/23] pci: Let st*_pci_dma() propagate MemTxResult
Date: Thu, 23 Dec 2021 12:55:53 +0100
Message-Id: <20211223115554.3155328-23-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pGollw6NN/wB

st*_dma() returns a MemTxResult type. Do not discard
it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 7a46c1fa226..c90cecc85c0 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -859,12 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
         ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
         return val; \
     }                                                                   \
-    static inline void st##_s##_pci_dma(PCIDevice *dev, \
-                                        dma_addr_t addr, \
-                                        uint##_bits##_t val, \
-                                        MemTxAttrs attrs) \
+    static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
+                                               dma_addr_t addr, \
+                                               uint##_bits##_t val, \
+                                               MemTxAttrs attrs) \
     { \
-        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
+        return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
-- 
2.33.1

