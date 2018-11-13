Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4521953wrw;
        Tue, 13 Nov 2018 07:44:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5ekZFyE+hGzFPavhEGfF6moOesRculLG7B2b9VI3Xz+4rcZqw1pGVorBkAL/Ke3DGJ6c6jS
X-Received: by 2002:ac8:3f2d:: with SMTP id c42mr5469196qtk.33.1542123849242;
        Tue, 13 Nov 2018 07:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542123849; cv=none;
        d=google.com; s=arc-20160816;
        b=Od/D3UjIOm0z5VMynTGsLAEeKTNPmTcyUMZgCWlYGoEDuONjuv2q4PL9lgvw6wzeAh
         +JgS4tOMARlQlKWMMjkBmyOUEumvJ/oE9r622wKJG88Fll18y0ma9cMR8TQitqr3mqO9
         c9W9JjILjsPjL/HPXNZsGtMd4UrscjbsIXydmJNJWncWMK1CSqlWxfOLn/wjtXsRX/Is
         HPbCsAmmuEH2ERJkdyhJ/5WqsDstweATr9/eS0943P59IEIAtXjbrNMogtl2G2c+TkMi
         rMUWhbTMDBWGOK/pIcLCaWrqpNgv9QOoQ2AHO3ZUhRjwYxQuuBVc5+Qk/pRv5JeYaRc1
         9qPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TK0Mu/aguozz4Q5UAQWbHigk/WZ2HXR6efE27bzs4U0=;
        b=CjYFK9wetrfHjmIbMfV3drjAXa3CrbsZd1ll4JHOn2Lz2m1VhJ7EG1BNpinXnoKfWk
         T7/wo6cptI4CxTp+QVyXLF9Ca/D3WK4yBUCWLMDrP+jhNo6ouiSf06rAgwczTw0X5dDI
         PnwhyBjjQXRvtPV9RbhBkSZNqB7ADjgFB2ZfDqIpn01CKujovvJICldeEBxzdubUFxJh
         Mg+ZUHjZwT7plzI9iyYt9MrQ1ZsPO8UJfeL6qzFFSXV+yzRCRphDIS8hdaH2eWVYtI/L
         4b7wo0klPdzLf376KH943UTG/n14qBP9ogB+pZLFiArZ47CKdCFr0ndYRS+QHk6RD0Kd
         wqSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MqN7FyaR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11si2267318qvb.13.2018.11.13.07.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 07:44:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MqN7FyaR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMarI-0002bw-7R
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 10:44:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMar0-0002Yg-Id
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMaqy-0002UA-23
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:50 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMaqv-0002Ck-Dy
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:46 -0500
Received: by mail-wm1-x343.google.com with SMTP id w7-v6so12402661wmc.1
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 07:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TK0Mu/aguozz4Q5UAQWbHigk/WZ2HXR6efE27bzs4U0=;
	b=MqN7FyaRBi2ycnAsp13PV8hSmdsvGe6ad0rMTnHwB+mTONYDqZRT/ER/u8ChLSCCzh
	x/6C/FM71YIS5pUPRaa/+WOAhRL9FjYKxl4naqkZ6aGBWoCBYi8hGpZTf98jZphlIM76
	bpLzdp47pUGHSVeDpYME+MSQzXVjjUDASxg/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TK0Mu/aguozz4Q5UAQWbHigk/WZ2HXR6efE27bzs4U0=;
	b=hsT6N3jj+pY6Fo7Z7eh2tZEQ41Pw5tGmWzQgFUpL4u4IqcuE8QZQRhKwFeXcwMj17d
	Pveq6v5x5bOz5qUOUa4+NFpJkJsfDslfbivJcdsDWALGC6Jmppkilbc6zHMJbz+Iwa1/
	6Adtk4Ha7ydkJQTTVFwtE1sM0AC04T+BglwCgQv/60rFEz/1DwkcoDN+y0MXBMXMl/7D
	obqx+xaKTs9Fm1KNj3Mi5D2FUpqv5lt2+1e9zsqAhZ4lWgLhQNcttMcBt5AB/NprkaNR
	2j3qGQXRqjp319lpp+aUFfqTBKKdi6r0OYuiNHvGMKZQDPBMCrkEm6kfyy0pkNpDaQFm
	+H1Q==
X-Gm-Message-State: AGRZ1gJCbOdK/AZ3O87nwtEEGSpudR9xr2gU5Mzlpes6WEJh/TMkEZdh
	5ghEU0MkC5MCNQM01FKm1DyRQA==
X-Received: by 2002:a1c:5788:: with SMTP id
	l130-v6mr3601975wmb.60.1542123797517; 
	Tue, 13 Nov 2018 07:43:17 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	s16sm3479709wrt.77.2018.11.13.07.43.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 07:43:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 16:42:23 +0100
Message-Id: <20181113154226.14396-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113154226.14396-1-richard.henderson@linaro.org>
References: <20181113154226.14396-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v4 1/4] target/arm: Install ARMISARegisters from
 kvm host
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0aYwkFLvkaRo

The ID registers are replacing (some of) the feature bits.
We need (some of) these values to determine the set of data
to be handled during migration.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 1 +
 target/arm/kvm.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 21c0129da2..6393455b1d 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -183,6 +183,7 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
  * by asking the host kernel)
  */
 typedef struct ARMHostCPUFeatures {
+    ARMISARegisters isar;
     uint64_t features;
     uint32_t target;
     const char *dtb_compatible;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 09a86e2820..44dd0ce6ce 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -158,6 +158,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
 
     cpu->kvm_target = arm_host_cpu_features.target;
     cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
+    cpu->isar = arm_host_cpu_features.isar;
     env->features = arm_host_cpu_features.features;
 }
 
-- 
2.17.2

