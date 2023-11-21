Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp684934ejy;
        Tue, 21 Nov 2023 10:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiaMh3Q1dIlcqWKv1QAU+4yFc7gYsfWvOqAXudZZ8/MOdXsXxY3eYmGQiMEOIz9yK3G5OS
X-Received: by 2002:a05:6214:5018:b0:679:f25a:6db9 with SMTP id jo24-20020a056214501800b00679f25a6db9mr1432392qvb.35.1700591976426;
        Tue, 21 Nov 2023 10:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700591976; cv=none;
        d=google.com; s=arc-20160816;
        b=tfxXOk/5KMdPrFQ2DOp7RokDfwwsJQWoeGYq/QqA2gB00a77oBJEQGoQR0Uj5NJoGT
         XXAvtmnaPwfbHz1RQpuV1+H9nfAETgl0xDOWUTGkIhXhHC0QhEeGHAJwkL/hil6wYSUJ
         BRPEcnPhUzw+Nhg5jveCOvVI/UItzcujP3a7R0Oafu/ahg6od40ckhyBlaXiXBNNVk5v
         81oQxQlSPyuC+Ah32qVsxXzgJmQ/DZUeO4SEGNjiDvWPWUkyafj8QjtkOfdIkg1yQB3F
         5iIGjIIZcJImegM2+EzuMV3bBp5OYH3fUbZlwj2zWBMw+n/rX/zt1OR9IlReqtvtD0af
         7BfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ixkzMv4Ldn41DeWXjO/cFLuj6yD+a3sJ+OcGKtoffm8=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=VOeoYzVnXDYSRaUasKPiV+0/864ImkhbPvsGNuyn5zTnCa6fOaxxZEHgJFb3VPd4ya
         5aBTR/A7foN1Wm/EfVONRC98bW9ugd4Jui8P3A29hdaoiJJ0fEDE6q1/DTradOs8Jxsr
         G/UkqyZ3ALYoWjvFMrsAL2eQ7qPTsAFsZQZFs89YKFLbc+1d+RGPuTwe6ou9dlsPiCGr
         2Wnb04FQrfacMUL0GaCTLZSGWnoM1juKBA9ZW4XDbou6KBqZ6gRRlkQ4jR6mEA5M3rlu
         EbwjwfC1JEDV1T+5zxv+hh0GV14K0Bm4oHOYwWv/ScRIF78DS1lVly4/M1TnKqXnCEor
         eJpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1uYoJG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a291300b0076d9fada6easi10015760qkp.727.2023.11.21.10.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 10:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1uYoJG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Vee-000485-0j; Tue, 21 Nov 2023 13:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r5Veb-00047W-Fq
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 13:39:21 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r5VeY-0005Fr-Bq
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 13:39:21 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc0e78ec92so38346565ad.3
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 10:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700591957; x=1701196757; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ixkzMv4Ldn41DeWXjO/cFLuj6yD+a3sJ+OcGKtoffm8=;
 b=A1uYoJG91+JRjnJ//bWOZoSaIRrBWrsivbpbecZ78D+N4dVxHKpvEj73yeyR9buQvf
 u94A7vVAY0ttEHQGHF4L3IuhzloT0MkDds5vhwe2dgAXoqi2Y/5+h9s3EccyxVzi0Ykl
 +DbHkhuWF075cf0kuMTOaUJEknjHs2Xapca8wXkZ62vruCXRVVGI+ZDTnWJAq6mrewnr
 2kPL0KOFg3rJ4BNj5mn0gwK2fon+pibc/KarlPsJ0I+7gtMOKwN62ocuLqwo5ZJ088bG
 phup8uGQpbxsuv9rmO070eMF3mncjCOQmVLz3QjQGRTzu7xuAbSpxbKnS8NY/n5Umzep
 7Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700591957; x=1701196757;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ixkzMv4Ldn41DeWXjO/cFLuj6yD+a3sJ+OcGKtoffm8=;
 b=T0onv62hT4mMn+SU0iOq+kYEBjOaC9n6lVgnD0QO2CepNfRVz5MvoTzLets5JpkhLM
 YoVM3mFMam4MJIdewpfliXm+Vzbf8FdCEyhn32DbRUt7qpu+Di/Rs859nyf2mZwDbOFe
 RWJAbXtufGtZLCEOTcqO4mZ5kGh861S6IrFBU9ElRfcHRfPZ5PPId0gTYP5JWVIUsxi2
 JdZL/FxVYGmq/JOhtyq2qlt9/AAP5Dp6neYmTMIFsWoDMVTPlTXDcHuOHiwVpq8DC+vs
 GYuww+UKkK2bld7LJrD2k5owj03iniQxF/68P8u/gVB9f+FrvzvL5YT2k5hXm+RWXQFz
 P0EA==
X-Gm-Message-State: AOJu0Yy3BLrihAsCAa/8QrRhn4HHmAheWNbWuvYgLjIo4nhcPZP0VTZg
 Q1zNWHf9IiLCQxzfjZp31JdTPA==
X-Received: by 2002:a17:902:d4c4:b0:1cf:69ac:4c1e with SMTP id
 o4-20020a170902d4c400b001cf69ac4c1emr4571804plg.17.1700591956682; 
 Tue, 21 Nov 2023 10:39:16 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170902d34900b001cc3098c9f8sm1042722plk.275.2023.11.21.10.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 10:39:16 -0800 (PST)
Message-ID: <8b3fe672-d7cb-46d0-87d6-2c89a0d3f272@linaro.org>
Date: Tue, 21 Nov 2023 12:39:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Don't implement *32_EL2 registers when EL1 is
 AArch64 only
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231121144605.3980419-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231121144605.3980419-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: RS/ITGD/jYaZ

On 11/21/23 08:46, Peter Maydell wrote:
> The system registers DBGVCR32_EL2, FPEXC32_EL2, DACR32_EL2 and
> IFSR32_EL2 are present only to allow an AArch64 EL2 or EL3 to read
> and write the contents of an AArch32-only system register.  The
> architecture requires that they are present only when EL1 can be
> AArch32, but we implement them unconditionally.  This was OK when all
> our CPUs supported AArch32 EL1, but we have quite a lot of CPU models
> now which only support AArch64 at EL1:
>   a64fx
>   cortex-a76
>   cortex-a710
>   neoverse-n1
>   neoverse-n2
>   neoverse-v1
> 
> Only define these registers for CPUs which allow AArch32 EL1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I happened to notice this reading through the Arm ARM recently.  This
> is technically a bug, but you'll only notice it if you deliberately
> look at what should be an unimplemented register to see if it UNDEFs,
> so I don't think it's worth either putting in 8.2 or backporting to
> stable.
> ---
>   target/arm/debug_helper.c | 23 +++++++++++++++--------
>   target/arm/helper.c       | 35 +++++++++++++++++++++--------------
>   2 files changed, 36 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
