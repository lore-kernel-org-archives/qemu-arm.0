Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp746558ejj;
        Mon, 25 Mar 2024 07:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBNsIWgN5s4WjKtRelPAMeNmwrPIUCXf+CGwytUufcrPODUwuMpUJk57MyFRqw+XJzN16s253xlxm72rYZECK4VdMVBw1C
X-Google-Smtp-Source: AGHT+IHQ42EAKdyG/9SZvtiGASXStSPLhYSaRoq1k2eN7E51M3V/ZYA/lJIOi9S/TNil55BEVqkN
X-Received: by 2002:a05:6102:302f:b0:478:25f9:c731 with SMTP id v15-20020a056102302f00b0047825f9c731mr179250vsa.4.1711377931258;
        Mon, 25 Mar 2024 07:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711377931; cv=none;
        d=google.com; s=arc-20160816;
        b=sryYvnsShr900bfdzhuiZpndsg/rZab45DUE7DI0ekDkpnIMREDUZFy9pn+6NTggBE
         s2GSAH63RJgooCO4OINv4nBBM7J4oG5ZjHGCf32F0jJYgUZJvv6hxm7WmqS9YAxNNRkp
         ri4dbFSTweD0Pd2iBPXzj2liNYyAR2oZXU36BpOkSmbSuPyGF17VCrZpAz6y8bfVZ+SG
         NRzWYcOx0GOqPVQ3bG10gV2igjU6skY8x+ELyX+sUnI7IWDD/J61HUkivj7BVgG6zYIu
         10KgDV2ftpM1Q4z3v+Od/ap4urZiAMdC4vPQzsIYun4/x8Er8Ex7JpYEJQS1UejGVFGn
         LLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UasTUmVBcL/VKWYDCP4/BH4KdfUFX2g4aOhY6ZmnY4A=;
        fh=WmKLx/0aS4jl7+OfMPt2McnVEfxuZ9BYps+3hXHNczg=;
        b=XHuHHbPV6VvDDkp9vN/uiRVD0BTfcIGrNqLnIrnEV3glMRBSo9tgtUSx90jFdUvw2B
         Hm44HyoehizAaBYOgHRrujW3P0QWI2PA8pWjIuvuHgCSiMwjBCdeljIHvZ0mJyYk/1P/
         dyK7RWYjs2NRdpQ44Q7W/TUAf6VTmBHXeOiX5RpBnEZSu9ey8jxvm2uZ58ZRDCAt2eQQ
         mMIpYcRyrJeVst0mKprJcPR/TVPsQzR65pQTXXRkkmFw5HBH/ZjJNCNh2unpCOwaw5kS
         1E/qq/cbZe0JdpQfTcoozvTymNoOyw1LbAVedArK8FYAbJax+Shfunu6Ln1LjOLZ8kAL
         S+FA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDyxM01V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ji10-20020a056130694a00b007d647618199si1242631uab.84.2024.03.25.07.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 07:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDyxM01V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rolZP-0004R8-HN; Mon, 25 Mar 2024 10:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rolZO-0004Ql-8z
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 10:45:02 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rolZM-00024S-6I
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 10:45:01 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46cca2a979so260694866b.3
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711377898; x=1711982698; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UasTUmVBcL/VKWYDCP4/BH4KdfUFX2g4aOhY6ZmnY4A=;
 b=FDyxM01VIvIfrWm0Iqc9hUQvYbpCgHYG3t2bDx9ROxrqJwzuavKZX7fLZd5H7o/3mD
 NVslglkn15eqSsC4zggB0M7UvHgNR5XT0PD1jjx2IxJO2btpNwg3PZA3hphqAxrurYsZ
 Fvg4rnUApFR0DiCbwP431wy/Ik9sX2BNyz6COtk0QO1IbsUgkvTNosabTODC6r01HHC7
 Ob5TzntZpQzBuy4VVcAU3H9ciTFQTFSMC1SgSiDc6kbAMUwEVMsgDm785bgALwC6zPpf
 /9SdH007buKk3zHq4QA91BJG2TWFcezVB46KIP2ur+3ZjJvGd5eG6hfzBZQqxJifDPRh
 Spbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711377898; x=1711982698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UasTUmVBcL/VKWYDCP4/BH4KdfUFX2g4aOhY6ZmnY4A=;
 b=vb3gGyo9rDP9xB54vAk0T9TLP4vwVYkeKT3H0LLE3UloiY0A2z0Ye+mzb6gH6ncc1j
 eB1nHiwXFpW3rNyvKwPYu0s4qEDfvFNAcUFlqYoXTG0P8XQx+oTx5NBt/E6EOyR2KKf6
 R8oP34QfO7TN4v89hvkFznHlRnfflgSqUFCJoCegR1DKp6wX2IHViZ4yMgNBl8bDa948
 Y/ebmUWW5ulOFxUpkXyCCiNFMPW4xbWNBfDbOj6r/PflJVztNvALC3eKDr0SEqNjG2ug
 bcxXN/iblyhQqmjS1oQ8jgkJG71WF8yaeV/CEkwjNb6nTdCuWuvriAZD/penPhmoP2FV
 mAkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk+Mk/NqstDfxwTz/XBvpHcXxAcbGyONoW52oLtrvwHGaS0IyWN5jek0JfVW0hu6mJXHlHHD6VnVNbQIttuD6nTIJz
X-Gm-Message-State: AOJu0YzufhlAqyU0SswgpFwDInQCPD3bK/c5PXVQJ1vxkYjywwcqyhWg
 9wt5mf8FmYbMLySsRhx6sKyFinWpsOcQgn/5Yu5Oab3fNPJP5XtiSYNV6inVcmlhnPy1b4L/JyV
 iAbEcpzDF2M1ATeGrZ4/rIceUi/PR5Q7qbslX1g==
X-Received: by 2002:a50:d7d1:0:b0:568:d7fe:a768 with SMTP id
 m17-20020a50d7d1000000b00568d7fea768mr6209020edj.25.1711377898145; Mon, 25
 Mar 2024 07:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240325133259.57235-1-philmd@linaro.org>
 <20240325133259.57235-3-philmd@linaro.org>
 <CAFEAcA9aM8J+0RjYnvr8Xr8Q2j3w_TgxHO-gPDn8MaAcAUDynw@mail.gmail.com>
 <e3806179-47ed-4952-a7b6-c256a2aad197@linaro.org>
In-Reply-To: <e3806179-47ed-4952-a7b6-c256a2aad197@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2024 14:44:46 +0000
Message-ID: <CAFEAcA_yyWKo7E1Vz2zQXnjetYWEXtt6mUyg+t4mJXt+nsKBgA@mail.gmail.com>
Subject: Re: [PATCH-for-9.0? v2 2/8] hw/clock: Pass optional &bool argument to
 clock_set()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Luc Michel <luc@lmichel.fr>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: GQVFR1iO3jV6

On Mon, 25 Mar 2024 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 25/3/24 14:47, Peter Maydell wrote:
> > On Mon, 25 Mar 2024 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Currently clock_set() returns whether the clock has
> >> been changed or not. In order to combine this information
> >> with other clock calls, pass an optional boolean and do
> >> not return anything.  The single caller ignores the return
> >> value, have it use NULL.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >>   include/hw/clock.h       | 22 ++++++++++++++++------
> >>   hw/core/clock.c          |  8 +++++---
> >>   hw/misc/bcm2835_cprman.c |  2 +-
> >>   hw/misc/zynq_slcr.c      |  4 ++--
> >>   4 files changed, 24 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/include/hw/clock.h b/include/hw/clock.h
> >> index bb12117f67..474bbc07fe 100644
> >> --- a/include/hw/clock.h
> >> +++ b/include/hw/clock.h
> >> @@ -180,21 +180,28 @@ static inline bool clock_has_source(const Clock =
*clk)
> >>    * clock_set:
> >>    * @clk: the clock to initialize.
> >>    * @value: the clock's value, 0 means unclocked
> >> + * @changed: set to true if the clock is changed, ignored if set to N=
ULL.
> >>    *
> >>    * Set the local cached period value of @clk to @value.
> >> - *
> >> - * @return: true if the clock is changed.
> >>    */
> >> -bool clock_set(Clock *clk, uint64_t value);
> >> +void clock_set(Clock *clk, uint64_t period, bool *changed);
> >
> > What's wrong with using the return value? Generally
> > returning a value via passing in a pointer is much
> > clunkier in C than using the return value, so we only
> > do it if we have to (e.g. the return value is already
> > being used for something else, or we need to return
> > more than one thing at once).
>
> Then I'd rather remove (by inlining) the clock_update*() methods,
> to have explicit calls to clock_propagate(), after multiple
> clock_set*() calls.

You mean, so that we handle "set the clock period" and
"set the mul/div" the same way, by just setting them and making
it always the caller's responsibility to call clock_propagate() ?

Would you keep the bool return for clock_set and clock_set_mul_div
to tell the caller whether a clock_propagate() call is needed ?

thanks
-- PMM
