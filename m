Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2409551ejc;
        Tue, 14 Nov 2023 16:00:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7NSno6MNZKIW/RGnND6TPTFTdgtaXgA2xqTXYOFQpHbndb2CvCS3DBPgvDtlNIJrW6/Ln
X-Received: by 2002:a05:6122:a04:b0:495:dcd2:d12a with SMTP id 4-20020a0561220a0400b00495dcd2d12amr12504584vkn.9.1700006436972;
        Tue, 14 Nov 2023 16:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006436; cv=none;
        d=google.com; s=arc-20160816;
        b=XOKAtR+mcZUFecu+7FC/oL5WzpC1vQo0mAfkHBzetHiDC4XVJOxKhGdVYsHAa6yin7
         ES7J4Gvbdb981AKiM/9IFe/mhTaKbHpiUlDPyYfLnDJJHHDd+V59YCSvAGRLsrx+znmX
         hlIg0ehVsfXYpqG4cegbw0b+f6Zt8/NjanaD86tss4VxcJfKf9lb3r5jd7+tO7jbl3q3
         j/oeV1PUQVhWXbLZmNC8LHsMkOgWxgZ+tHqpsqKaFOo8reHceRrgbgsxdX63469sBkKI
         1vRe3s1VwkKE8lQAyaFB8LrxWz6ZD4ya2/g04E0N1yY2/zLoytb9o1F7NmbTpmG1aIkm
         fBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dowXEbxRYz1Q0DKrKKPR8Z2iM+IdXPYjRRofPZFQ/Fk=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=KlP70uZeu9/E0of9z1M8ZOd7zw0Y5fdnx4+WFmDm0UBAM9lryTfuXZbVxGRUUHf7s5
         /CfnsHdKaEA/hNdgTke5pQ9SjvdHrXK9Hnk8uXUkqUIoruerDnRv1U5886yMyVygEn+c
         Opu8uFEBYBAYvsIBskcJK53VLr/KtnZvNfBsX/DsHDlTYbe9Uw3f7JkfLC0A7ka8BsCe
         aNYXIhQFnh72QnMXUelr9HImS9gGBgLpZxKBBdc0tTeymfqkOXxnUuv6yfbJ7s6uCR1b
         ViFENyes58eY19Fj09EzCFIsUuMrPolfiCTYXpaI7EF9I718DoOV8a7H40vVR9ow3u7l
         FMHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiokXXbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a056122080800b0048f81bbd188si1261866vkj.74.2023.11.14.16.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiokXXbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33Ka-0005Iy-JK; Tue, 14 Nov 2023 19:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Jx-0004Ww-BL
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Ju-0007Xr-Md
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dowXEbxRYz1Q0DKrKKPR8Z2iM+IdXPYjRRofPZFQ/Fk=;
 b=QiokXXbtMOMu5JxmTkbu2PwS5yJ+mdtV3kOkcKCGR//rpiMjxo9lq96kRQMYvViXVAWVXM
 6XdsAfQF52344SdcAjmPLqxWOnRFB8CEsYtxPoZ5KaGiRQqZr04teEwBRrCst6YfodmsXd
 bYKSDfN0b/acD6G2hzq7MEm8bteCMPs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-Kh9Ez054PYKX7W8bT0UWAg-1; Tue,
 14 Nov 2023 18:59:44 -0500
X-MC-Unique: Kh9Ez054PYKX7W8bT0UWAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9804D3C000A4;
 Tue, 14 Nov 2023 23:59:42 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7370AC15885;
 Tue, 14 Nov 2023 23:59:29 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 12/31] target/hppa: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:09 +1000
Message-ID: <20231114235628.534334-13-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: n+qkLkGQVrkR

No changes in the output from the following command.

[gshan@gshan q]$ ./build/qemu-system-hppa -cpu ?
Available CPUs:
  hppa
  hppa64

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/hppa/cpu.c | 24 ------------------------
 target/hppa/cpu.h |  3 ---
 2 files changed, 27 deletions(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 1a5fb6c65b..e1f252cc45 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -164,30 +164,6 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(typename);
 }
 
-static void hppa_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CPUClass *cc = CPU_CLASS(oc);
-    const char *tname = object_class_get_name(oc);
-    g_autofree char *name = g_strndup(tname, strchr(tname, '-') - tname);
-
-    if (cc->deprecation_note) {
-        qemu_printf("  %s (deprecated)\n", name);
-    } else {
-        qemu_printf("  %s\n", name);
-    }
-}
-
-void hppa_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_HPPA_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, hppa_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index bcfed04f7c..5d3fcdc927 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -402,7 +402,4 @@ G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra);
 
 #define CPU_RESOLVING_TYPE TYPE_HPPA_CPU
 
-#define cpu_list hppa_cpu_list
-void hppa_cpu_list(void);
-
 #endif /* HPPA_CPU_H */
-- 
2.41.0

