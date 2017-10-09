Received: by 10.223.197.9 with SMTP id q9csp2474170wrf;
        Mon, 9 Oct 2017 06:53:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDinMjBOsK20ygeweGapGPkm1hwNj3j7Lpj/MufN9wS9baq70sBKE0MNEHd/Hy92CJA4P0d
X-Received: by 10.55.148.194 with SMTP id w185mr9217727qkd.354.1507557218046;
        Mon, 09 Oct 2017 06:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507557218; cv=none;
        d=google.com; s=arc-20160816;
        b=b8rDRQcDVKPnf2XknRfIA1pd+GTEt9F9ykOGsYY+Aw6RouzBzzGSM+vYeCw200vo29
         g7fx23Rlkx6PguTyFjiwH9bT3IU9B0BqJbt6DHwfup9Ox7W5HSSbBHXNyHLOUzxAob9L
         n6muhMq+HzUfDVM4n7Kk6yN4Ew0Qps5hdmG+YS1d+qLasILTZ7VEwOn3cDnxIRw524pg
         hhQeQYWmybXN1Mt4ViYwtG2AfPFjl3ZAGEE51PBQqWq68wMOBNWcpWTkBjox1lp1kCyk
         3mf40H47lGRJPgqV3/F5tFcjRuatOxvQxjYbiHkwLZiunGwOWEkHYTmZYZIZvb0URz9C
         3Heg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3cimKu6ZxsmhZIJyth9r+ECjUHkneklgLmUhWltrPI4=;
        b=NYpSyPXcFS59OecnnNY0ucFvGLH5jJ62B8Zz642rimwhQ3DxC3k3kYmAdrnW6NVLGj
         lG/G5JlbqA4TvqS5nExo9QYNuTDx2en/aer1wDYFbFdLIDFrI62wsZBpsy4+XvKO6ayT
         rFIjBXdqCL6o113WoNmAqrdl5omS+BUlnkirkdL/5Vpw43JwWsWWaG+dcA1DcKKfRjXD
         PGT7RVJ0EZUjiOYHi53Vjx15CtIyc1sWnfDLsQ2KNtau/jAtKah5GyNq48K+g9OVZAnb
         bS+P1ZesoE0holaHMbFPQr1DXPBwNYEObYLtct6t8tV5IJ+VIZlZt67zaz5PlA9avxXS
         VVAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si2313401qty.256.2017.10.09.06.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1YUz-0004f4-Iw
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:53:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQQ-0001JT-PN
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQN-00046B-1N
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1YQM-0003zX-QK; Mon, 09 Oct 2017 09:48:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1YQD-0004YK-C3; Mon, 09 Oct 2017 14:48:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Oct 2017 14:48:35 +0100
Message-Id: <1507556919-24992-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/9] target-arm: Don't check for "Thumb2 or M
 profile" for not-Thumb1
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oszKaiRN4zME

The code which implements the Thumb1 split BL/BLX instructions
is guarded by a check on "not M or THUMB2". All we really need
to check here is "not THUMB2" (and we assume that elsewhere too,
eg in the ARCH(6T2) test that UNDEFs the Thumb2 insns).

This doesn't change behaviour because all M profile cores
have Thumb2 and so ARM_FEATURE_M implies ARM_FEATURE_THUMB2.
(v6M implements a very restricted subset of Thumb2, but we
can cross that bridge when we get to it with appropriate
feature bits.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 58d706c..f5ca87f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9722,8 +9722,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
     int conds;
     int logic_cc;
 
-    if (!(arm_dc_feature(s, ARM_FEATURE_THUMB2)
-          || arm_dc_feature(s, ARM_FEATURE_M))) {
+    if (!arm_dc_feature(s, ARM_FEATURE_THUMB2)) {
         /* Thumb-1 cores may need to treat bl and blx as a pair of
            16-bit instructions to get correct prefetch abort behavior.  */
         insn = insn_hw1;
-- 
2.7.4

