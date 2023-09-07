Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3153691ejb;
        Wed, 6 Sep 2023 17:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8GapWuNojTrv+zdTOXr2kZjbWW3Tk0XJCX+CITXhL5APiEVvtBcXbauhTFzZc8LM9l71S
X-Received: by 2002:a05:622a:ca:b0:403:3583:68eb with SMTP id p10-20020a05622a00ca00b00403358368ebmr22482610qtw.19.1694047271352;
        Wed, 06 Sep 2023 17:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047271; cv=none;
        d=google.com; s=arc-20160816;
        b=CUAtjMZEzZalbp6JC1/DWEI6chACq914BuKjRnVqKI5UQP6CQaFGUDSP+UpmQjjD+C
         1HiIerHcUghXFL6QLkwq2R5gbBuJ1Bua9wywAih/JPkRWmxspqHPUWuqGsAZxSX8kp8B
         gas4gd8uLun5z51F/TbuRL0aOaENA4Y5dJzJgccl2Ao4i7V3jfklMbIzmRw6XILUo39U
         2UHNsW9ifyvarFW1MYp9fxxIs4GuWfev+t26JE3zf4x70fkZfaLbz/Ck/xsb8oMBMhkI
         CyoOwidjSS7TkG4zvIYz7A6tK4r+W0jFzXMMyYmdLNK86RhfV/i/H49smUjkMdu2UZwj
         SpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jKDsmqdKXW/52OHgWrNIrks6OR99NisUwEAqLjed2eQ=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=PpYitbiUnIHP6fAT99SD7Uzp5tePVGK/QoyEoqksD1tugWgomVB7uO+T200k9dcLou
         YpPd6A5J6FLFJr77JLds7RvjS3uHOfAMdQTLPfyxQGCUzQKmryGYhYxdKEZ4wiHUDrei
         +NORvrS7Osot4qeRRjnNlORRW4b1M/u1MC8ytG4BZumxw1x+YdblyhWvQBNc+dcr0Pp3
         PSp8UEMQRcRQdgld+KXciQhqGxk1+WFu5rW0edGwBpoG7sQztTv8gKJo5wRc4qGR05sR
         X0U7DWNK3tZTzFZ9BkzhXSmMyM10cJ49h4bswH8OpXRzUKK1JCS4mEHHPcHIR0BC/Kdc
         stRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYcgJvMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s30-20020a05622a1a9e00b0040325117d5csi10115482qtc.405.2023.09.06.17.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYcgJvMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe34y-0006BA-Mb; Wed, 06 Sep 2023 20:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34x-00069W-Mj
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34v-0001tO-8q
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKDsmqdKXW/52OHgWrNIrks6OR99NisUwEAqLjed2eQ=;
 b=XYcgJvMzSK8b0PvPbMRWnAeix8kFHq8l854egnRAlDkLOUFp5mYauGo+MpjvA4lAUWYfER
 VqIvThbaoXMCK+5RB8bnzgOb6n26HNXlKZg5J/K0b88GjgmfqTdVGObKvKIxEBpxlDQwqJ
 Sw3NaaLaojk0ABHqIP4F49BJ2+wLjC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-Zrx_wl5zOQCtWyT1uYgbyA-1; Wed, 06 Sep 2023 20:40:55 -0400
X-MC-Unique: Zrx_wl5zOQCtWyT1uYgbyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 290BD181792B;
 Thu,  7 Sep 2023 00:40:53 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C8CAC03295;
 Thu,  7 Sep 2023 00:40:38 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com, ysato@users.sourceforge.jp,
 david@redhat.com, thuth@redhat.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 16/32] target/sh4: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:37 +1000
Message-ID: <20230907003553.1636896-17-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eIb6771O490I

For target/sh4, the CPU type name can be: (1) the combination of the
CPU model name and suffix; (2) TYPE_SH7750R_CPU when the CPU model
name is "any". The CPU model names have been correctly shown in
superh_cpu_list_entry().

Use generic helper cpu_model_from_type() to show the CPU model name
in the above function. Besides, superh_cpu_class_by_name() is improved
by avoiding "goto out" and validating the CPU class.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/sh4/cpu.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 61769ffdfa..ca06e2ce99 100644
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
@@ -146,20 +148,20 @@ static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
 
     s = g_ascii_strdown(cpu_model, -1);
     if (strcmp(s, "any") == 0) {
-        oc = object_class_by_name(TYPE_SH7750R_CPU);
-        goto out;
+        typename = g_strdup(TYPE_SH7750R_CPU);
+    } else {
+        typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
     }
 
-    typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
     oc = object_class_by_name(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
-
-out:
     g_free(s);
     g_free(typename);
-    return oc;
+    if (object_class_dynamic_cast(oc, TYPE_SUPERH_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
+    }
+
+    return NULL;
 }
 
 static void sh7750r_cpu_initfn(Object *obj)
-- 
2.41.0

