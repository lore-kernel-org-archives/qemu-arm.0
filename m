Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp60963eja;
        Wed, 1 Nov 2023 17:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/BAT03EqETdM5n0Pos32av6rNZiWK/MXv2OiB7XLxLP5J+8ZQ1AEjhT8p0PSN73lM9i7c
X-Received: by 2002:a05:622a:87:b0:41c:b458:e95 with SMTP id o7-20020a05622a008700b0041cb4580e95mr21477509qtw.19.1698884968842;
        Wed, 01 Nov 2023 17:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698884968; cv=none;
        d=google.com; s=arc-20160816;
        b=m4ydBBkpahyf1uHWOvvOY7xi1syhnRP0i++/Pma4C7ClpV3MJNOF9voA9ofxu6HKTo
         UKBHj9KKg7zxfKnIbbAxNb42W2JkJRKIwghlk1UnHYdnYtp2BxJKzb+8VPFpyx29KWZW
         1mG2WHMgPz70b1prd8qmDffd0vowisVg+/dVkpJNEPkIHlUuba0ST9fOUts3XNRIoobK
         AhzWPZIJRs17SYUC6LrdAQatd6YZzRbN+8/ES+D8BJpLphWdSHrL3iBqcjzfZn9y/X/e
         vP5CmjODN08D1cO6Fsj4aa+Wtv5xH6hyExEycMd0LWUsgg+sF8ypn1i7UNsODSkV1cAh
         3Wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VPhNran2hoBlFXd40/qPL20xEjS68JH/z9aQRfZaeHE=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=byy/oTv23pJUmeFFQ/p4OlQpeZYsjYKse3lngOCfsOW6L1tHTx5qOXGy8iJKx+6aYL
         9AtdtA7DHbKLGucs/JUabUSqutgJndP4NorOF53S7BY4bnOCKxWOTWQ60OXsgZWMalN+
         EWb7gjnsey7xu027Oiej2SKbhnoolL+dBb2nPRp7eY7h8wIWGxA2q9yGRyOlaxt8kFqW
         2gpc1H+plMHP0HCKJGuK4y4Bf8Km4H10eHLfYAUgRfILaoENXlShZcK3HiapY44e2TDP
         nbmCB29iKiV2KNKWHxcJDBSd8BR2ZnkCdoQ6a83bBjo0hiTUL0UtvAShYfVeSSitjI/H
         vuNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T15FWiOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020ac87d41000000b00418128987a9si3503480qtb.319.2023.11.01.17.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T15FWiOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLa1-0004AZ-O3; Wed, 01 Nov 2023 20:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZP-0003ae-2k
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZN-0000rH-Dt
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPhNran2hoBlFXd40/qPL20xEjS68JH/z9aQRfZaeHE=;
 b=T15FWiOWnR9nTNpBJs+NrVB4cjPhlwQ/itufbF8/LmghOnYo1ublgDL8jX9sEGr3Gyeu04
 KFvCecSesYsj8pTS8sN2eGbeyskmbqmm/NZAkU2y8CbEGzBxJbZ42xB4+cpSx7tlQypdUk
 T5BaR75OK2L49haZU6SL7tjEdIA6PiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-QojiIemmMm2So50hgj4d9w-1; Wed, 01 Nov 2023 20:28:18 -0400
X-MC-Unique: QojiIemmMm2So50hgj4d9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4590D185A781;
 Thu,  2 Nov 2023 00:28:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B786AC1290F;
 Thu,  2 Nov 2023 00:28:01 +0000 (UTC)
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
Subject: [PATCH v4 10/33] target/i386: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:37 +1000
Message-ID: <20231102002500.1750692-11-gshan@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3QKVqWreqJz6

For target/i386, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to convert the CPU type name to the CPU model name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/i386/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fc8484cb5e..f77149ed25 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1744,8 +1744,7 @@ static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
 {
     const char *class_name = object_class_get_name(OBJECT_CLASS(cc));
     assert(g_str_has_suffix(class_name, X86_CPU_TYPE_SUFFIX));
-    return g_strndup(class_name,
-                     strlen(class_name) - strlen(X86_CPU_TYPE_SUFFIX));
+    return cpu_model_from_type(class_name);
 }
 
 typedef struct X86CPUVersionDefinition {
@@ -5547,7 +5546,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     X86CPUClass *cc = X86_CPU_CLASS(oc);
-    g_autofree char *name = x86_cpu_class_get_model_name(cc);
+    g_autofree char *model = x86_cpu_class_get_model_name(cc);
     g_autofree char *desc = g_strdup(cc->model_description);
     g_autofree char *alias_of = x86_cpu_class_get_alias_of(cc);
     g_autofree char *model_id = x86_cpu_class_get_model_id(cc);
@@ -5571,7 +5570,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s (deprecated)", olddesc);
     }
 
-    qemu_printf("x86 %-20s  %s\n", name, desc);
+    qemu_printf("x86 %-20s  %s\n", model, desc);
 }
 
 /* list available CPU models and flags */
-- 
2.41.0

