Received: by 10.28.71.27 with SMTP id u27csp438578wma;
        Wed, 24 Jan 2018 02:14:18 -0800 (PST)
X-Google-Smtp-Source: AH8x2246BRChpVGX2X9Dk2mfC4Okzqeeoyt0LDWx2Fb0qbUhar2K9bQ8UdNHMjf5M0c3571UPtoX
X-Received: by 10.37.224.6 with SMTP id x6mr5113877ybg.82.1516788858345;
        Wed, 24 Jan 2018 02:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516788858; cv=none;
        d=google.com; s=arc-20160816;
        b=A7X04BvvjPAQgfj/zL5jezvA6qGAdlE2jK9Jds1Xb+btIgC8RxDaklk7ePUGcSDHcE
         YXLkQJdDVNI4otUm8o8kR/iFzaYGHhRUoovu0mVNCdFQ18kRQg/oemwLYreyLDxtykeK
         WtO9jtX8xOuWw8SUg/4q4ZoA05ATcaQgIUipvFUe5Ketr4lnolfzo/E7ooTvcucXmNZe
         aDw7v0P9RvSvzIZP54l1xMEuXlxwphI58Gjdvq5p72YNgGTey47ma7KUnEHXc7vQHlvL
         G/2hGcG9L5JQ5gv4ZZW0h/Ab+JR/7mulmX4V3aqM6QGT2bk1jJzdfY7F8FAATG8xUlhb
         jxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:content-disposition
         :mime-version:message-id:to:from:date:arc-authentication-results;
        bh=XhOEYeXtqwZRy5fvf/hXcLASaG7tfuW/+jdkT7YeecY=;
        b=kufjT2eHxKN8ygmT0y7XRIa7aI4AHkfROJY/zj8cLoevo+/PDdraikBYA/sv+2tsej
         KvqPz8ji455yRZFcnT1VPPv/GazjF3GdawaBpGkQtsjOh92P7wLdJ3guGgro50P65SOG
         zm+lCFLf3+TBsdXHCcVB8cHrzCbxp3BnQu6S2V3FgdhJelsdN9xGAHDcR6X6NjK8BdpV
         Wn2LlwDu8Q2wbZ5W8sO2BspNYXp/4Dozfx01XP1MkiE05hRzGXcJ2a0wDIfxcx0uMFMN
         dn082DC9ejt0air135GQmhA5a6XHdbizrjBIa+G8rM2AgoTn8pztez+a5G6Jhofk0Ogk
         iOlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si2813982ybi.758.2018.01.24.02.14.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 02:14:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeI4P-0002xG-PF
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 05:14:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1eeI4D-0002v3-JR
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 05:14:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1eeI49-0003WS-JX
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 05:14:05 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:46900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agx@sigxcpu.org>)
	id 1eeI49-0003UX-Bv; Wed, 24 Jan 2018 05:14:01 -0500
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 55B38FB03;
	Wed, 24 Jan 2018 11:13:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jS_DxjBQ_6ik; Wed, 24 Jan 2018 11:13:58 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
	id 123F345ED5; Wed, 24 Jan 2018 11:13:58 +0100 (CET)
Date: Wed, 24 Jan 2018 11:13:58 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20180124101358.GA5028@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
User-Agent: Mutt/1.9.2 (2017-12-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 24.134.29.49
Subject: [Qemu-arm] [PATCH] linux-user: Fix register used for 6th and 7th
 syscall argument on aarch64
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V5phE1VaNEbF

Unbreaks the testcase from

    http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html

Thanks to Laurent Vivier for spotting the 7th one.
Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
---
 linux-user/host/aarch64/safe-syscall.inc.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host=
/aarch64/safe-syscall.inc.S
index 58a2329b37..bc1f5a9792 100644
--- a/linux-user/host/aarch64/safe-syscall.inc.S
+++ b/linux-user/host/aarch64/safe-syscall.inc.S
@@ -36,7 +36,7 @@ safe_syscall_base:
 	 *               and return the result in x0
 	 * and the syscall instruction needs
 	 *               x8 =3D=3D syscall number
-	 *               x0 ... x7 =3D=3D syscall arguments
+	 *               x0 ... x6 =3D=3D syscall arguments
 	 *               and returns the result in x0
 	 * Shuffle everything around appropriately.
 	 */
@@ -47,8 +47,8 @@ safe_syscall_base:
 	mov	x2, x4
 	mov	x3, x5
 	mov	x4, x6
-	mov	x6, x7
-	ldr	x7, [sp]
+	mov	x5, x7
+	ldr	x6, [sp]
=20
 	/* This next sequence of code works in conjunction with the
 	 * rewind_if_safe_syscall_function(). If a signal is taken
--=20
2.15.1

