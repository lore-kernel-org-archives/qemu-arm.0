Received: by 10.25.159.19 with SMTP id i19csp1754040lfe;
        Sun, 17 Jan 2016 23:13:51 -0800 (PST)
X-Received: by 10.140.252.212 with SMTP id x203mr30236222qhc.48.1453101231763;
        Sun, 17 Jan 2016 23:13:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si29612408qkw.58.2016.01.17.23.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL40d-0004Do-57
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:13:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zl-0002xj-Pl
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL3zh-00071a-QY
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:12:57 -0500
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:35498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL3zh-00071V-Jq; Mon, 18 Jan 2016 02:12:53 -0500
Received: by mail-pf0-x22b.google.com with SMTP id 65so153115971pff.2;
	Sun, 17 Jan 2016 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JV+rBvCdxj14AugW/a/45hZCQOCBr4B1B6OQbHGtb+E=;
	b=v9k+trD9xtizY9GRc6R1oxrNMzOdlpOXKGyDyFKtH+1c24IZLxVJdpKUetoW/ioraw
	uXQgpeLGQQA7cgUaBBZELUnIk5HOOdUh42jaLy0TfC/9fRFnTn18SQ3brmQbC/FHEouY
	hLBd4BodeciwkYDKcYxWFMep55Qen/9i1ji7hh8YXGeAxtNug3iF3emjxEs4zI8uspJQ
	XYDQl4yM9FinHPCeB5dVwRHfeYbQYP4zZyIr8QaaMxrMk4bRlAkN+pFRAfmku6mx9bfq
	zNoWl19Isztrt348aEiPjOrra4NnPUDo8mri8qPoC/rgjXxsrs96HDnzAaLns00tcumJ
	OPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=JV+rBvCdxj14AugW/a/45hZCQOCBr4B1B6OQbHGtb+E=;
	b=SdrVggFcOyf39tQJsizyCUm7vK+SCL5WCYlxSVTIoTwRA7nq6d1KlTEh6QQ5k7QN40
	EouabQqoHKd82RmQ8yh+bXYr+hhCO6y/dGvkmVn2CAtjV5s9/w4aype4QfNPmGDgBMCp
	Mwe6Q24cITs3zdghrgfe6q1UBSFQecwFoH4Ga8sOiHEVJ3Mlx3nxepijUR/deQAbyYg/
	6iY/OteZWpr0e35DPvvqXICQOIR7SZHgPVZ8NHudYt/eZlGFhnBrd2ZdWQsmYq6VZ4dD
	B5h1jYc4RoD7wUYmSg+muo0ddK+PnTZQSgm1IlwrI0Okynknz8YLboWzJkW7mHgQ7sa6
	z5wg==
X-Gm-Message-State: ALoCoQn6fxTCy8YwveuKMZpPm6djUiMwuSU8wKT4thPoCFCpj/3fn+lrViJ/gjz5iKYh0Hrsjdp66d+2uq3WrGBx92Hoda9xBw==
X-Received: by 10.98.65.90 with SMTP id o87mr34068885pfa.115.1453101173080;
	Sun, 17 Jan 2016 23:12:53 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.12.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:12:52 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:29 -0800
Message-Id: <4f92a762d0362bb4e75667518b60c3c719c26b8b.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22b
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 02/17] linux-user: arm: set CPSR.E/SCTLR.E0E
	correctly for BE mode
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
X-TUID: EvrzQ3HhjrXX

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

If doing big-endian linux-user mode, set both the CPSR.E and SCTLR.E0E
bits. This sets big-endian mode for data accesses in AA32 and AA64
resp.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 linux-user/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index ee12035..4f8ea9c 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4454,6 +4454,10 @@ int main(int argc, char **argv, char **envp)
         for(i = 0; i < 16; i++) {
             env->regs[i] = regs->uregs[i];
         }
+#ifdef TARGET_WORDS_BIGENDIAN
+        env->uncached_cpsr |= CPSR_E;
+        env->cp15.sctlr_el[1] |= SCTLR_E0E;
+#endif
         /* Enable BE8.  */
         if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
             && (info->elf_flags & EF_ARM_BE8)) {
-- 
1.9.1

