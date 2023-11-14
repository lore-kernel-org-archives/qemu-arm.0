Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2408950ejc;
        Tue, 14 Nov 2023 15:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkwhS74C5v014UcX/MIgS63IfR3r3GiAcGtYu3si6cHlxGUFEWtvnaavDTmZh2a4ExxVwn
X-Received: by 2002:a05:620a:4894:b0:773:a809:f059 with SMTP id ea20-20020a05620a489400b00773a809f059mr4282001qkb.17.1700006382357;
        Tue, 14 Nov 2023 15:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006382; cv=none;
        d=google.com; s=arc-20160816;
        b=r+gC28N6WrH4gCB3zOTxNDUfKu84xJb9V2lDv3ieFXcunrsdhpYNJ4K3lvaAT05RAj
         1hvooAX1dz+4R/A7O9jD8V0cbKozBzivpslS6xzfoGcPUbWbWHqJ2GPuF5U3wqvIkRrT
         ajlA2W1FSI4MFOO4SbQcBN96TtqbPpeYmjBWcgRbfBLS7TIw5T3d6rKW2DNhme/3BoJa
         ZxOVC045+s8olex8w62lACrZwQLVxXtzSArr4G30dwX+NdY4A39+rp3oXJlUa7lSufDP
         jJ/0GGHl4jpFDOvNO0l3UmPMiO4R7Dhq9lRv0MyHnJf6IOTQ0HOlS4KvNgTiKndP6JIh
         QmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3TBvsx7B0k8hJV8+QCGoTyQ5MyH0KUDha/Z0IxzUuS4=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=PuUy4n9nuYRYgGeAsRvcWr7NHSn3bUSlr/Ak81aUYRSaCnCPN+/bZkL43ttj9omUf+
         /Wo36zg9THigBVt/hfxJEFnZqUk8soZ1kk9KIELzkPoAToTCkNG2w++EfdMt+XojAvmt
         q70ZSDVdPsSDBoAIftADi/qCnget/6Vn9FePDCpBE4+9Plo5Q3W1ShX3R/hetRGhRauZ
         HS2VdyNNvClQF453BsFihJjkTr2v/nynpPldkc2YB/1puUspLGWVyI5z9OpTWgJg27XO
         Q5Y+i39lv4CMoPUpxSpwAJMq3CdQHxVCfqU7xhc05XGVMifma1btyGkLiNg28lc9vsoi
         NKAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="II/n+uyq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a05620a112f00b00775cadf4e5csi7781793qkk.214.2023.11.14.15.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 15:59:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="II/n+uyq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33Jb-0003B9-4a; Tue, 14 Nov 2023 18:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JY-0002oR-CS
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JT-0007Gs-Qh
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TBvsx7B0k8hJV8+QCGoTyQ5MyH0KUDha/Z0IxzUuS4=;
 b=II/n+uyq9pE71tVUa9ppYbWLj8hjMpDa9s1/s6O+pU3geUaG4NpDyfRlvxr8xPLnPJq2F+
 lluCwfqooaWX0/S/OYO8QSWL5bRvrtHzyOTZKTciuvj/OG3zqR9bOSPf5W6Cll95kXiM9i
 Ep/OqWWS6evaqE7/dHmbWqfMJMjkU2A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-lEk7sJlNMvmFlhhYJRQI6Q-1; Tue,
 14 Nov 2023 18:59:18 -0500
X-MC-Unique: lEk7sJlNMvmFlhhYJRQI6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 230A51C18CC5;
 Tue, 14 Nov 2023 23:59:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FDF6C15885;
 Tue, 14 Nov 2023 23:59:03 +0000 (UTC)
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
Subject: [PATCH v5 10/31] target/cris: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:07 +1000
Message-ID: <20231114235628.534334-11-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: KDkxI95Zr9O9

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv8
  crisv9
  crisv10
  crisv11
  crisv17
  crisv32

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv10
  crisv11
  crisv17
  crisv32
  crisv8
  crisv9

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/cris/cpu.c | 38 --------------------------------------
 target/cris/cpu.h |  3 ---
 2 files changed, 41 deletions(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a5083a0077..9ba08e8b0c 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -99,44 +99,6 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-/* Sort alphabetically by VR. */
-static gint cris_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    CRISCPUClass *ccc_a = CRIS_CPU_CLASS(a);
-    CRISCPUClass *ccc_b = CRIS_CPU_CLASS(b);
-
-    /*  */
-    if (ccc_a->vr > ccc_b->vr) {
-        return 1;
-    } else if (ccc_a->vr < ccc_b->vr) {
-        return -1;
-    } else {
-        return 0;
-    }
-}
-
-static void cris_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename = object_class_get_name(oc);
-    char *name;
-
-    name = g_strndup(typename, strlen(typename) - strlen(CRIS_CPU_TYPE_SUFFIX));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cris_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_CRIS_CPU, false);
-    list = g_slist_sort(list, cris_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, cris_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 1be7f90319..d830dcac5b 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -287,7 +287,4 @@ static inline void cpu_get_tb_cpu_state(CPUCRISState *env, vaddr *pc,
 				     | X_FLAG | PFIX_FLAG));
 }
 
-#define cpu_list cris_cpu_list
-void cris_cpu_list(void);
-
 #endif
-- 
2.41.0

