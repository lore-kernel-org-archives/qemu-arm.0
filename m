Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp115706lfb;
        Thu, 3 Dec 2020 15:49:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNne7NsuIW/8h6sN3U4RhuZh7uOK6m3I2IOJoSgZ/r+Ar3IeEfzVsRC8JVVrTI8aTPRdgY
X-Received: by 2002:a25:aa06:: with SMTP id s6mr2173320ybi.147.1607039362668;
        Thu, 03 Dec 2020 15:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607039362; cv=none;
        d=google.com; s=arc-20160816;
        b=Fai5dJrdW0mcMrwabzpIe7FW23yTCsV75xCewlxLa/ndKBez+RH+sJPAgWNAqxgWfj
         15tt7L/8vv6mNe8P1byQng+4XAFxXW/aOdQeUBnvOAR55uXP4/MfKIdtI16wk8Ouojql
         WhWKXUdEBBQCp0h0l1w2ZCW3E3Y4nsPHfAKrQQiRZfXepb4NrYhtXzfaQUK6j3ue6U90
         znx8z5LMDmGHnQWKBGtOf1z+8hKJz1fdy34lgGXDsoILVSUJyvA3EuJuyBsWPltvzo+t
         c8U7LCHQcu1+M2Kb0aEaHr6Q7MJN1El/2sopQzsc9sgnyrzICzGrkoDYjnXaHHAMozJI
         l9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=H5deyPrwE3IzxOIXMU4dD0SbZe+B5VUDzXikZJT1Mmw=;
        b=akwiOsV5IW9EIh9B9lxsTMrGucABWEsHbZi3Kta/7lzO/e1RDkB3DBVPK9cILuW/IL
         NZ+YQ35r6/XJyJXqxrhpdcwGPuR8E5fvO4cR0qE7pdbkMFwuQJTOGcmhGBZxO0X91zUm
         TRwm4aXtPy7ExwCqlF1q9kp9DJqV8rzkIxBvAlE+e9JuwT6/cjmfgaQ2Ox3j8rLh7yOj
         dvq2VGeKQKiZDLEKeUQdw6+dC5+iXgeaY/DtqQCePj3uAmU4teLjPgP6mk0ho+ftDlNe
         +OymV8L6kPCcS+d1jvr5Xi8ejPRgKzxp+NhMuSwpOAN0rBGlVS90zeEFTDba6h6jKpjI
         eBNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si358730ybe.280.2020.12.03.15.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 15:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkyLh-0002Wi-Vt
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 18:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLS-0002W5-W7; Thu, 03 Dec 2020 18:49:07 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57482
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLQ-0003Lj-Hc; Thu, 03 Dec 2020 18:49:06 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id 40CE339003D2;
 Fri,  4 Dec 2020 00:48:59 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/11] hvf: x86: Remove unused definitions
Date: Fri,  4 Dec 2020 00:48:48 +0100
Message-Id: <20201203234857.21051-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
References: <20201203234857.21051-1-agraf@csgraf.de>
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
X-TUID: WirLBgKnT/Oi

The hvf i386 has a few struct and cpp definitions that are never
used. Remove them.

Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
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

