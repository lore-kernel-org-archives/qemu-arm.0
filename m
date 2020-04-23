Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1842442lfm;
        Thu, 23 Apr 2020 05:44:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypJYnUKafTNhPJKgRJXIu7KEty0aHrCsjravG2H6/HyhjGfGUdpgBQ/pg88PUYnre/gcXGO8
X-Received: by 2002:a37:a94b:: with SMTP id s72mr3425899qke.415.1587645883542;
        Thu, 23 Apr 2020 05:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587645883; cv=none;
        d=google.com; s=arc-20160816;
        b=YPEykLjI2Sfrxyx5I81FitnpljRenOJFwQf7FTU9rwFQTlIjPwODLLc7h6AfV2R7A8
         37/7ODJBrJbbdPR64wQVQCSg3N6DzY3qH+tYSgC8+eN4VutIc+q+DNBZSVQZ2uHVSS39
         QdToI5Ee5LWnOSI7RSzh6Q0CSGvDUsMJ9cptgWM6jXHz8oEIgQ8q0lJuAVStIYLa4kMr
         NVnWMVeW3pl2rxof2vXJaazv0Ba10Cnwqb39993jQ2wmlz819NSs65Yj5V1wCImnL2Kw
         0yWsFSpzdhzF+E4p2PDBDV+xU7H2Tf4DMUgEtkaFPb/lHz08YEsS2/ojnmxhNs4olkxJ
         gCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=KK+Nru4yuP4c3n7CVPB6G+i75WbREygftS8BvjsDaZA=;
        b=A7x4IrSeNqaQ+IyTGgcA7Zm6TwkRDimDaJsDRBPS1KVpNR+tjyV7jr4RfKvkY0F8pk
         GxMzC6XJeRn1TiX8cqTcdLIfPYOnPb3/A0wi8DcNJOjMtqSNgO1yOYvqaRqBSwcW9rpI
         boPGkJfhpEJ7uil1m1T98QaFOsmBtHBdmmlZzj5/uwhUB06u97EbZSi4E3Mpp161pn0p
         Wyv2TDPG/U371iJjLWtX+kbglP1fkJwly54Nqr4CFfxv6pxEJu1GH449R5JD194VegED
         poG51eLO6Rh93r/CseozgnHcVFDDyjBIIBjxtZI2jod5puKr5H4j2nBIMmuA/59Bk46Z
         NHtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mFa2/kcy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si965590qkk.53.2020.04.23.05.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 05:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mFa2/kcy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRbDf-0004o7-0n
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 08:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRbCE-000408-N1
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 08:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRbCA-0002Zn-BE
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 08:43:14 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRbC9-0002Vb-Vi; Thu, 23 Apr 2020 08:43:10 -0400
Received: by mail-wr1-x444.google.com with SMTP id i10so6662130wrv.10;
 Thu, 23 Apr 2020 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KK+Nru4yuP4c3n7CVPB6G+i75WbREygftS8BvjsDaZA=;
 b=mFa2/kcytoQTyA9h5UsMfwVNyGqcIdNtWKhXXkoSUktly7/Q8/mjdWvesfEtG8XczB
 3G0C4o9MCCG5rpGRRK04Wf3aNUkxWQ1C3g+P108Q3t8nI+TTnpwafqg0Zhw82scLJxjd
 q2Rvbp9wTyE8nFustspGUMpbLs8JgHDBGwbHSXb0bQtWy5YUI6ojfDmBBP1fOKfbqFGA
 TBugD8LXTvO5Q0DzEn95C9KWFP/jfkEDsJeNQvECK0tVBnf0GWSkgRk+OnKfrAYOI5PO
 AZsKoUYLY6ve/jBcd8UgQ7BvwTN4aLqi/i+EgGzsQrNbBdB0brXmvrwtudFAH7EofHy5
 ZUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KK+Nru4yuP4c3n7CVPB6G+i75WbREygftS8BvjsDaZA=;
 b=mFnMOVxwNGsJFlLn3p4yO8b2eUzYJ+Qc9wV064BwhvZxzOv+aWhZPCNJLz+KJnPFjX
 p/j/G/OedPWHgMa8lBT/FdbLJgHvoJQA8EdXImb/p9kaT3nP11b6BYQxhk20oZSgFhAJ
 exOw+GTlQL3kVGzeb/5XJLohxpFt34ayOH/XkO8SxyNEhX0SXrPXbbA5YoTXtzld7HLj
 vfGNIr9TtQi2oPrwI5OvzGJbSpV2Qn/sC5HKfZym4J3C7frg4R3Sr+QfNEL5vhg+wU41
 y5/qkfofy7zvDTEX3QF8Ou1SY1U3caK1gg/zSLUwX9okfXIP48KFb/5QxkeM+wHjjKry
 XBSA==
X-Gm-Message-State: AGi0Pua/yPzIbAi56oiqlrgUHU7s9LZyQBCh31jsYRqFue2JObR+Vgm4
 b1h6Sl2GS0GWoqR4j6yzHOFUtbEV
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr4725903wrs.212.1587645788041; 
 Thu, 23 Apr 2020 05:43:08 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id j11sm3580921wrr.62.2020.04.23.05.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 05:43:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Use correct variable for setting 'max' cpu's
 MIDR_EL1
Date: Thu, 23 Apr 2020 14:43:05 +0200
Message-Id: <20200423124305.14718-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C3UvYVeG5c6e

MIDR_EL1 is a 32-bit register.

This fixes when compiling with -Werror=conversion:

  target/arm/cpu64.c: In function ‘aarch64_max_initfn’:
  target/arm/cpu64.c:628:21: error: conversion from ‘uint64_t’ {aka ‘long unsigned int’} to ‘uint32_t’ {aka ‘unsigned int’} may change value [-Werror=conversion]
    628 |         cpu->midr = t;
        |                     ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu64.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 95d0c8c101..4eb0a9030e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -620,12 +620,12 @@ static void aarch64_max_initfn(Object *obj)
          * code needs to distinguish this QEMU CPU from other software
          * implementations, though this shouldn't be needed.
          */
-        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
-        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
-        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
-        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
-        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-        cpu->midr = t;
+        u = FIELD_DP32(0, MIDR_EL1, IMPLEMENTER, 0);
+        u = FIELD_DP32(u, MIDR_EL1, ARCHITECTURE, 0xf);
+        u = FIELD_DP32(u, MIDR_EL1, PARTNUM, 'Q');
+        u = FIELD_DP32(u, MIDR_EL1, VARIANT, 0);
+        u = FIELD_DP32(u, MIDR_EL1, REVISION, 0);
+        cpu->midr = u;
 
         t = cpu->isar.id_aa64isar0;
         t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
-- 
2.21.1

