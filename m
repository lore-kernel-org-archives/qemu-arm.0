Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp497580ejb;
        Tue, 31 Oct 2023 12:02:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRP724gI1Wpou9W3HjlcHrKnSrwCjm2iQtkCBuj2idV2IxSsqP0HgHyfD7mTGfVCb1iRKV
X-Received: by 2002:ac8:7d0c:0:b0:412:1fd7:dfa1 with SMTP id g12-20020ac87d0c000000b004121fd7dfa1mr13571716qtb.8.1698778933582;
        Tue, 31 Oct 2023 12:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698778933; cv=none;
        d=google.com; s=arc-20160816;
        b=cfA9VX2HT5fphaIgGD4gnHOunVHnk3kr1ESV6+9nEleMYWsM+aa1EwcITG5NaoSsAA
         CVaHtipQ+mnP2TJuMoxlzP4LHN6lUkihicFEWahV3loY5BesyYdZ66DUA1JD+Ve0ZUzy
         wSn1ViajiZnWZUxqlxhvty/xmFYGM5BVd/oMQjBQCi1/9BvZSeGvnisppxvlgpN0FoSw
         R74dGoogV7OHEuT2HwncVxJVB+HpCX3y111ocX5VteiPVOo8G3lHKWFeaceqRUIJH+7n
         qYopztTsYFKBxngvCyjv/b8Kq9kF6Fmhx5ah+awUzRAPdPusHS2E15seruaAYOLDWLdn
         RHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Aen/Wq6t6Uqky7PRziuag420pllaMNiYFb9lBfAknxM=;
        fh=PRoHjD/djUAHQXeMIrzpgUv27otx4sratw48fpw7M0k=;
        b=l6Z+l6K61XmNzTXEzEecHDblxD2sGf95n3jwiUI4fV570bzD5qdMqzeYUXQEfiAuPC
         m/8meig611ylUzStNiGTCyVrE8ytLYbTdoDNiZDweuZU4msK/0sj2m4PM4mRkMr+aoKl
         mR53cUufqpyWe1c1QF/VViMILgiPsKhJY51ZaL9gqT653KyN2zIO7AvvihfVI8RIAkxe
         cDlhOOMxyyt1AjLneNH0nyQAwketQUjT3D/F3LNh+xNQEkSI/GiIiQryGTW3yqmpzP96
         q367ZwN76G4P1lppc4fRjs9Oo2QfCDsZaWRu5n1hFcYTqwNnpuT6Ib/XtfQV7KKspVBU
         pVSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvUxaHvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020ac85a10000000b0041908908ba9si1718199qta.165.2023.10.31.12.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 12:02:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvUxaHvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxtyy-0005KA-J4; Tue, 31 Oct 2023 15:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxtyv-00056N-Hx
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 15:00:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxtyF-0006Cq-He
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 15:00:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cc5b7057d5so18154155ad.2
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698778795; x=1699383595; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aen/Wq6t6Uqky7PRziuag420pllaMNiYFb9lBfAknxM=;
 b=CvUxaHvDO+aGq91zyJEJVyZWKKHtCjB2ToSdnQ9yjZNxEcs+eCS9c3zpC9jWEBUdTv
 BbApKNP4n4nJ9i/dsy69tNdL8T2BWODjK3OXs8cvEVIR6whsn8AQXc22GTVf938f+b5w
 ODKN1nvXRttTyzDY0HMUuV+2+HZ3I87dBHuedQREwM/nvMJiE+E4vlxZzyLWZMMxh+48
 ooppYWuNG47HM0UzyzHvVVbzdcVxvSyyjJos+vxaPvP2SNfvt+pqg8eh1iSzYifv135+
 5p5E5/+kNFbD/Ln7sxIfx8Sla+lwO68pUoSHPCm6FD75mYAbFWPzLJ+xN6gXfsRDLR87
 JqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698778795; x=1699383595;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aen/Wq6t6Uqky7PRziuag420pllaMNiYFb9lBfAknxM=;
 b=E4SorzzSJo4e4q5P0+nIykqT9ohMU+wEcNgichBv+9ZgDYbiaTLA4i8bXxxfZvwiIq
 CAJCDu0ZfDMiGrXvW+nvfjT38c8pyVfhx9jahqrb2aCApsGgthVEFbLHaVjXaB226FtN
 qN4XakNvFL1qj16GaBGBsIo7UUHxcx7+86a6Ul2q/V44asMYV3v9EWLUDImW++qxwowA
 WFzH/+rr7q1UWkm5ZAOmm/WHwoRiOF57+RJZomJ/1ct+5vuWIR8RENOVby2lwPTChpVW
 GX6aV0ilcyqYSLELvsWSnRS2q8835UAv42L0Y3iPPfdilyEmFDBI4kHlk/Gp/FUm3exK
 MXng==
X-Gm-Message-State: AOJu0Yxf+tGqcCiUSqdRgm9ruTSzwx9fwd0owq+AptOR36zY+cXLN0b/
 JR5+EeaFd0zhYqYpGC+fQYifPA==
X-Received: by 2002:a17:903:246:b0:1ca:2743:bf79 with SMTP id
 j6-20020a170903024600b001ca2743bf79mr17502836plh.39.1698778795097; 
 Tue, 31 Oct 2023 11:59:55 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170902eac600b001cc50146b43sm1641825pld.202.2023.10.31.11.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 11:59:54 -0700 (PDT)
Message-ID: <1c4e36a3-8092-4cec-a2fd-aea4a84a1ed6@linaro.org>
Date: Tue, 31 Oct 2023 11:59:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Correctly propagate stage 1 BTI guarded bit
 in a two-stage walk
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20231031173723.26582-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231031173723.26582-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5+7Yjk/2FNef

On 10/31/23 10:37, Peter Maydell wrote:
> In a two-stage translation, the result of the BTI guarded bit should
> be the guarded bit from the first stage of translation, as there is
> no BTI guard information in stage two.  Our code tried to do this,
> but got it wrong, because we currently have two fields where the GP
> bit information might live (ARMCacheAttrs::guarded and
> CPUTLBEntryFull::extra::arm::guarded), and we were storing the GP bit
> in the latter during the stage 1 walk but trying to copy the former
> in combine_cacheattrs().
> 
> Remove the duplicated storage, and always use the field in
> CPUTLBEntryFull; correctly propagate the stage 1 value to the output
> in get_phys_addr_twostage().
> 
> Note for stable backports: in v8.0 and earlier the field is named
> result->f.guarded, not result->f.extra.arm.guarded.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1950
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 1 -
>   target/arm/ptw.c       | 7 +++++--
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
