Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp442957wrw;
        Thu, 8 Nov 2018 09:55:13 -0800 (PST)
X-Google-Smtp-Source: AJdET5f4VnCtfTLiHLFYBhYZxDhTS7EICR9HKGt+jnd3CYuTfUhejklRqdZFf9T0zHKhuDy9C2/r
X-Received: by 2002:aed:2702:: with SMTP id n2mr5295652qtd.216.1541699713443;
        Thu, 08 Nov 2018 09:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541699713; cv=none;
        d=google.com; s=arc-20160816;
        b=y6aNbQusH+hQJ66z1PVCbVHP41IWizY1fepUfJrU+zSBkqDFg6pQu10/MfNbFJnOLP
         q2jhacANF9rRXpXBkjlgpy0YTW/Si82QUIsv8TRNjtXqHLh2G130OssGey/3wAZC8z4E
         99pbQoA6medbqkvfWrwvPwrzGqv3nbU6F2IDHzSB1Wf0ME1mmOFERVWzcnnqtXs+ID7U
         QKDGAsjSKYIBPkMdQeXlyYpe3aPMR9vtwquakwbX45Oj3ubIe9pj9LS5cBJb0W+e89Ax
         6nY3VfNoxMnkkHJajZSCl/c6eBjcfFps376ofnaVg4DYE2Uj6pXBhFxmQnruPIbX6wlB
         QzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PpLXpocO/xsWRefCIa8us272LlmFyb71GTp1lXZH/b8=;
        b=ALXyQkPPD5wKMI5u5/QAYKY19QOgQ3gVjgzN4OJmv1NcUlVt7fZgUGvOTWBQ+Om6jp
         /hGpvoiffLKkFg33usE/ym8xgESaNHM3aviOLStw+QHuMQ9FygtJq6rWrPhK/V11F6T4
         m1LDXH3FIGu/aXZ+UnBYhiDsXtIQTiR4DVsNZne/nDUcQuEhS8f1xRj4AwJWUtE1PXzT
         tnCi+PpEv1Zk182TYf9S6HoWSuG8Gl2SyOYAQ0+56SdKK2HB0JAQG9qBb4NHzjU94iN6
         Y8NiSno71777+8CuFCrdFtm/mm2CHCjcIWUwjgBF+lVvT3eDifYh4mxFMBLsjnVQd9nX
         CyzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PvCg1VzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m54-v6si608372qtc.111.2018.11.08.09.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 09:55:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PvCg1VzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKoWO-0001gB-Sc
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 12:55:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW8-0001c5-Cm
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gKoW3-00089V-B1
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:56 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gKoW3-00088c-2m
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 12:54:51 -0500
Received: by mail-wr1-x441.google.com with SMTP id k15-v6so19236943wre.12
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PpLXpocO/xsWRefCIa8us272LlmFyb71GTp1lXZH/b8=;
	b=PvCg1VzEBsnl23dgv1WNw0jxyaB9jwSb+cM3kIQ/BmI076aziN1pCfP+assL2l+vVP
	yF5Iensrm5stQgMoK6DHvs5ohcqDeLE00MEGVp+M/oZ4HUOsti1KenkIKKmNOqq95lgi
	YElOfgYs/8Vhjr7Lv4ElGYDfOBYc24bRXu+Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PpLXpocO/xsWRefCIa8us272LlmFyb71GTp1lXZH/b8=;
	b=W5FPxhjiedLF2tTbFXhPAh07F+FquDu2pxCpHvBUTmw4umI0J2fTt2dujtNx5KuqXk
	+/OJJYagfR+Rjuwue4U10Nr/TtJZJLUEj5LOsBEqIeHZDX3bxxIRnC9tTxSgqVIcOgJA
	Tp0j9kSmqcjC+Y0ywAq8L5OmUwwOKtbHw6ZHarMRaqJ/ZT4ysgICAc6EO03IOoeEPsq+
	wJSSL4uZvmNFuReHWslIMYksVegO/fYph9AeEwFiXmOxEkjYvogdesEAQLXaYf6VXiAf
	684IcYjzfACjKjFgaaTeKAoT2wjm0XUx14Eljp3rUvziTmhQzdilyjO1ZI5rXXmVL0Hi
	MTaw==
X-Gm-Message-State: AGRZ1gIaGVLc6TiPaP3H+JanrN7BDwNzYUHUjicdb13NWeAFSIDIhUos
	lySymJUl2yiivSwDQOYJUaLqvg==
X-Received: by 2002:adf:f891:: with SMTP id
	u17-v6mr4991875wrp.178.1541699689959; 
	Thu, 08 Nov 2018 09:54:49 -0800 (PST)
Received: from cloudburst.twiddle.net
	(70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
	by smtp.gmail.com with ESMTPSA id
	l42-v6sm4411384wre.37.2018.11.08.09.54.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 09:54:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Nov 2018 18:52:42 +0100
Message-Id: <20181108175246.13416-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181108175246.13416-1-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v3 1/5] target/arm: Install ARMISARegisters from
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
X-TUID: gvlQ8pHL99s6

The ID registers are replacing (some of) the feature bits.
We need (some of) these values to determine the set of data
to be handled during migration.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

