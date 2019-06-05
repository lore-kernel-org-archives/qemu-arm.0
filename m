Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3666075wrg;
        Wed, 5 Jun 2019 14:03:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyj2yJ7hjSjz03nkGwuU5pPwadRsI2aeWbzAgQeDkrdnRfSWhWeiM6/NfwldZAIgYHoocGd
X-Received: by 2002:ac8:28bc:: with SMTP id i57mr5717712qti.288.1559768637122;
        Wed, 05 Jun 2019 14:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559768637; cv=none;
        d=google.com; s=arc-20160816;
        b=KGKAOGTcVE4D9mYd9cYuszD7hASHAu+ynV9rJtlbffi3DVGxqD3GNv930JiDE9Dccs
         kRP77vkyi15G+8jOXhxF2NgQ7i849ueCdzT7ALsHjwW2jjXBEBPfO7eMI37npLQStlKS
         IjXGFBV3AWxbpo1IjZnpjBvL7gkRvqnAQipjy50unqENoZ0IP6FbnEv+3jcQ1gh5PIHI
         HtFT+1rqYvShyMiWc2cZ3bNtzmk1mlTAxAOq/2E6Tb9A+XDO6P7NOA9FpmLjqBNldp6J
         17ilBfaR8qJ87/Nxh5zVUXwTIPXwDk3UcAdQg6CZ4ZTC1OAsFJ5SE9Ba/c8Q2OsDMghP
         LRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=D6qDvZ2yUvasBaOhuVQfPLH+R2qFXowjyUNz4x5+OYc=;
        b=Vqpg2np8cZTd0e3azhy0d3ix3CibNQJCy93BntLUhzrZwSuUHqozDOpBTCNEKL97BE
         kNBJhlZL9kKSmuOk4wcFFo+48pRHFyv9jdZq0e1T/FH0X1A2l1d7wJeC3r9PygM02ei8
         Ug1rpOLl4x0hPNQOnjB4aG/akuUASp+RRfENiSCr97MA7e+ynuigL4NjPFpxGxlq5DNg
         tbVJ234R11jwL3UqYYMHxYQYZ7D5GDvUCw/C/yV0mOFOptADltf1l8dmFYpcU95iqlAY
         pEC48CxKN3D6smUFXjaRUJYD71eV8ujtiTl2CbxWO5FHc03gUpPaz0HGoSbBzZGfhrR2
         icHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="J8pG3bM/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 39si6207133qtv.194.2019.06.05.14.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 14:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="J8pG3bM/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYd4e-00031m-La
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 17:03:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcyL-0006KN-3J
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcyH-00008m-Ik
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:57:23 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYcyF-0008O5-Lg
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:57:19 -0400
Received: by mail-ot1-x343.google.com with SMTP id r21so2063880otq.6
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D6qDvZ2yUvasBaOhuVQfPLH+R2qFXowjyUNz4x5+OYc=;
	b=J8pG3bM/LjB0cDoDlSI5UGePw0K1tCSNuNaoyOjXBz8CrSjK5paG3fYBqJdIU9EjZT
	6I9JHV/67BUUsAVCVFl98PLGWRfYjn6WDXXPZ/gvFMnj3q2seoK9QlrAIr10B2c/SK5k
	fhLhKuLSX7URKzTIAtnEw1l4W7p+YNEH6WxnD9ZosvxIcVOHpJVzJFtwPd7NSi98brsJ
	29YPxB5Uyuvum2L+DAsJZaKkx6ezoz0kNfPUWZ21HyMFWsAGNc/GJEcqCFxKbxZj5RfE
	1BwcKaCDhKf+WCMlHcDcTBe1Z2jGk4lZi5R0JKc6e+xUZYEr9suK8S8QO1yEbeBF28g4
	mn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D6qDvZ2yUvasBaOhuVQfPLH+R2qFXowjyUNz4x5+OYc=;
	b=UZsWee8412HLjHPup9LQFrikuR7Tf2L4xIVHnkf8rDDCkDGBjM1rzj8/cX6NSOvKy0
	LBmkASCADG5Hw7gsWc9dnSJYqicDQ1MIv3vEXKnwimseSHE1sV4zsENFTDt/lT6lM94j
	wWQuPTFl2Tmy7ZvdZMt8Q5GyR1NX2IMeqcTuAVl3juEiRWSpChby7cNMRZZiily2KLkc
	GUznKYjxVH6wQ4VqpsvCkFjKP3jcEOfjw+5AAE9Wtc88o+/LpGVEJ0NSoD6HKZMhbJuw
	lmCK8EFCQKV0rFDqjHtuzOlShEC+BjCT3+lRVzkNhgAHsYb+JUJ3zRiz9wKnKcgamYgO
	tH3g==
X-Gm-Message-State: APjAAAW2Vrf5kdnWFGbbm6VXXz7JwN/NHpw9vPgma2VR4fJVNEyesO/e
	5+U2XAr9EZHWuvdN6dw7eWO+a9NWzWZ4qA==
X-Received: by 2002:a05:6830:1698:: with SMTP id
	k24mr6033344otr.323.1559768237896; 
	Wed, 05 Jun 2019 13:57:17 -0700 (PDT)
Received: from localhost.localdomain (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id f5sm7414155otl.51.2019.06.05.13.57.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 13:57:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 15:57:04 -0500
Message-Id: <20190605205706.569-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605205706.569-1-richard.henderson@linaro.org>
References: <20190605205706.569-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-devel] [PATCH v6 4/6] include/elf: Add defines related to
 notes for GNU systems
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JpaNEe38vEhU

This is a collection of related defines for notes, copied
from glibc's <elf.h>.  We're not going to use all of these
right away, but it seemed foolish to cherry-pick only the
ones we need now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index ea7708a4ea..6f3eada36f 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1650,6 +1650,54 @@ typedef struct elf64_shdr {
 #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registers */
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
 
+/* Defined note types for GNU systems.  */
+
+#define NT_GNU_ABI_TAG          1       /* ABI information */
+#define NT_GNU_HWCAP            2       /* Synthetic hwcap information */
+#define NT_GNU_BUILD_ID         3       /* Build ID */
+#define NT_GNU_GOLD_VERSION     4       /* Version of ld.gold */
+#define NT_GNU_PROPERTY_TYPE_0  5       /* Program property */
+
+/* Values used in GNU .note.gnu.property notes (NT_GNU_PROPERTY_TYPE_0).  */
+
+#define GNU_PROPERTY_STACK_SIZE                 1
+#define GNU_PROPERTY_NO_COPY_ON_PROTECTED       2
+
+#define GNU_PROPERTY_LOPROC                     0xc0000000
+#define GNU_PROPERTY_HIPROC                     0xdfffffff
+#define GNU_PROPERTY_LOUSER                     0xe0000000
+#define GNU_PROPERTY_HIUSER                     0xffffffff
+
+#define GNU_PROPERTY_X86_ISA_1_USED             0xc0000000
+#define GNU_PROPERTY_X86_ISA_1_NEEDED           0xc0000001
+
+#define GNU_PROPERTY_X86_ISA_1_486              (1U << 0)
+#define GNU_PROPERTY_X86_ISA_1_586              (1U << 1)
+#define GNU_PROPERTY_X86_ISA_1_686              (1U << 2)
+#define GNU_PROPERTY_X86_ISA_1_SSE              (1U << 3)
+#define GNU_PROPERTY_X86_ISA_1_SSE2             (1U << 4)
+#define GNU_PROPERTY_X86_ISA_1_SSE3             (1U << 5)
+#define GNU_PROPERTY_X86_ISA_1_SSSE3            (1U << 6)
+#define GNU_PROPERTY_X86_ISA_1_SSE4_1           (1U << 7)
+#define GNU_PROPERTY_X86_ISA_1_SSE4_2           (1U << 8)
+#define GNU_PROPERTY_X86_ISA_1_AVX              (1U << 9)
+#define GNU_PROPERTY_X86_ISA_1_AVX2             (1U << 10)
+#define GNU_PROPERTY_X86_ISA_1_AVX512F          (1U << 11)
+#define GNU_PROPERTY_X86_ISA_1_AVX512CD         (1U << 12)
+#define GNU_PROPERTY_X86_ISA_1_AVX512ER         (1U << 13)
+#define GNU_PROPERTY_X86_ISA_1_AVX512PF         (1U << 14)
+#define GNU_PROPERTY_X86_ISA_1_AVX512VL         (1U << 15)
+#define GNU_PROPERTY_X86_ISA_1_AVX512DQ         (1U << 16)
+#define GNU_PROPERTY_X86_ISA_1_AVX512BW         (1U << 17)
+
+#define GNU_PROPERTY_X86_FEATURE_1_AND          0xc0000002
+#define GNU_PROPERTY_X86_FEATURE_1_IBT          (1U << 0)
+#define GNU_PROPERTY_X86_FEATURE_1_SHSTK        (1U << 1)
+
+#define GNU_PROPERTY_AARCH64_FEATURE_1_AND      0xc0000000
+#define GNU_PROPERTY_AARCH64_FEATURE_1_BTI      (1u << 0)
+#define GNU_PROPERTY_AARCH64_FEATURE_1_PAC      (1u << 1)
+
 /*
  * Physical entry point into the kernel.
  *
-- 
2.17.1

