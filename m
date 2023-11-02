Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp62183eja;
        Wed, 1 Nov 2023 17:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuGddLe6MtcA+JwGyBdZ1bVDECGSbNJRW6o55Uz4A+EqYzk4UmePcYRT+hRNfNZ4XEA1Sa
X-Received: by 2002:a05:6808:20d:b0:3ae:5bf5:4ad1 with SMTP id l13-20020a056808020d00b003ae5bf54ad1mr17851446oie.33.1698885143711;
        Wed, 01 Nov 2023 17:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885143; cv=none;
        d=google.com; s=arc-20160816;
        b=EpXPs+Zxdsrt7ETYCRS3N9REuF61zeVGWNnLo96Rb0Mr/qW/Wj85nroSb+h18QkSoq
         utYA8XT8IwkCr+lfkqk5ISG6bpZih18kQCtYXIC0iaADPYDuwHDcRJA5LhZgdXIuf+kQ
         cUd5TR0og4TTpGD3mlvYo6VTD4I/75a3J/h9nHkghqM+xzj3dFyh+IIxiqJlybUW1mIm
         J9eYTDFHqr2qHRONUiquDkqDwnf1M+bukFLqPcnYwX20Rv1PcNSZ6nHYvybhfwTWsvFU
         +FpXXLfIkyT+iFvoNbnS7BY4u2a1cL9pk9zCw4AzoSshSRir1Ya97PXh2KyOOe08jCTV
         7yMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9yEhfedIftzYHf+/qVLvl0JzCFBaihUYL/GVfXy2nYE=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=mempbSgY6pIEVdxB6KVCeUmBu388a4Ri1j3ql1C1uoGFF0CAvAlSHO6SFsGA9XJboF
         n4fXcElXGdPmQSdrO4UJxCJv6hQty9rykWD4JqxeMV1YdI1u8UZpw9A9fHfZV2jBMclm
         3P4P+UwR+9oYFSV6twfts5gyUiFUdxVJSzxozz4FKeVKtyt/2ZVlf25Akcn6tDHH03Nw
         Dn86i2AFB3P8GwRWsaVviTfnOakMHlRsQOFWvjE2wVPal/hPwJvnY+6MMv8mCqJLX1gw
         2mmOELK3qA5qFp+jbF6bjZQ1mqTulTQ+x3R1sDOJn6/t7qZDRaFbPbRbQlfOu/f6Ugnc
         iGsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a0ceb45000000b0066d10dd4de3si3544450qvq.563.2023.11.01.17.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLcc-0000Tm-S5; Wed, 01 Nov 2023 20:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLcA-0008KP-0b
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLby-0002U3-Pa
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:31:13 -0400
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-XAAj7mhXM_yOBMU9Rmpr2A-1; Wed,
 01 Nov 2023 20:30:54 -0400
X-MC-Unique: XAAj7mhXM_yOBMU9Rmpr2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4F5C28211A5;
 Thu,  2 Nov 2023 00:30:51 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A38C1290F;
 Thu,  2 Nov 2023 00:30:35 +0000 (UTC)
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
Subject: [PATCH v4 20/33] target/tricore: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:47 +1000
Message-ID: <20231102002500.1750692-21-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: 0CEMA2E7bITd

For target/tricore, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 7e5da3cb23..1b5fbd4ab0 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -98,14 +98,11 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 static void tricore_cpu_list_entry(gpointer data, gpointer user_data)
 {
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_TRICORE_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void tricore_cpu_list(void)
-- 
2.41.0

