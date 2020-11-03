Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4402030lfa;
        Mon, 2 Nov 2020 17:29:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxE7d1bZDIqLnVjDdj394u7k/75DSXy+9cdqC2GHZcSx5fQCr9nNUCGN7QUBowugU+2i6yk
X-Received: by 2002:a05:620a:1211:: with SMTP id u17mr17297332qkj.112.1604366976716;
        Mon, 02 Nov 2020 17:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604366976; cv=none;
        d=google.com; s=arc-20160816;
        b=Ip4V1Y7LtlhaI+4U63C1dQRp41ACK1XMkFXXqcbrj4twL4m9cRPIxqvEA95JAYSClt
         KjQz9x72NL6//asEEY3rM4BSrLD6iQa5GuOfZk6EMWSx4n1zF68Nysu05wgEGnfn1LGU
         mbBsAtSN94JZjj0y9Ar/9abf0HUuALNSgw0QjERmdyMrjDVoy5x9xoHo2Mc4G+z79MlF
         +85xNorumDvl7VoWceBX3lr/P4D5CTrPgfPU+RXIAXi0xWgBIASuBd106To0clggV5yx
         omezGMY/rgSt+SgZ+Jg/oaGQG5oIddQXF5pk1hVRUf1W815gNyFYuDJDMT7IiWXJVT2C
         XD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=wh8or+ljt8at2k22dVmhE1DVFpTtQWKhA+UBKQ4cAts=;
        b=V/6FclZdi16frrIuJq/RK4ztYHKN9kaHOc2pS9t+iwnSWs3mnceRJa6FHdkoDnRloG
         3yqeA0ySOLyzgN+QfbAoH1r2bQFt44+FhIvtqfkb9FzmxzHV6ljB7DA2xZrKK6DRAYaJ
         Gh1LiskfJ3Um+ABTg1IBaNb5aJ06kInY/eHbFitRdZ/DGKyVyx0TN8pdlNeujx5bBJKT
         VfLax36Lg/odGh7cFgQO5y5Nc8kzjVx2R9Nmrtq9oNKiKk5ohNGw/c7LdI5xR6c25hwZ
         Ej4C2gmEVFcCcPQCOpJTCDf9NKXXC/mi6/SdImSauWoAU0dH4oB79uduSxMo6WFHAzbz
         HnCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=nQVmqZ8X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si6379939qta.18.2020.11.02.17.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 17:29:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=nQVmqZ8X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZl8i-0001ob-7Z
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 20:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JK-gXwsKCAkq1trwwnvxnwpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--hskinnemoen.bounces.google.com>)
 id 1kZkuw-00086q-J9
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 20:15:22 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:36405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JK-gXwsKCAkq1trwwnvxnwpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--hskinnemoen.bounces.google.com>)
 id 1kZkus-0005oG-MQ
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 20:15:22 -0500
Received: by mail-pf1-x449.google.com with SMTP id a24so4204080pfo.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 17:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=wh8or+ljt8at2k22dVmhE1DVFpTtQWKhA+UBKQ4cAts=;
 b=nQVmqZ8XyFRGjHxkqAqM2KV9yUisj+53aAzuzVrF8WUSTM4tbMQWdHYNV7CgccJf4C
 y56exMQjJV7td45J3c0m25xxCNACAyNuirn3+b0lBh25r1qnQaTdrDwazWl0jLDEAkw5
 UlH0Nwvtu3uYMexVx5Y15FxdMG0NOoaRwCDoCKKzY5VyxNGxVP3ZM5WozGajzL3VwEr6
 XVLkZkhrCcpAb9H+ByZNE0D2hRYrkTp+UcU+f++EwrdgEvHiSQ5isJyZrcuRJ82V9uAQ
 L9FvdIFokbu6nbKHG6PPPgKX5KFRyDpiv8i9oVsI5RxyZG5KsSQeEFI9VOArEESd3imy
 odJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wh8or+ljt8at2k22dVmhE1DVFpTtQWKhA+UBKQ4cAts=;
 b=HDXFuxsHebH/5aHu8FuYziyIvwuOLW4p/6fBmukHJDeIPP362h5iby9ndmctptlb3E
 s/eEsC9H2hJr8tf8SCqoBrAyCGMF8OtmJDLOqAeGEahGbyYMUQaa7x/k0NdZux1fPvn6
 sIbhV3k4DfLgeEX+UyAYBVwW5DRDvG9Q18ckj+RS0H7NXjM7aW0BwQs9Hm8F8L2/j4uA
 PHOm/E96evSXMcAk9Zb9MalP1FurFbkLf2QKogrqXJ0ph/g3p5EeRZOQF+MN8Xx059N6
 XvUnBdqYOi1r9sek3qxF66PkvDEgJwl0VuCKr2Pmj04cXPQ+tbWhtomymxkflTnNI/LC
 y2tQ==
X-Gm-Message-State: AOAM532iD5XfE2j+IoLfBAHtAQQDK2ltft+bJZYDSspP6ATdM+lmr2yJ
 ccSW75bX5PXU69CnOzlDeth3qjBoZXy1WdgBfg==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:a62:7cd4:0:b029:152:b3e8:c59f with
 SMTP id x203-20020a627cd40000b0290152b3e8c59fmr23027135pfc.2.1604366116071;
 Mon, 02 Nov 2020 17:15:16 -0800 (PST)
Date: Mon,  2 Nov 2020 17:14:57 -0800
In-Reply-To: <20201103011457.2959989-1-hskinnemoen@google.com>
Message-Id: <20201103011457.2959989-4-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20201103011457.2959989-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH 3/3] tests/qtest/npcm7xx_rng-test: dump random data on failure
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3JK-gXwsKCAkq1trwwnvxnwpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: f9tvoLC0G/up

Dump the collected random data after a randomness test failure.

Note that you won't actually see this unless you add
g_test_set_nonfatal_assertions() back in.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 tests/qtest/npcm7xx_rng-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index d7e42cf062..09111d640c 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -20,6 +20,7 @@
 
 #include "libqtest-single.h"
 #include "qemu/bitops.h"
+#include "qemu-common.h"
 
 #define RNG_BASE_ADDR   0xf000b000
 
@@ -36,6 +37,13 @@
 /* Number of bits to collect for randomness tests. */
 #define TEST_INPUT_BITS  (128)
 
+static void dump_buf_if_failed(const uint8_t *buf, size_t size)
+{
+    if (g_test_failed()) {
+        qemu_hexdump(stderr, "", buf, size);
+    }
+}
+
 static void rng_writeb(unsigned int offset, uint8_t value)
 {
     writeb(RNG_BASE_ADDR + offset, value);
@@ -188,6 +196,7 @@ static void test_continuous_monobit(void)
     }
 
     g_assert_cmpfloat(calc_monobit_p(buf, sizeof(buf)), >, 0.01);
+    dump_buf_if_failed(buf, sizeof(buf));
 }
 
 /*
@@ -209,6 +218,7 @@ static void test_continuous_runs(void)
     }
 
     g_assert_cmpfloat(calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE), >, 0.01);
+    dump_buf_if_failed(buf.c, sizeof(buf));
 }
 
 /*
@@ -230,6 +240,7 @@ static void test_first_byte_monobit(void)
     }
 
     g_assert_cmpfloat(calc_monobit_p(buf, sizeof(buf)), >, 0.01);
+    dump_buf_if_failed(buf, sizeof(buf));
 }
 
 /*
@@ -254,6 +265,7 @@ static void test_first_byte_runs(void)
     }
 
     g_assert_cmpfloat(calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE), >, 0.01);
+    dump_buf_if_failed(buf.c, sizeof(buf));
 }
 
 int main(int argc, char **argv)
-- 
2.29.1.341.ge80a0c044ae-goog

