Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3153119ejb;
        Wed, 6 Sep 2023 17:39:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIrKr3/yx0bpLcok4YDNHGmVz0JaE7aj6qKRfXJ4GMEIjq33iEKh6D0RaiZcMYyuCVaS8Z
X-Received: by 2002:a0c:8e4d:0:b0:63f:7aef:84e8 with SMTP id w13-20020a0c8e4d000000b0063f7aef84e8mr15503256qvb.30.1694047191646;
        Wed, 06 Sep 2023 17:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047191; cv=none;
        d=google.com; s=arc-20160816;
        b=vyN7A79aFd5dS/zCRdsnNlP+UJfj6CpUU1WH5sc3vJmD+Kz/8O5WdLY31gwBKS4dYl
         MZOgkxeVS6YKJh0zapxZhaur3Xfk3CMYSI1SSiTUfbpyPzRHI9WYMyW+ZWOw4UCeCcB8
         K2BtnWSys4eujfq/bS2nckHBkYamvdSCEBDzgXlcMH/FZ6VtuKDPTFgMjk+F6K9shQ2K
         /0APQoTEAn1BVA7Y0yFfXlDsz+14Ttll24ClyzrSfGRMSmVmRHtOLq/rjaZXWU5p5ghM
         jziioYbG0Jzi/Njzmi1G31qTbMdBLSqMgCNCbmy8qWubAKZoAaWnDnYpM0KlrLyJ+mWF
         AxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K2GBs/M5HfEmFWIyUfMrNHUzGd8eTYl4spuDqOZ/tXg=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=0wnOTRiqT9pP6g6fNovUCPDNJakfpEsreSwMQz689155NcFdrBh9wi4XpnKoUe2xFq
         xeGfUn049YmjWB7uk+UisBqY0C0o+d3dhTYvKbbZ3tBNp0JIi/H/J5yDNwPnPrLhKB38
         nufYPC0wmI1UDcsaXX17hIGe9yarDuTF6XudEXS9tiBKPAApawoLDM3UUy5jYfl3Yuqm
         ZuMzrsZ5obQkBlfzzhvKfdVftbqIKEr8IrUzA6jY1olNJjgun09dE8Xm5f5l2f7khqhk
         mqnOTG55MGhPSxaKf2jyhgNUN8Ovx119u3VeKm62rpvJMa6ry4Oeq/dxHjYLinH1zRQs
         yqyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dWaw/BVh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05620a431200b0076ca246d4easi11222891qko.612.2023.09.06.17.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dWaw/BVh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe33l-00034F-0Z; Wed, 06 Sep 2023 20:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33j-0002sy-Hf
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33g-0001FS-0c
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2GBs/M5HfEmFWIyUfMrNHUzGd8eTYl4spuDqOZ/tXg=;
 b=dWaw/BVhX3YDI78yu5aYUaol3Sx42Y0iUPKs4pRe+4ds67TjS7eSgMKVcQRHB12SETDszW
 cMnkagDWgJy28D0riX88JuUORIe1obDQcL4iM1Jud+pObA3YWsh+TaqLmpBrKpsZKQQhNz
 HqUNlbxdG0dPRC3xL/IgmsUVjoKlArQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-tLJKhpIrNHaFMGa9v1BMEw-1; Wed, 06 Sep 2023 20:39:38 -0400
X-MC-Unique: tLJKhpIrNHaFMGa9v1BMEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD7401C0514E;
 Thu,  7 Sep 2023 00:39:36 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20AEBC03295;
 Thu,  7 Sep 2023 00:39:21 +0000 (UTC)
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
Subject: [PATCH v3 11/32] target/openrisc: Use generic helper to show CPU
 model names
Date: Thu,  7 Sep 2023 10:35:32 +1000
Message-ID: <20230907003553.1636896-12-gshan@redhat.com>
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
X-TUID: lYOgneAzfMe5

For target/openrisc, the CPU type name is always the combination of
the CPU model name and suffix. The CPU model names have been correctly
shown in openrisc_cpu_list_entry().

Use generic helper cpu_model_from_type() to show the CPU model names
in openrisc_cpu_list_entry(), and @name is renamed to @model since it
points to the CPU model name instead of the CPU type name. Besides,
openrisc_cpu_class_by_name() is simplified since the condtion of
'@oc == NULL' has been covered by object_class_dynamic_cast().

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/openrisc/cpu.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 61d748cfdc..2284c0187b 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -168,11 +168,12 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU) ||
-                       object_class_is_abstract(oc))) {
-        return NULL;
+    if (object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
     }
-    return oc;
+
+    return NULL;
 }
 
 static void or1200_initfn(Object *obj)
@@ -280,15 +281,11 @@ static gint openrisc_cpu_list_compare(gconstpointer a, gconstpointer b)
 
 static void openrisc_cpu_list_entry(gpointer data, gpointer user_data)
 {
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename,
-                     strlen(typename) - strlen("-" TYPE_OPENRISC_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void cpu_openrisc_list(void)
-- 
2.41.0

