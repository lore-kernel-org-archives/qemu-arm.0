Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5741751lfq;
        Wed, 30 Sep 2020 10:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ1IWJATdiIvPRfrvKJUYGOj1Dq8cSl2JZCKpHZxnMDnxQqfkQpmUsdFdy6dP8ztSwlUNE
X-Received: by 2002:a25:3618:: with SMTP id d24mr5425945yba.385.1601488326006;
        Wed, 30 Sep 2020 10:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601488326; cv=none;
        d=google.com; s=arc-20160816;
        b=YbMj/HxTkFRAORPBSaSpAJ8oIuN8dqFuaKEfwgNkbWBjvma+5bw9A4TzFu5Cgtfwga
         xyCMQN3rb68E0VV8BEfI2YzwNDvK9RPx8CFPMRGYvMuOwDkS3rhGGSjr9jw9oUtlSApb
         yyvsE76uhgCe0/i5LboF1cpuNs79xUXKJITbMp/If/WLpCICd70LdvGy5ByDlrZ55tWU
         MImTcYjlgHfD2g2+oXZFbUp8V3l9O5w5ItHP/kSduzEz6gLn7GAfmFLiQYqiPjJ1w10b
         lpPYJpVAeudW2fn/MrJk0HxX04y7UWIXk/1hpAhLesyhAkm26xNHMTqZ3mY/m4cfyN2A
         Bvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oc9qLdIGSG1zOKGv6zVt8apkcoeRk4jnOhbK02az2Bw=;
        b=XYTuoNSah6IHx8NqcF0jW4gvfEiOo5pxQYl69MEyX0XL+wkIW5kERxgXi/yFzgIrJy
         YfLsCJ6fie8ehwKmlggd7w/P9GelifpWk7R5NaFM0D1Cvi5/DeMoOCBlWg+mNJgJDIfD
         JdaftP0qE3/ZQ7x5I56s/pxPI0BGJRc4/xvSYRmGKoedUTE+GKUYUXL1ZYtVC8NcG7Kd
         Lx87HpNYrXrRgBL6SOgl6CUj1edTlXXijivPHI7JPfMbESkz1BZpuPAhQnURJIAk6jjN
         GK3ESHk98HkDf/BmmD2dYEckm7kK1IIFH6mVF96pEcgllHGWyLyALBQHgTVpMubnrHQA
         LmFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bRJ8aI1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f134si2412951ybg.117.2020.09.30.10.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 10:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bRJ8aI1v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNgGr-0000Nj-D0
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 13:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEB-0005BR-0t
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgE7-0004ih-U9
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:18 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oc9qLdIGSG1zOKGv6zVt8apkcoeRk4jnOhbK02az2Bw=;
 b=bRJ8aI1vYAsshL0TzNV+BSvKgYkQItNrDh3yFuAQhnULPF6m3x2PIdosWJG1a9tOvAlt1s
 HULfM6W68OoHt9iO3Nc3FI1Jkm5GwKpVh6gOCQjJHxqoN3TMxat3lEfPpkEyXixH7VhiY7
 spgE/RCHo62WoxflmWA7jcZtltQateY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-XV6l6wK1P1mWyuL9KhyQgg-1; Wed, 30 Sep 2020 13:49:10 -0400
X-MC-Unique: XV6l6wK1P1mWyuL9KhyQgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68082101FFB7;
 Wed, 30 Sep 2020 17:49:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D21AA5C1D0;
 Wed, 30 Sep 2020 17:49:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48A4731E21; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] microvm/pcie: add 64bit mmio window
Date: Wed, 30 Sep 2020 19:48:49 +0200
Message-Id: <20200930174856.11296-7-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
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
X-TUID: aaRmBzO9c9Yb

Place the 64bit window at the top of the physical address space, assign
25% of the avaiable address space.  Force cpu.host-phys-bits=on for
microvm machine typs so this actually works reliable.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200928104256.9241-7-kraxel@redhat.com
---
 hw/i386/microvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 273abe28c9c1..17e3f2f15265 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -198,6 +198,12 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     }
 
     if (x86_machine_is_acpi_enabled(x86ms) && mms->pcie == ON_OFF_AUTO_ON) {
+        /* use topmost 25% of the address space available */
+        hwaddr phys_size = (hwaddr)1 << X86_CPU(first_cpu)->phys_bits;
+        if (phys_size > 0x1000000ll) {
+            mms->gpex.mmio64.size = phys_size / 4;
+            mms->gpex.mmio64.base = phys_size - mms->gpex.mmio64.size;
+        }
         mms->gpex.mmio32.base = PCIE_MMIO_BASE;
         mms->gpex.mmio32.size = PCIE_MMIO_SIZE;
         mms->gpex.ecam.base   = PCIE_ECAM_BASE;
@@ -383,6 +389,9 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
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

