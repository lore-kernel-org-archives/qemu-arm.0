Received: by 10.28.71.27 with SMTP id u27csp3608725wma;
        Tue, 6 Feb 2018 02:39:56 -0800 (PST)
X-Google-Smtp-Source: AH8x227b00p2z9S0jTFOLIRBz+PtOJhk+oRAlTVJ5jajg9jmr+elxernrbledpKMPXuib3E52pnY
X-Received: by 10.129.71.132 with SMTP id u126mr1025111ywa.411.1517913596337;
        Tue, 06 Feb 2018 02:39:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517913596; cv=none;
        d=google.com; s=arc-20160816;
        b=ZpI67GzPvVarXxc/c/tULkdBMOtdyxhUGQeENFsuQNYIeTWI3Eu7pLJb29yST8JTuu
         egp3FnjOZi9BTE4/aVB3BT+q8MxoYHl8zY9muGndwwa96F14rre+nJqRvEU3I7qVuKdd
         zOi3LTpGtmUnp6AVe+S/V1x1mbq/g1Vbfsn8mYnW8l12D71y8cOO86map85SR1crxyK/
         h9KgISJZiva4jrpxnhZM9S3Wzq9kuPOBNMB1imzV5bO28BekKpwJt+D2AkU2KyK6q86t
         KbJTk/JioVs168wiH3YuoiqgXuf2u+xNoUOdA3et/EOP2xZVQZUAHcO/lUF4Qq3Jjpgw
         3g4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=mXlVK1FUBnzAFVGEEjezRAHYQ+QKIT3Wbt6SXP/vtk4=;
        b=MfmwMvNo1qJEz/2hSSBhak94mJZZpTghjuAN1CWtFJRGhNgae8oxoDlJiqQ/+5VFVS
         JT7M8iy3V1kx0bNSdq81p1lIoAFBC4Ck2KhLX6IeE01j93g0v8GMcPl7N/iS2yVkV+bK
         cgOOneyb7VKBsLyFUjmm9Ai1FYv3J032TSnDnUyH10sQFQ65lT9flsea2GUm4baAjtCA
         6K97EbIOXRELyNfn7AnRCXRcDgFaJCYiCyqN06es41VUaaZ9zxgw75I9Tcpo0nd84A59
         6H6tP7MwxpOHorJFqd871PCHWcgLO61fiowMso8Z2KKCg05lW5F26AvxT66Zt3glHdW1
         PrGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n76si907902ybf.507.2018.02.06.02.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 02:39:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej0fL-0001ox-PW
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 05:39:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ej0fB-0001nL-DS
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 05:39:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ej0fA-00018N-KV
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 05:39:45 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46226)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ej0fA-00015D-DC; Tue, 06 Feb 2018 05:39:44 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ej0f8-00058X-4W; Tue, 06 Feb 2018 10:39:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Feb 2018 10:39:41 +0000
Message-Id: <20180206103941.13985-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm/translate.c: Fix missing 'break' for
 TT insns
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
X-TUID: +R4cLWfUzkQF

The code where we added the TT instruction was accidentally
missing a 'break', which meant that after generating the code
to execute the TT we would fall through to 'goto illegal_op'
and generate code to take an UNDEF insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Doh...

 target/arm/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 55826b7e5a..572c4d1cb6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9926,6 +9926,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         tcg_temp_free_i32(addr);
                         tcg_temp_free_i32(op);
                         store_reg(s, rd, ttresp);
+                        break;
                     }
                     goto illegal_op;
                 }
-- 
2.16.1

