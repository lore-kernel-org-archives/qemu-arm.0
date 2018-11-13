Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4700496wrw;
        Tue, 13 Nov 2018 10:22:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5fAxNyIcgwUvItkU/2RGju7N8qXplmODo0ToLICSuxPnncBQjUIDg+xvD2+cTIMoTNs5LIy
X-Received: by 2002:a37:7e86:: with SMTP id z128mr5771004qkc.20.1542133321468;
        Tue, 13 Nov 2018 10:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542133321; cv=none;
        d=google.com; s=arc-20160816;
        b=sqgdCCp16UtfGul0uqXkqm8oDYa3TpOgkjIadWyVNkBEydPTP/ZpU6keIs9mcHFw0s
         UdstNxFBZb9QenLeXqngdbfaQ738fMoQ5GlydayxUWIJQYwPG98B/xqvzmOX4kfjTVnB
         C9x0kg2k3UdBlSd9LsP2MNqyvZhb8ad6889g1Iz9Sw5OYQ1CCUXqVjFyqAFL/cdmYe2r
         jXi0XEZrL+/oEL6luEoIuagr4a0vmAZd4HXWfQUlU7jIdP/D/JJsiwIKqsW8/IhkIbYu
         bMhP3U/RIw13FjBshFA+4sPc7SACCDRW867xsqVHEGfMVH2s90DOFEHY/1k7Ew0HuVjE
         xnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TK0Mu/aguozz4Q5UAQWbHigk/WZ2HXR6efE27bzs4U0=;
        b=NzT+VrjivHc10tlrGDkIU7GiaBKh8M9krDqknwB0IYPqqj8LpNzKnAfF4KfWwONOIp
         QkCXWPLoCmpzBtBbKc23Nfuolsqwlg98c9tphh2AmJSpjw+CuJpuZK5hnn0stOdwt+JZ
         nSthqBuzYomc6UlF4AANOheEBW0QWpC0MuMrbSnpdSaJxuIRy0YqHu9GDyMqXluEac2d
         qWQtbuuaV9tHdaiRYnGdAt7SWGzyNfx0jxjF4veB2NC6RBhXoYn3N+teftp41Jzckgmy
         4MijjGZoyOf/3kiFphCjpAw+gAdEdRojRFYVPLCzb9bcjNG5cIbkjaKE/sKKGZu1HH7a
         RzgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ew4KVsNJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r32si6017159qvj.117.2018.11.13.10.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:22:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ew4KVsNJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdK4-0000OW-TY
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:22:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMdED-0003DM-ED
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:15:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMd1c-00080j-A0
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:02:57 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53117)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMd1c-0007wi-0D
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:02:56 -0500
Received: by mail-wm1-x342.google.com with SMTP id r11-v6so12872148wmb.2
	for <qemu-devel@nongnu.org>; Tue, 13 Nov 2018 10:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TK0Mu/aguozz4Q5UAQWbHigk/WZ2HXR6efE27bzs4U0=;
	b=ew4KVsNJua9Ss1G2RV5awkEvEbUBBN9Jfq8wOovv5lmgN/fMvdBxG+tCAO4YPLznP+
	kgYhb3zEs/q9kbe4rkTEedL6N8fTgYsx87Oog2b7OPnv+2h6ttu9JLx/sSBYcJlTHzy6
	+kf6STMMERfbGMnGLkW6UmW3/JsGvr7h8+MJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TK0Mu/aguozz4Q5UAQWbHigk/WZ2HXR6efE27bzs4U0=;
	b=KyB9UUYKHrluTI1bSl0E/vKBpmb0rEacyz+DwHWRx2ffbmHqd9XagVOKknbD6esUry
	EczZqkcipOcsCI32XAj2lNVzwbinfvyZcPq8cY2pCI6xL6uageW2zT4oG2Pnke8Jh9Bp
	gUey6+QhStTuUQ/krPKvhyhzRrk235+h6xfBQnOgxhcmJYluuIk/eLAVZjEATp2UC6UP
	XrRlUdn+5ctJhXGGUdugThWZOG9DaAzm8haCoVdgdGxjCzsI8X8Hzxsu+2/SsubSpUOn
	ztiXsqrCMmAo7vsR/SVxMK35OpfO+gFRjX5ppgP5X4sWUwYMRNtkyrfE1LUe7qKlqzhK
	p/kg==
X-Gm-Message-State: AGRZ1gI7SFOd9ZmPPXudlJ/vFva98zaZJiacZCjD6tgW85emP8yPbPjQ
	zMGdOXKZF8dZEdSZJ1BSXiwJ4brZu5K8Wg==
X-Received: by 2002:a1c:be11:: with SMTP id o17mr2165068wmf.111.1542132167946; 
	Tue, 13 Nov 2018 10:02:47 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	j124-v6sm2715978wmb.1.2018.11.13.10.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 10:02:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 19:01:51 +0100
Message-Id: <20181113180154.17903-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113180154.17903-1-richard.henderson@linaro.org>
References: <20181113180154.17903-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v5 1/4] target/arm: Install ARMISARegisters
 from kvm host
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EvL73MI+TdvX

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

