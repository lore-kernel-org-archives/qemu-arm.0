Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp61372eja;
        Wed, 1 Nov 2023 17:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIYdsL+vn8k/XZ/AcrXPRDjJrzwuiVxRoqWdlPr3sfN3WHUV9DIhKq5vVF1VLQvpuMWyXL
X-Received: by 2002:a05:622a:44f:b0:418:11ee:ad6c with SMTP id o15-20020a05622a044f00b0041811eead6cmr17313763qtx.23.1698885029530;
        Wed, 01 Nov 2023 17:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885029; cv=none;
        d=google.com; s=arc-20160816;
        b=NHNx9XrvR3zcrLVhX+iDdD1kAfO69RNgdCMyJwTgnrhbnfH0gkigWLZlAftH436qpa
         x5vo0l17/JHQvLV6/O+EIOb6q5KmnI4fvp2D6cp1dHAL7QrnLUrFR5WY/MZlxtcSNHRQ
         hTIf3bDNstudrASAngywxpjS6uFY66qiIMbo+/yo07G7k0nsYsH0qyraH+0A+LfSwjfv
         omgvxBvq4yZCCMlVrUrm2kIWfXleJYWsixqmi99W/QakfhEfopycloaIw4s5v1jBVUhu
         R0P/HfJkQgeOZINEiwWYWD7RO2biHEchbtWtVrHlRXrGNKtY6eQUqVCfVrjBNi+F/7Dl
         yTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mUYAWAgEVEr1A2KN57k8VCVL1L41DWZFhQwoZMR9o9o=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=oARJ+ZPA92YuJ6/rAyS3bHeXR+xKHkReliuGEcmr823ksDh2WoSYNAvC3r32ybZFp1
         BYnGJst4pRFDLEQ1aEh2PGMbgOy0mlhSvGkB7VwEYKE8EoUvdMtIOdd2wq2eBEWPHnQD
         8y6Tp3Y+cD9vqqtZg0Ke7rD2aTJfCuvHRytuQaMeQD/Mb78cChpOarS2WatdBT0NRnvI
         8IxCjOjEXJGUV9EGJpfgKvrsdH1o0h3EMl3uoL1Z738Pr5lGIeOH41LzyXnxpMD0hGrJ
         JjQXjv2xYkk4NjPj3rOaVIIL1dnr5g1l4vUtbv5wP4Qg567CGXFTn/ZWmIqJigLr9wMZ
         b75Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJu8eMB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020ac87c46000000b00419738eabfasi3586373qtv.40.2023.11.01.17.30.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJu8eMB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLaS-0005bO-NX; Wed, 01 Nov 2023 20:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLaE-00054S-HJ
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLaC-0000zu-IZ
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUYAWAgEVEr1A2KN57k8VCVL1L41DWZFhQwoZMR9o9o=;
 b=HJu8eMB+ZbSVpN9CdLJd4VGnbvNPyzBUgxXjZSyhXlpaELr/EbBMa1+LONLL8XnNfHUn3v
 lgGs5Y8QCMy/zg7mcZnwrl1O8PtQIh80UxIPSf1MvuiKdHIzZuFdI+xqL9lforqR8Naq+F
 Ra2vzWAM5azpvLS9Su62dp7rgRboPLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-uaTAYfPbM9eDgzS2C9qUeg-1; Wed, 01 Nov 2023 20:29:06 -0400
X-MC-Unique: uaTAYfPbM9eDgzS2C9qUeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02D1A812C27;
 Thu,  2 Nov 2023 00:29:04 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C569FC1290F;
 Thu,  2 Nov 2023 00:28:49 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imammedo@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 shan.gavin@gmail.com
Subject: [PATCH v4 13/33] target/mips: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:40 +1000
Message-ID: <20231102002500.1750692-14-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
X-TUID: kWO39+XcxgmS

For target/mips, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Besides, mips_cpu_list() is reimplemented to dynamically fetch the CPU
model names from the registered CPU types , instead of the staticly
defined array.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/mips/cpu-defs.c.inc         |  9 ---------
 target/mips/cpu.c                  | 18 ++++++++++++++++++
 target/mips/sysemu/mips-qmp-cmds.c |  3 +--
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index c0c389c59a..fbf787d8ce 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -1018,15 +1018,6 @@ const mips_def_t mips_defs[] =
 };
 const int mips_defs_number = ARRAY_SIZE(mips_defs);
 
-void mips_cpu_list(void)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(mips_defs); i++) {
-        qemu_printf("MIPS '%s'\n", mips_defs[i].name);
-    }
-}
-
 static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     int i;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index a0023edd43..131978563b 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -565,6 +565,24 @@ static const struct TCGCPUOps mips_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static void mips_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
+}
+
+void mips_cpu_list(void)
+{
+    GSList *list;
+    list = object_class_get_list_sorted(TYPE_MIPS_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, mips_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
 static void mips_cpu_class_init(ObjectClass *c, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
diff --git a/target/mips/sysemu/mips-qmp-cmds.c b/target/mips/sysemu/mips-qmp-cmds.c
index 6db4626412..7340ac70ba 100644
--- a/target/mips/sysemu/mips-qmp-cmds.c
+++ b/target/mips/sysemu/mips-qmp-cmds.c
@@ -19,8 +19,7 @@ static void mips_cpu_add_definition(gpointer data, gpointer user_data)
 
     typename = object_class_get_name(oc);
     info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_MIPS_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
-- 
2.41.0

