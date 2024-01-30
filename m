Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp912941ejk;
        Tue, 30 Jan 2024 07:58:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvBJJz7wGuA1tu8P4kifSLmRpusAVkJb3m8TizGSU7pX62EmL7lCNGWoGy061sKdmK9lUf
X-Received: by 2002:ac8:59c4:0:b0:42a:b0b6:73ee with SMTP id f4-20020ac859c4000000b0042ab0b673eemr2805852qtf.19.1706630318996;
        Tue, 30 Jan 2024 07:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706630318; cv=none;
        d=google.com; s=arc-20160816;
        b=DmYhEbNALNC80+zowihKsuPvy3q3a9PG4Dh1pHAMaeV8pHnD19BIOBHSqbU74vnTqc
         m6FTOmSVnLUOfYOxRLPfh66XzRQzM1AntuFD/uHZZphHu41okAYNUX75X0iKea7suZJO
         +6GUttmYQ51HlCNCRk72fJG0UBRGLtYIZbF5+0PTX4d6G0WyamKboxelEMaSYtgNj3nv
         aWudFH/aj8ilERzw6T1uLqWuREUYgo3hDpaDURbxRgrJIqZwp+65CKrXbBIKrzXBjR2E
         5JPPBhqBRcIMVe0dmgfv8MmgpxiG35bTarMm/ob0qrUx1BI7jEG80tb+b9V+WnrNwhd2
         obaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=cMzX3w4rdhCV4y7xuIfPnyCttXpvG2txHMUtW78lLmA=;
        fh=Hgw9lE4GTJjja+QU+fVBo4N/rsVjrEtZH/+wLrO5nf4=;
        b=SValzTdKoy7Z80kRl30d7oiARAtj6q8tC4vWEgpQKj9ZVIlTTCMHVtJShI1etAVZ5H
         y2vVDDaDw6Scuyq5xI5LpIZVMOyVAs2GEqXkJRhusZGRmolfaJbKMhdYbj/pXeEQAAze
         30remLDn3HYPsmzyW7tgg9+aQwNe2+IYmU5cJFJ9DITPHxUArfoRZ2rmIA4mZ8r/BsUK
         u6t4mYvSWOj8KdufGjTSYEoBebVSCNwJbmwHt1f9KQ3+CmpF7UMejw6h2hum6PCXnOD3
         TJjPVv7zMqXSiNS/RfTG0yMDgWC6LsbMrzJJyUg+cyGRFaysF6IPqpZz8PY9a4UB/Oyw
         7ApQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05622a030e00b0042aa55b47e4si4990563qtw.45.2024.01.30.07.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 07:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUqUI-00010m-SD; Tue, 30 Jan 2024 10:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUqUG-0000zO-OJ
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 10:57:24 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUqU9-0004gY-3F
 for qemu-devel@nongnu.org; Tue, 30 Jan 2024 10:57:24 -0500
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-Y4QX5mU9P0uR18IAj3Mw3A-1; Tue, 30 Jan 2024 10:57:00 -0500
X-MC-Unique: Y4QX5mU9P0uR18IAj3Mw3A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA66C85A58B;
 Tue, 30 Jan 2024 15:56:59 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA0D2492BE2;
 Tue, 30 Jan 2024 15:56:57 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <anisinha@redhat.com>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 1/3] hw/i386: Add `\n` to hint message
Date: Tue, 30 Jan 2024 16:56:51 +0100
Message-ID: <20240130155653.142283-2-groug@kaod.org>
In-Reply-To: <20240130155653.142283-1-groug@kaod.org>
References: <20240130155653.142283-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
X-TUID: e0KcOnQn2aXT

error_fprintf() doesn't add newlines.

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

