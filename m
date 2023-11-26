Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp634152ejt;
        Sun, 26 Nov 2023 15:13:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF989W76wSulmamEkzVwaEdSaWhPnSOfODeQqzxwfI8PgwPXQAEF/N/+jbP1B/rcuHWRlzt
X-Received: by 2002:ac8:5b88:0:b0:41c:baf5:b500 with SMTP id a8-20020ac85b88000000b0041cbaf5b500mr14851021qta.47.1701040409138;
        Sun, 26 Nov 2023 15:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701040409; cv=none;
        d=google.com; s=arc-20160816;
        b=rRQfoopyNzTFcYCnRkvLmSm5dZumWFWzmzX6zs8dN6Q18kTRusRK5CAsUXsZuuTyet
         Mf8WFcBF7Lu6Mj8pdfoGxwJxAKCRHX2UbEokvF/+m7+CWGhBVpBzKaqt785wgfO6gUrB
         oDcCkadJ3r6rlShAT9esKb6FpHl/a2G4xhozX/yHufflvIm4T3FxQX8UKwAkt2s28pW/
         RoGIz7LpWjyLFBgImEpSFavjuMHUm3LE3oi+prqeqLe1hwbRKR7mLBbd1gk/u5DYAmyA
         etge43IWJMwt5OA+K1aK0BMMMkIhk/8xhae9cBdTdBLUVf0atczxQEZ5GsJkoJDmcGHI
         hHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dsSORq95Z5IU9KFuh+dRbflkHJPV4L408Ca5PxzXjbA=;
        fh=j+indnOjTt+RINOBLao7PfkDc9cNRlB5CyY3wo1fnnU=;
        b=mlkGpSGvf3EyuUGrQvSsElne+VwKPR8fZ5hfZb6BzTs5m449fwLErT/GeSBxL5aofe
         IdGuWYC98VPA//HyulUxuD+PhyRo/la3rb8nLR2YFkwKrGPvr/9RcjKV/QTd+Ri6g3jb
         3cdlJlMU3zcrEwXjggybYM7Y+YK+9CVgyyM68PUfbEmI9RRxRc8ssVgMfkD/RQ3ZBVWa
         ugzAph7RUXfmvkJTmg5oipiV+BrCknJxr6kh2zuw0t7+1DcorPOz1EbxGiXno2qxKEpK
         7a6qJ60NfXlJK0YFU9lQFzaZHOYHivKAbKQBn9qRTSYyIQ+EZ0uAGif9BbJPzOxzKG4K
         Xhfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mj42TKgN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc25-20020a05622a489900b00423c13761easi1320671qtb.280.2023.11.26.15.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:13:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mj42TKgN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OIv-0001V3-1v; Sun, 26 Nov 2023 18:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OIt-0001UZ-Ax
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OIr-0005zs-TG
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701040361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsSORq95Z5IU9KFuh+dRbflkHJPV4L408Ca5PxzXjbA=;
 b=Mj42TKgN2clVgoWKWOhODHGS9Ib4rL/JWRPXP6FbYYU+thL+HL94g6Jv+bHLevTZ2/u2dp
 mDTl4eiRJYZbn8BqjQfb8d5VjIju0mbmPmkEnnt0dWgxycH2X/1N2v5OpX3J7asXQe/rHq
 6ahygOxiPSc39hd29GCx//X9So6xrLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-mJ8Dky3cMZWl-vEPKVSITQ-1; Sun, 26 Nov 2023 18:12:33 -0500
X-MC-Unique: mJ8Dky3cMZWl-vEPKVSITQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF87E8007B3;
 Sun, 26 Nov 2023 23:12:32 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B2E492BEE;
 Sun, 26 Nov 2023 23:12:24 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 shan.gavin@gmail.com
Subject: [PATCH v7 1/8] machine: Use error handling when CPU type is checked
Date: Mon, 27 Nov 2023 09:12:03 +1000
Message-ID: <20231126231210.112820-2-gshan@redhat.com>
In-Reply-To: <20231126231210.112820-1-gshan@redhat.com>
References: <20231126231210.112820-1-gshan@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 2G2RKCUd8Pz1

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
v7: Add 'return' after error_propagate() to avoid calling into
    mc->init() in the failing case                        (Marcin)
---
 hw/core/machine.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0c17398141..b3ef325936 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1394,6 +1394,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    Error *local_err = NULL;
 
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
@@ -1466,15 +1467,17 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
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
+            return;
         }
     }
 
-- 
2.42.0

