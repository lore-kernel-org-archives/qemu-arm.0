Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8336989wrv;
        Thu, 8 Aug 2019 13:27:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6+9Z7WWuaeiRkVX+s5xi5VF5NM1P8InrLSfSl7Wh9pvodDO5qJJG7SZWOSsNInZbMl+Cz
X-Received: by 2002:aa7:ca49:: with SMTP id j9mr18862535edt.148.1565296045245;
        Thu, 08 Aug 2019 13:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565296045; cv=none;
        d=google.com; s=arc-20160816;
        b=nRRtHiwwJH/3RzqCfnOrom9srmW+tQILV1urBzq1EfE2nMJQ0YFl+CwCJg36hZS+5B
         abxKJ+zR9WtMec6DSsUcF6JZSO4zk8l/Agd3KT3QUv6uuMlcJHLPF5PZs5bBrTze4ZSu
         vaM5V4fodRnSNrBpYc3mQXwX0A5Z9c1+QLhe3vHZXOAfV/cuUaJFpYwOO+CvQDJvSCu4
         qlN4JKrV7ReOonIb6U3vMPSXEG3+dkxZzEnEpOnoWN1xLCZk/rXJHORhuLrPyaha2Ozh
         pWLG3ObLXQ4+mHLQYDzdc0wyI03HYylMxfwXv2R0BHeCNQbOt/IdaEs2YpEx6ly/Q6cl
         DR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=RskjHA12b+UCLX2htP8k3zX7fIXUBDlXhLLJAVERdC0=;
        b=LWjV819wF7UoShtfbXtRVijpZdH3wAiLlZikfcpVwSx8Nf5mSbcR2GJm2cXdsFJ0Sy
         fq9AF5+nLW8rgXZS+rJjfudNgh/uBfZ0xIv8Ek0I9GeATW8zjHQwveseqIU2bTPSOkmk
         gSCoMlEd5ouICJOr8y7YqKFWnkixuyHPGmeULNunvMeaxPQBcL4184gnsbbr5010cyII
         d12KDJ5o1xD2rMaSg7M5CQUuFy3UjWko2gs5j4Vdj+4vLJdxbbsT1iXov67b4NK0RC/z
         wyQtD3fXRhaZ11cxq8hG6dUhFQOKYHMH2DGxIdxovRsNHXtCwrjsVWQ4eIFdwHVA2WuM
         hKTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AI5BNglK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z29si1821720edd.263.2019.08.08.13.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 13:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AI5BNglK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvp0O-0000Wr-Bo
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 16:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59877)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozT-00078q-Gv
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozS-0001Ju-KW
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:27 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvozS-0001JR-Dp
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:26 -0400
Received: by mail-pg1-x543.google.com with SMTP id d1so11820218pgp.4
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RskjHA12b+UCLX2htP8k3zX7fIXUBDlXhLLJAVERdC0=;
 b=AI5BNglKzJ2nl0bwk9cg0D/RBrxrCsZPjYtJwwhMbI6xLE29xO9oKjooujma6sBJDH
 x2TUbnqhBThgU9jAt4HatoRJLmXHeXgo5yIkfDaPdIm1Vsq7X7zMIunrC2IIgbBR93Fr
 wOilkONR8MFHcXpVSAGnr4kaG2RBJbv+DQMQeh79a66RbhJZG5UrT0LX//EMqTqlXAwD
 fbkfNYZd8LKN5OlCz1UJzA8gX+uF0PyEG06FvnJJRaLm25VVk73Y70SR0bYd6LjBTr2k
 nu9JHSO92ppTRl3J5IT74hgWQR1bcMKiX5V+FP/7jwhtSD3BEsAZ3i9l7uQa8KL1FQ8B
 SKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RskjHA12b+UCLX2htP8k3zX7fIXUBDlXhLLJAVERdC0=;
 b=GvrjGOMiwmXHfs+6dHXhZjJGT0er3Dw1vzLYR/hVGffPfOf0jqNMjWoNMbvU/OHunI
 clDnmD8ULjylD7BbmuKCl0AEbxjllx34JusHG8iIsqsh998vilVjV1Bm1kclCcM3ExBK
 lbAN3prS3T1SoXjopHr+S22GTqTlV4kpu+1IxOL8VwoBCDpcREbKqX7zDkdzaqOgi/8b
 de3qFZRnht+2XFV1PiAUoT0BYlItmacQWrLY/DDwAqoqS8YeFgf2OD5ruOkkWMkT57GO
 SqjFubg/5scBmBS3zZ1OYg+DQpbljSJOeoBueyH+1l+HseLGdPp+8aLMFFtXrWON+Wy3
 4Vpw==
X-Gm-Message-State: APjAAAV6/bXTzeE6S7SHjYaoauf5eSTLjZP342i5T6edmUx8WK99HNi5
 xsGLDHQ/IaDYZ925PYjRWmY93GXUTQA=
X-Received: by 2002:a17:90a:9bc5:: with SMTP id
 b5mr5853080pjw.109.1565295985125; 
 Thu, 08 Aug 2019 13:26:25 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v12sm2850146pjk.13.2019.08.08.13.26.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 13:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 13:26:14 -0700
Message-Id: <20190808202616.13782-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808202616.13782-1-richard.henderson@linaro.org>
References: <20190808202616.13782-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH 5/7] target/arm: Use tcg_gen_rotri_i32 for
 gen_swap_half
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EhywMK6chPvJ

Rotate is the more compact and obvious way to swap 16-bit
elements of a 32-bit word.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b40f163bab..ddc54e77e4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -459,11 +459,7 @@ static TCGv_i64 gen_muls_i64_i32(TCGv_i32 a, TCGv_i32 b)
 /* Swap low and high halfwords.  */
 static void gen_swap_half(TCGv_i32 var)
 {
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    tcg_gen_shri_i32(tmp, var, 16);
-    tcg_gen_shli_i32(var, var, 16);
-    tcg_gen_or_i32(var, var, tmp);
-    tcg_temp_free_i32(tmp);
+    tcg_gen_rotri_i32(var, var, 16);
 }
 
 /* Dual 16-bit add.  Result placed in t0 and t1 is marked as dead.
-- 
2.17.1

