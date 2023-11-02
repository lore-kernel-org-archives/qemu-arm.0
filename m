Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60886eja;
        Wed, 1 Nov 2023 17:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7TMmYEHiFTc9Q5xCdjvAR2cxhTdilOjgvZGFLarmFvkH74e0skPel+INwQ9HjWhtEBhOd
X-Received: by 2002:a05:620a:a0f:b0:76f:8c6:a537 with SMTP id i15-20020a05620a0a0f00b0076f08c6a537mr14581876qka.77.1698884956869;
        Wed, 01 Nov 2023 17:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884956; cv=none;
        d=google.com; s=arc-20160816;
        b=0OQoeyOgp1gAiyCa40+Rb/hMZOHVgN2xv9D+eFMbkJ4mYwixcDlNWwIwQSIqB0pgZx
         C/aY8pIh98f45DFgjziNwLcep1d/Zb6zevbnRkooS2E0t7PUO1PW71v9X5L6CZ2329Q6
         ZLV+IxzcY2biZPj78RpOwd/MgT5ajmEcnU9/JGRRPybbh6pNGkJiOdSgKp+ZEc4JxBxn
         4yeiV4hgi2bbuG9NmJOew5C0/PtpeU4iOmzJIEU13rug9w7qZlMLxTaKsp/hoRXPT4E1
         6B/8ML6hbNz8PN9BrYsZJ/NzyqmnhDl3nSMSY9oBuw4Hm6Ae6Y4ki6fZH4pJWZQ8UZmI
         HUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NG4l7M/u9/WyzrO08pSmnsDPe4duXfZE4Di8keMpnyc=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=0f50neeLgdIz8LzoGL9IPPpOKFvNfld33vu6v+PQnvxIIxRFxEhTOS/gmg+5DGkmUN
         cdtXte/WxKeqo/HdLEAu8jmWlVVRGhGUhQlSfYaIMCy2ES+R5phNTNLObr301tMv0SMn
         1pit2JCC6YExYEd4v2PrCKdc8ISw+WeyeW1wQJP8U2sqGu/niSdN7xVUom8RZ3rwqItI
         H75y72bYmzxylc0z9OkQ+hcqAnWBIbKxaWMOMfAOwkP2QSbIYpvL/qR5F15QTcP8fXMn
         4wL16TRVRUpDCakUqO+VNUkBcyBHdjVixxhuKdbxvRJrBsPlu7ZHWUL03GZJxhl5layj
         C0Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e49T1P2v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rj8-20020a05620a8fc800b0076d81c85ecesi3243897qkn.723.2023.11.01.17.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e49T1P2v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyLZL-0003Tf-EK; Wed, 01 Nov 2023 20:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLYv-0002qz-Kj
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLYu-0000nD-7F
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NG4l7M/u9/WyzrO08pSmnsDPe4duXfZE4Di8keMpnyc=;
 b=e49T1P2v5qDywec/CKw/K8a+/x+6PAGMU3EVr00SXDpSEitt6lcGkgFXJEf8gZFbx7yZc9
 ymGmf03LsgUaryMeDKLUm6NUNxmeqgbPVkU1WIdJ2R6TJRDfqFj6oAb5XxfVCG8Qe7VJHv
 XaWPAFqxpEuhhL/iRXgQpVjQ/B82Kdk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-lD8CWVIoOzqaHwkY-JdZaQ-1; Wed,
 01 Nov 2023 20:27:48 -0400
X-MC-Unique: lD8CWVIoOzqaHwkY-JdZaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53AAB1C05AA7;
 Thu,  2 Nov 2023 00:27:46 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 231A0C1290F;
 Thu,  2 Nov 2023 00:27:31 +0000 (UTC)
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
Subject: [PATCH v4 08/33] target/cris: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:35 +1000
Message-ID: <20231102002500.1750692-9-gshan@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NKu00Y2wsIQF

For target/cris, the registered CPU type name is always the combination
of the CPU model name and suffix. Use cpu_model_from_type() to show the
CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/cris/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a5083a0077..73fe1510f1 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -119,11 +119,10 @@ static void cris_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     const char *typename = object_class_get_name(oc);
-    char *name;
+    char *model = cpu_model_from_type(typename);
 
-    name = g_strndup(typename, strlen(typename) - strlen(CRIS_CPU_TYPE_SUFFIX));
-    qemu_printf("  %s\n", name);
-    g_free(name);
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void cris_cpu_list(void)
-- 
2.41.0

