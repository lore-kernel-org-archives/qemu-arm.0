Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4715243wrh;
        Tue, 30 Apr 2019 06:17:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxixaNoAuR4A8uOL6HHq+G/FjpzE4p753DcIgnXNzz30BlHUoZstBIQ/CoqTQLPhL8AiIJ
X-Received: by 2002:a1c:f702:: with SMTP id v2mr3291638wmh.0.1556630241842;
        Tue, 30 Apr 2019 06:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556630241; cv=none;
        d=google.com; s=arc-20160816;
        b=Gi/YuclIH/e5EvzdpxL8cogj87D2dQQ7457YZ7+Nt8YMU0N4jGP425pDqnGll9coem
         kFRpJWphvXn+SL0qPGm/jYmEECwY1R7wgpbPevXAscpFtwUoKHjw2uJgFElynlIWUK4W
         ttN1jRfj/och9w17Y/kCpLd8iekZ0LkPkV/s9umoNt0gSsB0me0WTR6BsS744dv4ou1p
         Cs426Wqjj5edbepumiJMTfy+uJR2U1UA0MMmpugzHf7hGX8UWe7bNAeAQ4VPubkiyxXz
         Y+DAMIcW6zhc0OHo8vcYD5ZUY01DoO5NgptGNhesTuinvVNhECcZbMaRN/VG6Vdzs6Ja
         QKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=J4qN3maoOxdBCp6dGsG2kVhWe6RDZ8cuN7qYfzK/kww=;
        b=ELwKQ1mYsp7UJLAv0j3ExolVXXHOc+lkLKCljraNtETIsyPUOEMBohZ4WEa6u070q5
         o5S5olMZKF1IGMZHwmN/Ri9rPKBbq9ZZ7vNyy+CLGBqQJq6ZwfIbALvAopAjqEgFH2vL
         5HEvYhJ33ICOTv860Do+7EWXNwO5WMBN/Xy7326tD3tR0symUHuvj9D2vqbHdHKxf1/a
         rulFtQttmFnLIACcYut0i9RLjnd4WrqE+eND3lp5YEUx7Kk9paIsrhACAFRT8qWy9L88
         eEbGe9kj5AYCEPl0Po0AT46FhlgnNByPi3WNn2W9ABORKhMlHPO8K2s9xe3LQapZd7ux
         o29Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Xw6o/TsZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j192si1465518wmb.131.2019.04.30.06.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 06:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Xw6o/TsZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLSdM-0002UI-Pb
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 09:17:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSas-00010o-4t
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSar-0002Bt-2J
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55147)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLSaq-0002BR-Ry
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:45 -0400
Received: by mail-wm1-x343.google.com with SMTP id b10so3765812wmj.4
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=J4qN3maoOxdBCp6dGsG2kVhWe6RDZ8cuN7qYfzK/kww=;
	b=Xw6o/TsZcr61F7M74hiyYgcGKQreolkQj7x1UqCIv2lrRti8g2TRfy+8LhSo7/5v62
	zbBmb0xe81L0VHwxIm7W0DZ45+HcgK4UtEUlAzW0LbfyCqvJjbqIm5e/NqSKP3H3KRKo
	cp49UX5G5W4qQMRdQi4dM45p/z4lKQfyNyqwcy8O4MBEnr0vIGFS+aJhYeGs10aApLoj
	Lum3XReywRaAxwFVAXGLqIrxLxVgFbpivtZI8t0Wnd51oesgHERBPzMlAjVtmUZ7RC5W
	tx93VHxBaCF01krYy1XvaWeUK+c2N5WRH+lfVGsTZfU8+QgwALEhzL8Iw33o/5HHgux6
	TWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J4qN3maoOxdBCp6dGsG2kVhWe6RDZ8cuN7qYfzK/kww=;
	b=IUM/9kOex7KduI4A9654dko8tQLWJHd4rlBqofQrar+CwQ2/1YUcupVjTxkjugU2hd
	VKtDP9JNO7MaJkAD9FiUXdM5E1zp+r8RxA1zAVtikDL8dinV8n4JzoOKhed80UHVIEsz
	DT83kWmDDsljYL6v/bqPtNiu/Z91Tq+wRvE0ydCEvgjUQ999vQQP1qN7FOSs4Cd2tREt
	4oADRiexhSlT+8Xn9nwQLTgk4ttJZjAyVqYKI7dA5U3KwvAQ741mFVb6VzgWSkFdM3c8
	yjQ70PZgmRpCe6ns67FPieyKKAKrimHkvd0Or8ELmWnx/7fPsP9rSNlVldP2dm2n+D9s
	/13Q==
X-Gm-Message-State: APjAAAX4Lrtzpo7LAbrEmoHJ0IeSCHqbUwRkfUdZmQJvE9wEkYYzDKZ3
	AtMNIQtJX3zOOqEkRXALJWZ8BYAMUkU=
X-Received: by 2002:a1c:c287:: with SMTP id s129mr3174603wmf.63.1556630084008; 
	Tue, 30 Apr 2019 06:14:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	a12sm16557460wrh.46.2019.04.30.06.14.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 06:14:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 14:14:37 +0100
Message-Id: <20190430131439.25251-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430131439.25251-1-peter.maydell@linaro.org>
References: <20190430131439.25251-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 2/4] hw/intc/armv7m_nvic: NS BFAR and BFSR are
 RAZ/WI if BFHFNMINS == 0
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mxEaSJjKHEB3

The non-secure versions of the BFAR and BFSR registers are
supposed to be RAZ/WI if AICR.BFHFNMINS == 0; we were
incorrectly allowing NS code to access the real values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 131b5938b9a..15cba63c964 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1167,6 +1167,10 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
         }
+        if (!attrs.secure &&
+            !(s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+            return 0;
+        }
         return cpu->env.v7m.bfar;
     case 0xd3c: /* Aux Fault Status.  */
         /* TODO: Implement fault status registers.  */
@@ -1646,6 +1650,10 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         if (!arm_feature(&cpu->env, ARM_FEATURE_M_MAIN)) {
             goto bad_offset;
         }
+        if (!attrs.secure &&
+            !(s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+            return;
+        }
         cpu->env.v7m.bfar = value;
         return;
     case 0xd3c: /* Aux Fault Status.  */
@@ -2130,11 +2138,18 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
             val = 0;
             break;
         };
-        /* The BFSR bits [15:8] are shared between security states
-         * and we store them in the NS copy
+        /*
+         * The BFSR bits [15:8] are shared between security states
+         * and we store them in the NS copy. They are RAZ/WI for
+         * NS code if AIRCR.BFHFNMINS is 0.
          */
         val = s->cpu->env.v7m.cfsr[attrs.secure];
-        val |= s->cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
+        if (!attrs.secure &&
+            !(s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+            val &= ~R_V7M_CFSR_BFSR_MASK;
+        } else {
+            val |= s->cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
+        }
         val = extract32(val, (offset - 0xd28) * 8, size * 8);
         break;
     case 0xfe0 ... 0xfff: /* ID.  */
@@ -2249,6 +2264,12 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
          */
         value <<= ((offset - 0xd28) * 8);
 
+        if (!attrs.secure &&
+            !(s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+            /* BFSR bits are RAZ/WI for NS if BFHFNMINS is set */
+            value &= ~R_V7M_CFSR_BFSR_MASK;
+        }
+
         s->cpu->env.v7m.cfsr[attrs.secure] &= ~value;
         if (attrs.secure) {
             /* The BFSR bits [15:8] are shared between security states
-- 
2.20.1

