Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2904141lfm;
        Mon, 29 Jun 2020 04:41:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyme/CwfhB6EubUnxlyzfyAXYGmDEcVvbA9hCs+dznCFDrP9sct0HkbnhedGTlDxptwH9Mh
X-Received: by 2002:a0c:d7c9:: with SMTP id g9mr834536qvj.83.1593430914736;
        Mon, 29 Jun 2020 04:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593430914; cv=none;
        d=google.com; s=arc-20160816;
        b=eTpXpaIZvtHAsG4umBMdANesp2kP65z+33plxHBRlTvD19Z4ZMTT4dyE5NjyDUpj+D
         NFV/J47QoixWYZErYToKL5AWfHPn8fUwH36DG+jnQBQ4K6lf6oJ8cy/XtZu5iq7xsDqX
         JB+vvKzWcjvc3+p7mDDsT7sTvofse3AjVfHLNP+EQFh06YEk09UHHPjCwg1f7bAIkv32
         3hh9cEiIK8Yh5EULAUgtUF/o7L09nbSxFUES/A7h3xuBv8xTa4u22C4PBqnt5xS2xGTV
         ZDwn1I/lOGdc8oDe69tlLwKzXgAFbFNusH9KP9IWu3RcdK6R+xPjfq+xQSnNgQ0slml8
         v2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:references:in-reply-to:message-id:date
         :subject:to:from:dkim-signature;
        bh=1FU1fBES91uodcocZTWBhGuZzdEN1B5HFdMQmWwMaGA=;
        b=htGvfxoADtal6bWWJ0YRjsxkiSzoHawIaQYGuI8P50iem04GFxtRU/RjV/9U6xhWFH
         KVWKNsLx3Hjn6X56HsWtifmA1r5YjK2z7BRBV6lIuL2Y/PnNqi5jELibShTVhR8dmGdb
         l4bS81RJhWZenS5j5u7BYDebOV+k6GXTJxeMeCCfgJ9uL+L5DmJR1rKYMS0pkc/u1iRl
         uAnYUuQ9EwhG6yMWSm9jui1PSc1CwUwsMo7sHT9OEHvDZATkdal8f7FM6OrZ29Hmho9j
         Wc4aUHIS5FZ4DPgJ/Se805v9whVmeaO4VQ73BSZdea7zbLOtPjKAOrb8nzu7t0MkId/2
         Cg0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=OTm0pmvu;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m10si20201008qvu.2.2020.06.29.04.41.54;
        Mon, 29 Jun 2020 04:41:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=OTm0pmvu;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6056D4B3EC;
	Mon, 29 Jun 2020 07:41:54 -0400 (EDT)
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
	with ESMTP id 8yj1i2sFr2ZA; Mon, 29 Jun 2020 07:41:53 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4BCEA4B3C1;
	Mon, 29 Jun 2020 07:41:53 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A4F294B3A1
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 07:41:52 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bryYOialSy-f for <kvmarm@lists.cs.columbia.edu>;
 Mon, 29 Jun 2020 07:41:51 -0400 (EDT)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 829394B353
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 07:41:51 -0400 (EDT)
Received: by mail-wr1-f66.google.com with SMTP id z13so16206577wrw.5
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+N/Jb/9fABxRBXbzXUyw1dPFqrsVkXAj2MZB4cZU2HI=;
 b=OTm0pmvuCO+k/dWFItxv7oFeb72xGsREPC8+WSPUi1wupSW69mGYtJM38gdow8pyVH
 4C055COveRzzQF0C631MmxFd2HewCMXZ9/ay/inkWxRCR2FNnePUObpww5vMuA5cVgOQ
 8P6qrE4+7WC3+gVaM4DoLimE5iKH8a9Yp5RV0lrh92hOf5nzat57vd77GHrTffY/KS+Z
 xf4P1ejqJnnEqSDSoR4BDeX9tw7yEKVsv/zX+MGXR0GxBjzJrSMS/pMUda3xyonKcvwA
 z7PAqBcjON87cqFD0QRsOW3S5PP+6r7B3g/DWm114sY0otVkyt9Bl4d+qaPxALBMG9pi
 BjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+N/Jb/9fABxRBXbzXUyw1dPFqrsVkXAj2MZB4cZU2HI=;
 b=GAh9sdM6RStFJgwJ1spXkvnQ0qtMhiEotXLc0VFIORVWhWlxIGuyD+r+3ygmv8nJ/k
 stP3Adl9dXtzx8m2HLeaxZ9jKDeiL7dRuVMvFm+Fon0wap39wgetGX882lcWWX48Hy9x
 ArFF9a/Edq1Liomixz52Cbth03IlNbWnwJoLadNQoMsZn3KTHMwn+0pNXPxyCEQEt6QY
 Rb1fA8hIPj1a0lxHb/CXvW2RVjJqif2KMmRNXBzUv3X/prUwEyFfx8ByO3KzK/yAN+/s
 SggB4PEMSYOZCbHvJtfOggIp1ovoE/4pdzdtQ2srEImOlpIfo64Yc8Etsv/FbzcHXBG1
 LA2g==
X-Gm-Message-State: AOAM530foNXjYbOV2ZepPv2Ph8Xydbgyjsf8r40XNr95eGlhdgFHZafl
 OD2438wEsnefHD2FtEBwf5HMeQ==
X-Received: by 2002:a5d:6990:: with SMTP id g16mr8587737wru.131.1593430910515; 
 Mon, 29 Jun 2020 04:41:50 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-139-146-71.range86-139.btcentralplus.com. [86.139.146.71])
 by smtp.gmail.com with ESMTPSA id c2sm49486357wrv.47.2020.06.29.04.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 04:41:50 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 1/2] target/arm: kvm: Handle DABT with no valid ISS
Date: Mon, 29 Jun 2020 12:41:09 +0100
Message-Id: <20200629114110.30723-2-beata.michalska@linaro.org>
In-Reply-To: <20200629114110.30723-1-beata.michalska@linaro.org>
References: <20200629114110.30723-1-beata.michalska@linaro.org>
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
X-TUID: H6oXdmbue7Pw

On ARMv7 & ARMv8 some load/store instructions might trigger a data abort
exception with no valid ISS info to be decoded. The lack of decode info
makes it at least tricky to emulate those instruction which is one of the
(many) reasons why KVM will not even try to do so.

Add support for handling those by requesting KVM to inject external
dabt into the quest.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index eef3bbd..545d2ba 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -39,6 +39,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 
 static bool cap_has_mp_state;
 static bool cap_has_inject_serror_esr;
+static bool cap_has_inject_ext_dabt;
 
 static ARMHostCPUFeatures arm_host_cpu_features;
 
@@ -245,6 +246,16 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         ret = -EINVAL;
     }
 
+    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
+        if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
+            error_report("Failed to enable KVM_CAP_ARM_NISV_TO_USER cap");
+        } else {
+            /* Set status for supporting the external dabt injection */
+            cap_has_inject_ext_dabt = kvm_check_extension(s,
+                                    KVM_CAP_ARM_INJECT_EXT_DABT);
+        }
+    }
+
     return ret;
 }
 
@@ -810,6 +821,42 @@ void kvm_arm_vm_state_change(void *opaque, int running, RunState state)
     }
 }
 
+/**
+ * kvm_arm_handle_dabt_nisv:
+ * @cs: CPUState
+ * @esr_iss: ISS encoding (limited) for the exception from Data Abort
+ *           ISV bit set to '0b0' -> no valid instruction syndrome
+ * @fault_ipa: faulting address for the synchronous data abort
+ *
+ * Returns: 0 if the exception has been handled, < 0 otherwise
+ */
+static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
+                                    uint64_t fault_ipa)
+{
+    /*
+     * Request KVM to inject the external data abort into the guest
+     */
+    if (cap_has_inject_ext_dabt) {
+        struct kvm_vcpu_events events = { };
+        /*
+         * The external data abort event will be handled immediately by KVM
+         * using the address fault that triggered the exit on given VCPU.
+         * Requesting injection of the external data abort does not rely
+         * on any other VCPU state. Therefore, in this particular case, the VCPU
+         * synchronization can be exceptionally skipped.
+         */
+        events.exception.ext_dabt_pending = 1;
+        /* KVM_CAP_ARM_INJECT_EXT_DABT implies KVM_CAP_VCPU_EVENTS */
+        return kvm_vcpu_ioctl(cs, KVM_SET_VCPU_EVENTS, &events);
+    } else {
+        error_report("Data abort exception triggered by guest memory access "
+                     "at physical address: 0x"  TARGET_FMT_lx,
+                     (target_ulong)fault_ipa);
+        error_printf("KVM unable to emulate faulting instruction.\n");
+    }
+    return -1;
+}
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     int ret = 0;
@@ -820,6 +867,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
             ret = EXCP_DEBUG;
         } /* otherwise return to guest */
         break;
+    case KVM_EXIT_ARM_NISV:
+        /* External DABT with no valid iss to decode */
+        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
+                                       run->arm_nisv.fault_ipa);
+        break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
                       __func__, run->exit_reason);
-- 
2.7.4

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
