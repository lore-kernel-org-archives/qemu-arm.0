Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp79242ejb;
        Wed, 15 Feb 2023 19:11:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9pAxa6Id7hLD4C62wTA0ICaLprB/qgf77zY8tnvyfIXTkqKq4+PhGyl4SHZ2MUVtytdD2O
X-Received: by 2002:a05:6214:dae:b0:56e:a6bb:47ae with SMTP id h14-20020a0562140dae00b0056ea6bb47aemr8960588qvh.12.1676517068177;
        Wed, 15 Feb 2023 19:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517068; cv=none;
        d=google.com; s=arc-20160816;
        b=dFxHXWSdBsNqHpm+gFWN470dzwDN14R65XNMrvCzrGQy6AgxLwliGRANTogx9iH8JI
         XA2BpBOmKKRz/KFLo0vapC3NYafVbPSxWFFf1QhBdYaGi4g8gCDmPyMxaP6qpqNmsYlA
         xyWUybcdGX9SkhF1NVpjAk2fVIutjwgIIyEUNno6sEIAngJuhQk15QV3qE3vscGiIXYA
         kPJNl/XctZz3Rxwnqkt73kMppiQIqsfk/zHjAuUjLrL+7EAK8dQtlj1lWYYPNeQcbfGV
         J/oy9dDKQLSSuwy9FxrKrPZyVQMOWswCro6u073BG4FGAtgHquYwoGZ3T8UNhAAOQLa2
         Ydww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0MajgK0PLGz4vagnIHWmbxLdve4d+jZ1hP+nPlzQtEs=;
        b=b8hWmq80OeV6/69hFETZoU/aQGcaAMUQn/YA3kgqplcPs0gMvLFketmgxmBlwmbcmS
         qPF/0JhQ0LeV16EkIX7gOoMG8m6tV4bOTyQihHNFpT98WErG7j2H0mZ/HXThk0aIdOLY
         JNikRo/LDUCnhdoK9Nt9vN9oPxF387hD6i1qOebeW4GdIfw5cRgj8Ydu3M4uwc3T/e6e
         kFfsgEFUvR2nJwnuZqRc/nTQRiOk9YNCT+/en+vIzzXXr300GqgG3yAEePB2Ox6Ll8ur
         11in0y8l7o7uZUiWZQ1fuP6Grr+35yXcRWtkNoTWBaDTtHIlcc5HBP7QCaAwiSXvf8y9
         5w5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ET5y+7oS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020a0c9a06000000b00531e6869535si135540qvd.167.2023.02.15.19.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:11:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ET5y+7oS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSUeJ-0007Wo-R7; Wed, 15 Feb 2023 22:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeF-0007Vd-QX
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:27 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeD-0000FN-Vb
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:27 -0500
Received: by mail-pf1-x435.google.com with SMTP id ct17so579720pfb.12
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 19:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MajgK0PLGz4vagnIHWmbxLdve4d+jZ1hP+nPlzQtEs=;
 b=ET5y+7oSOgKMsIvGXcy5ePPXva6bPq3m2wSLziv7LSfFCvO1agjLE79mpRrogHxOCD
 jxAWLNTXZx6O6u5n/cbF5tmz7EBtwu4J8oI4lwAuR3AWrdjgp3yCJv9vlQN5a7pQDH06
 7sr9DebKwuN8WbhDEi0lbvfnUKSYtx0haotMmoZbFLsuLa0Auwv0ejXFd6MR2bhdSLO5
 lgaUw1ekXPYKV4RFBhgusoRy2yk/1nS4RaLzWI2BIhTuNu1hOSbI7naZ4NN0DePlZlnq
 Ltzty+pn2QCJxLWt/n0s+zGcQyLhRMGruhRBp1kQ9RRM+VVShbgaU2F2X5ZkI21JnV9/
 7LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0MajgK0PLGz4vagnIHWmbxLdve4d+jZ1hP+nPlzQtEs=;
 b=AQAmSvq4Tw/XC9rUNZdMlMHRtht8O37IHI+oRzNKFNV1KAh++XfzEO+u4RLFzI8Kw2
 IVyssDWa1g7i7e9ZFFTdvsS//MmSIpUym/1MG2pEjkqA+VM52JdOj4eWSorblrade2pb
 eHGDVMvTAvDNy52wuaUyyhfwW3C+YO+t77bLzU70P2JNJZ28yCYmkiEl3YFa4ADwyYRa
 jzmYzFwihyBHbSfwUhoqslfv2VFzbl8CBCtg0h2ZanSpIb94T6B1+XK7QAZHJt93gjJm
 S6hQCW9RlL2N90zwVG1Fvxpp5zpFk/1P7AGqVQ2aTYw5xZEY82MnKKWSV65YAP4OhPqD
 QoFA==
X-Gm-Message-State: AO0yUKWM4EAfBwDqBjAQBmh+TiH2DpYDWZovdmgcKWAGwulL2wD886RW
 s+GqgrbZYmZXrZ6z5/7bK1eIPeyOUWD8a1cczC4=
X-Received: by 2002:aa7:9626:0:b0:5a8:c444:d3e5 with SMTP id
 r6-20020aa79626000000b005a8c444d3e5mr3639432pfg.4.1676516964414; 
 Wed, 15 Feb 2023 19:09:24 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 18/19] test/tcg/multiarch: Adjust sigbus.c
Date: Wed, 15 Feb 2023 17:08:53 -1000
Message-Id: <20230216030854.1212208-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: 6aGcz+Wa9T5V

With -cpu max and FEAT_LSE2, the __aarch64__ section will only raise
an alignment exception when the load crosses a 16-byte boundary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/sigbus.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/multiarch/sigbus.c b/tests/tcg/multiarch/sigbus.c
index 8134c5fd56..f47c7390e7 100644
--- a/tests/tcg/multiarch/sigbus.c
+++ b/tests/tcg/multiarch/sigbus.c
@@ -6,8 +6,13 @@
 #include <endian.h>
 
 
-unsigned long long x = 0x8877665544332211ull;
-void * volatile p = (void *)&x + 1;
+char x[32] __attribute__((aligned(16))) = {
+  0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+  0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10,
+  0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18,
+  0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20,
+};
+void * volatile p = (void *)&x + 15;
 
 void sigbus(int sig, siginfo_t *info, void *uc)
 {
@@ -60,9 +65,9 @@ int main()
      * We might as well validate the unaligned load worked.
      */
     if (BYTE_ORDER == LITTLE_ENDIAN) {
-        assert(tmp == 0x55443322);
+        assert(tmp == 0x13121110);
     } else {
-        assert(tmp == 0x77665544);
+        assert(tmp == 0x10111213);
     }
     return EXIT_SUCCESS;
 }
-- 
2.34.1

