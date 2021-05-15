Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1428397lfg;
        Sat, 15 May 2021 10:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhajsQKb4htLJJl7mOVgg59jT7IARSuSqP5YZCaPbDyVy5RHJkmxH6qKaZqtFKy/nCnoGU
X-Received: by 2002:ab0:2381:: with SMTP id b1mr17858510uan.93.1621100260426;
        Sat, 15 May 2021 10:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621100260; cv=none;
        d=google.com; s=arc-20160816;
        b=nPbHv30W/9r/bb5lhdXSAL4L6SsZBKpWCrmONsq2oOAdrrTuxiyQZHKI8juZhbNK7r
         YP1XVmgY6iXeLObv9wvbsDUjUZrZH0Z0V6t9Dx8sB2kgKs7E7jTG5WhJ8pZHq3nAUgQm
         WXW2rlGEMAXVQFd3oxlA0GaADMWvcm2LGMnk6Vh5xRvY95iMHznlHhY9UkNe6dX+kFHZ
         3gw17XzfSJP3fU77hgr0I6YJfJzSB8Nt1RyuKJZ00i+haG0KtWnJH1MQFwq06N142Vmk
         o2Z7kJ4jefQEcma2GvSE0hMQ46EvDX+r5cWZ496YTpypUVp7gf418F3ZKObP1L8Hw+ND
         vH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wRNuc1gJMH1hkdyUyCI+kE/vTfEuz1keBAJWrXytcEA=;
        b=qsKQ5ODzjaFGD/NSzqxevdfH25WXgTkTtswcttPj8UPTZv3SrdEXQxsIUaWp5709Tv
         82kUMl8/c3+sIHxkOodOX3i+JIdMuAi78s49redCAEhrFgrhXYMTtdqnBBCCPcUjP9MX
         aq7Pru0JpFAIALfs6k0FJgxEiUikYcbxcTlX4NeWcQsBem0qTYUrtwgsS4rgIovaR/yB
         NS5SgfcLtb49phNRWZK+sgj0IIJsAprw8tgxv6BTdxN6YcojUwy/7yKPTQ4nl1WheQ/f
         iiAt/7asbUYrEZZjObzeYi/fkCTaVAJU9uDiS4qetOWVSJH/ztnvxlLQnR2YdVlM3aUS
         DmWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d6lHMr2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si5424865uam.231.2021.05.15.10.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d6lHMr2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhyEN-0008Dx-Na
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEE-0008A8-E5
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEB-00062M-C4
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRNuc1gJMH1hkdyUyCI+kE/vTfEuz1keBAJWrXytcEA=;
 b=d6lHMr2j3oIQOsSwOy+mdnThkPLAzy02UaCx3GNgfYG4XNHWUX+G3wwme3Zt9hEucC4XkA
 XTpa0AtnL9olpvAhbhHbNx4jreU2lfdEpTefdhHE2TawZi7oT5HShluPnrIAv1+8XzfRV5
 z/GasMvTmd17joJzMPhiu0XZd/MRzqQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Y5qyOgTEMkqxXrd20lqiIA-1; Sat, 15 May 2021 13:37:25 -0400
X-MC-Unique: Y5qyOgTEMkqxXrd20lqiIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so1678851wmg.0
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRNuc1gJMH1hkdyUyCI+kE/vTfEuz1keBAJWrXytcEA=;
 b=O556port3yzxpP5m8win0iwvtbLCdcFqtgOzbujY1O9lLqeRzUpGo2bRQIDYO/23l4
 UXXJsGQkn80BHUsXMgsDeIar3jKS+mCJ473j4Qn4WxfBiCYdaQEs1+yqvOEUrr+quLkR
 v5xwY269QmDajN7qPJdvp/lMQ+riQ2DCWO0rGTmTWfUqluRdt32qy8Zl60XI8z7m5j6H
 5Vr/hchH8T6TGaZWwAIxHu+twca/672eXzkPNY8A/ECM1YKgUC+zH51b1Jsm00gXopj0
 ABHmfyrWs9ukvP8+1JxmCDfTwkMfzMJH2NsfA/+R8zzmttP1Wi4m8gMO1jJ+jJjSm37S
 9GFQ==
X-Gm-Message-State: AOAM531cyfs7dB/kJEXvtSKqBTt2nb7vjwt+n7AgDTRZVvp/mOq4XHWY
 PVSTXBiVMLluboExCo10Rw2BnVTwDfBbe2Ph8guKBUF2Bt9+CLZG9hhi6arewS7Pp6L8fCft1dy
 WrvlXnva0Q+6U
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr14966982wmp.156.1621100243859; 
 Sat, 15 May 2021 10:37:23 -0700 (PDT)
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr14966953wmp.156.1621100243687; 
 Sat, 15 May 2021 10:37:23 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a17sm2052985wrt.53.2021.05.15.10.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Date: Sat, 15 May 2021 19:37:05 +0200
Message-Id: <20210515173716.358295-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zz4g/yi1eV/t

Per the kconfig.rst:

  A device should be listed [...] ``imply`` if (depending on
  the QEMU command line) the board may or  may not be started
  without it.

This is the case with the NVDIMM device (it is certainly possible
to start a machine without NVDIMM) , so use the 'imply' weak
reverse dependency to select the symbol.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/devices/ppc64-softmmu.mak | 1 -
 hw/arm/Kconfig                            | 1 +
 hw/i386/Kconfig                           | 1 +
 hw/mem/Kconfig                            | 2 --
 hw/ppc/Kconfig                            | 1 +
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
index ae0841fa3a1..cca52665d90 100644
--- a/default-configs/devices/ppc64-softmmu.mak
+++ b/default-configs/devices/ppc64-softmmu.mak
@@ -8,4 +8,3 @@ CONFIG_POWERNV=y
 
 # For pSeries
 CONFIG_PSERIES=y
-CONFIG_NVDIMM=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b17..67723d9ea6a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
+    imply NVDIMM
     select ARM_GIC
     select ACPI
     select ARM_SMMUV3
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..66838fa397b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -23,6 +23,7 @@ config PC
     imply TPM_TIS_ISA
     imply VGA_PCI
     imply VIRTIO_VGA
+    imply NVDIMM
     select FDC
     select I8259
     select I8254
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index a0ef2cf648e..8b19fdc49f1 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -7,6 +7,4 @@ config MEM_DEVICE
 
 config NVDIMM
     bool
-    default y
-    depends on (PC || PSERIES || ARM_VIRT)
     select MEM_DEVICE
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index e51e0e5e5ac..66e0b15d9ef 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -3,6 +3,7 @@ config PSERIES
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
+    imply NVDIMM
     select DIMM
     select PCI
     select SPAPR_VSCSI
-- 
2.26.3

