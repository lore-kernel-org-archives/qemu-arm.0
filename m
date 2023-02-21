Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3711408ejb;
        Tue, 21 Feb 2023 15:27:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+e7D8/7FzwtkNTfHMfB4Z3FyQixzlMZE1iWq1KADKQMXdcNrQ/QA87V65jnWRIv6K37Pkf
X-Received: by 2002:a05:6214:27eb:b0:56e:c1da:f68f with SMTP id jt11-20020a05621427eb00b0056ec1daf68fmr11824621qvb.26.1677022056828;
        Tue, 21 Feb 2023 15:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677022056; cv=none;
        d=google.com; s=arc-20160816;
        b=Z260oj/3DkpAlGiJydaKkvrpTzRFNA/eecaHUF1roQ+4y9IBhB5wEiSJfE7CrjrHVt
         smPtxrGiU+K/DKCMFxvL+vusEKF9ym8kX0e8S4t2VcltoeaThGVwGayvX7Re56/4qbMf
         ob/blvLCXr+vc9tYyHHBZuUC7LRCwLY698rC8kCISVbdsp/2G6YxIw+lGK+h3Tk1z5qR
         1lQgQNVPgobIhedx0Yck+yuF9+auGCbNaZCiWYpcNOA39eOJ2+UHhCng6QajTeYyFE+F
         miBThKrk9VSfrp5jInNWCTxTGrI+WHbO4HMhpxd4ww2zHsKUKTXANXC0yXa3g4mj0vic
         qoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CnNTwGg0MOHmmdkp5WuNV0U9bN887LNmRf50zWb625Q=;
        b=vLpApd0oq0QUnYvcLi5fIX8EggTmXvYSeDg7O4iE1yZSu9hogPBXZRk7reGGeLMkr0
         20NaWwgtA9xItOufV/sEEOS0ok9OGgCmF/HtI9jvKjJvf/c1zPkNBswq12EQW1raDxIL
         Fp+K4SiX2bJ+2JnHgSIrM00NM0IoeNA40XQ5uBVVgg8c/9EjxfeCqS1vdXTzg/cIRHkG
         D0IVLmRgL+X+TWuemX6yljwrg9/EQKul3SAZoYO+jDNS+eM53w7UvauahzzM7XD2Dkni
         DfuT38yIenZ862LxWElruRx4WmLnlXK4Dzis1IGGq/38obEes9B5jEAarGs0J2Nzskor
         YTdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFs26vK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26-20020a0c9e9a000000b0056f0669018bsi6603898qvd.35.2023.02.21.15.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:27:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFs26vK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUc11-0005Cr-N6; Tue, 21 Feb 2023 18:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0r-00058E-Vl
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:25:37 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc0o-0002Yy-Tr
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:25:33 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so5681406wrb.3
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 15:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnNTwGg0MOHmmdkp5WuNV0U9bN887LNmRf50zWb625Q=;
 b=eFs26vK4M22XELInBI1Ob4vSmuZr0/f7PbMlVb0mnYED47WCwhRVkt4YiYll3Rpp2d
 +ESy2XhVh2vQU8FJka3zULXRf7co5Rdx3hrFwQJJf+0jc29Rpwezhc/Bx8bR9K7rat1g
 gUxcLQTVN2h+GNGcWllaTp+jPu9qkQI1jjbPcN4xuXTy7IDTLfz0VSjN1sN51FIHDqFw
 frC0Q7JbbcA+FmFMSLTL/Eq3ARG+BMMerQXqQh1hXd6maPB+TAPNS7/t06zakYwRH3NP
 A7xqCBJ8QAa7z/zZHzEuMCgTHjkqmFhfqmWtSSSadDBxxcl8uFnHdwH0KMbcJBfJCUrl
 WkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnNTwGg0MOHmmdkp5WuNV0U9bN887LNmRf50zWb625Q=;
 b=zibUXSWJ75PAB2D/h9uRE91DzyPFgR7Db9qif9JSGg7aJUoavdIjL4x3E8Ywb/B6eC
 x8X4xTqmy9xfa3GznZ8Jhaz4qeG3/o+hh82VFCBOthKb1JZx42bXfgZIidfmzq5ok114
 SEtbrn9Y6tmKtjC5lQKWvmBv44xujGoY53lkKkV6diSp2y26YlE9FDI8DWoJA9PfKmLe
 yhyZSEnNgY+irUr5KaTKjyt0I9oAv5bTPnOoN65F0CaOyF3+YkgqaYHBlaERyQA8xXVH
 o6wRN73ciV/ZhiQuKXf0aKPat6QfrNEbW8VM0ORmVcRtiCfiwJj5wHBWr8fJzClha3CD
 W/Tg==
X-Gm-Message-State: AO0yUKVeJUZX8u6821k3Hd/dPBmsv5FjbU0g8JxdWiva9MTm84D9vDvL
 yWe+j3ofpNn5r6yCAXdxOd4FEw==
X-Received: by 2002:a5d:4d50:0:b0:2c6:e7ff:8f17 with SMTP id
 a16-20020a5d4d50000000b002c6e7ff8f17mr5207912wru.25.1677021928899; 
 Tue, 21 Feb 2023 15:25:28 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adff949000000b002c56a7872f4sm7044564wrr.82.2023.02.21.15.25.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Feb 2023 15:25:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 1/5] target/ppc: fix warning with clang-15
Date: Wed, 22 Feb 2023 00:25:16 +0100
Message-Id: <20230221232520.14480-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221232520.14480-1-philmd@linaro.org>
References: <20230221232520.14480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3ttRpd84t58A

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

When compiling for windows-arm64 using clang-15, it reports a sometimes
uninitialized variable. This seems to be a false positive, as a default
case guards switch expressions, preventing to return an uninitialized
value, but clang seems unhappy with assert(0) definition.

Change code to g_assert_not_reached() fix the warning.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230221153006.20300-5-pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/dfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index cc024316d5..5967ea07a9 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
         case 3: /* use FPSCR rounding mode */
             return;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     } else { /* r == 1 */
         switch (rmc & 3) {
@@ -138,7 +138,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
             rnd = DEC_ROUND_HALF_DOWN;
             break;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     }
     decContextSetRounding(&dfp->context, rnd);
-- 
2.38.1

