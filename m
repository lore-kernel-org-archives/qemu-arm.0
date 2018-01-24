Received: by 10.28.71.27 with SMTP id u27csp389130wma;
        Wed, 24 Jan 2018 01:15:12 -0800 (PST)
X-Google-Smtp-Source: AH8x224cnv8AdvBUaqjDB6Y/Nm9DSMTddQhbDo5PeB0Wz1EsOzLpgI+2WVTf34A0vRax7SvhbPEy
X-Received: by 10.13.209.66 with SMTP id t63mr4766995ywd.269.1516785312564;
        Wed, 24 Jan 2018 01:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516785312; cv=none;
        d=google.com; s=arc-20160816;
        b=Gxuz3OJMOaZoCBNeXkPuC4fUlDX7ddsBYCWqg44fBuh+wth7uOfhwA+3wlNCzYTJnQ
         gIi5ZTuZbmzWfm0ecY78q+teoMDMY6nUGuWwweLRj0p6xQckY0ePqb2lykt3VNRkgngz
         YBWuV46Q04NwY2D3hKGtC426iwCZ6N6lMYrkCtH9mc+6xA6V/z4KNdHBbYNeovGbwiOt
         /olvNVWMvyYsnvutbPSOJY0n1G0T5g5cyJcla7fW8F/0riHNouO7hZ++fO9R3JrAFFZO
         MfevjEeLjtT5vuZVh5Ebt2ESa1a/20cqIdJWxcnxt9NNS6ZYaQQCmT5XTv/LG/6bBdfC
         98hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:content-disposition
         :mime-version:message-id:to:from:date:arc-authentication-results;
        bh=7Jc0Yqs+2/8x7qmcD3yMuuQQNkBBcXdMSG35sc+ov2I=;
        b=C/Jl9JCaDM5Ed8BjWOqIJXkxQAuYbPHipfI/FWW9WiYe0V6r/uSD/Y/RzxgBtAx4vt
         ybekbk6zJ+D+YZ2y3L4VZZZvCEBJoeT7x/Xo3C4h5G1hsz+TZ2Rh2F5b1UQU3BK5Ztoj
         VHPiAngK/06aCo7K7BfPlsKy9A2q50r9ynroaftc5UM+8PU5ZSo22fkF4N39bcNUI/NW
         TdeKz8McAjoi0X5KkFUH/ZWaJxMlNWmPI0mUTrCsGaLun9UNU7UgblHu15ffbCPLlfoN
         EtDUj20ZgLdc1sBEsBLIG4AoraHRpj2OYoXKZKBRt425YyefFmAJ6zy4xhw34qKhsX2n
         vB1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j19si1798023ywk.656.2018.01.24.01.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 01:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeH9E-00035F-2l
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 04:15:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1eeH96-00034a-TS
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 04:15:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1eeH92-00089v-R8
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 04:15:04 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:45366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agx@sigxcpu.org>)
	id 1eeH92-00087l-J3; Wed, 24 Jan 2018 04:15:00 -0500
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 38311FB03;
	Wed, 24 Jan 2018 10:14:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-XN2JhlHWLF; Wed, 24 Jan 2018 10:14:57 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
	id 9F3D445ED5; Wed, 24 Jan 2018 10:14:56 +0100 (CET)
Date: Wed, 24 Jan 2018 10:14:56 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <39441aea4e2d05cc505ed3a373e81d3869eb994a.1516785202.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
User-Agent: Mutt/1.9.2 (2017-12-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 24.134.29.49
Subject: [Qemu-arm] [PATCH] linux-user: Fix register used for 6th syscall
 argument on aarch64
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
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XG73Dt+EuiQX

Unbreaks the testcase from

    http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html

Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
---
 linux-user/host/aarch64/safe-syscall.inc.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host=
/aarch64/safe-syscall.inc.S
index 58a2329b37..e4fbc31454 100644
--- a/linux-user/host/aarch64/safe-syscall.inc.S
+++ b/linux-user/host/aarch64/safe-syscall.inc.S
@@ -36,7 +36,7 @@ safe_syscall_base:
 	 *               and return the result in x0
 	 * and the syscall instruction needs
 	 *               x8 =3D=3D syscall number
-	 *               x0 ... x7 =3D=3D syscall arguments
+	 *               x0 ... x5 =3D=3D syscall arguments
 	 *               and returns the result in x0
 	 * Shuffle everything around appropriately.
 	 */
@@ -47,7 +47,7 @@ safe_syscall_base:
 	mov	x2, x4
 	mov	x3, x5
 	mov	x4, x6
-	mov	x6, x7
+	mov	x5, x7
 	ldr	x7, [sp]
=20
 	/* This next sequence of code works in conjunction with the
--=20
2.15.1

