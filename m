Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4693515ejc;
        Mon, 6 Mar 2023 06:14:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9xyHZSH8ZgSouyAW56fBaV7c1YWOX/A9Pa8t3+04MjKiEKmHX7KRppWhk/e0CP71+B/4oE
X-Received: by 2002:a05:622a:1042:b0:3bf:d1c6:d375 with SMTP id f2-20020a05622a104200b003bfd1c6d375mr19970536qte.36.1678112087034;
        Mon, 06 Mar 2023 06:14:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678112087; cv=none;
        d=google.com; s=arc-20160816;
        b=LUpOiugo1VbvvnufWzpPA1m2o68ycNUGakVP8RBy8kpWvjATvfrS2Wnv3sPV5CD6UT
         Bcs4XBLDSIeNrP9ZgPrz0TcdTipBrsYz+wek1KZm4pTwvyp6sY/7BXF6XqNxWPG1PQqP
         LRkdT0ftxqEWvJp5fGFg+Yv+Sa+dWbtX7pvACtqOs+xwo8VA03JFDIalH2ZqPnTeDgfk
         BBEZ47Lkkw0t/xmI3e0XDwqGC1TiKgsAJukNmy0PDfuQwd99WoWhknifcT1fq07lgCbv
         m31Lb75kWW/sDKxEZTH9OnhYXOKVomInAAcWO+61OqQOlk4kQ+mpcWbVYygBKrpCh49c
         D8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7b/5Nnn4470AE9lGpvZFOcmVz7QwGaCPX8iwkVjkmAY=;
        b=l/+mVupaBXCrxi2A21Ocg0GxzPddJxLaZJl8YtlRBZTBHyErHoZShwtJwX+04SYfyc
         Qn7EVTm+yB4ndD2l7/zrOPvl9n2AbTxHFq5VeDtsd1qWmODQFHG/olwzM5XjzD4rnlRU
         WM5yqBq1y6JiG/0gL8Cy7hKkqi9ZTCH70+ADT+mSIIWleZUIlchyftEWeFUrTfwpHmEH
         rPU1TxJTG84l5LBCHfQfMXkBzPHF0cECR8ybRyhAYPC8pBohgKGgMv4NGnieDVy7vTJY
         ltaVkCQSI4KPcGc2q1E7CwP1Fj/FFDkXns7y32gzrstuJi+NkVnrzm1kln4sKSGaAJK4
         TZtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VKoSWinP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05622a145500b003b9dd016f16si7344589qtx.641.2023.03.06.06.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:14:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VKoSWinP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBbg-00039v-7a; Mon, 06 Mar 2023 09:14:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBbf-00039f-7H
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:14:27 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBbd-0000c8-OJ
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:14:26 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so8267885wmb.5
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 06:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7b/5Nnn4470AE9lGpvZFOcmVz7QwGaCPX8iwkVjkmAY=;
 b=VKoSWinPM2t6rF59tTGlyotv1sTZoB5pL/F9i4PJCIfhxzgiou3RKIykHqXTallWTj
 fBDJno/uFDmRhPx/fuHRTKyp2mS/rJXnSzp8zTNEuGDzEgH7K0gwFk6bUDHn0RUUvHLP
 K61U4eMBqoxAXhICiIn3iO+t8Xka5Y/h0DW0U+nPOPr7fWEHSIeA5dxamolq8tgoOrmQ
 gNc3XK88fx6L0XRsaDzCwA0ixgqDzc2ULh98ZYFQkPbcRrNIezOW/RE3AdymE+sZ5MAG
 XJwxu2vySUC6Uz9SNYACRR1jN/luUjQlf3h++WQlwPh05tHYq+tOGhGg9JtbcmI26HHz
 4AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7b/5Nnn4470AE9lGpvZFOcmVz7QwGaCPX8iwkVjkmAY=;
 b=2I2xM/madh4xSBBWJvgaZSOHcgvr6KTEyVvMZbhkGTsGjrnaAHzda3zntAkgZu/KBU
 TdKf6uKIAFwNK1+dw5Fw2H3/Ncy32PusdNEHvFDob1qeIayaPyVr9OmoUAV6ov3FbgWC
 y2pSgfhhWsLRxLtZPtIb/osmjUHxhei1j6lQ+pmBorMVhc49yRo1zw/B5/B2L0QU/ikv
 kuK+zC5ikjicc++CzwcAUTpVEY9gV9dWiMWGlB9cYYsbhGh5MLLxBwvz0y0lWQh1VWXw
 Gu7/pqlzkdxhguOeHOF1HucJLSEqBjXagB07/khPbPPU0vbKF2SA7Qsw/BGqcy3l+dLA
 jj0A==
X-Gm-Message-State: AO0yUKUdz02TY4cejBlhAjB4f0XukfUIxKRbBX4MOe8d1yhjU9LuB3WG
 SC5AfaiaejNeTrH0oOV4+DiNSQ==
X-Received: by 2002:a05:600c:4f87:b0:3ea:d610:f059 with SMTP id
 n7-20020a05600c4f8700b003ead610f059mr10396660wmq.4.1678112064170; 
 Mon, 06 Mar 2023 06:14:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c40-20020a05600c4a2800b003eb20d4d4a8sm10175450wmp.44.2023.03.06.06.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:14:23 -0800 (PST)
Message-ID: <77f3be43-1281-0f40-1f31-d6d053c09afb@linaro.org>
Date: Mon, 6 Mar 2023 15:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 25/70] target/m68k: Use tcg_constant_i32 in gen_ea_mode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jCiLgm1I/Plg

On 27/2/23 06:41, Richard Henderson wrote:
> Return a constant for an immediate input.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


