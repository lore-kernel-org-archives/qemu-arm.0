Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp531026lfb;
        Tue, 1 Dec 2020 13:01:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu+W35i1CDM6FwCxbx3+SH08LlRKAkEdL/Cl5/wps1mlfR9Dv9TA1ObqX5+zb04LsZ0LO8
X-Received: by 2002:a1f:a2c2:: with SMTP id l185mr4826316vke.24.1606856481260;
        Tue, 01 Dec 2020 13:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606856481; cv=none;
        d=google.com; s=arc-20160816;
        b=kVEEFUiiDq4hGnOLovrB2FV//L6wOgncR2cbQEVOAvbG70wjYBINM31HjfsmjTWs1n
         js0tDCNJFwd0NEgQK5qt22/WYbaHCJVRuE8PhbxknIGkNfYyQDeAYzDYbi0eySaygVg8
         SBf80+Da9QEUXSZGxIP1O44d5ewy8KnrGy6VQHfBOMKxu/GU/psBZ1ympcf1vCttQIAp
         VBh94hECL140sWfsRB27ePrIEIX4xVuO/YzI2FCMO1irsdx4aTsAmWfW4DUHgUJvYC7L
         mrL6dOW5xmqLIsNptyH6s4SovX/JPie4fv52E7nG/RgEj82F8BfAqgZ6yTO8gphUHWiL
         sHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=/AsPHkI1nK2kAOiaW/BPCtxION0eZEJ+bmePaRgEI40=;
        b=HIBIA772g/sGVVohxsJeHJnwxQzjRXH93bRQ36RCzfsrFc+ZLDcoGdx6kCCvGHLqPv
         NwXefgkiY+rfW3iyYIGjWtDaEhWr11OOJNkzVt1uYdmyHPbCj2q69ayzEN02Lw9V27Gz
         wh8aQ/HCfL7v0+f2y6bq5grTt8NiCleFS+ckneW0usPAJnuQr4b6+qQ02ndsG9008HA0
         JWfBZnmAVv29yK1u17JVYXS0jRWX0QVlI361HBwxBQyomJYVM8rMVRHFmhq+J8lmQYqG
         WlpcsAQV0Pc1jvNACp+mi0J9ca3tONdC0SOd5Sbu1rbdVbdG8qa7tn8WPZYGIoREUtYx
         eXTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ONPsh6ST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k129si287375vsd.304.2020.12.01.13.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 13:01:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ONPsh6ST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkCm0-0000Wj-JC
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 16:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_K7GXwMKCHkmZZdlldib.Zljnbjr-Xojklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kkClZ-0000Un-2C
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 16:00:54 -0500
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_K7GXwMKCHkmZZdlldib.Zljnbjr-Xojklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kkClU-0005kL-Je
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 16:00:52 -0500
Received: by mail-qv1-xf49.google.com with SMTP id b9so2139015qvj.6
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 13:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=/AsPHkI1nK2kAOiaW/BPCtxION0eZEJ+bmePaRgEI40=;
 b=ONPsh6STyCuLqLb2X7Fhsp9AWaE1W7juNd0EQYNmHPh1t6voeWtBPX6XKpQr6gIU9W
 uwPguHPuIgwv/QBuIowtgZqwse6zzTBJqCvDTJYV5yRH3ecQHF+KZQavtVRmjTJspoin
 qVlRvq/QYZbWJ7ZkLpTL8RVYRBAh029VySbVp8O0LlPi/eDQxsxd/q1wY0gC+oAbqn6T
 tXm9vOf1kjiqJTIxScfEK4G4PbJvkz5dyzxjcGJ8VwKmDd8wLHErGP5ABs5Tx46/hSiP
 x4Xw6kdUoVxXiXgzSWlxlN7oD+ZJq+MgX0ZiBlBedL+8CRPTksX47/dXkiQyeaZxbzbF
 jmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/AsPHkI1nK2kAOiaW/BPCtxION0eZEJ+bmePaRgEI40=;
 b=OqKlfkahNW2epDpMJ9tpSjb3RNGC9AGjdL4s8ACxSMYV3hmsTy7nakKpg4oBSQ/W9/
 Gf6BzrCLKuiVk/NVCO+nhMUMrrf4Qqw0kxyalrEYgiwE3K1cbDfJ7jwUllnb4zdW8yFe
 NxdYtG7FNOo6r0W5fL07THY0z4yt+b58FYN4DRZILmSeJiiO/L6O/QbksyhzePwaC8cS
 PuXgsCgf3NCTcNeYhoK9BwxjcCDPMHoKFPPMpQAJK06f/wuXzSINk5ZcD7OSY7RqMehI
 A6HOXciHcl0CNYQkF1/jCn0WMqtnUR9IrlQlfHRCXecFKMV+ShTm7Ffp36ch5SbJi3iD
 waEw==
X-Gm-Message-State: AOAM533vQAypbockBvqM2keen5qdbkF/juuwIMZmnL6HY5tc6a9IKzSe
 2HQqV1x8+l86OdKztm6jDpVJDqo=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a0c:8b99:: with SMTP id
 r25mr4970479qva.0.1606856444892; 
 Tue, 01 Dec 2020 13:00:44 -0800 (PST)
Date: Tue,  1 Dec 2020 13:00:37 -0800
In-Reply-To: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
Message-Id: <d91deec6e2c68a9cf0e911251992b4d845be14ab.1606856104.git.pcc@google.com>
Mime-Version: 1.0
References: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2 2/2] arm/hvf: Stop setting current_cpu
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Collingbourne <pcc@google.com>, Frank Yang <lfy@google.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3_K7GXwMKCHkmZZdlldib.Zljnbjr-Xojklkdkr.lod@flex--pcc.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Peter Collingbourne <pcc@google.com>
From: Peter Collingbourne via <qemu-arm@nongnu.org>
X-TUID: lEFTSLNm+WmC

This variable is already being set by the generic HVF code and it's a
thread-local variable so I don't see how it can be overwritten.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 target/arm/hvf/hvf.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 3321d48aa2..40984fcf4d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -364,7 +364,6 @@ int hvf_vcpu_exec(CPUState *cpu)
     do {
         bool advance_pc = false;
 
-        current_cpu = cpu;
         qemu_wait_io_event_common(cpu);
 
         flush_cpu_state(cpu);
@@ -391,7 +390,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             /* This is the main one, handle below. */
             break;
         case HV_EXIT_REASON_VTIMER_ACTIVATED:
-            current_cpu = cpu;
             qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
             continue;
         case HV_EXIT_REASON_CANCELED:
@@ -412,8 +410,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t srt = (syndrome >> 16) & 0x1f;
             uint64_t val = 0;
 
-            current_cpu = cpu;
-
             DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
                     "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
                     env->pc, hvf_exit->exception.virtual_address,
@@ -523,7 +519,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-            current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
                 arm_handle_psci_call(arm_cpu);
             } else {
@@ -533,7 +528,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         case EC_AA64_SMC:
             cpu_synchronize_state(cpu);
-            current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
                 arm_handle_psci_call(arm_cpu);
             } else {
@@ -561,7 +555,5 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
     } while (ret == 0);
 
-    current_cpu = cpu;
-
     return ret;
 }
-- 
2.29.2.454.gaff20da3a2-goog

