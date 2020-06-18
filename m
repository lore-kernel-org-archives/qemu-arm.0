Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1691877lfm;
        Thu, 18 Jun 2020 07:23:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykx537z5I+y7G96mlqlmoGECQepgTcj6+FMK5TjTnKq3li7BwVQsWuJCDZqjIsLHVds42w
X-Received: by 2002:a25:ca45:: with SMTP id a66mr6719174ybg.85.1592490196433;
        Thu, 18 Jun 2020 07:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592490196; cv=none;
        d=google.com; s=arc-20160816;
        b=QdfAKGZObm1rQse25bHFt9iRvvNtLgXPjnuUsRhthDaWuZf38fHkoYZSwT5Et/+yb4
         wGagP3RnNK39wiA+R7GffcfDlORDYaeVaUeB2ix3xgfZDX+eGy/RLohzcdo/QuNLjQig
         gBLAi06GpJt3xINLt1anBiZSI0W/eV0vRaTRfb/RMDdLqQr1UK5OADWKRyKvWy/GTf9q
         h7ZpPJdhjbKdjFSD08EbWId24ayRJC7/FKO9O4z5YfSi+ER97qWFF0PdUPyHGwSrbOWC
         ue/5FSzWdjlwrGiZnXruoAcWYB4V7KszyAWV2DERTzC4VIzkZgr+Z+wPHMUWHw2jd1Ap
         ciPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzD/G7YSLnlaz8NnpJuTit854jCAV3rFj8vlhaOab8U=;
        b=dLE/fkybeLZTCtc6M/gNQpG5pjoEdckNkQfaSUMorQKEd8+waUDct9mhRmTEV7g2Gr
         C+fbRMP8I9DoxHewkqzPOZN4RwVmbLlknsu6jnUjoWCj+qUdiHwdJ28EsaUnWnkoeo5V
         VHsK83kvFFBr3v3hBab1SnCt3CBoCK4OghNh/KlG4IcRgSj2KWVHSh4JbIuEQ4IMeGvV
         K6sx59S3g05Q/QOxynKXlseXECALWBF+GMiP0Out1lzlFZM2OJFPmcLcbsrp2XYypDYZ
         Je4VvPI0+AXCRINEN1v4Z5UQVan1mCVzsRyeKSkTRUF9/rQ3MfrmpkhaX8HO6tj9RQK/
         TyYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SB02cViE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r34si2765401ybd.231.2020.06.18.07.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 07:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SB02cViE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlvRj-0006O8-R4
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 10:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlvRa-0006Je-RW
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 10:23:06 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlvRW-0000dK-MJ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 10:23:06 -0400
Received: by mail-oi1-x241.google.com with SMTP id a3so5232137oid.4
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 07:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dzD/G7YSLnlaz8NnpJuTit854jCAV3rFj8vlhaOab8U=;
 b=SB02cViEqD1r6FNbbk9rqaKmTlq4/YbB/WziUK9lyKMMr4mUB4fNZCtqZ0uatC/39U
 SnUgAkyGswi1tpE9z/+6sXp9hBshIekUJEujv8gQ8APK8vxm76K+jFsIs7mZVI73OHwx
 DQNrpAKG1anSWJlVihrssPuqwuCte5tFXLzUlRrOziat9gIoSPI9F9QtVdD0zitF0IdX
 0azqNQbJ6viI79iQ+NxA0Hu8n/cpmPNEVFhs35gFcxCS43ePfzORrNOzAVSk0I0A+hTs
 VUZ1xd0eFS6J6r/ezYbIfs2wDHoUp/BEk3oauHyiC7DUZZ0sxS70XRbozUW5uA7pKm0f
 Hk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dzD/G7YSLnlaz8NnpJuTit854jCAV3rFj8vlhaOab8U=;
 b=nGiFjHBIjZH311DH2ysd5pRSHO+JsoeXTP2VaPt30UwREpq9zFgH5gncqZwXInyZTj
 ZTTfBYB2yfLxeuXK8o0kw8nt2tA0CT/mEhn0nDs03IxHev4ROSUfz3v+H/a0d2Sx6XaV
 7uoDqkcttKtroUBUtptK/pmYSDFofoooYy+n51a2EdpH8mLh42/0QX+6fe8bWaLwYNLW
 8BAzZ3xu8SfqZUmcru+7R0isfFUHBsFfoXAFVKvvkmfTp8mUIJwEgNF3H1weOiVD7KpK
 LOmw+JkryOREolMG3grpNz3LtDp51bfQDjjkaLfUu1dYIHeJKkPj91bRcQuIh4eWzPpk
 FJcQ==
X-Gm-Message-State: AOAM530/S6TpOaOPmacztyMK3ZKHND4W/ucptKB7WF300guKkPVdYxo3
 PiheIWePermw8vfP37OXOZpqtRJ2YPsKkwWEaqhj8w==
X-Received: by 2002:aca:5152:: with SMTP id f79mr2988875oib.146.1592490181289; 
 Thu, 18 Jun 2020 07:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-19-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 15:22:50 +0100
Message-ID: <CAFEAcA-uXUYpwPxxkJhG2w7aqw4xJAnCUXnMsaeGtjzTg3n+Tw@mail.gmail.com>
Subject: Re: [PATCH v7 18/42] target/arm: Simplify DC_ZVA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
X-TUID: 0BZIw8jlzc2G

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we know that the operation is on a single page,
> we need not loop over pages while probing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.c | 94 +++++++++++------------------------------
>  1 file changed, 25 insertions(+), 69 deletions(-)
>
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index bc0649a44a..60a04dc880 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -1119,85 +1119,41 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>       * (which matches the usual QEMU behaviour of not implementing either
>       * alignment faults or any memory attribute handling).
>       */
> +    int blocklen = 4 << env_archcpu(env)->dcz_blocksize;
> +    uint64_t vaddr = vaddr_in & -blocklen;

This seems unnecessarily confusing compared to keeping the old
> -    uint64_t vaddr = vaddr_in & ~(blocklen - 1);

I generally find mixing of arithmetic negation with bitwise ops
hard to read because I have to remember what the binary operation
that is 2s-complement-negation actually is.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
