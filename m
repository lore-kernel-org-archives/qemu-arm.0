Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1901232qvn;
        Fri, 5 Nov 2021 10:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydwRGONGcMM9FkTtvlS5uhzaQUZEoXTVtKqSFkPRJLLdvcNwvaot9RGKR9EbPhrbVfzdhO
X-Received: by 2002:a9d:58ca:: with SMTP id s10mr11397272oth.219.1636132016164;
        Fri, 05 Nov 2021 10:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636132016; cv=none;
        d=google.com; s=arc-20160816;
        b=V+lGck6olwhgZR7+Mfp9ps8SSg6KWUXike7/GCp9gGWEddaphMeeqbORpkkmhHWhrW
         GKaB4r7rytZHNa4X2FwmH24eU1OgKgyEk51NKUJaM0B2PRn8vC2YLIewSGy++UlAacHd
         lGZ/GzXn1QJul/SczAZLODXq17DmvdbJIcpGk3RLGls02hKH4lET2f5wlBnjur4od/Ya
         pmZ73e/O0FD53P9tgYR9QFnX4eSx2Oas90BuD7JqrX36UUZr8Sk1CoPc3+eaYs9vLVm3
         mt4RIgkhoZYJRrMnnDRFewwxrlhW0UqS+t6f3whj2dDgzy7s9kkIKgCtdG6HVL4Fq6vm
         3RKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3PgBOXjWRT4ilK+CvYVA0tU2Ura/yDjQ/Gts47zKEik=;
        b=B9js9w5sUOe7ZUQOz3Lk7Xu93KQo647GYhfma90eLRlDS1YIXbwHxffYPGnBqXm5Lx
         WZ5zTp0hJdMsb/l+SGwh4WIqD/02Pi77zXdChzC16mT4KEEIa6be9mG9qOMTTZWHSmTI
         W48Li8eId35WhWoAx0IWgWwKsIsxLiF/qphVvCLiHzj8+SUV4NduPfciwkX8/rL0WAl3
         NYlD+GovdeFq1fsDF5iONjXNLnBKUO+EFKV94uaYB4qnAJhxQ4J70kOXcZ8Va++Pd/pP
         5geZZYgLIBgrZPvnQkg/5Cdtz2IPPaZW5aHRP1Hbc6wEcmDMsCFyACqmP6GhFo73lUNA
         6taA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sfQkZTYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si1234919oob.57.2021.11.05.10.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 10:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sfQkZTYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mj2g3-0000og-EC
	for alex.bennee@linaro.org; Fri, 05 Nov 2021 13:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fr-0000lM-AW
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fo-00068O-8K
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id w29so3188847wra.12
 for <qemu-arm@nongnu.org>; Fri, 05 Nov 2021 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PgBOXjWRT4ilK+CvYVA0tU2Ura/yDjQ/Gts47zKEik=;
 b=sfQkZTYt6TeabH4oq038/ICp7Hlv4RGHRTJPuz1sIljSxOlXGRk0QHiZZVPzfEqy29
 Dd6GtD81gsNgcfYybyNYNMiM/s51v1kuA0gTD2+LcoTBJgAgBRQ3siW0tqtAIQE6BPBH
 L0YwS7ux1MzL0vuddp36xDxvng+ir11Mc5VzyC58w68Q1ZFm6TrVjH3+BP85D65yHsw1
 iwp74OMX4a6bBvL2iTf8UuulHjA6Ln3NdSv77gAA3zj/Mg+Ptoi6xmmVY8wmOgbebwEQ
 iZTzg0lG+jcr1pzjxkb2vKqLD8VQrrDLNc+iSPAue6zhO2T/OebjfkJqdkJTU3Scq/0C
 FXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PgBOXjWRT4ilK+CvYVA0tU2Ura/yDjQ/Gts47zKEik=;
 b=c0DJ+Y8CVA6OEFv6vjy5mKSjr5lHLhOP2VWIHajKFWBR+29GobX6GKky/cUbnNmt44
 qe2SJF7lD0ASMGTGeARfcAwsUwkgBEhUibACqwR6P5ATbiA2vNbtrTItcS4fO9JE/np1
 yJ81wT5fj/qRvsA2cqzQ+iLky4SHHvBK/hasl4WtPKvbuQKfG9q5ejAGgdjevrjAiT6X
 F4HwTJGxMrc0DcbGry8fvOOvVkG99Wk0Cjp3C5uVeu0/GfQAjpXXfwKRHIyyZNYLLtdE
 Mr+2nHxLXF/6+s+du9Tkq1dgTj7wt2vkKWIQNT1hmwZKIS3wSCzlTimpLtpUpTpcwyB7
 ss5w==
X-Gm-Message-State: AOAM5304HYilGcggpmfxXiJ7JDOy+sulK5tPf2E9H+g5IiIdV6h5ZLRT
 S2azD39K0F+RhMYlYT5CeL8S6zM2bo8ob5H/4C4ZoYaKcu0=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr68501471wrt.275.1636131998799; 
 Fri, 05 Nov 2021 10:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-3-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:06:27 +0000
Message-ID: <CAFEAcA8S3Ov35k2WEZqTR7svnjRZZ=GfGhpMLp=bsiB3vGH22g@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] target/arm: Hoist pc_next to a local variable in
 arm_tr_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h591qw7YIQH8

On Wed, 3 Nov 2021 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
