Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp194493ejx;
        Tue, 29 Nov 2022 02:14:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Y9uzoZx+rRgh/sYRf2wk5yYqQtyplvF3IOlJDvbZcF9vq1TVW1AKBoRljTWWxFxYu9GPz
X-Received: by 2002:a05:620a:1b8e:b0:6fa:c61d:7512 with SMTP id dv14-20020a05620a1b8e00b006fac61d7512mr2958853qkb.408.1669716841002;
        Tue, 29 Nov 2022 02:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669716840; cv=none;
        d=google.com; s=arc-20160816;
        b=YW6hgVAtWUaeTwv28DIq7p+D6Rb1dHl8LfIFOSIMn0pVKK7si2blVovOb6qbH9o7M7
         BnbtftNwufPeTWnbTAkBsF8hcezM16oJlVkfenCUi088kN8oFeU0+CQSegDHFs/ijmVg
         UktlgwQ76j4dL1tlolgzgTbRxOu7bMvb//fHgRbWxVRhhSo6nm35DtGlIVnZEsqXQ7Qc
         Xw+ymU27PH2yNLyjQNCEI6f9ifd2Tc23pRdTKkFScUSgToKwZBRm1G8jhbu8iHFIKGBn
         7lpMbPjWwm14AYH3ViGwO+l8SD9SnPaScDOxB6F+jnD+2hpxQFvAb7RKAaD1ej/Ur16Q
         5pWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xvqTpUUd+dZE8eYmiRpmXKcdFZ4ZiDeOfRPhMIIDrT4=;
        b=OyntehZAiS0QokOiCbG45F6uwRjgCr9+cy7g7iqUXJd1OGDINVO6dS6skFB/N1uO50
         uRJ1FShv0d0+eTYuN+fLZyW2JH0M5XY/+nI5Nn9Z2ob8gtRv7IGngH87ouDRjyDOs9Ha
         YeQ+JBd6fdgIli9TV1S1v8vIyIUL66xeq9btRyZRUlemeUUhpgO9d2g1F2a0BVcWrNyE
         xNadLAMsQDt9P1mPEpARtcajW7oTVZ/xWnQS7FeMtFxA/Uf1LRkgdY2e6Oubj1UEiEcd
         jJrXvfOqn7tBfJJBbj2lC4CNvKipxYr4vhqi000XfUaZndg72WSPqJXtbMxxFFlUu3Vb
         FH+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZnR6PxdB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a05620a248300b006fb4b8e7f8csi9669597qkn.411.2022.11.29.02.14.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Nov 2022 02:14:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZnR6PxdB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ozxci-0001GG-Be; Tue, 29 Nov 2022 05:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ozxcg-0001F3-KP
 for qemu-arm@nongnu.org; Tue, 29 Nov 2022 05:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ozxcd-0005DQ-I6
 for qemu-arm@nongnu.org; Tue, 29 Nov 2022 05:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669716831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xvqTpUUd+dZE8eYmiRpmXKcdFZ4ZiDeOfRPhMIIDrT4=;
 b=ZnR6PxdB1kvNBRhbk2UrfGvwhFPjmDdrbAyEdhJHrjJtBeaoIx9HjVn52WPC8OwhxIHWmx
 K3UeazS5sD/yxO8bwKvWg3/UBIgSWSY9QDSkbTg76TpYB7GMB9nRkQGD6i19WKxSOF6+H7
 p5Nop0/NXN0fGKw8hZmP4QHe7X0fmVY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-OOmnYG6wOeCxpoKzn6xBDg-1; Tue, 29 Nov 2022 05:13:45 -0500
X-MC-Unique: OOmnYG6wOeCxpoKzn6xBDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E977D38012C4;
 Tue, 29 Nov 2022 10:13:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D00782028CE4;
 Tue, 29 Nov 2022 10:13:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 for-8.0 0/2] pci: drop redundant PCIDeviceClass::is_bridge
 field
Date: Tue, 29 Nov 2022 11:13:39 +0100
Message-Id: <20221129101341.185621-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2GIbPsI6kySC


Changelog:
   - keep comment reminding that there was a bridge, so it would be easy to find
     removed code if someone wishes to bring it back
   - s/IS_PCI_BRIDGE/is_bridge/ in one instance where local is_bridge already exists

Igor Mammedov (2):
  remove DEC 21154 PCI bridge
  pci: drop redundant PCIDeviceClass::is_bridge field

 hw/pci-bridge/dec.h                |   9 --
 include/hw/pci/pci.h               |  11 +-
 include/hw/pci/pci_bridge.h        |   1 +
 include/hw/pci/pci_ids.h           |   1 -
 hw/acpi/pcihp.c                    |   3 +-
 hw/i386/acpi-build.c               |   5 +-
 hw/pci-bridge/cxl_downstream.c     |   1 -
 hw/pci-bridge/cxl_upstream.c       |   1 -
 hw/pci-bridge/dec.c                | 164 -----------------------------
 hw/pci-bridge/i82801b11.c          |   1 -
 hw/pci-bridge/meson.build          |   2 -
 hw/pci-bridge/pci_bridge_dev.c     |   1 -
 hw/pci-bridge/pcie_pci_bridge.c    |   1 -
 hw/pci-bridge/pcie_root_port.c     |   1 -
 hw/pci-bridge/simba.c              |   1 -
 hw/pci-bridge/xio3130_downstream.c |   1 -
 hw/pci-bridge/xio3130_upstream.c   |   1 -
 hw/pci-host/designware.c           |   1 -
 hw/pci-host/uninorth.c             |   9 +-
 hw/pci-host/xilinx-pcie.c          |   1 -
 hw/pci/pci.c                       |  20 ++--
 hw/ppc/spapr_pci.c                 |  15 +--
 22 files changed, 23 insertions(+), 228 deletions(-)
 delete mode 100644 hw/pci-bridge/dec.h
 delete mode 100644 hw/pci-bridge/dec.c

-- 
2.31.1

