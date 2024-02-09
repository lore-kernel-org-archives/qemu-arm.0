Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp968929ejb;
        Fri, 9 Feb 2024 10:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvyTJm46UpiKdQbbcKkjt+MNim9+ChsqH/jq1EzN4cG6HKp/HDQ2t9RRQ3cIw6sJ2PdCv1
X-Received: by 2002:ac8:7e83:0:b0:42b:f656:c0a5 with SMTP id w3-20020ac87e83000000b0042bf656c0a5mr177306qtj.18.1707504943397;
        Fri, 09 Feb 2024 10:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707504943; cv=none;
        d=google.com; s=arc-20160816;
        b=GzW2dtVvkv7povCmbbB/uPC9+SOxQr3gzA+lhvIxyUymqzsPqSXCTfrkU+WrwLHFJb
         Ztw0iUMhHBxYmaA0HvEXHgCI9LyX4gC+PQfkS3R80YpX0DcXOWFeUDD9wFnkK8ICGAya
         RN68Y6n7Hx/Hrug7P+GDDczZvFhRDuCdSh7EttCQ5fKkiVqOHVElOF5jgklB5RbLeYXK
         OLLfbFj1yWkOaJls5M3maJSI9EHmbBRkOkEDMieNckwRRIhBvRBviEcb0bU51os/k+aH
         6hhk9dr27UIel50bACMJmk24lzxX0hL/XNxen1sOzt77ST7mPFX+tHPvfwaPnE4VZ2Sk
         SUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=AJzWnves6eRh9mYWq0SCFhU9e5lDWuptM9DFd6uvw58=;
        fh=8UDaM4OanVebLFxetOLMRbkP+nlxnEm2hGXA+qGM4IY=;
        b=yuMWYqleKvPhq/bCEZR3ZXgiByz4yvpTOfO73iu0rWUKqtgYtTmno5/Ti5F0z6+Iku
         I949dAs74Iql0tBjslWGBZeRmWkw/NG0nStrBlq/YgzUXh/NbPQ1EKMXpvr2nIb0ms+v
         wi+viEpBLv+zMBa2KZUn7+gvQcYV6VIdh4b++JdmIafHfO1hqA/vIy8K1hQIUudJst8/
         sSutQhz8gNZwTSgEF0BvxlD71LVFuJhQKYTmCjd8IqWOziKIW0hTCvjDdMAQmElhAVHr
         9+jWDWiQ5kIn3rpximl6afSsv7RG1SrDK7jPwKjaOailoXfC1n9d+/rzS/HBRN0aDjr7
         JRuw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JeUt7J+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXamQksLGALOWMgP8wXX9MUGHJFkgHXRGccnpcj9C4sS+yon7zygxi4fxbFSEaX8YWIlbDseZvjFw1D54lEy1LgFw2vCT5O
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020a05622a179100b0042c4b0cc3afsi2460784qtk.642.2024.02.09.10.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Feb 2024 10:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JeUt7J+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rYW1s-0000kZ-1z; Fri, 09 Feb 2024 13:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYW1q-0000kL-TJ
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 13:55:14 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rYW1g-0001JW-Ad
 for qemu-arm@nongnu.org; Fri, 09 Feb 2024 13:55:13 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4101eb5a115so11766425e9.1
 for <qemu-arm@nongnu.org>; Fri, 09 Feb 2024 10:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707504901; x=1708109701; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AJzWnves6eRh9mYWq0SCFhU9e5lDWuptM9DFd6uvw58=;
 b=JeUt7J+J6C2WOvyq3p5EVp4lnsp6z+TZ8rAih9a+GB2RNWG64Wz/GT3xk60Lr/ES6P
 YuOZgbIdtpc6a79xAePx9FlX5dCUDgHwbV47Xji5J3sq7Evq51DMuw6wC4mqJh2VFH8l
 IwVTqpur8pHuns8k9w9BHzt63hMhHRxxGRW18I1X5x/9ubn80iIqRIr6aczscf5FFXaC
 RyKweomjTxY+udIv2G17AQ1AgxUUMbdTY0VVLnY9p/zPjgQVHj/rPY3S1N8THbjHXzfO
 QCmwTKXn0+SyJ9fDVt7EsNFrz5sdV4yVuQSMYHgRI8LiCjprsKf3r1lBW5UF8y197jTs
 R0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707504901; x=1708109701;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AJzWnves6eRh9mYWq0SCFhU9e5lDWuptM9DFd6uvw58=;
 b=NxGeVWpfwSSesHu0NnrCpizC3yCB5GWQ9GbrNSFPIeTLapmPpnnwKk6DtYmpY3saH9
 lx9EOgeJZOx/9gtI8iIg17NX5dHpsn6Ibf/nDFSyP4snrgKiA8sTezK/H6zshn+iqi4C
 ORm868lc3O+lOTYLBagdfeJyaUvyO+HjjcN2nS/3JMC0dMZANck3ibxpusa32FuZWS8W
 GVtnJajwDqBZauQeLZIwzuySGY752J5iH38R5z991sxdGW2PPVpZFh7L8NcAUZDfJ5NV
 QZOFGAw/ljSo+0252kx35GoPrbpEoPHqzHpXPp70vQUIWYelimrTBCmkMAmLhRgPUK/4
 QlEA==
X-Gm-Message-State: AOJu0YzRDN1Oe9+f+/DdKUUfOrlaMn8z8oD0vw9vEGaWzDGvKMZuJxfy
 M6BI1T8x6fJlGNfjBAqIVZD8ou1VvxrkcJ86hz7SEsCC0fRgiuLep2M0emIdABQ=
X-Received: by 2002:a5d:5150:0:b0:33b:28df:c370 with SMTP id
 u16-20020a5d5150000000b0033b28dfc370mr1607898wrt.14.1707504901541; 
 Fri, 09 Feb 2024 10:55:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvMJUqRXYFWMM4joTOnV91KC65iaJh/5L0bNYvPtMKtkucQ55ACK7PIySj6/Z7cKJ0QUmDlPFV7yatFDRyXz+tIGo/s2N6hn/ajo330/wgorlC7b3BAplj466fy+nS8wQrZnaCuqUVe8IYDFgXSASQigLVTQ16WZncAz8ZASEHvDFLtIpDQDShCWK131hHMD97uY7uCt+m9ex7lAmcuydPmrmls9DrQTmXSrLaQv0EF97kgBs/MuiBhfPhOclQXaKVzKTnKMZJkbjPDUzKcp5lG5x5w5+v5LqsP3oSZuvPpFr27berlZPfDq/lGUWX/2jv1j760lELTj8Q3rkXGOJcMlyQsc89ukY=
Received: from [192.168.69.100] ([176.176.147.207])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfeacf000000b0033b5a6b4b9bsm2452528wrn.71.2024.02.09.10.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 10:55:01 -0800 (PST)
Message-ID: <dec65342-859f-4b52-9bc4-10f3be633270@linaro.org>
Date: Fri, 9 Feb 2024 19:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/5] target/arm/kvm: Add helper to detect EL2 when using
 KVM
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, miguel.luis@oracle.com,
 haibo.xu@linaro.org, peter.maydell@linaro.org, richard.henderson@linaro.org,
 maz@kernel.org, gkulkarni@amperecomputing.com
References: <20240209160039.677865-1-eric.auger@redhat.com>
 <20240209160039.677865-4-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240209160039.677865-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 6VwX1oZLlE8e

On 9/2/24 16:59, Eric Auger wrote:
> From: Haibo Xu <haibo.xu@linaro.org>
> 
> Introduce query support for KVM_CAP_ARM_EL2.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm.c     |  5 +++++
>   target/arm/kvm_arm.h | 12 ++++++++++++
>   2 files changed, 17 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

