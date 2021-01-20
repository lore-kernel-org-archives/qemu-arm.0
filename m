Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp395560lfq;
        Wed, 20 Jan 2021 14:45:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWG+7cpf1g/WImNXK7a7zVkenJad1E4SWDfK5GTlWb0aqbirStcW5LP9rQHVY3s56MKtnL
X-Received: by 2002:a25:5303:: with SMTP id h3mr17576219ybb.58.1611182753053;
        Wed, 20 Jan 2021 14:45:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611182753; cv=none;
        d=google.com; s=arc-20160816;
        b=Jabr6TzrwGCzH/zTvu51BRBnVFYEfvh9VXp6uC29sY6R21cQVOGvCbYFumq8LWjTpK
         2Whl6a3DFGvyOz8Yx8MkWKn6pB9ZK6CKC6TBtDGUyHw9X2osmWCtfiDIm4B8P1ZZcuF9
         T7qS/E3GJE9exyi5utIU4D6DBgzWsGbaJI2ANQIRD5gvBUzrB9p63qpN3jvLKxGQDgVc
         +C6y4fAmTQDh2HtxLZvEi4W7nJXbbxvpVKQz1b6Eut+HdxlPyHaJ9MfMlDVQ8UPeZCIf
         RNppKEdcrj6z/2KCNjvblobPj1XqCbQ6F3dum4EmZEwcVyHtrMLAdNPrqYU+i8SIx5pS
         lZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aaOFCptlfmMRp0wsZafUm5dehOxaltM4new/NYJD2aU=;
        b=lBY6QOmWaMinBJCHyCEtoZlgELrUGNAIT00wZ4IXccO/6juXIEg+3USq14UUyDwooY
         17XIx5twVzCrc1IV/SvOBoD0aE0cjXg/3k8VwYgDuZ3cxOSd+KO0ScAIrmEm/+k/kQ6L
         5xdflsPFmINpfgdncR4vq6MgpPBLhKAtCSg++oIia2sMCd5dyV6e5J1DHw4uVnwvTYcL
         SdjqlXVEjVblMpb3cjUKSXJOp3ut2Sus2ZIY6z85OuGI9In3ZVSLQ76D/1UphWXEf7if
         3M8AYGRe64bLVw9Miti3j/qW4MlaWHuJqduAJQKhg/2t9azNI6eqUKxG2C8m0wVMSFGD
         37mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i85si1796684yba.109.2021.01.20.14.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 14:45:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2MEa-0004Oq-Cz
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 17:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1l2MDd-0003rK-KI; Wed, 20 Jan 2021 17:44:53 -0500
Received: from mail.csgraf.de ([188.138.100.120]:45112
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1l2MDa-0001Sq-PA; Wed, 20 Jan 2021 17:44:53 -0500
Received: from localhost.localdomain
 (dynamic-077-002-091-253.77.2.pool.telefonica.de [77.2.91.253])
 by csgraf.de (Postfix) with ESMTPSA id 4B0233900496;
 Wed, 20 Jan 2021 23:44:47 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/11] hvf: x86: Remove unused definitions
Date: Wed, 20 Jan 2021 23:44:35 +0100
Message-Id: <20210120224444.71840-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210120224444.71840-1-agraf@csgraf.de>
References: <20210120224444.71840-1-agraf@csgraf.de>
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
X-TUID: FfJyOZ00QXOB

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

