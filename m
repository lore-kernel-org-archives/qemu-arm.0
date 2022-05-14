Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp828955lfj;
        Sat, 14 May 2022 03:58:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqhlu7FPY4M9Pp2P/Gq/2+qQAxpVhK6iA4EeASTLrPmWpB7Ws1YLDBXbfc3SgsThP21O3I
X-Received: by 2002:ac8:58d6:0:b0:2f3:d35c:4ef8 with SMTP id u22-20020ac858d6000000b002f3d35c4ef8mr8184598qta.265.1652525882408;
        Sat, 14 May 2022 03:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652525882; cv=none;
        d=google.com; s=arc-20160816;
        b=njKWBMRxM2BsrgxEZG8CkjUBvwDUq8z0H/mh2IW0lGDPcZC0x7ZZTGC+F5YvWtjjth
         rNayha3WjFgKJQf9jNo2Fhn3E6hVeM6Xt0EYS+DnMlwpXkcxHVFrJtGfbo64VwswVJC/
         chPG+z3DxqhXKPZ+22wKv+umDhxTcr256NvkNfVZm6u4f4nHov49fowz6EVNP0IQcCB/
         eY3RHTAWB2t19+N1O74zVclwFOaxEbbmeOU7+YXs1p9iG0/VeK8bRogtvX3FOWAvYJvc
         6K9WyNZabc0Xp/twNnDgGPS2YPhFfZbaPUAmnn/ehTP97GfursBuxn1gNaX5oXdQshKb
         xIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3aSaDiKXjj4mvNSwS/4qeozgYZIRA0A2InzcPTwRAXI=;
        b=o8bjSy3Xezbb279Aam0D7U1a+sTITH3ZEzpBh2DLztiXj/fOUBvldzWMAzmQPp9MB+
         LpOEvxtXVR7OUNSij57HuPzom0chz0nvC9c8Z+hlvAdhXRZYkTpeKqkYMCmyiuE4f26s
         92EnF7N2XnAhDn4uMwPVDQs5Tl1QXgWbS/eCS5UGCOx4OgdjBsA8WDOke5pgmBLCCKtx
         HFyqgUlj6dgYcLsXZWv/knrNsd1gqe2/lZwUrj23QFHzsztb8BcH62P6nM/xBX/L+Fja
         l+o20h08afZ0xMdqtGB8HEOVCn8kt231Y7Aq2XWAejJ+0WjfmAqXGHfHk00exKE6TMw1
         B8hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j1WNNStd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a0562140d6d00b00440e46a7c3fsi3462604qvs.221.2022.05.14.03.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 May 2022 03:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j1WNNStd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nppTF-0006R1-T8
	for alex.bennee@linaro.org; Sat, 14 May 2022 06:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nppT2-0006Qt-EJ
 for qemu-arm@nongnu.org; Sat, 14 May 2022 06:57:48 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nppT0-0004fT-Ci
 for qemu-arm@nongnu.org; Sat, 14 May 2022 06:57:47 -0400
Received: by mail-yb1-xb29.google.com with SMTP id y76so19415469ybe.1
 for <qemu-arm@nongnu.org>; Sat, 14 May 2022 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3aSaDiKXjj4mvNSwS/4qeozgYZIRA0A2InzcPTwRAXI=;
 b=j1WNNStdaM7Ue7Bs+BmpnMBG72eXfbOsUTG+tuPjo3XyMVBl3DWBHQr9EugeP2KetO
 tyjndesmD+vvQPFraa/bcWXOsu9RlrbLg9IBnBd1JYaDHCCD1NKrYby5bfYiB9NkxNbZ
 ghFuovHSa02KI7QJXFpMLQuH1k4WPoYy1KA10aVO99PI2H1uc5rA7XsDClX1agMMQXPM
 lC5bUjTUieuvN/10S6yNeq+kmtQU7X+kctxgzgogqPNERBv2cUOdMC9AX3iKwSTkBvKW
 vbG1RDLOvQRa0BHtGrxZUjkwfH9PTzEaQW4ZU7bRD9Zw8F1bpRktUHaT/Qxq3jvXNqW/
 bVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3aSaDiKXjj4mvNSwS/4qeozgYZIRA0A2InzcPTwRAXI=;
 b=FU4eSM+JIX1QaQbSDTeHyE3gSLCDgwSihhiTefbtYyA4vWI1lLcyDtGE6XXzDkHyEA
 7eo44oNSpGiWMmqdcVftHXqHJX47Ya5feshbezemyLO9lo4uc4RF6yDlTjCVqE1ZAhq2
 6hb41VxCtPVvgs86qHHleI1556f7nxOnn/j8f38Mt+17CWHFofwDKghWWt1tk7orgNt0
 jNTcurnh9SHpRQEEfbDRPGvg9rku8q5oOixXGMcTCV6irCrx2ozfSAFXR0ZRh20XNppC
 yz+92WxEFTnDfXO4LIWmBPsZL1hIYCa/CtMq/XyHNaFcojFaFbAGrTUWOYqFiaRIhMiv
 vk6g==
X-Gm-Message-State: AOAM5303oq60LNv+Dv68boje49cQd+qkbisidH0U648M/VzDa6HDWTxL
 cWG6IUkVucp6KYiUUokRM9wSXUkQD+GgwAQjtmfZYA==
X-Received: by 2002:a25:8f82:0:b0:64b:4d9:46fe with SMTP id
 u2-20020a258f82000000b0064b04d946femr8645626ybl.479.1652525865049; Sat, 14
 May 2022 03:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
 <CAFEAcA9AL3D6SsjhU2opuAAiCHaTSvvYV3JqCHEMG-7eMVpiAA@mail.gmail.com>
 <CAJNiinuyWmU9_DX5Sa8y14q4n0nn3APgsmq4cSOPH6vwXQubvg@mail.gmail.com>
In-Reply-To: <CAJNiinuyWmU9_DX5Sa8y14q4n0nn3APgsmq4cSOPH6vwXQubvg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 May 2022 11:57:33 +0100
Message-ID: <CAFEAcA_4JwJkQAVOyGhVZ8qc9rag=bNVf73COnbUetojwpgHzQ@mail.gmail.com>
Subject: Re: Hello world example with qemu-system-arm
To: James Gutbub <jgutbub@asu.edu>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sMf2VOupHObJ

On Fri, 13 May 2022 at 23:59, James Gutbub <jgutbub@asu.edu> wrote:
>
> arm-none-eabi-as  -march=armv7-a startup.s -o startup.o
>
> arm-none-eabi-ld  startup.o -Map=test.map -o test.elf -e _Reset
>
>
>
> qemu-arm -cpu cortex-a7 -d in_asm,exec,cpu,int,unimp,guest_errors,nochain -D test.log test.elf
>
>
>
> qemu-arm: Unable to reserve 0xffff0000 bytes of virtual address space at 0x1000 (Permission denied) for use as guest address space (check your virtual memory ulimit setting, min_mmap_addr or reserve less using -R option)

You don't say what's in your test.map, but it is probably
trying to put bits of the ELF file in places that make
qemu-arm's attempt to reserve address space unhappy.

'-R 0' will probably be enough to work around this.

-- PMM
