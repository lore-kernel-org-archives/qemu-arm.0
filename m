Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2384256ejt;
        Tue, 28 Nov 2023 20:21:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz6xPsB0GGl51peGOcXJS2L0a8pMQbP9ApUYyWF1051t4QmSbXEQRiF/ui9OAuVSKk7I8I
X-Received: by 2002:ac8:5794:0:b0:41e:2d8e:b364 with SMTP id v20-20020ac85794000000b0041e2d8eb364mr23964177qta.53.1701231703086;
        Tue, 28 Nov 2023 20:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701231703; cv=none;
        d=google.com; s=arc-20160816;
        b=W/+fNwrpbOaZ0wjqVoCNdZayhkZqOujga1xV3F23H7Y0/2pQahHGlQl+Ygl3x2IFqV
         vskgZOqFQ3kO5WAhM+m3S8hJrk8ShHGyQMmpBUtCNzThskq/jCocwHM035/ouY6xkqFf
         ikIBDt6zr8t1KVaNggKe3bl4DrbRchElAANIWL3wTuEDgqA2H5m2b93Cz9bOlOcBNkdA
         mKBvDcjamosLZtgMl/fGBXHWuapJpSBOB7wQj7dZ5mHz2IwOe5sTFocZ/fUcltgzQsW8
         SeulUG2QD/vra2X6eBf/L/vagmWZ1YwIISXgh4tqWuhLl2wO1PczbXDAJ6tu2e6Xy8Sg
         ZtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TnfSUVkggHVi7wcVMR9K0zJDXRXwlY7wqA3paeGEYRY=;
        fh=dYswejlzixW+/pN5BDGaZGk2aL8UDmDK4StoDp2TZgs=;
        b=gV2fYLox15AbV0GSkeS2yxZ43XhHOuWHB2t1iAuibxXqU04E2KOMLGCFDvWYGzs43H
         Z+Nl/8obPYHYthcrSZ1pkU4X8SKHg00+qmwRQdoQm6LwS7SCfrOzxl/mrJykwFo9VYvR
         W39Ptg6EquV96HRbo9itLAB1aPuiZgDa0amtg9zBNnViZA9+MrS5OjkPhMHc7h75fObR
         oRh40XedOAfLGs2uEDKLxWtA3YExXvE0k/TsbtBUk6u33LGgaqosKbwI2CsJKVn6VWFf
         w/CILyBs1UwPR2JSkQtr0Wh2ebnW47lF4V+A66QxJKDUJFN+3v/rraqw77Z/vyfwWtso
         VajQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ie+jV/Ss";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fx3-20020a05622a4ac300b004239cc9e05fsi10222884qtb.533.2023.11.28.20.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 20:21:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ie+jV/Ss";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r8C4h-0001qK-Tn; Tue, 28 Nov 2023 23:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4d-0001mw-MB
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:21:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4Z-0007MM-Ir
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701231674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnfSUVkggHVi7wcVMR9K0zJDXRXwlY7wqA3paeGEYRY=;
 b=Ie+jV/SseGg/aLOxNMSeQ/L3p+2pOTnIUVOvLT/maSei3yJWKRODz1t8N4qYHz/r+3Urz2
 JKXO2VTgnJF6KVibF/KdHgV9KyhES+pS61SofBnrkghR6UobphncvQ3NelHNGoAHfVvI0A
 4Z5hQwzL/Qro368TZiP4bA3E7i+wmgQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-iGosh_8SNxa3y-AnZ__VhQ-1; Tue,
 28 Nov 2023 23:21:10 -0500
X-MC-Unique: iGosh_8SNxa3y-AnZ__VhQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DF8F1C0BA44;
 Wed, 29 Nov 2023 04:21:09 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD032492BE0;
 Wed, 29 Nov 2023 04:21:01 +0000 (UTC)
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
Subject: [PATCH v8 4/9] machine: Print CPU model name instead of CPU type
Date: Wed, 29 Nov 2023 14:20:07 +1000
Message-ID: <20231129042012.277831-5-gshan@redhat.com>
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
X-TUID: dGINiScJmZ9Y

The names of supported CPU models instead of CPU types should be
printed when the user specified CPU type isn't supported, to be
consistent with the output from '-cpu ?'.

Correct the error messages to print CPU model names instead of CPU
type names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v8: Use g_autofree                                        (Phil)
    Relace 'type' with 'model' in error messages          (Gavin)
---
 hw/core/machine.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index c58c84abf5..946875930c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1408,15 +1408,19 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
 
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            g_autofree char *requested = cpu_model_from_type(machine->cpu_type);
+            error_setg(errp, "Invalid CPU model: %s", requested);
             if (!mc->valid_cpu_types[1]) {
-                error_append_hint(errp, "The only valid type is: %s\n",
-                                  mc->valid_cpu_types[0]);
+                g_autofree char *model = cpu_model_from_type(
+                                                 mc->valid_cpu_types[0]);
+                error_append_hint(errp, "The only valid type is: %s\n", model);
             } else {
-                error_append_hint(errp, "The valid types are: ");
+                error_append_hint(errp, "The valid models are: ");
                 for (i = 0; mc->valid_cpu_types[i]; i++) {
+                    g_autofree char *model = cpu_model_from_type(
+                                                 mc->valid_cpu_types[i]);
                     error_append_hint(errp, "%s%s",
-                                      mc->valid_cpu_types[i],
+                                      model,
                                       mc->valid_cpu_types[i + 1] ? ", " : "");
                 }
                 error_append_hint(errp, "\n");
-- 
2.42.0

