Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2488125lfy;
        Thu, 30 Jul 2020 04:58:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd8MX9QPPqgYEtiDa8Mc7HnHmDWTdS7W6Re2VkVwlRKoUc3/0/WzqBL6xv8AlDb00XxIvE
X-Received: by 2002:a25:ca50:: with SMTP id a77mr3919723ybg.286.1596110332748;
        Thu, 30 Jul 2020 04:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596110332; cv=none;
        d=google.com; s=arc-20160816;
        b=auxdtx77+rKPNqdR+53CmCM6hOJ7NAENbNS4+U1nbPLqG6NhbZ5RgPgqt/BH2XpWuS
         9GbUDl9DM3/bTG8Ys3zj2I4YC6hoV7gCNbC04XmAqoJerPkXLFXaEb1/5BTHLn5JPxNb
         OMJzUxJ4I9jSU0Qg+2R/dIDQSSdLdIGEEEdbHg/MFHKSowQNEkJi6d+MiDUCPmdXbjUs
         hIdCqNUG6Yr2YX1bDj6rU7vsarBZ5oqTlFEPQpOyD08008lQl07DTyDV2Q1yARquH9rU
         EXqSZLPctwS7SAMXgCkU0kitKUA6s2X/NuGm+sK+nYLS1eH0XJZQ+PEN2CF/SGL9jI+f
         5X1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=tzURmxJ5ustm7Ic/lQja28k3tc1yZBXJUcl2t22w49o=;
        b=o5H/0G3OMtVu7TPGHetD/YvnXUtoJWqUiCJMH/aguboj+zysSciobm2W1k3ar4+I4i
         SGyMYjuPtKSRWgeDpXArUyrw9VnazSlHdesNW75RuLCbrbh/IWBcNj4b/tyBX8SEKT/h
         uSFMWEIqF7YHJkRcr+eNRpFxp+CCGNWyvHAb8DZtSW2If5em5MsZR2F0de4CEQCXUYC8
         XEN5RnQ5T0t4CkD9BRtlr8kM5Vu7B9v2uDH8BKUpKyrJoK40zBSaJ3a9NbSxHcCauExb
         ROy1GVIEOQon2ChVSJpJdl/8Fl3GEyvM5gA2HYwfRbYGZTdWv2KnWpaZnNjH3kr/4GRY
         SpSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si4946795ybk.232.2020.07.30.04.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 04:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k17D2-0005NS-6n
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 07:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k17Bu-0004OL-2k; Thu, 30 Jul 2020 07:57:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45576 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k17Br-0001Xn-RV; Thu, 30 Jul 2020 07:57:41 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv96ptSJfp4YCAA--.157S3;
 Thu, 30 Jul 2020 19:57:29 +0800 (CST)
From: Kaige Li <likaige@loongson.cn>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/2] target/arm: Fix compile error.
Date: Thu, 30 Jul 2020 19:57:28 +0800
Message-Id: <1596110248-7366-2-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
References: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv96ptSJfp4YCAA--.157S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1UJFy8uFy3KFWUGr4kZwb_yoW8GrWDpF
 47Gr97Kr45XFZ5G34kCF4kXw1rG3yjkryjya9xtrs3XrsrKr18WrsrKr9IkF1jqF4jkw45
 WFWxZ398WrZ5ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4kMxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbahF3UUUUU==
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 07:18:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kaige Li <likaige@loongson.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pP00cDbn+VUc

When I compile qemu with such as:

git clone https://git.qemu.org/git/qemu.git
cd qemu
git submodule init
git submodule update --recursive
./configure
make

There is error log:

/home/LiKaige/qemu/target/arm/translate-a64.c: In function ‘disas_ldst’:
/home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: ‘fn’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
     fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
     ^
/home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: ‘fn’ was declared here
     AtomicThreeOpFn *fn;
                      ^
cc1: all warnings being treated as errors

So, add an initiallization value NULL for fn to fix this.

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

