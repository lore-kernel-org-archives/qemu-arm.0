Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3742026wrq;
        Tue, 10 Jul 2018 09:10:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdjbMXeycZQfzDYw43PbRpIfnhW+o7Z6HcuYrvqz0lfsacm07DpkDrr0FLUWwc8IkD1rE/X
X-Received: by 2002:a0c:88ad:: with SMTP id 42-v6mr22120303qvn.61.1531239047125;
        Tue, 10 Jul 2018 09:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531239047; cv=none;
        d=google.com; s=arc-20160816;
        b=fenCHZUEmj5SaAeIyk8CAWNvp8kT4wJFTFCTG0gZNS8hOsqsicOwxPZIFWcxwIDhwY
         9X1bgdIyolfU9X9unkG2swVRTtOV6DXlqEMP2cwCeCyZqonaeHIbB9u1zxvJ8Tw8gz4i
         Kr/CvFfSm8w0zqHPk9pqcnnuE40j3AzsEwq3ONWSWH61poUok7xABOj3uLqa3QB1h+8y
         4jX+wi0lfCFrOO1megmpydl1vovXiMvM1OLEBGgZ4tAYYgGSWC5eiBl2rUEY2pS1h/LU
         KMllVny1ThKvviJUD0M1Va3N7gHSV3eFNWNVVQJhyYdHEqD+DhQIMQmSgzVW2QVR2JjK
         wB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tP6x5imcEl4EjW6gSdihjFRhN2MBc/RaFmY/SsTAEZs=;
        b=BtTI9xl7JMi593in+/1qErqu/O3k2QfMn9NpcqbLyu54wX7hXZuk+lmN3KIdZ+jhtb
         /I/R0uwrRB1s8ajYaE5kVkx3ljWno+95QzqIJJhRDTd6jGmZM2wROF3VbuHE4Qbaf/Tq
         8GxCxy4tWIandrW1CSFDEt3H+mdMec2KHYLgb48IG0CEq/qj1POJGPgr/rF0j/CGSjYq
         Mi66xWKKHdLLGHQ2zSSpGQmly3k3Au2q6AmkoHUibnHpGK6Skc4rDG4gtu7Az1rHCFvP
         1rjUkR99jBM5TwceKz00jsnycKklwYU7aaCEEc7b7bC0QPANGJ3mnBuKIDzV3XHBRibq
         JC4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12-v6si9810113qva.223.2018.07.10.09.10.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 09:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcvDy-0003Mp-D2
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 12:10:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv43-0003VT-1s
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fcv42-0002LX-38
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 12:00:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fcv41-0002Aw-RG; Tue, 10 Jul 2018 12:00:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fcv3p-0001p6-AH; Tue, 10 Jul 2018 17:00:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jul 2018 17:00:10 +0100
Message-Id: <20180710160013.26559-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/6] accel/tcg: Handle get_page_addr_code()
 returning -1 in tb_check_watchpoint()
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yzNTBxNShFEP

When we support execution from non-RAM MMIO regions, get_page_addr_code()
will return -1 to indicate that there is no RAM at the requested address.
Handle this in tb_check_watchpoint() -- if the exception happened for a
PC which doesn't correspond to RAM then there is no need to invalidate
any TBs, because the one-instruction TB will not have been cached.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/translate-all.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 49d77fad44e..d18018fa99d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2121,7 +2121,9 @@ void tb_check_watchpoint(CPUState *cpu)
 
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
         addr = get_page_addr_code(env, pc);
-        tb_invalidate_phys_range(addr, addr + 1);
+        if (addr != -1) {
+            tb_invalidate_phys_range(addr, addr + 1);
+        }
     }
 }
 
-- 
2.17.1

