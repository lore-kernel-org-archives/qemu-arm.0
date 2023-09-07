Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3153306ejb;
        Wed, 6 Sep 2023 17:40:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6TRWG73E7dKDMTHyIeOGvQuYQMijwgVt5tDy1IMZf7rBtKSBNmPyV3QeBAn00VNZQO4oD
X-Received: by 2002:a05:6358:2910:b0:13a:a094:737d with SMTP id y16-20020a056358291000b0013aa094737dmr5582898rwb.18.1694047219239;
        Wed, 06 Sep 2023 17:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047219; cv=none;
        d=google.com; s=arc-20160816;
        b=g8qqnAuB97cRStCf23s2Oa4sgO7BrEZCrJBZCfxiRskqd2ztrHlqohm7jg4l5AMMbE
         oKl8fNp1+X34znkFuCrAno8yllvuKVW7npTyWLNj0HeNY+AA+4pTUgPmjNdQMpS3+PcO
         JSNbvI3rKRWrIbpxNjHhfZ6uB9brmr1NyZvvNHYnRc2Ci6DdyzwaChQ9+ZZ7vIoyvGFv
         s5WY5hAbfG4JDuqUvMtKIa7XRjkX9YTE6NMKFirfQCeGVwu0BQedvcl4ZycuBVde4/Wo
         1NG7mOsDheuFYU/SeCIf6PDsFngdU8D0uM4NwJ5SG6lmMPEcNuLdCV2d03LxLAP4Ebh3
         P6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NjZw3E7apQj63HRBsTMKeM32ZIpPKyvSIbeJgERsvj4=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=IjhySigb7oWDnoYhkBCOQ0v8GqvbEH6UiDJCHgUE0aQ7+MpGBC4KyRR5e8On72ihZq
         ISDH1PNZvMnli3ZvRH+LWdWW0/1quTJMRylJifQ3N94P8HyQuanPFQtFtRkMQT8jFK6Q
         22WnMh9LtPDMk5zdIGJzhuGi3KhsbJ/NK8HshDi+un7b6ScfhjDUAJaYl86kZxT6kUbj
         TwFWAOwjm1UjeTVHPlQtHx+RO2HV3r8tBJGNO9LeJruRHX8xVp5ATtpCg2RdnI+0nc4i
         SmBblcMiLWermyEWvVnK7y//0OHtWglS1K4vDYWnmmSAjEGX0sjHNNK7g8FKo+HR6H+P
         d/Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GvuDXo/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28-20020a0ca99c000000b0064f3810fbf0si10327998qvb.370.2023.09.06.17.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GvuDXo/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe345-0004UV-1H; Wed, 06 Sep 2023 20:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33x-0004Jn-ST
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:40:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33u-0001JQ-Hd
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjZw3E7apQj63HRBsTMKeM32ZIpPKyvSIbeJgERsvj4=;
 b=GvuDXo/uOaWHyHogq4thTxeqauvxwAjcdtPXwnQM3rmEVSdAABqAFSmlSDbkY6MPewsr1y
 1oJ9szGRYPdbEIXrcQ0ALKec7yom+VzyztBcZqqBc8UN9dO+XVib6Yrl/55Il0+aoc6IPR
 nBL+K+1LOwbG3cVNhfKk0d8tkhYjaks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-td0w1gdDNFudt2Twc0gCpw-1; Wed, 06 Sep 2023 20:39:54 -0400
X-MC-Unique: td0w1gdDNFudt2Twc0gCpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FB57181792B;
 Thu,  7 Sep 2023 00:39:52 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FDA0C03295;
 Thu,  7 Sep 2023 00:39:37 +0000 (UTC)
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
Subject: [PATCH v3 12/32] target/ppc: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:33 +1000
Message-ID: <20230907003553.1636896-13-gshan@redhat.com>
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
X-TUID: uPZtbDWywEnt

For target/ppc, the CPU type name can be: (1) The combination of
the CPU model name and suffix; (2) the type name of the class whose
PVR matches with the specified one; (3) alias of the CPU model, plus
suffix; (4) MachineClass::default_cpu_type when the CPU model name
is "max". All the possible information, the CPU model name, aliases
of the CPU models and PVRs are all shown in ppc_cpu_list_entry().

Use generic helper cpu_model_from_type() in ppc_cpu_list_entry(),
and rename @name to @model since it points to the CPU model name
instead of the CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/ppc/cpu_init.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 02b7aad9b0..7281402331 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7019,16 +7019,15 @@ static void ppc_cpu_list_entry(gpointer data, gpointer user_data)
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
     DeviceClass *family = DEVICE_CLASS(ppc_cpu_get_family_class(pcc));
     const char *typename = object_class_get_name(oc);
-    char *name;
+    char *model;
     int i;
 
     if (unlikely(strcmp(typename, TYPE_HOST_POWERPC_CPU) == 0)) {
         return;
     }
 
-    name = g_strndup(typename,
-                     strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
-    qemu_printf("PowerPC %-16s PVR %08x\n", name, pcc->pvr);
+    model = cpu_model_from_type(typename);
+    qemu_printf("PowerPC %-16s PVR %08x\n", model, pcc->pvr);
     for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
         PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
         ObjectClass *alias_oc = ppc_cpu_class_by_name(alias->model);
@@ -7045,10 +7044,10 @@ static void ppc_cpu_list_entry(gpointer data, gpointer user_data)
                         alias->alias, family->desc);
         } else {
             qemu_printf("PowerPC %-16s (alias for %s)\n",
-                        alias->alias, name);
+                        alias->alias, model);
         }
     }
-    g_free(name);
+    g_free(model);
 }
 
 void ppc_cpu_list(void)
-- 
2.41.0

