Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2024346ejy;
        Tue, 20 Sep 2022 13:41:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lh/FPWkbV/hnKK1fqmZL82Q6AP59S5jxfpDRa3RKqpXVttkNILnwqFzlg3tUj344i0k5c
X-Received: by 2002:a05:6214:20ac:b0:4ac:ad56:a9f4 with SMTP id 12-20020a05621420ac00b004acad56a9f4mr20396671qvd.78.1663706504068;
        Tue, 20 Sep 2022 13:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663706504; cv=none;
        d=google.com; s=arc-20160816;
        b=NcPm4T8lc7wi1v8FKlBhwZp+Mh+lM1ky/NFItxuCS3OobMvgOY8nK1t7oF379gXrai
         NKZn8BEsD+CHRIAKO4OBYV2ZD1V5MSgnzRw4MD7VaeedqG2E7dPokbYd4OFSdRDNmxSw
         fD6ds/D9pdzGvL23RgfXdAQ8Ik2wvQVx4eMgI9KtvQLAZmdTrrv1o1hVCmkB11RQ5V5f
         ZUoVtX1RhmlR8a7e1rAsqiJ1iS6dQnVj5FlBhirJ0cEdK9ytXBfeG4ly7X7j1iQFSsQq
         e4dKGmDud9/0zzZqQYl1Wuvi0NKpQN5xpKvnAqna01l5JY39a/0hDZHUrBI9JPzb+TNs
         Tt2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9ojjqBxQHKKGvGj+ykyDON44Vw63oMk4X8s8tx2/iDc=;
        b=SOl9aXjiybESOMJWzyXZc+Bs5A/IKzJzBYUPVe0iG+Jpqnv6TVkK6cZAJhsJmNhlyt
         H8SV0kc7YDAFvicO2gi7Zt5WH1EUrlrhbfQtH29KAhD55HdcL+0YybxOrdZha9cewwLC
         6nYW2D8Nck7P1L0oUIKg/zNssjibPCjlE+yVtffYwQPusjw6Mu468fs9VebchPb/Me3G
         5xx15ClI0Qmc6aPKmVdSWtQsKXYSfkNurVXUoKgXSU5LfVeULulRdQy8XfjGS54BEZwk
         cBE2yyJztJbvwIOqaLftyUzbaitc8GpdlTPkd2o/ylnNsybZQvvbmbPnyE732ToplZHL
         56TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRfvI5TO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc16-20020a056214411000b004acc649925fsi406524qvb.479.2022.09.20.13.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRfvI5TO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oak3q-0002Dr-Fu
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaflK-000634-Rj
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:06:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaflH-00061u-OV
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:06:18 -0400
Received: by mail-ej1-x630.google.com with SMTP id r18so7264109eja.11
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9ojjqBxQHKKGvGj+ykyDON44Vw63oMk4X8s8tx2/iDc=;
 b=QRfvI5TOb8F5I0RlZA+Nfg56Kl1/FOWUpxLRKtiAfPeIuI66qKrfdCqJ0CNlByDNVG
 iKcNYrvUEJBPQ7Rh1EVLJUWsME170iA7M0QVRChAdMQQdWOr7Pym9tXj+9ZbtZGN8EKm
 2hiXzLJk2UnMBHngw5umySYpskQ9djEvFAw3w53bfDafc8s1KXsTIDLFEAo2mkW8iZYB
 6fvVZGXTGjuxYG0cK1EHQYHQAW5JTa2zcRoEpgRxoUl7HT3X8MdNiStooGgIzAGxoJx7
 9oPMDmNbvUo7TAljURaafs5/FxmB6iPgyYNyztEiziw+GJulUBvKfmJ6qhGFFiMQ80cd
 rXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9ojjqBxQHKKGvGj+ykyDON44Vw63oMk4X8s8tx2/iDc=;
 b=JiFGIlgkHXvJbl6KFn3E3LvAdxWMD8pQX2TERW/1shHk+Ky9hQnH+BVHDKVuIFxGtE
 zogRsire2qbjm7ahQh2zkWHcuRWC4BzRLHbN4z0/JxrGtpuhJ7Kb2/YFj9fYNvn2GlTt
 R9JI5foGPmlTbs0h6plp5z0MpUhs9jWxJEbamZU7Z5/MBjK9O8/mMte+7r8S8pU0c1gd
 Yp/NBW21gjBhPwvy5oIWHMBwS1OHcBS6kHDBdGM1TrNVlQhYJnWpHRlSVRxZhtMFofEM
 z3Z5dZ/bd5p0gKZyTLG1jLzs2pOevxau/EbIBhWoUrIABNQEZCJkaLtSlkvIa6okLTfU
 o7FA==
X-Gm-Message-State: ACrzQf128yOfUR4lfSYUDxosmNoVbEJ3R4vURKXvjL6BxtBdYMb6IATR
 AE5vQsKlM30ja/dl7KM3IL2G6abeoEB+VwuqRWX0+Q==
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr17017183ejc.619.1663689970448; Tue, 20
 Sep 2022 09:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-33-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:05:58 +0100
Message-ID: <CAFEAcA8m-PC4L0hXH7rqAUsU5DokPVhxKwx3=LB+_K=G6p3PPQ@mail.gmail.com>
Subject: Re: [PATCH v2 32/66] target/arm: Remove env argument from
 combined_attrs_fwb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ShvrzLDr1DjP

On Mon, 22 Aug 2022 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This value is unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 680139b478..5c6e5eea88 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2171,8 +2171,7 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
>   * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
>   * combined attributes in MAIR_EL1 format.
>   */
> -static uint8_t combined_attrs_fwb(CPUARMState *env,
> -                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
> +static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
>  {
>      switch (s2.attrs) {
>      case 7:
> @@ -2245,7 +2244,7 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
>
>      /* Combine memory type and cacheability attributes */
>      if (arm_hcr_el2_eff(env) & HCR_FWB) {
> -        ret.attrs = combined_attrs_fwb(env, s1, s2);
> +        ret.attrs = combined_attrs_fwb(s1, s2);
>      } else {
>          ret.attrs = combined_attrs_nofwb(env, s1, s2);
>      }

There's nothing in the git log, but I'm fairly sure I put the 'env'
argument into this function to make it parallel with the
combined_attrs_nofwb() one.

If you really want to get rid of it,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

-- PMM
