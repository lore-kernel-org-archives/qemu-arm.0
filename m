Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp688545lfg;
        Thu, 13 May 2021 10:20:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2gG6IIyCeaZrArQzRxcGIFAjY0CbO02Hj6pJaF61EVF7oihSdLYJgocP0q1ijgLAoda1R
X-Received: by 2002:aca:340a:: with SMTP id b10mr3825874oia.95.1620926422832;
        Thu, 13 May 2021 10:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620926422; cv=none;
        d=google.com; s=arc-20160816;
        b=BEsUGjHa/pHjEmOZUiSSerRd82b7jVC0COB9rYrpr0aBltWnfPz/vXilot4JiIrIKT
         xwZdDB0T81AHE08qPztGo6VW4cYk3Pjg3GDLc1dWcDMl+kfC4qSI9VOM6IgtbfkwcvmN
         XUtTdhQvx8SEGyIHdvqqWEJUS1g/7I5qNYBu3iUtpRQz1xWW3PFChv/3rjpa0sbh2W1w
         8ZBzLZ7QCueaECYnCfYM9b0V6gXulj0340xph6GqhqJjc9LRI2xAmtvzhGX1b/tlA9T/
         1Y2VdTWX6JSkdB2KNn4Q/CcRd06eJu5jbFW4X7iebYTe+vqU4WYdRdv1pDkEpVfkIwPK
         oz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZLuyzyNVeLIrVACX8HkhS4CZIGlSdTCecVtoaIhB5s=;
        b=ja4miLWHEwgd19eTybTzSR29E/SdGTI0HR7oOf/0EzXZhS0rbIzCN2jIwv4NPQTus2
         9/p9K/b5n/2G92uacYtif+7stXtVKXhyR9ZxQUY3CvPmOd4skxmMlLDlrapwZ2ApWFOC
         xfMl/y4hMtNYV22g9AT5iafeUEdtDvew5l7ZuiDL7cupgQ84z1oXAjzyNtODO/fD31ZC
         Q/HW09G/8b79ksw8MDnyG04MOpaR2Ot2kzWoS+B3wJ7vvZZryIGN9rTX8Pm14B6HcNCN
         IK/oRi8rv1IE9kgzoGnsoOZiR2e6wj0RtouTttLqcqcGMhDrYBOUoCoPSUDjHWia16iB
         SxvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YqLeDUCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w187si3666433oib.123.2021.05.13.10.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 10:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YqLeDUCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhF0Y-0007ZJ-0F
	for alex.bennee@linaro.org; Thu, 13 May 2021 13:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEuC-0007D0-5q
 for qemu-arm@nongnu.org; Thu, 13 May 2021 13:13:48 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEu7-0003U1-Oe
 for qemu-arm@nongnu.org; Thu, 13 May 2021 13:13:47 -0400
Received: by mail-ej1-x631.google.com with SMTP id a4so40925218ejk.1
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZLuyzyNVeLIrVACX8HkhS4CZIGlSdTCecVtoaIhB5s=;
 b=YqLeDUCJXwshuxbulIyDdN7ASpc63oNRWd/YFcEGJ56jwP21GhHKrpkKhsE6w0uwPo
 N4s9/+aTiKQ/t93zxHTnWHDvp5273MS0cV4gVYqLbFTM13LAWM/d871F1JnboZ2A0/Kw
 /RB2jNdG+xJBrra/UzcNjyr42YYYogEFQ/m/HKCf+k66MkCStZPBWEwv1CyPhm0XuHZq
 xQ63zDqP+azeCaWSzvC6oKzh+sPNh4QpdC8+8X9Gxb6uzpUCDEevRCU5At4FDt2cP9un
 kZTtS3ZVgsVxQZHKghRSzk540gBNsJgZXWVCrHdtTzGLXhim+Uh39Bn1cE0gCgG+FF7v
 SmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZLuyzyNVeLIrVACX8HkhS4CZIGlSdTCecVtoaIhB5s=;
 b=iOFdtA8mQ9Vwrmhdgys857IO/s1Jvs3YoETgHvdlB2Jb1g9x1pmHfZkDVnb4h0LbtX
 H9xzUlWomNN19yEX8/y+UtBIaLwzdMIP3L3VtmZDZTucc4AT6/dpfTmaCExsZxVrwwNC
 +fSSCHV9hskT4iYf+b0R2YRHS09gEBiWQej1hI2ngSFubB7ivngoh+ixh6cpkHwN5d2n
 sOQMH54uRHNnl2WPPxXvdpBvAGtsNiSYJ/OCEAcrtwJtQOJNBZSLLrCn+Znpo6A+1XYp
 j+S1xE4t5ohg//a0qPG/7lSFCIyaJdLAD4mB1qAnHrG6Ld9P+aj4NoH38ecafV8v5zx+
 H51w==
X-Gm-Message-State: AOAM532pm56UBox/oDcMCFnN9FDCfPiPnHG/MFrF4Zu9X7iHg4FqtqQ+
 QuMwvvg9ciuNMhtLC4dn9SPXGab+/rbORS0BQdXMqA==
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr24677ejb.250.1620926021714; 
 Thu, 13 May 2021 10:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-76-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-76-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 18:13:30 +0100
Message-ID: <CAFEAcA8ro4Ya9rqgHG4DzxVQDo6p-j39UiSZ_ZE1HvzLpu2q5A@mail.gmail.com>
Subject: Re: [PATCH v6 75/82] target/arm: Split out do_neon_ddda_fpst
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IWBxYL6BoFgf

On Fri, 30 Apr 2021 at 22:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a helper that can handle the 4-register
> format for helpers shared with SVE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c | 98 ++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 55 deletions(-)
>
> diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
> index 45fa5166f3..41a7b2208e 100644
> --- a/target/arm/translate-neon.c
> +++ b/target/arm/translate-neon.c
> @@ -151,24 +151,21 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
>      }
>  }
>
> -static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
> +static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
> +                              int data, ARMFPStatusFlavour fp_flavor,

Can we keep the UK "flavour" spelling for the argument to match the
type name, please? :-)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
