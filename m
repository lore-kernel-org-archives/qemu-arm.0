Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp816038wrd;
        Mon, 20 Aug 2018 08:31:00 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwleSSgavz+A3GeUDJFKREozfVH7myNHNGL3jT7G0KxDigGSrQ8zChfSiskkH0y3X6uxHRr
X-Received: by 2002:a0c:a162:: with SMTP id d89-v6mr41873238qva.198.1534779060191;
        Mon, 20 Aug 2018 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534779060; cv=none;
        d=google.com; s=arc-20160816;
        b=S8y9RB58iLls0O4jMXH4LAtBiQsNntb0cZmqUPJhpd2T9X05sLtYXItXKImBbDQbX3
         Ct9mip/3RT/3skvPiirB4yzvEGiiMLSD9nk/fFp1ot5cAkV/7TbF+KcgwIMzexq32apA
         1Y5gVDJ9ksAya6PgARMGB2UfNRMCJGYYOt/pl/slWPEwIGr2fxrnQcPq7vQy+ppn8o/W
         q+I3GFXQrzednZYvAOoDxI/9Id8HxgcDFn2gtIRvTbiwqdqGJ4/3yG6Ka82oBsW6YQrl
         RxZT6mvPie3MRPX4lOPO7rjsNpm8406zFMGrIRIqKZgxVx1Qt9SzqClsIFj2dn1krUiO
         +x4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=moSA5AilztxXC/lYIPzqhsnxJkMe6E18E+AgO7r9TjY=;
        b=zVSLOULuiNX/EoZwzES8dLFGdTSNaZjr1wnt0ghfDAD5GilVJIEu5PG9RAgVQOw+kD
         BerLOH80hspvoYNbOXQqA12ZzvRJIe6U1IwcPZknoCLIGC8Qm+JiOYB/PuJIPtvEQdUi
         wMk67jOk/AqCpLOLCkQiYGlHpAXnPUAlC++7aquYhf8tTj4W57cZLNjPhjxMPXUt0Vcw
         +pL6Cv1IqGUu7xSqg/0xIZFaxqmW3PcLjv9HhJPvZUnBec0t2DIJz0liC2lB4v5JjEJP
         luv/X/cP9K7nFK3SvhtzUW6gOD1a9vDlmfBXy8iD3VoDzPlR2Ai8sQiZtdfm338em82z
         zqZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u23-v6si4269113qvg.263.2018.08.20.08.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 08:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frm8x-0005rR-I5
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 11:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8T-0005Wj-EP
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8S-00046z-QL
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frm8S-00044t-IG; Mon, 20 Aug 2018 11:30:28 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frm8R-0003aL-KN; Mon, 20 Aug 2018 16:30:27 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 16:30:19 +0100
Message-Id: <20180820153020.21478-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
References: <20180820153020.21478-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 5/6] target/arm: Clear CPSR.IL and CPSR.J on
 32-bit exception entry
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JqEgwjgQMPG8

On 32-bit exception entry, CPSR.J must always be set to 0
(see v7A Arm ARM DDI0406C.c B1.8.5). CPSR.IL must also
be cleared on 32-bit exception entry (see v8A Arm ARM
DDI0487C.a G1.10).

Clear these bits. (This fixes a bug which will never be noticed
by non-buggy guests.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not strictly required for Hyp mode, but a minor nit we
can cross off the todo list, and it fits better here
after the refactoring of the exception-exit function.
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 21a2d438944..f548ba17697 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8054,6 +8054,8 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
         env->uncached_cpsr |= CPSR_E;
     }
+    /* J and IL must always be cleared for exception entry */
+    env->uncached_cpsr &= ~(CPSR_IL | CPSR_J);
     env->daif |= mask;
 
     if (new_mode == ARM_CPU_MODE_HYP) {
-- 
2.18.0

