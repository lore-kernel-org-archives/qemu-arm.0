Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1354335lfb;
        Mon, 19 Apr 2021 10:13:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNF4Ox+7QyjKl1sIRWc2ABryEMSyKNWt8M+MjCALBWnMFcuqTOAL7PIs/hyuptEmultBvT
X-Received: by 2002:a05:6602:17cf:: with SMTP id z15mr4967653iox.162.1618852437185;
        Mon, 19 Apr 2021 10:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618852437; cv=none;
        d=google.com; s=arc-20160816;
        b=xOYvLZanz3228mBNFs4tDBwA4+7/1klScn4U9jArD75Ila+nDlgONCeQgbjfFBxZ5o
         96WeglGryPC+Cnm8ZnQXP1+dSKrsYUjIm4KMU7R3qDQjpK+ObpeYtXfsy/uxngpdhlHc
         iPpaxuAvhWLhc4VGE/Nd2xyMvCGmhMa7dZhfGHu78913lAMo58QYO+h/nsn2zSaj0vcC
         VI/XrhZ0ITelgdTHi+Ca6qDQlqO5uqFIh1kGrsPtzZrf7+EwfoLzwTogNnSnatN4oLZF
         AgYmuq4IdvIenoY2Icau+hjcY1a/1/wsVQ8CK/qHMDjJ6l5cqhUTX/YbtmVczSZQEVQC
         BphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0oIcR+jn+P5ZI6cd1tZwddKKZQ0GTahtJj53SbGnCNM=;
        b=ZXRvhmSNPg+4mvDRoJ0fgJmgjJA13ZYcJpVudEXwbHTLZkZFlo6erZULO3lbtK/ku2
         2hfDtLXjBAwzkL1hYZa6pf9Y3v93oWzT/kjfa+fpgwgCUn1NR96aetZUAiMI3yd3Vq8a
         W0RLqVfF+jdkGKT9hOSwvyx327bjL73HdL/kCvz6T0jPHh9Yy6FXjPnuRXlNjBkc+m2k
         ZtNz1GR6E3lqQKjI/dgz6peu07OKysjkLxWsrXUi7VPHoxp7dRfcUYHPh8jxlhdl3qP4
         Lv/gKmRfFgm39ek0aI9dqS7Ny8U7QlN0O2pawPpWqRTmc4qMMauIjadB7FgRPYU1f2Ig
         uPig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f70Huaoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si14899802ilj.155.2021.04.19.10.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f70Huaoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXTA-0007Fw-Bn
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXOt-0001jl-Vx
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:09:32 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXOq-0006GC-7Q
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:09:31 -0400
Received: by mail-ed1-x52f.google.com with SMTP id j12so16601010edy.3
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0oIcR+jn+P5ZI6cd1tZwddKKZQ0GTahtJj53SbGnCNM=;
 b=f70HuaoiOIxUGUye/I4zQKkQJ2k+b7i8lIbk3aRej3EOLGX3/yzUm7tdtfJb66zm9b
 RR5djr3TRQRq+zk/TEwhRUKb3EUJzJJSPL1plTzhz7tvXBpYbvGRmytHQNMzAUNS8hn3
 hOH2NQXbUxXhDvb4U9hPKDYxD5GYkKwHc32nKPm1NDVXMuhsquxcc0Wm+sJgp/RqL/Z5
 iKMgiaClea+NMdUf62lIf7VInrgGVjD7pJaWlS0meJL2RdJCFSRnMroGW/jJHrHBpdkr
 ho96KXGxHBJt+YRTE8Djz8Mvt8OtwnMm1PAIHWbmfGe2USD14iPy7DqSvXg2NFT29dw/
 keXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0oIcR+jn+P5ZI6cd1tZwddKKZQ0GTahtJj53SbGnCNM=;
 b=HDPvsDTULthMxfyVQBofMyhdbaWYUDcunsa9FSjE9UwKbFcNNXuDBds6d3zjLabNlD
 OacM7oUSP/xcU1RQPiY6IW668ie23WXYhualdY+Aj7m3IAmqhv6A/Cj8dt5F8LGBd1dC
 vi3MoV8PCiiOlu2YMsUiqM+fMZPpbtW/EQZ4UhjpT9fMfVg9UgfB5pDQTgwOYrTQT72I
 xRplSZCJ+hYaKoO0J/4ZDvClC9LqfmGVwPwpIAcXeCGlmpBYol4FtIfAqzORTwBhP/8Q
 agvDZo3a4cGjil5fQhE3fGRFk5PnGDH+1b/XsmUeBukoJL8qbkumaqxYDAdtNW0J9V3o
 OTug==
X-Gm-Message-State: AOAM533FpKBI1YMFVUPL9S70vPuvQgvXakMoc0vKMCoSXrQelRX5a7J9
 zsHqIqTZkBlJX3PtYXhg7mD3XzyQfEnYdrIPkdwgXAFz9ZA=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr26823407edb.204.1618852166385; 
 Mon, 19 Apr 2021 10:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-7-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:08:35 +0100
Message-ID: <CAFEAcA_fXNEJXKAnktMuZTRGngToaGqL6QQHk592VJzjRrnstQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/30] target/arm: Move mode specific TB flags to
 tb->cs_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: uIXXyIhycrs3

On Fri, 16 Apr 2021 at 20:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have all of the proper macros defined, expanding
> the CPUARMTBFlags structure and populating the two TB fields
> is relatively simple.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       | 49 ++++++++++++++++++++++++------------------
>  target/arm/translate.h |  2 +-
>  target/arm/helper.c    |  2 +-
>  3 files changed, 30 insertions(+), 23 deletions(-)
>

> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index f30287e554..50c2aba066 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -402,7 +402,7 @@ typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
>   */
>  static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
>  {
> -    return (CPUARMTBFlags){ tb->flags };
> +    return (CPUARMTBFlags){ tb->flags, tb->cs_base };
>  }
>
>  /*
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9070b773a9..85b7d6add0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -13271,7 +13271,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>  {
>      CPUARMTBFlags flags;
>
> -    *cs_base = 0;
>      assert_hflags_rebuild_correctly(env);
>      flags = env->hflags;
>
> @@ -13340,6 +13339,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>      }
>
>      *pflags = flags.flags;
> +    *cs_base = flags.flags2;
>  }

Don't you also need to make assert_hflags_rebuild_correctly()
check flags2 now ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
