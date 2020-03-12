Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1417197lfc;
        Wed, 11 Mar 2020 17:35:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu9htxbkUXV80v0IOm6w+DO933Di0FutscISFcIRg0geczKxYOBXbqPZjJyaVM9lnYTtBkl
X-Received: by 2002:a37:b201:: with SMTP id b1mr5202019qkf.111.1583973300059;
        Wed, 11 Mar 2020 17:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583973300; cv=none;
        d=google.com; s=arc-20160816;
        b=X+huj758e/V8J+8LO/fb97/bFKo6qT8CpqPlkssnn4MFHru/6w4wRdkOLWTivV6RLG
         HJEs3rx8E/UxzfXfTc8/GOGIiGnqGdy8PyMR5mKuN9iMbItOtv3TpMM4AwrCC+knMYi/
         DO8QjRz9pmTPybTZ3sV7ZVuxxOh968dF5WrcxHbc53iAzREEF39t9yNH+0dz/ovQFwdg
         CCEobDBLcquF31B1qY5cARTq4pCK9m9zAQM4CBP0BqgS8EMUszobD2ZYvGQqUDPgRIdG
         XbxTYfLWuKdnU7QRWdzoBjTzEq6EIvpTVhW21suyO1r3JnOelG4Rix6wlPHCcU0B+3VM
         5+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:references:in-reply-to:message-id:date
         :subject:to:from:dkim-signature;
        bh=Uej0kh0cXvVXqLZqz9g4xbWlyuPrarYCla7fvSmE1Jw=;
        b=irfsySgZLT0vbanWLLnrMfftHMPrKMVIJXjyVCXpVS/st7meyA7rdtjvz0HHRyi9ux
         Pv/rYnSc1Se2k5kA/vcnOu7aaweHo9YLSdxIgeXbg7RF/2tgdMvVTf0fD4p6VwM3ycWM
         ZfRGKeaPvEP49yBO5d+vFL71WbZ8knhYAQVULyeqxPECHIGhzYoR9H4jrjjvFVWF1ctY
         Lxas7txM3sR94F6xnqMMvROy/gQP8VQcl08asl39E3TadnWbv8W0TWrsnHuWCII73ylC
         vqri7HLF0ZyfG64P3sVnp1cWK2JtEncYLo38NoEH/amOabVXoSPuEzeVbnzvSKO3Grnv
         GbWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=xddIzZal;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q50si1866864qtq.333.2020.03.11.17.34.59;
        Wed, 11 Mar 2020 17:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=xddIzZal;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id B8D724A5A6;
	Wed, 11 Mar 2020 20:34:59 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwUaCTjCc0Mu; Wed, 11 Mar 2020 20:34:58 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A24634A4A9;
	Wed, 11 Mar 2020 20:34:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 345724A4A9
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 20:34:57 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryFbqROKKc17 for <kvmarm@lists.cs.columbia.edu>;
 Wed, 11 Mar 2020 20:34:56 -0400 (EDT)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 3DDFF4A1B0
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 20:34:56 -0400 (EDT)
Received: by mail-wm1-f66.google.com with SMTP id 6so4203781wmi.5
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 17:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rXYfzcBdKI5ubAvqSEIb2KdH42aC5HB1minn7mytn4g=;
 b=xddIzZalQNmm/l4Gy0NEAYwaXcrL17gpkIXF++rfjqb/ruGOmFVAKecoP++D7PRuvL
 cAvRDXQO9Xrg+CDrABN5YPbFnDe3rz3lOHwHiXznBXEiNJbIxoTlSZUAtfwd9vbA/TT9
 wsiobf57P7AdMTK4ZQkUA+KGjWxL248jgcjVX9ytdV37ENRv3shVAjaNextivR/QvmC6
 KttoeU/6CMZG+wP48unX91J7j3EH680Jo9GuHk8BPe8R0qfwZfvMl04M3Sqiz776AuQG
 ue83r06V738R0wgVtwy4xO3sXNK81O3SK3Y4okSHrYkmM3ky38at0vNHUE9hWxBitJKl
 0PGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rXYfzcBdKI5ubAvqSEIb2KdH42aC5HB1minn7mytn4g=;
 b=sio6eY7qpMDNVcjGNpMcWZvXa4+/HZOXJcRouYBFGWy9xU39QoGYjcDi3BzJ+XHsQf
 B3ug/6qoB8fpkdUNLRLGq9v6DrG4DbPBqHyHktysAombCCUuedtoMIpt7Zm+XRFnthlh
 Lct7Gt4vvXZMG/eLp0eFq0RnjK2K95KNM8Q7t79n3GIC5KTa6wednVgOy6sB5UAHQ7kk
 jBsecVeDJSPd+xSYYi6e5WipxZiM+5MUC5UbLGzbsQTwsmusto9pbGiGr5vWrE5L/A7u
 Rrsq/wagnYtfG454SFFGWCumXXoXkpMah/mmwG6pd1wBjFKhj4crJNpEfZYBYgYQanh+
 9fFQ==
X-Gm-Message-State: ANhLgQ3Bcf6e+ideK7U7R5WPM4Iv4dOTr/t9wpTRvxac635NXWue3rgk
 5hoTyG/2Je6CqWNhlmWjoc3yXQ==
X-Received: by 2002:a7b:c458:: with SMTP id l24mr1273688wmi.120.1583973295268; 
 Wed, 11 Mar 2020 17:34:55 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-139-146-66.range86-139.btcentralplus.com. [86.139.146.66])
 by smtp.gmail.com with ESMTPSA id o5sm10909988wmb.8.2020.03.11.17.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 17:34:54 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] target/arm: kvm: Inject events at the last stage of
 sync
Date: Thu, 12 Mar 2020 00:34:00 +0000
Message-Id: <20200312003401.29017-2-beata.michalska@linaro.org>
In-Reply-To: <20200312003401.29017-1-beata.michalska@linaro.org>
References: <20200312003401.29017-1-beata.michalska@linaro.org>
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: iyYkHDYPlTpJ

KVM_SET_VCPU_EVENTS might actually lead to vcpu registers being modified.
As such this should be the last step of sync to avoid potential overwriting
of whatever changes KVM might have done.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
---
 target/arm/kvm32.c | 15 ++++++++++-----
 target/arm/kvm64.c | 15 ++++++++++-----
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index f703c4f..f271181 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -409,17 +409,22 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
-    ret = kvm_put_vcpu_events(cpu);
-    if (ret) {
-        return ret;
-    }
-
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
         return EINVAL;
     }
 
+    /*
+     * Setting VCPU events should be triggered after syncing the registers
+     * to avoid overwriting potential changes made by KVM upon calling
+     * KVM_SET_VCPU_EVENTS ioctl
+     */
+    ret = kvm_put_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
     kvm_arm_sync_mpstate_to_kvm(cpu);
 
     return ret;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 93ba144..be5b31c 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1094,17 +1094,22 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
-    ret = kvm_put_vcpu_events(cpu);
-    if (ret) {
-        return ret;
-    }
-
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
         return -EINVAL;
     }
 
+   /*
+    * Setting VCPU events should be triggered after syncing the registers
+    * to avoid overwriting potential changes made by KVM upon calling
+    * KVM_SET_VCPU_EVENTS ioctl
+    */
+    ret = kvm_put_vcpu_events(cpu);
+    if (ret) {
+        return ret;
+    }
+
     kvm_arm_sync_mpstate_to_kvm(cpu);
 
     return ret;
-- 
2.7.4

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
