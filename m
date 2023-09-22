Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1399079ejm;
        Fri, 22 Sep 2023 08:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx+Tnc1eyubwE7ii8zmWDVmbSU3lt/XM1TqSbREraAI54thHugR99Ic1SSZ9hAdf6tuDer
X-Received: by 2002:a05:6214:3f89:b0:656:46e1:2937 with SMTP id ow9-20020a0562143f8900b0065646e12937mr8931774qvb.40.1695396652747;
        Fri, 22 Sep 2023 08:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695396652; cv=none;
        d=google.com; s=arc-20160816;
        b=rS2A4Tx/GdZtvVBZfovqabBWWkQPZQSzYWZ6fp70MbNLEj2O7Xejn6RJ7yQQEWsjj5
         drQLKORQ9xV6VtY07lCQDRky9Yr2dJjdC58fOOY+oCU4T0k2H0fmSuMewg64pfy07jAn
         NqjN35Vpp37Z5v4OJnbga+fj7Y6Q6VRa7kjcQGXQP78XxLtjh0953JUGZOhR7XyJVOvy
         SI1HNg605MDN73/DEWojH7NOkB+q83/eTxRYZ10v0MT6864E6sGCRj75qUXzjbU7cdVj
         JL9C44y9mbe+rRe84Bi9I/z/bme7fxXjeKpL9XPdzyc9YC09Qe8gaSEOetzL4LqLXvJ/
         ky8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m9TrjKf7+kxYBayfyROE1MR4UI5QgzR2WS5tLK6UIm4=;
        fh=uVBMvYrx+X7m1lFjfWwA+UgXnF+hI4+JyNcPtFqOEwM=;
        b=EezvoD3l/OLhxuQRM8fn1MnljNPYNkTD0asa559AzZwKu1PVmhjwNtWisbhfPZETlr
         ZVsvbYCJwj31u5gowiZ95n4eW8HYToDd77BkKCw7FH9nij0xH0LUEM/vm6SGhk5d1WfW
         8xVxLEZXz3VgpmDxO6YWwuugaLa5psyFTzdrfJVDfEa45hMei2DsAHT7oJGgFyrGxVEh
         L9eIoMvw0mdHQltVt6wBR0xDqK5agpsBtmbucq07nSj8smRxe8+boWmCFgDxfK/QFqo3
         sMLO3F86ReOgxW9ZJBIbMQjsE+ldyRLH1Wg+uTx7woxL4wfbTEQS3IWoedlXcKHB9l7c
         9IkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gxdCQcAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a0c8d4e000000b006418b7e8ccesi2348096qvb.408.2023.09.22.08.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 08:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gxdCQcAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qji6b-0005SS-Mi; Fri, 22 Sep 2023 11:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6Q-0005Lr-KD
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:29:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6K-00007v-HK
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:29:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4053d53a1bfso9354235e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695396590; x=1696001390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9TrjKf7+kxYBayfyROE1MR4UI5QgzR2WS5tLK6UIm4=;
 b=gxdCQcAl26n6oLCkV8rJbrd/zKvz1ZPuKGHpnmyZ+4LL8Jc28cJ88byRm1DVO4aRuf
 fKrmYfRw+6LAXmTokbYccj4FfphiymMftWWTbSPiHGPmZbj9/2smtS7Y1lCbzGtF333x
 SiFn+Iz5iGA+bC1CgG3dvpsBUFG11bMWrI4QqRZW8XymNrsbIXCN1JmAZ5qMiap3EBjL
 huy6menTPryw7XBu2Gn1Ui2pHmKAMFrzfOiNz8QxtUUBafxBEeUV6cp4A+oNCx+J0ea2
 Fxxb45u9+utOYoVtPbEbR9z/3xHwkf9xDW8Y7kqetrraa8AaMoA74SlpWZVBpesFTDkq
 Cmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695396590; x=1696001390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9TrjKf7+kxYBayfyROE1MR4UI5QgzR2WS5tLK6UIm4=;
 b=kuKgIXO2E/htP3fZDUN+pza27SUbpkDnrAl3HTTcwXL6ZP/xZVQT3ZfF+ssnE+ViyX
 ZWyWCga7TTSU8katKxoZSSEsN0ug7eSFEh190Pfl1V473pX+MVO6tdKNkA0IGLlnwAEq
 +9xfimk+6sXW3KhaNiiEfnMGXtVnBwTiCEXTC4UWXbk8Trfvil4bQ8abHIVMOHKSZ5bI
 OyJy24RkaTuFB4gAJdYvPcjq7GcarbqzljVc1wIA4rduhLtr4FGdclG1p8W/h0PgQ3Gf
 KhWiIXVQK+gekeYKhR1GLHGKSGDJ3VvmsxzYFs8pOUkuTvYhEnGk+c2FQz68wDWDXEWX
 cL/g==
X-Gm-Message-State: AOJu0YwyH5wtgv3NaOyH2adqsMMh6hyzzQeuonCmECTsK5L9F2RIOQsQ
 2Z5xqXSN4/3UhP+b4eNrLQVG2a5rT+D2W56Hgr0=
X-Received: by 2002:a05:600c:205a:b0:402:e68f:888c with SMTP id
 p26-20020a05600c205a00b00402e68f888cmr7797897wmg.7.1695396590217; 
 Fri, 22 Sep 2023 08:29:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c171600b00405442edc69sm777137wmn.14.2023.09.22.08.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 08:29:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 4/4] hw/arm/smmuv3-internal.h: Don't use locals in statement
 macros
Date: Fri, 22 Sep 2023 16:29:44 +0100
Message-Id: <20230922152944.3583438-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922152944.3583438-1-peter.maydell@linaro.org>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HMJ6I9oz9/dj

The STE_CTXPTR() and STE_S2TTB() macros both extract two halves
of an address from fields in the STE and combine them into a
single value to return. The current code for this uses a GCC
statement expression. There are two problems with this:

(1) The type chosen for the variable in the statement expr
is 'unsigned long', which might not be 64 bits

(2) the name chosen for the variable causes -Wshadow warnings
because it's the same as a variable in use at the callsite:

In file included from ../../hw/arm/smmuv3.c:34:
../../hw/arm/smmuv3.c: In function ‘smmu_get_cd’:
../../hw/arm/smmuv3-internal.h:538:23: warning: declaration of ‘addr’ shadows a previous local [-Wshadow=compatible-local]
  538 |         unsigned long addr;                                     \
      |                       ^~~~
../../hw/arm/smmuv3.c:339:23: note: in expansion of macro ‘STE_CTXPTR’
  339 |     dma_addr_t addr = STE_CTXPTR(ste);
      |                       ^~~~~~~~~~
../../hw/arm/smmuv3.c:339:16: note: shadowed declaration is here
  339 |     dma_addr_t addr = STE_CTXPTR(ste);
      |                ^~~~

Sidestep both of these problems by just using a single
expression rather than a statement expr.

For CMD_ADDR, we got the type of the variable right but still
run into -Wshadow problems:

In file included from ../../hw/arm/smmuv3.c:34:
../../hw/arm/smmuv3.c: In function ‘smmuv3_range_inval’:
../../hw/arm/smmuv3-internal.h:334:22: warning: declaration of ‘addr’ shadows a previous local [-Wshadow=compatible-local]
  334 |             uint64_t addr = high << 32 | (low << 12);         \
      |                      ^~~~
../../hw/arm/smmuv3.c:1104:28: note: in expansion of macro ‘CMD_ADDR’
 1104 |     dma_addr_t end, addr = CMD_ADDR(cmd);
      |                            ^~~~~~~~
../../hw/arm/smmuv3.c:1104:21: note: shadowed declaration is here
 1104 |     dma_addr_t end, addr = CMD_ADDR(cmd);
      |                     ^~~~

so convert it too.

CD_TTB has neither problem, but it is the only other macro in
the file that uses this pattern, so we convert it also for
consistency's sake.

We use extract64() rather than extract32() to avoid having
to explicitly cast the result to uint64_t.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3-internal.h | 41 +++++++++++++---------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 6d1c1edab7b..648c2e37a27 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -328,12 +328,9 @@ enum { /* Command completion notification */
 #define CMD_TTL(x)          extract32((x)->word[2], 8 , 2)
 #define CMD_TG(x)           extract32((x)->word[2], 10, 2)
 #define CMD_STE_RANGE(x)    extract32((x)->word[2], 0 , 5)
-#define CMD_ADDR(x) ({                                        \
-            uint64_t high = (uint64_t)(x)->word[3];           \
-            uint64_t low = extract32((x)->word[2], 12, 20);    \
-            uint64_t addr = high << 32 | (low << 12);         \
-            addr;                                             \
-        })
+#define CMD_ADDR(x)                             \
+    (((uint64_t)((x)->word[3]) << 32) |         \
+     ((extract64((x)->word[2], 12, 20)) << 12))
 
 #define SMMU_FEATURE_2LVL_STE (1 << 0)
 
@@ -533,21 +530,13 @@ typedef struct CD {
 #define STE_S2S(x)         extract32((x)->word[5], 25, 1)
 #define STE_S2R(x)         extract32((x)->word[5], 26, 1)
 
-#define STE_CTXPTR(x)                                           \
-    ({                                                          \
-        unsigned long addr;                                     \
-        addr = (uint64_t)extract32((x)->word[1], 0, 16) << 32;  \
-        addr |= (uint64_t)((x)->word[0] & 0xffffffc0);          \
-        addr;                                                   \
-    })
+#define STE_CTXPTR(x)                                   \
+    ((extract64((x)->word[1], 0, 16) << 32) |           \
+     ((x)->word[0] & 0xffffffc0))
 
-#define STE_S2TTB(x)                                            \
-    ({                                                          \
-        unsigned long addr;                                     \
-        addr = (uint64_t)extract32((x)->word[7], 0, 16) << 32;  \
-        addr |= (uint64_t)((x)->word[6] & 0xfffffff0);          \
-        addr;                                                   \
-    })
+#define STE_S2TTB(x)                                    \
+    ((extract64((x)->word[7], 0, 16) << 32) |           \
+     ((x)->word[6] & 0xfffffff0))
 
 static inline int oas2bits(int oas_field)
 {
@@ -585,14 +574,10 @@ static inline int pa_range(STE *ste)
 
 #define CD_VALID(x)   extract32((x)->word[0], 31, 1)
 #define CD_ASID(x)    extract32((x)->word[1], 16, 16)
-#define CD_TTB(x, sel)                                      \
-    ({                                                      \
-        uint64_t hi, lo;                                    \
-        hi = extract32((x)->word[(sel) * 2 + 3], 0, 19);    \
-        hi <<= 32;                                          \
-        lo = (x)->word[(sel) * 2 + 2] & ~0xfULL;            \
-        hi | lo;                                            \
-    })
+#define CD_TTB(x, sel)                                          \
+    ((extract64((x)->word[(sel) * 2 + 3], 0, 19) << 32) |       \
+     ((x)->word[(sel) * 2 + 2] & ~0xfULL))
+
 #define CD_HAD(x, sel)   extract32((x)->word[(sel) * 2 + 2], 1, 1)
 
 #define CD_TSZ(x, sel)   extract32((x)->word[0], (16 * (sel)) + 0, 6)
-- 
2.34.1

