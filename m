Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30387E9A777
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Mar 2026 12:02:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w50SK-0003gy-1Y; Tue, 24 Mar 2026 08:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w50SC-0003bQ-Gf
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 08:01:49 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w50SA-0003dL-P5
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 08:01:48 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7982c3b7da9so11921457b3.1
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2026 05:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774353705; cv=none;
 d=google.com; s=arc-20240605;
 b=NOGJybo2ppUgJ556XpTepO/uR48sVGulSyqEcOkWTyUFYJrROAaNw1QmaJXk9YxDEZ
 KslNinPzSyKZqJOlx5g99smtJ9oAX4H11dakUrw7/EU9L7a/SEVLBRQk45h+UIZs5Mem
 1zr0VimsKWFt/nSaGevzYUNfInNXDK5VtewZw1uoxldT4xXHbTIE4WsypBVMnttp+j/r
 hs7bDXlAm0xS0OR1+Un2UEXbKjLxND703QPFRlad7d9Za8SDqqGHdldTsfGOkMu3Gk+w
 6P1pdpdc/TxasotNfRKswMXwUPIfVWJP1NQj2FKGcBmUJ9vNdBtZsxgwS1blKtJPAXFq
 TgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3lsP2JwMv66cLDbTRd3pQa0LQpVURmFthN5mUg9ce3s=;
 fh=lKMCyNet3W+Z4xwBsb7x7ndIlQI8Z5DhTWJeI7UChtU=;
 b=fuoY3IvC+GSRKKiC8N22BU25ui4Yl2AvqUUUQKX0aYsbrBbFNqHjkGTrXS0CIVKLBM
 vd+1Rr9xgiQRooohdvSYDtfgV3UUdVwk3GksBgFTc6z6X0xxC7vv5QWKvtPY9n0956TG
 CNS7Zz3/8i6gdKBEtHQYzSaSkGPyxuH59i7KG3e+44rivW2S6cMYIGVPW8v6xxWlwVvq
 gxPhqnBdJZgsCZJ1GYZO13FMIPXJ9OavugJ2E+kGs7JnpgGlSMy+nC+HQgLrYWzRv+If
 lZQSDfW99pKCpnaW6fTzD5wqJhOhTTjOKGowL9dOAi6z3ChMA4MB6UJOEWkvbE1snsqN
 6o7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774353705; x=1774958505; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3lsP2JwMv66cLDbTRd3pQa0LQpVURmFthN5mUg9ce3s=;
 b=oVdLSEXhhfBdZ+rRZK6dwtRJlbU2SMki36uRvZZZrtOj3CkLLSyqbTrhn2A3K0vRih
 geEftfSiiiwkH3EeKfAVVyYOFOrAuL1c0qvVgJCOfX7DN5QmZ3YsTokG3PT+xnCSguaF
 Lfv0XQ8+hLZM/pITM2HQtc8dRKA86IXSqWB8unOnsjpguu+Nxr1j6vx4AyNAEaj3Xp6A
 Cvj7sjxtSb6ksjABVUzytG59BIrs17GCdzQMmSIgO91BxKRWRvNyQF3TbR5JmrKprqjR
 /wfkVfFurPmjmKGBz/Nn//9FeAZHj9oea2sPMGb/LYFfa3ScByx0uwrBLcVRnQDxmeLb
 KmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774353705; x=1774958505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lsP2JwMv66cLDbTRd3pQa0LQpVURmFthN5mUg9ce3s=;
 b=BnDohWM7usVcKurH/e3ZmtvlpXgrTGWCiekxvDouk00WPrQQOufr7H9rkux4DtKDqi
 KdjvNSbH5o1vhLEtFPdHFqYebHSt0Z20qL7qXa6a/naU+eitRpS+goryEHyByjJLWOiX
 D1kyd+YCLENpyTtIZlwmXQLMfk3j9abCQ+xpvdXIf5PodG6fdR87WJG5Bk39R/d8lHta
 lbaMtaqbEu79r8/Mkj0Yriah/G8UauDq34A+43AiHFDpxiXORn2sVWDaNQFn7Oe/F0/U
 v9Vu2muP6xi/F2Cv47IOVP8z6D87whZFIoBzFCmLNmtJT8mkJdo8FqItSMcNEdXkpJZI
 QKZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXduS8jgvaJ8DuFHe0mha19IW+x+b4AvFb1PNcR5YAFBjvbL5qwdD3aMbMg7YvWGYsnqSBakFlAhg==@nongnu.org
X-Gm-Message-State: AOJu0YzeHgs4KO1yOLuCZqra+u+4nszke+FgNvfLdFSuurjShHmwC0bn
 vyfWPaXUv6MpimCw1HsN0K0aE3S4MopOlNCUS3mPi8eWqQIoX/wEdPoRz33bg17Bo2bzJDM/bE1
 mU164WMAjZCfLz+d4nQoniDLsjHuoqwue0/qYHY3q6g==
X-Gm-Gg: ATEYQzyAIzCw/2ZCYPqcFrvwoUhSQnDAz87rpp01SVJcBWSH/OPKVkHLbVIDnhxz2qF
 vCPFAqj8etCUTkwsLj2Sclmhkj7807Tw0MVjP45RA5gg7ltb8FB04ngRx6peVHIZk6mqrlMj6H2
 wqXfkdQeL1zQEpRRq7S+SCtxYKY9+dQVAZZz/3CwwFuPqb1sZkP0vmFkjVX0Q4KqoY3StC1PYeL
 el9tAycbhB0YVwWjX0XHe+6n4h/TrYhva9FCO+avqGyOsQfOvBifmDu4/RA7Xe3y0V/AfLv7lzP
 DyEgpTxBhzxFHFs8XA7CRB+ceVI3oWCj1y/hNkQP8kSZRvu9JhVwUw1BCqZu0r3sOPw=
X-Received: by 2002:a05:690c:c372:b0:79a:cc64:886e with SMTP id
 00721157ae682-79acc649b03mr3170727b3.52.1774353704734; Tue, 24 Mar 2026
 05:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774282897.git.dingtao0430@163.com>
 <5856c66fd4e495b874815adba9dcfeddc1f47e65.1774282897.git.dingtao0430@163.com>
In-Reply-To: <5856c66fd4e495b874815adba9dcfeddc1f47e65.1774282897.git.dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2026 12:01:33 +0000
X-Gm-Features: AaiRm52iWQkGMAOQ0i383IesMR8GUpMcdWAeIgvm3ZG4qRN0aG4xL4Gtnq3feyg
Message-ID: <CAFEAcA_224me4-P6w_yo52GVEqWGHOeW6L0biQUEEdqcp9LNaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Fix transfer size register decrement in pl080
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 23 Mar 2026 at 16:50, Tao Ding <dingtao0430@163.com> wrote:
>
> Configure swidth to 1 byte, width to 4 bytes, and transfer size to 4.
>
> Configuration
>     ../configure --target-list=arm-softmmu --enable-debug
> Reproducer
>     ./qemu-system-arm -M versatilepb -m 128M -nographic -S \
>     -device loader,addr=0x00000000,data=0x44332211,data-len=4 \
>     -device loader,addr=0x00001000,data=0x00000000,data-len=4 \
>     -device loader,addr=0x10130030,data=0x00000001,data-len=4 \
>     -device loader,addr=0x10130100,data=0x00000000,data-len=4 \
>     -device loader,addr=0x10130104,data=0x00001000,data-len=4 \
>     -device loader,addr=0x10130108,data=0x00000000,data-len=4 \
>     -device loader,addr=0x1013010C,data=0x9e47f004,data-len=4 \
>     -device loader,addr=0x10130110,data=0x0000c001,data-len=4
>
> Qemu monitor
>     (qemu) xp /1wx 0x00001000
>     00001000: 0x00002211
>
> The result correctly after fixed
>     (qemu) xp /1wx 0x00001000
>     00001000: 0x44332211
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Tao Ding <dingtao0430@163.com>
> ---
>  hw/dma/pl080.c | 17 +++++++++++------

Thanks for this patch; I've applied it to target-arm.next
(with an expansion to the commit message to describe the
bugs it is fixing).

-- PMM

