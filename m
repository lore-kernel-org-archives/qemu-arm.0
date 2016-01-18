Received: by 10.25.159.19 with SMTP id i19csp1756835lfe;
        Sun, 17 Jan 2016 23:21:49 -0800 (PST)
X-Received: by 10.140.179.68 with SMTP id z65mr32082515qhz.70.1453101709326;
        Sun, 17 Jan 2016 23:21:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si29631666qge.105.2016.01.17.23.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:21:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL48K-00019F-R2
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:21:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL400-0003Rp-Kr
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zz-00077Q-1c
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:12 -0500
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:34612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zy-00077J-RQ; Mon, 18 Jan 2016 02:13:10 -0500
Received: by mail-pa0-x22f.google.com with SMTP id uo6so415137599pac.1;
	Sun, 17 Jan 2016 23:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=K/3YJ6loTO47ugNsYjCtOpB2r1h42otPgSflbxJdNVI=;
	b=boT38wVWtN5Kb/gG1uJx1iQAHcTsCqPTFQW8YNb3VH3LMQN2aNRGmX8O2gd09qZUrT
	JjyqyXh3FpK0hp3myQlujvq7s4ailATGLuHPo/HS4FJGjkozC/KB4QEqXtArsW7zDFBz
	Y8KL4F2DthbRwRWZGcCfwyvXRHtxPaDQKrlzKO+ALF0UJb+p2m7ZItWDXKyIqDKKwkfu
	L6oD1yzUWZhQY4oBzb7QI0/XNjujdcjXwbZ6VhdgR0KxUpdEmfKOXuQg8p37bRnCaBXO
	DYg4T/PeizLspLKUfTeuLd9/3woq6hhAK7CpiVEUzQSDDRxvhwYowTpErraNA+yqst+6
	dDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=K/3YJ6loTO47ugNsYjCtOpB2r1h42otPgSflbxJdNVI=;
	b=Xk/HNNKlMb1zkRB2N4qEfwNezo8LaluqZQ1RRNRMV/rbL5apcM/nMhM3yHl3LDdf9A
	haLKDML0lrRAN87BpwlL+YnK2MbD/iPli+5LN2pRB3Z2XRvYjgiZSTpBm1P+Q+G8I5G/
	qDIOFqBnz/a645HZIJunYO3TkgxJ7QnOsje2Eq+4c94X3qAFMSMtUbXJJjPiq6CZdvt+
	OUb0DA57dOOnGYIuUy42DRYtJXBVvwSSl874GP4Ws4bcJuxpUJ6q9GWu8bamdAyMA9Fe
	jj25wNLro+oEbVl7JxMSWgLCUrQQzQrsT1bl6XZy7Nw7y/u1BiMylICpyobrICK0gTZ9
	afGw==
X-Gm-Message-State: ALoCoQlrC2iYtCKqACJriUmtWtJC4gj1OYnvzXn7zjQso9Vf7hyE02h+EazyzUdWVnI9/Qfveg9isiRBs7PPFuAZ+tVJ8tcp9g==
X-Received: by 10.67.6.195 with SMTP id cw3mr34590526pad.88.1453101190328;
	Sun, 17 Jan 2016 23:13:10 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:09 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:40 -0800
Message-Id: <cc12cc9e952dc74183cf875c1ae44446067f3236.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 13/17] arm: linux-user: don't set CPSR.E in
	BE32 mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YBfVy2LnrOFM

Don't set CPSR.E for BE32 linux-user mode. As linux-user mode models
BE32, using normal BE (and system mode will not), a special case is
needed for user-mode where if sctlr.b is set, the CPU identifies as BE.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 linux-user/main.c |  2 --
 target-arm/cpu.h  | 12 +++++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index d481458..60375fb 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4496,8 +4496,6 @@ int main(int argc, char **argv, char **envp)
             env->uncached_cpsr |= CPSR_E;
         } else {
             env->cp15.sctlr_el[1] |= SCTLR_B;
-            /* We model BE32 as regular BE, so set CPSR_E */
-            env->uncached_cpsr |= CPSR_E;
         }
 #endif
     }
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 3edd56b..96b1e99 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1812,7 +1812,17 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
 
     /* In 32bit endianness is determined by looking at CPSR's E bit */
     if (!is_a64(env)) {
-        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
+        return
+#ifdef CONFIG_USER_ONLY
+            /* In user mode, BE32 data accesses are just modelled as
+             * regular BE access. In system mode, BE32 is modelled as
+             * little endian, with the appropriate address translations on
+             * non-word accesses. So sctlr.b only affects overall
+             * endianness in user mode
+             */
+            arm_sctlr_b(env) ||
+#endif
+                ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
     }
 
     cur_el = arm_current_el(env);
-- 
1.9.1

