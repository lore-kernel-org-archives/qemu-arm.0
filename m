Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3311017lfb;
        Thu, 23 Dec 2021 04:01:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcVZsDRCOWtProRz4ozkxHnGc0GaNdTfKlM4Iq9lCHHjEdBRW1G4ehJ80Rbwfv7Gvwfnvh
X-Received: by 2002:a05:622a:1495:: with SMTP id t21mr1293871qtx.152.1640260876887;
        Thu, 23 Dec 2021 04:01:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640260876; cv=none;
        d=google.com; s=arc-20160816;
        b=OVIfryGFfZkynfuaKoEuxkwszb4WR2093Kf8FAG9uLhnf8S++EgTylkvxQs0+952uf
         lFSP3jax58mwB8a+JyXSJS3OfJ1zNl5nnY59qHnQeonguyrq3gjndTp4OPOGMQxaChaF
         Sni5EzXmdzYNdpvdWEowCjeXC/iX3rijOn5oEKfJGICzCRjGj0P0CEk6Rh0DLTAhCQOt
         O9ogoX5pN2IPZPrJQD2Y4FyZAlM8sDGqScYG70jdvOgjLI8cp6viCdUAcMmokX7zDBmP
         pG2r98PwgsELjrDLty1U2srhMXMvDcqx+Z5Q7kqwyqQkmUManlVIuVtLxTkVCieLksou
         Y/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DFluRvBp6z9QVaCBe8Ue+D5WXYJ9sfHm6PVL8XfDVUM=;
        b=UhL2sHK0IqpJLG68fK4Q0wQ/wT2oPwR8DSN84vXva1GHjFlTjcRY2Z2M8G6uPBZJuJ
         yPpuRMy73xDjP0/3gBIe9BzIRSNpvN1mE5CWlBanE9EkuSkOqh5oTpq5c0zknnHj8gD7
         FuHkZ5fuIuPg8DBWSqIjwV5nLwY1Mg3ERmTSZRKSUN8kuL0U/ITXZJbaQjdJ0YBEXWq9
         njhtk2Fvx0U6DtXThCCl9J0qU7xhrHcalKTfV0s8rY8dwp5D3jTY7fWlCJw1Tn2zW1ym
         fCsjzbNjIxcpk9y6RW3nZnwSmU1s1ZiyvSRECMaSu2B7GSxHl+xCkw9xQ+NBXi7yF7zg
         WCNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=abFA4vOi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si22705qtw.760.2021.12.23.04.01.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:01:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=abFA4vOi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0Mma-0005HX-8h
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:01:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mht-00065o-UC
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mhs-0000bY-Ba
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFluRvBp6z9QVaCBe8Ue+D5WXYJ9sfHm6PVL8XfDVUM=;
 b=abFA4vOijpyeHy3mJHCOkOexoaX5x1+g57l9UWu8d49YbaAD8BAaLblk+XFfUzg8a4nXZ4
 FMEgcAPvgyOf6FGRSwEhuMSMDKaZlr04GUd81dWOawFnE3FM2gWfH9j+6jEJaPSbOPR+Kr
 KOFcdk5mR3RMsEj60Z96TX6qYC0vd8s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-kxWrUCLTM1SZQu5U0-ezFg-1; Thu, 23 Dec 2021 06:56:22 -0500
X-MC-Unique: kxWrUCLTM1SZQu5U0-ezFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so4528840wmd.9
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFluRvBp6z9QVaCBe8Ue+D5WXYJ9sfHm6PVL8XfDVUM=;
 b=SUdbAkdwJJzdUfqXvp6S0BwZvfrNH1i0noUIkjcLcExxYe6ghGDYWMDkDt7znCHdbB
 HIeKxd4Q2KkNUntAN5dw5EMh3oahAL+yFCzJ04P25WhovSmWooMXQMpe5NZmXlahtQ65
 dypJRepZFpx3WZ+C/X7+XHQl8+McngaesFsduqyWE34ODEotWw7R7ay+QnX2C0tld15H
 JEin1TvQHgwdOm8zV7B0NXD/SGfvkWIO84LTi9ewg9AfzQAV7PquyoWq01Y8ppeaVjMQ
 Xsbt+6x7DtFrI5IRmA8XId8/Mqi7PfESV55pHXFTt7pEAgxBkRJFzh28uDebp6CBBiGV
 VS2g==
X-Gm-Message-State: AOAM532XR91sIvnWk3xxF1wWk1MbzC+ytogZDf9wvs4IzjJKyHPKEAp8
 V7L+fDym4a9GVoiXAOItXutdS5FjKKR21kTDid09I4g16B7VSqdWwNL5HmGxeGZKtS77yrcaO4J
 8wmitLFoCU5gf
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr1498452wmj.191.1640260581476; 
 Thu, 23 Dec 2021 03:56:21 -0800 (PST)
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr1498440wmj.191.1640260581327; 
 Thu, 23 Dec 2021 03:56:21 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id g1sm4915702wri.103.2021.12.23.03.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:56:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] dma: Let dma_memory_valid() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:32 +0100
Message-Id: <20211223115554.3155328-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P/vki3Ydeejb

Let devices specify transaction attributes when calling
dma_memory_valid().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210702092439.989969-2-philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 2 +-
 include/sysemu/dma.h       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 4bea87f39cc..4c45f1579fa 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -91,7 +91,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
 static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t taddr,
                                        uint32_t size, DMADirection dir)
 {
-    return dma_memory_valid(&dev->as, taddr, size, dir);
+    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr,
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 3201e7901db..296f3b57c9c 100644
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
 
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
-- 
2.33.1

