Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2413327ejc;
        Tue, 14 Nov 2023 16:05:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEQA1bBZHlfX5uQ4eeDWpH1g49lDqrBwzy4YCX6TiPhVC4QrDQLhnK7RtNcjcEwiftNkp2
X-Received: by 2002:a05:620a:2483:b0:76d:96a9:da25 with SMTP id i3-20020a05620a248300b0076d96a9da25mr4620687qkn.61.1700006756965;
        Tue, 14 Nov 2023 16:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006756; cv=none;
        d=google.com; s=arc-20160816;
        b=Zef1f6F02usIGkiKFXGGbJEXuDq6WcDijS0BBvD71LfjQpc5hqrCVzyPBbh+54D6J9
         vBVSpdRQ4MOkmRte0fRPbAGhGmbn/BXNw91gwhoR9b7gNcV0Mh8UF4ls6RvZ3DEoGqv2
         3Ub7gzTqLkZ7NEUSfH+v0W7eJU5xmiJVnlwUberppCN/m3oKTGw0D2x/I8/9NSMllJsI
         eQBUh66NM+SVC9/M4zmZxV2Ecn8IitsDWIlWgo2QTSTBMxu9uMXmzCFC/8a2JHUd33Yd
         hjcyTrWbSh8L0HjQQvvUhMO3bx7ZQb4Qnh8vTNDbwJ4TvyIAAOLZOS54yS5sUaVBxGmq
         LPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=hpeKOnNHDzdleIFAJE8H9OmrGjfXzc6pC5SCT7yL3NQ=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=nk4eNc286VQGsIjUUq4hPQ8BEVkcuPp9trtsFieGBguLZu8FtfC1oKAGgnujOi9MV8
         xpkugA6ve8+ezLTcAvgOkGIZoUb834ncbWK+GL7c7+DhUnHCuwfjukKRAgGv0vdXBYgp
         rZyJxZavu2UhPAKCfZBGE3G5QHsaiKluQrrfnzPsiVmNCVTK/m3YxsUH3kl7EdsYC7ci
         47bmEzpn68GZzYD2ITZnJuz+9tbxUd1HcM7dL0AYXv6nmdri6/PjY+SQpwFpLt+Mbnzk
         BMXoZQ1FoNACz9o3xM2sLrGlXuamF9P7QHJXFlSS6so1lZIQBRC+ZGmbQmXwDLTEqpNg
         0KTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JoLAhIuv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi20-20020a05620a319400b0076db12d14c2si7678541qkb.719.2023.11.14.16.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:05:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JoLAhIuv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33Ob-0003NY-T3; Tue, 14 Nov 2023 19:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33O9-0002tq-Oh
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33O0-00007h-Rl
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpeKOnNHDzdleIFAJE8H9OmrGjfXzc6pC5SCT7yL3NQ=;
 b=JoLAhIuv1WjNyDj0Kr+dLv7B5fBbYL5NZDaA8JFHL4gbGMU87D/Ti+sgjOiTh/NMX6FGXe
 FlbVS1FOh8dlWCuKbgMMUuuAZ6heaycSRd3Bq6naT+oZvyJAZC95QsTT7+ekOY55eYKqkI
 31VBKRAXNiax7bOdRb0fFWq+Ec6bfs0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-346-iS5I3fx-PZykyfbeMhFZeQ-1; Tue,
 14 Nov 2023 19:03:58 -0500
X-MC-Unique: iS5I3fx-PZykyfbeMhFZeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D2411C03140;
 Wed, 15 Nov 2023 00:03:56 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2666AC15882;
 Wed, 15 Nov 2023 00:03:43 +0000 (UTC)
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
Subject: [PATCH v5 31/31] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Date: Wed, 15 Nov 2023 09:56:28 +1000
Message-ID: <20231114235628.534334-32-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: R2Rpa0ZNk6+k

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/shakti_c.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 12ea74b032..fc83ed4db4 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -28,6 +28,10 @@
 #include "exec/address-spaces.h"
 #include "hw/riscv/boot.h"
 
+static const char * const valid_cpu_types[] = {
+    RISCV_CPU_TYPE_NAME("shakti-c"),
+    NULL
+};
 
 static const struct MemmapEntry {
     hwaddr base;
@@ -47,12 +51,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
     ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
     MemoryRegion *system_memory = get_system_memory();
 
-    /* Allow only Shakti C CPU for this platform */
-    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
-        error_report("This board can only be used with Shakti C CPU");
-        exit(1);
-    }
-
     /* Initialize SoC */
     object_initialize_child(OBJECT(mstate), "soc", &sms->soc,
                             TYPE_RISCV_SHAKTI_SOC);
@@ -85,6 +83,7 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
     mc->desc = "RISC-V Board compatible with Shakti SDK";
     mc->init = shakti_c_machine_state_init;
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "riscv.shakti.c.ram";
 }
 
-- 
2.41.0

