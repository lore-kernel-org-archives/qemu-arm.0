Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp62129eja;
        Wed, 1 Nov 2023 17:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB6kuaYbpzSj2oamA/MPAtKPt6Y4E2bOB2a42IAH37pyqOwMOsX6YmQJWuWwwC0z3KSBP5
X-Received: by 2002:a05:620a:2045:b0:779:d143:c1a7 with SMTP id d5-20020a05620a204500b00779d143c1a7mr16818935qka.26.1698885136447;
        Wed, 01 Nov 2023 17:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885136; cv=none;
        d=google.com; s=arc-20160816;
        b=RmVo1HrxZKsOj8rDvXBKRQEA/yQDCdp7Utp6njA4BrUT1H66cB967/ttmdzXAeINaZ
         6wXwRvwpi5o4R3hzG3hnVL7GEIcQT0XeYwBr6VAsuQimxQzw6E55ivZ0/rnNTf2VjTe5
         h8k7+HDnqucevBb8R5TK3bJQT/umJ8Bj7LZGFDkfptcuQn+Su2bpMsHtzGSFYZtm41ah
         YHyv+U1uSJdEemUp1BhTUKc17ukJsH6VehozExz2rCFNRCSiS0bjYC+cLwaCFuKbErIJ
         P3ry8tdIXmmXRctA+URpddBcy94iXkx222IEkfIVtykts0tj8Gn5i3E5y3p+hV52pfdR
         0uvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4CwHhFYKLVpsY6+pEsuA+tlHQkL6GXpsqqe3kht7I94=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=KlamNIF+VGeFyl2oTSeox041gYnxZy0s4/rSK1rRWbpQQH7xYe8VL/Ycak1uCXbTAj
         8Ln6jm+302ZkCnu6M7N8C9R2Cjqg3YzXanLkZz3N4ssmTIfmr+79pLZA25djsFrAZIaY
         vrRxkO4NllFxrg12ccr6ym0kiRcd4U/MYrhwk+ogt8gZe36k5ok+eyXUq2AKh81venqP
         zlSTLaEZUkeFVhV8M282Cuniefu3vc8RUn6/9o0Gn0XyByykW6paTWoGOgbfThfxVr1A
         34ZsT1PZvlLI9Uus+VWDULVtufwmhdl+vrHtsieqDAsBc4/A5zBGQbv8VEzTnJfkpPVa
         5vGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MqsZpaeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05620a454a00b007726499db83si3742645qkp.229.2023.11.01.17.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MqsZpaeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLbx-0008Fh-D6; Wed, 01 Nov 2023 20:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLbw-0008FI-Ht
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLbi-0002OZ-Pc
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CwHhFYKLVpsY6+pEsuA+tlHQkL6GXpsqqe3kht7I94=;
 b=MqsZpaeXt9HBW6yP54QP48uWJdzKxY7tFie816kONmhAJ+e48TC0sBSJh73iUkhV79uDl5
 6aKqYO4h0gcpIMqZLSafBrK0Nq2Poxc6ITn2dw3q9/rfZTSFyzQQ7WcrZ0wxzWLr7ANc0D
 Om42Vhzjl5O5EeyiuHw6VFZ4dtKegpY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-yD1fUxDmPg-Tmaq3m18H3Q-1; Wed, 01 Nov 2023 20:30:37 -0400
X-MC-Unique: yD1fUxDmPg-Tmaq3m18H3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C709811E7B;
 Thu,  2 Nov 2023 00:30:35 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCCA7C1290F;
 Thu,  2 Nov 2023 00:30:20 +0000 (UTC)
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
Subject: [PATCH v4 19/33] target/sh4: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:46 +1000
Message-ID: <20231102002500.1750692-20-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: OzUvEozbnH3q

For target/sh4, the registered CPU type name is always the combination
of the CPU model name and suffix. Use cpu_model_from_type() to show the
CPU model names.

Besides, superh_cpu_class_by_name() is improved by avoiding "goto out"
tag and renaming @s to @model since it points to CPU model name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/sh4/cpu.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a8ec98b134..6097ddd52d 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -125,9 +125,10 @@ static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 static void superh_cpu_list_entry(gpointer data, gpointer user_data)
 {
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(SUPERH_CPU_TYPE_SUFFIX);
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("%.*s\n", len, typename);
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void sh4_cpu_list(void)
@@ -135,6 +136,7 @@ void sh4_cpu_list(void)
     GSList *list;
 
     list = object_class_get_list_sorted(TYPE_SUPERH_CPU, false);
+    qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, superh_cpu_list_entry, NULL);
     g_slist_free(list);
 }
@@ -142,20 +144,19 @@ void sh4_cpu_list(void)
 static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-    char *s, *typename = NULL;
+    char *model, *typename;
 
-    s = g_ascii_strdown(cpu_model, -1);
-    if (strcmp(s, "any") == 0) {
-        oc = object_class_by_name(TYPE_SH7750R_CPU);
-        goto out;
+    model = g_ascii_strdown(cpu_model, -1);
+    if (strcmp(model, "any") == 0) {
+        typename = g_strdup(TYPE_SH7750R_CPU);
+    } else {
+        typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), model);
     }
 
-    typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
     oc = object_class_by_name(typename);
-
-out:
-    g_free(s);
+    g_free(model);
     g_free(typename);
+
     return oc;
 }
 
-- 
2.41.0

