Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2411436ejc;
        Tue, 14 Nov 2023 16:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2Fbsv965A3tINT0JMpl+J/OXGXuMaCisK3hPr5LiX54qVI0n06VLmUSCr6xGnl1vUu3Es
X-Received: by 2002:a67:ab0d:0:b0:45f:4e67:4420 with SMTP id u13-20020a67ab0d000000b0045f4e674420mr7661329vse.2.1700006581772;
        Tue, 14 Nov 2023 16:03:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006581; cv=none;
        d=google.com; s=arc-20160816;
        b=IBFCrWyOxzmMdoZVBVx8X8xnknBE8Lhkwc17+Yc2tDwDRvwOgrLW4TK7j2KgZLUK5Q
         wmeLSQ0ss7IOdBagBAX2cjID7cb6/kubkwfQny8jKAmUKyibnh3W8CudUZMhA1oMUQUM
         Axu8tZ0j0MPPEdx6KuhJJ7XovFjX04jCCWeiKdEKdPHtsFAt8KeG0ZCVUJwC9BlkEyGX
         rF1zS47pE71A7Vs8QZ4cQdDJWhMzFGKv5sjCyL6s2c8aqiUAPiVuy3Pw+702+2xiZKVR
         T3X2h/Sj1OJGK4ueyqcNrOfKIBghaCKlUcnlCy4WKknR9LpKD5bzdTeju78nod97DWKL
         Zigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lu8QJO9KDwDOmzdkBAnOVeCD39qe2P6zlwVvhT3kRpk=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=z/E/J4RQs9V+Kl6OvPPKt2kg0fb0csMGC5nclgoOGxYq6M0+EItZbQ7AFG60WWJBbc
         8Ai/6zqCjfp/agwvECRZLaIbzRBqu4mqx5dWCk4rULz7aWkrlYXmUYTLRtP6nEuquuKH
         ka8o/KhPD2R+RVr6iLOsmhBG/I+tQkvY+9txLoqCEHypo5Z5meVjLV1NOpWX0V33lHqi
         4uxWuaOIfGQoOuJCQnHpCZ88M+OYoyvTHJiMOjZGyO4N17DwjJ+DzLbs8Emrjzn7wXpA
         xnLy6enFaUD55ujOTX8WhN9Q2RpebddzRrSGCJAogdVglms1m/p7UPw/ocnDL7VF8uCv
         sfqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HkQPlbCI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4-20020a67c084000000b00450f73e28adsi1191964vsi.148.2023.11.14.16.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:03:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HkQPlbCI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r33Mf-0008Qv-Ll; Tue, 14 Nov 2023 19:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33MY-0008ME-PF
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33MW-0008KR-0J
 for qemu-devel@nongnu.org; Tue, 14 Nov 2023 19:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lu8QJO9KDwDOmzdkBAnOVeCD39qe2P6zlwVvhT3kRpk=;
 b=HkQPlbCIxjOSsnOsfsf6wYccil5mwwGprUvNc2bQhAI/I3vgR0yWR7WLdr8/c38DxdCEMR
 ZLCn08a5v4Ct3RNBVa6Dc8Qpxh3/T3OfuhWzcnWEoLmZnvJoRp1uhsE3Ai4nUPPpr1YBvC
 qlqKsyXC3mJGTjHItBxkkYj5InK+7fc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-k69DLkiQM4WTVbvicLwblA-1; Tue,
 14 Nov 2023 19:02:25 -0500
X-MC-Unique: k69DLkiQM4WTVbvicLwblA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66B2B38476A4;
 Wed, 15 Nov 2023 00:02:23 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C3DC15885;
 Wed, 15 Nov 2023 00:02:10 +0000 (UTC)
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
Subject: [PATCH v5 24/31] machine: Use error handling when CPU type is checked
Date: Wed, 15 Nov 2023 09:56:21 +1000
Message-ID: <20231114235628.534334-25-gshan@redhat.com>
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
X-TUID: 6oQm2fcy7pXe

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
index 0c17398141..5b45dbbbd5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1394,6 +1394,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    Error *local_err = NULL;
 
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
@@ -1466,15 +1467,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
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

