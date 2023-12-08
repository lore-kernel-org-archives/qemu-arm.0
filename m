Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2493625ejb;
        Fri, 8 Dec 2023 09:56:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQlNBbFLYV/u1Uo35+OrfqMSPswfIRVsb2hjWut2fVXHtGFR0CnwdO52MH4E+Dkz4PSNsf
X-Received: by 2002:a05:620a:470e:b0:77f:37c9:fa72 with SMTP id bs14-20020a05620a470e00b0077f37c9fa72mr484710qkb.57.1702058178635;
        Fri, 08 Dec 2023 09:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702058178; cv=none;
        d=google.com; s=arc-20160816;
        b=AZy9cyM0OeAYtAnWZSxsrA4GL3y2TC/ma2SETur4ah8zKKSulWpxjpSYjTesQVr/c3
         dBQxjD+R5xV9NPbW/3edVFTwQG9A8jSPpZywXZ53Cpkl7NtNeA3OyclcLbS9fNqMAiCO
         0SZy7O1/JhwXlxJQo36Ts4+cMdOKjMPwtFw+H6T5vNiwJ+KoXT/rMXiDxwwJdV7cjGE8
         i2N4UgHztoaqWNNW2Zn8kVhAxXVS+BsSopOObxqc2w+//J1gNjvE0d+IQLg2IcH7lGXm
         q2NGVDPjKAX09nmpQd7Sc3nKcuhNSn3S1wUsKRjmRpeCekbhWSBRYdwsQa0tsTX3J9P7
         Zdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+jP/u8lGlVLSLFJhRc7P674RDlo2t40scYWkindSGFA=;
        fh=E5Ae+sw58p11tFK58Zyhxow9EJHZwrmlzwrzmAw9P1o=;
        b=gWC6iH3VFMUmSKYJnFxfpROxkedNSIoQBXVjIHUXpkTEORKe3xbVn9MTTk/Z6FNsRR
         zqjoj+qEG+J/6nwpBVLf++79afEWXg7EwbUjYdk1S8mSkpEHmte5LZsGkjoM6R+AvTdK
         6SDFAYRGAPtF7gOgXMt6IBQOe/P4ZSGdkGh37rIzDumTNIN7nltKiXIAFIbRLev/6whq
         x09IRwajhnssCsvv43bU8AYcy8M5IOLT/zBrehfKPMCffKaiMy7662obCWboo+/L8mMQ
         vY/iHVznQ7mQUHvXxpKqg0G+gnA/l9eQs5fSGVPDIAUFvQEPtD06Bbn5mzF6iCO0spH1
         fNGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LcIQ584y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23-20020a05620a101700b0077f04ef0224si2335291qkj.782.2023.12.08.09.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 09:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LcIQ584y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBf56-0004hE-LP; Fri, 08 Dec 2023 12:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBf54-0004eY-Na
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 12:56:06 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBf52-0006T4-MN
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 12:56:06 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d053c45897so21525525ad.2
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 09:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702058163; x=1702662963; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+jP/u8lGlVLSLFJhRc7P674RDlo2t40scYWkindSGFA=;
 b=LcIQ584y3rNQ/O1WOND7qHUXXh44QmnX34t8zBAD4emGcHcjgcNEZXphvlnGBlqo2c
 EtsUlTl5IKC2j7FZW4ZQh5pZN7J27H3MS3KVffULVJq9NRhK0HiY4h4kvNnnhEo09A2Y
 woMIW+tK5i5jjy5QHAVSbKIJEozovlQUSy/UAflx31D+PZ1I1KqX+Wxsink4/0I+8q5c
 Zfxa1iunJ69dgnox3jU5wjwgEGX5dEzDUaDL9tsVcc/aA0N4u1GD64aae3VEAiBUcsMG
 rLNfleIsUNmqm9C1k7wNcQu+7qU2247qQStBaY/oHSquAehg6oqUK3M8j0VZWXmxolu/
 PcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702058163; x=1702662963;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jP/u8lGlVLSLFJhRc7P674RDlo2t40scYWkindSGFA=;
 b=aJwxEGbQ3ypVoSbgVZCfufgzW9+qgdqjBB8+ageI7TqyuEehl6xwzujTA+wDE7oiYZ
 Sqq0r6UH5GiAJ8E9umt3fjzOmCXrLv2z+5+BQs2H7IEtFuhKqTJWRiT1oivfrVMCmt+4
 ymWP1YbAe8EPy2cKyoabN2yPV3yVmVrs2uXTIRkwfZGoWvE6yayP08dCbixzviCinHnr
 lVf01Qi3rjqt+ag4bva/Jzh02eIELP0PMG+skGu5xmLCUtVXo2KM1dcgwnMAPWG+rhGX
 YwSM+I6JGd9LT5Yqfnb+uiGES8Qf1JhhN1WWAYv6IM4tHzY2xEToKrlhSA+N9FrVLhDX
 zNbQ==
X-Gm-Message-State: AOJu0Yx7Cp67ATHI3rB3zwbmw/V03KurlLPvcqIOtLBv077cVbfC0bPH
 qB21qTSwRJBmgVGJeyt8lp605QjYC/tfzQxK5thQdw==
X-Received: by 2002:a17:902:704c:b0:1d0:6ffd:9e23 with SMTP id
 h12-20020a170902704c00b001d06ffd9e23mr447419plt.117.1702058163465; 
 Fri, 08 Dec 2023 09:56:03 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ja19-20020a170902efd300b001d0b0334a9asm1988324plb.155.2023.12.08.09.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 09:56:03 -0800 (PST)
Message-ID: <82bfc320-eea0-4cff-8264-ae92a06e98bc@linaro.org>
Date: Fri, 8 Dec 2023 09:56:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] system/vl: Evaluate icount after accelerator
 options are parsed
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231208113529.74067-1-philmd@linaro.org>
 <20231208113529.74067-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231208113529.74067-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: 7hUjT0o85gjg

On 12/8/23 03:35, Philippe Mathieu-Daudé wrote:
> We need to parse the accelerators first, to be able
> to check whether TCG is enabled or not. Then we can
> parse the -icount option.
> 
> This allows removing the icount_configure() stub.
> 
> Fixes: 7f8b6126e7 ("vl: move icount configuration earlier")
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   stubs/icount.c |  8 --------
>   system/vl.c    | 16 +++++++++-------
>   2 files changed, 9 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
