Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1127253lfq;
        Wed, 23 Sep 2020 23:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNdg7D8qwLXSBKUqriPT9H6lumRB8en7ICjtY4I1uO1BooWxrNL2FxwQXWlurMB1htVwyS
X-Received: by 2002:a25:dc8f:: with SMTP id y137mr4855289ybe.186.1600928916733;
        Wed, 23 Sep 2020 23:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600928916; cv=none;
        d=google.com; s=arc-20160816;
        b=NMh7FuNCPqMfDFwmbauZc4YyWGPvXmcJX9+rS+ODSieUjSM93Zrw13rms2tQ3oJGUj
         5Il2ubxIP2HxdCCd2Y2SAtuV7Q2Q+gfskRpP1M0YEsrB4AbQ0Ryn7pKD08jhWDPKWqa4
         AbFqJaxJdOe2ngCzlP1FMX5GFlBhu8C4iq4LPBJpKDhM1K9F8GNKwwYpB7o+Dh0GLgy6
         5dErEF+njY63arlrZH/5Ci9SuhSlPkM136AfH9jtYkeJJsjAX0A74lVAE1stbi6CexEJ
         kiaNzkPU5JC5wWM4FGLPDHxpB9C3yG/Y08OwujTxDXWiZWqxapxZGL25G4JFcOQSjQXV
         ouUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lSFpsddeyQKKGEVKsuHPMwpgzZsljC0CrBOQHMOdmLY=;
        b=slZQe+PewGnpzqYlpQvZdp05CByUQlikWsQi670S5B2ZR5E9CZLX96vto6fIaIAIWJ
         bKMFsbqD+JQit8UyfhJ1qJRRtmjhv5osqZ+Xgf7I8/nt5HtT0TyL0ixw8f2YZV2lXsGD
         CWyQ33Xl4+7b8a7OBy2PN1i2Qr2hHcSBWT3BFrEaMrfChv01PqXvzCxvPcksUFq1wpKj
         eh3+BKlYePfLoJDkZig+hOkHjy+t6ARBozh0j/Ukn1UIzs0GUWR0gxbsbmT25fqPb1jC
         cctAB/5kHSoY1v5wANctmwJirgravZmOvKFlazWMKz/lTcYIK3QBzQmIYAxQBnvj2YdK
         pQAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BCCSOMBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si2162309ybu.172.2020.09.23.23.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 23:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BCCSOMBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLKk8-0000fC-47
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 02:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjU-00006I-8n
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjP-0001fC-IB
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 02:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600928869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSFpsddeyQKKGEVKsuHPMwpgzZsljC0CrBOQHMOdmLY=;
 b=BCCSOMBKcWf0vI4SlKzpYRZO4DplK1gOAdYEUhzzf3Ptze13tfQWF279RZ/LTFumCOqFAv
 2kBQZatIOjx8r0yIefPDtXAFCZEUdJ3yx081U7/xzDJpX2fnIu10SP9PY1q0a+fNNb/rbr
 RwSubFLzc44q5z31Ty0/PUlOkBPbc5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-QI-41rDbNlqm6na_p0ONEg-1; Thu, 24 Sep 2020 02:27:47 -0400
X-MC-Unique: QI-41rDbNlqm6na_p0ONEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0663A186DD28;
 Thu, 24 Sep 2020 06:27:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DC075C230;
 Thu, 24 Sep 2020 06:27:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2579431E63; Thu, 24 Sep 2020 08:27:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/11] microvm/pcie: add 64bit mmio window
Date: Thu, 24 Sep 2020 08:27:29 +0200
Message-Id: <20200924062734.22978-7-kraxel@redhat.com>
In-Reply-To: <20200924062734.22978-1-kraxel@redhat.com>
References: <20200924062734.22978-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 17ebTFZpMsCl

Place the 64bit window at the top of the physical address space, assign
25% of the avaiable address space.  Force cpu.host-phys-bits=on for
microvm machine typs so this actually works reliable.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 273abe28c9c1..a27929e13623 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -198,6 +198,10 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     }
 
     if (x86_machine_is_acpi_enabled(x86ms) && mms->pcie == ON_OFF_AUTO_ON) {
+        /* use topmost 25% of the address space available */
+        hwaddr phys_size = (hwaddr)1 << X86_CPU(first_cpu)->phys_bits;
+        mms->gpex.mmio64.size = phys_size / 4;
+        mms->gpex.mmio64.base = phys_size - mms->gpex.mmio64.size;
         mms->gpex.mmio32.base = PCIE_MMIO_BASE;
         mms->gpex.mmio32.size = PCIE_MMIO_SIZE;
         mms->gpex.ecam.base   = PCIE_ECAM_BASE;
@@ -383,6 +387,9 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
 static void microvm_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                        DeviceState *dev, Error **errp)
 {
+    X86CPU *cpu = X86_CPU(dev);
+
+    cpu->host_phys_bits = true; /* need reliable phys-bits */
     x86_cpu_pre_plug(hotplug_dev, dev, errp);
 }
 
-- 
2.27.0

