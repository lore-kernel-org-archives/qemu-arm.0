Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3527971wre;
        Tue, 29 May 2018 05:47:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKa2BzVUTOWYaa4LZwyMuAJm+AXo6lfa+QTokJ2I+bYyXD5KtGjnrIB4nLHMx3tLIalSl8d
X-Received: by 2002:ac8:2ce3:: with SMTP id 32-v6mr15617687qtx.236.1527598079484;
        Tue, 29 May 2018 05:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527598079; cv=none;
        d=google.com; s=arc-20160816;
        b=QcrXWEcmVplVoekNbKBOll3xvn28XxHQkNDEeTJUmGwc0Gv/xTS7H1cCzXE04jovVv
         P9lPG40iBEuG500L8fU2YFNarcFNHetG0WB7PBCe+A+YOerAcyflShWrIJEZewcA51Zp
         mCZkfGljX4q+ofJLK8E/kIKwr00LAT2JUbILVOZne/TuSSQj97IJtohaGN9AR47eTC0z
         qBWE+LJ230SDQfFk4wFGcm/UOhKhf9is+Wz7+0/+jgOrhcYGXh8iu89fSNX4j8nt8gR4
         dRN0c1in3NySffDCiOZs6ecZrKwF3hYYJrY3eXnyp3EVbHhMTFf6aaPHdtt3rtL7oy9/
         9PYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5biGLChf0/nSUujDpHh5zGsaLKak7F7Vx/rd3V/z138=;
        b=e0fqIxvzIovdIqYCfKMsHYECTZipaSIzfwfhgvwB6fUyvinWCAWl6vkHCfToGKgsNI
         W0f11r3VnO254qTcT8R5cB+Q/2adsxxHysNDsFqZQ8c2vWoCBviLB9i+dzBx4a2V/wDd
         zjU6I8N42EoEZ1oba47fImEsKwwap99zhjR4m2Z+9NY8ja1PoWypx6RdPB6Ju7EPW0R5
         Nr0S+mupQPJc/ZNz+IGuCVz2pRK0NUHgFV6B9GITpnRRedYyrX4gTDDJzeGnLiV2nX07
         8D+LOQh9JqEoz3IxSmdawEN1KQOHBPRLpgVKBWXWtUBzkPIyywW4cEY+flZBG6cnK0gm
         lFZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlqsHNmY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5-v6si3156757qka.403.2018.05.29.05.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 05:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hlqsHNmY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNe2h-0005Gw-0b
	for alex.bennee@linaro.org; Tue, 29 May 2018 08:47:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fNe1x-0005GK-U2
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:47:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fNe1w-0007P7-D1
	for qemu-devel@nongnu.org; Tue, 29 May 2018 08:47:13 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:40223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1fNe1w-0007Os-67; Tue, 29 May 2018 08:47:12 -0400
Received: by mail-wm0-x22a.google.com with SMTP id x2-v6so32817275wmh.5;
	Tue, 29 May 2018 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5biGLChf0/nSUujDpHh5zGsaLKak7F7Vx/rd3V/z138=;
	b=hlqsHNmY7wOGZb0g29Ls4bKa73NHF1FwA9myzYRyWYzUH+1LIfbVVShImiioG/bvnN
	OzhUuc1vJeKSwqKH6LZEan4ngHpluej7N1OAaOX7qccF6kXdS/sofaxucyhYvdtECwxc
	dAw0GzakZl3OhbtYY3mJQR12+yL/V6afeQWBVnsGGqrPgVFJHnktiPNJ/AL1NTDc3KtP
	UzBRL9jljRIt9wo7MjTYOSfmCZpQtPIMnu0lRP9xx0HfLYwNAyiBBDWLi1V7nU+WKRq9
	K/zNyWxUjXneXcU90LnhyLjyd2lNtxy1nOyBwgyiZeL3LLRMoBFbkI4o4Qx6rMLQ3xJ9
	dZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5biGLChf0/nSUujDpHh5zGsaLKak7F7Vx/rd3V/z138=;
	b=Kp2df9QT0QrwXhFU7ILSn2icwEChr5aQHqDDqztfdd5hXfv0UfNq+pU7t+6qKxRKk5
	+otRYG9atf1/sr1huBsSPo8tPZYYfZl8Fklz9UB80QhV+whEvK6z6Mjd076dG3V5FFJC
	YP+q9QBki9RcL7b922fwRn2Tcy6CaBeS6ZGcYT27Rv9dXFQTTneadXJ88q7VDX5Cfnk+
	szS2DsbQU3ijtzqw0htnx6AXgPJFITqdU/ZEbE3QXqhnjB9eXnoPmMwFMKwvDkqO5JSD
	Rva9UyXocwNdVaJl3Qi1rQdO8HkciMA6fZ1Q0m5gAAup3Kea0dslzlY3N9XHZJWAE+H4
	KoWQ==
X-Gm-Message-State: ALKqPwcPmqxFygoqsGO2KeSMppNjrSZQdA1ctvvY7PQsdd77+672e2y8
	/RXEmnZ6rHUNJgz2igOazyEAKQ==
X-Received: by 2002:a2e:944d:: with SMTP id
	o13-v6mr11041969ljh.65.1527598030795; 
	Tue, 29 May 2018 05:47:10 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	u5-v6sm6376409ljk.64.2018.05.29.05.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 May 2018 05:47:09 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 29 May 2018 14:47:06 +0200
Message-Id: <20180529124707.3025-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180529124707.3025-1-edgar.iglesias@gmail.com>
References: <20180529124707.3025-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: [Qemu-devel] [PATCH v2 1/2] target-arm: Add the Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, f4bug@amsat.org,
	frederic.konrad@adacore.com, qemu-arm@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VpkH+BX8hndx

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the Cortex-R5F with the optional FPU enabled.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d60893a07..8ab571e84a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1343,6 +1343,14 @@ static void cortex_r5_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
+static void cortex_r5f_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cortex_r5_initfn(obj);
+    set_feature(&cpu->env, ARM_FEATURE_VFP3);
+}
+
 static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
     { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -1803,6 +1811,7 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
+    { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-- 
2.14.1

