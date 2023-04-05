Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480471ejb;
        Wed, 5 Apr 2023 09:05:50 -0700 (PDT)
X-Received: by 2002:a7b:c8d3:0:b0:3f0:3d41:bda2 with SMTP id f19-20020a7bc8d3000000b003f03d41bda2mr4914673wml.39.1680710750116;
        Wed, 05 Apr 2023 09:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710750; cv=none;
        d=google.com; s=arc-20160816;
        b=A2X1RObq+P+sJpo8L2Lgj6uMXG+d8pY61xnyROyGRTkex1d+AMTmdjTb0iKZVXr1nL
         PqRU2phiEm5xO4AIAhPgk/OjnDEsAsNUiVmL5GxMMTgl7j+9EKghLAjotJcqpGiTU98o
         mOwwzGttJPWV0HLIACkjhCR9EDCL3GZJTMSTUmp1NOtgHwF0Jtfsp1NEDhTcBdWiQVAo
         e7pMXySQJTr470W44TN7mhFyPraoWGNzcT4ctlgxx+Kl8uS7V8lHQhVDszAYFC9sk0n9
         BQzowKLNVLgKDcyI6oMH5PtP1OqxncgBSPW4DKj36kkNdqPnRU8Y3/yPpfm3EvWKmkax
         au4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v6WERmjWn5FvlAk9wBZ9HpDjQNTvh7yNAmb4fbxF/bQ=;
        b=IC+F5JhtxCh9Leu9UmLFW8XC14JwuZEF4jtxZ9NP9Fpg0TbjWuuYQGNAgi7YJypLzN
         eCgsbeqDuXe1kuKBJVfAXJmi1eZjNINFJlHRCgf0y/9Nu5o5IAm7OjVhCvHymNR/kcDb
         H2e7a4S66q2AfgZR0M556ROddFtEt5d0BjOHLUy4fwymxvDDzzUpE86N1GZPBVLO7kIk
         EE46D1WBjW7Itgl+3e0jTGiXlXVMHe+DYzR+7u3QsZ7joVkh8zRlVMKOr5c7J+dZs3dV
         lbIjDfpf/RJ3wAykMqnpQ0TweFODY0YhK4J45nBCcV4o6wynK76WzMOldzDrm9fQViVP
         mmuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ui9pQqlk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x10-20020a05600c21ca00b003ee145ef917sor737017wmj.37.2023.04.05.09.05.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ui9pQqlk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6WERmjWn5FvlAk9wBZ9HpDjQNTvh7yNAmb4fbxF/bQ=;
        b=ui9pQqlkMvaDWCZp6I6ifckgckCFMdULH8djIjHBtGiKqLjSUyanx69f6iIYVMfxSY
         PDG366DUK3lbyUBNP2TISRXho9Y39mi+0yOtKEssWyJs8AW+r0iZXdfVcgRVJmp8SyvR
         jPWJ8qjkwLGf7F7Iy7M1OZPrcf0uWtn65EXI26LFqGpDfTiuMP6i+YQtxah+yEf+3N2I
         NfyrUvV8ItcveuyyyrfgYuOGCWAsChzWI0Cy5GdHPeHvnwaJTnTNUDpZ7tRMAHPsQguV
         7ankTk82Gs8dVyGeY4jCBSGFQ/hPIEZB2U94cG+S76nY5p/JXNSjjluwvo8eICuJ2rnX
         GNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6WERmjWn5FvlAk9wBZ9HpDjQNTvh7yNAmb4fbxF/bQ=;
        b=XRktLUA24ZqHHz/gqKbqqO91VES2OSsYiRTDbjevDUx3VChZ6r55jN+fMRPor4N2Mk
         MWPOStE4dsCBpQwpmBS9ypKyzTXk1wvbGKMksJYK2VkroAn43I12BSmdEvET7YuVePjc
         DvFMC12n3GsKJNu7iAapbleD21LmmB2Rw/XKCP7pBL77mtpTxdNp6EFykp/Iatk6xKcz
         eRu0PdkDRPe7t45OrBMI0hHTup0MpTo76oXC2x1HLJTt8JDmaqGn05bb3tbbYwQsCZ9e
         tvH/BUX3B/ac7kvETo67fMJyscsu9PnM8IY3b5LKe5qQTkfpcKO64AUyiM3nxymAV8aO
         bSIA==
X-Gm-Message-State: AAQBX9c3ljnUpHicdRHoFfRDwz+5lTiZkwD56Xh2a+hyWPD0TiGajSCJ
	iX/MGol/zBYg00BWmLcoAI4ibdue
X-Google-Smtp-Source: AKy350anKvfZnCI3q7zDlxj99iOPWMUyn9/cm32XZyeYL/HMzbFHfQJWndVFdMqz9Z6VrABSDFBDsQ==
X-Received: by 2002:a05:600c:ace:b0:3ed:ea48:cd92 with SMTP id c14-20020a05600c0ace00b003edea48cd92mr5367145wmr.15.1680710749843;
        Wed, 05 Apr 2023 09:05:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id p26-20020a1c545a000000b003edf2ae2432sm2600498wmi.7.2023.04.05.09.05.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from ArchCPU
Date: Wed,  5 Apr 2023 18:04:53 +0200
Message-Id: <20230405160454.97436-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ib2i4wNoTqcS

These fields shouldn't be accessed when KVM is not available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: The migration part is likely invalid...

kvmtimer_needed() is defined in target/riscv/machine.c as

  static bool kvmtimer_needed(void *opaque)
  {
      return kvm_enabled();
  }

which depends on a host feature.
---
 target/riscv/cpu.h     | 2 ++
 target/riscv/machine.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..82939235ab 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -377,12 +377,14 @@ struct CPUArchState {
     hwaddr kernel_addr;
     hwaddr fdt_addr;
 
+#ifdef CONFIG_KVM
     /* kvm timer */
     bool kvm_timer_dirty;
     uint64_t kvm_timer_time;
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
+#endif /* CONFIG_KVM */
 };
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 9c455931d8..e45d564ec3 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -201,10 +201,12 @@ static bool kvmtimer_needed(void *opaque)
 
 static int cpu_post_load(void *opaque, int version_id)
 {
+#ifdef CONFIG_KVM
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
 
     env->kvm_timer_dirty = true;
+#endif
     return 0;
 }
 
@@ -215,9 +217,11 @@ static const VMStateDescription vmstate_kvmtimer = {
     .needed = kvmtimer_needed,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
+#ifdef CONFIG_KVM
         VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+#endif
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.38.1
