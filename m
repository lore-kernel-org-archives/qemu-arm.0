Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4416658njb;
        Wed, 11 Dec 2024 15:04:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyCfHoyhwjizZGelhCyUzHwGXSrUaRmIMOV94fgZ2vmBy+8VZ0eWvFk09gBzijM5BpMghWjce5D5pKAg==@linaro.org
X-Google-Smtp-Source: AGHT+IED+sqblAPa7N4GsaxSNN850cGyJL5spUd01hCMfiDZ7mdDSiidmm0rOkqiyrhgMS8GWJux
X-Received: by 2002:a05:620a:808a:b0:7b6:d4a2:f123 with SMTP id af79cd13be357-7b6f2527cb2mr137603085a.2.1733958253450;
        Wed, 11 Dec 2024 15:04:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958253; cv=none;
        d=google.com; s=arc-20240605;
        b=A1ZIdK/hgVw/DV2PtdmVHTxwG/DfAvz/GaK2d7hp4CUQwr3xm64Z3eoGmrUlPvMMX4
         kS5vXEt/gLn15UZaznC7svaxKutQ4pW1HwW9nuiFKdcHJtfiVDQtgiD0lJUEKkz09kXb
         9NtZq2ZLhojp+5Jyi1bSoTFd9iN+9OK0cXyxGBUWuOTHHjzNZrqxFv77dHgxjeK7Jvtr
         TTkx9aXpcEniuPRFS42Kk1+SAQqeTV6YHzsKsQVHFlb9nChOyj7H17Xo+J/e/7nyJYz5
         N1Ax7vhcAgOrZSzeg9RVslF3Jc4LlVlCdfgNBusof1WVAihP7uGZzYTgTnnJIGMwTuC2
         Whyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q84BF+ePAefMMrHK1zEl0KjUdaMQRdy3zhrx62Em4cY=;
        fh=9haE/bBe2/Gha4gyJr8oOunQ8eGEbXnRm1Y2/xNb5co=;
        b=A3eLEXQMSxVoCcazQiKQteGAQXRY3/1IbA3XelY78naL51wD5F3Tr0fvmHNpU68tge
         4iuwmlUYsDp5stlfFI9W0zAz/W83+18yRVWPcSZFmaWqAYdWSwtbvO+MBkWSpM73Bogd
         QazGRGJjquo80vwYVYA56rF7kNaaqeUBZ3F9Gf7pXrxlfPEP3TkSTn6Ekw4uc8TEoa5f
         gclxBEg3x3NZQO8OKYCJNVQFinjnc26x0S0mLPmhmtqpk8BMyuUsUa0sxBPqrEOz00QH
         ghJuB7lVaHy3mByxFErjP3svVVD/F3BsZBD2Dlu1pAh1n5DcqfiFGfWrfmEEsZqGOuK2
         H57A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7ymYIDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a481f1si1842182785a.24.2024.12.11.15.04.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:04:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7ymYIDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVkX-0002oc-9w; Wed, 11 Dec 2024 18:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkW-0002o9-67
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:08 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkU-0001rK-IO
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso4559199f8f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958245; x=1734563045; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q84BF+ePAefMMrHK1zEl0KjUdaMQRdy3zhrx62Em4cY=;
 b=A7ymYIDO5fap9DrW/EBuzh7/yEydEefzdDuEfKHedx5RcI4wSuCV5V55XUhPcIkajG
 JiUJbLRJR41PR+DwSgdBi047I+zg9ZylSlnR4CtmC8gGmdQjuTKZYKVM8pSEc1qasYmm
 5ztNXDuzPcP5k+lkHCmku3wgrOz4gLiKrSrX1PSBNvGsQBrnbjFy7qmreAyPj0qnTOYm
 yFErLFM7CXFctn9La0dFsOMtiNWKCzrinER09og6FJEoqLDKrI1ZaAMtj8De9WcehdO3
 L/M4Xx+iX8xuwNwQDvL2HP0Wt5Wzd+8lKOk31114f2cMJ//cpuwfANBFzIqDdC8zVXnB
 VL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958245; x=1734563045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q84BF+ePAefMMrHK1zEl0KjUdaMQRdy3zhrx62Em4cY=;
 b=lo88yDbb7CK4lEvdOnoKcYv9zJZ8RUgc+fDgJsWl/kNp94fy3G6uHBLPWAxPPBI574
 aKawpGj5XcKvMxa7XdqKWcxpIPjG7G2bOUoQb1XRNRv/h1mGPPh6EXR8zIi61Y/pqZQO
 Xs/sf/lK+EgFB70PoaAlafBrqaU7ZDhcqnqs193cp767l28wjop3lHWzzH1dWFgRqt5n
 N5Cq5yExRQogZDdCaUJP+taAw/RYGr0UPkszEgR6tm89CFvdz5VoPngHHRBq2RPl/YFC
 QJTfkJ4JtLpZlC8+cbZqh83NNQXSvOQTQdDP/cvT5fUcBQWv1HK4pCplP4WC0VidLaBo
 s7sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJmJoDoK8P0dOlVm39JkDFKy+sLJufOMTUx8AsbOa4YVmbxbgYmzxfy5Pr/cCm+P/qK1BEQqAUxA==@nongnu.org
X-Gm-Message-State: AOJu0YxsuoNe6QhJW2qZS3cv6wg36VckgQ3DMcdjxwI0VyShiqltrhwT
 QFrTWrrH+ULa4Ebq0EAaawlcRKiwsPS7+jNfR8AgMbLINdVVL7A48t9Yfex2Nnw=
X-Gm-Gg: ASbGncs5YColYk8WSksVJBnhryHuD33XunAkQbIoEHY/5UkEBAJAEXCdIg9vyujyeIb
 /KiEzQ31KTnr2F/Yutmh8Yak/cVGMN/+u4PowlfXs2MDPUP05VZ6ZUUYFBTR8I1KkrTa6OdOhNd
 kn1xcRXNEhJ8bCuRG8oDNVdADC62Z87KFq1LbQfHdTnduw8ZsoZ5COnMLk3r1nO6NdVm8KHYs7g
 /9hp4pkeHJyuNSBLKzLcYpStfcuv7bCwGOOun7IO95d3a5PacR24ESq4NTloLy6dV9UeDGLY8+Z
 cVOn7KCNvFgJfIW4edSHmQcmZ/OkB7uwsw==
X-Received: by 2002:a5d:5983:0:b0:386:3903:86eb with SMTP id
 ffacd0b85a97d-3864ce97148mr3804619f8f.23.1733958245097; 
 Wed, 11 Dec 2024 15:04:05 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514dc3sm2279838f8f.67.2024.12.11.15.04.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:04:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/9] target/xtensa: Remove tswap() calls in semihosting
 simcall() helper
Date: Thu, 12 Dec 2024 00:03:49 +0100
Message-ID: <20241211230357.97036-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211230357.97036-1-philmd@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: r8tssX9gxW6k

In preparation of heterogeneous emulation where cores with
different endianness can run concurrently, we need to remove
the tswap() calls -- which use a fixed per-binary endianness.

Get the endianness of the CPU accessed using the libisa
xtensa_isa_is_big_endian() call and replace the tswap() calls
by bswap() ones when necessary.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/xtensa-semi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index fa21b7e11fc..2ded8e5634e 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -30,6 +30,7 @@
 #include "chardev/char-fe.h"
 #include "exec/helper-proto.h"
 #include "semihosting/semihost.h"
+#include "semihosting/uaccess.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
@@ -323,15 +324,12 @@ void HELPER(simcall)(CPUXtensaState *env)
             uint32_t fd = regs[3];
             uint32_t rq = regs[4];
             uint32_t target_tv = regs[5];
-            uint32_t target_tvv[2];
 
             struct timeval tv = {0};
 
             if (target_tv) {
-                cpu_memory_rw_debug(cs, target_tv,
-                        (uint8_t *)target_tvv, sizeof(target_tvv), 0);
-                tv.tv_sec = (int32_t)tswap32(target_tvv[0]);
-                tv.tv_usec = (int32_t)tswap32(target_tvv[1]);
+                get_user_u32(tv.tv_sec, target_tv);
+                get_user_u32(tv.tv_sec, target_tv + 4);
             }
             if (fd < 3 && sim_console) {
                 if ((fd == 1 || fd == 2) && rq == SELECT_ONE_WRITE) {
@@ -387,11 +385,8 @@ void HELPER(simcall)(CPUXtensaState *env)
                 const char *str = semihosting_get_arg(i);
                 int str_size = strlen(str) + 1;
 
-                argptr = tswap32(regs[3] + str_offset);
-
-                cpu_memory_rw_debug(cs,
-                                    regs[3] + i * sizeof(uint32_t),
-                                    (uint8_t *)&argptr, sizeof(argptr), 1);
+                put_user_u32(regs[3] + str_offset,
+                             regs[3] + i * sizeof(uint32_t));
                 cpu_memory_rw_debug(cs,
                                     regs[3] + str_offset,
                                     (uint8_t *)str, str_size, 1);
-- 
2.45.2

