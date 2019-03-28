Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp696626wrx;
        Thu, 28 Mar 2019 07:30:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3wFDb8w5P/BswYPNjRhRb4tuDyWp18APiSYxsGUgRe6R6iKHzF5lacB97PLcBeKpdwr1A
X-Received: by 2002:a24:ac3:: with SMTP id 186mr294340itw.16.1553783422688;
        Thu, 28 Mar 2019 07:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553783422; cv=none;
        d=google.com; s=arc-20160816;
        b=EgVBj3BI0DmATxRKu7QQg1PhMvR/eMd40MFmoQEIL8Qi2o/i3jXrEKRoPz/Y3+5gCG
         UjWuyOeDlzK20Ur7nOCxfTuvux98Nk3iV7ZgBx14rj/OqQNBjX92+TyFpBSoxqPTzuXb
         ER6xvNMCZBjitaHBL0Yn1O+eVhBXdvzDpZQksgzy6I1krkmUHxCnf9w4QQpF+wU0HQqr
         C8jrBz94yOAMcJMHfiq8HKFcHj2JqowX4ylkZHdW1SNlcnZSrpAfN6rfYoLOzhbHT/C3
         BS5eM1wYTgU5R2Ut63laCOYrNrExy7QUy2LBiMBZeb7vSuuMntMI+jvFUZRcqBBMazpt
         26/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=/J0e1MnZabGGnMQooqkvyJqnQKeiQRnVVCjIZnWojkI=;
        b=VGi9BYzT/lCjC6Fluizdv7mx2Pmz+4Pm3kfUUsCo0UNokNvaGWpfAYKj0rFseSDPh6
         Gb9FXtojN6PT68AEZROVi0dZm8dKl0sHb2yulRXLQuZ6aBkEWTyUzYDDf6uo4ca+9arN
         +jcZMgvAwRJWijTfTpKP//xhy7LDPDvmQG8LdREm4Z1+cVeVpisNy9ZvLxwiJh+JSyu+
         wn6dWzvWCZrCamKwZHVP+GFp+0YqT3NJz03ieqfAI6vEKTZjYA4I55RER9Cg4Gi3nMZC
         +hy2ge0rHPYoXiCDtYZhvvDXJQ5bvS+H5GeFigQEuJvlpC4qihesgaal0yrYKMRrMvx5
         VAQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJRkfdGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si1749856itb.109.2019.03.28.07.30.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 07:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJRkfdGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9W2v-0006A1-W6
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 10:30:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9W2l-00066t-Pt
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 10:30:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9W2h-0002mf-0P
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 10:30:11 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9W2g-0002mN-J7
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 10:30:06 -0400
Received: by mail-wr1-x442.google.com with SMTP id y13so5473415wrd.3
	for <qemu-arm@nongnu.org>; Thu, 28 Mar 2019 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/J0e1MnZabGGnMQooqkvyJqnQKeiQRnVVCjIZnWojkI=;
	b=sJRkfdGvGbtRZBj7WqHCNaLKpLHaV3ewkLe05KipuqrRADYIdgqnSKRVLG+7kN+E/1
	5h7b3mrjsRDsuc0aWZNkJp7BvMzeIV9HEtX78tUH7VDJHJiuZwmkzd4II81i4aQraz5t
	940hHXGIiFERD0hShAawXK5dLg4QGrVK+QmUMPVJNpuZBdLi+X8YUdozo4d+vRMcRun8
	1hYbq9ebsrMHRmh4ML/iIfdvmwQ2csfzwUk/SnLjVtPv7856juXVEbQxrTuQxdakxl4A
	zTHLX1FhrlwHYuf8MKUPD1oernA/EVMas2vpIT/Ecl7v9cnSq/N4okhCw044ocpGIRhO
	+kTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/J0e1MnZabGGnMQooqkvyJqnQKeiQRnVVCjIZnWojkI=;
	b=jb+5cQmXJvmb3A2674W517z89Bh1tlUUIFRNgBN21+qlvn9mNDJagvMcz73OzqWSuC
	KfaGp4S21H85Kkj5m+gZySVFIL6+UdzHft8RtA0JT2EcaJU/mfCx+vCBTgxw5ss1XjMw
	n1/SURqkQJbCa1LjlZnywjh7Kd6MQm8cBdFdfRKBMytMUwf48fv9tsZ5Bti3pP0n4bdX
	DbwRu+JjR7UrYD7jGKpdOKMcADWnwhhKYMEcC+yHRPpR34DXsMGEYBS7j8i9+5Wdxsni
	MecYqsJWpB6IrzgR9x4BTSfyE82qRZF+1bsssvXl22Rq56NEeyxcmBYUIAq0wtZrWU8r
	PsZg==
X-Gm-Message-State: APjAAAUqwR/NqQtzUFoPOZJMCEavVspRDWEAxAvaGd1FFP0/XRR3RUMl
	zSFPMSMUYb6BKv2SsyCO+yXpxl59bp0=
X-Received: by 2002:adf:fe4d:: with SMTP id m13mr24137640wrs.267.1553783405307;
	Thu, 28 Mar 2019 07:30:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id t15sm4613824wmt.2.2019.03.28.07.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 07:30:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 28 Mar 2019 14:30:03 +0000
Message-Id: <20190328143003.16702-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH for-4.1] target/arm: Stop using variable length
 array in dc_zva
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
X-TUID: mJGtPJMNvOuG

Currently the dc_zva helper function uses a variable length
array. In fact we know (as the comment above remarks) that
the length of this array is bounded because the architecture
limits the block size and QEMU limits the target page size.
Use a fixed array size and assert that we don't run off it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
A small move in the direction of "avoid using variable length
arrays in QEMU"...

 target/arm/helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a36f4b3d699..1b6225cb598 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "target/arm/idau.h"
 #include "trace.h"
 #include "cpu.h"
@@ -12412,11 +12413,13 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
          * same QEMU executable.
          */
         int maxidx = DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
-        void *hostaddr[maxidx];
+        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
         int try, i;
         unsigned mmu_idx = cpu_mmu_index(env, false);
         TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
 
+        assert(maxidx <= sizeof(hostaddr));
+
         for (try = 0; try < 2; try++) {
 
             for (i = 0; i < maxidx; i++) {
-- 
2.20.1

