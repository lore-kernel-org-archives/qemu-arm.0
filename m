Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp257600eji;
        Wed, 7 Feb 2024 00:48:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfAKXI+9JdCNNqBgi11i8FU6T8mPGB3FkTSfuWD5Y7YwdwkttJHJjPUivy1GFTTFvqFwcwXmj5KIWHiQyDukeehUVLHErF
X-Google-Smtp-Source: AGHT+IG+tyeB2nBn+rDW2h4O4ojpR3wZKry/LVIuBZNmV5LvwWFNVq/T4oDB39xgZGneUrfDA0/Q
X-Received: by 2002:ac8:7f46:0:b0:42a:7254:83ea with SMTP id g6-20020ac87f46000000b0042a725483eamr5979555qtk.41.1707295692137;
        Wed, 07 Feb 2024 00:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707295692; cv=none;
        d=google.com; s=arc-20160816;
        b=r2BafgkzTKGMRFamLlZVPxxIaBjSPf19o1h7Twrp8o7+8GGLzXg7IH93kj5fzz0K57
         O25oLJ05t4lqwmLfqtR/xFPFTPdny0EAnjnRAaTTMfYdD+QQ/Mt10aTovhAdfijsV4ti
         n/Czke2b+xP7ped6usEJTpJGJNHaJ1VyI6e9CgrPKiHSNIEqbgSwV026rssubeurO4T5
         X5fZIFoGOuPpZp2T7cQZxnBUyj1pYKzOiQWy9wZPKspaxCaNiNYwAfM62yDwKtCk5YTD
         r4NhRskuEg7CNPWgYnKuIG05D6W0VJCBzskueXZkssvH9bgt2nu8GdyZKu22WR9R+Px5
         5DZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=E81wdmjqVBdZnfYE3yph211KNjmHI7u3Z6Id1C6xguY=;
        fh=MwgCFyvmnRI2Ak5/BEY2BMufftnjhbUBMOcE0yehiGY=;
        b=MVE9RoInNzKH5iigMB+j+DLp9nfSNlYl7aR7AitTd9unePnjRNTUg5L2Nnnfjct8Ee
         PAYGmNTOOd0+4DuSkPDjMqYp6iT/p0BAxxCa95nLa/zquHj2Vjevm9dqN1DF04mEGE7K
         hsnrckGxvNlegei2SngHZGbE8ZP/ZJD0fVqW+aktySOFY1xqPOBhVW6jR3lX4Tee9H30
         kOiqtRvGl25ais2LFveuDWSnwqkPELy7k+lIQNqTvZzq31zKQ+77RWUTz+6HWzMiW0G0
         FJmUIg17cjbEaFhn40xFrzQk3DG3dHZIgze+7snxoXpgasc7BLPjjbDctX+9xYV9mtXZ
         yLuA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4wqb5cs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWwL7V5ESwotkuhQ45lkazl6ktLpb1/Rl6j5eVWSOlOqAch7vFMTfcJYoGnPJT3zQQJX2148G4N5l6JKGQ8Dxz+Q+y+W9xK
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1-20020a05622a11c100b0042c28f9eeb1si692902qtk.448.2024.02.07.00.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Feb 2024 00:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4wqb5cs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXdao-0006Sm-Tf; Wed, 07 Feb 2024 03:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXdaj-0006RX-9E
 for qemu-arm@nongnu.org; Wed, 07 Feb 2024 03:47:37 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXdag-0003F0-VT
 for qemu-arm@nongnu.org; Wed, 07 Feb 2024 03:47:36 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso4703671fa.3
 for <qemu-arm@nongnu.org>; Wed, 07 Feb 2024 00:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707295651; x=1707900451; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E81wdmjqVBdZnfYE3yph211KNjmHI7u3Z6Id1C6xguY=;
 b=T4wqb5csRyYAEmB2AGWKDwqD2o02BpraO0PD93TgxZYlpPuc7k+lNwj1lADvHKfdBS
 EQrrYquTZC+pgDGjE9SbwlW9F3zzCXejoXYfX2hSLNZ8wFS62xy+YLwulbelpYK6AvSe
 CA9wTyC1mBcueyhygvjfKqzra0vbyHpR2Dh4/zTx7NhWlfSeFligNoG6fyXmj5lIVDQv
 YN+lRtrvtwVcN9uqR9Fv1/qNT9Y+GAzhfTTK27GMuSABSNh0KyIfI+mEkRzcfMJMcKIy
 YITfELApEQarpFFk33xm1XwIZcQGLtcdJynfDGGLltcVn/osuinQMqj3AxNBb+qoErl/
 iHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707295651; x=1707900451;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E81wdmjqVBdZnfYE3yph211KNjmHI7u3Z6Id1C6xguY=;
 b=xSmQTY7res2Lh9MikimgnegV6nX8Fp4VXyLROtNIQz0bGqc6hYkdiy4GDucMalfKXy
 utfhCcAzsKfrqcq183HXwLbChol9eHCTFEayuMoZpaIYea7xFtH9BYvrkDiDtTDlEflj
 JKDDFnWyDOX56tKgFEGDsRcq2vhlg1d+DxIbiRstr5Oq/Qm8p6QouPJCgLyTESKN1RCF
 3z42yvxag/K6KEtZlcOwAXF6q6kHMWDc7CdAh0NY7SbucUIKninpPK1QccYwES4v+h5Y
 q5a1Wc/Hu8xJ0WbOOniNe0srcerOiKja5pItjPg56b2T9SKLzqHiL1tS+MDeg8QYGeso
 wXTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa5PpNmZY3ijs57jFQ0R9pyuGUR+L45Y/X/48m5YjzM6eBtTF2QfKAXyLZ5as/FMrQRNsEMzYQL4uOWk3FBQHNFEzu
X-Gm-Message-State: AOJu0YydR2T7T5UZ55slXZd5YCd29H3JSwhmL+sgXnpcOZoxiDAmhv5B
 E1MEveIzfcF3xr+bSTO8D0qZ71X8e1Mulp5jaEYhEWtnXkChegcJqekroT2HRvc=
X-Received: by 2002:a2e:9902:0:b0:2d0:a0a6:9a3f with SMTP id
 v2-20020a2e9902000000b002d0a0a69a3fmr3350192lji.38.1707295651016; 
 Wed, 07 Feb 2024 00:47:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXt5M54f3CK4fBcRsfahFI8PfbJLdTJuzUiNk43BuPJ+0SzinSgk/aWj288kMNiwykUIqWrMfm8JD7ymJ3AzOaePiA0xYiHQwsoJb1OoK40FPt4rzxb+RJrOp4=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056402428d00b0055c82e27412sm443612edc.75.2024.02.07.00.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 00:47:30 -0800 (PST)
Message-ID: <76017b2e-f519-480e-8ad5-b45fda1670d3@linaro.org>
Date: Wed, 7 Feb 2024 09:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] hw/misc/mps2-scc: Factor out which-board
 conditionals
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y2pBGVSDpA3x

On 6/2/24 14:29, Peter Maydell wrote:
> The MPS SCC device has a lot of different flavours for the various
> different MPS FPGA images, which look mostly similar but have
> differences in how particular registers are handled.  Currently we
> deal with this with a lot of open-coded checks on scc_partno(), but
> as we add more board types this is getting a bit hard to read.
> 
> Factor out the conditions into some functions which we can
> give more descriptive names to.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mps2-scc.c | 45 +++++++++++++++++++++++++++++++--------------
>   1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
> index 6c1b1cd3795..02a80bacd71 100644
> --- a/hw/misc/mps2-scc.c
> +++ b/hw/misc/mps2-scc.c
> @@ -59,6 +59,30 @@ static int scc_partno(MPS2SCC *s)
>       return extract32(s->id, 4, 8);
>   }
>   
> +/* Is CFG_REG2 present? */
> +static bool have_cfg2(MPS2SCC *s)
> +{
> +    return scc_partno(s) == 0x524 || scc_partno(s) == 0x547;
> +}
> +
> +/* Is CFG_REG3 present? */
> +static bool have_cfg3(MPS2SCC *s)
> +{
> +    return scc_partno(s) != 0x524 && scc_partno(s) != 0x547;
> +}

Looking at next patch and nitpicking, if we want to avoid
a switch() case use, this style is easier to review IMHO:

    static bool have_cfg2(MPS2SCC *s)
    {
        return    scc_partno(s) == 0x524
               || scc_partno(s) == 0x547;
    }

Anyway, already R-b.
