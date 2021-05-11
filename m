Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4116113lfg;
        Tue, 11 May 2021 08:55:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJync44GGLukwTYC1ib6pj/RZXVNZEodSAkj3zYbOMrzCaK/pgPBx2OwkhvndoQoNXxR9PnZ
X-Received: by 2002:aca:edd1:: with SMTP id l200mr4242465oih.154.1620748502752;
        Tue, 11 May 2021 08:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620748502; cv=none;
        d=google.com; s=arc-20160816;
        b=Qc5HhFf9/wnovCHsyHFd9Zfv26CnXRPhkrdU+mCUOlDvgmWLS6XPp9vgGCXaynn09d
         SPGTJ0WqGvLOHR4i2IR5p49X1QBFZnLTBKhloE/7CVHHwT8Y9AL8doel+UE4Ok/nWGio
         shPU1DVmGM2+YX0zNLuzIZFiQ+4FCkgfoLKggoH+DIWpSCLxNp81ObMOm0aHmNk34Egd
         IMcRQaCjIKndW+5fgWY2ToGYc3Je6Mt4IBzFGEtYRGxZfGu1cPwL5NzOckQZmyIXNNY8
         AtXL+fHtVZUcCoetHsCdwuExnxm/kkeBKStWzXswHmNbSaotuu5zoRzhQoBwK2uASsDZ
         a5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ISzcTyeqpFPJKCkmwsme759uUOl966TzGtwslLb0Jt0=;
        b=TEDSUQ/OMMhUO8ntjNjWiSxiNWi1JcuJuX89sYR/I383dbZ27zXLz9LDNxb0MaLaxL
         xozNjv4JkHtzctjTa2o3MwYJym/7DWuQgu1ZdPOFclNANs0WlfgnxlQWj4wdohcDqNvM
         4a8valafPgqm47hhT1GFs2Oozj4wYo961PkDkSv6SSBFdCz9CVskWyjlyg8nygQ0bawU
         UTvnzJdijEvnCDPRDPjvK4RDipPCwu1Hy7rZwFoqOs5Onq7xAASbysMT32PE1bX9s66u
         n74WCC2K0bsfQdQ1MsfAEuVGELysNFTPB30FUBjcwANPLNI+hJAr5uw6pbbx4FWgnv/D
         raNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ffLVTTpd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si14291750oih.221.2021.05.11.08.55.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 08:55:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ffLVTTpd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUir-0005d1-TN
	for alex.bennee@linaro.org; Tue, 11 May 2021 11:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiF-0005EN-Cg
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUi9-0001TX-Me
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISzcTyeqpFPJKCkmwsme759uUOl966TzGtwslLb0Jt0=;
 b=ffLVTTpdrIELUqc9VGJGw5QojycqkFTpcfW94U7piPTRJ/dLrsZDc8eJe4xIDI6VuuHqk0
 JP4wHmQgYGYbHAhAj28WPY96fJvsNfcACQQc+kY5SrVLjC/S5/62+SrYk8wDRZ2e7ioIA2
 L2r/FuUnE67608v0iIUKPEckHDUO8Z8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-MvqVTvj_PamzhigcpyBgWQ-1; Tue, 11 May 2021 11:54:14 -0400
X-MC-Unique: MvqVTvj_PamzhigcpyBgWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso42986wmb.5
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 08:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ISzcTyeqpFPJKCkmwsme759uUOl966TzGtwslLb0Jt0=;
 b=M5J96Dnpy7p674VdKwSHZS8yjx+poiHE49ZJ7by7Rlx/bUgQ2Wo53HIVXEWvjhcPIb
 VHhrl2jXfm6vmvPE0aQbabkAsF08Rb7qtpzZBaceF3QzT/4aV0OdRaVKZBMIAOaSm740
 9cOr7olv+NEAO0VMCGE+zBjeZQWdowqxH/UAUauo5HD5jCZ2bts+YoeGotBTaGRCc13h
 6h8n2+aZm0d99Wi0M7g40FlMgrHffH482oQ9j3Qo8zjU/kiLbRmrPIn6WoyAN7UcIqba
 m9L47MfH6/q9IrLrtAvciExR7AJqG7Zi4B4kFKTDy495HVEmbFfzA/kYyM6hjnjDT6lJ
 QxbQ==
X-Gm-Message-State: AOAM531WPid3Nu2FDPIF1o667PMcDj4jCBoXLN/61tnQGNov+SEg61iX
 nVQbRcUSM1yKO27VMpPI2rRIjeNArrHZI9XnWAWmtU8yP9mFwFiAVgS/Ln/A22cFrP+zHZTWuJq
 dT1eIBTnEN4FQ
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr33147472wmh.151.1620748453260; 
 Tue, 11 May 2021 08:54:13 -0700 (PDT)
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr33147436wmh.151.1620748453036; 
 Tue, 11 May 2021 08:54:13 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n20sm20232505wmk.12.2021.05.11.08.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Date: Tue, 11 May 2021 17:53:50 +0200
Message-Id: <20210511155354.3069141-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511155354.3069141-1-philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9+in3G8UXBHb

Per the kconfig.rst:

  A device should be listed [...] ``imply`` if (depending on
  the QEMU command line) the board may or  may not be started
  without it.

This is the case with the NVDIMM device, so use the 'imply'
weak reverse dependency to select the symbol.

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

