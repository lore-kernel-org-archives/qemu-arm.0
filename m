Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp187081ejt;
        Tue, 20 Jun 2023 03:40:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qApbMloc10iX+E51HjXwuzBqvIai9cOmEdqX/uztcJ9e4xK/QYwrN04eOzXk9TaGCDOKT
X-Received: by 2002:a05:622a:30e:b0:3fd:e1cf:627d with SMTP id q14-20020a05622a030e00b003fde1cf627dmr12844456qtw.21.1687257637916;
        Tue, 20 Jun 2023 03:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687257637; cv=none;
        d=google.com; s=arc-20160816;
        b=oa0g7IiFh6ZiS9zWMYJeK+JGJNlGnok42kWjI8h120587AbRE4uKBAjPkA/PtbL7Sd
         Z4NXow4enB7g6qRLo4a85h8cdvmFQHgBnEnCObcULzNJPZqkUl7kxI3Kggk/bBWsyZSR
         5zdpz5fp3ymgUA2zzbkAGNBzBw+onwhaC9G+L/bxdjUnKR55GGuqOYlnpKg4GjzM75SW
         pv2hssJ8N5PIFlVQv8km/FRPvexAln6jYwPS2z37b6sItrJKMMGjIoQFeiTXAev+pOV4
         CE+lDoC79NqO9+ZgVRPgMtXEKGyZ95/bQHYmxzqSIJeW8nNK2Dgg0NFAfG4MddE9waKK
         5NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ka3CMzCB+5HrtaMK79lnHyi0S0NQSXryjFCdnDk80RY=;
        b=Tt871mGrW8QbtgjmmNCq2cSUTWAttiaPWZHncPyyChI3Su/R+8TwbWjYxg61d4WuaE
         jsO0mPUv7yp1cbrVKpArsNB4HSgfpzcXYOH00PawPdD3qgwii2MSDYGXll06D2Q92h7a
         825wnrq5dimG05AkDO8MaVOkTBFOs59CUszwQngf/lodF2cU7ZhZ6IX7K+LWuyeFa3Oe
         Mb2PgoWDVgdDhkNdLU3cX8qq0bzncr96nM0kyLXaq4T6oXeNoQgfLBTKiMJqhZXLil2u
         v+lyd4Eba8UugnSH7iFJGeEBIPTjPxY4kxf0NJl3d1DdFx0o2VQFAs5TraWfOWqK5cZv
         STSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atFtFX4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020ac87f04000000b003fa841361c9si630527qtk.790.2023.06.20.03.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=atFtFX4Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYmo-0005iY-UE; Tue, 20 Jun 2023 06:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYmk-0005Sc-Vh
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:40:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYmf-0004iI-Nb
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:40:27 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51a21185130so4723944a12.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687257624; x=1689849624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ka3CMzCB+5HrtaMK79lnHyi0S0NQSXryjFCdnDk80RY=;
 b=atFtFX4ZNnPXPPl+jZ6j5cJ7A2ccxXSWHYHbYs3ROwW5dwuEsoMuSXHkFQGo66am3L
 ct3om/DFszK3D6AY/iCferQuMSW+twMOdcYovdup6AU+L3cAFYuUTg0GZHIcbvsgVNt6
 jdqI1xu4MLGjVJ4jWiO73TmMwrhmkYThXvoXkJNn8Lj2krwY1KIqu8Mwei35GNVgysbm
 rLuqIVH8cyg8ugL0XkqRl3rWGtp1/6eu5obEuj/D+Dc2pIRBk+TsXAAnncQvwFLzaZe/
 Aioz5ixOnFfdjreXZ0ivuqvTrM0S6+bAPQhPPGSrKs74G9exkH7MYRbokEI05ZxwLzQa
 qjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687257624; x=1689849624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ka3CMzCB+5HrtaMK79lnHyi0S0NQSXryjFCdnDk80RY=;
 b=UXhpQXauYCMSguKLeWtnVWYISm8FYvhHicBuyPzHoWO86roPBWTjios/kOPRdIuRJN
 P0oWePdoWQlXyOcmPXHSZK6ew+1gsFKND3xacu7FUyQGLp0fDo0MZ1XZmBW7O1I5FX2k
 8WFOVNhg1wPO41P3atg0RnWbbxRnDNWfzz3EadRDaL2kgnCIpKzsTGGcIu9yIN5J/izs
 d+7HaNZWLtuMz8seU1Y4xRImZvEuufUuLGIWQbvcph0fbbhx6ihn5ygIbDuA/Borpqj+
 NKaF0Zf4r6T0PD9kLL0M1zbT4zOeLXzRGLg/DTXltZ2oEyZ4ZAzAPhJd11hxwGNvvfxi
 jEhw==
X-Gm-Message-State: AC+VfDxyCMHizHgD+IHme2dpQ66M4W5Z1wUCG6M8zDCJ5ukAmd9PR4qL
 1FvT1sFTsoChRcCMHBvw4fpO4Q==
X-Received: by 2002:aa7:cf19:0:b0:518:7bab:b8f7 with SMTP id
 a25-20020aa7cf19000000b005187babb8f7mr7995551edy.16.1687257624074; 
 Tue, 20 Jun 2023 03:40:24 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 y19-20020aa7c253000000b005148e981bd3sm954062edo.12.2023.06.20.03.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:40:23 -0700 (PDT)
Message-ID: <2f722452-b835-e341-19cd-4bb14e0bcd31@linaro.org>
Date: Tue, 20 Jun 2023 12:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 25/34] target/arm/tcg: Extract PAuth definitions to
 'helper-pauth.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-13-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GH0/i1/pLQIS

On 6/19/23 17:55, Philippe Mathieu-Daudé wrote:
> helper.h is used by all units, but not all require the crypto
> definitions. Move them to a new header, which we only include
> where necessary, removing the need for "exec/helper-proto.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h.inc   | 12 ------------
>   target/arm/tcg/helper-pauth.h.inc | 19 +++++++++++++++++++
>   target/arm/tcg/pauth_helper.c     |  4 +++-
>   target/arm/tcg/translate-a64.c    |  6 ++++++
>   4 files changed, 28 insertions(+), 13 deletions(-)
>   create mode 100644 target/arm/tcg/helper-pauth.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
