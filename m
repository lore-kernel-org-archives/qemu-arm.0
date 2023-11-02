Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp61464eja;
        Wed, 1 Nov 2023 17:30:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEreXuIjv4muEYc3mjP0/oQpKfdyEY+vR+p6scjxog827MPy5l3bybCy4zF/kCL4QDxcXkY
X-Received: by 2002:a05:6808:2994:b0:3ae:251f:923f with SMTP id ex20-20020a056808299400b003ae251f923fmr16123011oib.28.1698885039906;
        Wed, 01 Nov 2023 17:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885039; cv=none;
        d=google.com; s=arc-20160816;
        b=ucdLPJC24AQ7ENgqpZnaPRTpl6Px/owknPZCrBj44j/GezEthvHXy0Dkc1/soKQuo6
         aCnXbuPBai8v3penqs4I+fiuTII/PJw/pm0d5iEPNiNLLQ5stPkczOahEmlvq9r5aky9
         OEluWVUl+QgIhRGVGa3lmyImJDV6ZcaLKNTPKTOts8wBP/wV5SnXoG4LlpvgBDCx3VlY
         HzShyI/dK+z6qn5flbGM15IoL9qkGSJNxYu1zLEza6tYsn+6Q5xJ0Qj1VUs8+x3LKI79
         NJBXrnqBg1EtKXHeyoHD/SuZ2zqExiRQk1WFlMgHEoXpjnxnU+UAoCHMN4tcdX6TH18l
         QVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CWuM8KoXEbBiZd6goD7A83eMe3YIM2InEy9tKhZ47iA=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=1LbKYokmd2JxANI8AntCKK+IJRoyaQTF/5hQsZ2eqKizyph6M/frhpUQ3wmfpfY///
         Y4Rl6qIMA4CVFFXyH0jVFhZ3NDwMm1GlM8qWnOTTB5nYAJNkC2/nItxWqogtrnQjuPUm
         10OtQCZMOmy5TLDQO70CiWP38Bbn1ws48Lp7sNWFaHZbSoEtC5wTeEOq4fz6aWJ9fb/5
         sxeFPDNbiFK4R39jPFASo48ZqmZUgN1RtzMDKffaHy5ZVwESlqduqiej6YyPdPfPsRTM
         tFkQxxqpF4QFhSgNHyPSIb51zxmnkk4LtWe0uWnDgSzVWRBEkykkr9Nr4UFmID92NFsv
         Rutw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6N2Wgns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe16-20020a056214495000b0066d11e05b4asi3570281qvb.282.2023.11.01.17.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6N2Wgns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLaC-0004vm-NQ; Wed, 01 Nov 2023 20:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZg-0003w7-Se
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZf-0000u3-85
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWuM8KoXEbBiZd6goD7A83eMe3YIM2InEy9tKhZ47iA=;
 b=c6N2WgnsDsZEZsWf/JWhwFKCCj1ptQTE1LblVnuxP8IzxMs+bJiRDQCXNPfpBAQCEs8b16
 Uco4BPWjGNfy6xJqsAhlRki0+ySFdXcq3/D2v15hLwYEAcy2PCAf22+OvJHKLPKB7CeaLL
 jlfLTdK4Eppc6dY3ExHJS/seMdiVKvM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-dsoQOapfPiSZUEN68-Lntw-1; Wed,
 01 Nov 2023 20:28:35 -0400
X-MC-Unique: dsoQOapfPiSZUEN68-Lntw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 010B21C05AA4;
 Thu,  2 Nov 2023 00:28:31 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C39BFC1290F;
 Thu,  2 Nov 2023 00:28:16 +0000 (UTC)
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
Subject: [PATCH v4 11/33] target/loongarch: Use generic helper to show CPU
 model names
Date: Thu,  2 Nov 2023 10:24:38 +1000
Message-ID: <20231102002500.1750692-12-gshan@redhat.com>
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
X-TUID: SOJfwUNwz0d+

For target/loongarch, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/loongarch/cpu.c                | 5 ++++-
 target/loongarch/loongarch-qmp-cmds.c | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index c6712e13f9..8c6b6f47ed 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -477,14 +477,17 @@ static void loongarch_la132_initfn(Object *obj)
 static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
 {
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("%s\n", typename);
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void loongarch_cpu_list(void)
 {
     GSList *list;
     list = object_class_get_list_sorted(TYPE_LOONGARCH_CPU, false);
+    qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, loongarch_cpu_list_entry, NULL);
     g_slist_free(list);
 }
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
index 6c25957881..815ceaf0ea 100644
--- a/target/loongarch/loongarch-qmp-cmds.c
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -17,8 +17,7 @@ static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
     CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
     const char *typename = object_class_get_name(oc);
 
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
-- 
2.41.0

