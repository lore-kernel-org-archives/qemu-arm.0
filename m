Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp2816632lfc;
        Wed, 20 Nov 2019 17:39:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxd6gEHeIUDGfiuSDPVVPkImpa3ORsMoBSrIOWhOExAwMoiUa4oBEYyCOe1hAUyIx6FyTy0
X-Received: by 2002:a17:906:b80f:: with SMTP id dv15mr10063607ejb.188.1574300388798;
        Wed, 20 Nov 2019 17:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574300388; cv=none;
        d=google.com; s=arc-20160816;
        b=QLmn3PG8MkvRQPOK/5z0PaALSp2XvnCxP7LfAb5o8MYtBSV0EORO6SrJ2LLdfd6gUQ
         hBVhyRcjjoDlmQoBcm9077vKBE6Llmc2uZBfdEBMEY0uhhA4IZr5vJxLWo8n4aqvc7+H
         aTn2b2XOY7qvzCOK+I6yD1pcRXLk1WFeW6DTSTy94vTyq65704cvyYsKsJNeJzrQAGO9
         IaiWfwmlwRg6VfnRWuA5q6/bUlYc8+OCd5xJVE3w/4gR4oz58/n8AXKZ6oif3Z1yExnB
         o3dWeL02N1B+Q9jLPzEgz72WsjdBLxHSyHFdCaB65sFocksm+ioFDKqXE4qfj0N5R2Eu
         a88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=G7x+0l0MGkhypHBusSieelbqM+mMXLIb2T8PK21/BIw=;
        b=euTstCHSgnxZ7sC/9Mp+Ph+rB5pVfPDSNONinG3beEjIJFQnMFHBQP9DrpkAgVByNQ
         +50DPL6Dbl47iy3BRXQwlQwS4Um6yLEg8xeQVyPT5wcxD3PvOsG4m9h8wRsIUzhm4QHO
         XsN3M/UWEUROxk6aU4tFIw33OCrfWj42UD98nEOB3xjHGittih6RFi9I4cEoVb+Gumpl
         qcutSoCdzgYxiPDKwhe9Ip+fpMvVoDx6sAcPuGxSLqI5WyVcJILHozctang2Hk3bmpfI
         T/PpVoDt5cwACirp+ZK/48O81/5rari/kN8TNAKCKDUYYbbEeWrfVdudWEnCpgvZUqFb
         A+EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au header.s=201602 header.b="CpJFW+/e";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si920853edy.16.2019.11.20.17.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 17:39:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au header.s=201602 header.b="CpJFW+/e";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXbRj-0008Q8-QN
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 20:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iXbRA-0008OP-JC
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 20:39:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iXbR8-0006SU-J2
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 20:39:12 -0500
Received: from ozlabs.org ([203.11.71.1]:59921)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iXbR4-0006OQ-KA; Wed, 20 Nov 2019 20:39:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47JMfZ4dplz9sPn; Thu, 21 Nov 2019 12:39:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574300342;
 bh=JIfsApD1YfZ/bDz9LeRPQyITPIdEKbfk9wNA+Pc165I=;
 h=From:To:Cc:Subject:Date:From;
 b=CpJFW+/eB542mN3g2/u4O3uCRcVAL1kE2T1R+tpGV0g+Mg0YlWGRJPurUI8SS/FFw
 3x7r92N81sNWW7657+k56qtdx1I081EkiqrlJXgvKni3AYsFeFx2v5Uw4OPCgGH1Wv
 /Dzkb7owmxAbBEjDPlhJB08xhjjvP35UCwJF8+aA=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] exynos4210_gic: Suppress gcc9 format-truncation warnings
Date: Thu, 21 Nov 2019 12:38:59 +1100
Message-Id: <20191121013859.287372-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uPfuu0Us7Xaq

exynos4210_gic_realize() prints the number of cpus into some temporary
buffers, but it only allows 3 bytes space for it.  That's plenty:
existing machines will only ever set this value to EXYNOS4210_NCPUS
(2).  But the compiler can't always figure that out, so some[*] gcc9
versions emit -Wformat-truncation warnings.

We can fix that by hinting the constraint to the compiler with a
suitably placed assert().

[*] The bizarre thing here, is that I've long gotten these warnings
    compiling in a 32-bit x86 container as host - Fedora 30 with
    gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal
    x86_64 host - Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Changes since v1:
 * Used an assert to hint the compiler, instead of increasing the
   buffer size.

---
 hw/intc/exynos4210_gic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index a1b699b6ba..ed4d8482e3 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -314,6 +314,14 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
             EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
=20
     for (i =3D 0; i < s->num_cpu; i++) {
+        /*
+         * This clues in gcc that our on-stack buffers do, in fact
+         * have enough room for the cpu numbers.  gcc 9.2.1 on 32-bit
+         * x86 doesn't figure this out, otherwise and gives spurious
+         * warnings.
+         */
+        assert(i <=3D EXYNOS4210_NCPUS);
+
         /* Map CPU interface per SMP Core */
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
         memory_region_init_alias(&s->cpu_alias[i], obj,
--=20
2.23.0

