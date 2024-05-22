Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp264195ejb;
        Wed, 22 May 2024 03:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+xon4eYkAv4T0Pchqy1uuUn2p0d+pQ3vdL+mglSYBBNZbjUzigmBqtpTLPAWS8UBOUTFKKBy4HipmtTdYpqGq/ZOYT2xe
X-Google-Smtp-Source: AGHT+IFdwdp7pKJgHOFjMtT+KrCtgJnSJ2E82u0ThcC2qUB6dzHoJT7JUGHFYznAxEaksd2FH8TG
X-Received: by 2002:a05:622a:4d1:b0:43a:71be:f3ae with SMTP id d75a77b69052e-43f7a3070eemr224422081cf.29.1716372145359;
        Wed, 22 May 2024 03:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716372145; cv=none;
        d=google.com; s=arc-20160816;
        b=EAB0aFRorCirZfWmgvc9t+1TDRH12ndzHl1d7wBXGq/Vq+Y6jbe93XPKDghfGjS4ZZ
         FL3ezo3FbbeCrMsvQFMXEB3aAMg549HYgNR+JECR30PTKC7Hr/gDkvJu3EaRnY8W2Rgg
         DLV/R+YRp2lWu85bUDrNtYWsQA4hdtjWXSInpSoBjDShJV4mA113K8hjoP5Mo3fktlDK
         DPu5YRKFOQhCWk9qxIk59z3UER9uCi1nBHPZE1XYezWYFjcUiT2/ZUeTKOykE7W2mmrO
         csqeX7MF4x0gzEsfzGPK2k5WChI+PGUd7zLZSpevQG3cig1jkndfsyXblvdLuf0FpaHG
         xUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oegp7+oAJlG8HTHu4rsleQvR6zJkrTgiUoj+staxXc0=;
        fh=0YSWWCNePFE/+cF3kbRyjCEDKCHRRgg+0ViDNLMhpTc=;
        b=T8OpK4YdDZvy4+nMov/ZjYPn7NO5KdeLlM6sTMnHdD3X9OZx5bYxTbNUIbL0OtDvtT
         RavM887YyabWrKe+bVV1GxwOUfiZKJ/FIaF5h98zItVKXQRWnsv8QomfUqOMVl4xhNFD
         XaS6amAmTUxsReg6QXdrgCA1GQkHajFB5t+KMRaGgT+BsJJ70zp9x3/lUAjJjCfXP2DL
         9CW/n3GHc0uYeJ0wHbCW2TUdTzoe/S0mW9bSIm4CO2UhDiPxRoYl6MCys13oTGeE8t3y
         joBjtE5Nuch9gjHxAzEqR9K22UbWOqdspx4gcjr5q7hhELQfZBlxWgvpkgxwugxcMMWa
         ZZ8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xunSh7bR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df549ca2dsi39852571cf.125.2024.05.22.03.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2024 03:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xunSh7bR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9inO-0005gd-00; Wed, 22 May 2024 06:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9inK-0005Ry-Id
 for qemu-arm@nongnu.org; Wed, 22 May 2024 06:02:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9inF-00035e-GL
 for qemu-arm@nongnu.org; Wed, 22 May 2024 06:02:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so10636329a12.3
 for <qemu-arm@nongnu.org>; Wed, 22 May 2024 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716372114; x=1716976914; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oegp7+oAJlG8HTHu4rsleQvR6zJkrTgiUoj+staxXc0=;
 b=xunSh7bRgfqRoI5rmKamtzW8leUSPjFeGAptfg/GQqR8Ey2Vkf4xy9WPD9+J4Kp0ci
 p1HiTsPgiumKCyWoPfgooIhiOAszvT5CHwbPk33L6FpvONGXRLA4SwTXK6mznVQRGEVo
 AdJukVFb61Cp+PcNFIN8kH+kzf+rGt32k+52WX8xeopv1MivOIDz4RoIlgFFaSvzdeYu
 4XdiYKjaSb+9AAHyWCsIfYYwLLymXnqVC/iKY7U4Yzh+H2p/Oh12+esKusI9kVyjPO/M
 KBuZVO0IZ6oAdsDBMvpif6x+l1DaKxX4F7yzix7gUzTS+oruWIp+MIEoLv+/0IF6iA8H
 2tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716372114; x=1716976914;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oegp7+oAJlG8HTHu4rsleQvR6zJkrTgiUoj+staxXc0=;
 b=E9ww8eNO2tvrVnyEdqOwZXq73nS3FejYSC1QD43Zt+naz5LJqTudGCh/yzM/vt3brr
 gyaywSqmrtMFOpPenSXmCgwIRCpA5AIFIU/TXCaBx3FfKQKmYROB2RHFj3BldCRYWVgF
 3c5V7bq31d8fTsITL8ooXw/BIqWrdAVFPWWvXal50MjLglkOvxSo4DMM+YmNorEp2NbO
 NHis+HqMKhJHTGqoO5MVbbE/VqcpEvZ5Q05CNz+tBCW54C3ydIEOs0EtQxG1bMG7y1Ox
 GMWmi1Ait8yrC0KfrrpaFa2BLKDFQPV1yHYWD87XBbM4PVCBtAcZpvSi5Y/KhiD3Jjdy
 uSxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWApLFH1fJIdMkH01QROYV/h7kkB4pRxQNpR92DZe8ahaWLCwR+B9mHAGedffiw1V/wue/IVDgZHM2IrPK2uxFNqUr8
X-Gm-Message-State: AOJu0YwK+Wp2yV38b3UK7D785t1Z9Dj8lz130YQMY0VTJEA+vFSh+TR8
 CYd1/LJ67krhsz8lNYO+Spgb/rMTjKgglj39Q4kRGCnYaYV4YBqQWoiQjfds6J/e3Svn6grtZ7U
 i4HKIjjdET4JJ7meOb7QB9OqS7qUX/M9GoIXhHw==
X-Received: by 2002:a50:d51c:0:b0:56e:f64:aaf6 with SMTP id
 4fb4d7f45d1cf-578329fe0d0mr867285a12.5.1716372114327; Wed, 22 May 2024
 03:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-32-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 May 2024 11:01:40 +0100
Message-ID: <CAFEAcA_ASs4_O22dMi4chcZTT+K=3swJfp3KY83JPbsEJoF-RA@mail.gmail.com>
Subject: Re: [PATCH 31/57] target/arm: Convert SUQADD and USQADD to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: V4pKxjc/thya

On Mon, 6 May 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  16 +++++
>  target/arm/tcg/translate-a64.h |   6 ++
>  target/arm/tcg/gengvec64.c     | 106 +++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c | 113 ++++++++++++++-------------------
>  target/arm/tcg/vec_helper.c    |  64 +++++++++++++++++++
>  5 files changed, 241 insertions(+), 64 deletions(-)

Somewhere in this patch we break the setting of the QC bit
for SUQADD vector insns. (I was misreading my test insn
when I made my remark in the other thread, didn't
notice it was vector not scalar). Here's an isolated C
test example:

#include <stdint.h>
#include <stdio.h>

static void do_op(void *o, const void *a, const void *b, uint64_t *fpsr)
{
    asm volatile(
        "ld1 { v0.16b }, [%1]\n"
        "ld1 { v1.16b }, [%2]\n"
        "msr fpsr, xzr\n"
        "suqadd v0.4h, v1.4h\n"
        "mrs x5, fpsr\n"
        "str x5, [%3]\n"
        "st1 { v0.16b }, [%0]\n"
        : : "r"(o), "r"(a), "r"(b), "r"(fpsr) : "v0", "v1", "x5", "memory");
}

int main(void)
{
    uint64_t a[] = { 0xc000, 0x0 };
    uint64_t b[] = { 0x5000, 0x0 };
    uint64_t c[] = { 0, 0 };
    uint64_t fpsr = 0;

    printf("a: 0x%lx : %lx\n", a[1], a[0]);
    printf("b: 0x%lx : %lx\n", b[1], b[0]);
    do_op(&c, &a, &b, &fpsr);

    printf("result: 0x%lx : %lx\n", c[1], c[0]);
    printf("fpsr: 0x%lx\n", fpsr);
    return 0;
}
(build with aarch64-linux-gnu-gcc -o suqadd suqadd.c -static
and run with qemu-aarch64 suqadd)

After this patch we still generate the right result, but we
start setting the QC bit.

(Did you do much risu testing on this series?)

thanks
-- PMM
