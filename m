Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60819eja;
        Wed, 1 Nov 2023 17:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoHdWCcCL4V9W+LOPOB12uPKOApm8P5/XzWv+VLzXXzhMyACMfpMVBzVZhy/zbjF7Pdscv
X-Received: by 2002:a05:622a:118c:b0:419:5767:af55 with SMTP id m12-20020a05622a118c00b004195767af55mr24243865qtk.16.1698884946797;
        Wed, 01 Nov 2023 17:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884946; cv=none;
        d=google.com; s=arc-20160816;
        b=JM/Ei5xdnBArPgNtgf9TTjMN0ko77mQFRd2SXahbcocX1zAmtpPJP1fQ1RlLIl3l1D
         rv7rE05XqjuPusKD8MOCDjvu+4F4Bj7L62ornWJaZtEZt5qJGigeZlx7k782HYto+uwU
         bT+aJiSk3Rj+i9rGD6S4KyE3Ca9wO5uILeV0loCqEuuiOPvTGrcNLJTdJyXnmFBja54f
         nIc9pZXeicpqcnAVLP/6y8+GqSX73qdhXfp9A5DmXShqumKQ0YThuNIDVSDiyOUGsjwR
         HGcAVdTjMK5A6xvdypYwngknRGwWjuofgdEBzxG7ZzPfAv62KK2FYTAQuvbKT7YIqka7
         ZANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sPdz+RQvMGR9ddBCdVF1ZuNtbpuFevHnVZeomBplTUs=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=TBDUBCGD2fr22Yn8v7/nntwiFDQKvGRzThc8roxxH9CGzrOQuPvY54xKKl9hEBxqk5
         denZar4TaLCjzs9LptI+6/veBhMs745272pml4QXaBZs7UmgeC40O6wdgQj1Rx4DtKqY
         OxiIN3UajEJ5SCrEWyz9gAmZ/yqvsYOsD6AIbcyO7guNvwYTmICdKKKtYTguj/WBKarn
         EfF8xEapok8BD2j3PtqpB2olacIimdzwQSQuNcwxnBfxUd0RJZdMKKO+N9CM8nfhqFhz
         93mk4l+FxvIOVeU0D+EVq/pqxfMsOk4kg3Jf1bI1ZGliKRTMUXIyTlGXjEr9b8MigWUp
         k/jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HORSKFIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020a05622a034700b0041981d1c659si3761954qtw.579.2023.11.01.17.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HORSKFIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLYK-0001be-E2; Wed, 01 Nov 2023 20:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLYJ-0001Zt-DS
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:27:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLYH-0000Z0-Sh
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPdz+RQvMGR9ddBCdVF1ZuNtbpuFevHnVZeomBplTUs=;
 b=HORSKFIXKKEtntUpWr9HvdpgmSQkAkoO6Ozeh0ZkSRhLIKJ3TYLh20Rd1meJhA8wBbRQ83
 /46Y+wBz9tCG58e8c6FBQXs6uFFR3djYsaUu8tmOaGqfk5bxTzTmq1qjZS66bniORt973/
 T6NH0uQxB/jmX/nyO4Q7mTgOhZiSADg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-NWPrMAVtOCWw8mTnFDLfEw-1; Wed, 01 Nov 2023 20:27:03 -0400
X-MC-Unique: NWPrMAVtOCWw8mTnFDLfEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C6A185A781;
 Thu,  2 Nov 2023 00:27:01 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39EBBC1290F;
 Thu,  2 Nov 2023 00:26:46 +0000 (UTC)
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
Subject: [PATCH v4 05/33] target/alpha: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:32 +1000
Message-ID: <20231102002500.1750692-6-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: I65TLF4nW0uQ

For target/alpha, the registered CPU type name is always the combination
of the CPU model name and suffix. Use cpu_model_from_type() to show the
CPU model names instead of the CPU type names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/alpha/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 9436859c7b..d4b35434cd 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -89,9 +89,11 @@ static void alpha_cpu_realizefn(DeviceState *dev, Error **errp)
 
 static void alpha_cpu_list_entry(gpointer data, gpointer user_data)
 {
-    ObjectClass *oc = data;
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("  %s\n", object_class_get_name(oc));
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void alpha_cpu_list(void)
-- 
2.41.0

