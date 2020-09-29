Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986331lfq;
        Tue, 29 Sep 2020 15:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhIxMyrlBJWcIoQLPQZxdAsaG5UyPn88aC81tWyTb09qnIb3Z0VMoqkBVpXXJba1KIYnNi
X-Received: by 2002:a50:fa81:: with SMTP id w1mr5634550edr.122.1601419483074;
        Tue, 29 Sep 2020 15:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419483; cv=none;
        d=google.com; s=arc-20160816;
        b=w3Z5WITCLso1FvvQR4Bz4yS/WpdANY5DpqE5BOip+GKQwIJMDbw1wyqcYpH5pTTKQa
         2Mmd86C5PoqjaT9LQjbKigr3BOJn0dz+3JNW0kFBBdDr60wzYFgfveP7VU8dxIXOqde7
         3QqMgNwmsdBnBgZRSwznHqE7Ybt2KNoEfVGPFsyPSHLUj1ERAhIddAGboRs3c2Fn8uTK
         udWq4QTXC+lJAXWChqwosI3BFhOF19snmifM0m9saoqRuXwypbRZb+B78A6t6v+GdB7Y
         ZHnc74z2fOGTSgQfZhUfjF6MSr2xtjbVDYuB4lJllqvqR8v6f08h292rcKoI63pgGDXf
         CT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VMKffrN5obKOm6UxS550K4u6DmnYBBMm9AG93ufLP5A=;
        b=ipitl6uQ1Jvx5nqcyh13OgWDSwzj6FvO+8HLV5QigdQTR8ycrCPSHdVcXYZq0+OPlK
         ETF2H9yFdKvnAkQNlLus+yVxHLQgDhUTNb7MMej0BYjGEnGz35QEtIuStAQcgy1JImnU
         Dkn7l6JBXvsg8LTfK4aRMcdPcIHab3zKsqrwamJU/c9gkiv2y0anug7Ddqalk6RELayl
         Z/kVEmFQEuyY4A6kWxd0eFTxK8JQBc/A/GzKXCVghcMYhmg5wZt8BAoHsp4+SorZC0Ci
         frkfKlmLUABfo9OXf5WlbYsgAUhVBbicWBCex80tkbMSRxlEoh12NIqpGeAZiBWuCXWZ
         FxAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqQYDBhV;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id n2si3831418edi.564.2020.09.29.15.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqQYDBhV;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMKffrN5obKOm6UxS550K4u6DmnYBBMm9AG93ufLP5A=;
	b=gqQYDBhVM3BaJ6f2rhOOCiuAzasuv/g0jQfJbhZYXK/D8//kfQvAypVP6SrWAHSvxS++vl
	HVGu9n1JnA7XgHeM5WfTS37Bhm26aUzzLSVhPo7N5oJZnZuXb3TY1KgeLxiploZb/7aWC3
	rbokezywFY3CJDz4ucvQnssQoNOC0dA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-2O0doFDINkeIWfvO4IrbTg-1; Tue, 29 Sep 2020 18:44:40 -0400
X-MC-Unique: 2O0doFDINkeIWfvO4IrbTg-1
Received: by mail-wr1-f70.google.com with SMTP id g6so2366786wrv.3
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VMKffrN5obKOm6UxS550K4u6DmnYBBMm9AG93ufLP5A=;
        b=KV8+mPzZoosgFgkXI2p5zXchz36vv8pH09yaRxnEfz4CiWXjwnwFogE7GIboeXyCsi
         xq/JhBo7iuA0vtm7c80WkDTRsKVIpGnMWmCX/2dyVM75CCnij27EtDSccZD+M5yx5WmM
         OccfewAtxiuvd0iRq0rLYp3XqZnAgLS/lxMz03i4BxI8mFAFDMqERqs0yuWN3W9OdNM5
         hL9QLsNdsfvjVgUDMpDfSIj5TJHsZtsAb6FY42Ha8B/CfSlkWWgZz6O/9IGGl1TaS3F0
         n/NVsmWWWBdSA3t1+4oPezr2zSIASyrzrwpLsqonEk3rVLgwARdIm207ukAlD68ZKZES
         AVSA==
X-Gm-Message-State: AOAM530S3ujKWEFfGFiqfr+EKX3QNNhp4czn0YuMp66vnzQC7AbibvbZ
	t3IOP+UR183FQLA9fV73kC2Pqx7JDDljCf3qLLjmOGa0NRsBosOdruKLSa8zN7DKuMHW/w4Ovsk
	boC6r+lNBpVufqzzE
X-Received: by 2002:a7b:c76d:: with SMTP id x13mr6762369wmk.10.1601419478957;
        Tue, 29 Sep 2020 15:44:38 -0700 (PDT)
X-Received: by 2002:a7b:c76d:: with SMTP id x13mr6762351wmk.10.1601419478789;
        Tue, 29 Sep 2020 15:44:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id l17sm6922065wme.11.2020.09.29.15.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:38 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 08/12] target/arm: Restrict ARMv7 M-profile cpus to TCG accel
Date: Wed, 30 Sep 2020 00:43:51 +0200
Message-Id: <20200929224355.1224017-9-philmd@redhat.com>
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
X-TUID: JyuIEp3E7Gds

A KVM-only build won't be able to run M-profile cpus.

Only enable the following ARMv7 M-Profile CPUs when TCG is available:

  - Cortex-M0
  - Cortex-M3
  - Cortex-M4
  - Cortex-M33

We don't need to enforce CONFIG_ARM_V7M in default-configs because
all machines using a Cortex-M are already explicitly selected.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 ---
 hw/arm/Kconfig                  | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 08a32123b4..002c97862b 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,8 +1,5 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7f19872722..15faa2f2d7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -14,6 +14,10 @@ config ARM_V7R
     bool
     select TCG
 
+config ARM_V7M
+    bool
+    select TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
-- 
2.26.2
