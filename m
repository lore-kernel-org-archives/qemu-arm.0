Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1339153njb;
        Wed, 14 May 2025 10:06:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwJfTIf2JHQvdBgGcD0fIKhHX+d/b1/ZCe3hp6phQOJneR7N8ySCzGz9u2UGgmelSJk0QMI8eCXIRWGw==@linaro.org
X-Google-Smtp-Source: AGHT+IEeldh8wSkm9IPMDFJPGqTuQAdBmjcQNpcbr2v8zgp05cbvVlqpgveGEf1sX3TOWSjL2h8B
X-Received: by 2002:a05:6000:2283:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a3493dddafmr4205185f8f.0.1747242407618;
        Wed, 14 May 2025 10:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242407; cv=none;
        d=google.com; s=arc-20240605;
        b=Ksny1R7WGvrgmH/UDHoXmb9WX/MvNoI+2Lykmp0yTTwI1gmaCUCjKhCVb5fFUpFnGl
         rcW2IRj8B5IuuVfvOeA8iZ5SMkCziYUKnjuiEmP7OeeGOBvCTrT9g0L+qmnqyFejoHyJ
         LXxUaSAbhkKFFJi6MWN1Ui2uZ3VvXbSdE05gerJeHw0LzlszrxDV90G+NaSjrGcOUfGX
         OL5cBCdLJYT+tG02FtwEDI9HxHl9bQqQevZg39xZ9LlwmOtNYyu15sDp+s7Enq+DZD/f
         +Sx72h9AEI88Tab9ZiN8ah7Ne95D4RjihAQY6wxBEIT60B3teQsj7Iiepg2n4GNBzPb5
         B6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fPyOK2VchnLZfJfkfu8IoakAVfUzKAuu0tY366YCejk=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=EBUOYPhadjMT1ZfcVskd2SXZvAemZ8UZidC0EYJF8ggN6cMKvJN+gO5g9To1B9eVrn
         Bzzwc3fNMRT/3yK7ZL0abCvvRZ4ng3i6J2youtiryJecPnxESJ9Ct+OsNfw0egqqAe2U
         RKeHyXueZ177MrdCRrPb14g1SnYZ1Odz94YSRQz/bDvAVnE2zsY8V5KvzyhcQWA009PV
         xut1PNwToePNSy8GGDhElcpIcBG/N4nqW/Rnte3fQRX2dDGE8XxwBKiUb4SD1vDC6xdY
         XiBwsLRAMH6mZRu+o2b39F6lpNGZ2JPF23rq7wMXMTnTXVBy0UF478rmEYXHdUEN50Ac
         H8yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kmm/SoKh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a1f5be7485si9930764f8f.295.2025.05.14.10.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kmm/SoKh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFYy-0003IZ-22; Wed, 14 May 2025 13:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYh-00033T-8q
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYd-0007pe-CR
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPyOK2VchnLZfJfkfu8IoakAVfUzKAuu0tY366YCejk=;
 b=Kmm/SoKhuXyr2QEdkD5YWZMx8PtPMnHurEJfD3MzkzRZHEIZuN7uH4ksX0DS9ksZR+8Frn
 PTa3skhAual+5VR4ssBudaCscT4hRoNdTPkYimxMIjdXDcgwiwaqiTmlKHIK5+iSFxNQVv
 /pfimb0RDO2WhgXRBDNyKYgUTGY0AAA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-yOUxTYKBNOuEUmBT5oEsAQ-1; Wed,
 14 May 2025 13:06:12 -0400
X-MC-Unique: yOUxTYKBNOuEUmBT5oEsAQ-1
X-Mimecast-MFC-AGG-ID: yOUxTYKBNOuEUmBT5oEsAQ_1747242371
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5BC101956078; Wed, 14 May 2025 17:06:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1868C30001B0; Wed, 14 May 2025 17:06:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 18/22] hw/acpi/ged: Support migration of AcpiPciHpState
Date: Wed, 14 May 2025 19:01:05 +0200
Message-ID: <20250514170431.2786231-19-eric.auger@redhat.com>
In-Reply-To: <20250514170431.2786231-1-eric.auger@redhat.com>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 86oJYsqJkiTJ

Add a subsection to migrate the AcpiPciHpState state.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 519329e2ef..30751c2bcc 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -415,6 +415,25 @@ static const VMStateDescription vmstate_ghes_state = {
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
@@ -427,6 +446,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_pcihp_state,
         NULL
     }
 };
-- 
2.49.0

