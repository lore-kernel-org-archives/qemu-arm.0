Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp253876njm;
        Tue, 29 Apr 2025 06:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoxpqGwRe/n8FdzISa2qICMygFtuMR1eqOLoR6E93Wo2xmNFBmbA6cUcH0MTsgOopc/Q4cCsCNd1q+EQ==@linaro.org
X-Google-Smtp-Source: AGHT+IESLivcvOLECjZCXYY+udZrrMuUaaZbXTsByIOvobCyuFP5BEVtwZWUpjFqUw1t8O14sNuM
X-Received: by 2002:a05:620a:17ac:b0:7c9:574d:a344 with SMTP id af79cd13be357-7cabe4f114cmr426742885a.25.1745932989147;
        Tue, 29 Apr 2025 06:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745932989; cv=none;
        d=google.com; s=arc-20240605;
        b=Bn/E5TbD32pnBTZ1bqyf1+HwYYhP2pZyqbyKpNdFBDjqNwSvEBznr6fYLuNH1RPw5R
         WuTyw6qZ93rI2m60Il4lSZIPbP+VMVnaPv1pyHlPnA9cNfjG0u9oh8mnnzHQKAa2xp5Y
         DEnwqdhCkLSXwKPvsbr3t4LTN6k0tByZjOOdiYuD58OPOY72hqy7yhFOtW2xSkK62WF2
         35rvxm4DBkA3S0Z2XmOp8egBSj1ENgfBLzKjPJ0g3OUY+Q4hy7SSDgQ4bezm+CfFe7QK
         KYL2Zlv771+7XnWDSM7IqA1NTU7enal4BSMFYDmfxjkbQTn0Og/UK2a6mVg0L4ZEotDs
         DcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1K2H3VE4tCQOLcXEpqGHsbFF7wzsGTavlqzL6DY4PxQ=;
        fh=IUJDqsqe7thKzGjg2tEzLm8ihsFAVxwlDscjrnqubNw=;
        b=VhOZWMyN/thYIH/fYMxUloIVpBNJz98Z0Z5qcjGh12zRf9fLRteW93CmqXKFitgPYt
         Yss23Ie8ebeW3fc72BZTScNKMuVLVdTX52EGsabRm58YmF/Ng+182+UKSVN7PSBJUYBu
         BmvCbvjA1G7f+sEePO6Q8SammfVINCdmK0K23dboTziEqZTMotjcIMoyo13DMVjHRHcE
         oM8IXeZN4leqAuPUPLZYvW/DPv8fTP7YXzrXrg9PPBUu7sEHH4q//bzu6W4f6sUC0mLa
         06eNmdzPyx/qVbB5XKrWgfUbI8YYuUi2lJ+WBh6+r+PuRdUtk9Nu1TgEurzcdyyaxXrv
         lvJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f5Qah+i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea3745si1201581385a.429.2025.04.29.06.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 06:23:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f5Qah+i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9kv8-0005BE-Sa; Tue, 29 Apr 2025 09:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kuj-00056l-GL
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kuc-0005cg-08
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so4114032f8f.1
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745932925; x=1746537725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1K2H3VE4tCQOLcXEpqGHsbFF7wzsGTavlqzL6DY4PxQ=;
 b=f5Qah+i3N+JvYx5hiUjmHxSd3UHW/OLMGzGN5WZBGHNeT9GfjrKhCCx81I7goZb+G6
 jXXXijnfDrhhqFnJOqQ31cp0U2MUrbhm3CIm71o6psPiVJ5GtRgMbPa73/ILREIBx6Yj
 ev3nhu6FYxO4T787YfuT43Fawv8AWGkg3Xkr5xANgpvnnnRzoIhZ/ZuwWGLvjaIHChM0
 WxfFOyoZ+OwDF52u986Xh7rZVCrWeHaW+ITXZnN+AWy1QuW3o/bpj96C+8p2+RLbnkc5
 II5qR1D+IOoQfUU7TjEFiBqwQB58HmVWiWHYtKnsKk94UlmQdSGRqt0o14cmaWTbh7r+
 9HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745932925; x=1746537725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1K2H3VE4tCQOLcXEpqGHsbFF7wzsGTavlqzL6DY4PxQ=;
 b=rGSJG6+YYMUM+eqG95ADTeXsY1zEkl0/Wl6rNfn6PcnVAWE/O5/7Pk3no1TtsNegJN
 IjXI+an7aSgjR7+moSJNyfm3rE+fIpUvsZ7yvuJH6uxCrCkMtC1S9rL9TQznfwn2gYPs
 TBm6pmP2eXLNquECkHoBgEevWmbQYoafRKkeysEeYxSfU2JOg7qiGcn7AeTe+ngMyHQ5
 u78U94/1M7pJnYAlBp7LxYyBTFh8eEydxd/nw3rg4Y2Vv1xxASXZ0bVstuFp2I1mG6xp
 879v9gmbAtzn9mn6DaOKPLWBfedjNkopsVge1NNtUVbaRXfp4GB/aY+v7AW/TkJxt5ag
 CKag==
X-Gm-Message-State: AOJu0YwiVTvDi3OiHJNcD9PAV5VYcRYpVt4+1l+rB8qqt1IFUJ5KT0UM
 ZJ8I/jSDF7P32YErJgCopiej2UWT7yHMHp3Q5bev478MZhQ4rppF07bpDVLBHi1jGdQCnb2jB5U
 1
X-Gm-Gg: ASbGncuVRgts4obvWewrhZTQEd5+y/p5FRLw8T1spnSPQosw9RmKw3aiVpgl7Pfw9I1
 CCZVQ6Pb7F+7nS0dv4p5oml0h1Gl8AONt35xVokyd14X7f2ywhuWmSZgc70JXWI+FpTlYxtHpWY
 vGsm3ppdxVAkZseVw3iOK8RR6QzhL4ZPPXWnRAhB6JG+iLdSaEBlXjeyLe2zjryVqV13z3tWYpE
 owR7b3/3Cs92he+2TT2mSYmO4jCtc/zrX//LGufrBXPq7mWWaNTsV2JnCeSgaZD/svqc/iX33CZ
 s448IzAeEufQTMfxL5++Kj/ob3T5POwJb1LlrA9mRlJDM2E=
X-Received: by 2002:a05:6000:310d:b0:391:2f2f:818 with SMTP id
 ffacd0b85a97d-3a08ad282e0mr2327221f8f.9.1745932924757; 
 Tue, 29 Apr 2025 06:22:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5219sm13729371f8f.27.2025.04.29.06.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 06:22:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 2/7] target/microblaze: Delay gdb_register_coprocessor() to
 realize
Date: Tue, 29 Apr 2025 14:21:55 +0100
Message-ID: <20250429132200.605611-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429132200.605611-1-peter.maydell@linaro.org>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bEXt2X3HKDwS

Currently the microblaze code calls gdb_register_coprocessor() in its
initfn.  This works, but we would like to delay setting up GDB
registers until realize.  All other target architectures only call
gdb_register_coprocessor() in realize, after the call to
cpu_exec_realizefn().

Move the microblaze gdb_register_coprocessor() use, bringing it
in line with other targets.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/microblaze/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index d92a43191bd..b8dae83ce0c 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -252,6 +252,11 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    gdb_register_coprocessor(cs, mb_cpu_gdb_read_stack_protect,
+                             mb_cpu_gdb_write_stack_protect,
+                             gdb_find_static_feature("microblaze-stack-protect.xml"),
+                             0);
+
     qemu_init_vcpu(cs);
 
     version = cpu->cfg.version ? cpu->cfg.version : DEFAULT_CPU_VERSION;
@@ -324,13 +329,6 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
 
 static void mb_cpu_initfn(Object *obj)
 {
-    MicroBlazeCPU *cpu = MICROBLAZE_CPU(obj);
-
-    gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stack_protect,
-                             mb_cpu_gdb_write_stack_protect,
-                             gdb_find_static_feature("microblaze-stack-protect.xml"),
-                             0);
-
 #ifndef CONFIG_USER_ONLY
     /* Inbound IRQ and FIR lines */
     qdev_init_gpio_in(DEVICE(obj), microblaze_cpu_set_irq, 2);
-- 
2.43.0

