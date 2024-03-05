Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp374094ejc;
        Tue, 5 Mar 2024 07:58:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWatdOWXl7x6u9hiRp8ww3XzL1FSMJJQSYhTlQjftr9DE4Su7reHUdaYw2IWmkMLPooAYOu0vcLZ7I/6KhApByUGomcQ/ig
X-Google-Smtp-Source: AGHT+IFIm1n+b3Hd4eWr2FL8NlqNGeHF2CbaNmq8G9Cm5yWQ8XsTn8GnKuijpSoddMeKLRPEffTY
X-Received: by 2002:a05:620a:4088:b0:788:33fb:4e14 with SMTP id f8-20020a05620a408800b0078833fb4e14mr2966365qko.12.1709654330241;
        Tue, 05 Mar 2024 07:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654330; cv=none;
        d=google.com; s=arc-20160816;
        b=qYXZc5+rH2oJcsyd9ihGeHvKoDJ38TsUCWqg1PRXTYgGlSpRBNogfSBD//55ju/0JP
         D9OL2vB9zGF+K/yuoLvOinE/02vzpDYiVrX8PmwIOLcvxV/fpLfoDedIvuCmsaFerYlr
         59nHinrxvoE78qH5LQNAFAxF2dwDwAt6oAWGh+xt64PnbyuA/r9nOj16JSO+xxd4C9tC
         3zRtK8j5pvZ0uEVF3Asaeo1QocLVzbZ6FytKRRmzE7enWfZPo2j6KklsM1owTs2aEPui
         7iCbGG+NEJScN1lVAIGKl2lp6tcvIr4192ACkzAUFp/lH66eQ0wxFbYImjkgoNzH9NYF
         xT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZPxefcrUSoOBOHuk1sFV5x9qKOwla4dnMHg+sDmbLZE=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=xayHiiGichsHGAzeCNHnk0CSTBwZCr+oqtpoNYqHK9TdtqIGLU/0ycTPSd2/XJRgbc
         Oi02meZanEIvE4KMxM9s6tWGYVOyTqBmLU8KkVQRe3N8gzSeSGQzx2Gs5taETmF3PTgq
         YMap/8ir3B2XNpxBXnGRK35r9u9dgXcHFUQCE3HPnyaz0XluMVnUpdBa95AitG8v8tl7
         QrVWLP+W5d/u8JX19QuCXz7Pg7mjb5FdLU0v+Dd0ZFLdKVxw2c1WoeRYAa6geJOzfSwK
         4erUd9vw94AI2vUTdUW2lla9JxhSfdnKv6I7LZryoZtD2MbTnCL54aK9PV/W8KX8ZzKD
         D23Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOSJwsbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz14-20020a05620a2b8e00b0078831797408si3476284qkb.647.2024.03.05.07.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:58:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOSJwsbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhXBY-000662-2L; Tue, 05 Mar 2024 10:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXB6-0005dd-DY
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:58:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXB5-0000YN-2l
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPxefcrUSoOBOHuk1sFV5x9qKOwla4dnMHg+sDmbLZE=;
 b=bOSJwsbtPh80NrcnJpK0+VvPBxFY1Y+moRRSj5xf/94z5UbOb45xWZaEKd8FcnTaj6frLS
 pPAo0Va8oucre9Smze/cbs/W/mpVnvgFaVvItVcdYULN3eX1p+Kmzk+uoE5mUIr1P/A0uy
 lnpJc7R6DsNYOhbyXJhE0irjiVVicOk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-XDlEVkooNNOMW4UBYOWFBA-1; Tue, 05 Mar 2024 10:57:58 -0500
X-MC-Unique: XDlEVkooNNOMW4UBYOWFBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CA0B8164E4;
 Tue,  5 Mar 2024 15:57:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF24417A99;
 Tue,  5 Mar 2024 15:57:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 09/20] smbios: add smbios_add_usr_blob_size() helper
Date: Tue,  5 Mar 2024 16:57:13 +0100
Message-Id: <20240305155724.2047069-10-imammedo@redhat.com>
In-Reply-To: <20240305155724.2047069-1-imammedo@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lhPbtdNs1lp5

it will be used by follow up patch when legacy handling
is moved out into a separate file.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/smbios/smbios.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 97cf762228..01180bd82c 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1287,6 +1287,14 @@ static bool save_opt_list(size_t *ndest, char ***dest, QemuOpts *opts,
     return true;
 }
 
+static void smbios_add_usr_blob_size(size_t size)
+{
+    if (!usr_blobs_sizes) {
+        usr_blobs_sizes = g_array_new(false, false, sizeof(size_t));
+    }
+    g_array_append_val(usr_blobs_sizes, size);
+}
+
 void smbios_entry_add(QemuOpts *opts, Error **errp)
 {
     const char *val;
@@ -1334,10 +1342,12 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             smbios_type4_count++;
         }
 
-        if (!usr_blobs_sizes) {
-            usr_blobs_sizes = g_array_new(false, false, sizeof(size_t));
-        }
-        g_array_append_val(usr_blobs_sizes, size);
+        /*
+         * preserve blob size for legacy mode so it could build its
+         * blobs flavor from 'usr_blobs'
+         */
+        smbios_add_usr_blob_size(size);
+
         usr_blobs_len += size;
         if (size > usr_table_max) {
             usr_table_max = size;
-- 
2.39.3

