Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp939749ejk;
        Tue, 30 Jan 2024 08:38:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlsX3GblzGISGPUhQdcogqUBl/5Pf67DyVlpzB3aDVTHrVfM3REBuxDOSduX3tvqoLQFNz
X-Received: by 2002:a05:6214:2266:b0:68c:46e0:78d with SMTP id gs6-20020a056214226600b0068c46e0078dmr7622588qvb.45.1706632694762;
        Tue, 30 Jan 2024 08:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706632694; cv=none;
        d=google.com; s=arc-20160816;
        b=a0QQvnRILByNjLGgaKnElu27MA1jkcZ7YbHKblZpN/wH9BTAW+vg60PeDrGbbENIxk
         sjgibDFjUI2jUBkPSmYCRiq9h0wMaKMpRm94qC5BmOdgGWIvBsR62F5OCTo3ggv9LeoC
         BjSUyvQtRoN5K0wUn4Vij1gbTp1G9dT3bnfNk7tZo2TStVPUlcmlzCLYgR0pN1PcLM0T
         tPkDeH594+QCIq3sFGo7jZYisFaUwFocBeZwjFgaILUsrjihST8deomDf9j/Rh+8lGO2
         w+KojAD95wDjmnnCDSM6+VJnK+O1+Aua+wJBlfgxgkjT1e3dBX4OHgzmsUxviFwQnGPW
         7vUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0BYt4lGVWxWnJJFYzTSzjHLKky/sa3WdFkYGmryWwkY=;
        fh=Urq1RoTyO+OOBujohoC2Jqp5tJKPVqUlfF3DhFITF+E=;
        b=HhXiERKJT5Cr2S1nLQ5V4XAagrc7JsVd528moHgN3PRtWWSOwst8ookeBtWMjUKhhe
         GsTEOZn4UMg3gI2yraG40jR0pAbV0/WEuFEsTUIq+6ICR7kmDBjqszk5+E4t3qytZ6Tx
         VvGTHhZJypN2/pWAItgn8Oqr4Ul8yxftNUbdJqZ0Qw1FmiSMg4Bo4aUlkksWtSCoORio
         AjRNOIUnJXFmgq1IBsXWLtmZOOcCi9oEdiMdfjcz9xIUAAUuuOi+wRBSV/Xz+CGpNb+o
         qSteBd3iEpU2oCo2EbslbOR6+/3AnE7Aw41FRMJRCxG8XmJNRGjns9tOinyCA8z7tB21
         Gmqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a0562140c6100b006896efd10basi10107616qvj.536.2024.01.30.08.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 08:38:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUr7b-0001bg-PO; Tue, 30 Jan 2024 11:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7a-0001Th-G0
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 11:38:02 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7V-0005qd-Hu
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 11:38:01 -0500
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-zVXr-pgoPz-uPRMzHfXlSA-1; Tue, 30 Jan 2024 11:37:52 -0500
X-MC-Unique: zVXr-pgoPz-uPRMzHfXlSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4741185A781;
 Tue, 30 Jan 2024 16:37:51 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B67ADAC1C;
 Tue, 30 Jan 2024 16:37:49 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 3/3] hw/arm: Add `\n` to hint message
Date: Tue, 30 Jan 2024 17:37:41 +0100
Message-ID: <20240130163741.145925-4-groug@kaod.org>
In-Reply-To: <20240130163741.145925-1-groug@kaod.org>
References: <20240130163741.145925-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: SMZIgKu6yq56

error_printf() doesn't add newlines.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 17aeec7a6f56..48febde1ccd1 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1008,7 +1008,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                     " migration may not work",
                     tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
         error_printf("Try removing CPUs, NUMA nodes, memory slots"
-                     " or PCI bridges.");
+                     " or PCI bridges.\n");
     }
     acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
 
-- 
2.43.0

