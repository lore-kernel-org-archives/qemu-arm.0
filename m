Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1482464lfm;
        Thu, 25 Jun 2020 09:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOuARn4BO5O5dHjcFcAxE1FusGICaKiDl2hC3tmIB7+ljWHNWUFi8rSLCjjlNs85reVZnq
X-Received: by 2002:a25:ad45:: with SMTP id l5mr49735854ybe.401.1593104040787;
        Thu, 25 Jun 2020 09:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593104040; cv=none;
        d=google.com; s=arc-20160816;
        b=ebReAfvJKhNbFrhJUSDTRu/5/PwTnLLwyb0LheQBx10P1oOMYmAS2FCqauCGIaI8hy
         1JLOeVW3dflwF0GEZtEcZhshe13NNNlr02avE5wxDXMZN8NrEE5PUuT9xsnAxfI1qQCv
         lwMV9B3fRDqk52/fTK2esEQ2KASiVKCkWUjqvGBUt06DFrRgarIQwJV1n+3ABa1awucG
         Bo7CpI5LwheB+hIGWvokEBZPXVMsVZ/zU9grfP5QJT2q/npVub/NUnQbrpl0/GJ9IhAm
         uAfxW+4zZR3PC/qb+zIgAexP7D2C23qmI2IcaVYdto9j0kT8MfR1WnKvn+H0OKXszDoy
         3ZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GEFIK9+Y3NSLP4TbrylgqPOAsytgb5X4H5Ke7pVQQy8=;
        b=v/lbKTl3mn3GQbbEy/9Ua9hiTuUcW3gbiufdKE0++QZSHeWZ7MkXbm6jb19HyRiKJ5
         8osoGAB46VJZKLwXtuk1QmXjOLq6dKApE+z5aqYX0xwOEXoGYeOVKlm1Y5bOkQ6MQR9F
         Ztdc5suowk2SPK5his4Zj9Fn3F74lLbml0pLpWCcJ9ndr3PPXCW6IbmcPj3TcSxgEwPP
         k6mjBcvLdE6XBsdSfWcgbImNLdZmeNq1dvt9NFhdxOLJMJagH8WxGo0bxgwDCRqxedCs
         0e8wRYZXNLTcZmNuEPyslRVD5zK6fTkJH4DqFqa586YYkuw8uWc0TS0ZlqafJuGa1HGO
         GtTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jJ/1wvaE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si22189360ybq.160.2020.06.25.09.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jJ/1wvaE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joV8S-0004yb-5t
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joV8G-0004yM-Fb
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:53:48 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joV8E-0003zK-QN
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:53:48 -0400
Received: by mail-oi1-x242.google.com with SMTP id p82so5571863oif.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEFIK9+Y3NSLP4TbrylgqPOAsytgb5X4H5Ke7pVQQy8=;
 b=jJ/1wvaEgNFg81+dUrnrmkNWdY2RSKkf2IbaWh+yiWRu9uArI7bg4KRnAnH/Wdleqi
 FIbTaC2fC7lPCVmBgSdqzYZTBGgzY8leLLR9IxSrINT0g5CxrrbykhDeI6n7LES2bPZ7
 dlpb2vd1PCCFLuEFzCeH24hxKphx/CqfRJ0hAC9aHaJOneKS5+sJC9svnwxhZD3b1b/m
 i/kqDTCDnqGlRvukdYIVZokV85T5/9Du3RlrWScJbCXYwXltpumCXadbMGVZzjJTyWMf
 2mkeVOSEfSQPM48YV7eTbw2G/0DZsiLKFLurYwD4gCwF6NQuL2jZlUpQu9tfl+HShINM
 QFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEFIK9+Y3NSLP4TbrylgqPOAsytgb5X4H5Ke7pVQQy8=;
 b=KEsC46wXzOaipJyOuHtm/fAPe2uGx3r0/WEH1VZXSXlkrrT75rGqrmjc2ZjwvtQUWh
 oIovw1T+3vHRRC2HKfuYbiY/ewt5YQ3Dg2zZ0KlPAJ5jjN08QLdoWrR1WEFYBGOwQFSc
 NQwHvnc6F3/ez6kyBlcE8N/aohZD4wbVuwAQiZN3OsdHk4YIl1FQiXXVe4pCzLITmbgj
 cpN0ljcxjjgNK4eg0VUmOAPN2ehuZCMqC8m7zQkJ0ifUPb12AYutZxBJXF2cznrMAa+B
 1fcCTSle4om2kab4H4i/0/NPZsL/YMKIuVNX91OIe6twuS12wYXjNufWwYfMeGYo/gUo
 Qukg==
X-Gm-Message-State: AOAM530MnDJPh/W30p3GZ6aoGqKFAiOsuj3DhADyuUh04IHS3Uw9wZUq
 J4eTNlq/aIA2scaPm4gkoXC2EfiR4J4Cd6FTQf7kqg==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr3055310oia.163.1593104025807; 
 Thu, 25 Jun 2020 09:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-12-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:53:34 +0100
Message-ID: <CAFEAcA_+f8HFX0ncTk1cgxavG1kbG6RSHrqrxnz3FjNx-N3b4Q@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] linux-user/aarch64: Implement PROT_MTE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
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
X-TUID: 2Gq7eXiNqBFt

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remember the PROT_MTE bit as PAGE_TARGET_2.
> Otherwise this does not yet have effect.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h    |  1 +
>  linux-user/syscall_defs.h |  1 +
>  linux-user/mmap.c         | 20 ++++++++++++--------
>  3 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 3cac7750e4..7ff10a8b08 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -286,6 +286,7 @@ extern intptr_t qemu_host_page_mask;
>  #endif
>  /* Target-specific bits that will be used via page_get_flags().  */
>  #define PAGE_TARGET_1  0x0080
> +#define PAGE_TARGET_2  0x0100

This is the same as the bsd-user-only PAGE_RESERVED,
which seems unnecessarily confusing given we're not hurting
for available bits.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
