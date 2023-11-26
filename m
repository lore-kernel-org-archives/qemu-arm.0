Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp634015ejt;
        Sun, 26 Nov 2023 15:13:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/i4QuMc2gv5qxQBtOJdGcxeufbXe1SDVvwIVB7qXwpsj63tXZEtSh5tXEL3SFBwllokO+
X-Received: by 2002:ad4:4312:0:b0:67a:3a3a:1a3 with SMTP id c18-20020ad44312000000b0067a3a3a01a3mr3552676qvs.31.1701040392515;
        Sun, 26 Nov 2023 15:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701040392; cv=none;
        d=google.com; s=arc-20160816;
        b=u1v31AUUTFmv2l/mvJbvTOynK+Bi8z4jLnBHd4R67P2xa0f2Da4cUp1qBCySW0uRiB
         1tMmWrWC6vUtJw9KoQ9qzCbaioaZWJGlvSsJ57MIjO2GFbCW5fO2HZF/wGqwXMEaVNMO
         UhwythiVEpoj+dSCnshV4p6TiUUkhorOCelLoKxSfnvNzwyzUMrwUz2rvZ3LBa6RBWTs
         iBSmenIZriYzQgJXRTIHMOicyv3cDoLHLePtK+uCe8WdktEmTi86Q70oEHPsrCIXimx+
         uGQV5jnh2kIU3D+HcM04U5GHI/mmTTjrgG98LTIt6H02N2/68aEXO9kwLWLhVT19XUt7
         Hpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b/8DqpwCNR1yRb471/R2Vb6Jl0xKa2OTfqFXet6eWAM=;
        fh=j+indnOjTt+RINOBLao7PfkDc9cNRlB5CyY3wo1fnnU=;
        b=xI28EqCKSWVbp9/xqAjFn6uVcXlLvdjxn+LoaMDqGTKoOFRaQWRf8XU8YjYGt+5sxi
         4rnAebUR3kg3MfApId5b2d/IbjyQDv9L2LhmKd+OO+MHN6uoXOc262wi9hOZFiPzAc2y
         iAte6Qt+a+R3SrWSgmjfpLqRh8R03N62cQN5St+ZyCzWGnHldCQmgowr1MjSQk7bucz2
         WAPMucA0x2XAtdMh5UkDq1j/gclcmOjrlW9T04rGPz9O1BCa5NkgVNK6/CsbPEy7V+zL
         ghJggGFogBd8ROO5CWdhroZJSfAj1Nd3VHM/r6KzouBtlyrHOW5Yf8acOaPQOsOTXDa4
         xGxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HffsjEqB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a056214062200b0067a27235b7csi4240339qvx.395.2023.11.26.15.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HffsjEqB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OJ9-0001YZ-16; Sun, 26 Nov 2023 18:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OJ7-0001YB-Jm
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OJ5-00060y-49
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701040374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/8DqpwCNR1yRb471/R2Vb6Jl0xKa2OTfqFXet6eWAM=;
 b=HffsjEqBM+XttMX6+vkkwb1q89Bt9NbkWBEiP3ByPzZ496WHlgeezIkJeHAF8Bd7jGRi/U
 lr/VJQdziaZZNLiQf4MVdguFEimcrrJNWo4kHBDRbP1t3vq5UqNX/9D1BWgHfFsTBRw/DN
 wZoD9OAtCs2vBh0FReaTSsHxhxmPYVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-SxSR_HZnNF695mkWa_aIuQ-1; Sun, 26 Nov 2023 18:12:50 -0500
X-MC-Unique: SxSR_HZnNF695mkWa_aIuQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5FF5811E7B;
 Sun, 26 Nov 2023 23:12:49 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A45F8492BE7;
 Sun, 26 Nov 2023 23:12:41 +0000 (UTC)
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
Subject: [PATCH v7 3/8] machine: Print CPU model name instead of CPU type
Date: Mon, 27 Nov 2023 09:12:05 +1000
Message-ID: <20231126231210.112820-4-gshan@redhat.com>
In-Reply-To: <20231126231210.112820-1-gshan@redhat.com>
References: <20231126231210.112820-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7v2UZIhWyaAW

The names of supported CPU models instead of CPU types should be
printed when the user specified CPU type isn't supported, to be
consistent with the output from '-cpu ?'.

Correct the error messages to print CPU model names instead of CPU
type names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 05e1922b89..898c25552a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1392,6 +1392,7 @@ static void is_cpu_type_supported(const MachineState *machine, Error **errp)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    char *model;
     int i;
 
     /*
@@ -1408,17 +1409,25 @@ static void is_cpu_type_supported(const MachineState *machine, Error **errp)
 
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            model = cpu_model_from_type(machine->cpu_type);
+            g_assert(model != NULL);
+            error_setg(errp, "Invalid CPU type: %s", model);
+            g_free(model);
+
+            model = cpu_model_from_type(mc->valid_cpu_types[0]);
+            g_assert(model != NULL);
             if (!mc->valid_cpu_types[1]) {
-                error_append_hint(errp, "The only valid type is: %s",
-                                  mc->valid_cpu_types[0]);
+                error_append_hint(errp, "The only valid type is: %s", model);
             } else {
-                error_append_hint(errp, "The valid types are: %s",
-                                  mc->valid_cpu_types[0]);
+                error_append_hint(errp, "The valid types are: %s", model);
             }
+            g_free(model);
 
             for (i = 1; mc->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+                model = cpu_model_from_type(mc->valid_cpu_types[i]);
+                g_assert(model != NULL);
+                error_append_hint(errp, ", %s", model);
+                g_free(model);
             }
 
             error_append_hint(errp, "\n");
-- 
2.42.0

