Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2868053njb;
        Mon, 9 Dec 2024 12:38:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUATxE/w166JLf7rdN0RXjq7Li6x+XrIj4yipXbK7txxzfS5r2CXvTCES53ZS6OhGneML8wWTJJSeC73A==@linaro.org
X-Google-Smtp-Source: AGHT+IES8HEyfBEjLlYk6dHgXytccSrr3LgT7EBDpgkOSZYaI/+CpifACHiwTgUGMMyoSO53dBhM
X-Received: by 2002:ac8:7dcc:0:b0:466:94d8:926c with SMTP id d75a77b69052e-46771ecfa2amr26555151cf.13.1733776724052;
        Mon, 09 Dec 2024 12:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776724; cv=none;
        d=google.com; s=arc-20240605;
        b=SOHNOcCaI6ccRSIf3KwGbdPF6fKtInYRZ3RyZvGMn7B4cppw4x8kT9eQAwuLQ0sCNG
         mGiCnF+71gR0lGlyo+o980TfqMuyXX1mq/nN5r05DZzIAJjpXmajLf5J+A18nu/bCNC1
         I+ofz7gdyus0OYOuqz0qKoW/u6fa6AIyvG6cL6pBbh5+BtKsdbQMAX1Gfmm6U7QA0QsE
         hFQOTgbS0YJDrTfQIkhLfDEzED9vIgBUEkpwBcXAsyb6zFhWzrcQLMqNxC5IL89bXL9A
         9R1s8DNopD12gbPjfcmR8OyansdC1tirOWEMfnhINIQql6A+bLgG4HK6tRexwPZqwLdY
         G7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=80w6MVYCpseGDOCn7UKs1ZHKVvdaX2IHhBei9UGetlE=;
        fh=bQkS108b468PDWrMlLdqLKWA8DzC4ZergiF0RQEBaSw=;
        b=gQQ0pFv1iYLDlwv0MpZzqm042uGQTjnqiKgkMfJgwTtP/Wpd5NDCX44GmSuw1R2aHi
         BUmneOjSFqQig6XouRW38cOC888ISYO1vfS3PMKi7kRjeLbWVS4X0f8C4khSuhJSKuZq
         tWRytOIonEtqdgvIfcQnSUvmo3B2Z6eRGXV6YUcHxY7uD4gThTwctg5rlSkZswibejiT
         3oTEaZ9E5zZvTFfN/keqAmXLWrVHil2Ha3Dk3UnWXGlYekTBeamJ581CU2cZp40G5Jmv
         l4rRO9BpADD3bXVVuSVIhnzxgPnrUjjLCJZBb8aUkprjwlfNFikCD+8gvNh/6EJYQF5t
         AMOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=rfuVEk5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4674d3d98ffsi67428961cf.288.2024.12.09.12.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:38:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=rfuVEk5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tKkVD-0006I5-Is; Mon, 09 Dec 2024 15:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV8-0006EC-Te
 for qemu-devel@nongnu.org; Mon, 09 Dec 2024 15:37:06 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV6-0003De-Sp
 for qemu-devel@nongnu.org; Mon, 09 Dec 2024 15:37:06 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso966119666b.1
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2024 12:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776623; x=1734381423;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80w6MVYCpseGDOCn7UKs1ZHKVvdaX2IHhBei9UGetlE=;
 b=rfuVEk5WfTeJ3xysFPn1GjsVsvOqMg33iFMtgDaa0Nbhs6EflHvGkWrHAQ5mO/sdN8
 p5fzjMM4JUWjHGUNyiSbkr71Qmq9kC4TPshkr7tDu/ywm8FqQk+6qkTpp9UXDHbsqxe3
 7wmZY1oGFouc/xWdWtQW62FHZ9mjkk+R47AzAX86qpg2AT4I0aD7P8dYmul6phKDlvWb
 lhYbZAiQf6fXHm+AlnaRqhldOSy9oEhBkZM44Z2Vjqccn3bv/+BhiWxmSmFD9+qOHtDT
 mC0K9uduRaiq4JNndGfSI7zgkQLwRx+5f/Z4M2eGsTulQUe6qBGhQjzFrx6IH0WyxMXk
 RGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776623; x=1734381423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80w6MVYCpseGDOCn7UKs1ZHKVvdaX2IHhBei9UGetlE=;
 b=eVdiRcBxT0cIgZp5fepC4BW/edj1tYLnhAp5BT3yYKPJ0IdFCjEdruMJLGdaMkyMb0
 GT51sfr7ZFy9BkPJ/7lOMWhEVIU+mKYZpCniHidK1WCUxewIv7pdOYQ0J5oTwg88W+gT
 EzDgRosAJDQJlSewMx8yU4iS0FWClR+LUOhXCl7T14JUUMut0HQpm6OUDnl6qssmsage
 otwyDJ8H8phYM9gRAVz/iz9YFU84eVk3gi5w2GJvCNEOBA5Aen9dYtkIhnF0kDqjkIUP
 HaeKhSWolj12DDtH0nksTEufqD5BJGnbNbknHNLVrXCpnGQQ8XFSF+kkM2B+SGtvRvBD
 06pA==
X-Gm-Message-State: AOJu0YyK323DY7NPIQHtueSjPtd6zA+09ELL4uDJBr76MMvQVih2vURO
 TzWQjf0nIG4DerjNwqoEzrmyi/69HYBM08ZcLvNOGusD9sUfnenEQCHnhmcdRyV2Y/OFuTPOyO0
 +TA==
X-Gm-Gg: ASbGncv15YGbtCZyb2BKkearM/6jcIqbMLN+y6xtyplAPwTNe7CDXBs2U24kfaIj29f
 fViwyW8mgxaeyVOAVXHAQ9pc69ate8vOdUUV+/8XLwwiawprSB2dWib2ylSlr3Bi2df0bY2A4rH
 1Z663M/0zQYIf/I6yM1x9Dv1PGqTklzxXWXydOHd8DnCkZ50GPwiNHrkjh29lA3zuMNJgIyRdsA
 MXA5e3QcrrI5E1bbGZauUbpEXW/fyByhYM6A/fw9W32W219R9QAhyRD8oc9e3u08YP8qYl+FOsh
 nA+eF8FRZ3GiZTAWwcWzGpL35WULJw==
X-Received: by 2002:a17:906:9ca:b0:aa6:8430:cb02 with SMTP id
 a640c23a62f3a-aa69ce64479mr187055566b.61.1733776622848; 
 Mon, 09 Dec 2024 12:37:02 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:37:02 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 05/11] i386/hvf: Decode APIC access x86 instruction outside BQL
Date: Mon,  9 Dec 2024 21:36:23 +0100
Message-Id: <20241209203629.74436-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241209203629.74436-1-phil@philjordan.eu>
References: <20241209203629.74436-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::631;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: pWEJUh8wg47P

From: Phil Dennis-Jordan <phil@philjordan.eu>

The HVF accelerator suffers from severe BQL contention under common
practical workloads. x86 instruction decoding for software-emulating
faulted instructions is a somewhat expensive operation, and there
is no need to hold the BQL while performing it. Except in very
unusual edge cases, only an RCU read lock is acquired during the
instruction fetch from memory.

This change therefore moves instruction decoding for APIC access
VM exits to before the BQL is acquired. This improves performance
on APIC-heavy workloads.

It would be nice to eventually move instruction decoding outside
the BQL for MMIO EPT faults as well, but that case is more
complicated as not every EPT fault exit needs decoding/executing.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 target/i386/hvf/hvf.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 095f934923..3f1ff0f013 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -444,6 +444,7 @@ int hvf_vcpu_exec(CPUState *cpu)
     CPUX86State *env = &x86_cpu->env;
     int ret = 0;
     uint64_t rip = 0;
+    struct x86_decode decode;
 
     if (hvf_process_events(cpu)) {
         return EXCP_HLT;
@@ -481,6 +482,11 @@ int hvf_vcpu_exec(CPUState *cpu)
         rip = rreg(cpu->accel->fd, HV_X86_RIP);
         env->eflags = rreg(cpu->accel->fd, HV_X86_RFLAGS);
 
+        if (exit_reason == EXIT_REASON_APIC_ACCESS) {
+            load_regs(cpu);
+            decode_instruction(env, &decode, ins_len);
+        }
+
         bql_lock();
 
         update_apic_tpr(cpu);
@@ -519,8 +525,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             slot = hvf_find_overlap_slot(gpa, 1);
             /* mmio */
             if (ept_emulation_fault(slot, gpa, exit_qual)) {
-                struct x86_decode decode;
-
                 load_regs(cpu);
                 decode_instruction(env, &decode, ins_len);
                 exec_instruction(env, &decode);
@@ -559,7 +563,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 macvm_set_rip(cpu, rip + ins_len);
                 break;
             }
-            struct x86_decode decode;
 
             load_regs(cpu);
             decode_instruction(env, &decode, ins_len);
@@ -664,10 +667,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
         case EXIT_REASON_APIC_ACCESS: { /* TODO */
-            struct x86_decode decode;
-
-            load_regs(cpu);
-            decode_instruction(env, &decode, ins_len);
             exec_instruction(env, &decode);
             store_regs(cpu);
             break;
-- 
2.39.3 (Apple Git-146)

