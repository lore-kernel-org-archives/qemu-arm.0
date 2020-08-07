Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2426749lfy;
        Fri, 7 Aug 2020 01:12:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJi+8cda0PcsXrYNcENszDxeyQeDH61hMkcEpAy97A2x+3sl4Z+VRJ3pCd3N6JYF6uz7gl
X-Received: by 2002:a25:cc43:: with SMTP id l64mr18428747ybf.299.1596787922117;
        Fri, 07 Aug 2020 01:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596787922; cv=none;
        d=google.com; s=arc-20160816;
        b=hY/FvFAb7VDxQBNygMFtrXA4RqGm9if3EbYYSaOGohDy10IBaWMQalLxaU+aXTbPM7
         Yh7lJo8uERxMWa2PyVmzuXdGejrfkh8HdEi85Y2LMX6xuTlA73BOtzHga8ao9Gobnjoa
         pDnFiMLn4FdfeWW/T4skNCh7XReOFKub3MDUKP0iiToZ7Fva2Qlqq51jX7Ijzm1c7ADv
         bQp/gI/jCHGOvJX6oKaEWH0g3yd9kMiox9aG5VRxjkvoIyBt157oXphZaBTMc4NpVdep
         AY8dRrlIS2VxRS2fAt194/VSsxSjliwdrbdrMJIqbnrrHU0Oc2hfav7BY1Dk1CS1Vwds
         s4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9aB5SJHC8FbDBha6sRb/HKsg3SmMO8+j3TVfCLWuY0I=;
        b=g0KPVrmhDpquYNXi5OmdE7TMHQbBpixIS2slfKH5sRiRhgqsjL9NWjEt4xNMAvI+G6
         xMPKXjnCA7Rx7afOrqBqsnTMHpLBc+X9Jreck106HLiIvOb645NzjjwxPd38EpxmaG/I
         bJMYtliDP8dzzRe842ZWRaUWx2bmLuj1qswrBNPhNy/7uiD0Nob330l9htrrUvt4JJQh
         nKVucWYzgrhiMnNhf6bYnw8dCJb6VTwYOgS0tdlh2oLrd3piyLSE6rUnEUPiBB+ABSVp
         INAFR/psqkLz63o3qP3q9hxCZAOYm5hDvcqxguGyKpojvZ0Bf0eLieZK+zj/b2Uv01h6
         F7Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VMRerHch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si6628620ybc.128.2020.08.07.01.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 01:12:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VMRerHch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3xTt-0000KO-Fi
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 04:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSg-000724-Ds
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:46 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSc-0001hO-S6
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:46 -0400
Received: by mail-il1-x141.google.com with SMTP id j9so1067273ilc.11
 for <qemu-arm@nongnu.org>; Fri, 07 Aug 2020 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9aB5SJHC8FbDBha6sRb/HKsg3SmMO8+j3TVfCLWuY0I=;
 b=VMRerHchoWHr6rI5g1T1wBXEAV08CskMGvdTstVSKB1XxOvhzZ3/tIF/aOWYqm0zJi
 KOgIgp4cS890MoVcBHUhGd61D3p2blbo5YJ0VcGA1sr30zKXcR3SL9R65GjTDYWvkYuw
 QEaBck9wT8PcjJxo9A6b7VOYyeVBQ/pY6mFEuFgVj1i9/C0CHB2FHo8Uzu+fBA/wsw1+
 GrFcPBz8szdvlRgMJtN719v4Q4fCYKE5xx77k5IbJnMqmpu00RFFTr3V/rtnVi8+3iMP
 V2zSdFakfE/WlUnkpWK6b+xu67XLfZ3QO1rM+EQyHirsyJY8TELx4axKy3czRwEOLVEV
 RW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9aB5SJHC8FbDBha6sRb/HKsg3SmMO8+j3TVfCLWuY0I=;
 b=F1pWyfrqLja6DEfxcKnfqe7FidaTKDxV+Zr/kyZ6B1PRlj3oRdgh2ivUrTx6iPCf7U
 EGe/8tj0ZGKTUxFLJym/c/19yTOZHN2/j0UQcc4q+kUnS1ckGlcnP9HDd1Ytu0EC9coK
 d8MWD4yX6KvhncadF6bJxmPSh5PFDka16VWYgDdvPnzeOC1nRH9PFi5rJL+Tdym01ejC
 z5NC+knomk3a60n84SjGb+DHUaZUXghfhuQflfBhK+rYFY/AT95BIP5hhl5xA6JZbszA
 QD4W4W2eFzQ+NqBi04m3WWNvDwPeyp/wkhPIN1389MPqUixzY/ay9wo23V7BXh2drqS+
 Bmbw==
X-Gm-Message-State: AOAM533EU9XIxCfjiMpnOqmlT0bWjT6Iti5X6ue0Ksi8wOMfYt5l4Ml7
 FAnfOi5HLSr4MvZ2ch0517qk
X-Received: by 2002:a92:c74a:: with SMTP id y10mr3126240ilp.306.1596787841901; 
 Fri, 07 Aug 2020 01:10:41 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id l144sm6233546ill.6.2020.08.07.01.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:10:41 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH 2/7] target/arm/kvm: spe: Add helper to detect SPE when using
 KVM
Date: Fri,  7 Aug 2020 08:10:32 +0000
Message-Id: <76aa68f9ec73ced85070b81ef5251771ca27d072.1596768588.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1596768588.git.haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D47Fw3WEtSX+

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm.c     |  5 +++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8bb7318378..58f991e890 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -214,6 +214,11 @@ bool kvm_arm_pmu_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
 }
 
+bool kvm_arm_spe_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SPE_V1);
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     KVMState *s = KVM_STATE(ms->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index adb38514bf..f79655674e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -283,6 +283,14 @@ bool kvm_arm_aarch32_supported(void);
  */
 bool kvm_arm_pmu_supported(void);

+/**
+ * kvm_arm_spe_supported:
+ *
+ * Returns: true if the KVM VCPU can enable its SPE
+ * and false otherwise.
+ */
+bool kvm_arm_spe_supported(void);
+
 /**
  * kvm_arm_sve_supported:
  *
@@ -366,6 +374,11 @@ static inline bool kvm_arm_pmu_supported(void)
     return false;
 }

+static inline bool kvm_arm_spe_supported(void)
+{
+    return false;
+}
+
 static inline bool kvm_arm_sve_supported(void)
 {
     return false;
-- 
2.17.1

