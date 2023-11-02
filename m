Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp61573eja;
        Wed, 1 Nov 2023 17:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6NLnx+77FS/ID525NWmEaDVRudj9UOsH+VHQk6GH7o1YPgbNiwy+4cpHZxaTX/WrXkkEI
X-Received: by 2002:a81:4325:0:b0:5a7:fbd5:8b3 with SMTP id q37-20020a814325000000b005a7fbd508b3mr17066142ywa.10.1698885052247;
        Wed, 01 Nov 2023 17:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885052; cv=none;
        d=google.com; s=arc-20160816;
        b=qJ2rEO8PPzKVMFrv8jGO7kmrgJDo7jYBHMS5B5o2mecOws64AbLup3adhDO94rhWWu
         t358f+Tr5ITXwaRjgnHDZ61+WKnkB2mX9NeAiL66sfAHirKxv3IlDPeZYLuydulnMZas
         60kDpz/lUSuQKfq6riuRGuzKbCYEi7YcVt88iHgW81qnHVssYkjCa57Erh4o82hj+Y6o
         5vcpFABk4OJ4oQAHW/EC5OIkVpaF8JHuGLh5bu4Qaw5jMe7oAPgJvgBfcskvkO5VFB9n
         dO92OjBwpBBXtIwm1HxOTFDk5SvqCQBBUhmTMDoO6OeFii+trOwyzuV6BAtq8wtI25Ox
         dsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WqLqSk1wiAthy2gXtrmraFvdCe60TD/TyhPUOBASNy4=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=XoLbBa07BRozlMpSSPGqwv8UC56FTOiPmJSiYK4mzWjeGFopted02JNA8RIr1jEQmF
         bLWxkf5wXiSz1KA50GLqhK0g0Zn2C2TG5eSgQRgbYF4KvDqf3uBEsRH+a3aDuxJmjiUe
         KiqtKTCtm4V3PK76HQll++yzQZ6Vp0vAG/VXJCJdjhCMQEmmTCRkNiG1IP9QKROj48Jw
         DqAlfKP/eCj81uknxQKETUQOYRUR1JEIaohAOxTNg7eCsH9P9O5cO62D+hQlErwBw0rR
         yGlCWHpJLx6apcXUgW1LsmfofR60ltSns8gU0ZoDM3M0ietc4dJPJKlYm5KZuYX2dJFA
         UY6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3aLT6PL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020ae9e216000000b007770d8ed700si3434410qkc.460.2023.11.01.17.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3aLT6PL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLaZ-000625-MF; Wed, 01 Nov 2023 20:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLaW-0005nb-Tj
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLaU-00011g-4X
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqLqSk1wiAthy2gXtrmraFvdCe60TD/TyhPUOBASNy4=;
 b=X3aLT6PLOuGJ2QaIPMVGHHqsa8spVSeV+BGd+Lpw/QkluI9SpzmMwYC8VZ2YbMRQeQ7QGx
 gcOzE4XkdmFBmvelb9wNPK3BiupD1JsHGX9O+g5jwTpUGVaCMbgFNTgfBy5aaHyQEBoNZI
 K2g9OLO4OeohKMiTL/MWdiklSi9F+xQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-5_IV1gWoMAKuZaq5wh8EGQ-1; Wed,
 01 Nov 2023 20:29:21 -0400
X-MC-Unique: 5_IV1gWoMAKuZaq5wh8EGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3204E3C0F660;
 Thu,  2 Nov 2023 00:29:19 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80FC4C1290F;
 Thu,  2 Nov 2023 00:29:04 +0000 (UTC)
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
Subject: [PATCH v4 14/33] target/openrisc: Use generic helper to show CPU
 model names
Date: Thu,  2 Nov 2023 10:24:41 +1000
Message-ID: <20231102002500.1750692-15-gshan@redhat.com>
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
X-TUID: RTJgw3bDf3Gj

For target/openrisc, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/openrisc/cpu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index f7d53c592a..701aa62293 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -273,15 +273,11 @@ static gint openrisc_cpu_list_compare(gconstpointer a, gconstpointer b)
 
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

