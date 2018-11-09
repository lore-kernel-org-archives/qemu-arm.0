Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp129498wrw;
        Fri, 9 Nov 2018 09:42:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5dKpUAnPedSKAhTqE/2ACXcccjjgQpFa30G2f/hQw7dWN/eZZBm4Ct4b6prEs6IM1dPAyyc
X-Received: by 2002:a0c:b6c3:: with SMTP id h3mr10009412qve.128.1541785369800;
        Fri, 09 Nov 2018 09:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541785369; cv=none;
        d=google.com; s=arc-20160816;
        b=lsNhz7phi76JdrEw3G7tjTNb6KPWP1DecMEV7rUOe9MJfX+qqDYJJTeh2uYflSWDha
         A5W3lOUhPdqsp3xX1FW99WqCRbx01TPGazanzJzjvqBFLrTGlOGneoSS1ZPeNCx8MH+L
         cTxoeN4tT0W+mBk1/C0wueIAJwdupq9gbkGiXTjEZqdCJCTiI4WIz6rXIomFzWO164D3
         rAgOeW7kGbqtviwWs3sH8EcGpMm/4WnX6v9M4VmiNjMmG24NrDU5ayXrDsdJP+NvXDZ2
         qYDuTFfQ2cL4EvsXJ23VvH7ERrewK09Mvo0WNCEEsYQGhLWeyff9JxFwgAXWSTOWHJTQ
         xxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=TyWQyyFm0+a+PA5xnoBaalY+g39CuNc2keaemJxb6WY=;
        b=MBQcYKfkLCyoRkA9tQuPbtM81Qu7g6Qx5SKmyYlwWcu+w3uPfbi9+WQOkfvmORT0mw
         yEypf5rADVD93mJMOhG3ztEDc+Ru6d8E6CNbI2Eiie9jnblxEGpUjZ0ekKf+Y99yNJyK
         p3hK6Bo9+TcLcM1+S7DNJ7flSfHG7km7QSRVQQh5gAUc+1UdJcUuTxWms1QvQqzVFHlf
         9p4XRCLEF7A7s2VuSzxWbCnzSPPDVTaSyjb9CH8im14mQJB0xaFzmRq0vEBrdgqr59IE
         8sxthkOdQD/zCRmTJZx1ZtbAfctCPMYz984hj7dyqEVzPf4w7Fp3gqMvRKpipIvDf/JT
         kB5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g185si1083848qkd.81.2018.11.09.09.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 09:42:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLAnx-0002Dy-8g
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 12:42:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gLAhb-00041S-LA
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 12:36:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gLAha-0001EN-N2
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 12:36:15 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gLAha-000169-Et; Fri, 09 Nov 2018 12:36:14 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gLAhK-0002tY-FI; Fri, 09 Nov 2018 17:35:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Nov 2018 17:35:53 +0000
Message-Id: <20181109173553.22341-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181109173553.22341-1-peter.maydell@linaro.org>
References: <20181109173553.22341-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] target/arm/cpu: Give Cortex-A15 and -A7 the
 EL2 feature
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
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QWlitQQvSUlM

The Cortex-A15 and Cortex-A7 both have EL2; now we've implemented
it properly we can enable the feature bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 784a4c2dfcc..b7185234d85 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1587,6 +1587,7 @@ static void cortex_a7_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
     cpu->midr = 0x410fc075;
@@ -1633,6 +1634,7 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
     cpu->midr = 0x412fc0f1;
-- 
2.19.1

