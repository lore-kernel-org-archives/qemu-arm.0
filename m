Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6576698ejq;
        Mon, 15 May 2023 08:06:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5YqCjpoiT8lSBD97mg7qqOwP2oQjvOht0sBBz/YaCViQZ064L9akMG24eZqmcPXmdpoG+c
X-Received: by 2002:a7b:c381:0:b0:3f1:819d:d046 with SMTP id s1-20020a7bc381000000b003f1819dd046mr28140601wmj.5.1684163163272;
        Mon, 15 May 2023 08:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163163; cv=none;
        d=google.com; s=arc-20160816;
        b=YWeSnyH7MMKsuSz/lsGOy1n5OHILOBgVxh6cISlqiBmxYXHWXzNP5DuvCgqVcAmiux
         b260CJuxVxaC8V+p/9gsGW32w0Cp3ienzMR9RwOgqpONkCeY0Lmc/Hwbi2wJrX+na5vI
         GvSD5cz4vwP5XQmc1KyYfmwhyq9BGf95Sxb7aLLWs0D4Xp3+ILWjlP7kRiqr15kg8jMW
         QuIk0A1OjjDh8ZV6kpn/XcAquZv+Ux7yJoOKJaAOnIq5kghOlAmjCq3mHsGWrQC9T6O3
         MQJ6F0dCnPNirQnJCiSqCNwSeyMErnQiYdw0cEQHobLYN5RXDOOqOFj+/bDIOsm2oMRs
         raOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5+dVuSBLTF8ePfEeAWZlWoNLu6H+GdqE/W0YcabdOx4=;
        b=Jac+BLhznAmI6frEe3aN0XXYlB3LsGvMkQoPEMhl+WyHFNiZy+vALZnktc9mRdOymt
         2FRsdWL0X0V2VXnnXKYjz+tNO2o4Hx80ugzTHgYS1zASRvN6dKaa3vll+1Lj3T4WIzlA
         H541OzW+pdhs3qiv7T7PIsHXryqwtfOL4I6ES87sH//gEuzVLTzDYnm6lDxqc+3PiMGf
         l+FguqLucfTpRii4dCoXwBqoVMqcFdQbbNOrResG7/4+W83pA5mIvmzbXnSB/HADTowQ
         25tzLlglpUleSs+zqqEPbdvEPyGZIXqeZ+yKGf5vsdjAFxlAQ94gJTcCl8u28FB5BYoJ
         sbxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfKYLz8A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05600c4f4e00b003f5022bf4d5si3266201wmq.72.2023.05.15.08.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfKYLz8A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZJv-0005Di-9K; Mon, 15 May 2023 10:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHn-0007G4-8C
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-000512-8r
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ab032d9266so118753005ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161219; x=1686753219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+dVuSBLTF8ePfEeAWZlWoNLu6H+GdqE/W0YcabdOx4=;
 b=jfKYLz8AoLK9EiTKyy4pi6rR+Di0inNpR7KTxQM/A6bObNx4+aO2L6A7W8HEBOG7Yl
 BFtaNOzEGdfRE3pbYE/nOEIUnxmYM4LnoxCd7poihr9gfPBBumTvGHVEuoINSvMAbtS1
 ITJScN9xd/nfGh62eGb4YnjZaZZkJnMqlRPD+v9KLEnLU5GECnpYMNtLJSv+oLOTtm9O
 DKPXHwhOoIyWLv+WcoP+Q64o2fO7c/sDpxlus17T3Kk0ntom0Yqwr1j/5aQXY3oTwgul
 TBiG7pCDIwFdcpiECprM87rE2o/IEHmJaTE5I205BVuDz+w+7ipO29lgQwiLecBr3xki
 5wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161219; x=1686753219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+dVuSBLTF8ePfEeAWZlWoNLu6H+GdqE/W0YcabdOx4=;
 b=XfpCXp2+EapzZH9ZGxqWeXt3nlOiFMRpLKdn0pmr4fzs00M6ltyvZOl4e33xJrsmlM
 PkKDpG1CD74JBcSZsx3wvwIGeLVXqaWeLexccOugsoFCb16hqOJw4QO16e+xq8g/AUT2
 5RXoAMyqw49XRofbJgBnvaT+q9/nXG969fSQNLwYo+mdVAo4gG2tQ8+5jLYxprHIhsYf
 mv0Vg7R+lxERTr8LOKi7u02IhpefneF9JS3fTvTDmawElezinnKK5hoJfdVe0I0EtJml
 TItfbLmpsr0FykNi1o8nBkoISda+OynA7FEqX1vLTDsH71sVrjwuBfGgcv2aqGajsx5q
 MsJA==
X-Gm-Message-State: AC+VfDzdY082duilsrlm7tjI4+haIPxlBU8jeBHEmjOWrfGZKLmq/VBU
 rIttq3WWet46izgV5kNn9Typ1Az0Ob1NDfnZanA=
X-Received: by 2002:a17:902:d4c9:b0:1ac:637d:5888 with SMTP id
 o9-20020a170902d4c900b001ac637d5888mr35448064plg.43.1684161219063; 
 Mon, 15 May 2023 07:33:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 28/54] tcg/sparc64: Split out tcg_out_movi_s32
Date: Mon, 15 May 2023 07:32:47 -0700
Message-Id: <20230515143313.734053-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LrOgRfeEHxsu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e244209890..4375a06377 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -405,6 +405,13 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
+/* A 32-bit constant sign-extended to 64 bits.  */
+static void tcg_out_movi_s32(TCGContext *s, TCGReg ret, int32_t arg)
+{
+    tcg_out_sethi(s, ret, ~arg);
+    tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+}
+
 /* A 32-bit constant zero-extended to 64 bits.  */
 static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
 {
@@ -444,8 +451,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant sign-extended to 64-bits.  */
     if (arg == lo) {
-        tcg_out_sethi(s, ret, ~arg);
-        tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+        tcg_out_movi_s32(s, ret, arg);
         return;
     }
 
-- 
2.34.1

