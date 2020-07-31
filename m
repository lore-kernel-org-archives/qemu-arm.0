Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3328286lfy;
        Fri, 31 Jul 2020 02:07:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZu0dPx9YFLZPqd1T7nKpKMzbGCOeb5Kflo3845cyV2HXZmT/LUw5GeYMl6cuuCB35pJVo
X-Received: by 2002:a25:9785:: with SMTP id i5mr4465356ybo.255.1596186456319;
        Fri, 31 Jul 2020 02:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596186456; cv=none;
        d=google.com; s=arc-20160816;
        b=uJM/SYdl5nM6keJ2+gy/98KjogeCXGTbTRAy9J0Pi9I1YJhK6RKiGmK5xj5WqW8mg4
         m/1jmBL663czA7J9cvOq8pcAmuN1exm4Qg3QEMc7RnY+bJzq1fLCR1iuBtTjLv/2TdrG
         wuzkeZnchETLtPjyir4lLSeq9iLy6+c4+5orimb/YiNkQjg9KsIu37HpNkCiyyEUBY3Q
         DUkwv2EC0HJwf6zwMZaSvmMw529l4HJBZp2NdVFXqacLWjcIY66o5Mc2gKFJbHE+ti1d
         0NIx6DfmIr+xWnE7fQE6YkvbrgcchTgCGoQlIxEjoWNbyd32Ae66bE2socU/WyLZtpnc
         UXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=IOkpUMfSoaQcaaZ0hjEPryOQrMLu9ZdQGnDtMCo8M+Q=;
        b=VvAi/I2GYwUr1OByJlVx0E0mSY9RToIwMcySGIuh0u37gzHJxNwPVrYGwrjMXDNOwj
         8JmrXfZId8A1rs1xloO54XD6vdMYCYyyMLW5NVnM8NK3UWGo0wAKAkY33AWE6lsKxDuI
         kg5GO+HvJIE6sq8mn8XPIHkY3qEvoKiosvaZBPdML9e/WqIl8hmxadCro+brBbV1crhL
         aEdbv+GfvyQEcdr9esvcLALRVQ43wMyYUnyx2H8hbGChIksOdNo6UFjGTgvi4oWlSa+z
         3Ffab8mRnnKWsyF9eDxISEls/nahS8KMidDZ8sRy0Ymn8KvavewWt5C7lEFkNXR698YB
         0yHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si6854908ybc.231.2020.07.31.02.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jul 2020 02:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1R0p-0001uw-NZ
	for alex.bennee@linaro.org; Fri, 31 Jul 2020 05:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k1R0h-0001ss-6f; Fri, 31 Jul 2020 05:07:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39976 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k1R0e-00013E-Qx; Fri, 31 Jul 2020 05:07:26 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx6MVC3yNfcvMCAA--.35S2;
 Fri, 31 Jul 2020 17:07:15 +0800 (CST)
From: Kaige Li <likaige@loongson.cn>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3] target/arm: Fix compile error in gcc 4.9.4.
Date: Fri, 31 Jul 2020 17:07:13 +0800
Message-Id: <1596186433-17364-1-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx6MVC3yNfcvMCAA--.35S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyUJr1kAr4fKr4DKFWUtwb_yoWkKFb_CF
 18Wa1kGry5XayIqw4xuw45tr48Krn7XrnF9a4DGa98Ga1kJw4rG3WkX3s7Zrn8Crs7tryr
 uF4ag34rW3ya9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbwAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr
 1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bekskUUUUU=
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 05:07:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uBbwVdruBG/K

Error log:

/home/LiKaige/qemu/target/arm/translate-a64.c: In function ‘disas_ldst’:
/home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: ‘fn’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
     fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
     ^
/home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: ‘fn’ was declared here
     AtomicThreeOpFn *fn;
                      ^
cc1: all warnings being treated as errors

Add an initiallization value NULL for fn to fix this.

Signed-off-by: Kaige Li <likaige@loongson.cn>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8c07649..c98dfb1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3315,7 +3315,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     bool r = extract32(insn, 22, 1);
     bool a = extract32(insn, 23, 1);
     TCGv_i64 tcg_rs, clean_addr;
-    AtomicThreeOpFn *fn;
+    AtomicThreeOpFn *fn = NULL;
 
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
         unallocated_encoding(s);
-- 
2.1.0

