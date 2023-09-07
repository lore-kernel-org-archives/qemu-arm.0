Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3152975ejb;
        Wed, 6 Sep 2023 17:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvtBIGPqnaN6JZoylKCZ+xVeBHZLldBd6h4pXDerXG9rgqF9jS3cunlydjGW8fEU8kAxrz
X-Received: by 2002:a0c:e484:0:b0:63d:4a2:701 with SMTP id n4-20020a0ce484000000b0063d04a20701mr17823130qvl.43.1694047171772;
        Wed, 06 Sep 2023 17:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047171; cv=none;
        d=google.com; s=arc-20160816;
        b=VLF33B86CYnStgbDvUxnAb6es0PHvLAzxS20SSWeJY0Zfwv99UNurbzV7inR70eaOK
         sxs47T40GenDwELtcT5iO5J50zAwzAsvNWbFhJvtOw6S0zdlxF0BMNsrrSkObnJGW/PQ
         faHhu7V3Rv2OKIVTQMKqFY+GqECzitxpm+cj/78qU886cQh7CkR8zlrZ2Ms7RATVoE2o
         CENaNsd/mUZAeqkni/1pqtsUhmjcTgZU3afcFAxUYKS3ZK8Pysv26V5StHHW3S7EYDD+
         fv616RBukrB9AFOMJodZ6O/6JoKu9wCjpgUXNddgkwerQg0O8QxiLM2wH2w4Ac2HL9dk
         qX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Q/acPo2WpP1KKZh1ORsDt2pDzxml7Uel/L7XnDr8X8=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=s4Gf6jzkSmm1xrZ9qmsCf9q8nj3ft/jyY8CQXpVHywMUgZRYiu69DBtdA4qrn/WISB
         4TV7uFEyZFXHXeU+zrJLjhZyHzPi13MuMTa2d7tjxqiQoEcXL3fprFAbUfMpeCKdZRJm
         mhOa/t5iqVKNXvwpB2ENceBAe9RGtltL5+nvzMu6L5QwlCaEwp0xPyHcqef5t4aXcGWU
         oT/V7v45QOghYfuZ2R7sabMJ/QrdnE1OCiL4XKJKZQqhl/Fye1rt8pJ7CvTVlsz0y7Aq
         x+shya1QTeEOukyD/yb1kvIw3dImXUCuR3ClIPYfoORm+Dk0jrM3deqmSB6l4BZMRNXV
         Rbvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q2FiVAri;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a0ccb85000000b00655baca89fesi309831qvk.70.2023.09.06.17.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q2FiVAri;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qe33J-0001GY-GU; Wed, 06 Sep 2023 20:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33I-00016p-0W
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33E-0001AZ-MC
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Q/acPo2WpP1KKZh1ORsDt2pDzxml7Uel/L7XnDr8X8=;
 b=Q2FiVAriRCTUaWQ5zYDrnbqdutU2efT0WrRDkYvw/eCyGSFoZihUni6GO6b1usORQsivd+
 G+62u/4eSw7+yYlsuObny39Btsg9NW81JmUfJYMJaHS2ZtJnv38TyKAtLI2CjqraxMtNWV
 XcjYPmDLznaJQB92Gi5aKZJph5qdGVs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-gqwscCGhPY-AxU8e7iB5eg-1; Wed, 06 Sep 2023 20:39:08 -0400
X-MC-Unique: gqwscCGhPY-AxU8e7iB5eg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57ED938149AD;
 Thu,  7 Sep 2023 00:39:06 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 956C9C03295;
 Thu,  7 Sep 2023 00:38:51 +0000 (UTC)
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
Subject: [PATCH v3 09/32] target/m68k: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:30 +1000
Message-ID: <20230907003553.1636896-10-gshan@redhat.com>
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
X-TUID: et3UUeJAzTgH

For target/m68k, the CPU type name is always the combination of the
CPU model name and suffix. The CPU model names have been shown
correctly in m68k_cpu_list_entry().

Use generic helper cpu_model_from_type() to show the CPU model name
in m68k_cpu_list_entry(), rename @name to @model since it's for the
CPU model name instead of the CPU type name, and adjusted output
format to match with other targets.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/m68k/helper.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0a1544cd68..47f2cee69a 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -49,14 +49,11 @@ static gint m68k_cpu_list_compare(gconstpointer a, gconstpointer b)
 
 static void m68k_cpu_list_entry(gpointer data, gpointer user_data)
 {
-    ObjectClass *c = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(c);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_M68K_CPU));
-    qemu_printf("%s\n", name);
-    g_free(name);
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void m68k_cpu_list(void)
@@ -65,6 +62,7 @@ void m68k_cpu_list(void)
 
     list = object_class_get_list(TYPE_M68K_CPU, false);
     list = g_slist_sort(list, m68k_cpu_list_compare);
+    qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, m68k_cpu_list_entry, NULL);
     g_slist_free(list);
 }
-- 
2.41.0

