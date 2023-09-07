Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp434909ejb;
        Thu, 7 Sep 2023 09:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWqUSMdVczCcdQRqQ0KfHgf/AbnwQfPM+qT75ZFN5a3a4PzKF3oGKNe6A+OrcSP73cw+TM
X-Received: by 2002:a05:6358:590d:b0:135:4c43:f4df with SMTP id g13-20020a056358590d00b001354c43f4dfmr6044882rwf.3.1694102667408;
        Thu, 07 Sep 2023 09:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694102667; cv=none;
        d=google.com; s=arc-20160816;
        b=gp/q03xYdk4B5qpU61n843GVdyAhAhnXNVdIvlTxFUdewnFUBfNlEp7xv/4g/siX5h
         r5S4ortz0R+E5AxFj2HXjd8HAVx25O9h+/ilmQtVrugE7htVRC1GeCOJNSDMGHXplsQX
         bCnntxkJTxmPuH1TSytDKPzt4cGeNlXlR89lyPA1nmDycg1XkzHaOpQSV5tiHRDsX5W8
         K3X0Cwg+KApvn6N8qxJpZEwNgLGiaMwaXok8eQaQ5OaIOhem8UUb1eQu/BQGvpM9USm3
         tuB0rJJbBzr6UOUjOXrv7UdAIUl3lEoDbxk0f4a677OPZWKBoJ1AmJgeN/WATRl8q34K
         /jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VbgFxrI5Pu+ZzMN4ocrv32R/nWXAyOpPgKDHCPoXjBc=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=uCGnt/N/v+Ey/nL+4hfygEcfCJZc7jP1D9MUADHjHNfPuPx7wjLLK2l87s/VMkT6R3
         WFlZZQtPqR906jAVP4OapcSPZMiSyHad4mlJ9fkTIQ2zI5wLOP9MWSP/ZCGDMkuGWN0K
         S7nB8ylsBr1nvIMU9cFRrTAGy1wxLfS+LhEQgJDFbNmldIh+YjQzwf4F9JpITJWD3oWc
         t6pFeaTxbYbVILLrjpn5wCoBHTGzaJG4lABHp2wJKFFha5XvFxHHlnUk6/p+aNXto554
         YhbfHYKq34uaYSBWcazp9FphP6PYsVZZxbtf+RvkMCEts5u+hL6GxlGGkSoJMK3WdN5X
         3JYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P2gAF/H8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a67a605000000b0044d378d9164si1860494vse.217.2023.09.07.09.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 09:04:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P2gAF/H8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeHU3-0000tW-8I; Thu, 07 Sep 2023 12:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHU1-0000rz-JY
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeHTv-00020C-Jm
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 12:03:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313e742a787so729924f8f.1
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694102626; x=1694707426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VbgFxrI5Pu+ZzMN4ocrv32R/nWXAyOpPgKDHCPoXjBc=;
 b=P2gAF/H8wVmnjq3OwInBKs33uK/ARecc2OTLnNK7PFNK5zqZgzN86bWWDbY4UYQUVQ
 dKgfuY/wqN4j/tQlFd6FdHkmRzRHZYCzaHdDqLAs1fxCYb5a/mUkCE7X+K8Xyx+4shO7
 WfJECJqRk4CdZtd0BIh4c3rm5/RBeLwtHe+i1v/kxCGvtHYeDYrvVs545671q1eZqKUK
 EXyXis7ZJapOzw77nsomrGD7Hc9uPZR8vOZeQxqtDwSczIKJcDAu1FM6Q1qNW1Bpn5Vf
 cuo83R01+oe/JVUFKNN70OaYOtQV4+3Pqbkit/pAraZuqrjZO1K6bc0emWE+rLmavLYN
 FnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694102626; x=1694707426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VbgFxrI5Pu+ZzMN4ocrv32R/nWXAyOpPgKDHCPoXjBc=;
 b=ktDhX2ALcP3fXCfLT2BcJVB1+Zv34CD0D7Z08HI8WZwizZK8tCJ+Nw9a49obE7TWHQ
 YxeuZ8bC/0+nTneNpn8+gEYt39urPNB3ZbFQ0RQzh0G+vfDfk7vKXZ+qTkBHdSePzlv1
 tMIYwesMNOp0Faw/1BgH/lu5d2GK0puZD1iDi35k6EjSvzBDP8UP4IkakzV7BMniWmHA
 zLcXx2/ofWeSk0AMd3miVNkpShhduklCxx5Ro/8HS8D+M6lBf8cnlrDtHPl+2ktak2pQ
 4Z55sjvKRsNBdAiR/UGDCvV259KvrL5qcss3jAXO+wbV1qHFpgbU8v99sv6u0VMIWPUV
 1Sew==
X-Gm-Message-State: AOJu0YxKUlL7d88FyhhUI2l+U7XkMqQ6CzRrILTlMuoO5jjIJm097F84
 OEHza2fb61RW/BP6kxdMMui6Hi8MCwyo4ww/db0=
X-Received: by 2002:a05:6000:1808:b0:319:7537:b454 with SMTP id
 m8-20020a056000180800b003197537b454mr2263034wrh.28.1694102626087; 
 Thu, 07 Sep 2023 09:03:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfa401000000b0031980294e9fsm20256241wra.116.2023.09.07.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 09:03:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/14] target/arm: Define syndrome function for MOPS exceptions
Date: Thu,  7 Sep 2023 17:03:32 +0100
Message-Id: <20230907160340.260094-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907160340.260094-1-peter.maydell@linaro.org>
References: <20230907160340.260094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: 96u0xGq+AMwJ

The FEAT_MOPS memory operations can raise a Memory Copy or Memory Set
exception if a copy or set instruction is executed when the CPU
register state is not correct for that instruction. Define the
usual syn_* function that constructs the syndrome register value
for these exceptions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/syndrome.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 62254d0e518..e1b419358dd 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -57,6 +57,7 @@ enum arm_exception_class {
     EC_DATAABORT              = 0x24,
     EC_DATAABORT_SAME_EL      = 0x25,
     EC_SPALIGNMENT            = 0x26,
+    EC_MOP                    = 0x27,
     EC_AA32_FPTRAP            = 0x28,
     EC_AA64_FPTRAP            = 0x2c,
     EC_SERROR                 = 0x2f,
@@ -327,4 +328,15 @@ static inline uint32_t syn_serror(uint32_t extra)
     return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
 }
 
+static inline uint32_t syn_mop(bool is_set, bool is_setg, int options,
+                               bool epilogue, bool wrong_option, bool option_a,
+                               int destreg, int srcreg, int sizereg)
+{
+    return (EC_MOP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+        (is_set << 24) | (is_setg << 23) | (options << 19) |
+        (epilogue << 18) | (wrong_option << 17) | (option_a << 16) |
+        (destreg << 10) | (srcreg << 5) | sizereg;
+}
+
+
 #endif /* TARGET_ARM_SYNDROME_H */
-- 
2.34.1

