Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2409748ejc;
        Tue, 14 Nov 2023 16:00:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnoiW0XfWSPkQnDjo3woiL9SJabbnEEGid7ZET2QCq09O5nZ9gw3424wZ4jjT3rSfjmaL/
X-Received: by 2002:a05:6122:220e:b0:4ab:f1f8:3171 with SMTP id bb14-20020a056122220e00b004abf1f83171mr10842468vkb.6.1700006452439;
        Tue, 14 Nov 2023 16:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006452; cv=none;
        d=google.com; s=arc-20160816;
        b=QrG1ztN13Uz4yxcwqmlsyfR3cHJldC2ryZ98FG+9k3u/TmWhG/oG52VjNNZfzMcZ6a
         tcxB8GJJue05Vy5myPxmZwZBPyFcoCSxmZvoL9zLebJVCy2OhqZOnLTxq4oafz+ksL7T
         vCpGHbyMA7hB/A1XJdek3vy44Bd2AQTN/+aIhbeHr1nOnkUimGuW65nTwWXzBKCYfaPx
         fP6OezuqL86YC5jCXVRpsw+YaT18VFpad+ws1YskJRQWZvjbyR7U8FbswR6hsvuVvqVN
         V9RDYQitpI4Pt+ccVXLRCaiA9J9+cG5zcgolqWHm835azk9KJK2wkHXYnvZLo2nGStYx
         Z7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q4eTiLCEOv9w25aK8fnhBq4hC/5pssEztOwbkb9SzsE=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=WorsqYURDHp8QIx7KS7HMjwPxTFg+xWEhDDtAcB14UcAoVaP4ix5XfQxozFcwLQ+Wm
         KE7f9cb4lvjdCzx4OxerJoP5XGU43qW1t3dmFmqUrO2vEMN/WW6fBPz5cVGwKS7V7tHP
         8tACHvoDOxJcmo3u+8I4hTvmHMC3jmn0fYnazhzAgqVqicItDGiR2mH7aISCuxBXDwbr
         ozrukXYjbIJtnIzTFKFRv86K3zfFItV3HL0fiIC/EVhMfi38w6eNlzEz1VVEAVSx4/t2
         OPhLo7Woz3MEYdeQgjVDRER+2sGjV09Jt73tNzn0F9LWEF1SrcPrs1yDXo4XU5qe7YZp
         KSwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZV2+gIMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a1f7305000000b0048ff382caddsi1356352vkc.266.2023.11.14.16.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:00:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZV2+gIMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33Kr-000671-Qo; Tue, 14 Nov 2023 19:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Kq-00066k-Vm
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Kn-00086P-T1
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4eTiLCEOv9w25aK8fnhBq4hC/5pssEztOwbkb9SzsE=;
 b=ZV2+gIMweHeKxHqxABIKVG3hHL/qUllNZnTPow3jY7rug5OINy0eUcO+SkMlEe/hQGE9Ug
 Ux45Drc5pdaWD4kbfsuiENbOEYBXA1uSVYhb4QzhR8PDfTE0AJTxg8FOE0JfOvKxkvuavI
 t+7EY0HWzTn23enFGYwO6G++ABV0zCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-xnut3d3kP0ykENvqyO8VKw-1; Tue, 14 Nov 2023 19:00:37 -0500
X-MC-Unique: xnut3d3kP0ykENvqyO8VKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDD8184AEE0;
 Wed, 15 Nov 2023 00:00:34 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73AE1C15885;
 Wed, 15 Nov 2023 00:00:22 +0000 (UTC)
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
Subject: [PATCH v5 16/31] target/openrisc: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:13 +1000
Message-ID: <20231114235628.534334-17-gshan@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xEK59IC75qQI

Before it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  or1200
  any

After it's applied:

[gshan@gshan q]$ ./build/qemu-or1k -cpu ?
Available CPUs:
  any
  or1200

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/openrisc/cpu.c | 42 ------------------------------------------
 target/openrisc/cpu.h |  3 ---
 2 files changed, 45 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index f7d53c592a..381ebe00d3 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -253,48 +253,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops = &openrisc_tcg_ops;
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint openrisc_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_OPENRISC_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void openrisc_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename,
-                     strlen(typename) - strlen("-" TYPE_OPENRISC_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cpu_openrisc_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_OPENRISC_CPU, false);
-    list = g_slist_sort(list, openrisc_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, openrisc_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_OPENRISC_CPU_TYPE(cpu_model, initfn) \
     {                                               \
         .parent = TYPE_OPENRISC_CPU,                \
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index dedeb89f8e..b454014ddd 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -299,15 +299,12 @@ struct ArchCPU {
     CPUOpenRISCState env;
 };
 
-void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
 int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 
-#define cpu_list cpu_openrisc_list
-
 #ifndef CONFIG_USER_ONLY
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
-- 
2.41.0

