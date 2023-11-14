Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2408570ejc;
        Tue, 14 Nov 2023 15:58:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpDVsXoB/PlQearaKny0KKfiql7AZnXpSBPCVLAR2cmRtbRli+3zlDP8EInJqVX20RZ8Do
X-Received: by 2002:a05:620a:4101:b0:779:e22e:1e8 with SMTP id j1-20020a05620a410100b00779e22e01e8mr5208606qko.36.1700006330850;
        Tue, 14 Nov 2023 15:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006330; cv=none;
        d=google.com; s=arc-20160816;
        b=k3XwBSO6iHnToX1k23hnjFX0Sj1VKEvKwkC6O1ueAGBV8zdm5Pv8B9i/cmw+0Ve+39
         3QBw8KodOI8yTcHJ7UwToCZc57nUYqxrxumE/2oc5KPzbneZ5Gt9Flt+o/RSjmeyQ/0Q
         yxx+pXiuM3FpivrgaLncJQ538x2OMzkXkLitJ1v2JyjTJkDKDtZc0435cjdKc5+c6g7e
         DixPcP0AwmLzxrWXcQJxTJshTPpOpmKzuwaqDGpn9/DAsSPnZo9clI3rcWTXdu8EFpjp
         v3/K7LvCfKowle18ssZ5HGJbBG/Dg1hI/bid1jB/S0XHQzqKEFdAASHn9wJJEfm1lBZK
         tlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nvoBORD4tgmo6x33JxzW5R6iviix3HiBVmKpYXj4UTQ=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=MRixl1tYWcY3jvamydlX/Gsg6tcYBjJUjrRlwej8u7SXNac2dzP5qMmO3HKGgMvPDz
         wPqMQzR3PYkEsSxrUGElOdwwFbDNCeJ/rtV3kLSU1hxeSGyAwndJmpCWueP3lBPSyOVv
         DeQbnB8UbDSZ3Hf3uyK8D+phF7khiQPL0Cx5OUhFPTCGxCoYvn0fYTN7DVPqP3Po6qNK
         GG63pE0u1b+j2pFkOWmlfpDTv6r0Nh1Wtp/cH/BCUCVCwznanPtDxp5yV1QiqI3rjyVQ
         XOpl3dftvmVCgPuBW3m4Mj4R1AVsfJZ0XInPKiIwgx7ixMswKfykgZH9UqqCA4F0P41w
         S7+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VYmbO9Qw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020a05620a24cf00b0077404c6c51fsi8260465qkn.371.2023.11.14.15.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 15:58:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VYmbO9Qw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33IS-0000Ra-Kk; Tue, 14 Nov 2023 18:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33IR-0000Oh-4H
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 18:58:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33IN-000700-FG
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 18:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvoBORD4tgmo6x33JxzW5R6iviix3HiBVmKpYXj4UTQ=;
 b=VYmbO9Qw4DY82pTUG5j+qBxM9vOrteoE9f1AVTlKQfuOPGIfO0x3D/gdroKhlJ9EyXsnwt
 qoznhk6Rl46iwhZuE7GWnW2tv9R1txdTp4uokQX/nMB0EzfPs0M3DqTV3rVvsSLOOhP3cK
 qUnY/jE7pp88id5wlJncn6t7zs7qgio=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-TeWsArlGMdivUoWje46hUA-1; Tue, 14 Nov 2023 18:58:08 -0500
X-MC-Unique: TeWsArlGMdivUoWje46hUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3752101A529;
 Tue, 14 Nov 2023 23:58:06 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDBCEC15885;
 Tue, 14 Nov 2023 23:57:53 +0000 (UTC)
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
Subject: [PATCH v5 05/31] cpu: Add helper cpu_model_from_type()
Date: Wed, 15 Nov 2023 09:56:02 +1000
Message-ID: <20231114235628.534334-6-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: lQdsWZviFoD4

Add helper cpu_model_from_type() to extract the CPU model name from
the CPU type name in two circumstances: (1) The CPU type name is the
combination of the CPU model name and suffix. (2) The CPU type name
is same to the CPU model name.

The helper will be used in the subsequent commits to conver the
CPU type name to the CPU model name.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 cpu-target.c          | 15 +++++++++++++++
 include/hw/core/cpu.h | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/cpu-target.c b/cpu-target.c
index 508013e23d..c078c0e91b 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -241,6 +241,21 @@ void cpu_exec_initfn(CPUState *cpu)
 #endif
 }
 
+char *cpu_model_from_type(const char *typename)
+{
+    const char *suffix = "-" CPU_RESOLVING_TYPE;
+
+    if (!object_class_by_name(typename)) {
+        return NULL;
+    }
+
+    if (g_str_has_suffix(typename, suffix)) {
+        return g_strndup(typename, strlen(typename) - strlen(suffix));
+    }
+
+    return g_strdup(typename);
+}
+
 const char *parse_cpu_option(const char *cpu_option)
 {
     ObjectClass *oc;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c0c8320413..57ceb46bc1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -779,6 +779,18 @@ void cpu_reset(CPUState *cpu);
  */
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
 
+/**
+ * cpu_model_from_type:
+ * @typename: The CPU type name
+ *
+ * Extract the CPU model name from the CPU type name. The
+ * CPU type name is either the combination of the CPU model
+ * name and suffix, or same to the CPU model name.
+ *
+ * Returns: CPU model name or NULL if the CPU class doesn't exist
+ */
+char *cpu_model_from_type(const char *typename);
+
 /**
  * cpu_create:
  * @typename: The CPU type.
-- 
2.41.0

