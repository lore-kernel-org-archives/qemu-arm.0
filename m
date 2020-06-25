Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1477354lfm;
        Thu, 25 Jun 2020 09:47:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLfySt6xIHDUfGRsEtH1vD232zei/xp8Fzy0wMFJL9qRdIO/4o6I6DbN/cFd8CUgZQVgDo
X-Received: by 2002:a25:b94f:: with SMTP id s15mr40321445ybm.326.1593103645789;
        Thu, 25 Jun 2020 09:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593103645; cv=none;
        d=google.com; s=arc-20160816;
        b=DwqyIjRteTrEUm3R9OrPYo11YTdiN7qgKhW802tnLdBBOM9HSY13awaa3/GKgkZtGP
         4aXblmKl2bLFScA/SFys8dz46UcmVdqn+HLnfBPQVL6ojx4tUH5X8XsPqNi2tzKVZh5V
         8+F72V4boe28FJxJlepEHVqC9cXeZ3cfLOTYqES3wOQMw2pNF6MXB432OzRPFaHDilLj
         PnJTQseA+j3VsNgtnapkg7Z977YGh9bFxQP1ijx/vmmeiJLaIWAx2jmrkek5Ok1Jiex3
         EGmocip+uwmOnCDuG/KKymvWwpONtOJlKmZSDFp+xIYB+06QYOU7Lg2PdWWtqmwn5Fqx
         /w9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/dmt1z3SR/RosjGKp389EiA+2Iau2aevOIL5Oyzxso=;
        b=RIibDvA+uvUSgg8vmvwrOt4Woyu1CEkw8BZXL80twklFu7BlMh6DC5HGFw0ULWZGnD
         vN5bg06hJIWmDgpwoz/3RPW8DNZ2htPevY0XnTrRTVLU821qfMBMRwBolvZl9YLzwaJ3
         bKdLQFEDZ8MtEB7DdDpmMGNEakF4s2YqX/jQ81IH8GA5o7spaLgxhpyVW4JtrU7H9OR2
         x7xLiRchoKA6bMAFCoMtf/p+kH278MBqO6Rq3pJTHDs16Jnl7wpkSziHYk+Tn9NeBQRc
         NKVS4NwDCO4N5l9gmfHQh73hW6NSui08DNY2IhcJ9EQVBE/kUbG8/LK2FVTqkwbnkjSf
         oOHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AbGS7xiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si20404308ybh.476.2020.06.25.09.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AbGS7xiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joV25-0002Rh-7t
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joV1r-0002RO-8d
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:47:11 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joV1n-000136-6U
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:47:10 -0400
Received: by mail-ot1-x342.google.com with SMTP id k15so5860631otp.8
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/dmt1z3SR/RosjGKp389EiA+2Iau2aevOIL5Oyzxso=;
 b=AbGS7xiUjLul0kg7rnkxRgV9QON76PXNZDV2Rpm6jFoAygs3V5Va1FBUJ/BzMJpknp
 XIQwAQtwKoIubj/Y7yTN2e3upcY+2Jk4IjWQjRZ/KfKsdnXz/zF6txSNnMD0wtM/dhmR
 WDqI4q9rdJoEzaGu6scWJGvvFqvX2uJtOpe9ctoBA/Woq8de5oK73TjKxHjkC+yCH0bK
 puYIMO4QmBBIvqFnsh1d7qnasfPb+bI4Ny5S6Kqp1IFvYS3j1mkCD2NumxPYp6cptVER
 HpMlQYNh7v3avCrBCD7aQ0idvcQK3jvy+5y1MW9eNhC3y1l7bg3JLTFvaCP7nWMPd9Rh
 b+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/dmt1z3SR/RosjGKp389EiA+2Iau2aevOIL5Oyzxso=;
 b=QzFuMj//iLQXUoETKBs7xk3HMGD3Lm5oKJmbwO/lWxJs8KIEQm+ulJi7K5Zz1vmUTx
 OUBWsJJQReviGD5JNwHUPg4VoomRqOlKpjqp3/O/i7m80mTAzf46ssK+DGYuP7miNkhN
 EDr9qpQRJrxI2bMLCP1E4HSmdrSUHMQeHkvUPCSFqne8BN5IxuweY6fEFuLYnwYHpU/T
 GeZm6fFQ4pAOXvMnt7TnuZsaOLK9U2SgQB+A2hkmW93Qj68+omQvkKR6tiXzjuSqmrG6
 Rz0uztG/0KsbGXiFxK70777P4occpUeONQ9ILHRVxbl5kCv/Zll7HgAQKmTFvBYwFyZm
 1LhQ==
X-Gm-Message-State: AOAM531dHmyEfWbCMNs6wJ5iMINXo4N4lLUpaLraa8fxSJ7OZ6RVnjzW
 t66nBLp8yuxPn/O2v97wTmAeYEg6YBtH2LPAUjxy27Wwu6s=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr13786378oth.135.1593103625773; 
 Thu, 25 Jun 2020 09:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-10-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:46:53 +0100
Message-ID: <CAFEAcA_Jd7Y1uEZsfCgKgicPjZOVe1LAAwOr4T5uRs7jjBSyPQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a4ShI0xdl+J7

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the prctl bit that controls whether syscalls accept tagged
> addresses.  See Documentation/arm64/tagged-address-abi.rst in the
> linux kernel.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_syscall.h |  4 ++++
>  linux-user/syscall.c                | 23 +++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>

> +        case TARGET_PR_SET_TAGGED_ADDR_CTRL:
> +            {
> +                abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
> +
> +                if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
> +                    return -TARGET_EINVAL;
> +                }
> +                untagged_addr_mask = (arg2 & TARGET_PR_TAGGED_ADDR_ENABLE
> +                                      ? MAKE_64BIT_MASK(0, 56) : -1);
> +                return 0;
> +            }

The spec says the tagged-address control is thread-scoped, not process-wide.

thanks
-- PMM
