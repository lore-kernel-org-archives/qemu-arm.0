Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4762416njd;
        Fri, 4 Apr 2025 06:00:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7/vrBSGgOrmPmJI4u2c4+dTP+INkDanmJin3CgvilmPJ0Y35QFsCHz1y5WeXAReyZb4VxTq8+MGVRcw==@linaro.org
X-Google-Smtp-Source: AGHT+IHmGcn94bCG+7yeoN04Pfkv51TfaBYxZTWCuh+SFrl/kxcXQafuW/FIzVGl5+G2BrORTygb
X-Received: by 2002:a5d:648e:0:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-39cb36b2a7bmr3036510f8f.1.1743771639925;
        Fri, 04 Apr 2025 06:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743771639; cv=none;
        d=google.com; s=arc-20240605;
        b=aV/1xQkpjbiu2XlMsn9AqPaBdz5w33xIKv1S9xUrtddj3GbobTaJ7tzz9RVwqm+Tjm
         YWAZ3jYeliJBcr44/t7s3by9au27OiU2yp4TvTXhzp/5OPdcx3uf83jM4IBj8zH5/8vc
         3/keul1JfU0i3Q1DNmYiJ02A1K0sJfHmsEUVfSDDp+GBNg90lFaFNm131dA3wr7VqQGD
         cf4opx5Rz0Pl3YV0oO9nL+/1uirLmw7iXl8wavKi+KkWgo7egyqSK3k2gN7HUlUzIBd9
         /jik1a9jEcAGvvTz2q5LyVJbY+QPFb/6m/ECr2JWgZfIbSEFRrD2V/FWiAko2DYt47i5
         jPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=40jQKBMJ/aNzNcyAYEcfx8nB+/5raxxsr0RnBg+r3F4=;
        fh=i4PnU6kwZdgkdtQShld8jSvddi44YgY20iCDWqs3oyw=;
        b=R40EuDvvHlqgdbOrgDSP/8UBsI+4izvtAbno2XFD/TzxkcQZRo6Rs7EB1GMTACdbrk
         1FGZ0AR2PrejCznRJ97L7qu7ZUQ8sX23nFutscoD1W5fUGedWXfQM/1g8p/wwuD/V60M
         tq3z4VRA3ZBLkR8pBr1Moo3Adz//cSnW6MfXh/JSX9l7spxUsQJvFw/3IW/nrfH3UOUr
         YgSZfJ4FOXx+1dExD23M6aNWj3Acy19A2d/MO+p9LlUyJQS7++ZBM2xv2Lcptm0lndGc
         OR1QQ050emF8Huv3E7+uYHq9cp70Xmy76asruPFkvvszGjBKW36JK7wdaScNGvexCwaQ
         jSIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7+TYdxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-39c30263b97si2536064f8f.829.2025.04.04.06.00.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Apr 2025 06:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B7+TYdxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0geg-0008CO-QV; Fri, 04 Apr 2025 09:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u0gee-0008Bl-Fh
 for qemu-arm@nongnu.org; Fri, 04 Apr 2025 09:00:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u0gec-0002zC-Ku
 for qemu-arm@nongnu.org; Fri, 04 Apr 2025 09:00:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so1773698f8f.1
 for <qemu-arm@nongnu.org>; Fri, 04 Apr 2025 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743771613; x=1744376413; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40jQKBMJ/aNzNcyAYEcfx8nB+/5raxxsr0RnBg+r3F4=;
 b=B7+TYdxYZV2YWZCPFFvdStxT2yxm9zxER8OT1Zs9w5/sAB9qdB+B26YRaelPThQ5of
 ltRnowZ4iM0h2H9xL1Nv8rj6N08RVRmuT+OZVdy3bT2okHJBLjMvX7LqXtp6lfXW5lHV
 MioyR/zIwtwnwJr40+XT73uvM6PMIR0roUxYfWgRoski8XN64Dxk1XJCcnEG8EBYIaIe
 vO2mkvWjFJUMMMOBnOd/CJBmlwd0gu6mUMScyrAFpHtnFwYy86FDZUGV1Npt7rX+Ylwi
 AjX/wvknmXQccw6huFAUKi6n6zVgaU4akEv1QqBQOwRjLXxfk0HNqNhJ+apTpvKil/nS
 RSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743771613; x=1744376413;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40jQKBMJ/aNzNcyAYEcfx8nB+/5raxxsr0RnBg+r3F4=;
 b=PHLIm6t8pXNUaOVKdZfOimG1F6UjT+THgXv7bAu/MQs4L8rMRz5FTLBwAjWSXDRDVT
 vLcIX4faUmNqdXcjLghloWhJPfUe1G7llt0jCMh8CDtSSjS8ueM3GKpujcO1nOGLO+QA
 +fOqyCwEQgoK3+7V+pRxt42VtWFCT+gj8zHfjxOI8HgUVuiKPyYYqPD7qPPYknP37dDp
 W9UKG43SahbjIdTv70cCQsxKPLYFArn83vMCzVxCD44TCAoCySK512iIfUy8VJDJxeLd
 RUwk/V2mhzwS0Gfj2fxTLVDWRdhNMvRZPFBo/xuuZF6W0B8qKP/CJ+Y6dEJS5pYw/1/8
 QyHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP6hPew2Er4VUcBNO8k/X7OdonOW45t0NNSR95sO/OEfHuBywxim84opaDbWpPUXP3YjrtxuBx/Q==@nongnu.org
X-Gm-Message-State: AOJu0YxZNkFP91cgLVDWKg3rVBiQnxr7SREae9eEIIXXNJjurRLMb8Nf
 YGexvStOyZ8xIan2abrZBujx9vCZXxKc8v09umRoFecyLVO8gowaxk9tLVFr7jE=
X-Gm-Gg: ASbGncvNQ1+ideM2LdTncIlwCnzNMqH/eTDRrnuk05wSN/7Mpt6P19sISWJoIo57UWX
 O4jhqvk1jsFt4iWJ8XCgrxgfmMx/oroWEb4sVqBKL81xbjjxXJ+Jow1CdaX17TqNKm/Za8g8i9N
 H04UaRrgWkSQUD0MWNuKtN46JO/ePKhp5aiEI35SnKceQ/WN4xgc0n9QQ1UqvitXL7pqkVHS6Yj
 nUGUxMBo2R6U/VFdUBC9G8yhx3xwBvCS1MKboYc75zpniEDy7fHNGWJTpaZcvqL4p6YohR24web
 rtH168C47+r32oIvGYPTMrMq+AjzHTmHr9jcPTXuQQt1qqRJO0PKdP1iIPcBOVLs7iyRcjXrc6G
 iDD3Vmjr6oSpx
X-Received: by 2002:a5d:64ce:0:b0:391:3915:cffb with SMTP id
 ffacd0b85a97d-39cba9825d3mr2583810f8f.43.1743771612659; 
 Fri, 04 Apr 2025 06:00:12 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a732asm4351047f8f.30.2025.04.04.06.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 06:00:12 -0700 (PDT)
Message-ID: <99497c16-cee4-4098-9971-f61ef7174412@linaro.org>
Date: Fri, 4 Apr 2025 15:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] hw/misc/aspeed_sbc: Implement OTP memory and
 controller
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Kane-Chen-AS <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250402091447.3381734-1-kane_chen@aspeedtech.com>
 <9171629d-a386-4971-802b-cd26cc42e194@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9171629d-a386-4971-802b-cd26cc42e194@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 4p6h8UAualr9

+qemu-block@

On 4/4/25 14:06, Cédric Le Goater wrote:
> Hello,
> 
> On 4/2/25 11:14, Kane-Chen-AS wrote:
>> This patch introduces part of the Secure Boot Controller device,
>> which consists of several sub-components, including an OTP memory,
>> OTP controller, cryptographic engine, and boot controller.
>>
>> In this version, the implementation includes the OTP memory and its
>> controller. The OTP memory can be programmed from within the guest
>> OS via a software utility.
> 
> 
> What is the OTP memory ? An external flash device or built-in SRAM ?
> If the latter, I suggest using an allocated buffer under the SBC model
> and avoid the complexity of the BlockBackend implementation and
> the definition of a drive on the command line for it. The
> proposal is bypassing a lot of QEMU layers for this purpose.

More of the former, a built-in eFuse behaving more like flash. So using
block backend for the storage seems correct to me. However I don't think
the implementation belongs to hw/misc/aspeed_sbc; ideally we'd have some
abstract (or interface) implementation in hw/block/otp.c -- with methods
such program_otp_data() --, completed by hw/block/aspeed_otc.c.

Current patch might be good enough to start with IMHO.

Regards,

Phil.
