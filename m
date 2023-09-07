Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3151822ejb;
        Wed, 6 Sep 2023 17:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEME2LEPDlMK+H7P//2/Fi/aKBpz8GdrYq40YRzS8UHYKTjwYsL23P6wfNsIophNeA9irhz
X-Received: by 2002:a0c:fb47:0:b0:64f:5d19:6654 with SMTP id b7-20020a0cfb47000000b0064f5d196654mr15559501qvq.65.1694047024695;
        Wed, 06 Sep 2023 17:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047024; cv=none;
        d=google.com; s=arc-20160816;
        b=Uy+n/KUHDzFpC8hkdVzr260JzC+n5+GVTeNIn8E1psieDtDOYFSrwgq4NVSbhj4AYc
         ml0tjT4BuZLkHSbDdyTeFp5DKRWSXdguJB+aeyfgft3BVWwB7toibM72HR/Z9XPGN2rX
         ZX5I+H5iabBbEYu+vwjcza4nYVqu0VGBhfuO3DJ534P6ZnJanP5Cqdg2sFPyFpGwR3+P
         /OnA498QmQXWu4WV2y/8k7qSx9iNiDvzsz9iTvzSyyOheVVlbVs09UZgL+bQChSUNVpz
         9s/oJhRFs4C1bYarKNhEYawwprlPSTxp2hhqMaGr0dV9C0Pr7xxhkxM62b//aRemJVbY
         pn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aY0vCT17ghdT+PeDe1lOFWysje3txmaFbEFFL/ifBWg=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=gbbZ0Ha3QpezBwJKKJiolSd8o5LwWJUBCp+9c+M/otvNoLS5RbRpPhGGVNqU4+QzOb
         7V55VF4IcVMxa+CMlRYWQUKjBKfhq2vpOmITghjPL3iteelCmY8WBvtwWjMV1w9/Km1E
         vfgDjf0E8t9jJmIk1PhoTlTTtN0fTks0B/Jzol3hr5L+8A0FVfPXSAohq/ZlQ4cmbW9h
         8zOHccaqzOtxbJSvQThREpAACOKNCX0mvFZJdGls6Tnv1TsPKpw8ZQUI1vjQmXhNsGyK
         CY5VdghlRxYPPZWaHv9Hva6NPA75j0VHIZi4np8x7tdfM1xxHrv8fdNGMZBcfzj9xud7
         l0uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPT9FCos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14-20020a0cf58e000000b0064b4b380c0csi10635200qvm.150.2023.09.06.17.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JPT9FCos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe311-0002Ya-TZ; Wed, 06 Sep 2023 20:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe310-0002Y6-8h
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:36:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe30w-0000dL-Ov
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aY0vCT17ghdT+PeDe1lOFWysje3txmaFbEFFL/ifBWg=;
 b=JPT9FCosKaeAyG4/FQwc8f0EtYZ/y7SbML/v3N7GDNjuaCW8AT43OHI5ATcJRQN8mJ86Al
 QdsvDgyVjzvA6uKRTKDb4pjwCjvc9JudGRk+EvMaReSsai2cMQ3s1lWP8zDzx+5Vn87vmU
 U6UZrMmWqXF7myodop7UeTU0GyL0RHo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-tBh-EfmCMfOYP1VbbrVUlw-1; Wed, 06 Sep 2023 20:36:50 -0400
X-MC-Unique: tBh-EfmCMfOYP1VbbrVUlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DE263C0EAA5;
 Thu,  7 Sep 2023 00:36:46 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF97C03295;
 Thu,  7 Sep 2023 00:36:31 +0000 (UTC)
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
Subject: [PATCH v3 01/32] cpu: Add helper cpu_model_from_type()
Date: Thu,  7 Sep 2023 10:35:22 +1000
Message-ID: <20230907003553.1636896-2-gshan@redhat.com>
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
X-TUID: ajP/iPfK/4ZX

Add helper cpu_model_from_type() to extract the CPU model name from
the CPU type name in two circumstances: (1) The CPU type name is the
combination of the CPU model name and suffix. (2) The CPU type name
is same to the CPU model name.

The helper will be used in the subsequent patches to conver the
CPU type name to the CPU model name.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 cpu.c                 | 16 ++++++++++++++++
 include/hw/core/cpu.h | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/cpu.c b/cpu.c
index 1c948d1161..a19e33ff96 100644
--- a/cpu.c
+++ b/cpu.c
@@ -284,6 +284,22 @@ const char *parse_cpu_option(const char *cpu_option)
     return cpu_type;
 }
 
+char *cpu_model_from_type(const char *typename)
+{
+    const char *suffix = "-" CPU_RESOLVING_TYPE;
+
+    if (!object_class_by_name(typename)) {
+        return NULL;
+    }
+
+    if (strlen(typename) > strlen(suffix) &&
+        !strcmp(typename + strlen(typename) - strlen(suffix), suffix)) {
+        return g_strndup(typename, strlen(typename) - strlen(suffix));
+    }
+
+    return g_strdup(typename);
+}
+
 void list_cpus(void)
 {
     /* XXX: implement xxx_cpu_list for targets that still miss it */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 92a4234439..6e76d95490 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -657,6 +657,18 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
+/**
+ * cpu_model_from_type:
+ * @typename: The CPU type name
+ *
+ * Extract the CPU model name from the CPU type name. The
+ * CPU type name is either the combination of the CPU model
+ * name and suffix, or same to the CPU model name.
+ *
+ * Returns: CPU model name
+ */
+char *cpu_model_from_type(const char *typename);
+
 /**
  * cpu_has_work:
  * @cpu: The vCPU to check.
-- 
2.41.0

