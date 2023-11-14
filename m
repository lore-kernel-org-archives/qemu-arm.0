Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2408844ejc;
        Tue, 14 Nov 2023 15:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzaSElxFO5Yh3Lr3Sn/LPljgu8D8tDJBkUebC/HVAW1KR0N8OQfOrDgh6fyJj0e67iDlN5
X-Received: by 2002:ad4:5e89:0:b0:672:20c0:ac08 with SMTP id jl9-20020ad45e89000000b0067220c0ac08mr5449832qvb.48.1700006369502;
        Tue, 14 Nov 2023 15:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006369; cv=none;
        d=google.com; s=arc-20160816;
        b=0iqWLVL38UuCapC6ts/TUgeStoObyqLrhkO3C6oaHcXa64RV9LKJiYDcIf1oIou8oC
         1RxxjPhwpvwmYlnqjYSASDBkWD5SiS2eCekzUwiEgtp5VFgB/1AZSsH2sBC8Ob/ZFu2V
         kVhaNbrszd56eJpqkh+AHs/VnzLjc5VhHocR5vabIfzhU39NPtiY/yykvLtKY6eZZd7Y
         Vk53HqhYM/NTsj/fIVnyg0NmgExC7fvQ3GXhjY0ZzkxmvaogP6K2WYowFwa0SxPj7rhU
         SGk+Z9oryvFutUh8YWoqIPcZE5w4lalxNhmRgwGiEn1aOXifXSbJtAM7b8Z3FJ+qutkb
         FKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QuIlhQ4KqP9zKV8N3fh8DvNGlPVM+LKKlti80et+O0Y=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=iPoASMXoCyKsn8VDMjMxOQzoqEClPUzX+7nvFO4BMxyPjqb12FP0P7hpoVOOvuD8Al
         qalzhxfWEkBFkaCYCo4qn//YSu/IXnbyjB1oEEijoRAwE21ylnk8tdnSzMPb0NBBN9xi
         9iSaIObKDI3fPJa1ZmhoGmjZoNhIATAMX2mTFnDQNwmbOPBFXRhkj7QG/teKt/wYtWcE
         plVt+aLkIBZ+QDsQ9kM5bQUlA8WguxBCy3Pt9gpYdDhvOpE1ooBF7gq9Aqcl2ANaQ2br
         T4qbhfdCXUbMLXOdGKh33vRRIGfpGyN9ygpPjcYG040ghBnNE+wBC96gRmXnYWV5dbBK
         IbDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZqrIiOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020a0cf951000000b0066d09046052si8054857qvo.103.2023.11.14.15.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 15:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZqrIiOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33IH-0008TL-1s; Tue, 14 Nov 2023 18:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33IE-0008Rn-Vj
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33IB-0006y7-De
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QuIlhQ4KqP9zKV8N3fh8DvNGlPVM+LKKlti80et+O0Y=;
 b=GZqrIiOwoyPkuSK2HFm+vmmmr3Nwyq7A7nwRTzbIS75LDf+NEeNgJt9owukmO7YEhIY3lo
 1C+ldSVDxx9uh0iwRMgdC8Re8mddR6gjZ8S1dXJOwFUQCsOte4xuW5ZCVGeyKJb1JBO5Sz
 JXrJi/rjHq1bRU/1jm9S4mEObElC51s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-RBWyKqI1NPugH_yIiXKyGw-1; Tue,
 14 Nov 2023 18:57:56 -0500
X-MC-Unique: RBWyKqI1NPugH_yIiXKyGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76A8229ABA01;
 Tue, 14 Nov 2023 23:57:53 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFCBC15885;
 Tue, 14 Nov 2023 23:57:39 +0000 (UTC)
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
Subject: [PATCH v5 04/31] target: Remove 'oc == NULL' check
Date: Wed, 15 Nov 2023 09:56:01 +1000
Message-ID: <20231114235628.534334-5-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: GI9w6D83fXs1

No need to have 'oc == NULL' since object_class_dynamic_cast()
covers it. Besides, we don't expect an abstrat CPU class returned
from CPUClass::cpu_class_by_name() in the middle on alpha and rx.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/alpha/cpu.c | 3 ++-
 target/rx/cpu.c    | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 83345c5c7d..c19257d765 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -126,7 +126,8 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     int i;
 
     oc = object_class_by_name(cpu_model);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) != NULL) {
+    if (object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) &&
+        !object_class_is_abstract(oc)) {
         return oc;
     }
 
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 9cc9d9d15e..dd5561c8eb 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -111,9 +111,11 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
     char *typename;
 
     oc = object_class_by_name(cpu_model);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL) {
+    if (object_class_dynamic_cast(oc, TYPE_RX_CPU) &&
+        !object_class_is_abstract(oc)) {
         return oc;
     }
+
     typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-- 
2.41.0

