Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp171245lfq;
        Fri, 11 Dec 2020 07:13:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwowBGYWMvQtHwxxmKf6Ueah7vmMTEbbfiuq5dOXn8wIn5nBnJa91M/Ij+ud+eS9or+HuXX
X-Received: by 2002:a25:2a11:: with SMTP id q17mr19643464ybq.477.1607699608578;
        Fri, 11 Dec 2020 07:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607699608; cv=none;
        d=google.com; s=arc-20160816;
        b=dq5ImcayCWEWPJSPxo5oj4nxICs24IHUwvLWIgUlxr4AxYQNKpDUxjYBuOQ1QVhcw3
         3hilAtObQG9LxTDAuxjVsPfDqkeQpk575zuDSXgQO2uYpEE55El+3eFxqArtIUCTe8eZ
         UJsfhQ9SHwFACa6sMFk6M9qvBOVlII+ZRcWmucZnKrMNLplEeK2OLLetVrCPhhZ6xzYM
         53rMu4zRiae3AHWv5Z+J8W92LOBHvDvfovDxmBkztISJ6ZwdU3T5Y7xPIcx2JlpXLV22
         FCtyyVMjUU9cuJqNYMFP7LjbRZRYCUMjn4ZIDkXw8Fnkao4iRnIyMltNtwi5qq1+cxUA
         shRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aaOFCptlfmMRp0wsZafUm5dehOxaltM4new/NYJD2aU=;
        b=pTc/AQaUm22U5SQaDfJZbrxnxG3ejEaQkLE9RGwrnzmbjb4g+jPHIQOLEkzbTlP9Wf
         ugyYhZ4wTaZjqUspQy0R8KnVl+pIrrqfJRjOexaYb76aoY0AHfySN74vsn532VzaioAP
         IrGpjW5rsBNtC/ZNuuXC1OzhyjXwa+sKgJcBoI+jOfmhcvthYfv0IlbzJUz7fW1Nvo+u
         8050v0Az0JzxKpazkC9yu+cCOsVxq4s3vytI966IFetiyu4014WgsvZ7oRxgvsfEO//V
         wy3WV46cd0oLmQxBGK6apFdc4dYyUeUiHhL87PHjYv75UBQ21AIQ6ckq/YfYf+QbcAXP
         ESXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p79si7892192ybg.205.2020.12.11.07.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 07:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knk6p-0007Rz-RR
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 10:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1knk6V-0007Rj-SU; Fri, 11 Dec 2020 10:13:07 -0500
Received: from mail.csgraf.de ([188.138.100.120]:36504
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1knk6S-0001sc-Ju; Fri, 11 Dec 2020 10:13:07 -0500
Received: from localhost.localdomain
 (dynamic-077-007-081-179.77.7.pool.telefonica.de [77.7.81.179])
 by csgraf.de (Postfix) with ESMTPSA id CE73239004C1;
 Fri, 11 Dec 2020 16:13:02 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/11] hvf: x86: Remove unused definitions
Date: Fri, 11 Dec 2020 16:12:51 +0100
Message-Id: <20201211151300.85322-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201211151300.85322-1-agraf@csgraf.de>
References: <20201211151300.85322-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4qZr2mtdVMhW

The hvf i386 has a few struct and cpp definitions that are never
used. Remove them.

Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 target/i386/hvf/hvf-i386.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index e0edffd077..e31938e5ff 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -21,21 +21,6 @@
 #include "cpu.h"
 #include "x86.h"
 
-#define HVF_MAX_VCPU 0x10
-
-extern struct hvf_state hvf_global;
-
-struct hvf_vm {
-    int id;
-    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
-};
-
-struct hvf_state {
-    uint32_t version;
-    struct hvf_vm *vm;
-    uint64_t mem_quota;
-};
-
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
 
@@ -75,7 +60,6 @@ hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 
 /* Host specific functions */
 int hvf_inject_interrupt(CPUArchState *env, int vector);
-int hvf_vcpu_run(struct hvf_vcpu_state *vcpu);
 #endif
 
 #endif
-- 
2.24.3 (Apple Git-128)

