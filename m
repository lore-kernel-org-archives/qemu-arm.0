Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3659474lfm;
        Mon, 13 Apr 2020 04:10:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypIkJbrp93eun201q6j36GKLmDAXENHhB97b6eWTLZ3njeetAtZkrqFnMeP3Y67/L9gYW+I3
X-Received: by 2002:ac8:3212:: with SMTP id x18mr10499648qta.247.1586776257475;
        Mon, 13 Apr 2020 04:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586776257; cv=none;
        d=google.com; s=arc-20160816;
        b=uv7nw1rtWFF2A7XkAcmH9r4uYDh7hHmwTuvqpxLAlaRfS0VPlGCMoPSbEHm6Tqa4x9
         PB3no1IRSxj2k4MqO/0qVQrZGio1+W6SFqMDBaVVChW9JD8Q1QlQoJUehshfll04wkzQ
         UeeIpBlTBo9eVbe0MZwiNN6yCccC5Ne738ANmiDHybB0PLQ6y3k8APmC8aF26NfpTNuD
         0mtJ0UDkCRqr7KVn+v4m6Rtqb35dYEuw8+DAXchh7DW17Ul3w4IdNKEEGw+pRvFTlZim
         p7UdpwDjwQq8Yw2OSsBMcJc4jaYZ8d+PVRZTl+aMs2iVM/uNPmNrVEjWBw70kTKaa6w1
         yq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=CJQx85+FirRBKcuYybxlgWpS5zFo+gnEtyDRFkVHinY=;
        b=NvPeBg5ZGx4efCEKZHDYzrI1UiJ2ejMQ8UFofqKWLIZ0qAiwxYNu7NwmJUgCFyj1HA
         qLZQrfOpKO3wuN45dVqfhGy0N5VcSf9eD4Uy34JfO8+TN1qsdM0kxq31z3JFdj8BU0oY
         CR8kpomGpshjOWFneJuynt/AwGkcu18AeF3QskYImespZz3wxeyPTHk9zXP1NJodNjNH
         /SPQgfnJH71vVvkJkff0eIdbbJSf3NEQTM44PLGXee/ULw8aLIbYUJGHlxatX7GvIAiP
         PJ4GPdSO/7HpeVz9YQWmE6Ra9G5oy946Ed54ACJe75/1n8Y4hcOg25P4a+m9GJ8JZhnT
         fkJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VFPo+lwS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si2724134qto.24.2020.04.13.04.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 04:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VFPo+lwS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNwzQ-0000Pn-Rv
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 07:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jNwxl-0007Qx-TW
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 07:09:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jNwxk-0006hG-PH
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 07:09:13 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51763
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jNwxk-0006cs-Kf
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 07:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586776152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJQx85+FirRBKcuYybxlgWpS5zFo+gnEtyDRFkVHinY=;
 b=VFPo+lwSfwadsO6fRbG52hZedlpgfXd9fDkHqRnq9QO31lFViOWqiSV1OrSeB44S9QJKYN
 V1btN4N22EDsBQHRZDM8N8BTV8448cyZ09OZdtb2bkA960Fa0Hhui45OO2sQoK9BQi+hLQ
 Nt5FKyM9mPygKFKrp/ZJJ62rUCBBoIw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-PDjKSwyHNhC5evrBn1bIRg-1; Mon, 13 Apr 2020 07:09:10 -0400
X-MC-Unique: PDjKSwyHNhC5evrBn1bIRg-1
Received: by mail-wr1-f71.google.com with SMTP id f15so6572258wrj.2
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 04:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wu2DMb7EM7lw3R1vo6KDqbpnls1BmYoUZ7qyMICe52c=;
 b=aWbMTjSP9nFFwnSsMEaRteOVtpMKP5xiVb/BCg2f/sjVM9aOsTVRvGbl5MAZESQf2n
 yBg5GTCy8HKgMFXaX/gshBortZEXnWgbNdcZ747R35kKTREI/AFTJeauuQG1mnTnjR+z
 7RdcXshA/H7zMOP7zE1u8D+p4sbJnuG6VRmdcHOBLhisQoPnDUNgox3CGgjbkQCMQ+J/
 Oe17JuOlr5R0IHhwilusH2er61aOC7TM0xbk6Jl8yg2ceN2ZMGFXAJQCIQ12cEwnpAnH
 ib6AzG+dXIST2hr4lIldG5URrHLC+DkLJm+kt044/43zwQ+q163ou1sStMnwGNwBFsVW
 KSTA==
X-Gm-Message-State: AGi0PuaOBBweGz5XOaUEW38X2P802wVNlf7iH89pGo3XVJEBdUZNiUBQ
 TZ5U4p24XW0muyuyPrtLy4Jh0RbgQ+t2/5OmH2RhnXMKEDS9VSZXo+dfTml2kHB4aqM8sLhVTFw
 HIZPkHE5VzAJT10M=
X-Received: by 2002:adf:b78b:: with SMTP id s11mr17520440wre.235.1586776149431; 
 Mon, 13 Apr 2020 04:09:09 -0700 (PDT)
X-Received: by 2002:adf:b78b:: with SMTP id s11mr17520428wre.235.1586776149216; 
 Mon, 13 Apr 2020 04:09:09 -0700 (PDT)
Received: from redhat.com ([185.107.45.41])
 by smtp.gmail.com with ESMTPSA id u15sm13218433wrn.46.2020.04.13.04.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 04:09:08 -0700 (PDT)
Date: Mon, 13 Apr 2020 07:09:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] acpi: Use macro for table-loader file name
Message-ID: <20200413110838.151374-3-mst@redhat.com>
References: <20200413110838.151374-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200413110838.151374-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mhFAThyZ4fLb

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Use macro for "etc/table-loader" and move it to the header
file similar to ACPI_BUILD_TABLE_FILE/ACPI_BUILD_RSDP_FILE etc.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200403101827.30664-2-shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/acpi/aml-build.h | 1 +
 hw/arm/virt-acpi-build.c    | 2 +-
 hw/i386/acpi-build.c        | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index de4a406568..0f4ed53d7f 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -13,6 +13,7 @@
 #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
 #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
 #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
+#define ACPI_BUILD_LOADER_FILE "etc/table-loader"
=20
 #define AML_NOTIFY_METHOD "NTFY"
=20
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7ef0733d71..81d41a3990 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -929,7 +929,7 @@ void virt_acpi_setup(VirtMachineState *vms)
=20
     build_state->linker_mr =3D
         acpi_add_rom_blob(virt_acpi_build_update, build_state,
-                          tables.linker->cmd_blob, "etc/table-loader", 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,=
 0);
=20
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->d=
ata,
                     acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2a7e55bae7..23c77eeb95 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -3043,7 +3043,7 @@ void acpi_setup(void)
=20
     build_state->linker_mr =3D
         acpi_add_rom_blob(acpi_build_update, build_state,
-                          tables.linker->cmd_blob, "etc/table-loader", 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,=
 0);
=20
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
--=20
MST

