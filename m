Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104422ejb;
        Thu, 8 Jun 2023 19:28:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Mk+iFPTjks+lGE41XpRxWD069q/LbxRY/INoQvxNv+MsoAfYUZeezNLn69a6ESnnV4qkS
X-Received: by 2002:a05:620a:4496:b0:75b:23a1:8316 with SMTP id x22-20020a05620a449600b0075b23a18316mr9598990qkp.17.1686277716134;
        Thu, 08 Jun 2023 19:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277716; cv=none;
        d=google.com; s=arc-20160816;
        b=zp8AIUyEE93RTuuQJXKMiXSYJbAtBnAm6+Ocd+GCMVd64g0ogVD60IWjy6HZGZkeyT
         oqu77WmQaAyXk16BGLih9A51cFhn367+3BpZCJxz3+VZWjnk+0VKTE0dF4jUetoEfsjL
         HiiaEicJc8N1roPxHnAF8oEWfa8BTA2FqXbQ+kHNtFdI1Nsc32uny9/mOr6nt38Tl/m+
         4KYB/xJMAye5gfqowQB90dYIMfIhlyBKSfy9jN3sNKqJThp5z5jkNoyv6SScc2uMRJ2Q
         ETw5Mp31L1yiSylrwjzKJTEzkNHbWzp1oX7ZWVF/tYoYyqvHjCQfPYgScf6nAxoIS2CA
         csaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FQOiC9SIpWhLDJC5dJWrza0HqQ3AfVmdAkI4Y5VxtuI=;
        b=Sf7wCyRlv/tYHIYOIjYHhEw4m+yyxlY6ceAj6fcptrrQuq0ZsP6syveEBR4kehMJCM
         dNmvExTFSrGi9oud7Oko8D+TGUQX3owjJyjlYk2uiukV2SQOVbd9qgmPoP1H6L1jm5y5
         heZtUdTQhXD+bcKmPAVdEsP+Ry3s4wyxCX4pAKQYTwye6Z5Wa53ugoXIJBQ5FGuQEBoz
         hbM4PXJVKOR556eojpsGFsckNH98mCuSmezNoCiPWAqskEhae1R6EhHm0+DheDWfWDud
         IvrggVBnrMIY5aBvChoGO42x516H6r4UecuG3wlvjl+FGwWv3Kh8ECRR0skOAJGqxLVp
         EEUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1skUYop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a05620a136500b0075ca6cc10e1si1623273qkl.60.2023.06.08.19.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1skUYop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Rnp-0002ob-Hv; Thu, 08 Jun 2023 22:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rne-0002dO-OI
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:28 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnS-0005ay-Tl
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:25 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-39a505b901dso231187b6e.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277452; x=1688869452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQOiC9SIpWhLDJC5dJWrza0HqQ3AfVmdAkI4Y5VxtuI=;
 b=T1skUYop3HfIG2z9MyhHxKr99PxVJk/3qBbP/JgPnZQ79XZ9YYdqIfHNJcvTIJbVNR
 ZurUxpx+AqrHLASVvkWmUxm69ypvaYi5Dm8qlfGd+YmST2Y+Qru5by6BT9nLOJhBVBGX
 nPFLj6TQkJtF3Fus21Zo+6xd7gaR5oIs+C87KlMFOBZPrThDRtBWuCCOL4G3uMLb1Hj/
 40NVbzf9wVwkgHUTzzeCuu0YQOtwZ3tEwWpEktBNQ70UZzkKYHQLPObvm1hMGdmxGbN2
 8Uyu+EI0CLFcFR82x5RojwYuCcfkLD5tTUJfzRiQFk8x2oCLNfLXsC+AkWt72D8ka3oy
 fs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277452; x=1688869452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQOiC9SIpWhLDJC5dJWrza0HqQ3AfVmdAkI4Y5VxtuI=;
 b=CAM67KCC3BxvvWr3Mi9awuVNdzionnwOVwCM1hrmKeJfSXcRFZwuqI2iyUFbmy2fzU
 KORKpYRPtv+ymv3bhoOxLG5zCwqccP83LK/Cu6xElR8uZ7iszw5xeS15iDyF8vG7aA18
 KCgQoOtgEVTr0pMPpqalnEs4vE60Tm1UjGmMkYuwANXr0F3E38oO2MyEWnSKlDhybWrJ
 ShyKs28qYa5WRnIlbNNR7GuP9qxBiJVTh2oILWwISgixAp0lKjNVsAi2ZS8NSEOvy+mk
 u163GGVVy7uCZ0QGD7iLc6gHvGgl8pEwZ2J2j3CSLfORpc2OPG3z2/3xnoECCQKFPsUN
 j+Dw==
X-Gm-Message-State: AC+VfDxUb4JeAQcij3LgaaAVNXn3+okyDQPmpXTN/pxMN1V/YusPi18o
 ZfYu/pa+P8Vwu8zi041QRhHFtw==
X-Received: by 2002:aca:2403:0:b0:398:36a0:d42 with SMTP id
 n3-20020aca2403000000b0039836a00d42mr277660oic.39.1686277452622; 
 Thu, 08 Jun 2023 19:24:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 10/38] target/ppc: Use aesenc_SB_SR_AK
Date: Thu,  8 Jun 2023 19:23:33 -0700
Message-Id: <20230609022401.684157-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ydjfjcbx63yF

This implements the VCIPHERLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d97a7f1f28..34257e9d76 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -25,6 +25,7 @@
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "fpu/softfloat.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
@@ -2947,13 +2948,7 @@ void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
-
-    VECTOR_FOR_INORDER_I(i, u8) {
-        result.VsrB(i) = b->VsrB(i) ^ (AES_sbox[a->VsrB(AES_shifts[i])]);
-    }
-    *r = result;
+    aesenc_SB_SR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
 }
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1

