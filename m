Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp573616lfb;
        Wed, 20 May 2020 06:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmh+DIssYjMdmyZXwjKfsbaPW/r5omFJAzdmxM1n/r5zpr9bOP1+oEx4ZbKOln2IGuO2Fn
X-Received: by 2002:ac8:534b:: with SMTP id d11mr5131015qto.287.1589980865813;
        Wed, 20 May 2020 06:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589980865; cv=none;
        d=google.com; s=arc-20160816;
        b=K9Svq45egCkhH4pd0137IQ6tZBsEsuZ0R0LLuiwbvHI6wp6SuV1Nx7w860PZoy51QB
         +eKHl7xfcEXKV9HyRw1NtfNThftrs50hGKvngOgu3zQnBfYmUugWCY89TcBVg3A9QUSF
         hdFDJKNby0PBhwXC31Tf6V0rx4oyyk+Ma6l3LAWad55APk+eyxjZxmOrhH4mslmCD3Z5
         RIxKRG3nnJXKAhATSF9cgrBrEGOPN9KHMgE8PK9zP+zcPJHCuV1u7AcOttCkXzqyccus
         kQIJtRmlYg5qhQrAXxDxehBdOVGKr5GeZ7rXaaKoMDDv3regnJpjahMdUxwmPirmrFTR
         auvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=9dP5pJMHATRMU7jZoSy5VOed74vhNKA3Gi6pt3jrRpI=;
        b=tNqEPk9YrByvMMtdK54zCk9EYK9cqEoKhXHxehkEgdss/0BEU1yeVoOIiAvnf9Na9J
         x5KYvAdvV4nKijUUOL6/C5I6U94g+XtayHiF6YXi2LzQJzsbMcQ6GOaL7i2yLWlUJRJz
         xzCvjKFdpq2roqm3xndIoHN6BOIz1RUrhl0ULtV1ZMYeb0sww1G25Erbq4xoi12xRoNy
         akXDt4IIf6M1maSF5Q+er5lNZ/6YBog9EG5Xb8vyw2zPR9WLIl7Mhk/2ld2FBAtUOqcK
         FJLvyly8Nryu8IkO9FTZN/u18JaqMymfJ26esgqpRTe14DW7Zzu6ccyrMyuvqdobGibF
         KgPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AFBnqiyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c81si1748018qkg.130.2020.05.20.06.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AFBnqiyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOef-0002qz-6h
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe3-0001mP-ET
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28410
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe2-0000E4-Dv
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=9dP5pJMHATRMU7jZoSy5VOed74vhNKA3Gi6pt3jrRpI=;
 b=AFBnqiyP4n2Nh8sxsK2HuGxtgvyU/huk1LK+mlqX5P4MzrWxdQqc5tPnmksBqLBTf0wMhR
 k//GyEQTQXzd6j19zo/MrZFRyfyPVbGKpCFDFcFJF7xLz21i4dfoQ3FWL2S7iYiBHuF5Uw
 a1ZfUzhD8Xcw2V+NMOWO8PIPCkRsIwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-Vn6kj1qfOVOLDr2UmnhKlQ-1; Wed, 20 May 2020 09:20:23 -0400
X-MC-Unique: Vn6kj1qfOVOLDr2UmnhKlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 871631800D42;
 Wed, 20 May 2020 13:20:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5ED32E170;
 Wed, 20 May 2020 13:20:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E55E19D57; Wed, 20 May 2020 15:20:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/22] acpi: fadt: add hw-reduced sleep register support
Date: Wed, 20 May 2020 15:19:49 +0200
Message-Id: <20200520132003.9492-9-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zfa2HF88KCH+

Add fields to struct AcpiFadtData and update build_fadt() to properly
generate sleep register entries.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 2 ++
 hw/acpi/aml-build.c         | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c13327fa7867..3be9ab504968 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -88,6 +88,8 @@ typedef struct AcpiFadtData {
     struct AcpiGenericAddress pm_tmr;    /* PM_TMR_BLK */
     struct AcpiGenericAddress gpe0_blk;  /* GPE0_BLK */
     struct AcpiGenericAddress reset_reg; /* RESET_REG */
+    struct AcpiGenericAddress sleep_ctl; /* SLEEP_CONTROL_REG */
+    struct AcpiGenericAddress sleep_sts; /* SLEEP_STATUS_REG */
     uint8_t reset_val;         /* RESET_VALUE */
     uint8_t  rev;              /* Revision */
     uint32_t flags;            /* Flags */
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 3681ec6e3d88..a894e2581fa2 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1865,9 +1865,9 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     }
 
     /* SLEEP_CONTROL_REG */
-    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+    build_append_gas_from_struct(tbl, &f->sleep_ctl);
     /* SLEEP_STATUS_REG */
-    build_append_gas(tbl, AML_AS_SYSTEM_MEMORY, 0 , 0, 0, 0);
+    build_append_gas_from_struct(tbl, &f->sleep_sts);
 
     /* TODO: extra fields need to be added to support revisions above rev5 */
     assert(f->rev == 5);
-- 
2.18.4

