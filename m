Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp524401lfg;
        Thu, 13 May 2021 07:02:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEeGy2pjUrtixjdsab1kArYochaFMxXx1/6E0jc2zdp+ynmV4AegaoLgS6nUnXHRTCDTFL
X-Received: by 2002:a05:6638:2157:: with SMTP id z23mr37515120jaj.35.1620914561279;
        Thu, 13 May 2021 07:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620914561; cv=none;
        d=google.com; s=arc-20160816;
        b=S8BC9K/nl0QQbB/6pdj1k1gBfU+xarmKFNbAvx2+cHu1wYFybV7Rj1mwQ/Mt/jenG1
         ERvlzMCRJWsligsHAbE5f97nsKjNzzZuU6hRRt3IClwYcw49km4TqBkZ6cZ/d+BNwFCA
         a2Ap8pRYljw3xGFlO0+l9R7PrfZcmAdGu8XLL5oOEyTTEm6/CuFO7OJGtx6TDzte6P90
         DZwtfNpj229ZZgNGg00J37tsTfgVty0ZsAk1d34eKEiB/WEC1ShPlJOmX/4WAJHINSX5
         WDKynr4TabhrKRJO7WsY75thLcpTh/rNO/FhqJXw/WbbGb3Yo1KsJy8PV8iA+vDLSieV
         ADfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUMLPrrk9OFAFKO41/XgXREeww3w4ZvYxsaZUfnNUhI=;
        b=GhJ+jxEANsZ+QF1gHmsTLZ35qYMc02Rxb7JntpIl/21e8Vl7vj4FJ1QFQ4rOp/TL+U
         G659MGP3eA/DEvuTh/Y+dsYl9YVwSX/+GMHWuDsLfJpcfbUNbEHU4E2/QAvM2Q32it8o
         zW6Nhcg+7H6NSBhKqDeuB0Z5iOUdczXzkYdW67F3z948GOXt6AXFAdS9neuDhiaY5hij
         j5Pk0sbA1jKefDx6J4wr176Lhlm5LxaZuUrJulj4itXA7XCUnXCZit3mPmg6i1ARl2Hr
         8QXTlXKQqv6IdMM/A/ieYbFv62ytEGfhAXvopP5OtSS1RaJFfdEB7ys2djwKAzPWHAsW
         qCvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XbJ/F7N3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si4102276iow.62.2021.05.13.07.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 07:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XbJ/F7N3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhBvE-00022X-JV
	for alex.bennee@linaro.org; Thu, 13 May 2021 10:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBux-0001yH-Ls
 for qemu-arm@nongnu.org; Thu, 13 May 2021 10:02:23 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBul-0002tI-Sn
 for qemu-arm@nongnu.org; Thu, 13 May 2021 10:02:23 -0400
Received: by mail-ej1-x633.google.com with SMTP id t4so40088556ejo.0
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qUMLPrrk9OFAFKO41/XgXREeww3w4ZvYxsaZUfnNUhI=;
 b=XbJ/F7N3kpJGiIItavj4N1IVk8uHTdH7cXGr32qQj5Upz/k0Oou2CGy6Z6JViu2Nlp
 GredxLyxF2Zn1lSCgADUQ9rsrxd43w6N5zeFgiQ53C/sKnqpEYnJckdiBNMTPVY5TZWA
 gW0jfyMX9hhI9ZwXKnHb0uEQ0NGLbST9SkD+lxCHewppMyd4RcbCRY1mb1M2M/RbfR9h
 M4Ad8f4a2AsjgqQ4IK/z0Ld2qAt9OXr9v77IedmOVWGjd8aomyukEBBLUrjKLDJvxO36
 unG4bpvQ4RgqgRdd3T6jEREGIvaDJEFi9XoZKbo8vweoHSNbOobzH69u8PZ1RsqbqfTF
 gUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qUMLPrrk9OFAFKO41/XgXREeww3w4ZvYxsaZUfnNUhI=;
 b=lp2wBeL9KY3whThCovfu6xB8G5WCj/DieQAp4ZBeQRAGFrysm6+mdMufjM54RmjU3h
 kxD38sM1tm/9q768xaqxfHNK6Y2iz8IdZspSHusojLXhPg75QiwpHRXcRYRBI5fBKsA0
 HeBHp9NG27KLWbtJUxSZ6OMCOauA/Siu/fAzIwyHMl2GcGLUh9yFhlmFUfuH4ROALzE3
 +kH4wt+Tz0qA8COs1CzBa65isXyuOU2aYRVpXG+2kWEGP7yLVjN/mVU6hbSnwsoFHMYU
 V96rEcdPV/SWxAAoTxmaaD26WXW9FxKjT5HfziZN76DdcWoRCMTIwy8tudQDRBwwPOIr
 5cpw==
X-Gm-Message-State: AOAM532eiPQ85m3NFYu7YRO9BYQcAam7H64z92DyeK2n2ab65vsBdQOs
 8l20qA23sOJDLdDSm0ijQ6WH9E3f0b1wCEXFIehWGg==
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr13271133ejb.4.1620914527580; 
 Thu, 13 May 2021 07:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-66-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 15:01:55 +0100
Message-ID: <CAFEAcA8nOjVCC=PPOVKEKHg7jZJpXtnYga4Yd8KJUguPabv3kQ@mail.gmail.com>
Subject: Re: [PATCH v6 65/82] target/arm: Implement SVE2 FCVTNT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gj4zdwgEbfMY

On Fri, 30 Apr 2021 at 22:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve.decode      |  4 ++++
>  target/arm/sve_helper.c    | 20 ++++++++++++++++++++
>  target/arm/translate-sve.c | 16 ++++++++++++++++
>  4 files changed, 45 insertions(+)

> +DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
> +DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)

Shouldn't these be using different HW and HN macros ? They're
operating on different type sizes...


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
