Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60991eja;
        Wed, 1 Nov 2023 17:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU3rvsFTbQshOno3G5dSPsmhjDH0GHrw1tdV+YVfJ+wIHQOJGvJQx/2bzbyJTzQLjRw64f
X-Received: by 2002:a05:6214:2aad:b0:659:e547:ca72 with SMTP id js13-20020a0562142aad00b00659e547ca72mr21009554qvb.40.1698884973841;
        Wed, 01 Nov 2023 17:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884973; cv=none;
        d=google.com; s=arc-20160816;
        b=pF1GBvlzau9FP7wcoAVG0rrPMiolaPySqQ8TlPBl+dhKxeRBJ7fdh6bBxubj9aqcdH
         ZnnfHGMRkIVOOkY51JEdFObPXm77GcWuL1NKGrU7CCMz4WgaA50fedwUM+r6XDq1P53d
         Z3bCHovtVX8/YYw0pp8calk9QUfgpkdFzW4yidb0cDvtlZwGE8C3CxbSbjvB+0i7TLgf
         /OEP70lyilxdCSv87adAotE7HYl0iV2sqIq12PcEOrSCLeSgTvaUMxNIjbgDuChOBF2x
         k0GdchEANT/6CzUy2GOfbW4kxAG/czdh3mbGeTUQpbfuHMCUWCq+J3Nem6uwXOKUlRuN
         ZiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OC1d58jd9vw7FWm5+m+uWaccwd9dDLTDogObjDndsL8=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=FWWZD3xpRKkQ+v3+op1Vn6QLqMoEwlpgDXJTX8eTuQ45TSdgfJtMvq7LQVJnhStTl9
         7OuZ67y7BpH/TVjHD8BGq6zQ5VZTRpbJ7HTzOX8RO4uDSJcPD6ucLkYvUHj8LE8Ui2LK
         HtjxR8iQ1pO89OnDb5QIbbbWuzWqKK/XCZF3Lh8GwJUqQRxd4sOIV/7+N46H/iGAeAgt
         UsC3544Vl7fdYM6EnOmZRnKXOkk8ExuX+dfYJ7hN+N6HC3B67Kqbhn/Bbm8HDaBFHz+5
         TCmejhHK4tV5qrllhNm0KTKYdd2W6FcHNPv0MEYH+bHCZvOj715Qci7qPI35wYOvOodg
         aadg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avh7iyvc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk11-20020a056214092b00b00670f3d950e0si3478091qvb.591.2023.11.01.17.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avh7iyvc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyLaK-0005HM-K2; Wed, 01 Nov 2023 20:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLa5-0004G3-Vh
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLa1-0000xa-5n
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OC1d58jd9vw7FWm5+m+uWaccwd9dDLTDogObjDndsL8=;
 b=avh7iyvc0lQPYzk0nHiwqRxGVJu2+zF6p1QjQ9+d4sh34/Vni3j5mor1YbV+S58IqeX5+3
 Lsr2SUnV4Go/z5GIv9Ev2s0BAeYqaCHnVz+tbj7RSjj0sTBfFzba2ZMMgAW6RS2jlfhLNy
 xAi1b//oO5QyMa7ZRPTkf9rOU2xyTNA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-dhTE4DibNIm1VBia0-XplA-1; Wed, 01 Nov 2023 20:28:51 -0400
X-MC-Unique: dhTE4DibNIm1VBia0-XplA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4784D812C33;
 Thu,  2 Nov 2023 00:28:49 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80AA6C1290F;
 Thu,  2 Nov 2023 00:28:31 +0000 (UTC)
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
Subject: [PATCH v4 12/33] target/m68k: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:39 +1000
Message-ID: <20231102002500.1750692-13-gshan@redhat.com>
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
X-TUID: ZsIrEREu55i4

For target/m68k, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

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

