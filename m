Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3795996dye;
        Wed, 2 Jul 2025 06:05:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9hhSPwXzMZJ5bpk4XgMKqjGSbmdT+4UvqIAmf1yd4EN7C0z9D2871sMfSph+c8S6c2cpWtzWr9l6D3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHqFebG8zmQmqGx29eB7jG0hFyI4THAFPkawezcmerQgPU8DGATpfp6gHumHj7TuAWwTOjm
X-Received: by 2002:a05:6402:909:b0:604:e602:77a5 with SMTP id 4fb4d7f45d1cf-60e52d0457cmr2557769a12.15.1751461504707;
        Wed, 02 Jul 2025 06:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461504; cv=none;
        d=google.com; s=arc-20240605;
        b=cGTrMu9SQAXMHMkP28hiDBePe/zMEP3qwYvlTPIrAWh34dV/Sx0t4sF5UMDD6a4/we
         S81mKqz++3aqG3E43aQXxMYJVHypV5timyiF7ykEMRKyORSVVTIUSHprzkN4rlx99G7U
         P6+dxsiBFPcbcgMvQ0zSMC4lLZ7N1fNW90lwJabGQOfdDr90iYFfrAao9KzDy72dwyDK
         EDD5BMRttaZssfUvOUxkxj4lbqdSU5q2EKG6daN1JnYZ2d2TzOotH+JaOhs5xLrUp7t2
         y6e0auZifrvF7T87eULX+2f/8QQNrlzSEgNm6rjX8B+JBd+12hIrF+bXo94zfs+DU9Ki
         NuyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+pcEKhLD1jUxjhqTr1gUWbnGTIFkPwi63qGCrUKFPSI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=BB9MkSKXsEJnazdlBJek4BNNUiAD+dLCxOu+6Q632yLWTifL5RjLPBaBYPL0881Kv6
         p9y/AF/hOXG5kfdLTK79l5xZlwuwMCIiTNiPK2LhHkQD3BTynal/VWbX+6aGBHB0Zy4s
         piQfvyIAV+7Z/wA133EwFfX5GrvmqKsqVHvwJhALuSupkeBEh7k9hbtAGl3F+zXv0geO
         yHPflpQXrhVV2Rr0dnb/2/q1mzvjcj7D1glzns1h339/kijPwZsvRs7VmvmwqVs0muPn
         gXKrddxJ79F/G04EKF9S7/PNB3MmaYsZ7TO/WWGeCxY3nTYI/V4b+eE2US96ga5xhHOq
         kK+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHl1jUpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-60c8322ba42si9540428a12.455.2025.07.02.06.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHl1jUpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwxZ-0005JV-D7; Wed, 02 Jul 2025 08:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwnN-0000P1-Uv
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:38 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwn9-0003IJ-CF
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:37 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-73b1fbe64a6so778530a34.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751460139; x=1752064939; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pcEKhLD1jUxjhqTr1gUWbnGTIFkPwi63qGCrUKFPSI=;
 b=SHl1jUpczbfa54J/v3KlknItvUIGjdNKKoqOTM2uxQBYwtZQLILBQocLBk3NOHKJ0N
 d4gjiyRwkS4lcBDS3+O5uvUj+KQ0ay60G4T5VyyK8M3FTqblMItdUhoZmGbppjBlUcJH
 dcdJzK69tqVH7H/ORSxjF4kgYfYKMOladeduSn+djFt9yinS6CxJ0l8ig8yIXvQDGdIo
 q2UKA6bBDQxwtg6o5Bim3RUyuJU3srsj6aO8QjXCg6qONXFlbeCPsbZ+W4sBdBxcIcl1
 LW1IssQlbGLp2fUBq2HAQTtXljSacX1Q1BFExZ6Ff09LwxE7qXsMe94PA+aebOm1sl8H
 LzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460139; x=1752064939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pcEKhLD1jUxjhqTr1gUWbnGTIFkPwi63qGCrUKFPSI=;
 b=CV0e4B21LIRN81oNAYAkiY1XX2nBh5Xvs4263RjHRdrb8bSJWVDKqQC+ZBwMhGXS1j
 TpfkWOf1VBkQ3zcsnbdHjhIB9DNJ3UhBwz/+8IUzW5ZpLFO6BgBPABQ5ADB8phNZO+bg
 YXqh3SsF7Jl3VxS6IuEYnH6GXvp1yqDhbPWWSxd0C3k6s6tObMs1YNEUgOzpuy/W+yl3
 Wiyl93l1+hbwHVpGxTkKi/rdHf8NJkai2Kfk/sENy9nCg4vJYyJlCf8DzEkuYCf+r+1t
 MmElcd6/yVeeZVHMx9gMymRMYGEdNya6NQ6WfVoD8DQRnA9vm71IrLYvVq2ajRYwtsXc
 F4KQ==
X-Gm-Message-State: AOJu0YzzT8MfDo086v3LmnV7XGH/jCerBPTPdK1Qi4TI00gu6WzbvFgb
 ws0qrQLDEAeAfSbwns0GjV3xrxsj+1OQtUWnZIV2id8o7+3LnzFU9ZbiiVJNGCI4DYg=
X-Gm-Gg: ASbGncuthOaJhprf5CZDVY3xXFZ5CX3Q7FSlyG70Z2Iap9EE6vWtDsdu4s0VJ6/jdS0
 /7J049Zbk7bcFUCzuFlK0geQ0bI8ql3BYEoqQthJ0/nXoWzuOx6iYaUhw2pkQqtOh8NcG/LE2Zp
 48KlvebqqzGZGmiH2Q2M5ZJzGeFadT8wjLHZkfuOO8ZZ1n8AtiVA5iZGK+HQGNKoMwHdOwamCff
 6+bBEPwAmQc02YHsXRGo34OFD6tGigpG2pZ10ZfoeAHIPdPPt7x/wG1tTQWCX/NtooGwjHea+ih
 Os2QKXva/dV4Kml3J/xMW58T4+g9SDrS1Xmg1mZ5mPFF7y8PLXabv9+5pr7k0Xx55bkV7Q==
X-Received: by 2002:a05:6830:498c:b0:73a:70a9:d5aa with SMTP id
 46e09a7af769-73b4cc08d6dmr2186220a34.16.1751460139362; 
 Wed, 02 Jul 2025 05:42:19 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50f7d89sm3907004fac.34.2025.07.02.05.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:42:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 96/97] linux-user/aarch64: Set hwcap bits for SME2p1/SVE2p1
Date: Wed,  2 Jul 2025 06:34:09 -0600
Message-ID: <20250702123410.761208-97-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: VOMSTUJaXlUW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2add1665c7..ea214105ff 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -915,6 +915,14 @@ uint64_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
     GET_FEATURE_ID(aa64_hbc, ARM_HWCAP2_A64_HBC);
     GET_FEATURE_ID(aa64_mops, ARM_HWCAP2_A64_MOPS);
+    GET_FEATURE_ID(aa64_sve2p1, ARM_HWCAP2_A64_SVE2P1);
+    GET_FEATURE_ID(aa64_sme2, (ARM_HWCAP2_A64_SME2 |
+                               ARM_HWCAP2_A64_SME_I16I32 |
+                               ARM_HWCAP2_A64_SME_BI32I32));
+    GET_FEATURE_ID(aa64_sme2p1, ARM_HWCAP2_A64_SME2P1);
+    GET_FEATURE_ID(aa64_sme_b16b16, ARM_HWCAP2_A64_SME_B16B16);
+    GET_FEATURE_ID(aa64_sme_f16f16, ARM_HWCAP2_A64_SME_F16F16);
+    GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
 
     return hwcaps;
 }
-- 
2.43.0

