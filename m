Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1301838ejv;
        Fri, 22 Mar 2024 09:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1GN5T7rLBCmn2S+LariBTmovxqGAIEPa1/grYJp8TidWhOlt/mIMMYvnOiOe8LD1jfjxupBvYU6pqwlFKJ1ZohHLoPcD8
X-Google-Smtp-Source: AGHT+IFs8d9BD2yKj4se7lzifL4JBpVc2iIPjpiNWsp/aOfqBCrR+xNlTyD2TI1hHyLaCxl4Wgt4
X-Received: by 2002:a05:6214:1d24:b0:690:d84a:a13d with SMTP id f4-20020a0562141d2400b00690d84aa13dmr2603144qvd.51.1711125577133;
        Fri, 22 Mar 2024 09:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711125577; cv=none;
        d=google.com; s=arc-20160816;
        b=oXaqdT7DkaKmkvny+qz4FD5yEiRt/o4nOBfwcURBdpQzIX5/psuUBlf/VzxudPzi/o
         rN4k21i/wTsi5AcMK6sNAoP7pfLyZ5ZaQl/sPiJNzJJqI5/19frxGGxVauUmcIHfgfwg
         sjbgUKCK/U5+3i9S4q0XOHQEnZxLGNBdd+BIu71/+AFotrlOKFiFROkRh5SPoq0DAZSf
         DRCXoJQWeFYhTBg6NZkjTqhOTKwXcle3zLVlAlAeo9mzei75GBZMic1nWaVq9RHvp6P1
         loitaNtRmAIlmWDpvDtipQjqtR3Hme29uDBgcfaF9VeN4LlCNKvvzngwlH2hjYYg1e4o
         OQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=h2V/kZFCfcWi0KYped6O13E5wkq/N08mYcZSpS8jksA=;
        fh=9HhSU4GtJ00uYoum90IAuMw7ql+jmw0f4DR4iYlB24M=;
        b=NuP/T+JSX7iBIIUke9Qo1+DyPSmRzxwh0tw+g9dkU1CGZoEnkVuFB1fCp7UB/zTOXg
         n5+359A1ILGwk6oIZaLaZIjbBjnqebF5f9ntxHQ66sQlw4ffYUX3P0CdqnU1ZW9NV1rX
         Wx+q7Aoy4R//Pd4Oex1eLIjiYm4IPyshRUkB26yR1++d6ZP/lhe10jjyeR5dE2VB1HCY
         4O18l+bmvpW/01DO9FTHpqgNEKwxQ9le1ZOFBkHiXBHhxc1euqiA3qoCOHjXCEGv7Msz
         MpJ3GnTfhFccJJrNmTFFCg8xdoqDJdbWinofwqSRMZ4j0hhp8C5RBsNy6P/9pe0EHbLD
         YggQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wc2HF3CQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk11-20020ad45d4b000000b00690a7e9cd15si2286372qvb.14.2024.03.22.09.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 09:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wc2HF3CQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnhvI-0006sN-EV; Fri, 22 Mar 2024 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnhvG-0006rw-Vy
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 12:39:15 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnhvF-0005Vi-7W
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 12:39:14 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso2971925a12.2
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711125551; x=1711730351; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2V/kZFCfcWi0KYped6O13E5wkq/N08mYcZSpS8jksA=;
 b=wc2HF3CQSoVwvouwklCqbJGsJ/dxsiYEQJ830ZVuQ9RS5Mo5I8MHXzJtmeUq/d6zXb
 NQU74tJntlycPi9sHMJeWn+44bV0CcGyRwbC469OlQIkMxI/oGy/y5lLyz+2vT6qoYfB
 Ok0Se/vKfwu83RJTB4eHfMuW5YB6B3OG/NyrDwqrKWm3ti+LnKqDugpH0MHWvatH4Ztw
 mXTrEz/cUfcO1sRTooRmZr8/mMP8LLt335+WLELG76mBd96t22Awa31Yg5Xcp3n2RIP6
 PlUBUOgbaUXLJlBfs7wO80GyxJdT2zTvz0XruL02oLxcj+P+lM6+s765t1iys2I1hgzx
 fW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711125551; x=1711730351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h2V/kZFCfcWi0KYped6O13E5wkq/N08mYcZSpS8jksA=;
 b=k6hE9Dmwv8rMGsyKcjdoDyGPjK/SXTPzv/+YWd4+UMphCwVfLNNB3FWG0yk973htz0
 ugDcdxTgvL/MuFbSCKMyUaNYKYdoKxKAhP0yWiMIvcynuvMbjEM1MAE3DN7PemZyUxYY
 35sQetKwVqRXTrnejMbp8NcLQmIVFandeOSp+miADulk6P0BezFV0FuY6TcnqsJJh/yL
 zjdzypJTzEPF9YrsckNKlpFS14iVnCWFrv88G6+RiSPJu8tK+VRBUzKOzFiF+ut1+mHA
 LQ3Bsg6Ypp580glSxiGZt95jMo6+g3u069izhNyXY7gJXatzxJuelkJz/qNKKgx7Hv5c
 D+CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlILTbHOhwV/RkeK5KlhHFkXzkNSW6kSn0hS9R1SUGM3vBBO/2wcGj8MvvqmSdNxVma+0hnHk1AVIibbP93AiomJhJ
X-Gm-Message-State: AOJu0Yw7LMeisOcLYFwa7fDiJ1Q+SSZimVSeQgz4ATph7MltRqR+wZDE
 IO/71WwiX0hVMAUT4A9assyL8dvaKL1xVBdliwIpZcLCnZGvOpf86wEGBRSxamb3mRwVLf4Sw6I
 lAfRv0cMxSy83hCB8Bcq4tUd6zH87PA5tA0FOIg==
X-Received: by 2002:a50:d5d5:0:b0:567:504e:e779 with SMTP id
 g21-20020a50d5d5000000b00567504ee779mr19991edj.25.1711125550871; Fri, 22 Mar
 2024 09:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240322155810.5733-1-philmd@linaro.org>
 <20240322155810.5733-3-philmd@linaro.org>
In-Reply-To: <20240322155810.5733-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2024 16:39:00 +0000
Message-ID: <CAFEAcA_nFsWfXckLBJ72X6PTjmBYSRF77UoYs=gPB_GNshoyRw@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 2/2] hw/misc/stm32l4x5_rcc: Propagate period when
 enabling a clock
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Luc Michel <luc@lmichel.fr>,
 Luc Michel <luc.michel@amd.com>, Damien Hedde <damien.hedde@dahe.fr>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: wwPom2O0+PKS

On Fri, 22 Mar 2024 at 15:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
>
> The "clock_set_mul_div" function doesn't propagate the clock period
> to the children if it is changed (e.g. by enabling/disabling a clock
> multiplexer).
> This was overlooked during the implementation due to late changes.
>
> This commit propagates the change if the multiplier or divider changes.
>
> Fixes: ec7d83acbd ("hw/misc/stm32l4x5_rcc: Add an internal clock multiple=
xer object")
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> Message-ID: <20240317103918.44375-2-arnaud.minier@telecom-paris.fr>
> [PMD: Check clock_set_mul_div() return value]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/misc/stm32l4x5_rcc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
> index bc2d63528b..7ad628b296 100644
> --- a/hw/misc/stm32l4x5_rcc.c
> +++ b/hw/misc/stm32l4x5_rcc.c
> @@ -59,7 +59,10 @@ static void clock_mux_update(RccClockMuxState *mux, bo=
ol bypass_source)
>          freq_multiplier =3D mux->divider;
>      }
>
> -    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
> +    if (clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier)) {
> +        clock_propagate(mux->out);
> +    }
> +
>      clock_update(mux->out, clock_get(current_source));

clock_update() also calls clock_propagate(), so this doesn't
seem entirely right: shouldn't we figure out whether we need to
do a clock_propagate() and do it once? (Maybe what seems odd to me
is that clock_set() does clock_propagate() for you but
clock_set_mul_div() does not...)

(Also I think we should have the information we need now to be able
to do the "reduce log spam" in the comment -- if neither
clock_set_mul_div() nor clock_update() needed to do anything
then we didn't actually change the config.)

-- PMM
