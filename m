Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60981eja;
        Wed, 1 Nov 2023 17:29:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwIZFwLuLfD5W3CB6XOtveMqMfz3Pa2UdO/BAta1bt/tpDv2P3jTdHrIKbO5ZN9NrZSlAH
X-Received: by 2002:a05:620a:430f:b0:77a:5112:c1f8 with SMTP id u15-20020a05620a430f00b0077a5112c1f8mr3108886qko.57.1698884972743;
        Wed, 01 Nov 2023 17:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884972; cv=none;
        d=google.com; s=arc-20160816;
        b=FPyKygTNnXDhOgSl/qEZdTAtLVpVZwoTxVhDUAxT0kGhj7Ps3J/o6v1xPmHU1a4tDT
         sY4iyNXhKhwRWqpj81CTmCH3/BMWJc7DMBcscOil3RYcl3iCxiNN9GiphFbBvHn/6vjv
         BA+cfO4IPGdg0P3e7tVWEG4yjPDyKUD2NREmkXp5qZmn+INLGyv3KMscXE3FEjuquqwX
         x5P7xv8+YgS+lKr0aRd9A5wF97SwAGZVVfp/XpO9DOMAAJ6OeZI0Kp+NasA4KjR9aQy4
         oMJKymz/OVinMBwQ/hrJ4lY5S8EOrtOUHQ9K8zISqzHSKqEitS4V2+dfr5AzZFpe68ut
         47jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PrUX3yxd9o5Wuqpgcczi/QtyifvLap04IdKHsDXgIqc=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=ikCqIOg2bVDFHuihOx8IhKP+5c5XF3z8lgze1J26s3ahS3avO7C2j/m7h/hSXUSjmk
         xltoNAb4q7q/VNeFpWIrVr5sFitD2vj2cCF4VRMph1e53rzdjrfcAVzQxqs0M5gRAo1h
         fO/X/nfmy4O3+phBgeel8mbrJ5sVbglwUxycOcwGPOlHfYkWi1RmJhqThLen9bDbKbSR
         lYvDyFlImgZJ35LhcSZrLayD80lsVlkYPFOrj0+sAfFxT8N/mFoWlG6u0EPSBowKQvFK
         o2874EWDPM3oPXlOElo5pGY42vgMrI5DoVhEWrRiNcSLabPG/641lEvaUo+ezr2CADS9
         HRtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JF+qjOCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a05620a294600b007743391acf0si3418859qkp.324.2023.11.01.17.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JF+qjOCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyLZV-0003fy-11; Wed, 01 Nov 2023 20:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZM-0003XL-5t
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZ7-0000ot-TX
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrUX3yxd9o5Wuqpgcczi/QtyifvLap04IdKHsDXgIqc=;
 b=JF+qjOCmBH84Afi7RqdL91Z0zbCpshlL0nSe9/z/nS0ncbFenrMd1Rucji75xH77gKDNyG
 d51j6+XqKlGtIunJjfD0AteRwAa8sGteRWBq2cPc26Sq/6CLcuOEsPn3FMYJiU3pOwj2b9
 0OxAE923KRkmKWh3fZOuWUNfDELQL6o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-S1PvUwghNU62hutWkqrH-Q-1; Wed, 01 Nov 2023 20:28:03 -0400
X-MC-Unique: S1PvUwghNU62hutWkqrH-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3151B85A58A;
 Thu,  2 Nov 2023 00:28:01 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C3BC1290F;
 Thu,  2 Nov 2023 00:27:46 +0000 (UTC)
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
Subject: [PATCH v4 09/33] target/hexagon: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:36 +1000
Message-ID: <20231102002500.1750692-10-gshan@redhat.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: lIoyUicLeIpR

For target/hexagon, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/hexagon/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index aa48f5fe89..cfff005a1a 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -34,13 +34,11 @@ static void hexagon_v73_cpu_init(Object *obj) { }
 
 static void hexagon_cpu_list_entry(gpointer data, gpointer user_data)
 {
-    ObjectClass *oc = data;
-    char *name = g_strdup(object_class_get_name(oc));
-    if (g_str_has_suffix(name, HEXAGON_CPU_TYPE_SUFFIX)) {
-        name[strlen(name) - strlen(HEXAGON_CPU_TYPE_SUFFIX)] = '\0';
-    }
-    qemu_printf("  %s\n", name);
-    g_free(name);
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void hexagon_cpu_list(void)
-- 
2.41.0

