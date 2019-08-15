Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1883866wrs;
        Thu, 15 Aug 2019 03:35:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4psIgMQyC5FjCGFpTXD2UsU3ED0flSVzbqCSkMHdCsSVFOhvC2RQVUeWAqkcAYJfMW3oI
X-Received: by 2002:a0c:db93:: with SMTP id m19mr2691103qvk.96.1565865300717;
        Thu, 15 Aug 2019 03:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565865300; cv=none;
        d=google.com; s=arc-20160816;
        b=r7OTOzaQ7Odqfv6NTakEiwYfwKO/WCmmEp6AwdR3wOrW7U3G6kz05Cm4WFVzt4wxfN
         OWOsb5GOgyeJ5uiff8fosbhSj+0N+l/rOLJa4R++eI6lZS2HlE1FqOOepQodo9YRmHx7
         ifrEsoW2kr9isjIvQT311Shm8reBZix7RhVi7oIp+3HMW8EjccD16HR8XmBOVFw/AZDk
         rr5cozwgL2auKHtOFNiqBZaqNoP/y66iOw+9GRSCE28EDZ/rhpW2AJsHDUzdti9LqdFm
         WQfW92Rv0a4lpeWd8oUpdEwIPqWTDBi5nMLLlEbbEJDcN9jOk/777gFvJ6FAPD+dluF+
         /mUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuaRNQLmLhAHwn7C4YMQ4QBrE3stkQ5CO7o/igmRQM0=;
        b=r3GfTnu9h4s3QiK69NDRJZb6VIHY7dTNRbQwEpKlVNi0QJw75BFXWOIaoow8uIxz6t
         k7H7oNB1VZ0F6gqHIm3vzHPPd3skwZiFkASjmeE81OWRd5HgWA1UiEdRVu6/mWggPfm8
         16pwWkg0+my5/GUtZHYHLKXUIgcGQZL/sTfB0yBVs5OABXKl2sGF5Gd0agJbxp4j0dm4
         jUnvAyBf0HyHjqATSPe5F7jlzxVse47Yp912keiAXsxMh/+41QO74FnM8NkKm9GQ3f2K
         s+tfQjsauaiuOvlEi9L1QcrAfQATKdZIEvqhlROS6NUNRmmaBVMRtfk1XGnkheDbhlxR
         SvUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wg+w4F+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si1232556qkg.67.2019.08.15.03.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 03:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wg+w4F+Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyD5w-0002ci-4G
	for alex.bennee@linaro.org; Thu, 15 Aug 2019 06:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyD5m-0002bW-Pp
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 06:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyD5l-0000hG-Ni
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 06:34:50 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40042)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyD5l-0000gg-Eg
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 06:34:49 -0400
Received: by mail-ot1-x344.google.com with SMTP id c34so4839855otb.7
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2019 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wuaRNQLmLhAHwn7C4YMQ4QBrE3stkQ5CO7o/igmRQM0=;
 b=wg+w4F+YeLVZk/eUMuhlqZVJ38mcwzATYaPXs4+FmpCFsdgRPHDuus4jKb9sICuyMa
 AyG7nZWwb9igjeBq3gTLP3+AvxjSbiDMMmKYhSxhj21VEan4izX3wtdvbLEK7fW7g3ke
 cwac9RMRevFnpmhZLPmGtqrMeQ7/8R5fBN/bLooZSvbdbBhRSCmWRBMV1HVWLJJV1vJs
 bYCp9uJQ+CngDFuwrGXCf1rg7ZPncERTVp2myqoIXfA2JSTnPpki6NnEHeP8A61/ikMW
 qaPiQdF5NlcGLTxREU84ECu72H0j4ZUo5q+Qibl2GJUEKr+UGjyYBz5cuLYHubhqaHGR
 tOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wuaRNQLmLhAHwn7C4YMQ4QBrE3stkQ5CO7o/igmRQM0=;
 b=iWiA41fiMNLhLTLq3+SSt6sS0RkKd87EXYHnijYs4vY2v2sxnhhrdKCDvzGAKrY4h9
 CUVa7tt3QGyIDCMD9qQUvslNBidis8lpRWfytaU/jzjECvqJWRE9TZSJJldvo8jSO4v5
 OGHzCytezqZv/zbJdUPjrTpHBuZ22BNht9EkAETAf3pvjWO1QkRf/dYKkBC0oRS4VOEl
 Flc8eJpCXVZJ1FuTr5ndQwQVHFs43hZr+1UhdT8HhPuZK2iYl7BJzcNaUe6oFbUIMPR+
 2XGWECZPdbo42M620FCzjP1AVv5qAhzHJp81cAnL7Rw1kBIA6x4+6ZSdNFNoyuoRO8z0
 MMSQ==
X-Gm-Message-State: APjAAAUd+G0vt7Af9jka+yCshzJakXTUmMUr2mNHcEeG1HjznBJ0rhvU
 rmZJrWrEzo1BUCOoNhKBDmeBBld9UKOq9SO6RuNhcw==
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr3053755otc.135.1565865288391; 
 Thu, 15 Aug 2019 03:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190808202616.13782-1-richard.henderson@linaro.org>
In-Reply-To: <20190808202616.13782-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Aug 2019 11:34:37 +0100
Message-ID: <CAFEAcA_TiXH0KsqKVwjaC9bSqw2sUCvAGv3bxYecyfUkLhHF9A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 0/7] target/arm: Misc cleanups
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
X-TUID: oHDSh3C5R0o7

On Thu, 8 Aug 2019 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Some of these were cleanups that I was making simultaneous
> with the decodetree split.  Let's do those beforehand to
> make the split easier to read.
>
> Some of these are new, noticed while I was in the area.
>
>
> r~
>
>
> Richard Henderson (7):
>   target/arm: Use tcg_gen_extract_i32 for shifter_out_im
>   target/arm: Use tcg_gen_deposit_i32 for PKHBT, PKHTB
>   target/arm: Remove redundant shift tests
>   target/arm: Use ror32 instead of open-coding the operation
>   target/arm: Use tcg_gen_rotri_i32 for gen_swap_half
>   target/arm: Simplify SMMLA, SMMLAR, SMMLS, SMMLSR
>   target/arm: Use tcg_gen_extrh_i64_i32 to extract the high word

Applied to target-arm.next, thanks. (I had a comment on patch 6
but it was about the tcg docs, not the patch itself.)

-- PMM
