Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1785292njb;
        Thu, 6 Feb 2025 12:10:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX75/awn59USVLa2Pzals3g6kBNsuO8fgiUxpP0fepVsK4n7BxfU4SN0vwz/scC3M74dhH6dTND6PIDoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFKM4iH1M1rZvwBnUnoufJo+kA/RWSW3QWkDp+6fUqIPr9WsEJg4qt1vlK0S0UaBRQTuotD
X-Received: by 2002:a05:6102:4414:b0:4b2:5d3e:7554 with SMTP id ada2fe7eead31-4ba85f4a8d8mr551485137.23.1738872599838;
        Thu, 06 Feb 2025 12:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872599; cv=none;
        d=google.com; s=arc-20240605;
        b=QZCEqiVZkoTeGxxhtta8xPQHUn66DnwkinE8BWj48qSaldL/Lz4dVG2J+vC91z5Da1
         O727ML5xYAsRRnCdUvRyS94BVSSD9eJks837teRaqzgUJLvDKVi/NN3WYA1qeybZ1flI
         PUOXNaTiOHJ9lKUQrWqZlAwIy6auGh26Tt3kEcAAxVHv1mDHjSiE3odrJdTXCa+LbZKX
         R3mJFjU6s4NqzlywQCg59AFYCknOoP7U9iAfuqr5ZVZ1kbQq8psLe2aqg+JJ1XWgFoKB
         Yc/QUPhNcTSodsS96ECw9tXPK1BkaJKActpeBeDfC4JuE/zhNGfeCBATPoOr1v8hfbhw
         gK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pFaoy44FDyHM6oS2Rh4MY30zSGm4TJHCV7byOMX8lW8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=bq3nXgcMoLyKUCcyvdKLZQjKw4NRQZE8fYP7/7TqP5KQZ0iNoSW1rADqu7+sDvXxqs
         YenwhHiTvIfXKVPHjc3G2JWxjPfELq5iMuLPZV6ApLBYzJ3l9K1J5yLisnfABVg5d3gy
         +1ajrptFhVUb57risMU+dZogAZCzvya8Hqr0l8eQFi/HvPI20Uaj+lGgxhzEUdbXZYlm
         LbzN+Daa4aGt+ZRPUl+eZQasmRXYrz5lbU2G0D2QnYo+OUn4EhbH0nmehn+RCegkLSWx
         CF/n14QZc/VnLQsiiA+Ci+tdTZJHMActztfcsLEX0K/XgUm/R6Ck1C4/wj/O47xSsufM
         +e8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cdKjcCk0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba77863d13si384911137.268.2025.02.06.12.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:09:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cdKjcCk0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80U-0007O7-Rd; Thu, 06 Feb 2025 14:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80A-0007CO-Eb
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:30 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg807-0000UZ-Kz
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:29 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-21f4500a5c3so16081195ad.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871846; x=1739476646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFaoy44FDyHM6oS2Rh4MY30zSGm4TJHCV7byOMX8lW8=;
 b=cdKjcCk0s/ILr4XSzI9DyPAdFHCvqs9ykdp6D6/dUHi7bdQOW7PuU6I3FJePXYXcVL
 UiAlRbK7wkOF8wQawKKmT/neOtZk4uqFa5D7MG3RtEpmsDv9O2HAN0n81aawcwINFJow
 jg4kUcIQ2ioDt/ghBo99uYsE2HNg4KMF61d+Zgt2AMiQwBV6+hfkD1E8+xjQpgwMGl2B
 6rv55lED54wWz+f/bk8lNOER1QbI925UAkeisiEuVRv7KOXdXlnKXxbPjrx/ShTZN/Dp
 iEaltEpGHZP765J7Wrpi1RjTu5miNGHuzD+2jJnsayTXFJZ7OV7lzDqxHrAofPTRuc37
 a+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871846; x=1739476646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFaoy44FDyHM6oS2Rh4MY30zSGm4TJHCV7byOMX8lW8=;
 b=pb7EOqM5YZw52u6o72onrePbis0/QFWVXsT6hjSFEMIu0o2CzL5EFXgENFfNEQNRTo
 FN3tqdPPOUmzU2SrMpQiCGVEm1A3mX1SnxRCWkmE50Kzjlq8vO9VWUbkp1/feDBQZmyc
 2az1vj3ceVGpD669ZnKuqwjAdZ/SYjY2bY4cH0S2qDXTOo5msIIWMU8uRTRwm6BVMc+a
 EzQLRfXImDDXJnLuPsreVGicXJIjS9SbB3y9z0Pe03we1qdYroB20sPVnrj7Z+/U77M7
 r9buJPhrUAL78gezdeU8lZgYoOb0Ycf2s2wSQi/4VpqKxyb2NeZptKlnHtkx3Oivv0na
 vw7Q==
X-Gm-Message-State: AOJu0YwMeK+nDBgOI0yth4Scysu8FoKuAu8REYV+nl2qBLz28aN2Um81
 v9GjmmYQ5XAhUDpYP6sQQ/iHOqSJe7NYh860M1DUCMSkZKjYH4ohY7rtwvGTjwA=
X-Gm-Gg: ASbGncuCKp+ZYN8LH9FFYMitpL6SNBnQrhkmkjNN0d3lL9+ZRTUxLtvyTdyoi/jBNTP
 /VFDxFqE0c1ga1gb/+Y7lGe0BOvRFu0FJ63qWzHYUtar4blwfUQIN68lAqCUHZwM5D0ymlpfi/V
 xfzCjoQAcMtb/3zcGx/5wbvd36RpGCNkyDJ+kBVzGsIBGQrGkf8Nvyj/VVLUtqr47HEPtQSZe5x
 BavnhWsZL8qJbfP5lVTRq4bfxaSeIO00aebxfvfdqze7ww5Adu+5U+ZtDY9tVscLWQUlmmwPe3X
 9+7ya1GbZf/TUvkVnY2aBVeZu39g354RlvV8723cMkSwQDQ=
X-Received: by 2002:a05:6a21:3a8d:b0:1e0:b5ae:8fc1 with SMTP id
 adf61e73a8af0-1ee03a3d141mr1494218637.13.1738871846308; 
 Thu, 06 Feb 2025 11:57:26 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/61] target/arm: Add ZT0
Date: Thu,  6 Feb 2025 11:56:27 -0800
Message-ID: <20250206195715.2150758-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: iDxXTefRljKg

This is a 512-bit array introduced with SME2.
Save it only when ZA is in use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  3 +++
 target/arm/machine.c | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 938c990854..091a517a93 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -734,6 +734,9 @@ typedef struct CPUArchState {
     uint64_t scxtnum_el[4];
 
     struct {
+        /* SME2 ZT0 -- 512 bit array, with data ordered like ARMVectorReg. */
+        uint64_t zt0[512 / 64] QEMU_ALIGNED(16);
+
         /*
          * SME ZA storage -- 256 x 256 byte array, with bytes in host
          * word order, as we do with vfp.zregs[].  This corresponds to
diff --git a/target/arm/machine.c b/target/arm/machine.c
index d41da414b3..416fe1b7be 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -320,6 +320,26 @@ static const VMStateDescription vmstate_za = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static bool zt0_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    return za_needed(cpu) && cpu_isar_feature(aa64_sme2, cpu);
+}
+
+static const VMStateDescription vmstate_zt0 = {
+    .name = "cpu/zt0",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = zt0_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.za_state.zt0, ARMCPU,
+                             ARRAY_SIZE(((CPUARMState *)0)->za_state.zt0)),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 #endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
@@ -1104,6 +1124,7 @@ const VMStateDescription vmstate_arm_cpu = {
 #ifdef TARGET_AARCH64
         &vmstate_sve,
         &vmstate_za,
+        &vmstate_zt0,
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
-- 
2.43.0

