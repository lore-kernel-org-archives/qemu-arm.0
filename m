Received: by 10.28.91.67 with SMTP id p64csp1289087wmb;
        Fri, 16 Mar 2018 13:52:07 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsRGvjz+Z0g1GTmXdKAzia6grrTO4UqPbxj6GobuxJ+SvI6Z0FVlggSssvdZRf+Yzvt9+ST
X-Received: by 10.55.207.82 with SMTP id e79mr4632580qkj.219.1521233527654;
        Fri, 16 Mar 2018 13:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521233527; cv=none;
        d=google.com; s=arc-20160816;
        b=AWwNH7e+TwhtKpUPAtAR47je13yUS0J2MboMpn+TfEAKORQr6JYF+uVKhWDVFqbKAe
         /fMy+A59I0pqSk3Kmn/5DAcovX5i2Ip9AizRBKaqR8TA5RRoCJRGrpCtoz5lK2QqI6qM
         u5xKk8/xKY647bRJnh8wzcADGp00xaBpGheIKsg4UrABC+H6sHU1YIUQyNzxcVXpdOLj
         5goeJdj3HAt0U6eHGfAMlelSQ1iJQM8buJKpCrl5LgQ9r7q91yCA1Hsb81f0TgCElI0N
         3GvxXF57vqcBc8hvvVMM6BrcrzdBzmOX4ZbOVQJI7E5z8HhbHW13zaiQnVhIbgOztoTG
         OlgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=KVmeLMrR6cOkGVVNv4O0z4j+xmFk+I0el92+oxmM5j8=;
        b=pL3J3PrVSEwQpjWef7XJFHSNYG59vrrW4Nh+YSHPfMWF58KitP3rVRetUPz0C04vvr
         9u7+5M8x1sFVGRc4lJggHziC4QhZD87oGTo1JXw73f/BuTnqj4rUugTPX8LWnVWUU2Xo
         T06ww+yGy5/iJoT7/Hsjm0NHyo2HkzYeP5y5OVMQswy9fmlFzj6c4dlIsIxsvG5gK4t/
         4vqUyBgyiYzWFuJ17nUsIvmbnY4JNnTyXYobbujidJYgqR/bGOJOXlNhOLHn0rmnGP7w
         cJ5F/JqkfPY6bYhkxNMD80ZAubSYbaHbg6YNDebeKpyzRAw8tgEaOK7dV/ush0DieQDX
         XtzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=XJto3wkm;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AwT4zCRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h52si5319334qtb.336.2018.03.16.13.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=XJto3wkm;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AwT4zCRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwKd-0005qg-8T
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:52:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1Y-0005zE-LW
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1X-0003UX-MR
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1X-0003T9-D5; Fri, 16 Mar 2018 16:32:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3786060F94; Fri, 16 Mar 2018 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232342;
	bh=d9jAaBN/NqcU7hL7rdNBrHVJpfSYhx/i/DcZyo9PrVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XJto3wkm8ht9KKIrhOcc3CrvPBDtdzLgTR/JKGo2zYEJdBzEvaCx/X/YOnXD3CRRI
	TlJqSG/UKn+N8mWPeDReERSbL/I0GuUfNYPPs4420mIpsLrOh2dve8Ba3fzmPyziP5
	/csmjvchFv6Pzn3xu//PF5rTHUyhiSy+18UHz4uA=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F21260F8E;
	Fri, 16 Mar 2018 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232336;
	bh=d9jAaBN/NqcU7hL7rdNBrHVJpfSYhx/i/DcZyo9PrVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AwT4zCRZqzymLhkAiKqUzBKsNpTiWi7NNUezysteEEkfjGAzuqVXCO1tyzFac+5kM
	cxC9VefiYaZxXu6cmh1m+NT0XDonw5mgjE604uS2gkOqWE1j4fgSPwD9wYeRMRIqFI
	s6IeUmXRvIWveZ5LUsz/y7GMQhwzOWvWXDPOzKT4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F21260F8E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:13 -0400
Message-Id: <1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 15/22] target/arm: Add ARM_FEATURE_V7VE for v7
 Virtualization Extensions
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6+QbW5/3ECEB

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c | 3 +++
 target/arm/cpu.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b0d032c..e544f1d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -765,6 +765,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
         set_feature(env, ARM_FEATURE_V7);
+        set_feature(env, ARM_FEATURE_V7VE);
         set_feature(env, ARM_FEATURE_ARM_DIV);
         set_feature(env, ARM_FEATURE_LPAE);
     }
@@ -1481,6 +1482,7 @@ static void cortex_a7_initfn(Object *obj)
 
     cpu->dtb_compatible = "arm,cortex-a7";
     set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
@@ -1526,6 +1528,7 @@ static void cortex_a15_initfn(Object *obj)
 
     cpu->dtb_compatible = "arm,cortex-a15";
     set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fb2f983..cc1e2fb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1439,6 +1439,7 @@ enum arm_features {
     ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
     ARM_FEATURE_THUMB2EE,
     ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
+    ARM_FEATURE_V7VE,    /* v7 with Virtualization Extensions */
     ARM_FEATURE_V4T,
     ARM_FEATURE_V5,
     ARM_FEATURE_STRONGARM,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

