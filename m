Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp287280lfb;
        Thu, 3 Dec 2020 03:39:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5cSiTU7fpvXIniBqFrLJkm0BSDP8j36qpqlOfxAe2YP7F35+sJm7EDh75qQbGW2+9hTEQ
X-Received: by 2002:a25:1cc1:: with SMTP id c184mr3990550ybc.284.1606995590326;
        Thu, 03 Dec 2020 03:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606995590; cv=none;
        d=google.com; s=arc-20160816;
        b=YH0GXsSfBiQqm9NIlrD72oYvLb6EeC+dLRMF0fXf+MOs2glesAIdh1d1OqEZjJ/87w
         HgedDDDz9bnMLfODTo82audpjLKUM8pwIae6jbUKNfTWv9D1Cadi7s5q2Sg4bjZrh8jv
         hQZlS753mIiqOq+Nth0X81Fq+gstJa0znndG1Tz5fOpbdAtNXfG9PCjaaI76tqUbImJS
         +Smki7M9veHRAbwP1NUiGTVH1awtOOEHXNRAX1M1dmD04xs4VPmPazVsicVKy5/WSt4E
         kj/ybl2RvU2aeG9y5oQwzEJ2Y+ds2oQNx9npQek8MoBAt3rWxULAvBW7E0QYTlejnWhp
         B80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RbKXYjd8/Y5arVN6NTbqlnensKVNUl92Ie8cb497S/E=;
        b=Iv1rNLOCQ2xgKr3qW3NihYyAo71FiU0D4ms6rbx0EYqXGBZnIcHFKCNS84u7ICxlwo
         G4OBRYiBODLNe6Qarv3A+v3nH/sM6DAA1RxMMYx76lOxO1odVphmbVEyeKeCseyijl7Z
         AF1CdS6ImH+4zdumeNxFHTg78xIhG/cYQT+ZpOf2mFQBioBxahY9AfnpEbGxEEbU1BlO
         0T5rUZ3sXvGU5DBWr0XejddnsYOcPVtgsb+hTUOpSzY7xwM5aMU7v5Zu4fx3C3uMEiIC
         IiKt1v2PQAZ2crimeY6yjkZwyxap4j3srxFANuMm4KLXPONgLwOWskaqwEgwXxyfG1hw
         Ns5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tDfhgsQv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si1505230ybf.277.2020.12.03.03.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 03:39:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tDfhgsQv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkmxh-0004bE-MO
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 06:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkmx6-0004Xs-Cu
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:39:14 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkmx1-0000CE-R4
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:39:12 -0500
Received: by mail-ed1-x542.google.com with SMTP id c7so1737751edv.6
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RbKXYjd8/Y5arVN6NTbqlnensKVNUl92Ie8cb497S/E=;
 b=tDfhgsQve4TXQdjZKrSUJF3MVQirO/Y2EfisW/MZnaXIFL5wFFnn8st1sPOuvIbo3m
 CF9dhz0Vs2S1IQvAWsofMRNdI6buyCke+usY0UXOXBsp+k7LPp/5l4FERHlHzCDUi1jx
 Xlnsu8Xf0bUPOlC6oShmsEuJFc6aJ5/6MaJJKbDEP63DfCiYqe2hKza+iWkzmKyUJIP1
 SkjOQgUJxWfzm4XPaVH3FZ7j2e1QDnpOsLjMC9/QpSS6L9eSgP8AF7i1Zn0xuERxKPPb
 ejxzDbbXVl/+twwbwOFU89wSlMDA6f0/1HJtUUg+blQkateLpkumShbBrdaUx4XZMjPi
 Kjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RbKXYjd8/Y5arVN6NTbqlnensKVNUl92Ie8cb497S/E=;
 b=bl2plWaGQeCdR0ouO40VMtW1gplPILYDX8lctkiH8M/VW6jEVSX9zppobgDxzz6a6E
 a1HPJdQRMYiXuM1YVs5MWh2sgZkG/VzxYWN4pR7/XqZ6rIVpuBtbBSKAK1XiIwlQwfif
 RNv3DWMXqgtN0sIuXcxsou8fyW/hSQykEnc0Kwggyzz1v/nlw9YwbcvgJ8OTlftxZPar
 PXleJ4jN67E3msJMA49j+86vWu8xac+7qpQZ8jSHvZ1rPaU0D3llscionj8/9KHxOICe
 DYhxeJ8hahn4nYXrPD+BvXHlHrsVwfhMHSpWZxhGydkVhp1ijjve/3swul4/KjfPTEh2
 I8xw==
X-Gm-Message-State: AOAM532ng6a/R1U4WmWEx4f5qwlGw6xwBfNeuOLigc6QoKkX2pLAJJgm
 JXmsWXJ1obpXGg94koPfio6CG4YZGLfxfbiz67EnVw==
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2511115eds.146.1606995546039; 
 Thu, 03 Dec 2020 03:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <20201125040642.2339476-6-richard.henderson@linaro.org>
In-Reply-To: <20201125040642.2339476-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 11:38:54 +0000
Message-ID: <CAFEAcA_U9XMqJmYEWm340T=MWuzUgNFZXC58vD7QimD2ny2n6w@mail.gmail.com>
Subject: Re: [PATCH 05/11] target/arm: Enforce alignment for SRS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uah88Zf1grsh

On Wed, 25 Nov 2020 at 04:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4406f6a67c..b1f43bfb8f 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -5124,11 +5124,13 @@ static void gen_srs(DisasContext *s,
>      }
>      tcg_gen_addi_i32(addr, addr, offset);
>      tmp = load_reg(s, 14);
> -    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
> +    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
> +                    MO_UL | MO_ALIGN | s->be_data);
>      tcg_temp_free_i32(tmp);
>      tmp = load_cpu_field(spsr);
>      tcg_gen_addi_i32(addr, addr, 4);
> -    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
> +    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
> +                    MO_UL | MO_ALIGN | s->be_data);

Having just come back to look at this as a result of reading
a review comment from you on the v8.1M series, it's a bit
unfortunate that we now have to remember to factor in s->be_data
in every memory access. Previously gen_aa32_st32() got this
right for us automatically, as well as being able to provide
the right sized MO_UL or whatever part... Can we make the
new API a bit less awkward ? (I suspect we're eventually
going to want to be able to pass an enum for "always OK
unaligned", "never OK unaligned", or "OK unaligned only
if SCTLR.A is 0", for that matter.)

thanks
-- PMM
