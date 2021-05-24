Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3742391lfm;
        Mon, 24 May 2021 10:20:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVgWL0g1mR6rN0EYhIpUotyfdRoBP0zzbjVq7NuOpLnZET3vanb8wEt9DJnpqTNkS4HzQJ
X-Received: by 2002:a1f:a404:: with SMTP id n4mr3199868vke.12.1621876800209;
        Mon, 24 May 2021 10:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621876800; cv=none;
        d=google.com; s=arc-20160816;
        b=j7tk5ZAN+vYW/qCLuB0b1/AWtTLvq/Be56Nz8839rRhWi+jzG4JT7hXnkMivLuMYmF
         vlhYIxOiSKSH7AWrwl/XFveWxAkB1t5z604SdPisnlxPD410stxL/HaN2wR7FtAVNfgV
         hJqOZAka33QZIeyZ9cQY9r0JcEnLFSeEGyznmN9iEWEJOTFl+WjPuQGzv7MpxwsrNzjF
         99UZkNfZHTE5ida0ejUa2RJQNyCQpRlfKgjYwSe1dDpWXLwyk4xM+auNFeW3vvg+s3wN
         jI0/wqAR57qJ456V6rJZjvA6cJqBwjpKBFWLOUE0UFzYWIw5PzuQWBSZWN/zLQp859FY
         qCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yLBGaOG6ccgL5RPnD1PZUTRq8gOxQGuPFlWTblMQsJs=;
        b=GiNdgXbBAn4l1CqQ3vRJgdyC0xbWiSqYJhfUclkQ23/G58Q6b1bnzj2K9tqPc4TuVg
         e3O4IAmu0/TD+ezwRbuVAtNBorAMOE/vIt4xsPhJsqnHwkG3QpCOgy05i5DSijDe0NMC
         B2udA2gcmvF1LXSEtMZYJqUD7ZX6VRc++hyYfPOJAF6IdmE40K6MGQ6o35IG64lQcoKx
         TmZvjAYRj9rjXwkPyZ8OUCMqV3ejxGsGDGp0o92cjVPuBmfU7uSmi8gSEVjETGb8zJC/
         mZ7Q19pngLUjf2uVRMe5j24z+1fZLU4Q98PXzWt6MNBH9QTMmC6QIbTvgBUubnwsqi5P
         kneQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q4Qb0tTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si2730274vsl.391.2021.05.24.10.20.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 10:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q4Qb0tTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llEFD-0001uW-FM
	for alex.bennee@linaro.org; Mon, 24 May 2021 13:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDnR-00016n-Jf
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:51:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDnN-0007ws-8Q
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:51:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id d20so621951pls.13
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yLBGaOG6ccgL5RPnD1PZUTRq8gOxQGuPFlWTblMQsJs=;
 b=q4Qb0tTDcvSd4BhqTqUdw82539D8Qc5h37KbHJQgmw0i7KKHenNtHrDW4YEMwkSiQJ
 xwK92efwoJGUZrnPeUv6sMAdc7z/ZVCY1yRHzA0ML0G8M/aUTlJY5jgtLfjD1luNvJAS
 lYv2WWpa0pQVxBI6sAoaFd2NO36hR2K3s2vbiO6NYBpJ4yQecj/QivLqRc2AYg5xxA6d
 Xo+UoCNm6+XCmp/wRCOK5u/7Dogok2dPFJvA0RF6wQ79vTFTc6NRmcfxePT33mxa9tJO
 FwLU/EdKKhH1rs7DM42tiV8I7TWmQ4M17loQ5nOLtruRBgIss4l+H/Wc5V6+W/PCnoSm
 D3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yLBGaOG6ccgL5RPnD1PZUTRq8gOxQGuPFlWTblMQsJs=;
 b=XszCc9ddJXwzJvlsUgluCBVsSfcLmEqgTAo1w7kVEyZHXIj74nhAklvCD7Z8ZhAu+g
 kJga6w/IgHTgAR02pW0I73JLlmYOGIaUAPIY+LZO28icljePLAkBmz2fVsNBOzlVsX0p
 o4uWVXKz7gfWwOU4mLFhrDoLXVJ1iMFiK68JHpZHep4xaIJPE2BaFMeliyknNbga1z8c
 AMvoKEgGt9Gjbn8MKwjQf5DDzr9iiECSPZoD5tAT6cPiNFLx+x9Kc19TgvC3Cc1bz0H8
 p4vGlM114Wf7IyHsRWQHbJD+5m11zRFdKoboqjC0aOAZUkcPpPQ39h2oLJF73ExH59zO
 BdGA==
X-Gm-Message-State: AOAM530YYvA1YmYCDTUlUCsLgt6YWhm7YTmBI25vgeriK9y48zTosJ3P
 tWRdyIJhc0LqR1y0gjviWMnVAQ==
X-Received: by 2002:a17:902:a5c9:b029:f7:9f7e:aa2f with SMTP id
 t9-20020a170902a5c9b02900f79f7eaa2fmr15726784plq.54.1621875071675; 
 Mon, 24 May 2021 09:51:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c3sm11199698pfi.213.2021.05.24.09.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:51:11 -0700 (PDT)
Subject: Re: [PATCH 6/9] target/arm: Implement M-profile VPR register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3b04611-5704-90d9-6dbb-9e0105b01d30@linaro.org>
Date: Mon, 24 May 2021 09:51:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uVH6CPNFYz5p

On 5/20/21 8:28 AM, Peter Maydell wrote:
> If MVE is implemented for an M-profile CPU then it has a VPR
> register, which tracks predication information.
> 
> Implement the read and write handling of this register, and
> the migration of its state.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           |  6 ++++++
>   target/arm/machine.c       | 19 +++++++++++++++++++
>   target/arm/translate-vfp.c | 38 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 63 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
