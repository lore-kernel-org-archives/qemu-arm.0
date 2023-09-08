Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp680936ejb;
        Fri, 8 Sep 2023 13:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH2ydfR74TcTmIIasD0gcabqG/AWnNWPT3xIiamwgMshEvOpdQBoACx5gaHIpaSOR2u1Ng
X-Received: by 2002:ac8:7f89:0:b0:40a:fc6a:e87b with SMTP id z9-20020ac87f89000000b0040afc6ae87bmr4200064qtj.22.1694206381414;
        Fri, 08 Sep 2023 13:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694206381; cv=none;
        d=google.com; s=arc-20160816;
        b=sFMEach+oxlZhk/sEXUtRZEtNN5BX28+DOqr86h7ZTZvmGa3V5YkrfVdxRJzvD93j5
         hAnZoXdoZmpQWp6xKQGYDsO7wfaUr0RKSzWJ9yDR6dKB4PPpkmgMJSWwS1wD7P7znGH6
         GKHI+2EjXh0SMbkdoQxAwhK/LHH4u4Tp0v9I15lCbBA4Bs4m7TdNTpOvNaux8rN2gkdX
         U+BVIun+mPi1yY08JxXl2zxHpKx6Ly5MFCAk1A0OoxZVEboDlFEydLDBgrQCybuklwP4
         Bny8Z8wvpmx4rKJ8HpF6WlM48IqCcA+hOdbW0PBFRkduTF8q+xkfT1ipvFPSNLppHOPD
         gwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=l0cMhIb7U9Z1ab1M4542EFUivodi9OT0TAYeA8IKBAE=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=We2I49BzY6/1tp2y9r/FSWsuoku82X2+0vhRKPDMPxNbHYcItNajDXVlsplWy/O/KD
         QESk5Ps93T5Qr8EiMmgP3atPEhna8pVXMrQBxAAWLPrM1YB0ZumHp3O/yYDLW9iQOS9T
         c9LSryIS2GTLMDR6jDrANTjWpM2r6U0Q6VdDwIcs+sXemaWyRGYcvxDXa5r1ZXvQQ54x
         vHvqcbO3ysxI7CIljE8BP87vjnEvDOSh1sIhhRuw5pD8TBzulLzkRkuGiHo9eU2vh0jI
         JKtYD2wmYbPbJXrY83SKLk3PiVDU4gYLR/9k4TemgLNpw0aT9TwbPPcbmmbkEBzpdK1D
         3UFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zDpLCTkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05622a144e00b0040fd2436deesi1728276qtx.283.2023.09.08.13.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 13:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zDpLCTkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeiTG-0005oB-9c; Fri, 08 Sep 2023 16:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiTC-0005n9-46
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:52:51 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiT9-0006ep-RE
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:52:49 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68bec3a9bdbso1989506b3a.3
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694206366; x=1694811166; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l0cMhIb7U9Z1ab1M4542EFUivodi9OT0TAYeA8IKBAE=;
 b=zDpLCTknsF0F0q/alvvah5h0r2OpPmGzusC+8hboiqEfLDTYKZIO3+7EwBZXoAgtCx
 tfbDPgHQcy7orsz0cEVCGA+lDai0HItxp8yPTWlT2kdmvERdf9VTJEFWMIsBJu7wQR/H
 JbecxPwLeTl+weEZrcwLFHdlOi2D2ecwod1p72UYuvzVtvFqPnbToFuBraaMuFlGJLYw
 mR+/1cS2LM3mlinrFFxgDvjSxtsTz7jOKbaicR62myJcI3tpZ/Ntd3gA8wMvd5BVf26B
 U4tyxceaIE9bbGhY5ldMUVTolWb4X/YnpcGhPqV6lXEx6Z1v9901foBQDMy0sgaJp6vQ
 utpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694206366; x=1694811166;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l0cMhIb7U9Z1ab1M4542EFUivodi9OT0TAYeA8IKBAE=;
 b=vo1xlYA/S9aIH4/f5Hpk8p1hzWPKhV1yE5ugOuARhIdrljv4CXnUHq37Jpx6H8D6Jj
 bXVRDMD0EBAgY15mnTi0Lr5jKj0gxPSWjncY3YhsEWPdDccJmHmThQzyYrvJI7eikG5H
 pI83XcQmCxM+dixKt7PYkPV1uafm3zjPfE+sp36nuGmouTZvJLAzF3JOt9bnuAQI+X00
 olC0Iahd2q5vbj9xf234D01dMwAylVdxLw1ocizWpde+Ai6vmxtCiw90IQRPyGC8bpxH
 JcoGB7FxKkhteamtUvrub4zf28eZa9STftfwzwjo+NnT9raSNM1ruxT48IssBXnVenXb
 k4Yg==
X-Gm-Message-State: AOJu0YxAa7N0kBN+yXdMaNm6U1X5Pc616cCIWiy2V2e1a9PXqCd4shvE
 wBsegAMxlUYt7+GeWirqJLGAXg==
X-Received: by 2002:a05:6a00:2d9a:b0:675:ef91:7922 with SMTP id
 fb26-20020a056a002d9a00b00675ef917922mr3590417pfb.4.1694206366491; 
 Fri, 08 Sep 2023 13:52:46 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a056a001c8800b0068be216b091sm1578075pfw.24.2023.09.08.13.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 13:52:46 -0700 (PDT)
Message-ID: <51e7dc21-35ef-9037-19ab-93a8ff2667c2@linaro.org>
Date: Fri, 8 Sep 2023 13:52:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 08/14] target/arm: Implement MTE tag-checking functions
 for FEAT_MOPS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KoKZGzGXdLDH

On 9/7/23 09:03, Peter Maydell wrote:
> The FEAT_MOPS instructions need a couple of helper routines that
> check for MTE tag failures:
>   * mte_mops_probe() checks whether there is going to be a tag
>     error in the next up-to-a-page worth of data
>   * mte_check_fail() is an existing function to record the fact
>     of a tag failure, which we need to make global so we can
>     call it from helper-a64.c
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h      | 28 +++++++++++++++++++
>   target/arm/tcg/mte_helper.c | 54 +++++++++++++++++++++++++++++++++++--
>   2 files changed, 80 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
