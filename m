Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp396577lfq;
        Tue, 8 Sep 2020 01:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCSUxWDheNuCuXm+CG53ZP5qAh8g9aGIRoUZZgJpmyIMutvOs5ou6CL2iyAmz5/MIQF6OB
X-Received: by 2002:a25:da8c:: with SMTP id n134mr33429818ybf.84.1599553159351;
        Tue, 08 Sep 2020 01:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599553159; cv=none;
        d=google.com; s=arc-20160816;
        b=bFWxC7Uu2CGTto6FOw4dF5JCjI4zO59Ok+7PZzz2TdLP6mSpMdzdVh3NlkuMoGkuUy
         H69RMVU0dZjce6BTi6/jM3MV3DFkyxKd1eIEgpvuS6WF6Ty2wfH8lUpw78slNEgGBlXb
         Gy5Izh13jxSQ5R2D+V3RYamXiOTHyfo3178zGFZboI81kSzlY4TrE87dGz5r2edHfnt0
         0P4ZrLJL8vwHzrFl0MIDZcFex/7jg1zh1iYKFUNlKkE0I54VQFtxzW6RmkK2g0Yapw7r
         al8GOm8IR8IzBtINROehO89MOm4m6XKIimY+hRQKEINK3p/49e9vWCUM9GwQunvteAdz
         jv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=65uW6/eJtxdVQ3erFH0nAd+ZJZrP6B7JK355CS4Evd4=;
        b=y6z1Vjwbi6642EeWTKl7kTKgJ4qu9SZRwD3OriPCsQ/plniUNktIRQqDbLPcMMkL2j
         ayktcA7gS1yMesgq3rsBsvj1MUu87OaoFQxXTyIegDSWjMWsOCaDoMLjXv1zXlMNXOXC
         lWoVB2IOiB8b+weix7c/0iV9E4+1aPn8qfyAlyOQ07wcaVtSaskQSGwzi9u/B8V4MjNp
         WZV4c1uArxz9wGMTMvUpDz9Ia3VT8NamJKL8p1/X92Z9S/wYzP21Vup59B4TKseSdCr7
         IfqJk1ARN5M/WRyt0oVt5zmmk7bb0p+CPcdFeYc5bhSwp/ALaH5xCBEYABBpZvPn6FB1
         a/HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DtnWrrkp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si18660516ybe.242.2020.09.08.01.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DtnWrrkp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYqU-0007mx-Oo
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlL-00065X-SN
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:13:59 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlJ-0000Ug-32
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:13:59 -0400
Received: by mail-pf1-x441.google.com with SMTP id n14so2383086pff.6
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65uW6/eJtxdVQ3erFH0nAd+ZJZrP6B7JK355CS4Evd4=;
 b=DtnWrrkppBALmGDk6WyZ9zbWxElLLqFd9TEqM/7gVsatasdVioc4gVzJGhrkQU9CvY
 r2seFpZkf0Y1tPjBnQyLjqAuOpjzpCRNPksrPmfQNiigepK13Nzi5oVqsvBaVgNd7Yqt
 rL0zvLs0SSBsVDDts6Zuc+vRtb15G7Rzrwk+j1f9ka9gg+UzTcYTLTc3qaRMgja/OzLf
 /4wMqxn6l9fb19RXdpnL6D2BN+nM6O7UufmEBfKYS7tKXrYtn3dsCEjegd79OV55L3Cd
 SCS8xqINFAHT7ELkaZItAMT+PXx+/aful3FmFbCbdJI1Q6sB58nE4NNhcDMe0mOlTi4v
 ElYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65uW6/eJtxdVQ3erFH0nAd+ZJZrP6B7JK355CS4Evd4=;
 b=InAqCmhOiu0jO7vXx6/dv3cvoD+2QMx4DGflnMASkJSwX7NJwepA5Un3phqEATwT1h
 fkB7ucnLqo5HzAWtp48sF8HZQuARnSU3zGIOgzbG1VvRTl5LSP+ih/thOXEHmIyBAptl
 AsFMWCp3Y7mrFK7lpq+xcOXf/TRgqKOTRmWVSDuC9IZXZoJw7CrIuVO6zJiKHAX3+uP9
 H/BWODq7esUOuzd+9xMlNuVs/TPZO9OUBY1IJj+zT5RwgxXgFlNPlQHLk7kNLXA2gTHH
 klD8ldZ9aJdPw2S26TJaktSua4wb/kKZ1AFlUt4IdMfnhksdYVQJfZr8CMLVP3IrvnMN
 CDGg==
X-Gm-Message-State: AOAM5306DJZC//L9hvwSk0F8pgceg2sQWW4Rtdrzr71Sb+7qWsX+E7c3
 hVVAPJbsj7TfR+MBIsBQSxgf
X-Received: by 2002:a17:902:ba81:b029:d0:cbe1:e7ad with SMTP id
 k1-20020a170902ba81b02900d0cbe1e7admr104185pls.30.1599552835913; 
 Tue, 08 Sep 2020 01:13:55 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:55 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 11/12] target/arm/kvm: spe: Enable userspace irqchip
 support.
Date: Tue,  8 Sep 2020 08:13:29 +0000
Message-Id: <6aaa406b824d0c427acbc3f3abfbbe841f3bb93c.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x441.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8X6S/hwUfHiW

Since the current kernel patches haven't enabled the
userspace irqchip support, this patch is not verified yet!

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/linux/kvm.h | 1 +
 target/arm/kvm.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 8840cbb01c..35ef0ae842 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1672,6 +1672,7 @@ struct kvm_assigned_msix_entry {
 #define KVM_ARM_DEV_EL1_VTIMER		(1 << 0)
 #define KVM_ARM_DEV_EL1_PTIMER		(1 << 1)
 #define KVM_ARM_DEV_PMU			(1 << 2)
+#define KVM_ARM_DEV_SPE			(1 << 3)
 
 struct kvm_hyperv_eventfd {
 	__u32 conn_id;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 58f991e890..7950ff1d83 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -820,6 +820,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
             switched_level &= ~KVM_ARM_DEV_PMU;
         }
 
+        if (switched_level & KVM_ARM_DEV_SPE) {
+            qemu_set_irq(cpu->spe_interrupt,
+                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_SPE));
+            switched_level &= ~KVM_ARM_DEV_SPE;
+        }
         if (switched_level) {
             qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
                           __func__, switched_level);
-- 
2.17.1

