Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp63057eja;
        Wed, 1 Nov 2023 17:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqMA+fChwwIabNJIafmZ9WnNhSefkgF9ZoHPbzVMlffKfKf1aCVv8CdQ3hKgv0UAaA1K00
X-Received: by 2002:ad4:5de7:0:b0:651:6349:fa7 with SMTP id jn7-20020ad45de7000000b0065163490fa7mr22413778qvb.25.1698885282487;
        Wed, 01 Nov 2023 17:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885282; cv=none;
        d=google.com; s=arc-20160816;
        b=sabiV1F6qm67uFgzl+Xr9oRzUYJeeb0fsc2jjA1RiXQsJvoA5HRZXOCQ0KKJuIUDYT
         /EU6V+Je0o5S0xfVIFNLFglpQ2qk2RuQQiiiSc6fyLzQOG5FDSj4hBN2TLrGjW7wK3VT
         YSYpOfMy/G+ptpD/29HPCzFKD5NDYXQZlGvgz3h/VbWkHvDa0kGQKX4p1/mFHG/S25Tl
         z64ONQsz78STu7D24ubGLJyRBKeIr79S4cGYD72Xw/T02KUJqanMc91pu8JjpnBAR+Ym
         OeMyaEF7S5LKpUKkyYhV99Xu010tgNR69wCqnX4jgEGBta6j4kpWSk7CjYRmL/cfXygf
         a/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B0JDuqsJdI9YJAZOWMXhbpWYHdgys1siLiQPKla5umw=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=K7/iTG8DYF89QPMShWS/5WK2/ahmkqV9UF8PuteI1S5ObdcDFpvGC7GT+7rmLZleK7
         I+4EszMcFh6TNibKmyL9k4BJcz/vPxvu7rQlBFtSCOmbkiWW6sXdoI9SWNn/JtwVq7JA
         jqhl4vRMTTtUgAk7/LNUyuEM7nPnPMlw68mITBcdwNRRZJwV8Yc4wwadT6VyfQPGoapS
         PvTAY0RI4y55Jz4wfDZKIWGD+vl/HYx8G7QA5qOMGDXS25G0AuDXpddje3wRPIex7u0C
         S3CE/npqTtkxsYbrf1diGu2QlIydtSxcX4FhP033/dc5HcKw/WZG3mW/VGvYCikg8vV9
         GdDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrTXNPI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dr11-20020a05621408eb00b0065efe331bebsi3526683qvb.364.2023.11.01.17.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrTXNPI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLeB-00058G-GF; Wed, 01 Nov 2023 20:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLe7-0004pD-1M
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:33:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLe2-0003NT-NZ
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0JDuqsJdI9YJAZOWMXhbpWYHdgys1siLiQPKla5umw=;
 b=ZrTXNPI9RrkNP6lctsUKIqfLFjRWNHijdYATd73GnY3aXfJDESNbj1glwbhdvXoQeYCUYf
 3rbie02t65th0Tn01gZ7l/KxYGA9twD+GfNFdaNhI62DApG4KMgHDQGrhaiqfV7g/kTqEr
 912X5WWmcnBbxibNIuYvowUSSNrmPTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-cfUejxJEOlqy20sc_zLucA-1; Wed, 01 Nov 2023 20:33:05 -0400
X-MC-Unique: cfUejxJEOlqy20sc_zLucA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4AEB85A58B;
 Thu,  2 Nov 2023 00:33:02 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9994CC0FE05;
 Thu,  2 Nov 2023 00:32:47 +0000 (UTC)
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
Subject: [PATCH v4 28/33] machine: Print CPU model name instead of CPU type
 name
Date: Thu,  2 Nov 2023 10:24:55 +1000
Message-ID: <20231102002500.1750692-29-gshan@redhat.com>
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
X-TUID: 4UHDjV9tZnBU

The names of supported CPU models instead of CPU types should be
printed when the user specified CPU type isn't supported, to be
consistent with the output from '-cpu ?'.

Correct the error messages to print CPU model names instead of CPU
type names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2d78692df1..1dd0f8831b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1391,6 +1391,7 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    char *model;
     int i;
 
     /*
@@ -1407,11 +1408,21 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
 
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              mc->valid_cpu_types[0]);
+            model = cpu_model_from_type(machine->cpu_type);
+            g_assert(model != NULL);
+            error_setg(errp, "Invalid CPU type: %s", model);
+            g_free(model);
+
+            model = cpu_model_from_type(mc->valid_cpu_types[0]);
+            g_assert(model != NULL);
+            error_append_hint(errp, "The valid types are: %s", model);
+            g_free(model);
+
             for (i = 1; mc->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+                model = cpu_model_from_type(mc->valid_cpu_types[i]);
+                g_assert(model != NULL);
+                error_append_hint(errp, ", %s", model);
+                g_free(model);
             }
 
             error_append_hint(errp, "\n");
-- 
2.41.0

