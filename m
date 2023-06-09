Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104111ejb;
        Thu, 8 Jun 2023 19:27:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6QBRXpvHyjBtoXNWB+yQ2p45oEnYSDhjC/tCGACz1KSeFGEb9hh27vQZHzDh9DXJy0LqYI
X-Received: by 2002:a05:622a:386:b0:3f4:fa49:a33c with SMTP id j6-20020a05622a038600b003f4fa49a33cmr195933qtx.53.1686277640101;
        Thu, 08 Jun 2023 19:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277640; cv=none;
        d=google.com; s=arc-20160816;
        b=Oxn/dvDMq0CE8mMWxvBAJuM2320r5gye/t+QYq2mPPMLnpDlWJm9DnMG08YmCpYY0O
         6fnP/l11K3mCiGHa91LiMfqJbD/jdDLvqC4osmooat2wyXpZ1fBkmKkZyGAMbg0h//da
         B1oX11A57Y6l0ocx2FMGoucE7SUez4o94ab4EVzgZU1o0PMPRz2s4bxOCZ6t8QK6tlEi
         hTmRSC14Qf/aeV7ykGVyCcShLu0sTIrDwJZt61DD+xDu4mKJc4LswVkHD6WrY0WGquMW
         SOh4gvXwdS4+4xaWiqy7xGikYqE9YNj70OAJkJMmZ7AiV1tkyfbuP8eLJ8dWHRe0tvJZ
         ofBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qVOgPdpdn5OzaD8uC9gXnLe4O2qeMpIufQqKixCjiEQ=;
        b=eTEsKkTb2nM1DLC0fBt8l781QUdTH/Vob4gZZX7Sds/ekibMfMmu0JB0uwaFkUwMpM
         w+hqmEJ3b3ZiSw9TrTRYHpKo1xNhQj9GRqS5YeK8hoO3xR5BQ/g3nvHMwxISBRCNla1/
         ImNiQyekN/7sC7XlQ8HL4B8BgbCicn30bpHVLDNcuy/xM0c3rlD84vRH3o+2gZsRbWjO
         bfcHl57i8f/MGr8KVg3cWuOQVp7iQalNqWeNhqtMYeFOWheKjJvN8ZOJ042fKjBevIPr
         tKXNfj3TISNAERXBKJwXgZqYa4r/q+xBcld449sms5XDg6XTjkFy+ZQjZRCb4/f7rryy
         hERw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A7lSk/DZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020ac85e4e000000b003f7948226aasi1522309qtx.772.2023.06.08.19.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A7lSk/DZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7RnR-0002Vn-Gm; Thu, 08 Jun 2023 22:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnP-0002UH-QA
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnJ-0005Wz-Fl
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:11 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-652d1d3e040so1008388b3a.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277444; x=1688869444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVOgPdpdn5OzaD8uC9gXnLe4O2qeMpIufQqKixCjiEQ=;
 b=A7lSk/DZ+ucqn9riSY07zqG8Qc/clWgKKmtYD0seiIlp7TETwVJBVBpahoEMDJSGSp
 j8RZll2jOeiceCrGQjaAnKwZ6BP8c/j0YZYip9oLMwPCCCmxjg3t0XH8Po7tYbcGy1Fe
 AYKZWTIzFU3Zo7CQF+AGN+orsDr9BJ3ZB3int1PzD7Nda4Yr0oIS3+PRN+MOCA8ehiXc
 b3phXKufK4iWb5IzbDFZaZj2bE7PLRu+HRzGQ93xjeGwgDQNhtWoMpKpY9fdu8Npw7bg
 yWA5+igEME+DuTSnYHOqRMIQzUFrast+73QyaLtg1zZ3Yi5r0pG3L80+FOh0OSj6QKGd
 qNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277444; x=1688869444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVOgPdpdn5OzaD8uC9gXnLe4O2qeMpIufQqKixCjiEQ=;
 b=Z2zOW5fLcDDBbHfVMdoalV+DasQZV+ex5t2Xr3qxXt7WEwvzO0x3ca1//tQl+jzgA8
 PVzGSu0uYS59lT60hQk9DSSG2Jz8Q2DgUji/fmPJWR362Y9qpFbXgBKMhyhDxPTfG8kp
 WD/dQcUr8uexvYcXi87rlQqs3GojllirKuIBkwcgqbIxO4AWxl/XkBQ+Nr65vw+W8XIp
 sZYIJjIlwDbFok5p744wMOigRhrTqemC85gnlG5PLvALnQ+hIQUSEqd8B/+WUbCJP0mY
 tOfR/wtOFaOFB80X00loMTJOl+XQdNdaKZkh/uC+iomNidamulamrD++C8eWXd/Gi/yG
 kLkQ==
X-Gm-Message-State: AC+VfDyMbxCib4VWTm2o6AMFNBrpTUObn2RSuWTcD9E/FLb3Yl336idx
 T4BnLNKFIiBNdnQYGNk45iUoZw==
X-Received: by 2002:a05:6a00:1a0f:b0:65a:1efc:13ca with SMTP id
 g15-20020a056a001a0f00b0065a1efc13camr13812pfv.15.1686277444032; 
 Thu, 08 Jun 2023 19:24:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 01/38] tcg/ppc: Define _CALL_AIX for clang on ppc64(be)
Date: Thu,  8 Jun 2023 19:23:24 -0700
Message-Id: <20230609022401.684157-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LXdCm4IJYuy5

Restructure the ifdef ladder, separating 64-bit from 32-bit,
and ensure _CALL_AIX is set for ELF v1.  Fixes the build for
ppc64 big-endian host with clang.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 507fe6cda8..5c8378f8f6 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -29,15 +29,24 @@
 /*
  * Standardize on the _CALL_FOO symbols used by GCC:
  * Apple XCode does not define _CALL_DARWIN.
- * Clang defines _CALL_ELF (64-bit) but not _CALL_SYSV (32-bit).
+ * Clang defines _CALL_ELF (64-bit) but not _CALL_SYSV or _CALL_AIX.
  */
-#if !defined(_CALL_SYSV) && \
-    !defined(_CALL_DARWIN) && \
-    !defined(_CALL_AIX) && \
-    !defined(_CALL_ELF)
-# if defined(__APPLE__)
+#if TCG_TARGET_REG_BITS == 64
+# ifdef _CALL_AIX
+    /* ok */
+# elif defined(_CALL_ELF) && _CALL_ELF == 1
+#  define _CALL_AIX
+# elif defined(_CALL_ELF) && _CALL_ELF == 2
+    /* ok */
+# else
+#  error "Unknown ABI"
+# endif
+#else
+# if defined(_CALL_SYSV) || defined(_CALL_DARWIN)
+    /* ok */
+# elif defined(__APPLE__)
 #  define _CALL_DARWIN
-# elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
+# elif defined(__ELF__)
 #  define _CALL_SYSV
 # else
 #  error "Unknown ABI"
-- 
2.34.1

