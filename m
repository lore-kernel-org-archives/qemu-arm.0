Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp395886ejs;
        Wed, 16 Aug 2023 07:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXSmxIHFGpsoB8sGnZ+KJCT+zcFT0D3rLOCWjush8njz96bY4Zq3nhd2KJSDUFtpLvWJ4V
X-Received: by 2002:a05:6358:c11:b0:13a:18c0:77ec with SMTP id f17-20020a0563580c1100b0013a18c077ecmr3070130rwj.3.1692195947970;
        Wed, 16 Aug 2023 07:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692195947; cv=none;
        d=google.com; s=arc-20160816;
        b=hhQkKqV0AlQBgaziYHIIftWXnhD8U82cLfn7e2Ja+3OmqBkprKMGrBIb+6A7OPkwtQ
         CZKQ4Hxau4DAQAh0VA6HfLlSWxEFVNlIL1Zz+dIJVsVF6qZkVGi8yIl4GMyQJudxZEXF
         JgC7QQpKfeM5KfIvf/NDEvM1o0+BuBU2CtKuiDrBtIoxF2zFEJkBbAA8xh0tM/zwDaDx
         kBTz0kQMrUASBw7V7nzmU5Wn11kPhLLxL5DntfeVQSeSeo7h2gXrBcfCbBx19J/bNcNG
         76+U7ERIoLavLG/pngNlScbUSt6tmnwZ7bOGKyF1MBcQjd+1VpXwhj3757uhGw9YxzD8
         h8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2WfUiBV4R48StsRGeWaef0j9aTh/ONctxiuXo83IRGs=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=ifpA1dZEsA74AReQ7km3t8gzwdiPGdc/+IJBikAP/AHIVeQS1kYGpe1hgfhDir7/oc
         VzAZ1ZEY9iVttiKB6KZ+qZ6SPEJ6ueLwco7A5G0X1VWm4znbZRGnUloc85TsusW/ZbhJ
         /+l6CEIyTHqsVQ7kff2QqjCm/GhOjN3XQSlR9Y/vE7uED2QIH/W7DQwh6IvS9nMrPz4K
         H7l3i6y71glqqMCIJemzKzU3kdKq1Y3sUQG6RHiKviyJbI87VxHK+C1R3rkiL6raEpT6
         s7E6KEkAPsdunqRe8/3cDtOrajoMkgDtuqJW/JhBvK7CBuviphA3+2LoF2jVxtYOUr8S
         vuWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=er27MzP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020ac85ac3000000b0040cb20e8fd2si8744135qtd.73.2023.08.16.07.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Aug 2023 07:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=er27MzP+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qWHSf-0003wr-Fi; Wed, 16 Aug 2023 10:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSd-0003uO-Ko
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:23 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSb-0003k7-93
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6887ccba675so570021b3a.3
 for <qemu-arm@nongnu.org>; Wed, 16 Aug 2023 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692195920; x=1692800720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WfUiBV4R48StsRGeWaef0j9aTh/ONctxiuXo83IRGs=;
 b=er27MzP+gSmorkX/8Xc1MNooYKFHycdKoxgHrnnJF93qmqML5QCzqsT7SceFsZFKfS
 oxcQVeiCiUqX9ElvbhaZIT9ek6KorYpZR3nR6Gu0WdsSRpQY0XTIVTUfCXd/9iUYb9/w
 pRKqt2JiKNyE59Udx2iX4FKaBKMtbWXEazkts+pAREml7sIf7J2qGrJPnuwqzakh2KFi
 Kbh2doJIItF4RxAtbcjXvIplFryYOPg70l8bDpNniCmAnAWLNWzGF3LEb/PogAnSAmwG
 mW55LJ8kjUmthwNTXWx3O2J4tejT5lgCRV9mPvwCBRVpbMR5IhEhCMOOB2lzXEVjUX6g
 CO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692195920; x=1692800720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WfUiBV4R48StsRGeWaef0j9aTh/ONctxiuXo83IRGs=;
 b=S06iuU+EjfHQIAthErd7+Fa57kQxPV+MkmizKUIS/Y1F/grLbgVqRWCJb3TPZiAr5a
 AwpAYkUZbZY5xfdjwcvngZOtBTCC3Eik5nor7WHJ6RWriP63d5TJf6+C75A0uN3U3zAh
 PhldWfec7pKvPOAYaKd0VqaHTSQmT96KDqOdiDjZUL8E2ai33RkFzV56u1iad9gEYp49
 rN1RYUaBxqP1+S0ml/wrE5torcIf7y5Xh0dOV+X6sXp5wRTJLKDjUwe/7Ozz63JOhTmA
 UxDJeAPq+czRXsjdKzgRtNjxKZEvkaoezRtzbupT17sUsd6LbJzWm2f1NaII+qXsymi4
 AmlQ==
X-Gm-Message-State: AOJu0YwmK2ZLXON491n1YF3bfmUAxvTGvzJNNCZhDZRV2AetCg2uqMhE
 rkCL01T30dU5qL3fEkUHLQi/IQ==
X-Received: by 2002:a05:6a00:2444:b0:687:3f06:5939 with SMTP id
 d4-20020a056a00244400b006873f065939mr1818513pfj.32.1692195919804; 
 Wed, 16 Aug 2023 07:25:19 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:a064:e3f9:a812:973b])
 by smtp.gmail.com with ESMTPSA id
 i12-20020aa78b4c000000b00678cb337353sm11156019pfd.208.2023.08.16.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:25:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/4] util/cpuinfo-aarch64: Add CPUINFO_BTI
Date: Wed, 16 Aug 2023 07:25:14 -0700
Message-Id: <20230816142516.469743-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816142516.469743-1-richard.henderson@linaro.org>
References: <20230816142516.469743-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: rlwmfzHD+nYE

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/aarch64/host/cpuinfo.h | 1 +
 util/cpuinfo-aarch64.c              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
index 769626b098..a59c8418d2 100644
--- a/host/include/aarch64/host/cpuinfo.h
+++ b/host/include/aarch64/host/cpuinfo.h
@@ -10,6 +10,7 @@
 #define CPUINFO_LSE             (1u << 1)
 #define CPUINFO_LSE2            (1u << 2)
 #define CPUINFO_AES             (1u << 3)
+#define CPUINFO_BTI             (1u << 4)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
index ababc39550..97f5548a95 100644
--- a/util/cpuinfo-aarch64.c
+++ b/util/cpuinfo-aarch64.c
@@ -57,11 +57,15 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
     info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
     info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
     info |= (hwcap & HWCAP_AES ? CPUINFO_AES: 0);
+
+    unsigned long hwcap2 = qemu_getauxval(AT_HWCAP2);
+    info |= (hwcap2 & HWCAP2_BTI ? CPUINFO_BTI : 0);
 #endif
 #ifdef CONFIG_DARWIN
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE2") * CPUINFO_LSE2;
     info |= sysctl_for_bool("hw.optional.arm.FEAT_AES") * CPUINFO_AES;
+    info |= sysctl_for_bool("hw.optional.arm.FEAT_BTI") * CPUINFO_BTI;
 #endif
 
     cpuinfo = info;
-- 
2.34.1

