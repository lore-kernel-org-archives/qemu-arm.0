Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2409681ejc;
        Tue, 14 Nov 2023 16:00:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiE9FfLfIfNdgsCBqtymQYhSg35279Up7TEmIwUp0dY8ptzMQf+YtkBhrkgi5RqBJ4qhm4
X-Received: by 2002:a05:6122:788:b0:4ac:6a9d:a51e with SMTP id k8-20020a056122078800b004ac6a9da51emr12313440vkr.9.1700006446796;
        Tue, 14 Nov 2023 16:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006446; cv=none;
        d=google.com; s=arc-20160816;
        b=p5q9V+FbIs4FCtGuKCvOm3BWfwOBdswjYf4s4jY1xlLImCc78e4foyhCeStH+CQh8b
         D9Y0s5w44a3mrw1anKoSjye3WEhDUfznMOi6zreRBlpt82oQjmkNJSqUXDQHm8QMO3Lb
         lgTBbeCLs2ukbbXTJQrZo9qpjV5IDGSwm1m7ckFS6W5pVlp7BRwdZjakD1p7UVl/gfGc
         wG3dzwq1e+pqpIgfM8SlwChbJs0pMY2rVbrjzxRxXPPdL6dCEI1RwuTZLThqlPC52kxx
         BjrI7il76OnS361JsnCo78NzDH5z4SWFD351iD6s2DF2TrPXaQErpLgVljliScvOEkHa
         QrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PwMztkO73N/CczTrLEnz5dB16TLg0zyhFk70FFGOseI=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=sbyKzeV3hbqz78U5zEF8Fo+PwPQmMzHL25nUABylVjBKIhBfR/Fq0DwEn6k9nnqhjL
         FmdpAjAyDva712WSJQaHxM4DFUkvhZYutKy8fvchDElhJtHDRSHvoIBymfDFZ9I60mZW
         T9fJs0wUdBjs+bOPtSNSzx5z866SKvLp3XSU/W2EVRCeSFQ9tz/M1rvsKT7TZLkdR7kx
         PHIN/YagoMDXEGdXoANwjzo3oYgi+9aKda+FtQaqLr1Cni8TWi7LZUm5HNgmQFQMQHno
         xumm7kfOsssSV0IwstHDKhOIbheIW58yDl06qgR+rjJibXfAzFLSpoNiJuknBudgpBat
         DHTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI9ylpiA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9-20020a05612202e900b00499f17fd476si1349063vko.120.2023.11.14.16.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI9ylpiA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33Jl-0004CB-PL; Tue, 14 Nov 2023 18:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Jk-000492-To
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Jf-0007Pi-Oj
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwMztkO73N/CczTrLEnz5dB16TLg0zyhFk70FFGOseI=;
 b=hI9ylpiAgKP2SxTU2f0ROpKQG1bOMEt2H4RYxT0XE3Qsq9xA4NekTVmdOmU59VhWgkvfTW
 MYrQYmUH2QyV6qRwBUBnrbt5W+jgB2ctJeiena5A0JupsZwtpWkooXeuxY7If/1tRBLsFb
 0ZBAulz2H5ZwcM6wcTSLqhy9Jve1rGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-8rihQODPP6SQi6Y7AsiVCw-1; Tue, 14 Nov 2023 18:59:30 -0500
X-MC-Unique: 8rihQODPP6SQi6Y7AsiVCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED98F811E7D;
 Tue, 14 Nov 2023 23:59:28 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF103C15885;
 Tue, 14 Nov 2023 23:59:16 +0000 (UTC)
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
Subject: [PATCH v5 11/31] target/hexagon: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:08 +1000
Message-ID: <20231114235628.534334-12-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
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
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: pHcOjf6A3VSL

No changes in the output from the following command.

[gshan@gshan q]$ ./build/qemu-hexagon -cpu ?
Available CPUs:
  v67
  v68
  v69
  v71
  v73

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/hexagon/cpu.c | 20 --------------------
 target/hexagon/cpu.h |  3 ---
 2 files changed, 23 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index aa48f5fe89..c0cd739e15 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -32,26 +32,6 @@ static void hexagon_v69_cpu_init(Object *obj) { }
 static void hexagon_v71_cpu_init(Object *obj) { }
 static void hexagon_v73_cpu_init(Object *obj) { }
 
-static void hexagon_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    char *name = g_strdup(object_class_get_name(oc));
-    if (g_str_has_suffix(name, HEXAGON_CPU_TYPE_SUFFIX)) {
-        name[strlen(name) - strlen(HEXAGON_CPU_TYPE_SUFFIX)] = '\0';
-    }
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void hexagon_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_HEXAGON_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, hexagon_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 7d16083c6a..5c11ae3445 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -37,9 +37,6 @@
 
 #define CPU_RESOLVING_TYPE TYPE_HEXAGON_CPU
 
-void hexagon_cpu_list(void);
-#define cpu_list hexagon_cpu_list
-
 #define MMU_USER_IDX 0
 
 typedef struct {
-- 
2.41.0

