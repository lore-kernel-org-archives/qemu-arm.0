Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2184164lfy;
        Wed, 29 Jul 2020 20:54:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxokrF8pImOMAMbiyfgSaNhB0IgEiuMnyC1JSrRKnv6pIpG+UX+JRLoV763hjA4R8HSXWXl
X-Received: by 2002:a25:e5c3:: with SMTP id c186mr1664909ybh.332.1596081283073;
        Wed, 29 Jul 2020 20:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596081283; cv=none;
        d=google.com; s=arc-20160816;
        b=HeC3VSmhth6g8Th1MlIUG7BCzVxweeomGZNx7LxHChAwEnToTcVz56MQVllsf/JJmo
         J4TRmv+GvhXVVSuVmPO79XPZC9WsBNr4UoHqpGqRiBET2wCMq0HAlbfvje87Y1oYDQTs
         fpdRshCRofWQ6LOe06VnYnmY20lGExPba8bFBUjadUP6916SZ/7DjsAvImce1ByZtK3O
         ewkIKUU2ZoCe/kGcWKZgd0QD/4i6ynPYm/xJScw7GsGGiCxkGfZ0gm8Ks10kcu1yIj7q
         tnHNNi6dsOiPrLRIek5tiHRJyhqg+SH1c0/sj3dCz+yW6g0cROFhsYh9m9H273Y4BIlA
         BKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4LGIwnujHhSFgJuSRFre4SpzKvWxOaefirJnY0vmDD4=;
        b=X5OL7I9w5BAGk2SNQR4QmeNZZdowQBPdDd327zhYu85AFGbQ1/8YcTL1P8zYC+74ng
         bjser0GWvG2rf0hDn1DyfMUrdddt2dxrU5jGYQj/0o2DX4obfSNKARcQZKWzu2J02Du2
         BIpD6q2vNUqZYzREka0qxteMnHrd5sW1XRAR9hNEoONmeR4g2Kac8yrRpKA9q3xponnJ
         Q/OPWYaKDbX3JUfu9HmyIK7iXWA6UxeCeaWUWihy4Wj4Zd0k/AWfwpMXr1OxHKHqJKkW
         ylOHTAYOQGuPptP84kN2/1qhd2OoMGOWl3Qhp+IWqFVse0Os/tmqsPIZhcBxw8QtsOSa
         BBEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si4538210ybn.229.2020.07.29.20.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 20:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0zeU-0003Dk-Fz
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 23:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k0xoH-0004fa-MG; Wed, 29 Jul 2020 21:56:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38548 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k0xoF-0005ky-E2; Wed, 29 Jul 2020 21:56:41 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmMTHKCJffFACAA--.233S3;
 Thu, 30 Jul 2020 09:56:27 +0800 (CST)
From: Kaige Li <likaige@loongson.cn>
To: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/2] target/arm: Fix compile error.
Date: Thu, 30 Jul 2020 09:56:22 +0800
Message-Id: <1596074182-4920-2-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
References: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxmMTHKCJffFACAA--.233S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1UJFy8uFy3KFWUGr4kZwb_yoW8GF4DpF
 4xGr9rKr45Xr95G34kCF4kXw1UG3yjkryjya9rtrs3XrsrKr10grsrKr9IkF4jqF4jkw45
 WFWxZ398WrZ5ZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUyKZAUUUUU=
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 21:56:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Jul 2020 23:53:45 -0400
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
X-TUID: h39wPv/Xs9kY

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

So, add an initiallization value for fn to fix this.

Signed-off-by: Kaige Li <likaige@loongson.cn>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8c07649..910a91f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3315,7 +3315,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     bool r = extract32(insn, 22, 1);
     bool a = extract32(insn, 23, 1);
     TCGv_i64 tcg_rs, clean_addr;
-    AtomicThreeOpFn *fn;
+    AtomicThreeOpFn *fn = tcg_gen_atomic_fetch_add_i64;
 
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
         unallocated_encoding(s);
-- 
2.1.0

