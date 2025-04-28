Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5871747njd;
        Mon, 28 Apr 2025 03:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEXT16HuoQz7S7aXsutsfhNXfAfIEf3WXfdTTgRR9wuUlsj/PSAIdoJOtkaoc4LmI6GISBKbqIorer9g==@linaro.org
X-Google-Smtp-Source: AGHT+IHmoHOE+aPTOscXlINnvkJcpaO+8dFRbpcmG/HPSbuAagjeOMNEx3LpYdsBsfbB9tYP4GQ2
X-Received: by 2002:a05:620a:19a5:b0:7c7:a543:dcfe with SMTP id af79cd13be357-7c96072b887mr1813450985a.32.1745836283437;
        Mon, 28 Apr 2025 03:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836283; cv=none;
        d=google.com; s=arc-20240605;
        b=kyyH6AFHE1yMpn1iRy7kWy2MkdAjFPMi6Dnhx48XNA0dMKtcitjnxUmAy6+xQrxBjE
         W+J4ZuTJpEe41ZhWivGKXu8LAqm3gGgrXmSimH2YKN6G9twCG0z0YqedoRp5ZGwpxoUH
         o3PpfiiIf73sr91E+EcU+9YHYedmLq7ClW+3hI7sRgBxutxv9T65Kuth0BKvM/nXr0a4
         kbW641mmPFWxoC6OQLusrqBQPoeUvJWVvKCs6F8EuWLH1S7uDDAu3F0U/pKN29LKsJaa
         nas+Bb8yQc29DhQvgbz2NZQU/G+xdmoM4ZJMnV8rcbE9ebVfZsIIq2xz77YsyCzwqc75
         lmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NmD/nH1c2WI+vKPRfCzY69vvFW54EUF4j6GUwYZynyo=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=LhNpodM12Ta0pVQHg/gUTNEXsK3faghFMi4aGDt9v1oOounVUSqQDqRC0dvrHwJFi2
         2mQdVK8Ys2L49OsGjff3adSfU1W5cQTRdpSMvuaxdYCH1RGpJ3Gn+k47Z3DS43DbO4x8
         HzMaw7adVt2yLt5pE2Cx5V4JOaG8Uk5twNfBT4SuHxPp6AyVX+QqPoK/KaDc8NQ3EGpS
         gnm016nEIvq4WnEpNV11rj15jpLUi5o+Uvivnr5aAvz5GBvYKvUgrurEYVidjotbBN4I
         VZIbgOGNA+KW77BBjviAaWOgNJnbhfmD6CDqGuNHo0+wc8bxp7qIIltsaaNBMyXSufr3
         7LdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PuFNxSmR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958d85910si968810385a.199.2025.04.28.03.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PuFNxSmR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9Ljv-0004B7-R7; Mon, 28 Apr 2025 06:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj4-0000no-7I
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Liz-0003VJ-DA
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmD/nH1c2WI+vKPRfCzY69vvFW54EUF4j6GUwYZynyo=;
 b=PuFNxSmR1XQhHEfdLv1f+38u45MglBKL4i+3YPd/Rd1v4uaYIftCGcvOyofRdN3+CHgaZg
 0ZgZPgiRsLtsK97Yx7Sm483HoH3fxOsxAYIdxx+atfSdjce5mfd/av+CKMj9NHKsM6ZBRG
 WL/mAMBZ+fIEa+AwhGHmkCcs88eqnGI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-7kOl8lEwOHKW6-2BCi_bAg-1; Mon,
 28 Apr 2025 06:28:12 -0400
X-MC-Unique: 7kOl8lEwOHKW6-2BCi_bAg-1
X-Mimecast-MFC-AGG-ID: 7kOl8lEwOHKW6-2BCi_bAg_1745836091
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 248DE1955DCC; Mon, 28 Apr 2025 10:28:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E682C1800367; Mon, 28 Apr 2025 10:28:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 20/24] hw/acpi/ged: Support migration of AcpiPciHpState
Date: Mon, 28 Apr 2025 12:25:46 +0200
Message-ID: <20250428102628.378046-21-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pkaJd+BaUkf/

Add a subsection to migrate the AcpiPciHpState state.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 144c91ea4c..a7438bf60a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -414,6 +414,25 @@ static const VMStateDescription vmstate_ghes_state = {
     }
 };
 
+static bool pcihp_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->pcihp_state.use_acpi_hotplug_bridge;
+}
+
+static const VMStateDescription vmstate_pcihp_state = {
+    .name = "acpi-ged/pcihp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pcihp_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_PCI_HOTPLUG(pcihp_state,
+                            AcpiGedState,
+                            NULL, NULL),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -426,6 +445,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_pcihp_state,
         NULL
     }
 };
-- 
2.49.0

