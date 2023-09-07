Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3154943ejb;
        Wed, 6 Sep 2023 17:43:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyXKhGj2bzkvshFlqKTKm6Fb2BSXWuALOquKCKbkYAOnWPGjvDL+A27hsbz/9xO8h8yiY2
X-Received: by 2002:a67:fb88:0:b0:44d:41d3:a29a with SMTP id n8-20020a67fb88000000b0044d41d3a29amr3926876vsr.34.1694047433496;
        Wed, 06 Sep 2023 17:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047433; cv=none;
        d=google.com; s=arc-20160816;
        b=vip6iHJ0Em9DTDHLwTTfneple5wHTVF58g4DFdxTSHotelZqu2joOIlJSK7t2itNYy
         Is8MiECyq/a/A2rYoR9nEnXcSfHT0NYbaS5TzY05Nc6e/IP2G706ggh9x0wamin0dIQm
         oHzqk3ydchCTSs/DydJbywOGoAoLCGjvJGH92NFPMD/KPohp6i+fbW/monai3J6SoolL
         C+k19g7yr94EgsxvgqoM6klOfmcpluxEAwsp2fo2ifhMuiHWKUfOjzk/kDq6BKgky21m
         hIGkgN7fZiGLmhzwkYAtlVaIkCOP1Nx7liNCvbhEMO9r3dDlsVtRA9wnLmubchN2FlYR
         lQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A95uT00tK4ZofT9z2bOAoLTdecw9CZjPml3Poj9gRcA=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=S91LgYSznFNh9gCLOJBiNgqmfPVKAk80NquDcz+G1SlOT0G2ywFeo1TAvYvWH/aT2u
         I2vsiG0Y0A7tUaHXKm/aW3Rm0I84S13gpy0o6Pnls28vbEWZoxYIvZPQ4CVIQ0ZdJQX6
         hCSlIJ4466gWLwGB1MjAgqEoRI54Vxx4leu7Uh/YEU1tj4BC/SQDoGYMcxyrOmdUdSTH
         omf3gk1mM77T8GbA5I4pqSm3ouOycGmq+9eFI6N2t64CCxTdfcQX86McuwmMfOJpp4hu
         ajBVdb3ETxz2bXibDwOAUen1uuG2EPSjExSE162BCdhGUrwyQQQ4J/QOaDtz0cTI+tUz
         wBQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMBafPCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020ac87c4c000000b00403ae9e8b08si10769106qtv.369.2023.09.06.17.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMBafPCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe37R-0006U5-Lv; Wed, 06 Sep 2023 20:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe37F-000683-IL
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:43:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe37D-0002hT-A8
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A95uT00tK4ZofT9z2bOAoLTdecw9CZjPml3Poj9gRcA=;
 b=OMBafPCw6zfKUomjMmpqRJYcWT3JywwG9IJBR0Roipx5QRnhRx8AHYhvJfbVqB4dWu80Ks
 BejbK0ovq4juwgJn47ReFpME9w/ezxIZzS5FBP4CcovnsWTU8FC1FVgtkaUd42DL2Nfnea
 HE1fUc+cJ1p819YLgIi4eOnqoyYIC60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-9Rnv7jvaPaSBzxV0Z-N6gw-1; Wed, 06 Sep 2023 20:43:16 -0400
X-MC-Unique: 9Rnv7jvaPaSBzxV0Z-N6gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3656D101A529;
 Thu,  7 Sep 2023 00:43:14 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 067B4C03295;
 Thu,  7 Sep 2023 00:42:58 +0000 (UTC)
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
Subject: [PATCH v3 25/32] machine: Use error handling when CPU type is checked
Date: Thu,  7 Sep 2023 10:35:46 +1000
Message-ID: <20230907003553.1636896-26-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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
X-TUID: CShYUqo+0RcM

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
 hw/core/machine.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index da699cf4e1..6d3f8e133f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1358,6 +1358,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    Error *local_err = NULL;
 
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
@@ -1426,15 +1427,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
         if (!machine_class->valid_cpu_types[i]) {
             /* The user specified CPU is not valid */
-            error_report("Invalid CPU type: %s", machine->cpu_type);
-            error_printf("The valid types are: %s",
-                         machine_class->valid_cpu_types[0]);
+            error_setg(&local_err, "Invalid CPU type: %s", machine->cpu_type);
+            error_append_hint(&local_err, "The valid types are: %s",
+                              machine_class->valid_cpu_types[0]);
             for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_printf(", %s", machine_class->valid_cpu_types[i]);
+                error_append_hint(&local_err, ", %s",
+                                  machine_class->valid_cpu_types[i]);
             }
-            error_printf("\n");
+            error_append_hint(&local_err, "\n");
 
-            exit(1);
+            error_propagate(errp, local_err);
         }
     }
 
-- 
2.41.0

