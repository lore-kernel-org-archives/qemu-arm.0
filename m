Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp912412ejk;
        Tue, 30 Jan 2024 07:57:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIFQ341NFMS4Fht6+VMwHxBoaUvlL8RvF454c83bq79HoJ1bxcjNdOcm638X8p9WUWb2EF
X-Received: by 2002:a05:6358:999e:b0:178:9be7:f8dc with SMTP id j30-20020a056358999e00b001789be7f8dcmr811908rwb.40.1706630262336;
        Tue, 30 Jan 2024 07:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706630262; cv=none;
        d=google.com; s=arc-20160816;
        b=bSRc/XFjG3Jj3Qqb5PVWjCceAoeRbJVy83q19cjIQlR8CW5h8eWaP47FVg3djYcd8y
         WFoswk6u6tQ29Nsk3PXXugW1jDXcFHWyYPA45ZPBAzx6fnzw0sKNFOmodK/j5Fv7l7+M
         ZD8tUGKBuH++dOj46Aw5/0oCxUhizye0COhFURZEY776T3sIW8hadF/VqMjO+ZxF/LhJ
         9Ys6FEjOeu5wt9W5I7Sq50AKdXXMPlVtDiBel3SdkNjfyDciO8cJ87lVUKPhJgIJgwOB
         vzWfniaZ+DmYZ5PkLT5Hblc2hXmqT2CN4B7Ve5vPmCDcFvT4kHvYofYaZjOT6nw11lia
         q/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=OOcHD0QVdJc/BsdOsOefy8sUnqIi2zWt3QhHB+l+KTE=;
        fh=Hgw9lE4GTJjja+QU+fVBo4N/rsVjrEtZH/+wLrO5nf4=;
        b=aXHi+Ywf1i+1k4swlEzTOkTpzgKtEv/aJFR3KoXcNkomwAGf8YXnmQxDkKAQXJqmfW
         a27I9E+Tvt5Hg6+mWqmPiPJ/guQyr7+ziBJbA1ckm4rLwQP+C6KRDw3slk7rvDg8MQ/I
         v4sdsoTAuDAUzgkF3TdIjBaZz8i4ZdrQIRkz7kGGmWTJlX+qCVRS+UdNX0pxv+jWcWO7
         T+HprvJRlE6oCjvzwuDadiDgImMwgpEWAZg4+aBUyebYAgngxIjlexgaYxHzdpaJAIAD
         I3WLaQnZZttJrNGCp2YSTIy7eHz/8p1CJHHqnYB7r+Ig8gKVA9gNr1GowuRrevNKYEkj
         koXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a05622a190600b0042a67eca0f8si10396093qtc.169.2024.01.30.07.57.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 07:57:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUqUF-0000yq-Rz; Tue, 30 Jan 2024 10:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUqUE-0000xh-TA
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 10:57:22 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUqU9-0004gm-3F
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 10:57:21 -0500
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-dmGTbhDxPC2mzpJpAkWsTg-1; Tue, 30 Jan 2024 10:57:02 -0500
X-MC-Unique: dmGTbhDxPC2mzpJpAkWsTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D469385A58B;
 Tue, 30 Jan 2024 15:57:01 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4FE5492BE2;
 Tue, 30 Jan 2024 15:56:59 +0000 (UTC)
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
Subject: [PATCH 2/3] hw/loongarch: Add `\n` to hint message
Date: Tue, 30 Jan 2024 16:56:52 +0100
Message-ID: <20240130155653.142283-3-groug@kaod.org>
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
X-TUID: 4JFHEBGDc+zT

error_fprintf() doesn't add newlines.

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

