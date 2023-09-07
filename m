Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3152821ejb;
        Wed, 6 Sep 2023 17:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErgCW++BlYiagyLKTM6Je6xzuZY8dlns+/iapXY1bXx1LVsI8wgZhVb/TEvbHCgJ/Mrsf2
X-Received: by 2002:a0c:dd90:0:b0:653:5b5e:7a84 with SMTP id v16-20020a0cdd90000000b006535b5e7a84mr12101429qvk.29.1694047149718;
        Wed, 06 Sep 2023 17:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047149; cv=none;
        d=google.com; s=arc-20160816;
        b=t8wMpLr4aSlOFBO2gyY5xyKpRVLJUq8OtdaE8DTZmKsHvZNvsHbHMs7ZtyGLRHwga5
         e2NtP6FJIUBik5fn+W9xD57Bhj1Uvz679u6khQ7gP2NMxyE52Grd9xZ0b9YV6NNYsvh2
         9KRKAkZ+8YgJtPME7kXS23cuGbai3HSg8soFk+YnB6JEwXhG10b6tZ/5BYIS9OFrffI4
         AGFFYRH7U/QvJZq38Q8xhfjGaSONFU++mH0WF0Xe/EIXMtQo5fetfwBIU6AkmIrSyrYQ
         3nJnEcs76iWq4BRmkdeGvZuVqBijvO/2p3gCF/PoxOICaXhc4YVnHcIbDfD0h1ZXBipv
         G+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LANb4PqMzRmKrDj2eutGTKPlZDmFwMncEh+nEJ9UjDI=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=r8GPRP6iIpzNrV47TI4k50utRkTXKRXY/+qQ47MTYZCoSSs/9S3ePg2/LJ4pYo+/1m
         akauiox3iqln4jo7mU3sTqZy3lJwTRtHiYpJ1Hxx/G/3gIoZQYxextnizRQ4VxYabZyJ
         8HjysfyMvt9KSB2IkNJQeG+VETfsJglDo8EidvDShW3dfvCfD/8dTEHxKVgJ9LW1b4xY
         SX3Sn+74pj9deWa1DXR5qt9FpY4BWfi59VbC2ryCj+VKI416hrWx3rKJnnPG4UwHz/64
         w5WCVsAyLbaE4lucYQI4DNoRcwN0cefAjM2/uMrS+OpouPvbHC+gLWsuafo/IxcjPbNE
         DYVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NAd9VA97;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a0cd98a000000b0063d42d0a6acsi10661599qvj.517.2023.09.06.17.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NAd9VA97;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qe334-0007b3-Ky; Wed, 06 Sep 2023 20:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe32j-0007E1-KE
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe32g-00013C-KU
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LANb4PqMzRmKrDj2eutGTKPlZDmFwMncEh+nEJ9UjDI=;
 b=NAd9VA977grAYD0PC/1sM6FG6DpvdD5ZTxYatDsf6ownbhQJEId3vnC+ngBmu4m9RfDxJ0
 bnnBBETxz4YFa4HOTiDJpNRZx1PM+FCnChAXOQ/SJ+vnWggntEleM+CM/vkDl11qga79iy
 dZs9zR5ZR9suJQoeE5aFE/pcg5m25Lo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-mZLWOzSQOeyZHvcz6K7ttg-1; Wed, 06 Sep 2023 20:38:37 -0400
X-MC-Unique: mZLWOzSQOeyZHvcz6K7ttg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E20641C0514F;
 Thu,  7 Sep 2023 00:38:35 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34802C03295;
 Thu,  7 Sep 2023 00:38:20 +0000 (UTC)
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
Subject: [PATCH v3 07/32] target/i386: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:28 +1000
Message-ID: <20230907003553.1636896-8-gshan@redhat.com>
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
X-TUID: +5qeJlwtV8bx

For target/i386, the CPU type name is always the combination of the
CPU model name and suffix. The CPU model names have been shown
correctly in x86_cpu_list_entry().

Use generic helper cpu_model_from_type() to get the CPU model name
from the CPU type name in x86_cpu_class_get_model_name(), and rename
@name to @model in x86_cpu_list_entry() since it points to the CPU
model name instead of the CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/i386/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 00f913b638..31f1d0379e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1741,8 +1741,7 @@ static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
 {
     const char *class_name = object_class_get_name(OBJECT_CLASS(cc));
     assert(g_str_has_suffix(class_name, X86_CPU_TYPE_SUFFIX));
-    return g_strndup(class_name,
-                     strlen(class_name) - strlen(X86_CPU_TYPE_SUFFIX));
+    return cpu_model_from_type(class_name);
 }
 
 typedef struct X86CPUVersionDefinition {
@@ -5544,7 +5543,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     X86CPUClass *cc = X86_CPU_CLASS(oc);
-    g_autofree char *name = x86_cpu_class_get_model_name(cc);
+    g_autofree char *model = x86_cpu_class_get_model_name(cc);
     g_autofree char *desc = g_strdup(cc->model_description);
     g_autofree char *alias_of = x86_cpu_class_get_alias_of(cc);
     g_autofree char *model_id = x86_cpu_class_get_model_id(cc);
@@ -5568,7 +5567,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s (deprecated)", olddesc);
     }
 
-    qemu_printf("x86 %-20s  %s\n", name, desc);
+    qemu_printf("x86 %-20s  %s\n", model, desc);
 }
 
 /* list available CPU models and flags */
-- 
2.41.0

