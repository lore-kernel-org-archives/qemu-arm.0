Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3906973wrx;
        Tue, 16 Apr 2019 06:09:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygzVRGtiUCNoGkw622FSu0/+K9+k6X4zb2VtfyFzrDSEnPKl+WoqIcGwfp1/34wsaGjium
X-Received: by 2002:a1c:6783:: with SMTP id b125mr26372367wmc.79.1555420154897;
        Tue, 16 Apr 2019 06:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420154; cv=none;
        d=google.com; s=arc-20160816;
        b=Glz9I2QXz+SoBOeu6VTlMSHYP70jrxQMFgfkzYcmZgRxsQSItU5RSJFZJUeMXc4Bc1
         KF8Z1Gx+xTHRSPmS+Tx0knOe0W+8UA6D2CiJ7aVS+xVVJ3wmxVajzAlwHVZTeIg2L/n3
         Ob5mbyLkJVKc8/C1J+706CSeAu4ElvFVZEgwp9J8lA0aG1vCX1oeLyI1Mqd+hpDvpKU5
         +tSFYslQb9xdB5rHt7cn4ALkNgcpdUaecQIUq5OXdd4qOEv0TgSasxdS4rp9KZZzDh4C
         zpuFBwBFWD72tMEJ2smkXhLZeVF2Y8DyqK96qvCI32bKsBLAHHtkTzdpNLJ6ykDVpiZ/
         Q2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Bad+ohxUQ2aXQF4pfMXnuYXIWQ2Nayau0QYhuZSUXeA=;
        b=a5zEudryDbnsQ2YptpiZ/so7yCMCT8FtG+V1wXEZKwpKLx1c/EPKxnzJNZT6u5R5Co
         gIfB+Yn/Axzaohzc9BGZi1B8trY4A0wrgU4u/TP+dLzv4PmotFxjY3MLNUoOOnd+WywQ
         SyTuZmlbkinPBqHKQUaWz7d2SSxQ2OMhej35mE6Z96v33SjvyGqyqVrokHfS6PCZN5vT
         ixTIhB2tXCnJuH4AV87dZkYamqTgpoG1arZQIPaSmZEORcpQSRKlS5Wcobw8q0e6udlS
         IeCc0ij2FyGjUiHQ9uHW3GzGF1NGwOCZPeomjvU/xp5k3/eWyzzUeq5j5G4IODOoxpXA
         yW/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xQh+F+4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si34846923wru.323.2019.04.16.06.09.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:09:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xQh+F+4A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNpn-0005QT-9T
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:09:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfW-00053K-J6
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfU-0001Ti-IY
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:34 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfS-0001R1-IS
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:30 -0400
Received: by mail-wm1-x344.google.com with SMTP id o25so25250881wmf.5
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Bad+ohxUQ2aXQF4pfMXnuYXIWQ2Nayau0QYhuZSUXeA=;
	b=xQh+F+4AbZ+JCj/OZ/rPi5WMngHxfn7bzPGmvSBmXWAksdoKPWFbXxpRxG+ubwvYzr
	xMuGppCtKP8bU2c0rfGv0rB6FmHFLCP8kPXniXAgn/uOVyapMzSBZq0nUbQPmUwTIFyO
	9j9i/9aWuzWeNIJfun9jaWvbNk89jz9Dv7EJZAzAYMwIPEKHFMtG3vp7LlOOepW7dP5G
	AyFEn8yODfKJ6LtFT6c2+gumefP6ofHSDDUXhySESONyYP9IjaAAOWtbY/nHCW2N5QRh
	WFciEQN+3hqik5lXeP/HwyyHv0Ffyb63k54R3JCI+aiMclp3aZDgh8VjNOZZ9kcryJzT
	yyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Bad+ohxUQ2aXQF4pfMXnuYXIWQ2Nayau0QYhuZSUXeA=;
	b=hZCK8v6I2JgowcwXqRkLG5/ZNXqCFMgzqH+SpWGcKX4IZaeRoEHPSG/Zb4rcPeaAoC
	SjgjUKz95PwwELLnQNY5SuYicWTqRwNAafQyeMrCLqONg0AuE8ZBqP/E2giUitRi0dhi
	iwwJq13DP1QGAjECoGAm4yMtDxTX1jUPC2EWVmkJ5NMAUnGU3BM/lVjBoBpCSRCLn9U9
	CuZUSnUFVnyb9zy0uYtFlsmw53SvLdYrcu8u6viKfvFaAFiG+ahjp8739ftEkFym3JZd
	ALL5COw7hFze/8f0LsE2wH4Qvnu0Xw66DRnm7FmvIOCXpfqaJZlwppQWJ0VEqtMc8B39
	/xZA==
X-Gm-Message-State: APjAAAW+kHfzvx6IBgIIChWTGrhY1pLR0CaYUUzg9DrwJTB0bmyMWVIj
	Cj2e67qwDAdeB17GnOM/U3P23N2Mtdc=
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr26034521wmd.84.1555419507531;
	Tue, 16 Apr 2019 05:58:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:38 +0100
Message-Id: <20190416125744.27770-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH 20/26] target/arm: New helper function
 arm_v7m_mmu_idx_all()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mOfr0vkV6Aef

Add a new helper function which returns the MMU index to use
for v7M, where the caller specifies all of the security
state, privilege level and whether the execution priority
is negative, and reimplement the existing
arm_v7m_mmu_idx_for_secstate_and_priv() in terms of it.

We are going to need this for the lazy-FP-stacking code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Suggestions for better function name welcome.
arm_v7m_mmu_idx_for_secstate_and_priv_and_negpri()
just seems way too long and unwieldy...
---
 target/arm/cpu.h    |  7 +++++++
 target/arm/helper.c | 14 +++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 500e0ab4c5d..0a1b82dc996 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2912,6 +2912,13 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
+/*
+ * Return the MMU index for a v7M CPU with all relevant information
+ * manually specified.
+ */
+ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
+                              bool secstate, bool priv, bool negpri);
+
 /* Return the MMU index for a v7M CPU in the specified security and
  * privilege state.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2feb3f664fe..c8e30b40366 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13235,8 +13235,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     return 0;
 }
 
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
-                                                bool secstate, bool priv)
+ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
+                              bool secstate, bool priv, bool negpri)
 {
     ARMMMUIdx mmu_idx = ARM_MMU_IDX_M;
 
@@ -13244,7 +13244,7 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
         mmu_idx |= ARM_MMU_IDX_M_PRIV;
     }
 
-    if (armv7m_nvic_neg_prio_requested(env->nvic, secstate)) {
+    if (negpri) {
         mmu_idx |= ARM_MMU_IDX_M_NEGPRI;
     }
 
@@ -13255,6 +13255,14 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
     return mmu_idx;
 }
 
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
+                                                bool secstate, bool priv)
+{
+    bool negpri = armv7m_nvic_neg_prio_requested(env->nvic, secstate);
+
+    return arm_v7m_mmu_idx_all(env, secstate, priv, negpri);
+}
+
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 {
-- 
2.20.1

