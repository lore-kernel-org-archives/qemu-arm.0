Received: by 10.28.71.27 with SMTP id u27csp827922wma;
        Fri, 2 Feb 2018 07:06:36 -0800 (PST)
X-Google-Smtp-Source: AH8x224xo1CtbIgG4XxciQFn0XRzkFBMC0uOb5ZQfu34nuyzy1qnC1aVT0xBI2gVF0CM8mHtcpvJ
X-Received: by 10.37.133.12 with SMTP id w12mr19115700ybk.213.1517583996546;
        Fri, 02 Feb 2018 07:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517583996; cv=none;
        d=google.com; s=arc-20160816;
        b=zyHpEcfbuH5pR0rFKpyuYeSWKciGidHIWEKmlRGWOxHgdQ5lVptCNFNuIpQ8cM4BMh
         LhcI53zbidc00EMKZgeMEPtkYsuXz2pjNrqySYedbbI/6wTIylqKY91iQCXHiX+wGJbD
         9vTTee4LQV4xnhziEoedxQK9LMbTaSXypQmcHI/Fi2LVsYJlrYlWeELA707Ott5J0QRd
         WjvLyAxxGrdOcThbTee6koRCxxXXFBAm+bhxxfBVhQoDZkdNH6lpPo0wyUNDqRcDI0mv
         Hj2lgeprF4J1fLjPVJSQ3MrC8KBilM3Lhyq8S/nfcgoBHUnijw7U1Yph4P9xGvrmjgSx
         eidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:message-id:to:from:date
         :arc-authentication-results;
        bh=r6qG+cDCQ/QwQ0zizDqDOXK8+wSuT5zu/E6M2wEl96I=;
        b=f9n3n8A+W/KPEoSVttRvt5jFvKO4fnrcKZ3Wq3pn5e72hl9dMgGwWqejKmnLlqoaCn
         I/IGervqmDTNCYkJtCJfRqlnSWhTHOsaacfJIJ8lV+aKeDt0u5I0woJ6HzR+3q8BqkBB
         oXC5sNm4WQzmvMI1xyiEcRYtZM//y119yUzgd4Yea8cWjKdfbYB2u2NS8Ke7nIYb5U/q
         +GVTRQMNHXCDuNs2WKBQODncZcLjeX0h07tJl9aou2WhE6+wrrIbDcA5AcRuFXoP2ECo
         dIGptDB9L0iP7GUjOWaUmfO48rfM66C7RkzLN7nisTZp+QtGjF8e6CEFPOIn1SR/oQY5
         G5vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d3si460817ybj.790.2018.02.02.07.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Feb 2018 07:06:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehcvD-0003TF-TG
	for alex.bennee@linaro.org; Fri, 02 Feb 2018 10:06:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1ehcdS-0004S7-RV
	for qemu-arm@nongnu.org; Fri, 02 Feb 2018 09:48:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1ehcdP-0005Lb-2H
	for qemu-arm@nongnu.org; Fri, 02 Feb 2018 09:48:14 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:52270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agx@sigxcpu.org>)
	id 1ehcdO-0005L8-Qw; Fri, 02 Feb 2018 09:48:10 -0500
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id B980DFB04;
	Fri,  2 Feb 2018 11:02:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgWfWbRVGiea; Fri,  2 Feb 2018 11:02:26 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
	id 0A3B145EC1; Fri,  2 Feb 2018 11:02:26 +0100 (CET)
Date: Fri, 2 Feb 2018 11:02:25 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <671eaa99f4e0bf3a58f76f9151f7cfa24662227f.1517565566.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180124101358.GA5028@bogon.m.sigxcpu.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 24.134.29.49
Subject: [Qemu-arm] [PATCH v3] linux-user: Fix register used for 6th and 7th
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
X-TUID: NhG2Uo9CN99N

This unbreaks the testcase from

    http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html

Thanks to Laurent Vivier for spotting the 7th one.

Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
Tested-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Suggested-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3 collects *-by: replies. Anything else I can do to get this applied?

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

