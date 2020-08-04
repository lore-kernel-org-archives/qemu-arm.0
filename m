Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp579484lfy;
        Tue, 4 Aug 2020 07:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw380dEc2xsLyAYv5U3eSRoEvJL9J4JUWtJpzPojejqP/CQRZH/qewj5aU8YpTsvM/h1RsI
X-Received: by 2002:a25:4dc4:: with SMTP id a187mr33789263ybb.429.1596550667493;
        Tue, 04 Aug 2020 07:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596550667; cv=none;
        d=google.com; s=arc-20160816;
        b=Sixj9zAtPD5+RWn+NMa5BdmGyA5hL6TkSJsTZpLwmzM9up+19JeE1E9OanHBWgrSYK
         sXJbCdec1jV8yMKYTlMRtWJ/cKwLgN2lX3DAhcx2fk59LorZvc1dh3PMhtVFAX/rGNKD
         j+Vo848OXXEqLNuhisbekgPTB6VM0s/J1nwGI8fOQkYXkDSRQNvOyRdf5QVwnYt701iG
         PCcX/2ZJJNhoEDQ6OCyWzdChBMMz1VAyNoXeoQ0m0jt035bNJtOkg4taTcAS4tcpqLaU
         Ue331lvOZcBi94psj8E64AYRS4PC2Gvv0TVQjVI6xGThRo1b9JuUMpamGPmmsYPXUfJa
         qi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=O+Jdn5rlTkIqQs4IBOaacsbGO+yrRT0GNqOf9hAByzs=;
        b=LrvLZSyqBMmZbJLfS6sk9OpXg4jYFx0L9YtV6gEf30XlXhzf30JTz2paGNk02HZHio
         B411KQe7kS0c8r6DTh80HaeDefT6IfrWs8HJGYBZnwsZ7DlE3GVaf/T0LhvGG+VplgI1
         P6BmBmopVZugsl+sLQ1+WWSdUmb4huzaIgZzW0FfPi+eE2x8+ueXV+lKh6qRu9CBF5uD
         uwev6fX6UCjcrg5BPY7zqUSsyEnFLhfIFPQlvZbafc2hu8Qw+Esr4bmU9B8ofivEiMVj
         Ey/b6QCYmDYyOKcdYcUSm1GdZo8uoxY+LGdDGtWaBdxvRaJ53bFuj8O0q4SsUjtvLNg/
         wwSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=frakTYAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v70si1500253ybe.383.2020.08.04.07.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 07:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=frakTYAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2xlC-0001nr-Qb
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 10:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k2xkl-0001mV-TJ
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 10:17:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51661
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k2xkj-000583-45
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 10:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596550634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+Jdn5rlTkIqQs4IBOaacsbGO+yrRT0GNqOf9hAByzs=;
 b=frakTYAO69THPOXiijP67/wnNAP/d6dz6+0KyY5zRbtmA9qT8xSEvDeeXCXxUHosl6bPd4
 nvVstuHB3Ng6M3vsKkMPAyTFUyNyknhxKur5yqtHfqEDuQgdijyJTcOpKTGg68oKLjarqT
 2rSVdUxn3ig28AdRFtvMqKgQ157qZCM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-XyjsK4XZPWSkwfiyKQ1bMg-1; Tue, 04 Aug 2020 10:17:12 -0400
X-MC-Unique: XyjsK4XZPWSkwfiyKQ1bMg-1
Received: by mail-qt1-f198.google.com with SMTP id n12so11404250qtr.6
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 07:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O+Jdn5rlTkIqQs4IBOaacsbGO+yrRT0GNqOf9hAByzs=;
 b=DZJtP41RHVWIDeqyAwm8N+fSswlvwuFbmSFNXJttocoD6PN+ll7haxfKDTkuMyMmkP
 +NDq5gWy7fu7WsAKDBkheI8xsvLpAaUykiZE+nts+t6z4QhUkCC9sS3VcAFYgUdPnKxb
 0wQemvk6RiiPUmqXFUdY9+qSguSQ4eVP2riAzWNuODRWHvOVeHIg6xJTy0oyGDN6EN+t
 iXjlTEfXUGKcgbYpcqE43L2YA2e6bJ4sOhNsFcuihVRyWE/TB46VxwZ4t+cylY58CLr2
 cUVo6A9vzPkpJZEj0Vs+scVUcSq3wghC/YO1pUIL0jFVQZVeRUdm7i5jCySbrKVdf3hM
 ARGQ==
X-Gm-Message-State: AOAM5338BUL5+66NaB361wo6SA29b1+V7NdmeJgnuNuMBbutHrze+rOg
 SEX6+T03A7KCk822Bb7ZdYNCT10FTUWqQ305DuaFJi4laynSEYKK5S9vS7DotY7ERJvR5Dvfw03
 w84ZRfgslcvKY
X-Received: by 2002:ac8:7b94:: with SMTP id p20mr20512135qtu.312.1596550631978; 
 Tue, 04 Aug 2020 07:17:11 -0700 (PDT)
X-Received: by 2002:ac8:7b94:: with SMTP id p20mr20512114qtu.312.1596550631745; 
 Tue, 04 Aug 2020 07:17:11 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net.
 [79.177.102.128])
 by smtp.gmail.com with ESMTPSA id y14sm10353782qtc.84.2020.08.04.07.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 07:17:11 -0700 (PDT)
Date: Tue, 4 Aug 2020 10:17:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] arm/acpi: fix an out of spec _UID for PCI root
Message-ID: <20200804141640.591031-3-mst@redhat.com>
References: <20200804141640.591031-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200804141640.591031-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Vitaly Cheptsov <vit9696@protonmail.com>, qemu-stable@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LVdnhmzDqub/

On ARM/virt machine type QEMU currently reports an incorrect _UID in
ACPI.

The particular node in question is the primary PciRoot (PCI0 in ACPI),
which gets assigned PCI0 in ACPI UID and 0 in the
DevicePath. This is due to the _UID assigned to it by build_dsdt in
hw/arm/virt-acpi-build.c Which does not correspond to the primary PCI
identifier given by pcibus_num in hw/pci/pci.c

In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
the paragraph,

    Root PCI bridges will use the plug and play ID of PNP0A03, This will
    be stored in the ACPI Device Path _HID field, or in the Expanded
    ACPI Device Path _CID field to match the ACPI name space. The _UID
    in the ACPI Device Path structure must match the _UID in the ACPI
    name space.

(See especially the last sentence.)

A similar bug has been reported on i386, on that architecture it has
been reported to confuse at least macOS which uses ACPI UIDs to build
the DevicePath for NVRAM boot options, while OVMF firmware gets them via
an internal channel through QEMU.  When UEFI firmware and ACPI have
different values, this makes the underlying operating system unable to
report its boot option.

Cc: qemu-stable@nongnu.org
Reported-by: Vitaly Cheptsov <vit9696@protonmail.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 91f0df7b13..0a482ff6f7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -170,7 +170,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
     aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
     aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
     aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
-- 
MST

