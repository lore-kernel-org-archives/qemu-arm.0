Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5160236wrt;
        Tue, 2 Oct 2018 08:03:39 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63KxSoM2FO6LUO5v88dAAOkYWq64lyT90QpvEnqkz0bW8m/WWUYiFiKE4YVBOvtT26U7rUS
X-Received: by 2002:ae9:ef8a:: with SMTP id d132-v6mr12264319qkg.215.1538492619123;
        Tue, 02 Oct 2018 08:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538492619; cv=none;
        d=google.com; s=arc-20160816;
        b=OxmGS3Ruj3eQHGUgD21T808S4vvhV249SymIwKgITj1Bog3U0j8B2ETNqIaDzfAmfP
         qPRqYQzDIeghU0CKqphCIOWlG7HVEVlQ7afhMbx8WXuzSd5Iu6BZ1zdTzhq4BAKZrLCe
         652X5mqyunUVoYYlgXuMn/kJjpz5raTGlhvT3R5G3Io+xCI6toeREX9fWETMmGLyfnfV
         scAmw03WediPMSZuq9K4dahYX4FjHWOlyqHgLw69qe1ZsvdFl3QRZKIWPF7AC6v83ZyK
         VPp6uN8Tp52RvTZ8x1pzC8Y5N7jiIDB3lyVJMfyEJLY9rFW87qX+ICTbkhrwk9DxxBWd
         sB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=AH5WGXRyJaakUZbm8af4cvH8j+H3Uv3Q1i+21cgfuHo=;
        b=OUGwvQi/RbSeN9Y/KORgZMZVjQjsHGyK8t5mJOpG9D821npF60Y8MaEr1Na6gaEVHv
         dH8dUkdjxO1IMfkHX9gB5c7P7U1kzB3uA1psIb3eM08BJHgjqs4ov9BAYykcFlP2K1C6
         DIaGJywgtXLPijZxdYVCAlc2U+S+8JLauRdDoX5PKmchXaXtqqFVzBTQXIsYsCaJEDqC
         AwSX3SWM84+doi9dOFK4GZvvCPdMojJh8e0Bpcrem+byFZQPEjH8rUwu2xeTiFqUD0MU
         m/tuDHXOn4KuEXpXWYZ3fzHG77ueWi80i8GSF4vjcKoZbC1vEhmLnPfFIhR7KX6t9eqm
         i/mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w64-v6si10460857qkb.193.2018.10.02.08.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:03:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7MD4-0008HT-LT
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:03:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7MCk-00083o-1M
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7MCd-000450-8B
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:03:17 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51540)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7MCc-00043P-Ve; Tue, 02 Oct 2018 11:03:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7MCZ-0007DG-Dh; Tue, 02 Oct 2018 16:03:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:03:04 +0100
Message-Id: <20181002150304.2287-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Don't read r4 from v8M exception
 stackframe twice
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: psBgsleD9x4P

A cut-and-paste error meant we were reading r4 from the v8M
callee-saves exception stack frame twice. This is harmless
since it just meant we did two memory accesses to the same
location, but it's unnecessary. Delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 073fb3c5cb0..5e721a65272 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7303,7 +7303,6 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             }
 
             pop_ok = pop_ok &&
-                v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
                 v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
                 v7m_stack_read(cpu, &env->regs[5], frameptr + 0xc, mmu_idx) &&
                 v7m_stack_read(cpu, &env->regs[6], frameptr + 0x10, mmu_idx) &&
-- 
2.19.0

