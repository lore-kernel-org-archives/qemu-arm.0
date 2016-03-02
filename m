Received: by 10.25.208.211 with SMTP id h202csp2008544lfg;
        Tue, 1 Mar 2016 22:57:54 -0800 (PST)
X-Received: by 10.55.201.219 with SMTP id m88mr31460097qkl.41.1456901874107;
        Tue, 01 Mar 2016 22:57:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t131si19407964qhb.115.2016.03.01.22.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 22:57:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0jJ-0007Zn-LM
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 01:57:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iT-0006Eb-96
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iS-0003U9-D3
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:01 -0500
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:33896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iS-0003TN-5u; Wed, 02 Mar 2016 01:57:00 -0500
Received: by mail-pa0-x229.google.com with SMTP id fy10so127187372pac.1;
	Tue, 01 Mar 2016 22:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=W2Bj9t/LIhhJf4SGFCKxDj5TghwZmrPYH20R60uRY+g=;
	b=rO/88g5bMZ3KSmvLR513K+S6Rf/hUs4YFcvQW2WmqagJQ5EK9yKqY1zY4sqwQn6sIK
	zc8Ab2gnroFJrBifnqdvbxXdIOEhaAD19ZWZyNTwGANA9fiB1HDcwSL0YTw9zJmdopB5
	6aAKb8+4ChbNTCcQVvwJmd/UWmD5ubIBEj2HODRwexb6pbrENlSZsGQbIpk9B5Xoasya
	B9KPJ6LEl1/kFXckiLKJPnCKfS9jC0Qmd6HGwEzZr/+MYeJD5bw2dPh7sWUpdVF8IJRS
	dsfIE8S2RxGhbk4e5SF+i2LfO2jIh60r3TwJUho1lFmm1vR+5rNdCuyPl6XjEyj9CCbK
	lWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=W2Bj9t/LIhhJf4SGFCKxDj5TghwZmrPYH20R60uRY+g=;
	b=PVmfjyJwpKAKIhKr++bhjid/HQsLWBiH0CMELeVbBqnrccN4YEqKp3D6tOt4wIBJLs
	IllrxzTEWmx4smAsNkq1O+jgYLOzJiG+3ekw7bWE2rfMhPlqbS07pvL1gc3YnSHRISpm
	aBgYk6zpfeJF6hPebaBbPi/L8rSpnLhqSIzhfOQ5Kwy5QyxiIW3gI1UwFNavghWmocPM
	j61+BBOt6GJk6g3YeV4mZzgrrWKkLNwfq4z5zk8XuJD7XuNrbWoCXJ71GguOerYGyGhL
	9stQKhkg+1xucDiAEzpwuXBP2GBeJvtrzopFh0e/Jr+FQCdYxz96bmUedf+t9v30K2sC
	7z8A==
X-Gm-Message-State: AD7BkJLtffkHzdCshR/HlSmL2TGsDNpMKtQVvIJlJFHEUvTjcqwcf/3SXCARQm4qsl2CoA==
X-Received: by 10.66.61.204 with SMTP id s12mr36753503par.108.1456901819402;
	Tue, 01 Mar 2016 22:56:59 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:56:58 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:10 -0800
Message-Id: <75f4a1d32f0ad13bb30bcec74ac618d4ec57bfd7.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::229
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 06/18] linux-user: arm: set CPSR.E/SCTLR.E0E
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
X-TUID: PNuAYiW8YIzD

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

If doing big-endian linux-user mode, set both the CPSR.E and SCTLR.E0E
bits. This sets big-endian mode for data accesses.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
TEST result: 0 (log@ logs/qemu-armeb-BE32-)
TEST result: 0 (log@ logs/qemu-armeb-BE8-)
TEST result: 0 (log@ logs/qemu-arm-LE-)
TEST result: 0 (log@ logs/qemu-system-arm-LE-)
changed since v1:
Removed claim of AA64 support from commit message

 linux-user/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index fe2a8dd..510b3b7 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4453,7 +4453,8 @@ int main(int argc, char **argv, char **envp)
         /* Enable BE8.  */
         if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
             && (info->elf_flags & EF_ARM_BE8)) {
-            /* nothing for now, CPSR.E not emulated yet */
+            env->uncached_cpsr |= CPSR_E;
+            env->cp15.sctlr_el[1] |= SCTLR_E0E;
         } else {
             env->cp15.sctlr_el[1] |= SCTLR_B;
         }
-- 
1.9.1

