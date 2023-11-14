Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2410933ejc;
        Tue, 14 Nov 2023 16:02:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuW4/6Is6CYveXs1AhoUfVZ8GV5nHaoWwq8L/GdMbwv95utqdGDa9tkxjgNq6FnMJ+oUxx
X-Received: by 2002:a05:6870:d0c6:b0:1e9:e605:27a2 with SMTP id k6-20020a056870d0c600b001e9e60527a2mr14438634oaa.40.1700006541351;
        Tue, 14 Nov 2023 16:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006541; cv=none;
        d=google.com; s=arc-20160816;
        b=SuNaIKJ6gibuxCF4vCpqiifzgRCiUVnY4bXklTbG2vH3Y2CRR7gUi2qk99QUCyaOkf
         fgDbKJf+OgWNJOHXaZp4f70oU8+1QOW+2seDZ3lspFsROsc0ZkhGaqFWeyTVc8uAe1cy
         kRuYmmzOdHiUeHmGYC/h+SHSD4gmZH3rCgBKoAgXTiyYztkJmIJl+kiIEGdL249JFtFP
         eI9r9rU2i6ny/t/MbyVq2h0lHqE+MXZCNwfe8SDaS0vv45W+wt+wMmpHOWK9V/cL3gZU
         md2MDzLEP8jKI/AkiNTX5gbZvwFDAaSr/20U5Ch3g+YIbU59FNc8taPrfVbL6OTB0Ea/
         H3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wUkDl7u9899MYESb13PAFS29ws9vFs4bZMIq95JlN7c=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=nCnFU+Sy/qZGa3tIlGF9JsmykLu446KBfInf/bB2OQawk+fe2EGno4cwhONiWUGn3v
         PSQU8oYnoUwxitIgSgoE2k/N7wYv+SP6ix/4XNx28Y40yKHnL7+Mef224/ZGv7VjdN/5
         793LchRe+x0OV6Lk8SSmpPkVnx6VKOxEj+b2L9bwUHdjQ7ER7ocCEJntaSTWmKQbsRdI
         6k54ZUmjdFNYoCY4HRHrwVd51oYhTqa1EaV+S06IDU9jXF0SNr47VntJ/E+5SQ11+xhw
         TwnqB0FqwgvJSrsPzJLUbZ2MRWb9f158yT050m10kqZzHQH5TCxMgdQosyZ6vYxU1s22
         CH8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DhElUsPG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25-20020ab02759000000b0079b2be7768bsi1159483uap.3.2023.11.14.16.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DhElUsPG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33L0-0006eR-E1; Tue, 14 Nov 2023 19:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Ky-0006VL-Lw
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Kw-000894-UI
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUkDl7u9899MYESb13PAFS29ws9vFs4bZMIq95JlN7c=;
 b=DhElUsPGQNjpzu4pADjL+Mh2ty2cpg67ju0Gz/+1WQz3VZuuamevSqpju40NPYXbl9lLjB
 WoMQkKCfIYpJRU7X04hysShQbgW57cGz+ewVMHii+HMxS78wAAX5q5OutzEIDOfq4VTTTv
 AXalmYMm457s4ybkt+j2r0CFEiJboUM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-6ltCtMh2OmmI-a8RYMiZiw-1; Tue, 14 Nov 2023 19:00:50 -0500
X-MC-Unique: 6ltCtMh2OmmI-a8RYMiZiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94747101A590;
 Wed, 15 Nov 2023 00:00:48 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 712ADC15885;
 Wed, 15 Nov 2023 00:00:35 +0000 (UTC)
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
Subject: [PATCH v5 17/31] target/riscv: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:14 +1000
Message-ID: <20231114235628.534334-18-gshan@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: wyHk/cNC92v5

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-riscv64 -cpu ?
any
max
rv64
shakti-c
sifive-e51
sifive-u54
thead-c906
veyron-v1
x-rv128

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-riscv64 -cpu ?
Available CPUs:
  any
  max
  rv64
  shakti-c
  sifive-e51
  sifive-u54
  thead-c906
  veyron-v1
  x-rv128

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/riscv/cpu.c | 29 -----------------------------
 target/riscv/cpu.h |  2 --
 2 files changed, 31 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 523e9a16ea..22d7422c89 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1733,35 +1733,6 @@ char *riscv_isa_string(RISCVCPU *cpu)
     return isa_str;
 }
 
-static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    return strcmp(name_a, name_b);
-}
-
-static void riscv_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX);
-
-    qemu_printf("%.*s\n", len, typename);
-}
-
-void riscv_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_RISCV_CPU, false);
-    list = g_slist_sort(list, riscv_cpu_list_compare);
-    g_slist_foreach(list, riscv_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_CPU(type_name, initfn)      \
     {                                      \
         .name = type_name,                 \
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf58b0f0b5..965a44c853 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -490,9 +490,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
-void riscv_cpu_list(void);
 
-#define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0

