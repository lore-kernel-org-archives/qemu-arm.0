Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp374212ejc;
        Tue, 5 Mar 2024 07:59:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6alDasVMy4Y7y8/gGWFspixSSRLMGWqIsuizzfiT+ptb9bzHqugOADYpzfenDxj9vd23++oLP3WLaq3R34/kJj8v01rLB
X-Google-Smtp-Source: AGHT+IFNlEV5Cx8UEm6NNjbYAp1Cj/NAybnUpRV3DxMVfUEmReb8+6ROOMGPEzuBfJtP6Redl0Jm
X-Received: by 2002:ac8:5d49:0:b0:42e:f3d5:a5a3 with SMTP id g9-20020ac85d49000000b0042ef3d5a5a3mr3494144qtx.28.1709654344180;
        Tue, 05 Mar 2024 07:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654344; cv=none;
        d=google.com; s=arc-20160816;
        b=LewczMicKYN3eRpe80jAo5WZjT+7OhBFxxteQ2OOPhWwbR8oy97UQzolY/bB+hOE2+
         PbUanNOkT1cNn757J+nyrYsJtjXyFkLV9pOk7w1lpEftNHgrr0OygJaG37zZryvQrfI1
         /Wu/9hAaJWkwG+x/LGBLAJ6HpYgGCoN6KZIfZCE0FmOwcQEPVU0OopEJFRaKTSj0WanI
         h/0qQbQezE/zIIVCdqTo9nw6xZZ/HecNa9zyUjac6hMEdviQwaQF7HK7ylnRvXPdhkoF
         CTZvsQNg4qlN5yC9K0K7tmfHn5LnF2KOpnBfEhmExcHEAoLxUuyClaR6mCoaDhQ+e89e
         oY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I8IUHpNhmsIeHkIzKrJMYxsXS41jmrYxg7yejlym3lk=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=qqvIvyXvOiixM4oB77Ka1JqlASqP7etu8cynlaZSm5vY8rT9oDr2ZD9ja3nxRnu/XP
         fkUueAAmNlgiedJJ5NCEc/wDUfZVk6ZeKr5nfJnJw1IGhoZ7uwXToKRSDrApgYHcBccU
         8jivRT3Z5BoTPnL5VZw2uhNig4IkEOZE6LR3ff9szaUB0YRxVe9/2FVFqeMBIIBJ0RfG
         KZTTX80JwDLADmQZouEU85cr3UAr/3dt/x2uSjs5yi8sbX31IfvavQVmTAKUs0Kzr7KX
         lJHiROYtm7l9Ojo8X/NSDPhdtfglVcGejgzX71MJMKoaaotmd0h9aKLYkm4eWlJfyQWl
         Fs/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QGdaVyPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020ac859c5000000b0042eef41e212si5697409qtf.346.2024.03.05.07.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QGdaVyPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhXBk-0007BD-7g; Tue, 05 Mar 2024 10:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBR-00063b-CL
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBN-0000e7-RD
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8IUHpNhmsIeHkIzKrJMYxsXS41jmrYxg7yejlym3lk=;
 b=QGdaVyPs/DHY3Em234V+2O9f+YeOaf9VuV3JInc+koDh9/7nnv+Q2Kk4cg2J5MHV8RcQlE
 maPKL51OKRUMDXc34girYlWrOyTYkT+g6JT1+4TD9PSWBP931UV/EIW50ppAz7HG8APcaJ
 jX3fYtWOmIHW4cD9UIlMpYQT7+6H4Us=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-458-h0ehi7ITOaqQRfxsrQtIXQ-1; Tue,
 05 Mar 2024 10:58:16 -0500
X-MC-Unique: h0ehi7ITOaqQRfxsrQtIXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BA621C05141;
 Tue,  5 Mar 2024 15:58:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1897417A9A;
 Tue,  5 Mar 2024 15:58:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 16/20] smbios: error out when building type 4 table is not
 possible
Date: Tue,  5 Mar 2024 16:57:20 +0100
Message-Id: <20240305155724.2047069-17-imammedo@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hz2y43g32brr

If SMBIOS v2 version is requested but number of cores/threads
are more than it's possible to describe with v2, error out
instead of silently ignoring the fact and filling core/thread
count with bogus values.

This will help caller to decide if it should fallback to
SMBIOSv3 when smbios-entry-point-type='auto'

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
---
 hw/smbios/smbios.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index e54a9f21e6..bf5c7a8885 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -605,7 +605,8 @@ static void smbios_build_type_3_table(void)
 }
 
 static void smbios_build_type_4_table(MachineState *ms, unsigned instance,
-                                      SmbiosEntryPointType ep_type)
+                                      SmbiosEntryPointType ep_type,
+                                      Error **errp)
 {
     char sock_str[128];
     size_t tbl_len = SMBIOS_TYPE_4_LEN_V28;
@@ -659,6 +660,12 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance,
     if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
         t->core_count2 = t->core_enabled2 = cpu_to_le16(cores_per_socket);
         t->thread_count2 = cpu_to_le16(threads_per_socket);
+    } else if (t->core_count == 0xFF || t->thread_count == 0xFF) {
+        error_setg(errp, "SMBIOS 2.0 doesn't support number of processor "
+                         "cores/threads more than 255, use "
+                         "-machine smbios-entry-point-type=64 option to enable "
+                         "SMBIOS 3.0 support");
+        return;
     }
 
     SMBIOS_BUILD_TABLE_POST;
@@ -987,7 +994,10 @@ static bool smbios_get_tables_ep(MachineState *ms,
     assert(ms->smp.sockets >= 1);
 
     for (i = 0; i < ms->smp.sockets; i++) {
-        smbios_build_type_4_table(ms, i, ep_type);
+        smbios_build_type_4_table(ms, i, ep_type, errp);
+        if (*errp) {
+            goto err_exit;
+        }
     }
 
     smbios_build_type_8_table();
-- 
2.39.3

