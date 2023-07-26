Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp197505ejb;
        Tue, 25 Jul 2023 17:33:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHPw9/NDQRY6ix+OJGXsNAwqNYaJsD7zCJffNmELyBzQcNt7Yvt4GELn6ZPBI89lS8vc33k
X-Received: by 2002:a05:622a:93:b0:406:9733:b86f with SMTP id o19-20020a05622a009300b004069733b86fmr533024qtw.8.1690331623753;
        Tue, 25 Jul 2023 17:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690331623; cv=none;
        d=google.com; s=arc-20160816;
        b=cczFYwYS1aug0pD/l7/ezjfZ4yMP5eJdUufwuBaBm5Kp3Q+bBJQ1mVLvYGMmoDuOIk
         q/XEvBlwdjfuqdDVpzVcpDRBG+rsTLJ6B11Pf2SKOl91p9EFJbBCn+cwEH6cMxIMNLvg
         GGMh6C8jWc9uYhjua/JQfL9mCqcU7QDuWpEQUKY+4YTbuXcuS9/yfTeiPu8YpCamzcAR
         ee45gA45idzYhAybgy6SS4L1RCX4niMAJeQ2Id0VV1RIbWi50sP/b7VSnpnZjabJPxuf
         OWeHbPQ9dD9BtUEy/1qiTRud+XGG7W9ymEHbW3/ANRXNtU9djubDDVIpnqkPVt2fEC/E
         VUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UfyYlAXPEO6rGCDdsc7We1YnnIDJV5ZWMB2m4Bc86dg=;
        fh=FuziOALKyXfrMoq6H15/q1ev+uC2b5q3xHaYPu2Bj/E=;
        b=JPJisGMKSLaB6T0SmGDXH5X7Ge4G5zPSXAyCghOaHJ0DMWRPx6XX1E9Fw1LP31CJyu
         1kiwx9J7XoogHgPKKXBKlcQO9PyBHU5Aw5/W89vHJYSJkl0YrqC9Ks1sfPDYkEWnjp7h
         OvT42bcFvW8iuT6s28SAiPWoB9SZdNcgDQ3a6D1ZxjlUxGo12fWtfC4avlyuy/k/Bc/N
         rnVhn9y+aP2al9AVgXeToOzXNHEa6MZ2xFUcJPlBKpZLTTwDjQrQAUBU1+HVVKHnqH6i
         Zxzq9UjGn3NeRlG0YvlBSwETTirzVIfL5kGq4CjaASP2ffvdMsi7k1WsZZw16+RGB+uZ
         57Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g7RHRzmH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05620a450600b0076704ce8da4si7284637qkp.323.2023.07.25.17.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 17:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g7RHRzmH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOST5-0001V8-Th; Tue, 25 Jul 2023 20:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOST3-0001UY-Pc
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 20:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOST2-00036S-4a
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 20:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690331607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfyYlAXPEO6rGCDdsc7We1YnnIDJV5ZWMB2m4Bc86dg=;
 b=g7RHRzmHFgHl2PGCV6EgWYsDBzMwVKZITtydN7J6LGWrQHj5+/Qe1Ysz8RxbkQD1venCGg
 rtn0E2Ev3IWlBgZaaG2aJnWnZkX03eZoFdJxMwTzbqwUoDjQu+ImCqZ4chQO4ByyXupYXd
 x6PMEh1qdLjLbIosD5YXbi+SRTX4xww=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-IObcQVRKOoOWnJXGLt_pnQ-1; Tue, 25 Jul 2023 20:33:19 -0400
X-MC-Unique: IObcQVRKOoOWnJXGLt_pnQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FFD41C09A4A;
 Wed, 26 Jul 2023 00:33:18 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CC13492C13;
 Wed, 26 Jul 2023 00:33:09 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 imammedo@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 1/8] machine: Use error handling when CPU type is checked
Date: Wed, 26 Jul 2023 10:31:58 +1000
Message-ID: <20230726003205.1599788-2-gshan@redhat.com>
In-Reply-To: <20230726003205.1599788-1-gshan@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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
X-TUID: U7zra8JR4gKE

QEMU will be terminated if the specified CPU type isn't supported
in machine_run_board_init(). The list of supported CPU type is
maintained in mc->valid_cpu_types. The error handling can be used
to propagate error messages, to be consistent how the errors are
handled for other situations in the same function.

No functional change intended.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f0d35c6401..d7e7f8f120 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1355,6 +1355,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    Error *local_err = NULL;
 
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
@@ -1423,15 +1424,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
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

