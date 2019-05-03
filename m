Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp478373wrh;
        Fri, 3 May 2019 05:05:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRQq6oaNJ8wbeLuwLMcDq4A2732wh5mf+reWSJzm60T9oRS2eSsgKxmz2lexjn3z0dYisG
X-Received: by 2002:a1c:24c2:: with SMTP id k185mr6070039wmk.115.1556885114282;
        Fri, 03 May 2019 05:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556885114; cv=none;
        d=google.com; s=arc-20160816;
        b=QFnscFvytOqtZp9Lt2wIaRjJ51j9zdamaZMQv8KnTQzx47hKNAukJ7I/o+ES2OtnxF
         5nbxQqQOowHL37TVA13rhj2T8ptEru/yyPdl/0b9odlqVcCr6Pfqgjxigvnyuz0uEqxs
         03RIx+Zh+gdOX+ZptMgMF0hp/QvtnMmIWPJQBpIgnUWwxG+Q0a0Sw9xfnFSJxCy0J4o8
         Kk7XID93OzOWeKURato+fot/lyIEMbdvKUKrpDrW3yzYx2g1XWoy5a4yoi5zL1cdWKhb
         elaSuiy7HAERJMJldHqLQFZOiez60lzLQ35W28/qQsaesY5xNzUQFskjGAnjZWSPz5P6
         5Dig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=KgE5+3YNQw+Av7owDtg70coEsHJSLxFudkITymP49U4=;
        b=LBmSZ+oZTM4+gIEOg6NCSsML3UFmxoloOnQcT7yi1x6GodWD5uT4Ynhq988iNG+ufB
         2NxSWZBNGv97mJ2itmrlcS5m5+dtT6FOMXkKy0WR2bMynjiDaOw4RxWR9LdKHt3Zy4y5
         NZGZl5uMpxUMvCxLpOOohbq9+EB1ZO2OocVBPmtoafSjMIoWYB58AppSNpcFBaaMKmoy
         3RhPhC68HDWC02qzp4G0PSR7NG1h5BfwyQjTyhY2K40Onvmq6zgUd+KHSDJgqTfTS3Il
         OdTW2yt5YC0KEitUl8lusx834JTjtczbK0ow112t0YbwnLj5wz+G2TDz+ptfIxScOKef
         ZQEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8G8mx0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si1193370wmb.31.2019.05.03.05.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 05:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8G8mx0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMWwD-0007kQ-BQ
	for alex.bennee@linaro.org; Fri, 03 May 2019 08:05:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMWvu-0007k9-NW
	for qemu-arm@nongnu.org; Fri, 03 May 2019 08:04:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMWvt-0008HK-KS
	for qemu-arm@nongnu.org; Fri, 03 May 2019 08:04:54 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46694)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMWvt-0008Dw-DZ
	for qemu-arm@nongnu.org; Fri, 03 May 2019 08:04:53 -0400
Received: by mail-wr1-x442.google.com with SMTP id r7so7521614wrr.13
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KgE5+3YNQw+Av7owDtg70coEsHJSLxFudkITymP49U4=;
	b=A8G8mx0x72XXxsjPicydk5sr/adnTum+HTsAtCJ+sPOI8yFf8Kap53KJkPClKPidby
	+c4U13MFGioGHtChEAHtHDpN4pAjFG3rArgUwBd58Shl739ARe0dCRT0zp/TEAYPucgS
	+Q674NpmFHPCpycK1MUprn3WGT9AjM5W9AF9C/4RhE+b7yiRh2QQZRZfoHfak3jR/qHc
	qh7KPojBNO+YLjxMLvdfaAv8InTNtLP6vq8kWBF39lB0DA6b/kHcdLcF2YcjIWuKKo9r
	6xLNVy6Npu+l0z57t7Qrav0ObC6A0skYtzSpRALgznFA58CArZF/enOV13QdWn2VN79K
	Nsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KgE5+3YNQw+Av7owDtg70coEsHJSLxFudkITymP49U4=;
	b=iMQijulJ2GrBjsvikw+pDPR0hvKhC9sBZQTM6wxqE559nHZ4FWRo88qPMskU2LD5Ps
	CA7TWUuRNngBL8Y6gDQy2cqeQ2tkh3xYH5d6JFitweIOxGKFmaFHfnar7WeFMh5tCm3o
	B93haS6YRWfBdD9ZngJ0laE5ChZMn+hh5EN70Wf/sq8OQEOblM82QxZu6/BbKqyHY/1G
	PljfiAUjIPwAwPotgPU2asyz6prigVElYM/ecqr1s74YXw8WH8q+9gU2Qu2dDYEKxwaR
	hJG/bXIm85FgjSMFE9bEqCZPEFtQr/gblBX51vOUES0jD9gXA818mFp3ICto9urzrtp1
	sUdw==
X-Gm-Message-State: APjAAAW4av3UDbeQiLZF2FMHnQXZdPXp4w4zKaRT9DqwfcsFjtFvSWOM
	N4JWqGv2wBzgGN1QTFmnNvtBVM0mjic=
X-Received: by 2002:adf:e989:: with SMTP id h9mr6342395wrm.157.1556885091774; 
	Fri, 03 May 2019 05:04:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm2116828wmg.46.2019.05.03.05.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 05:04:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 May 2019 13:04:48 +0100
Message-Id: <20190503120448.13385-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH v2] target/arm: Stop using variable length array
 in dc_zva
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0EmpceFhJ+BC

Currently the dc_zva helper function uses a variable length
array. In fact we know (as the comment above remarks) that
the length of this array is bounded because the architecture
limits the block size and QEMU limits the target page size.
Use a fixed array size and assert that we don't run off it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2:
 * use ARRAY_SIZE() instead of sizeof()
 * add a comment to make it a bit clearer that the
   expected size of hostaddr[] is only 2 entries
---
 target/arm/helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 81a92ab4911..10444d12b18 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "target/arm/idau.h"
 #include "trace.h"
 #include "cpu.h"
@@ -13099,14 +13100,17 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
          * We know that in fact for any v8 CPU the page size is at least 4K
          * and the block size must be 2K or less, but TARGET_PAGE_SIZE is only
          * 1K as an artefact of legacy v5 subpage support being present in the
-         * same QEMU executable.
+         * same QEMU executable. So in practice the hostaddr[] array has
+         * two entries, given the current setting of TARGET_PAGE_BITS_MIN.
          */
         int maxidx = DIV_ROUND_UP(blocklen, TARGET_PAGE_SIZE);
-        void *hostaddr[maxidx];
+        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];
         int try, i;
         unsigned mmu_idx = cpu_mmu_index(env, false);
         TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
 
+        assert(maxidx <= ARRAY_SIZE(hostaddr));
+
         for (try = 0; try < 2; try++) {
 
             for (i = 0; i < maxidx; i++) {
-- 
2.20.1

