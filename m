Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1196057lft;
        Fri, 1 Jul 2022 05:19:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vywR2vAhzlzIC3i+csyMhF/d89DC4XOJVIiC+fQmc2f6d10hvM01xhuoqZD7sa6mHgNEnw
X-Received: by 2002:a05:690c:28e:b0:317:7b0b:de00 with SMTP id bf14-20020a05690c028e00b003177b0bde00mr17154546ywb.438.1656677973643;
        Fri, 01 Jul 2022 05:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656677973; cv=none;
        d=google.com; s=arc-20160816;
        b=DctbJ/0DfnUnn1meC5aWJTRjk2HmoU19gym7CnDLpSJK2lku5UJWKdrEp4fugDZtmq
         OLuaoNPrzKhCnyIkrSq9pK65e4wBqo4lm4wQOhkz+Wa2ufcyI09OhthbopWZ6h16BDHY
         0mhKKQWLCNaM6imE2jATZhpkOI0rhaFCI2Wfxj4HQFpP2gE54kK1+CukUYcGSaB6UUuG
         7QLQoQDvbfXZYiaCxVAImGyNIwh9W1VzPukOCtRzGQh4nB5vyFAOB8TnX4FiFXygCwJu
         jmNez839GvWf2arlo/XLOZB4cD8W/s/s9/uIBr276CzsbVGbou311bhHRH3mDeR1WGUJ
         LLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nlFl2EkXWUmkgmuIBVPdY3RBGRmYP9NERpplL9+6QUQ=;
        b=1GTww7bIAD0cEB099wgpKzrAS9AAExoAhkOoKZvZVOhFaON0D/b17Kib5n5bJ69Z5U
         ibFS2BlEDaTI+FP4Kp+MmbhlBe+SOAeR/nCmr6dMbAhKg7dc6ETRk6JU1d2nV1tOVycu
         lMxn6XT6xLQ9hSAgPjtc3eNRM/SMTDzGPqXumTlQstgw2p4wcpwslRWSKsvq2gGxrMFl
         SvxSFATBIMlv6thE4+NRFc2J+1Q/ITpLpeaGHBrLnNR3+36epK010pEJG3ZONb5p84k5
         nKjoPX4zpsx92hQUcKtTTiMMhY7LJDwVUEwuCyYIMJ4Rb5duOlrob4b7pdK/tDffQns7
         q82g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H4Mz+xsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c189-20020a251cc6000000b0066a194ca357si27053639ybc.488.2022.07.01.05.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 05:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H4Mz+xsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7FcS-0005vh-SW
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 08:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FcB-0005uC-SZ
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:19:16 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fc9-000343-58
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:19:14 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3178acf2a92so21830157b3.6
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nlFl2EkXWUmkgmuIBVPdY3RBGRmYP9NERpplL9+6QUQ=;
 b=H4Mz+xsRow/M2WU0JsZ3miR/RJi0jEeAxAG3q32TNTZoV6Zna2sYwJBQ6shnH+tTUu
 9i68RO4Fbk1ghBa7wepZTPZvO4UDSEJOlNsB/uIcXtJSnGcIlsYySTu2XzMV299YzxVc
 vXklmBqjfC8WHpDE2YP1kEBqQXQ5kSDSZdh3jQzQkwjKcp/xDzKrfqpUby/S8ZpjUXOu
 k18V0qR9g+4JTNEaxBV4yWojuflItbg9hUwZ6z97Dvf7tvL9qRJ8Xr4BO4EANNIOuyMj
 hMd41N8pgAe1jeQuuWL+cQY2vNt+3jQBpPEx3u4ouh9kWWLdk3L5mhYT3BZLoeeH2qKN
 BPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nlFl2EkXWUmkgmuIBVPdY3RBGRmYP9NERpplL9+6QUQ=;
 b=uTRxx2Ud/KAMHQ63WecQ5saYXHznPo0FKBzxgzCRJsvBIXZbwx4etdSKbTQwFWiKvW
 4JXC5CO3abIlCXgH1UPBncEMKGSawaTpj9D5uo0KLsheEHMn6hGzltJJ+HtmMntGjKHx
 /aK0Kus+H44Y4BAUaC+s6bi/dgk60+dEuOpP074OigqBpPi7XYhFx7LdJDlCWM5hkD6Z
 6CT5gX2v/PYyasofg+xGtez73D9Y4Tgq8GuWc9urSz0df8v2Ydc9YBt3Ef0bmAnQjngI
 yYHyrLwn4Pcvu/5MerM0TW4SadWD//CtMEWY2fFla5cEgZIX/ou240sX//z9Ph8QzAJY
 o9uw==
X-Gm-Message-State: AJIora9CV9XHwiSu95iX1G6ZM6TeHMIVIyElp71psPgpSXnWh/BE3OtK
 lnWTSxOSq6pD1Uzkj2ePHNj/sFnooDQnuGO2HYzJmQ==
X-Received: by 2002:a0d:db55:0:b0:31b:71d8:21af with SMTP id
 d82-20020a0ddb55000000b0031b71d821afmr17271146ywe.469.1656677951096; Fri, 01
 Jul 2022 05:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-8-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:18:33 +0100
Message-ID: <CAFEAcA9DrujnB==AXU3udYv_sfCcWT_sUxyqsYoMJDAoyOb+vw@mail.gmail.com>
Subject: Re: [PATCH v4 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-TUID: mThvBC85cbIp

On Tue, 28 Jun 2022 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode |  2 --
>  target/arm/translate-sve.c | 18 ++++++++++--------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
> index c25bad5ee5..c75a94e0fc 100644
> --- a/target/arm/sme-fa64.decode
> +++ b/target/arm/sme-fa64.decode
> @@ -58,8 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
>  #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
>  #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
>
> -FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)

This encoding pattern (as the comment says) covers only the esize = 128 case...

> -TRANS_FEAT(PMULLB, aa64_sve2, do_trans_pmull, a, false)
> -TRANS_FEAT(PMULLT, aa64_sve2, do_trans_pmull, a, true)
> +TRANS_FEAT_NONSTREAMING(PMULLB, aa64_sve2, do_trans_pmull, a, false)
> +TRANS_FEAT_NONSTREAMING(PMULLT, aa64_sve2, do_trans_pmull, a, true)

..but these trans functions cover all the esize values.

In the pseudocode for PMULLB/PMULLT it explicitly does
 if esize < 128 then CheckSVEEnabled(); else CheckNonStreamingSVEEnabled();
so it is definitely intended to distinguish the 128 bit case
from the 16 and 64 bit ones.

thanks
-- PMM
