Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp781305nji;
        Fri, 12 Jul 2024 06:03:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFYfMtX3qs/y0gGf8RqOQipgEmKntmp7gtTSq5VAb7+FWXrs0VAr0qdWwqaHoPP5wX7Ci0HKMOiT7ywEJnk+qWRg/+8rdz
X-Google-Smtp-Source: AGHT+IFVjObmuq1bb+S3BEPkOH0Wc1KcXNvHJ3XsJNF3O4JmaBfCkCaWDO7YrZsde6kFHScdKuKJ
X-Received: by 2002:a05:6214:4018:b0:6b5:e2da:8be1 with SMTP id 6a1803df08f44-6b61c1da297mr141537056d6.55.1720789418435;
        Fri, 12 Jul 2024 06:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720789418; cv=none;
        d=google.com; s=arc-20160816;
        b=EA+7i/GUWqu2eIUzE87vH26HPoTrec/e8tw9C0bKvw0P3smDx2/pMLde5DhPymV+ui
         I/pCNBAcuHOmom1fnyzOq2kWzjZXWohz++ZCWq+sj+6MN+NMWq2uUIm1AWDd02JXoVuf
         dX/Xv9u6Jx2GC4qoVqGVQcwxap9dRgLAllz2Ky0IegyFlaW1L7rb7EPcNE3g2qfDr3O7
         YpliEHUHILD/oXaHgPA6CIE6czsuMOaPvIY6Mx95xeZu5UkmlqB1Xc++XbA7EanG1mV2
         FnBetoghs34lqk0vTVAiswV6b2CNe9xLojRmU8yfww1DD3uCR9yo5w1iLn+Me1VlOsMt
         Zp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vCFtf2iNIwx1IjbaReYl7YdD1FU8YkHtI7PLgSEDdsY=;
        fh=JnUtpkkpVoGWaf+OwdU/Fr0t4Mkr+Vr9zepbc1qHPXs=;
        b=oaBCmJrCFMxLzgyzB6Mv/3qytIQmqOJwvNnztkCh5tCeUL1DOoII3QBeeNKNIM9qVv
         fQnAVQPm4rFlwBLEJeLuasjdKSqP8Fb1grKrJ0Fy8+JFcNKw2oqE1GqRXo7DVJwyuAFN
         4j5k6rOwY4Q0+HwUvNpZGzjQSv2Qkit4qaSqGNxlvZih1wRA/ifMoVOoqUGOvbIBKRP8
         72ACkTsTNoTvJn5BBpWOknDgY4j7UVJ2B4Th3tfdvhHuJIpWY7pPM6JLFPZVZoL31i2z
         CR1MtQjVnPDziMsdsJxbxZBYQsdNM0986zVS8W1Nl+wrtTclSJ+mZX8Guzmoyg1/4f1P
         AwvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjnyPUBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bb04ad4si98247976d6.588.2024.07.12.06.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2024 06:03:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjnyPUBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSFvN-0003z8-Bl; Fri, 12 Jul 2024 09:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFvF-0003QS-IC
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 09:02:49 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFvD-0005ze-Oc
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 09:02:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so3216440a12.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2024 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720789366; x=1721394166; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vCFtf2iNIwx1IjbaReYl7YdD1FU8YkHtI7PLgSEDdsY=;
 b=ZjnyPUBd8QN4RpsNNH4u2apbW5o895NKQ75vzGo+64EWcYEkgF8iyFshr9ze4Vbtqj
 ul+Ws0K1EO6PjGWc38eLQ4ubkJu/PR0KBW0lOZVOqtW5oWIzNk2rIrpyeONRTJ64MxgZ
 biT3yqZl77pe1vJs8Aeb1PTTJXXELOpsK05ffG33dc0BCI5D/LvkrZRUIf7WAnJDKZ0n
 AhAvDjLZdgJFFG29nKQS+k4H8NJ17IJYHipLNOFYJmiAO8rfSs+lAmp5U24PWKZZLrg+
 RWRd9cS8SqzBdk+6Ogs+mNKrAVniR/nsYj9Yy5D0O/fV2kA9e2SzOOoLo/NQWYPzQ+Cx
 hMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720789366; x=1721394166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vCFtf2iNIwx1IjbaReYl7YdD1FU8YkHtI7PLgSEDdsY=;
 b=D/UvGZuQ+u/sV6zU531JP98FAOri8Za95Lr/pe7U20HFm+OsnZ0YUa+fQRONajRsAD
 h6Fa23meL4RZDNnQkwQyBfMOg8BCUaLabN8Elnk+QEO2JkDBrbXDY5mJrqYw+P1gzYmX
 SRijF/hrKFpwZMUmdFlf9HUGdaw9nIKzupbCAWH7xYQ2sEC9B3CQnRb32TMFmZ/Ds1Lt
 pbPimagfpTN0KWudUCRAWI9ZwCVCVMQPuWt4NaHqy0uHweDje59KcXE9Er2x5b8lcNUp
 2TU1Jg3IKsWCGaMNUVzkFawkDnFxVLypIfnG/Z8E0mhOrk6vU+m3dP9P9hIkuDfqjw5+
 XlTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyn+eLdENNYIUds0lfSiaDx1Y82gpz3pvu3TLyvHcD4Fc4MMWjMv5LVA2csnNkFeLbzjPnemgVaY0/C8iI7z4cyF6X
X-Gm-Message-State: AOJu0YzN1c4XpRWAmDoMxPrcORAOJ8vFmLd/zdL+7P+zclqHDMbC78iO
 sPlRcjul6R+god+Mcvre6N73EHLPFeYMfxFTUVLrITKQ9o+APIwud08J1a5uvP8/Q/EOj8rKS9R
 NpKK4F3j9dX09wwIs698dYu66lXrD5pKC1oooMw==
X-Received: by 2002:a05:6402:1911:b0:57c:5b7a:87e7 with SMTP id
 4fb4d7f45d1cf-594ba0cbecemr9114374a12.14.1720789366145; Fri, 12 Jul 2024
 06:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-11-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 14:02:35 +0100
Message-ID: <CAFEAcA9O+3W=2EewSUDoFOF322G5UUAW5xD+wWasW19F5pO6NQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] target/s390x: Use user_or_likely in
 do_access_memset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: eENI2k5WVZMu

On Wed, 10 Jul 2024 at 04:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Eliminate the ifdef by using a predicate that is
> always true with CONFIG_USER_ONLY.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 6cdbc34178..5311a15a09 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -225,10 +225,7 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
>                               uint8_t byte, uint16_t size, int mmu_idx,
>                               uintptr_t ra)
>  {
> -#ifdef CONFIG_USER_ONLY
> -    memset(haddr, byte, size);
> -#else
> -    if (likely(haddr)) {
> +    if (user_or_likely(haddr)) {
>          memset(haddr, byte, size);
>      } else {
>          MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
> @@ -236,7 +233,6 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
>              cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
>          }
>      }
> -#endif

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
