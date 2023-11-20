Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp1858950ejb;
        Sun, 19 Nov 2023 16:29:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+pRniSGnARXoAt2DRKOIae++UeX58OS9W3GnlSoCirryun6hkRwg9NHjzc+r08kCbRxq7
X-Received: by 2002:a81:4986:0:b0:5a7:dda8:f291 with SMTP id w128-20020a814986000000b005a7dda8f291mr7432658ywa.33.1700440160426;
        Sun, 19 Nov 2023 16:29:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700440160; cv=none;
        d=google.com; s=arc-20160816;
        b=E8TJEQhYa9gdG5yrWzivYPSKLBN56uKN3Eor6XMW+wirnqyPiN+pnyLdZ6GexuVUAM
         KYmcaqfQLM+Z5bTpDKfvztAIRNKMBSTZxhgMzFgn8yvmh2W18ecgFhc6BGfkRsGo7CmI
         L+RtNhb4IKy2clgAuRxwskhxqc50mmxTPImCgU0/YDvckUGDN8Oal5PxsCvvk8au3XAp
         MuCKN09xHfqbzTLGAkeqJTE1f2pXasCHfN5mwyambkZlCblMFFD0A7/L5ujknnwORib5
         nbQD9DWc3HTFfPl6eHij6vxuaSl2lLDCm/YaijBNLe79Gy4shjprpXskuqfdn5Q+Ul7+
         KpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lu8QJO9KDwDOmzdkBAnOVeCD39qe2P6zlwVvhT3kRpk=;
        fh=eprYT8whwr4stGFQLeeZHwk74gIWGMhzJm3THIcsCHI=;
        b=s7Rp0iMyGNfy0Va/jY4TfdqizLeU7o656MPEFl3Ud/ghg33a7lBFwN+ULcW0s3rn1n
         ijzLTsGxcANgvxKe6D0m5u+EU0W8BCNyzU1jhrvWItzjbbKL/+cs3nKnrbbJsGDMX4m4
         kzgmW1TkSCbkhOCSB+2qiClanXv+F2H3tmQrJfYx530mwBXwZfbTmjGe5NGKm3aZZwfL
         3IGFGxArfyOhj17E44FaKTqlNgEr7YoOvIIxheRvTsYAlIOgDVVi58AZQFwIkhc+17Xt
         NEp8AXFpjic4ZWxBtpb+25tQtsGd8AtDb9o4DTRAnFHJUBSAfOgHmAaN63jzDoeW8YWE
         mr0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KIf+EneE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020a0cd691000000b0066d20f29e5asi6414488qvi.100.2023.11.19.16.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Nov 2023 16:29:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KIf+EneE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r4s9M-0005KH-8f; Sun, 19 Nov 2023 19:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s9L-0005K8-55
 for qemu-devel@nongnu.org; Sun, 19 Nov 2023 19:28:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s9J-00019K-KW
 for qemu-devel@nongnu.org; Sun, 19 Nov 2023 19:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700440104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lu8QJO9KDwDOmzdkBAnOVeCD39qe2P6zlwVvhT3kRpk=;
 b=KIf+EneEgcyFvMPVnQ5Eics750BGXTtvXJIywHQlN3SHau6ux1zywLYy1rS+fryGOzQOMA
 yEOfnLEhTO19ZC9yvwKP125mCGeuyIZFNAVKX27Oaw/LSeSZ88Bw2UYdOj/SFiFz8G0Y9i
 lgAwrxeqhfIB5Neh9h+zJ3RU8a0RZXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-rebdYtjzMGeUx6JSz-WLuA-1; Sun, 19 Nov 2023 19:28:16 -0500
X-MC-Unique: rebdYtjzMGeUx6JSz-WLuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ECB88007B3;
 Mon, 20 Nov 2023 00:28:15 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3E240C6EB9;
 Mon, 20 Nov 2023 00:28:07 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v6 1/8] machine: Use error handling when CPU type is checked
Date: Mon, 20 Nov 2023 10:27:17 +1000
Message-ID: <20231120002724.986326-2-gshan@redhat.com>
In-Reply-To: <20231120002724.986326-1-gshan@redhat.com>
References: <20231120002724.986326-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UPe40jd/HUX5

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

