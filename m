Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986410lfq;
        Tue, 29 Sep 2020 15:44:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOB7fKB/NQlpJzfHpKWpRMpOnLYILl9lmhg7JNgJvkpI8ihDAV6eJpju+TCxYf+e7n/lXj
X-Received: by 2002:a17:906:b7c1:: with SMTP id fy1mr6039621ejb.342.1601419493647;
        Tue, 29 Sep 2020 15:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419493; cv=none;
        d=google.com; s=arc-20160816;
        b=drgkbeVFYxyZHZuIkgBzhlBp5YBIgMry9S+w7zjA+ORStviiVLd86FlyCi9LaGaDZV
         maaXmIzmDa0UfTXbMu+JeYqkDYDjAAWefxNOL0klrS6eRcYpJhtVP79jtHCJRzROWHfE
         VO8k7ENLpVLkCWDH3RagNsU2kFWN8EYNgdHAVcq80ct4oP8yu/jm/IkyFpbIKPPxRDf/
         9L+9tifWVNileS9zolZ/ztAN37w803PEk7YpcYIVRB4qcYtWfqxlRHgF9Si1eaAcIbHW
         /bAObXyLaEMaHPY3lXL8HVP1ZlLlbR87XEwY9eBqKaFyEVLiOnWnpKrU7WyHFALCUwT7
         vS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HavTR5jlyYY+4DgutSw3BluUcAU3B5yxPF0wWIdw1vM=;
        b=I/gC4zt7V6AZitgirNmUzv98OVq3FFppJXR5ZNH68+YKYdJq6Ldprpbxh7WD8j5rVK
         1MqDWIwUxjXKlURoyZyDxmbze3swnLSwJ5nvTvXR+Z9p8wZyjgSFxR5jqYSqv4dIDMG6
         TXFvRc9L2VtHYMmEFn6z3Wrh5l1HmCIccIH0PsckyIqmnk7vt2eE0zKBsoe2iyJLevjo
         D7yORFoTorG2WD5mik+UUgYhZwdvCT6GPeXWgDs1Um0rx7LJLWeGbDX0IJcXw/QR4Q3T
         H5WAL2hEOUS7orOWKXEoGYFf5i5KIHUY/MGuvCkMcIKblTMGKxatAe/T2i9E0J3dV6rP
         kxCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hIY5RPFr;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id f10si3583245edy.472.2020.09.29.15.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hIY5RPFr;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HavTR5jlyYY+4DgutSw3BluUcAU3B5yxPF0wWIdw1vM=;
	b=hIY5RPFr1cyNnrvMKqn85Q5vz47n1KJcDmnKn9pwPPbKw7ZNZPPNwreoXSHgak6nQcvuyh
	ep5jT6kKQ2rqEVyewJpnDBV5GAeLot6Fs/90zjsZvsznDNTKmM/HBTynaJA1XlLPml4vGj
	JRX2zBt+LVXOM1oGNSL2lxUpa11In+I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-0Jsh0J96OZi0cbHc8wbQ9A-1; Tue, 29 Sep 2020 18:44:50 -0400
X-MC-Unique: 0Jsh0J96OZi0cbHc8wbQ9A-1
Received: by mail-wr1-f70.google.com with SMTP id g6so2366921wrv.3
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HavTR5jlyYY+4DgutSw3BluUcAU3B5yxPF0wWIdw1vM=;
        b=t2y4K2CCfN59WtDpKMiJgSVOayMJnR9CEfFlk9A5hsC7Tb+ojLueGQg2GIFgb5HZyo
         DkybYl2mHIFTJeXnQd4KucWtfpqbASr3dhosa95WIP6yR5lDRVazi4djc6w7794IJEqR
         ifH43R9RFmIe1Xg3s9V80AkL1vqV/PY3mky90estN3fmlTOp6D3pRiRuBkY+5ECDwClh
         wk8G8NvMQYwaj2Xs2shaBVI4VmVdOBdxEWtihQoW1ul9xRBkI2/0/CJZb7vCbMXpmIEb
         GRHZzxBqhcz37W9YKaOfGa4B1H8VQYoU285goH8un6C9XfoSc2eOhouJ8b/vB4ijNta6
         qAuQ==
X-Gm-Message-State: AOAM533JHLJATrSNifYYRSAwtamj3Nr9DBKdffhEljll8tFNNxWl+Wc3
	hIUx7F6AymS3hgQskU8ilcdALr9O6mXLYkQpHaNu0TZm8jacnwKP0aw42GuiqFlO24DA9a0vAH8
	beEO8nmYNL9ngsmNQ
X-Received: by 2002:adf:f552:: with SMTP id j18mr7126141wrp.128.1601419489039;
        Tue, 29 Sep 2020 15:44:49 -0700 (PDT)
X-Received: by 2002:adf:f552:: with SMTP id j18mr7126125wrp.128.1601419488887;
        Tue, 29 Sep 2020 15:44:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id t4sm8074682wrr.26.2020.09.29.15.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH v4 10/12] target/arm: Do not build TCG objects when TCG is off
Date: Wed, 30 Sep 2020 00:43:53 +0200
Message-Id: <20200929224355.1224017-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Eg9tqHWk1CNB

From: Samuel Ortiz <sameo@linux.intel.com>

We can now safely turn all TCG dependent build off when CONFIG_TCG is
off. This allows building ARM binaries with --disable-tcg.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
[PMD: Heavily rebased during almost 2 years then finally rewritten =) ]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/meson.build | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index f6a88297a8..9b7727d4bb 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -16,24 +16,29 @@ arm_ss = ss.source_set()
 arm_ss.add(gen)
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
+  'vfp_helper.c',
+))
+
+arm_tcg_ss = ss.source_set()
+arm_tcg_ss.add(files(
+  'arm-semi.c',
+  'cpu_tcg.c',
+  'crypto_helper.c',
+  'debug_helper.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
   'vec_helper.c',
-  'vfp_helper.c',
-  'cpu_tcg.c',
 ))
-arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
+
+arm_tcg_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
@@ -41,6 +46,9 @@ arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: fil
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
+))
+
+arm_tcg_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
@@ -49,14 +57,16 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'translate-sve.c',
 ))
 
+arm_ss.add_all(when: 'CONFIG_TCG', if_true: arm_tcg_ss)
+
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
 ))
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('psci.c'))
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.26.2
