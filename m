Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2384262ejt;
        Tue, 28 Nov 2023 20:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPqTV7Hyu/K5XVjmp+4jE0bblRL7YRFkl0hBvBK5moSfZQNi0HLzSMDTflf23+edCcj1cU
X-Received: by 2002:a05:6214:c86:b0:67a:4f19:d862 with SMTP id r6-20020a0562140c8600b0067a4f19d862mr9492253qvr.18.1701231703804;
        Tue, 28 Nov 2023 20:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701231703; cv=none;
        d=google.com; s=arc-20160816;
        b=S9890ONK3GCRxNR06gBxlANkvb3gnF8lR97OTXiPq0DHCS0Csca+twz/FGV5wd4/zS
         V2/DkASLgoXlJBA2YaYe9mpeKH/bLOcnF5DFvgs/WgidgPCt+zN6iJbe23ECf5jHv9Zw
         3+FAheLW70IwAihXSYW2LJsdDAmTTqBzqvobzptP1T5FotFCO8v0Co+M8uQm+0tT6Qrh
         yIfCUpVc4JZacsTxgEta9cT+Um2S1imsmZa5dT9cOu9B6x0dRnU5KngCYhmLdBOPWs0K
         dC0HGjgO7CIUXh1bm+DVOgB/5nL65Tx8dTcMbWVyI8mrzWt7tcyA80fuCUdLgk0Sf3Xj
         WNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jIImTsSSqPGF/yOgnm0kZAIVVSIPeFlelJXiJh0r5Uw=;
        fh=dYswejlzixW+/pN5BDGaZGk2aL8UDmDK4StoDp2TZgs=;
        b=JVNtEcIPSx/G9BJdUEQVqvdOcqRXjsZF29XM/wHTlkVj5yNK7A1Ra49868H0yeUcLp
         GYMXfcDO9n3hXkCfzgCaSe5Ij3akfLpAVFfRmRjhWnvxoKRll3beahY5o4KQ3FxHsPIT
         0HofrrPDt8YaazoetUS4d8DnZj6b/UNYFci0m5ShSnX6iwAtck/SybmPOP1vH7tN7Rvg
         0l+5Bdf5EDDGCEaoCMzpxrj/RsK3SSQHlMquqa5BHM89lWZsZbq1XraKSUwpy8W7aeLq
         ifzDAyl5BHee6IrfFjQYhwBYuykeb9iXCssGbT0IkejhcZcP0Pnr+xurV/i7fad5X9Qc
         STiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eIG5Jgm5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13-20020a0ce98d000000b0067a3a4c1fcfsi6462042qvn.248.2023.11.28.20.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 20:21:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eIG5Jgm5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r8C4E-0001Lh-Q7; Tue, 28 Nov 2023 23:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4C-0001Ky-QK
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:20:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4B-0007Jw-8e
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701231650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIImTsSSqPGF/yOgnm0kZAIVVSIPeFlelJXiJh0r5Uw=;
 b=eIG5Jgm5ZZl8jMNGVN2bhteRW0Zudfz92ecMDKcQc91YQJ4T4use+qhtea/KziOftwE7vH
 f0yen7ucMJObZb2ayLnFpfLxes5D1i/4Jgu3SaFH6umS1DJmBU5s/rSJQLaa9cQAtfZwLS
 uKw6l/PThOzmfyVZAwIcidoWYoFrLmI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-KQ937PfjMPCC5I9N7gpyAQ-1; Tue, 28 Nov 2023 23:20:45 -0500
X-MC-Unique: KQ937PfjMPCC5I9N7gpyAQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC86811E8D;
 Wed, 29 Nov 2023 04:20:44 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79EFE492BE0;
 Wed, 29 Nov 2023 04:20:36 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v8 1/9] machine: Use error handling when CPU type is checked
Date: Wed, 29 Nov 2023 14:20:04 +1000
Message-ID: <20231129042012.277831-2-gshan@redhat.com>
In-Reply-To: <20231129042012.277831-1-gshan@redhat.com>
References: <20231129042012.277831-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
X-TUID: zS5Ki/+yIWfk

QEMU will be terminated if the specified CPU type isn't supported
in machine_run_board_init(). The list of supported CPU type names
is tracked by mc->valid_cpu_types.

The error handling can be used to propagate error messages, to be
consistent how the errors are handled for other situations in the
same function.

No functional change intended.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v8: Drop @local_err and use @errp to be compatible with
    ERRP_GUARD()                                          (Phil)
---
 hw/core/machine.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0c17398141..bde7f4af6d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1466,15 +1466,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
         if (!machine_class->valid_cpu_types[i]) {
             /* The user specified CPU is not valid */
-            error_report("Invalid CPU type: %s", machine->cpu_type);
-            error_printf("The valid types are: %s",
-                         machine_class->valid_cpu_types[0]);
+            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            error_append_hint(errp, "The valid types are: %s",
+                              machine_class->valid_cpu_types[0]);
             for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_printf(", %s", machine_class->valid_cpu_types[i]);
+                error_append_hint(errp, ", %s",
+                                  machine_class->valid_cpu_types[i]);
             }
-            error_printf("\n");
 
-            exit(1);
+            error_append_hint(&errp, "\n");
+            return;
         }
     }
 
-- 
2.42.0

