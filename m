Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2426830lfy;
        Fri, 7 Aug 2020 01:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgwWNjdg6xFjufWOyQg/GaX6RV7l1R9d+VSkG6+Kb5rTGMi5xb1vTez5Kb8r95LySYKTf/
X-Received: by 2002:a5b:d12:: with SMTP id y18mr17733536ybp.400.1596787931930;
        Fri, 07 Aug 2020 01:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596787931; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3jjAQTF/EmXwVNt337zf1STZJjfMpwIbG5FgLOOg2J6Nm5yTdQKdHVpKzjqF6lBH5
         RuA1X99QrwzcsaO71acLrQ03XcDdKcIHKrpVNx2PheIsbIQGa3BJs1u5VCflB8pQ2nZA
         hw9zuldw3MKeBpBRSk3Ez5JeSlUBWAAYNnKfdFTkNDAkn/yHJ5VXFLcFvuYA9sULfIE6
         irIF5lqU5bMpfm1FtntduEY+gyPbHwTt6bB8M2dvQPhmeXKc4HP1qb5/Zx3pJ0W7mrkW
         pm4xFo4IoeqOInW0RzKLtrQFizqrLCfZ0z4SwRw+SaFdlbrfOjZuw2oLiCYN1ojnNGKy
         nf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L/G09uSg2yJJtjqwnmBQeFoDjYpnvCt5OlRmmWUK0Ac=;
        b=zKLQiwYyFoa9MssevsEhLuiFaarozIRxmAFMR594l3Me7qzXqB1vsqRSrX3ZWqM90h
         HmAxszMRKft9yri/1+URcwp9EcJwCKEWPmDb3vQvJvMw2RqzinBzjTTUCQOrAwY4S+zc
         HzS58MhBpXdBahwIQFQkqFYYA6622Oe46VCYRcvNW1Gbj6saZeWBHQlqhaAi0P2vjvVJ
         KyrErh0OfI1KXdq4RTjUVedKLpGdQI1oy+LNuWvhZDXyQ5JGYayrHqwzb1SggI3j0tXQ
         NaFB85UghAj3ixQk+qkl0QI2I+SjDqHhkC0s4krPGx2aKVaN2rn74iZYERvEAMTLisVt
         JqmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tTSRJKGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v82si6951781ybv.161.2020.08.07.01.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 01:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tTSRJKGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3xU3-0000mj-8e
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 04:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSh-00074Y-8s
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:47 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSd-0001hY-MI
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:46 -0400
Received: by mail-io1-xd41.google.com with SMTP id s189so1085138iod.2
 for <qemu-arm@nongnu.org>; Fri, 07 Aug 2020 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/G09uSg2yJJtjqwnmBQeFoDjYpnvCt5OlRmmWUK0Ac=;
 b=tTSRJKGfAxOBsFsSTy7WUzO2js2DVnRgl7sVSHksknJ19BC/jkJYUodydEAAVkKYWZ
 qGaXvRoMm48WvYyGkCkfdBKN2MdKuk0XEa/SshlYAlzNljcrnmRIBG34Hh8WFlvLx6TS
 Z3pv+08BliwfJsSVGwTigJT+CF4wDpCbUAXDWr1BS2ehv1AmPa8JZFSCBYKCe4qvdoRk
 qfgqzNE2R8N99gXJp4XozOKp/FSmRjTunknJ4893vkgjdm8iyX7dFCwv4ACNyEMcU4Rb
 dX3aAiGjK7TOBsP+NCLmaB8KC2DTHa6OddcoqaC9NpOaeADYQae/LmwK2M1ygl4gvZGS
 oMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/G09uSg2yJJtjqwnmBQeFoDjYpnvCt5OlRmmWUK0Ac=;
 b=EyhezRNyhfZkKCox8+oeI+CDl3vPB8VTwgJ62pF2VGnikDPaZUusY9ZnwI4IdU1U71
 f89ejdYbJr+yiscyFL70w/9tiP+s8+J04eHUxJVT1HIZ+6W8YdEB7f1ukWRz9vawgOQe
 Cv5dMOf0k02JspzmKteVEXsmNSiCKhaSjdqWqHhYJAzkh6VmgymyUVEImVFYwBWv7Ngt
 BnIFxgDx1uzdq25WaBysL/nxzZkUu/FNALD1juBioj1C1x8lnpQfgH87EgXrmbCa0T+6
 lqkpEFPLeXOS9R9i9MkMRzR7xsCi/aTlrlk1pUE0NFx2KvjZR5KklEfu8Raq3LB1uUvL
 FSag==
X-Gm-Message-State: AOAM532D8hTaZ+uI1jATgFV0KkshK2F5bGkNdOoVId4yvWStGfaZJd8G
 C0W4zWsPhuoQ5FDbXBLdeXJR
X-Received: by 2002:a5e:d519:: with SMTP id e25mr3334981iom.36.1596787842680; 
 Fri, 07 Aug 2020 01:10:42 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id l144sm6233546ill.6.2020.08.07.01.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:10:42 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH 3/7] target/arm/cpu: spe: Add an option to turn on/off vSPE
 support
Date: Fri,  7 Aug 2020 08:10:33 +0000
Message-Id: <c4ab709b684bf6505a9721163564d2223d06c49d.1596768588.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1596768588.git.haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: APr0tLVjp32X

Adds a spe=[on/off] option to enable/disable vSPE support in
guest vCPU. Note this option is only available for "-cpu host"
with KVM mode, and default value is on. 

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/cpu.c | 28 ++++++++++++++++++++++++++++
 target/arm/cpu.h |  3 +++ 
 2 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 111579554f..40768b4d19 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1122,6 +1122,29 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
     cpu->has_pmu = value;
 }
 
+static bool arm_get_spe(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    return cpu->has_spe;
+}
+
+static void arm_set_spe(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (value) {
+        if (kvm_enabled() && !kvm_arm_spe_supported()) {
+            error_setg(errp, "'spe' feature not supported by KVM on this host");
+            return;
+        }
+        set_feature(&cpu->env, ARM_FEATURE_SPE);
+    } else {
+        unset_feature(&cpu->env, ARM_FEATURE_SPE);
+    }
+    cpu->has_spe = value;
+}
+
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
 {
     /*
@@ -1195,6 +1218,11 @@ void arm_cpu_post_init(Object *obj)
         object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
     }

+    if (arm_feature(&cpu->env, ARM_FEATURE_SPE)) {
+        cpu->has_spe = true;
+        object_property_add_bool(obj, "spe", arm_get_spe, arm_set_spe);
+    }
+
     /*
      * Allow user to turn off VFP and Neon support, but only for TCG --
      * KVM does not currently allow us to lie to the guest about its
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9e8ed423ea..fe0ac14386 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -822,6 +822,8 @@ struct ARMCPU {
     bool has_el3;
     /* CPU has PMU (Performance Monitor Unit) */
     bool has_pmu;
+    /* CPU has SPE (Statistical Profiling Extension) */
+    bool has_spe;
     /* CPU has VFP */
     bool has_vfp;
     /* CPU has Neon */
@@ -1959,6 +1961,7 @@ enum arm_features {
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
+    ARM_FEATURE_SPE, /* has SPE support */
 };

 static inline int arm_feature(CPUARMState *env, int feature)
-- 
2.17.1

