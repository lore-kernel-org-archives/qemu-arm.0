Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60832eja;
        Wed, 1 Nov 2023 17:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtEhfSebVBMifBJTV85nVIW2X/cZGGgiq0upileZWEWdSHhlo5tbr1zG4Pz3SFznHPXxFA
X-Received: by 2002:a05:6214:19c1:b0:66d:1b3a:481e with SMTP id j1-20020a05621419c100b0066d1b3a481emr21461987qvc.6.1698884948852;
        Wed, 01 Nov 2023 17:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884948; cv=none;
        d=google.com; s=arc-20160816;
        b=TVtVZ7e2jrpqxOQnk97GE3d+mfwQ61sKIfjFZiYxkdaXlq6xMuy3UxKz3Tu4CJhy/8
         9/K9c+CfHOl9x02SoyvfjTZdulPxPiJB/+75sVenFLuKU4268nwdavCkijBiks/nsPEc
         ph99B7uht4wugDCPz2jUDxQGJ0/yUoukhSlrBEM5pv1GPtEHT3PS2KA087KOO2NqCdlN
         77CNOf4kNqy/3u0UBz75WisxF2jjoA2OAyGU9t01T8tuq6cjs/ZKr00nU/144688YI4a
         VsjgqojloiklL/GE8TEeLxU19anq3DDV0lZ155McyrJE4K+pBLY/KeyRQoDJzxQsEnJG
         xykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U+hbL+nXKZ1D+1oMFAqjpbNNOm5f/WsCVqbkf/f2x8s=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=bcgcAM306hrpCHNJyf0KT2pNy9RakLq/ziu6/LBI79UKqXlK6Z6EBTRDB/phWnSDfd
         SgSa0t/XD2WPZJ9ipcPyuoOqf/JVJoYxKzR9cms8l7jpihQuWMeaNwOA4N4iAjkhBiE6
         XMOHDRLm89Rw7sDzViK9447L3l/L4CgDMKGxebPtRnwz2rpktYyh+f4HtkB5rZuc58zP
         tYoD3if7Jiv6iMHi+iFLkHygyHN94PCGeOOcrdcFS4pd37V0Lm2OIR14GyQQEN+EVTKB
         H1xndyudECn2odGI01VUkZObon4ADPE2ARDubcwAFUjP7zExV7A+wuU2OowSzuoQAkAB
         VqTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JwHfep1M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a056214017000b00670c78f44dasi3446977qvs.447.2023.11.01.17.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JwHfep1M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLYW-00020L-2d; Wed, 01 Nov 2023 20:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLYT-0001vY-Gc
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLYR-0000iU-VN
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+hbL+nXKZ1D+1oMFAqjpbNNOm5f/WsCVqbkf/f2x8s=;
 b=JwHfep1MFWMaiZLp+/+QSsQosUjl3p6x5P8MbmwT7NbkStBouNz6MVhEWkDj8/v5u8GOvO
 4Nsd62UktIN/c+BAdraneR3pE8mWcRPh+OsFKVuXuZQd0hUgczFrIh9q9bT/fTvoB1jQpi
 S8l1pegD8JoFxW+lKEpO5KU+6L93g5A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-zBnwu1w0OLCXr_pl4TIUcg-1; Wed, 01 Nov 2023 20:27:18 -0400
X-MC-Unique: zBnwu1w0OLCXr_pl4TIUcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65808185A780;
 Thu,  2 Nov 2023 00:27:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EC67C1290F;
 Thu,  2 Nov 2023 00:27:01 +0000 (UTC)
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
Subject: [PATCH v4 06/33] target/arm: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:33 +1000
Message-ID: <20231102002500.1750692-7-gshan@redhat.com>
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
X-TUID: +m33LDuFzxB7

For target/arm, the registered CPU type name is always the combination
of the CPU model name and suffix. Use cpu_model_from_type() to show the
CPU model names. In arm_cpu_list_entry(), @name is renamed to @model
since it points to CPU model name instead of CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/arm-qmp-cmds.c |  6 ++----
 target/arm/helper.c       | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index b53d5efe13..c8c712a2c6 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -233,12 +233,10 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
     ObjectClass *oc = data;
     CpuDefinitionInfoList **cpu_list = user_data;
     CpuDefinitionInfo *info;
-    const char *typename;
+    const char *typename = object_class_get_name(oc);
 
-    typename = object_class_get_name(oc);
     info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5dc0d20a84..baf4b104ef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9436,17 +9436,15 @@ static void arm_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     CPUClass *cc = CPU_CLASS(oc);
-    const char *typename;
-    char *name;
+    const char *typename = object_class_get_name(oc);
+    char *model = cpu_model_from_type(typename);
 
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
     if (cc->deprecation_note) {
-        qemu_printf("  %s (deprecated)\n", name);
+        qemu_printf("  %s (deprecated)\n", model);
     } else {
-        qemu_printf("  %s\n", name);
+        qemu_printf("  %s\n", model);
     }
-    g_free(name);
+    g_free(model);
 }
 
 void arm_cpu_list(void)
-- 
2.41.0

