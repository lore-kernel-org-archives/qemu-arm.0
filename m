Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1249046wrq;
        Fri, 22 Jun 2018 13:33:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfYt3jBDKZWTPRIeHoNpXKmZ/BsEMGKTiHnbz1Mg3iqysZiKBquQZlzcJy11fEw3Z6JWthN
X-Received: by 2002:a0c:af82:: with SMTP id s2-v6mr2894943qvc.14.1529699580106;
        Fri, 22 Jun 2018 13:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699580; cv=none;
        d=google.com; s=arc-20160816;
        b=UkkLeEphzcofD68WXole79XQoVLVYYeZeuUPBtCP6nHaM4Eg9i2Cgt0yPNBOLvcY9f
         cEqHzjcW1l3fYfUZihuqPdd8/TeQ4KWRXIYnw/GEfFW1+RO0kjM7nQZ7EfeyuLR0Y0Pt
         AZTmgyO94Zqs8tHPNDmIfJYwRbuT6+iRNnAzhxhJdWO5OvU6JRB4rT1Jp8e1n1iocNRl
         XpDpelQuB/0SPy21FTUkKWbl9nKBnYl7kcNV51TBvahg6IqN/o0yG2rjhkPDb+AIbOcF
         GNOe8eRAInIm9iFib6+WO3rYs53rIQyHInubWeYWpAiqCXICg/Y1UHMP+QDkt8sPZw/o
         Ei0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=DFvRJhWFZYOhijskqlUWxqso4frvq3JWxRwuEfts6SA=;
        b=i0H4yDVKgav0Srng1kcuypiIqyx3LHAYfHvPPOa8B5X1QIrO4mqMak20ULugIjij5Q
         96Usn+9rzYgkbJXT+2nEROtuuNYBBPh9F9uUrBlVKCTlcJ4xh2DM3Bdl00uHk18rcWtX
         vr7uIbkhjJ50uay9PIESskfh00vYCctL3Lc6Ln5zEcXmaPbLtnsfuFi30lNC+B6sN3Q4
         gQ8Lun25gIAq6Uv8fd/MYSZmWCDxsTzqbvxLDm2c5u4kk57GIJvnbgwE3Zb+/Zt0J/4V
         fJy4NIeZ7nst8pIG1fo9dhzcRlnd7Q50dTS/P0ReHYebBuKBIT8oubfAeaY3zuznVg/9
         cJ4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BT5DXuQT;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AZcy8odI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18-v6si360137qti.257.2018.06.22.13.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BT5DXuQT;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AZcy8odI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSjr-0002A5-Gh
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:32:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjb-00026Z-4A
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSja-0005Qb-Al
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSja-0005Q3-1d; Fri, 22 Jun 2018 16:32:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 16C3A60B14; Fri, 22 Jun 2018 20:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699561;
	bh=KJ2hwWBPFbAMSD5tXendsVzPlgncIxTq0scY54lmlJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BT5DXuQTqjQ1qBijXx9CIDIrsKERZ/WLZNV7Yx69uvGoMRot8LzWmW0jrnbc3zumF
	HCGjN5F9NYALT2RelrhufUIpgIkC2B0V/T8oKlRRuOIHZWA4bQ4kXku8byJZe6+WzM
	KHIxyf61W4Y9GzN50vTgUd0k4mWx0cgOJBfQ4Ce4=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7296A6081B;
	Fri, 22 Jun 2018 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699560;
	bh=KJ2hwWBPFbAMSD5tXendsVzPlgncIxTq0scY54lmlJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZcy8odI1D550YZAVgjsc1NwqWpylzEo3a/QaB6L+8DFzjrkJH3IkY3fcQETLCdeq
	LAejTkAidX0o00bRRGzGRrq5blUqu5bcE8qroXDxgYsHnf7HldyYlTw4bvSa7Kfz21
	EQ8tjuA93EOSCKN/77PKuoX+heicXIu7rGSfgHv4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7296A6081B
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:19 -0400
Message-Id: <1529699547-17044-6-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 05/13] target/arm: Remove redundant DIV
 detection for KVM
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j+V4tqX5DVm+

KVM implies V7VE, which implies ARM_DIV and THUMB_DIV. The conditional
detection here is therefore unnecessary. Because V7VE is already
unconditionally specified for all KVM hosts, ARM_DIV and THUMB_DIV are
already indirectly specified and do not need to be included here at all.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/kvm32.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index fb9ea37..4e91c11 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -36,7 +36,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      * and then query that CPU for the relevant ID registers.
      */
     int i, ret, fdarray[3];
-    uint32_t midr, id_pfr0, id_isar0, mvfr1;
+    uint32_t midr, id_pfr0, mvfr1;
     uint64_t features = 0;
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
      * we know these will only support creating one kind of guest CPU,
@@ -60,11 +60,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         },
         {
             .id = KVM_REG_ARM | KVM_REG_SIZE_U32
-            | ENCODE_CP_REG(15, 0, 0, 0, 2, 0, 0),
-            .addr = (uintptr_t)&id_isar0,
-        },
-        {
-            .id = KVM_REG_ARM | KVM_REG_SIZE_U32
             | KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR1,
             .addr = (uintptr_t)&mvfr1,
         },
@@ -106,18 +101,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     set_feature(&features, ARM_FEATURE_VFP3);
     set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
 
-    switch (extract32(id_isar0, 24, 4)) {
-    case 1:
-        set_feature(&features, ARM_FEATURE_THUMB_DIV);
-        break;
-    case 2:
-        set_feature(&features, ARM_FEATURE_ARM_DIV);
-        set_feature(&features, ARM_FEATURE_THUMB_DIV);
-        break;
-    default:
-        break;
-    }
-
     if (extract32(id_pfr0, 12, 4) == 1) {
         set_feature(&features, ARM_FEATURE_THUMB2EE);
     }
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

