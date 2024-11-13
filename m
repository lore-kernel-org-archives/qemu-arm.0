Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp625046njc;
        Wed, 13 Nov 2024 11:44:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvIT627z+cpAInFyEaOQsOxxD6giC4S67wfz1iXlSXKdBOBXmwOO9ZaZ1VjoOyvcn1xEjzO8BCRmSbGA==@linaro.org
X-Google-Smtp-Source: AGHT+IGNDblR0GGIGkeTMlTM+u1U/sqzA6+o3AmgorQL3PfBzBN1fiF+ab4BkN8z1oLRi2/pIMz6
X-Received: by 2002:a05:6359:4288:b0:1b5:fd3f:149e with SMTP id e5c5f4694b2df-1c641e808c0mr1042192155d.5.1731527074089;
        Wed, 13 Nov 2024 11:44:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731527074; cv=none;
        d=google.com; s=arc-20240605;
        b=Zjdk+GXf99w+6IoXJa8UUTDyASsElTDwINZ9X7n/CDANcZ47gaMZow3nnRJnlCSBsp
         VHCguX6G1GWZ0+vefutsM17v4XbyrJ2KRcQHLmQ0Zc/moIUgfYQDaEXaK/QF3xud/zXe
         gRp68uCeueCAfx5t/B87eW8EbZtbG/hpZ39ZegKAE6snotfai8LJXZRFBSwDRLrwIQDk
         9CCBNKcDQQ+5UU0/Bzcpg5Tv4z01GEt3e4J449IwkuYax3RlScNJGHLgmjUr7+g3X2VJ
         bpSlaAF6wUXN30nz1owzez5LC7V7cX5t9+GcrGJQT5TIh7cy2XcxnMp6noz0jnT1rpFl
         ypRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5FnGOJlzM4v16n7fAGoTZA1iNCMi3ElcQ/5A/j+cRAs=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=ZXRws1wwKU0JghobYF2SqkvZM4mD6n3ZtnMSd/niYTRQHoZ1YY3Fu/ocZF4ZrSs36e
         4kSaWMsyNQOa9zrD5NoOZfrrOuwt30A+ujTREXczP0fQP0qGpemfk6Yx0kmHMOpeD/+/
         JUgt2Ic2fbF06AMiLvrte+ud9UeC4My1DLdmJzH8CVY2MAEVrD9KLYlV4emeru9+slR5
         Cmua9PIBYxS5Oi2yy7kjo7F1N90MiFUUAXlWt9bT6afk4XYUMc3hIb/PLI18Z8+VziSv
         29xA+ew2SkTqAowg6h/t9zadKlPeSwAExp+h7t7A8mPDWZVGJUJ2G8fS7r5BYZzBln06
         ewvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phfZEI7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40f8ebsi160881511cf.18.2024.11.13.11.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 11:44:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phfZEI7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBJHk-0005FG-5O; Wed, 13 Nov 2024 14:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBJHi-0005Em-B6
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 14:44:14 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBJHg-0002oA-1Y
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 14:44:14 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d55f0cf85so4917929f8f.3
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 11:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731527050; x=1732131850; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5FnGOJlzM4v16n7fAGoTZA1iNCMi3ElcQ/5A/j+cRAs=;
 b=phfZEI7gIsmrQyDJGKoZEumS3Vl6K873wQR+9edLB+yfkb/eDpNVjcX8jKkmLZLWvT
 74LMjIRoA/pl2PR7cYElG6YFuiqhqrbkwaUBl9jTV9kD6tBiJ8VLJa0IfEwUS1A6rsuM
 zqEyV0XEeeF60vk3Be3KYAOjB88/gXKuzqwVow1MsQpZQ8axdo+ROPZUpmH1bhC1c6Nz
 UWWwHN/3src69bsoBipDFx+IOS0OWd6FY+1+9dGG1f/hqeeGldzPKnZbzQ3HoiLNC2Db
 E5r43X5WfAXCZloMfDuym4o0QNCKT6/LkCoX+pfnLksrJpSyxy7LjUjw1oo2Sqwi941I
 2X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731527050; x=1732131850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5FnGOJlzM4v16n7fAGoTZA1iNCMi3ElcQ/5A/j+cRAs=;
 b=XqlIITR6EdKGNScTuL/K0rMzapuzQxn5CGIgLdWjQYryaGeFz17ThQoIteN8Djxv6h
 93vFUiH9NXDHzUC3Lr/jKDwW7qksj+d28LebgbXXv52FzqNjiLMqj8o3mAHNirWt8fMH
 FPdFMa08j/r9LwCLR0aJdVHQ6/GUQSLlEEy8xWI+7j6HJ/kheS/E3ZbUYMMYZdSPrZzU
 6PoxnkrM7V7eMuhKQwbHSArQP+FKhpNi6a3Tc+N+RIVsOOI9qcCkiFHOapcZaPuQvJdN
 drD8QAy7u3fQjojKwAb8/p6O9JvBYb0C3+u9uHyjwSSMkaWXx2PoCF4NsDa3brEaR2qC
 8zyQ==
X-Gm-Message-State: AOJu0YycEwQO0DU9+I7EanZxMYHqV4NiA9ZIdWyBUd+7zr1K7amPcMDF
 NhnlRNcpiw+AHo2XIKextlpruNEPZ9dMQWqHBnwJKNDlt/odnI9fpAvPwSVuSnHkGviBRHGWZy1
 3
X-Received: by 2002:a5d:59a5:0:b0:37c:cee0:96e6 with SMTP id
 ffacd0b85a97d-3820df6714bmr3740679f8f.27.1731527033260; 
 Wed, 13 Nov 2024 11:43:53 -0800 (PST)
Received: from [192.168.69.126] ([176.187.209.238])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea4ebsm19209651f8f.69.2024.11.13.11.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 11:43:52 -0800 (PST)
Message-ID: <14068cfb-4f38-48bb-b0bc-78c56dff5ebd@linaro.org>
Date: Wed, 13 Nov 2024 20:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2] linux-user/arm: Select vdso for be8 and be32 modes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241113170124.1944984-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241113170124.1944984-1-richard.henderson@linaro.org>
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
X-TUID: 5tWA3ZpHzM+w

On 13/11/24 17:01, Richard Henderson wrote:
> In be8 mode, instructions are little-endian.
> In be32 mode, instructions are big-endian.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2333
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Based-on: 20241112203757.804320-1-richard.henderson@linaro.org
> ("linux-user: Fix elf load and vdso alignment")
> ---
>   linux-user/elfload.c                       |  31 +++++++++++++++++----
>   linux-user/arm/Makefile.vdso               |   9 ++++--
>   linux-user/arm/meson.build                 |  13 +++++++--
>   linux-user/arm/vdso-be32.so                | Bin 0 -> 2648 bytes
>   linux-user/arm/{vdso-be.so => vdso-be8.so} | Bin 2648 -> 2648 bytes
>   5 files changed, 41 insertions(+), 12 deletions(-)
>   create mode 100755 linux-user/arm/vdso-be32.so
>   rename linux-user/arm/{vdso-be.so => vdso-be8.so} (95%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

