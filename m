Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1037587lfh;
        Thu, 19 May 2022 03:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm+sSmr7yghL09BBWzn/AirxzW39Z7BGqLnoDfEc3Js5CsYmN8ARcJ1e9N2V1cRCbp7NdE
X-Received: by 2002:ae9:ef11:0:b0:69f:cac1:bac8 with SMTP id d17-20020ae9ef11000000b0069fcac1bac8mr2396587qkg.755.1652956855015;
        Thu, 19 May 2022 03:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652956855; cv=none;
        d=google.com; s=arc-20160816;
        b=oBQSgio6Vzmb7+FLClGs+7ozhkxFZ3VU/YQKWn/bvmU8edlnz3TnuFzn03O8cdSuVY
         rYKM2v0+A7EBTGEWgig1DMLY2sSS6SByEPiO2wZuBeiWC2dKll1pwsvu57yXKJIHEZ64
         aH1AZ37hPzwX7JUpSLkjBmws7+k//c64knL/N9dU/ULUrd3/kWTknqaLZlANKqgdE1V5
         u7YSU+a4G92BzPDb7tCu58IYI9Zn2HFVB3jYaWum10xq5LZJAIN/+NilTet+g0p6ngl7
         hOnsYEWtHijiiJlFN/vXYdF5BE9pOwYjcrr5Kqb1N1auV+/5uQKrNvwxc3HMshdz8bGq
         bq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cJ8Ex0+C3Lr7cRyuU8W6NwXhV58rCbzT1V3iJbj5774=;
        b=fc7dywgFjnJjdl5BGp2q3qED6NnKefE0DAspHJiTIWyUUvTi+yBxailEH6f+Ys9axL
         JFZWlWaXZ4WkTiZLsyuaQUV4viTVurlzwi/LY1cHrqnqWzu60WqSZQ/BHxk+WEmpZD+9
         dQRrqdZ1yYD/yGFYIVkCw4ymZQA3UAS82FdBwLU/zHmsb8zTNqx3eZTeZs/0KRQd2K/b
         dFpTVJAKxjOM++i3/mMjun8d38Mxphj4avdnG0d4AAXukdmNzCWAJkP6i5ygR+3qxJsu
         AG4aIbeaYGgyW05cuoMRz3m5RpTthZgqgOYCmrf5M0SQ/vGGUYhsvY58zq14r6nnXtS5
         Bp8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDmNgFn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020ac85505000000b002f386e0c8dbsi700685qtq.768.2022.05.19.03.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 03:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDmNgFn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrdaQ-0006QC-GL
	for alex.bennee@linaro.org; Thu, 19 May 2022 06:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdZt-0006Pp-14
 for qemu-arm@nongnu.org; Thu, 19 May 2022 06:40:21 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:43999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdZr-00029h-Bq
 for qemu-arm@nongnu.org; Thu, 19 May 2022 06:40:20 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id q135so8270803ybg.10
 for <qemu-arm@nongnu.org>; Thu, 19 May 2022 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cJ8Ex0+C3Lr7cRyuU8W6NwXhV58rCbzT1V3iJbj5774=;
 b=CDmNgFn7Tc0OJ5HjMklFGmAh97JPcGS/rSH4ZTHV3a77YXTQaHW2mmcS2THTmPEWAQ
 35Mi0pvKqvZMZ7DMojPuS0ZgLwkcFWvG6RV0V47BF8UfHfL5Fx6Tkc7PIKfCX7xBlMhm
 NLNAQPOqFGFbpLk8Q1IeiU/IYh2dSCQI7ffn3XfsAeVzB5JeRIf/PkDIgcdFMoqHEiyI
 f49RnTf6bYUaRrarEJqzib8G42XRFxa8StwqwwEVXMHQbPLrKb9ICNftykKOpUSeX4Cc
 hr8CvdrLWXYlTdX1XL2l5suOwAAEieCkQr8aUYlCPIIqjAeg/DVYsrxqsl4tXbgfPPZj
 SmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cJ8Ex0+C3Lr7cRyuU8W6NwXhV58rCbzT1V3iJbj5774=;
 b=A2zl1q8tgfkFKDhQJ3mhRt3dLnSbwwhWwP9ms84X2ODBlUD+WtDQJlarDUGBME7fWw
 AfSEH3dF+4QTC9T1AcrWTxS2So/36sxDrrIAI9bSliw2L1i3+W4OB4QGAnJWTx/Ie9Kz
 XeX/0dpLeUhVUTOhcb7UfhR5UOJvt1wQD1wqAvF+4ZYC44Z9TCyCwXE/AQY3X8c+JioM
 h7nqtKAuiA0GlWCYjUywgnrrx/tE+7jHXX7Ka9uT3/XjeS5Fk/MbznTsEVV5k5auVoAb
 sK0bXmnUk2CbDooEvFsQYfyOgHzIDBh3ZVRBwLShaivc8aPXwlPACjQFv47uZsjhUAy1
 yR6g==
X-Gm-Message-State: AOAM531xijdWsPcc02FZ0TCnl9//UyxptUc6uxu7YpuZa1QXfLYLu9Pn
 //Xy5XC9mSkSLGhuVH3mytfbFvTXPgy0Dh9ORWEBdA==
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr3595842ybu.140.1652956818018; Thu, 19
 May 2022 03:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-4-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 11:40:07 +0100
Message-ID: <CAFEAcA9SU0vXtzw76HkN4wrSgsMyBNwA_bHGa7x0u0rtNe4LQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +aZdzAhxZsPC

On Tue, 17 May 2022 at 07:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need to constrain the value set in zcr_el[1],
> because it will be done by sve_zcr_len_for_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d2bd74c2ed..0621944167 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
>                                           CPACR_EL1, ZEN, 3);
>          /* with reasonable vector length */
>          if (cpu_isar_feature(aa64_sve, cpu)) {
> -            env->vfp.zcr_el[1] =
> -                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
> +            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
>          }

Not all the code that looks at the sve vector length
goes through sve_zcr_len_for_el(), though. In particular,
this is setting up ZCR_EL1 for usermode, and all
the code under linux-user/ that wants to know the vector
length does it with "env->vfp.zcr_el[1] & 0xf".

More generally, it seems to me less confusing for debug
purposes if we set zcr_el[1] on reset to a valid value,
not to some invalid value that we're relying on being
coerced to something else at point of use.

Incidentally, do_prctl_set_vl() also sets zcr_el[1] and
it doesn't call aarch64_sve_zcr_get_valid_len(). Should it,
or is it doing an equivalent check anyway?

-- PMM
