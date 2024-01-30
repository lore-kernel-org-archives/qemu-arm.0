Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp939881ejk;
        Tue, 30 Jan 2024 08:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBw3fC/A/T89JQT9oPGe+xN5jtBwQnD0iqynNGrt3DYDsKIqYmIIwkl/A86AsLstYQhWug
X-Received: by 2002:a67:f58e:0:b0:46b:20ba:25c9 with SMTP id i14-20020a67f58e000000b0046b20ba25c9mr4213741vso.11.1706632707566;
        Tue, 30 Jan 2024 08:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706632707; cv=none;
        d=google.com; s=arc-20160816;
        b=r1nsgSmakDaNOlDJaWwTsDl6aElSCxXKJqiy5IAo8bpGVY3i+RFcpDP7U5pVAOdct0
         nB2/M+jOrN3wMUaCwUy6H+f/mRykA8L53df7U3iO6JgJoufKX8ZDc9dOdZ+C/iPVO43x
         7yoUNjdLTJ5TUuoe6u8kWe0DsIh5WB2ILLhbX/j23ZPOajmLooSi6gpgSGk/OYwH7G3e
         yGsNjbUT4EUOFDvP9D7sZFSUGBKGaiOwqM+56jQmUlbQFGRIuilDSDhHRmOGfbjLYtzG
         or8ZvuMlX15PGpq7YOIyli9/cTpQe9dvjOnFmsVN1mp+JLwEPGc7lBbOVE9u/0tM31tT
         Z+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=prozUp6CbhgoWSUmnTcsbU3VL3m6OxwFkVMz1Avvalo=;
        fh=Urq1RoTyO+OOBujohoC2Jqp5tJKPVqUlfF3DhFITF+E=;
        b=a+W0nieEUaMh7X48M03AJjrUpTQaiEG9mRyP2GQ6+92Vi+F31esZY/Rp1p4zgdHjPK
         M/KI3FXEyxDcWqEwLm+S40cylXJ8+DQicO5h7He5/G4DTBNUgC0YR09FAxjlMp87Cza/
         9y3jACCASiCJDPouFaiVZBrtMcNYOVQ2Udp9FXf4S1jLegh09t9a7BAd52eBpriZROtC
         7HVNhucgTLRkb9T9vlFj9nuBg0zxph0R+I7eQiEnVKpuvqVjiPGrQ9SM78ucZzOMoEot
         AzgOEXVF2wPcLZIgFAM7193Ax1JY+AChjGKUJDBgvk2bUJdmEF4A2k6o2My1cnodkHhc
         6uog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s29-20020a05622a1a9d00b0042be2fc5a52si175193qtc.601.2024.01.30.08.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 08:38:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUr7b-0001a5-BT; Tue, 30 Jan 2024 11:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7Y-0001QA-UK
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 11:38:00 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7V-0005pu-HA
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 11:38:00 -0500
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-lx7CQVTENWK2PYxOROMCVg-1; Tue,
 30 Jan 2024 11:37:48 -0500
X-MC-Unique: lx7CQVTENWK2PYxOROMCVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 517113C2E0B7;
 Tue, 30 Jan 2024 16:37:47 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 609D3ABFD;
 Tue, 30 Jan 2024 16:37:45 +0000 (UTC)
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
Subject: [PATCH v2 1/3] hw/i386: Add `\n` to hint message
Date: Tue, 30 Jan 2024 17:37:39 +0100
Message-ID: <20240130163741.145925-2-groug@kaod.org>
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
X-TUID: 8j9ndk1a5T+U

error_printf() doesn't add newlines.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/i386/acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index edc979379c03..e990b0ae927f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2697,7 +2697,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                         " migration may not work",
                         tables_blob->len, legacy_table_size);
             error_printf("Try removing CPUs, NUMA nodes, memory slots"
-                         " or PCI bridges.");
+                         " or PCI bridges.\n");
         }
         g_array_set_size(tables_blob, legacy_table_size);
     } else {
@@ -2709,7 +2709,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                         " migration may not work",
                         tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
             error_printf("Try removing CPUs, NUMA nodes, memory slots"
-                         " or PCI bridges.");
+                         " or PCI bridges.\n");
         }
         acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
     }
-- 
2.43.0

