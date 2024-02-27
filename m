Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2757153ejf;
        Tue, 27 Feb 2024 07:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRdBAKYNarKjkZ0VQ7BsRZZ9gFFdbdB36KIDV4iHmKljU8wua4/UYPDlQzN2oWWllNrn7lSblR4TiOA73cBZyGsjlxL3UB
X-Google-Smtp-Source: AGHT+IEBFchiT5ri/uNTjFL6TCs3bqxj/lxE+F08Dgefl/+T3GZ6jj4vGrEsWg06BfEceixB3r0O
X-Received: by 2002:a05:622a:24f:b0:42e:752f:dcd3 with SMTP id c15-20020a05622a024f00b0042e752fdcd3mr10300221qtx.68.1709049126535;
        Tue, 27 Feb 2024 07:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709049126; cv=none;
        d=google.com; s=arc-20160816;
        b=b+n+sPtpNEPpG08L8VKmfSmmLEUDBQ6DgyRfJqFQr236pk47pBXGMY+5fJ9G7LIZow
         KAxGahdq0J0p7CECmFrDP/kPQFrF044ShL3k6KxsvjMAqlEulDtZ5J+wnFpngueAm9XR
         yGG2PQU09La/yzpoHRST001IjtFarXY0nXHmxhQlvLVLHiw6kKRbQJwaLeqmZ39M0DsS
         WovuIPtWX8ynekJzOmbCYF92wg51GRPKdB0PciKSgEKjEZ/kgxVDIFAIhKwyF4rghUwx
         KQrlibLt6vBmuMR3zKkj4EBM0QqMxIltEcIX+kJ0q/Yj/QKPHZn5PVzMisip9mnc+eCl
         3GKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YdFCQpI/zyd4i+jWwsxFfa/qS/Jzj2e8gGQfjKg8Aj8=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=ylOJeg+1TZlmh85Kp09PHwgaNsb+ZmkZaE9Uxs3G/u9ddzZQ7mKWhtB7A9dnsY3vcj
         hmEjoGS+OHwECn7KZ3CEZ0vMiMk21Rk1aE8UxdAsqHz7X5pIBt5Nn2TxcZACT1wU147Z
         4RNcwdcPXO1thNo+h+xrKYrT4Js2Zu4VTIEz756sTOyFjxJPa0EDEsG9ZpNHjb3IO7+y
         iFBtodADqQN+dd/5vQgfyXea+aGCZx6sdZRpgcJ6jcjUcslU4bUUJaCyesA5I641lHTU
         bkn+NAKjApxgi3i8kCGVptOU/It8xvub0VDkdC8JabDN+wgXxRm86WKFZ4EglpOJ8N26
         69mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RSn2aRcj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs13-20020a05620a470d00b00787d51b2f3csi4860566qkb.605.2024.02.27.07.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RSn2aRcj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezhM-0005zd-Po; Tue, 27 Feb 2024 10:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhG-0005oZ-HS
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhE-0008Us-0Q
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdFCQpI/zyd4i+jWwsxFfa/qS/Jzj2e8gGQfjKg8Aj8=;
 b=RSn2aRcjBi9yfmID3SmFXU9oUryjhPJwtoglfTlA6w67R0UbQf0CM2NzprZJKW9hiB9P16
 iy5ZnPj4HN8p1ncV3v05sQoatS9gPq7G7jMiOeVyf0rmZkPV4D1GhFziqvols7cfINZDWe
 yduV2IJmHhOncXxiVpoej5AASJjIr6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-zIVR7mtxPlGvhkyWvg493w-1; Tue, 27 Feb 2024 10:48:35 -0500
X-MC-Unique: zIVR7mtxPlGvhkyWvg493w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E17084ACA6;
 Tue, 27 Feb 2024 15:48:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9FAF2166AE2;
 Tue, 27 Feb 2024 15:48:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 14/19] smbios: in case of entry point is 'auto' try to build
 v2 tables 1st
Date: Tue, 27 Feb 2024 16:47:44 +0100
Message-Id: <20240227154749.1818189-15-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
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
X-TUID: O8oTjqnukvZl

QEMU for some time now uses SMBIOS 3.0 for PC/Q35 machines by
default, however Windows has a bug in locating SMBIOS 3.0
entrypoint and fails to find tables when booted on SeaBIOS
(on UEFI SMBIOS 3.0 tables work fine since firmware hands
over tables in another way)

Missing SMBIOS tables may lead to some issues for guest
though (worst are: possible reactiveation, inability to
get virtio drivers from 'Windows Update')

It's unclear  at this point if MS will fix the issue on their
side. So instead of it (or rather in addition) this patch
will try to workaround the issue.

aka, use smbios-entry-point-type=auto to make QEMU try
generating conservative SMBIOS 2.0 tables and if that
fails (due to limits/requested configuration) fallback
to SMBIOS 3.0 tables.

With this in place majority of users will use SMBIOS 2.0
tables which work fine with (Windows + legacy BIOS).
The configurations that is not to possible to describe
with SMBIOS 2.0 will switch automatically to SMBIOS 3.0
(which will trigger Windows bug but there is nothing
QEMU can do here, so go and aks Microsoft to real fix).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/smbios/smbios.c | 52 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 5a791fd9eb..e54a9f21e6 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -959,7 +959,7 @@ static void smbios_entry_point_setup(SmbiosEntryPointType ep_type)
     }
 }
 
-void smbios_get_tables(MachineState *ms,
+static bool smbios_get_tables_ep(MachineState *ms,
                        SmbiosEntryPointType ep_type,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
@@ -968,6 +968,7 @@ void smbios_get_tables(MachineState *ms,
                        Error **errp)
 {
     unsigned i, dimm_cnt, offset;
+    ERRP_GUARD();
 
     assert(ep_type == SMBIOS_ENTRY_POINT_TYPE_32 ||
            ep_type == SMBIOS_ENTRY_POINT_TYPE_64);
@@ -1052,11 +1053,56 @@ void smbios_get_tables(MachineState *ms,
         abort();
     }
 
-    return;
+    return true;
 err_exit:
     g_free(smbios_tables);
     smbios_tables = NULL;
-    return;
+    return false;
+}
+
+void smbios_get_tables(MachineState *ms,
+                       SmbiosEntryPointType ep_type,
+                       const struct smbios_phys_mem_area *mem_array,
+                       const unsigned int mem_array_size,
+                       uint8_t **tables, size_t *tables_len,
+                       uint8_t **anchor, size_t *anchor_len,
+                       Error **errp)
+{
+    Error *local_err = NULL;
+    bool is_valid;
+    ERRP_GUARD();
+
+    switch (ep_type) {
+    case SMBIOS_ENTRY_POINT_TYPE_AUTO:
+    case SMBIOS_ENTRY_POINT_TYPE_32:
+        is_valid = smbios_get_tables_ep(ms, SMBIOS_ENTRY_POINT_TYPE_32,
+                                        mem_array, mem_array_size,
+                                        tables, tables_len,
+                                        anchor, anchor_len,
+                                        &local_err);
+        if (is_valid || ep_type != SMBIOS_ENTRY_POINT_TYPE_AUTO) {
+            break;
+        }
+        /*
+         * fall through in case AUTO endpoint is selected and
+         * SMBIOS 2.x tables can't be generated, to try if SMBIOS 3.x
+         * tables would work
+         */
+    case SMBIOS_ENTRY_POINT_TYPE_64:
+        error_free(local_err);
+        local_err = NULL;
+        is_valid = smbios_get_tables_ep(ms, SMBIOS_ENTRY_POINT_TYPE_64,
+                                        mem_array, mem_array_size,
+                                        tables, tables_len,
+                                        anchor, anchor_len,
+                                        &local_err);
+        break;
+    default:
+        abort();
+    }
+    if (!is_valid) {
+        error_propagate(errp, local_err);
+    }
 }
 
 static void save_opt(const char **dest, QemuOpts *opts, const char *name)
-- 
2.39.3

