Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp933073ejc;
        Mon, 31 Oct 2022 05:38:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4X1SwSSTa7vOH0TY86GXOgivw3EHC4kJhcYq6LVsjAS679+2WgS0CR/JpZoIKhjOCWtp0g
X-Received: by 2002:ac8:5b89:0:b0:39c:e932:88ca with SMTP id a9-20020ac85b89000000b0039ce93288camr10011504qta.257.1667219929863;
        Mon, 31 Oct 2022 05:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219929; cv=none;
        d=google.com; s=arc-20160816;
        b=DJinXs4oR4pzSmHIcjKTezpLUd3IlDcgHI+842z2xQaoLQ7Be5IwozD4b7toElvry3
         BRENsxtcmbhKBAJ48Ce0615mMOLiJzqeYoaIQ3PLxZxrCSzEHeMOcFVpsdefQSvu3CMf
         0P/CJCIzoiBk2Dyi41YC1zs/jJUGNAGxWD5aV81FDoIpvq4hz0WXbfXb44EKzWBbJNVv
         nF7ZkF9RF9RLr2YFFSntkSnwQMi/XY/Z8blaTNeOnnbK8h5/I9dcpn95SOefaCo8mjol
         RR9QUwNGZzul6CyHrmNsfNI6SDA6upk6xRW/O4CYelqwAV2C+L4NHHIz44MLc39WxO+B
         h4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GSC2v4ngPUcx+TLSPrzIkvnSf/m2yHNZ/Q2yIIKBef8=;
        b=C4VIcrFLnnSNHU7vGAo2mjv+PXnSVilGs2bFN0Nlx29Jx0lXUnc6YhW98bN39Vdf6/
         PagJ0FCdxE1U1IE9L16n/hlJ1CDzzG9IBTOHzKvyu4m1aiQxN9JtEGDrroQw+FCTNaTR
         wtaH5dNRxInIfWuY5NsxlJ15o5KVu13lknbic+ldPMts+FP1uRbTwMPVfpGfvuog8XP7
         lwioWaAgPjYSao33iQ25HvNjCAa8F1f2mMD1qDxrGPwDubk8ZJ2bSfeVmoZHrXpXW9+9
         Zw7GY7x1xU5eldynqDlEW5YUAumEB5SRAffPcJo6L3rq2qqi9YmOipg0eA8eIIpupSbT
         lEZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=noYmXoS6;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a0562140c2e00b004afa8141b61si3592477qvd.455.2022.10.31.05.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=noYmXoS6;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU19-0006vJ-Qx; Mon, 31 Oct 2022 08:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU0G-0004Wj-1q
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:56 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opU0D-0004Ok-AO
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id k5so2702124pjo.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSC2v4ngPUcx+TLSPrzIkvnSf/m2yHNZ/Q2yIIKBef8=;
 b=noYmXoS6xvS9xEdOiu9N+6kfbHdXezMRVuA5OMJPuGnRdilLo2mVJT7AcBcL32ty3R
 fh1HQKLgmkvFHlaUsol1wjeK4nvm0IYKi9O92nnxoseU1iC5eG9829cxdImF5rQaC2Hz
 p71yGNz+CgTBHqPtS/cj/fljCL3pJKz1PvBN0p9Eh/b//iyiGE/F/t3AHWW2W4jBK3wH
 wI90Ztuxm6t/XTghYGJBWuss8KgShLt1kWr3fTh0kO/fa+dQYsZaIjtddwELkPfn6bg0
 p2Wfj+Qf+fwGI3LoYqoFxn6TI9HDQArcSUJ97JVmmDuUKBB/TzptFg/XY1Np9tAPMQBw
 8kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GSC2v4ngPUcx+TLSPrzIkvnSf/m2yHNZ/Q2yIIKBef8=;
 b=ic2SFrjeFZyaFYO39CHnJHdSl4gk3X4aqqlqZthhSSNuP/6puPPCEnwT794D+5caHW
 hVuyRsaUPrvqBX3peSIMtXo48Z2EDgF1LX+q5C1oHALRgO2ogrq9AYfi14K7pUJfQ74w
 d4YGbVpQ6tI39uloEABLfRU3S3JtiKx1X7i9B3qaahy2qeynrxaOM26iYgEWEMBPb8y/
 KVKK3H30GeEs13MY2UhphzGhViN/Wd9LH7dBduNEOnITj49hNIOg8nYe/MqWFrRcnAtJ
 5+GMrQwM3GIk10TxD1Cvj1ikCrbvu07ZnrGMsGs/Ekm7xHUSk3pdTLTYQLgfdwOvdxjC
 akIA==
X-Gm-Message-State: ACrzQf0wmrx3KcEk+mXN/VdrYYG03htYiz3X2PITATpwBe7ExckNYnpM
 0pKEjG7VNSWdc0tbtLUvqgUDrAbVcKXeHq6e
X-Received: by 2002:a17:90b:3013:b0:213:ab5f:d388 with SMTP id
 hg19-20020a17090b301300b00213ab5fd388mr12996481pjb.66.1667219692233; 
 Mon, 31 Oct 2022 05:34:52 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:51 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 16/17] virtio-pci: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:18 +0900
Message-Id: <20221031123319.21532-17-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: ugShyBLIjsfY

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/virtio-pci.c         | 9 ++-------
 include/hw/virtio/virtio-pci.h | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c37bdc77ea..b393ff01be 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1154,8 +1154,7 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
     PCIDevice *dev = &proxy->pci_dev;
     int offset;
 
-    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0,
-                                cap->cap_len, &error_abort);
+    offset = pci_add_capability(dev, PCI_CAP_ID_VNDR, 0, cap->cap_len);
 
     assert(cap->cap_len >= sizeof *cap);
     memcpy(dev->config + offset + PCI_CAP_FLAGS, &cap->cap_len,
@@ -1864,11 +1863,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
         pcie_endpoint_cap_init(pci_dev, 0);
 
-        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0,
-                                 PCI_PM_SIZEOF, errp);
-        if (pos < 0) {
-            return;
-        }
+        pos = pci_add_capability(pci_dev, PCI_CAP_ID_PM, 0, PCI_PM_SIZEOF);
 
         pci_dev->exp.pm_cap = pos;
 
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..9f3736723c 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -141,7 +141,7 @@ struct VirtIOPCIProxy {
     uint32_t msix_bar_idx;
     uint32_t modern_io_bar_idx;
     uint32_t modern_mem_bar_idx;
-    int config_cap;
+    uint8_t config_cap;
     uint32_t flags;
     bool disable_modern;
     bool ignore_backend_features;
-- 
2.38.1

