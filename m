Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1327502ejc;
        Sat, 7 Jan 2023 18:44:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuA3qh0V5jKf/R7Ig6FRmbgZVWGrg3NVVszOk9rO9al7JW22tYi0vh3Zqi4CUKZ6Ac17oGK
X-Received: by 2002:a05:622a:5c10:b0:3ab:7d29:2f96 with SMTP id gd16-20020a05622a5c1000b003ab7d292f96mr74908747qtb.40.1673145883902;
        Sat, 07 Jan 2023 18:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145883; cv=none;
        d=google.com; s=arc-20160816;
        b=iKNTnVyETRH5XkN9DlGHV7p9aQ75yd+TjQuDwblpYQsPKI40hT1DUD6ZID7OHaUnKx
         NpG3CsKP9Dkrj4lROW3rpkidqjuYm6waDvrj9IlGCRAxugPHNxtZraCoQ4WZNQIpaVD0
         TTMA4BRZllV/yytI0ryjwMp93HkPQVq27LfHO4Byp6s7bcfnFw/6X8GPD2UTUHbbmACx
         Dzh5Y7IuAdYNDuhOpCSCX4dik8kbOLn51RM4S3TJZ+i8JD+W5gnmV6Gu8+y0K7o88K0Y
         BivhOjqbBjvvI0aK302DDpqf+fhf4aco0J7Iird7E8O6L/OvQ7JT86sEacOt+ocrv+Qb
         bb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
        b=dsKKizDR5XRiZPjASli4qUnsXtttDyo2hG7scRhLylRJBrhG4qWobd6lkM47JV4u9O
         4VKFU+Srv9wM+agE1KTLkX3RCf0VgrT+ZVsfIYBidQLlFrK5NZ19njos1ljedCbYzaf7
         5wXAo5pJho/LUpbFmkYLw3ZzARUYA/SdQ7Nk8/FB10HZbQJJwE7zZKXt/DWvnHypO6ia
         zk5leNbDxKYs4+VXEXRNkAUiV8z4Eyw/aRvEsLkKnlVQ/G9EvTGWsJ4IslyZbM1YAGeI
         WfoIWKG45lrMX3ZzdFVl41sZpcVsVjBKrenjtOauwz5xhz5RddwI7HnMXaVvARECkLSt
         gRWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yz/Vv9hf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020a05620a245400b006fb7ad6bb8dsi3133804qkn.491.2023.01.07.18.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:44:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yz/Vv9hf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pELa0-0005hD-GA; Sat, 07 Jan 2023 21:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZy-0005by-8p
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:38:34 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZC-0004Wj-R3
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:38:34 -0500
Received: by mail-pj1-x102c.google.com with SMTP id dw9so3959965pjb.5
 for <qemu-arm@nongnu.org>; Sat, 07 Jan 2023 18:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=yz/Vv9hfx11fLSInlmwJJ1MiPWzE7D/6OdyIY8MRsTs5VPjdFjXiWqOie9g2r6ox8f
 xOqANbE5cvmgQPJkBPDFqa5M2lDwRmrPO5Ps35nPdBDp/2jfCaf6CekDebjqcusMcNtI
 e7wjIooMErSThlYi6DKx+5bT78BY7IWdlWjBAxF/xzojETPLYpH5Z/I+a8obKDiWp/ee
 bJzNJbVRYOKS6Q8NF8c1Y86wXQ9zdyEsto8R0ACvTaT20gzVGLqEhlTB+5Y/1jRRtwpr
 V35qfYdz/Kax42wBGbUZfcRkscrNi0Rw4aNaCmMirA+Hmopcpyj06pGB8fvY153nHJ0P
 tosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=GSw5XoRYOFdGgnAOWLzy/4gTXNjFRUpFXiKgT9At2lesP56HPbHcTLoeKPfm/iAhx0
 eV6x6ciD3oJY7VtT8mhQB3CJP+1yEz9UVVAp2u6TcSQa2iUTY/7Xi/7jOSY3COD37w3B
 w0HhstFlhdYsbg8M8gjF3gw5wGocOmcckZXqnrmmfLy4PW12BqN3RNB0uyr7sXzqVKFq
 zQUAjALoyt0uW1VfGoGwp6C9k9hQ2BSPQSC68pXeP7/nQGgNIjQ9VhJCPZU5xsuuVOQA
 uylB2ysvbpeTZGzVUuYscxaBsBY/940OcGdUK07gsXeZbVdCsNnoPkjvcM80wQmkBINm
 k0Rg==
X-Gm-Message-State: AFqh2koNgkJLftwzjGz7DvvwVzdC4VcfHDYjQw1wDAliREw91CXM8tEi
 Ry/i5d/1MjbOxDNI1h+jnjeVfQ==
X-Received: by 2002:a17:902:f791:b0:192:5ec4:6656 with SMTP id
 q17-20020a170902f79100b001925ec46656mr61538487pln.3.1673145466046; 
 Sat, 07 Jan 2023 18:37:46 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 23/36] tests/tcg/s390x: Add long-double.c
Date: Sat,  7 Jan 2023 18:37:06 -0800
Message-Id: <20230108023719.2466341-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: ypQTJBxN7eN1

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/long-double.c   | 24 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/long-double.c

diff --git a/tests/tcg/s390x/long-double.c b/tests/tcg/s390x/long-double.c
new file mode 100644
index 0000000000..757a6262fd
--- /dev/null
+++ b/tests/tcg/s390x/long-double.c
@@ -0,0 +1,24 @@
+/*
+ * Perform some basic arithmetic with long double, as a sanity check.
+ * With small integral numbers, we can cross-check with integers.
+ */
+
+#include <assert.h>
+
+int main()
+{
+    int i, j;
+
+    for (i = 1; i < 5; i++) {
+        for (j = 1; j < 5; j++) {
+            long double la = (long double)i + j;
+            long double lm = (long double)i * j;
+            long double ls = (long double)i - j;
+
+            assert(la == i + j);
+            assert(lm == i * j);
+            assert(ls == i - j);
+        }
+    }
+    return 0;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 79250f31dd..1d454270c0 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -26,6 +26,7 @@ TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
 TESTS+=clst
+TESTS+=long-double
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1

