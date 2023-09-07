Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3154447ejb;
        Wed, 6 Sep 2023 17:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE45qOJeqYYmQize2xSwzZFYdkIJEm6Bwxkl4IrsEFgJvQ0vimnV8Mt5mH2Gsw263usLXzz
X-Received: by 2002:a0c:fb47:0:b0:64f:5d19:6654 with SMTP id b7-20020a0cfb47000000b0064f5d196654mr15568595qvq.65.1694047366118;
        Wed, 06 Sep 2023 17:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047366; cv=none;
        d=google.com; s=arc-20160816;
        b=M7ss4lntSogsmu8EbKyu5mzhoqowuRgxzJMcC5CQPrcefQH1eMJtf8OEvynwTo0Hei
         yjykSPtyEbWQOIX3psVDPkstVCVn5MvzbzsF3L2lSh5wBd1QuMGhlW5Dvs33kvTGEFtl
         bAjwZ3wVjHQUlwol4amMa9pX6+siaXLbEd6cklErGHowNeO4WpZhtgIWMYKtv1JPxivP
         GgKZP6MW0sCxzGNKnxttwMt/vqGGkHPj3tIaH0eMliNTKdd8LUeKpzVwXid5adx/SZ5K
         qPwr+8SjIXseovd8ZTT9mwS909Bh2XXWBRlY9OAYLR7y9GC84baCw0A1ZmgGKAxWOGZ8
         JXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1JcIMoOuyt+t5aC4urIl46RXyX+s90YzOzH5wi/cRhQ=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=lnTQXV+cGdRecrQeJT6TUUbtgPQKj8y6XahaPbs1WusheqJ0IAmjOSoioRa9OuS+5f
         HPmMWxZBh+nIXmd3QCf6a7S4Fx9V2lodL64zLs+TfEOZcHBLsixPDwGTsNUoO145wMrP
         xhKs/mB/0XIRWk8J2ci/9mmIwtgoVwE9coNVpxjvFTz2PaWLKtuOi2nAdNnSO7mLJkLk
         m9qgGyz1hxLY1Pk9asK443KRs9nMwejVg6kD7q5Ckx/Ck3gDxZjvoH4zZrVmCFuISjOv
         CQWisHBylqz4QyuF2G7Cjywr+nqtBsv80w5Enyni3sHB7fnoB4BajaP40B/VuklYPuqA
         5D2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e4h1GqhV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a37-20020a05620a43a500b0076ef0254151si10420640qkp.58.2023.09.06.17.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e4h1GqhV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe36b-0003Wk-7Y; Wed, 06 Sep 2023 20:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe36Y-00038d-4n
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe36T-0002Yy-Mw
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JcIMoOuyt+t5aC4urIl46RXyX+s90YzOzH5wi/cRhQ=;
 b=e4h1GqhVP1D0VpBHlrDZWF9kCvb/p1a2AloQXOEftQ4kC9X7Jxwez8PVzJr7dEhsSrXi2t
 jPN+0vzbonSycNhwC+0cDrXumWW16wZspQ9DtRPjL5aGQV6i0k26FLTCitNzf+w6Uw+ZIp
 R+r2/AZBn5sLyuOHPI/He/IWLvrrv9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-qZhAew2LNGKGCwtuJ-39Ag-1; Wed, 06 Sep 2023 20:42:29 -0400
X-MC-Unique: qZhAew2LNGKGCwtuJ-39Ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C09C80C908;
 Thu,  7 Sep 2023 00:42:27 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E3EC03295;
 Thu,  7 Sep 2023 00:42:11 +0000 (UTC)
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
Subject: [PATCH v3 22/32] target/nios2: Implement nios2_cpu_list()
Date: Thu,  7 Sep 2023 10:35:43 +1000
Message-ID: <20230907003553.1636896-23-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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
X-TUID: n54xMQcwfe7h

Implement nios2_cpu_list() to support cpu_list(). With this applied,
the available CPU model names, same to the CPU type names, are shown
as below.

  $ ./build/qemu-system-nios2 -cpu ?
  Available CPUs:
    nios2-cpu

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/nios2/cpu.c | 20 ++++++++++++++++++++
 target/nios2/cpu.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index bc5cbf81c2..80af24eb69 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/log.h"
 #include "gdbstub/helpers.h"
@@ -111,6 +112,25 @@ static void iic_set_irq(void *opaque, int irq, int level)
 }
 #endif
 
+static void nios2_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
+}
+
+void nios2_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list_sorted(TYPE_NIOS2_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, nios2_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
 static void nios2_cpu_initfn(Object *obj)
 {
     Nios2CPU *cpu = NIOS2_CPU(obj);
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 477a3161fd..6d21b7e8f4 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -292,6 +292,9 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
 #endif
+void nios2_cpu_list(void);
+
+#define cpu_list nios2_cpu_list
 
 typedef CPUNios2State CPUArchState;
 typedef Nios2CPU ArchCPU;
-- 
2.41.0

