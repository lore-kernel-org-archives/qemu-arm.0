Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp1051754njc;
        Thu, 13 Feb 2025 20:18:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFcmecZxGmBgxnkTNxWP6fi6wJSu1Eae6vqMlJEL4q6y+0aXepq8npHVOdHRC1JBtaZJ6frthHnQbzfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFM4TKUBtJyp/rn43oKZ19pVBBRXcA4bM7/VJCiv5q+NWfJFaWAEUeqCifpugh1ZH/CAV3M
X-Received: by 2002:a05:620a:4081:b0:7c0:5ed7:6d80 with SMTP id af79cd13be357-7c06fccebaamr1564465885a.44.1739506709380;
        Thu, 13 Feb 2025 20:18:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739506709; cv=none;
        d=google.com; s=arc-20240605;
        b=I93If7i4pTP2HNzs5hf25c0yXYXo7ataGE7nXXR/6u7V6G0W0mfhJnoVkRcp/eeLhc
         1olc/twOPCxllIyaeH7OhTWSBt6WZHLsQWEHQ4FsgSAfA76H8fiwRWaifuhpYYACDpcM
         pVEHULDk8Us7iKTtDiC5CBn06l+fppWk5+Z6T8EdSSAG4vW4CyT8UqtEZpJ/knfgnp7D
         lTL2tZiROzZxeKIHm0itek+AB8vOokxW7eWbWgz9USfWzppi75vbx764BNkAyj12vSPi
         q8mycDLjbTJiCVSL32ncKhpMr/X4+QqaTbyw+cLI/BQJxVfUtDVCKqWvIkB9obgD4LN1
         8v1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iolx7A0Ajzzjyh5cu4UFGHh5xMOZN6VaWDOUZQUqAxI=;
        fh=wmAecxDqeNBCKAnoeE8JRGLQLypWZwcHXbjIDFVSUxs=;
        b=MNe9lH1iz0P5tRlkZAHlM7i1+1+r4dPxXb7HsMORVzvAdPGZTAUzJPduCynJzBEhAT
         E7wSHT5HapZrGQ3cH8qrkWgds3k6W3b8vrgYLbtWCfIq8VYDgcITPcDQS4e8Xx+2TS/k
         VWS6Azz7aw8jPwRNEwdSVczV0n/5u2dU4gy9DYXgHec25gLKvL15H8kJ6bntmI7JNRzR
         y5vTIV+C3OjvuLixLC8lphXQDAjR8C6V/YxOgL4Dy+pNf4S6vcatVXp6sFI0/TxoCUrY
         9GkZMBO6/dOEGWMNXLAiRMHVRw8Lf5gP3VQwfeYGbGx16MykFonVIhxnPMAd4Wr7VWF+
         bNxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekNvXHvt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c8bb610si252350185a.540.2025.02.13.20.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 20:18:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekNvXHvt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tin8n-0005XP-S6; Thu, 13 Feb 2025 23:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tin8m-0005X2-Qo
 for qemu-devel@nongnu.org; Thu, 13 Feb 2025 23:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tin8k-0002bp-Nf
 for qemu-devel@nongnu.org; Thu, 13 Feb 2025 23:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739506641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iolx7A0Ajzzjyh5cu4UFGHh5xMOZN6VaWDOUZQUqAxI=;
 b=ekNvXHvtvDaSM8NhUYRtrxjGRKabwCeUYsgi5gzl2VRt8EpFAznslc7+M8VVDEievnjjXd
 EZKNarfHacL39xsfTua6fCONJz93Mw+36qSaYKfUlEGwXD02ShXeOyKSRhmjPpbp2hIqTe
 VTBMDrfUPNPz8w26BHNhrSl5PHXrcv0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-403-jL1QjvuwPtOobPtPcIrIRg-1; Thu,
 13 Feb 2025 23:17:19 -0500
X-MC-Unique: jL1QjvuwPtOobPtPcIrIRg-1
X-Mimecast-MFC-AGG-ID: jL1QjvuwPtOobPtPcIrIRg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EAE1F19373DC; Fri, 14 Feb 2025 04:17:17 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.remote.csb (unknown [10.64.136.82])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 15839191D7C8; Fri, 14 Feb 2025 04:17:12 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 4/4] target/arm: Retry pushing CPER error if necessary
Date: Fri, 14 Feb 2025 14:16:35 +1000
Message-ID: <20250214041635.608012-5-gshan@redhat.com>
In-Reply-To: <20250214041635.608012-1-gshan@redhat.com>
References: <20250214041635.608012-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sCY+sw/euRTY

The error -1 is returned if the previously reported CPER error
hasn't been claimed. The virtual machine is terminated due to
abort(). It's conflicting to the ideal behaviour that the affected
vCPU retries pushing the CPER error in this case since the vCPU
can't proceed its execution.

Move the chunk of code to push CPER error to a separate helper
report_memory_errors() and retry the request when the return
value from acpi_ghes_memory_errors() is greater than zero.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/kvm.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5c0bf99aec..9f063f6053 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2362,6 +2362,30 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
     return ret;
 }
 
+static void report_memory_error(CPUState *c, hwaddr paddr)
+{
+    int ret;
+
+    while (true) {
+        /* Retry if the previously report error hasn't been claimed */
+        ret = acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr, true);
+        if (ret <= 0) {
+            break;
+        }
+
+        bql_unlock();
+        g_usleep(1000);
+        bql_lock();
+    }
+
+    if (ret == 0) {
+        kvm_inject_arm_sea(c);
+    } else {
+        error_report("Error %d to report memory error", ret);
+        abort();
+    }
+}
+
 void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     ram_addr_t ram_addr;
@@ -2387,12 +2411,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr, false)) {
-                    kvm_inject_arm_sea(c);
-                } else {
-                    error_report("failed to record the error");
-                    abort();
-                }
+                report_memory_error(c, paddr);
             }
             return;
         }
-- 
2.48.1

