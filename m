Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4728613lfa;
        Tue, 3 Nov 2020 03:49:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRBhN0NQboAkdFr6R2hWYtIq7meFauOmVYEld/acac716ovgeOvian6eZofOwng5bqf237
X-Received: by 2002:a92:c7d2:: with SMTP id g18mr13714374ilk.17.1604404163076;
        Tue, 03 Nov 2020 03:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604404163; cv=none;
        d=google.com; s=arc-20160816;
        b=ps38uCRkYdGoq5jIp+UpqgYGs3s623FlxIJbOKNljzR0d6uCO0lLD16BZwwietL55e
         Qx47biv29xsxqYvfLnbP0EjssobbZKd3MaBooprgGIl291rA43RQtsHwvqY7NLIeGkTZ
         Rr9QRyLBz1KHztNCh/Q5jHjJ40UAZ57iI6EYTjAnGC+lwsgzaeQ5qExbUtAcUbz7LEXS
         nwXJ7Nzxoi6Ntz8I04XCVcnoXVqGTy8ltgQoP0F2vjdDnO69EokZZXwPrqfyDDJq0SUt
         RMwUnwZHx/bsZxhWpG8+6GLqI0hfA/lOPrqrXttBjJINnoxQxnh2vq/fKYAOBQ4O1abI
         ZCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Ocz1A+1u9hRozolCTnsakwhQz3bGtbRb/UMHXt/DcLs=;
        b=rQ/xfvxORSTpUaskwPC2VXJIpIykS0odmjeOB10vc5Aadh/lQPoT4bUL34ptF3dJvc
         8+iarT/Y291CMX2dIfIiWS+O1q8xrIm8glf9UpBTQwqmcxEnThTIFKQgLoZMOL2hyfmQ
         OtoYQ3ah5gOS0x5f99ay0LClGGOTpflENTZoQPWabQ/x02hXN7mmNQjl0dcNzuOipkl4
         rj+CBIjdX5ZxxIVAqavuq8TNYpZ3kywomqc3EzoMNe1CTEJh/ub1KgH2N/D5Da42KYYn
         v0VEfo2JHj4UExkqlNaKoEC+d1SdP0JPQzXUFFZX7vMJcjvkj7lBC8RBeYg3E7v8NuBz
         FYmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si12566826ila.69.2020.11.03.03.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 03:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZuoU-0002HI-Bq
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 06:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kZumo-0000gq-Ri; Tue, 03 Nov 2020 06:47:38 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kZumm-0005XA-QL; Tue, 03 Nov 2020 06:47:38 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CQSh16GWgzhcss;
 Tue,  3 Nov 2020 19:47:29 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 3 Nov 2020
 19:47:19 +0800
From: Xinhao Zhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/3] target/arm: Don't use '#' flag of printf format
Date: Tue, 3 Nov 2020 19:45:28 +0800
Message-ID: <20201103114529.638233-2-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
In-Reply-To: <20201103114529.638233-1-zhangxinhao1@huawei.com>
References: <20201103114529.638233-1-zhangxinhao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 05:28:30
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X6AN5xkk0O19

Fix code style. Don't use '#' flag of printf format ('%#') in
format strings, use '0x' prefix instead

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 072754fa24..1867ec293f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12114,7 +12114,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
-                fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
+                fprintf(stderr, "%s: insn 0x%04x, fpop 0x%2x @ 0x%" PRIx64 "\n",
                         __func__, insn, fpopcode, s->pc_curr);
                 g_assert_not_reached();
             }
@@ -13121,7 +13121,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x7f: /* FSQRT (vector) */
         break;
     default:
-        fprintf(stderr, "%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
+        fprintf(stderr, "%s: insn 0x%04x fpop 0x%2x\n", __func__, insn, fpop);
         g_assert_not_reached();
     }
 
-- 
2.29.0-rc1

