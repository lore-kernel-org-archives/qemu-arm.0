Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp939880ejk;
        Tue, 30 Jan 2024 08:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6rdAn7JeD+08T914n0KxcgXsyMir1BudBdwmBfFGb8F2tkxJCddx3phRp0l/ZbQDaG9RE
X-Received: by 2002:a05:620a:2001:b0:783:e114:2a62 with SMTP id c1-20020a05620a200100b00783e1142a62mr8247586qka.16.1706632707572;
        Tue, 30 Jan 2024 08:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706632707; cv=none;
        d=google.com; s=arc-20160816;
        b=029z4YykTtT3F/Jd4fgcM/M+OCCcRUrsHm6tAbsOWF+/46wXkIjY5G3O7/3oQ5DqiL
         BrjlqsyDxgg2lzMXuapwXugPe1ElX7GiWGO8S4c/5aBTkFpo469hkwJNfWUCR0qwUVeI
         iQsmrbRKU4Afcm12OR8D34jnQZ9NfIpW2jf+FUSQpfa2oXljamN0pJAABI/06IXsz7MF
         iEiVvx2Y7yfmhsCEopApOlQmMHZQSSyj3fTEqXXWNMJrzHo2cPxfIJ7FOqP+zzxNs0j5
         4r+6I46ATuQHh99EYDFFOvh2lcj75LXvQ1ph60JAOOU2Fk52/VuKH0nKToBcNgurKdNr
         Ej6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=JcZYFaAVheUrGzk/W49vkdRZ8GoMy5G1xwn3ScNaAPQ=;
        fh=Urq1RoTyO+OOBujohoC2Jqp5tJKPVqUlfF3DhFITF+E=;
        b=SK2kXU1gGAxvhejI+GEmLo3v/u53BDaZ9gE2QtbV5WXnSnvqOok/nj1wYd1y0ZRTvq
         2qYxgzWyQEPmEPMiSauy58rRPDLFNOx85C2Xn6zzFnKlu5SmtvKAN1YnyBPTfS/4EuyD
         4YDic+2gw3xfr870YkWykR+QfPTBdcmdTNvxM7o+W419yQ8k/psKeoJhEgBDCLSX2zDH
         ALLUJL722XBhZEtP1hJ9lclQFJZZigrP4DhJcHX9gByQo1f0ASDXRQTPuGuA+kWwRtu2
         /nZI0EFqgtlludY6PGySDidOMWPqw9yi9k4/aSz1xcHC9BfO+gjh8x7szUKfQq6PkQen
         WXsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05620a113000b00783defbe495si8749435qkk.706.2024.01.30.08.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 08:38:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUr7c-0001fA-RX; Tue, 30 Jan 2024 11:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7b-0001a1-5m
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 11:38:03 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7W-0005q8-Kk
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 11:38:02 -0500
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-uT34UBVKPWqT49QDLRArrQ-1; Tue,
 30 Jan 2024 11:37:50 -0500
X-MC-Unique: uT34UBVKPWqT49QDLRArrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BE171C0418B;
 Tue, 30 Jan 2024 16:37:49 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A61AABFD;
 Tue, 30 Jan 2024 16:37:47 +0000 (UTC)
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
Subject: [PATCH v2 2/3] hw/loongarch: Add `\n` to hint message
Date: Tue, 30 Jan 2024 17:37:40 +0100
Message-ID: <20240130163741.145925-3-groug@kaod.org>
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
X-TUID: jl+KuMc9MDda

error_printf() doesn't add newlines.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/loongarch/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 730bc4a748c4..a1c419874123 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -509,7 +509,7 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     " migration may not work",
                     tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
         error_printf("Try removing CPUs, NUMA nodes, memory slots"
-                     " or PCI bridges.");
+                     " or PCI bridges.\n");
     }
 
     acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
-- 
2.43.0

