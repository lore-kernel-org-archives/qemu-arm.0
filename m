Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp218223wme;
        Wed, 16 May 2018 15:54:53 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpwydv7pM80oNB33JZbGZ+62gR/UduoBFgcvEMMKoEK1r8gm1J00K0wbxax2NqGPBvsB5pW
X-Received: by 2002:a37:cc4:: with SMTP id 187-v6mr2833336qkm.279.1526511293544;
        Wed, 16 May 2018 15:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526511293; cv=none;
        d=google.com; s=arc-20160816;
        b=gaxKHpkWGADbMJS10PCKb0nO/jXqho95Kbxt0gRaVmDMzyadKrxAEzsJ9QvguQFaNl
         LQ9CO/lI9uWKNwhBjnK+cmqc77aLnl0vlz/jT4RkxC0gIfhuk+WbZet7C5ui4dbjWjLj
         74mJ2xeXOYGgZL5+hFqKlYffenbSbRa5MRJ6NvV8+jMyT/9ng3dQjiU7fN2ZArq1B/vi
         4fqL+OnVFDrEi7wbFpsUVZLMliUJ1yrXVs5S5Fh1I1Xh0fyMTF0D/97Lvz8sBjtN+Rk2
         hc2aLQwpyfD7UvdbLjTjoIscIaAm/P44RVPafJVAlIurw1GkTL445VdsN/gNQZBiRdjf
         6yXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dg1WBnCOa5f1mNYqPGqrKxWSClxIHHeHmUJedBN44r0=;
        b=JNEfuNCNzWx09IXjFV0Ip4uOuBWAFqMjy5MJKwPHzIXB+SG7tRO/GEAIFmAlLn2sZc
         R7mGOzeBqPXOHiG4dC+fK75xhMgruWQp9INU9R9ZHQU1CDuKjMaMFqnn+KIMBsLx9XlM
         qr4UWEvv9/Lf3rRG1MSqWLinm5g+xgsDfcKD6wL1WPKxOHuEaytCRvZ+PfYv+SGEG39D
         UNWI2KS5rZ/tHDz3fgMdO+7AVnQn7B4qOM+UiwmpobR1kzWb//5AU8DWcGtsVSeObSwt
         fnQ48q5Cm16A9Zz3wnIdXkdTr1M1vuL25KGwQiJWZBbGO8fyBCI7MUiwRXQH/vG2Ba/R
         XaCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZIvaRbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p19-v6si1066890qvm.42.2018.05.16.15.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZIvaRbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ5Jt-0002MX-3k
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:54:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wc-00082p-Fn
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wa-0007nh-0X
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:50 -0400
Received: from mail-pl0-x230.google.com ([2607:f8b0:400e:c01::230]:45802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wZ-0007nC-RO
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:47 -0400
Received: by mail-pl0-x230.google.com with SMTP id bi12-v6so1235912plb.12
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dg1WBnCOa5f1mNYqPGqrKxWSClxIHHeHmUJedBN44r0=;
	b=CZIvaRbguCkXUfaByVoEcmgsOJzzWsWv8dGNlEZ6bu/jbtICxcr6ywcwIGkHjvYGIr
	PCaj2hi8sGpTotOEMqMFa6A55cGIY1wY0rqcehLirfJdPm8llfJKJWwh7X43pXYdMwLP
	2iAIPTQO2QPOypKMXLg0sVw1dsyCNweLV685s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dg1WBnCOa5f1mNYqPGqrKxWSClxIHHeHmUJedBN44r0=;
	b=awdVO+P8gu/xDqiE8d6Q9JP1EciH5F0fY0kDFebOd3QnsjyOsIdFYjFKZXNSUn4Oer
	KDz/nskdrAhLdl0ysy0pbHcpEZ8eAu7b87NKWAA20G9ZZSTxxOaJV7vMzeLtfpx2hsyG
	12UyF6D6aMqqVUgVWF4JqLU4g1aB+2Dd9qND8dhRRfR8hxEt0q+F7J3TuGu1x/JAf6cp
	bhJBWIE8qgdZBVyHGxFnPJR4CiruEc6a3Bv2c0j99wuGsQblF1kipVnMr7oS5oArZRjd
	6uZ+O8Itz6oGd9vR/GXYfkiCjaQLXN89a9tteDpRBrR3cOkbI23yIwSYpTdfT35/Z8wp
	YJBg==
X-Gm-Message-State: ALKqPwdi5okgmF4YX+Gs6xZvlaXZ3lgLnWWMcfxt05Md2rpNwea3Ad9J
	xu57V6lL+MQpSBrYeV3N8V68dyAwxX0=
X-Received: by 2002:a17:902:c5:: with SMTP id
	a63-v6mr2702580pla.149.1526509846994; 
	Wed, 16 May 2018 15:30:46 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:30:06 -0700
Message-Id: <20180516223007.10256-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::230
Subject: [Qemu-arm] [PATCH v3-a 26/27] target/arm: Extend vec_reg_offset to
 larger sizes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0R6WYRkT8Ikf

Rearrange the arithmetic so that we are agnostic about the total size
of the vector and the size of the element.  This will allow us to index
up to the 32nd byte and with 16-byte elements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index dd9c09f89b..5a97ae2b59 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -67,18 +67,18 @@ static inline void assert_fp_access_checked(DisasContext *s)
 static inline int vec_reg_offset(DisasContext *s, int regno,
                                  int element, TCGMemOp size)
 {
-    int offs = 0;
+    int element_size = 1 << size;
+    int offs = element * element_size;
 #ifdef HOST_WORDS_BIGENDIAN
     /* This is complicated slightly because vfp.zregs[n].d[0] is
      * still the low half and vfp.zregs[n].d[1] the high half
      * of the 128 bit vector, even on big endian systems.
-     * Calculate the offset assuming a fully bigendian 128 bits,
-     * then XOR to account for the order of the two 64 bit halves.
+     * Calculate the offset assuming a fully little-endian 128 bits,
+     * then XOR to account for the order of the 64 bit units.
      */
-    offs += (16 - ((element + 1) * (1 << size)));
-    offs ^= 8;
-#else
-    offs += element * (1 << size);
+    if (element_size < 8) {
+        offs ^= 8 - element_size;
+    }
 #endif
     offs += offsetof(CPUARMState, vfp.zregs[regno]);
     assert_fp_access_checked(s);
-- 
2.17.0

