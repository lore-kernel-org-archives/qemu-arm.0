Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2414211ejc;
        Tue, 14 Nov 2023 16:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFYSVW04H5k3TTHBZ2UJrQvrnq28QWyHC6tQ9CAEEa974wety16zoPdW9sXVEwIsXrQYuL
X-Received: by 2002:a05:620a:28d4:b0:777:fec:5741 with SMTP id l20-20020a05620a28d400b007770fec5741mr3832224qkp.33.1700006849800;
        Tue, 14 Nov 2023 16:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006849; cv=none;
        d=google.com; s=arc-20160816;
        b=m23uSs3d7nTVUHU1a+UET7USRvACsFqZ1tFY9aq7j/rgvPYVH0wh05L+bGBKa+jdIH
         1ZNFCmwsNLLnBP0PeqpT3B//wtpcim4JKtBWm1ZPh4cQJaxv0nuuHmsO1tKE3kp7sjfk
         WYDySZ4NfS2nkP+lg23urV/awGp+cQERsrjQFdzD9+pk8ithlLdGLk+ostLg9f3Yr3yJ
         2rYJzbU/gcweO73GSAKCZlbNaCA5KtDcQj3pJRp/IpPqETDfFGLJ1U+icV3+QIR9YT0t
         p7GRcNVmpXMsi7ME3uPiI3AIXfCPjgvawIaGZP2qZ/daKtmBm2nF0RtE9qVUr8/ADX+T
         IV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eXIQetw5sZdqkssn+BH6GfCYS9pHv5cGSOd5nLrWmKE=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=J1h210qWS0i2Z8s+xcM2kbcUoN4Rc0WfmuoYjyEyD83iHCCHZFOkdwhpknSzSOTGgz
         +KZcPz7XSl8X9QqdnxEXkb2DCuWKFLwStOPhElLX6N9IWRC8q5rpsJuXtC1iPMMOB/I+
         dqgFXqArDeoOfnkG2c2+FHjRHRVJu6+jQEYainSMugEiBwcSe44d1cMchKxLq7jFK8uz
         Rcf/7BpUBp434PZ/wOXxmCvwj/sdelNd02qbfCANE6/Zmz84nFVPSiVp5gswSud/Fe4b
         NKU0woiCNdwQEt0l1LAyGjBOf5HfuuNWHXRWO+mBYMuPgHuvPNtgUElRwrNAg9EXOYWx
         ZadQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NzLUtdxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a05620a04c500b00773c56f9551si6955185qks.647.2023.11.14.16.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:07:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NzLUtdxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33NF-0000qO-Px; Tue, 14 Nov 2023 19:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33NA-0000bJ-Eh
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Mw-0008Ow-Ip
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXIQetw5sZdqkssn+BH6GfCYS9pHv5cGSOd5nLrWmKE=;
 b=NzLUtdxqfIETL0/UrVqVA9EfDcnOYSH1rdFZo32gIBZjYMtSBsgE71NOFDY4UhyKUkRFjb
 SpdM5yeeZQQyJ/9FZ9HtCYWSN+KkeSD2LVfcdoNeMvELTq4JU0yOBISRyRIi6f/zGTmvH8
 J2c0wj0ssbR6prDOqUaht1d8EWuWWMc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-X12Drwk-NCyp81ZR8LmsYA-1; Tue, 14 Nov 2023 19:02:52 -0500
X-MC-Unique: X12Drwk-NCyp81ZR8LmsYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C4AE101A529;
 Wed, 15 Nov 2023 00:02:50 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4915C15885;
 Wed, 15 Nov 2023 00:02:37 +0000 (UTC)
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
Subject: [PATCH v5 26/31] machine: Print CPU model name instead of CPU type
 name
Date: Wed, 15 Nov 2023 09:56:23 +1000
Message-ID: <20231114235628.534334-27-gshan@redhat.com>
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
X-TUID: slfBrBwpmjZv

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
index 49e0bc874d..58512b4b89 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1392,6 +1392,7 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    char *model;
     int i;
 
     /*
@@ -1408,11 +1409,21 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
 
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

