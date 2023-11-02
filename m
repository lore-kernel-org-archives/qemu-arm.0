Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp62489eja;
        Wed, 1 Nov 2023 17:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV1wBDc33vGeqs0BQUf8NPcUvsIiy5KkylUVLl0GF5J9JWPgP5srIZ8WZYzWSHHORQsG61
X-Received: by 2002:a81:4c05:0:b0:5a7:c49e:3f5c with SMTP id z5-20020a814c05000000b005a7c49e3f5cmr18886102ywa.21.1698885190356;
        Wed, 01 Nov 2023 17:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885190; cv=none;
        d=google.com; s=arc-20160816;
        b=rKdullWKmmN0BfJnbX9djAMSiX3pZ44Fn03VEGtTq3N9yAMoseWwsRbSgk3nTOIh7Q
         CHARR0Z28WNv5+rL/YUOe+VHZXfEMxLMjdYlNrdMsI3we7lhJNm5iR91nq2ybDCxDrgd
         cCx5jkQa8/cf1HmRLn62dh1sQqHuIhaUXrlxouKKE6VrfWN9pD7qSCiBKV3M319HIwi9
         awahUnwyBwfZ6k9bqc10moYppx7LIJP2xk9fLhiA44//g/MntkbY15pTyRoy9zQBPMNn
         U7/4WS72AliUmsIdzyz3DHcnvSn7Q2j91e88y/K/g65g+mmt9KKQHccKR8QD7Vfpd15M
         iApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AIaYd1qFLH937u8bHl5PLfrX6nJ/BZeou3+NBivvthE=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=t1kijf0Lpcexak5b6sxpfkcH9+gfqqRxzOsp7j+yw+KGDo1CyGOt985/r7w0ZTSmo9
         niF818YI1pcPrszIq2w8TggSQ8xVE8lTTgmw0MRLFtyEM+cHC8Ym27q2fMebZEOb9SEN
         dn95xmPYeP+d3RzAQ2cuDAD0Onut/7b4ae1lYmDjbnYwC52+Dh7Im7TM7gLuYDY33LSb
         Hf7JE54fC6rSx6g9xD85Gvc9MJXG0eWzRIHBv3z+i7FMqvlMq4Iy2TromQmuPJFRixNw
         cYeSdPAU/nAd2Aogh/truuGX/fq48xvIbKYDqeICEgnFjdhWAT1YKqZFYUx0umCvWK6R
         qw9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GkDvHspu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020ad44148000000b0064bbe315095si3553329qvp.68.2023.11.01.17.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GkDvHspu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyLcf-0000dM-Ff; Wed, 01 Nov 2023 20:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLcP-000053-M4
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLcJ-0002Y7-0w
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIaYd1qFLH937u8bHl5PLfrX6nJ/BZeou3+NBivvthE=;
 b=GkDvHspuLn//2Ae6JjITJp3htBr5Pi7xvlLpTcYTyG9RD52K4q85t6cIoVJbges/GAO6iB
 82FsaqD8Hw9j7eLCEu4I/FWFESjRuLIi4/B/nqnIjbwsXOL29s22m82OqfWrKJJvJ1E94P
 7EX1284wX6WVAUTk845ZWNd7wzK0D2U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-ArYyGNwdNTi8vxYC7LqfAg-1; Wed,
 01 Nov 2023 20:31:12 -0400
X-MC-Unique: ArYyGNwdNTi8vxYC7LqfAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F21B28211A5;
 Thu,  2 Nov 2023 00:31:08 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C82C1290F;
 Thu,  2 Nov 2023 00:30:52 +0000 (UTC)
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
Subject: [PATCH v4 21/33] target/hppa: Implement hppa_cpu_list()
Date: Thu,  2 Nov 2023 10:24:48 +1000
Message-ID: <20231102002500.1750692-22-gshan@redhat.com>
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
X-TUID: lQoG45hH3W8M

Implement hppa_cpu_list() to support cpu_list(). With this applied,
the available CPU model names, same to the CPU type names, are shown
as below.

  $ ./build/qemu-system-hppa -cpu ?
  Available CPUs:
    hppa-cpu

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/hppa/cpu.c | 19 +++++++++++++++++++
 target/hppa/cpu.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 1644297bf8..2b5198d7c8 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -143,6 +143,25 @@ static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
 }
 
+static void hppa_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
+}
+
+void hppa_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list_sorted(TYPE_HPPA_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, hppa_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
 static void hppa_cpu_initfn(Object *obj)
 {
     CPUState *cs = CPU(obj);
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 798d0c26d7..d8106c89dc 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -357,5 +357,8 @@ void hppa_cpu_alarm_timer(void *);
 int hppa_artype_for_page(CPUHPPAState *env, target_ulong vaddr);
 #endif
 G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra);
+void hppa_cpu_list(void);
+
+#define cpu_list hppa_cpu_list
 
 #endif /* HPPA_CPU_H */
-- 
2.41.0

