Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp83832nji;
        Thu, 11 Jul 2024 03:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdUk1XQNa42vd+25CHWdOKqlcDeyne/zJTAEno3mkFDwToDFr7T3SrCCEVciM/+T75QBV4COtDOROZ3IoniJbpXjATcpm5
X-Google-Smtp-Source: AGHT+IHyHCehBp1oaT8C7mFBnu3bhr6rg/TY9CJf0ZgiJnCV+wec8bjo1BcPLbNZL5X2UOE3qXEr
X-Received: by 2002:a05:622a:592:b0:447:d49f:f94d with SMTP id d75a77b69052e-447fa8ece49mr78708851cf.24.1720694750880;
        Thu, 11 Jul 2024 03:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720694750; cv=none;
        d=google.com; s=arc-20160816;
        b=vDyRSKC2gaJ4zmjCBJhIqCldLmfErQ09PVh05D8E9oZvLA0nR6vyNwYcfuOMHOgfG8
         EQJe0JfBGdY/wIDZjcqWNq0i/qjfweb4WcVMYdkNSZftYA0N743ThH4l3iPGG3s+2jeS
         jNE7HtxkppUEdxUa4kaGPKNmHFEKpG0OUShX+bsd0vFYEyz+oOq+eJuLelnCJnUNFVz+
         NUc731m2sAB4FHSf7H7td317d21QorkS4mg65xrlUf4QnOndLDNzS/Ykrky/YdDeTsuQ
         iG8eC0kKLz4BJnyRNoO2NvIwvw2rJ5+E4d9zk0/sP4TNW0ftnIQ6N6xQP8wEJ+4vnSyL
         3+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=UE/NP7N7sANvA9P+/e+vpBsvbUNFhs3RSO6Z6KkMYOM=;
        fh=FSWirE3594J4EYEQaOGOKaMQhVeyFcGO4/ubMvnfZ20=;
        b=G3VDqEbX1+DcWpZfhA6vVUYpEAVcnepJOMyFxsxBdHCq1z+qdz/OI6gQdum72AZQJp
         GqjcatJWTWtkp+LDNn3UWkMM3HsHTUv1EpV0eL+wRFCC+ZO+TKAK2rJ/rKTgzTvuYWhQ
         loDRDMyLvs6tOoF9fkJMwt5WoNQwK37e8bFqWUtFjGGpC5vLQUxEZTqwHoJG4gfiUKX+
         Aqs9b+MFJE7k7THHhWNFNg3ZgW5TQ3GTiV61wEtHMl+Ew+GfnOPjfZu+16/vvi0T7A07
         ONt04Q/y127FCM2xvbDa557Tn/a3ek/WKFEzdWCk8wq+niGFZ+H5ru6YPVkJ6umA9lI5
         /E9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwkgtAi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9b14811si66295041cf.171.2024.07.11.03.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 03:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bwkgtAi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRrIn-0002UG-Ko; Thu, 11 Jul 2024 06:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sRrIm-0002SM-Qz
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 06:45:28 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sRrIX-0002Gs-9i
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 06:45:28 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so1195124a12.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720694707; x=1721299507; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UE/NP7N7sANvA9P+/e+vpBsvbUNFhs3RSO6Z6KkMYOM=;
 b=bwkgtAi41oo8o+JGiAG02QCBbhI/iQnZbWfPvz1KGD8dCdY1JADndb41NDsQfF+tbD
 7dRu4vRh0evjxKfl+IEoTwffkmTRMu9fnaSca4Mfpos2C3Zv1clgiXCdZWawatC1DiQ7
 ExyGirRROOmjJAoy+huZ/ZybozW6eS9uZL216He1orRyMJ6Uv8cxKDYsVJTIzDRaKhB+
 Tma3hrF8jixA+E46S+wr44jKuUSDRJoAegGNU6UW1F4Cf1NdT7Hf1A+TRmjWq9F0yqNL
 mZMp1YrO5AoNuxgwTs6/4B98L4X9bm6lDtrN9ScTBxLHxRBpKKq6qPgAkoasUvaK6bsX
 vDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720694707; x=1721299507;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UE/NP7N7sANvA9P+/e+vpBsvbUNFhs3RSO6Z6KkMYOM=;
 b=iZmSkXUNTaF6yZw6VBMt9ACUAlDTrK2dtTKUcSI+R4l8dIlmaHltLkFNWj1rIohIRU
 ++IQ6fD1ffaGaBqP2pkQlCazDKsWS0Qy1Uh0Knz4Cq/4vKNyOyQloCaLzR9vf3kNM6Bg
 nL519t6M48tg+BVU3o/vKHnPKSWxlIL+w/Vly5qh9jrKWVVNjGAjNpm/j4rRRBlGcGOD
 lajQaz0UPHkfJwEA5xcU6SsYsXBaNzd0dsNcuq2+0JmCFJaqFrO2dwiSQcStObDVjZWz
 X4Mh6Rc49C0FGEA7UP3ofBi8uPKZ+35tx51owBrgR4F+al/YW8jBpaPhx5qdgcMbdy9y
 /KJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBMBGhufuPJyRSyiH9HFL2J3RyzRJwxh5aX4B+8biXpYgedhFDuOXdXZaycRzQGVX0RIIH4ZEG7uyNgWR13dK9l6VV
X-Gm-Message-State: AOJu0Ywu64Ha8O7ixpd/wOnhwRKgLPCpDLg72YIBk9YQjnDjIGjBPkNy
 uAHI+xNI4KJwueVwv/xXJhCNHVHedkohFBYtB62htTgsTrtItF0zG9WeeBRV17w=
X-Received: by 2002:aa7:c307:0:b0:57d:1e27:65ea with SMTP id
 4fb4d7f45d1cf-594bb869e59mr4914748a12.34.1720694707259; 
 Thu, 11 Jul 2024 03:45:07 -0700 (PDT)
Received: from [192.168.200.25] (83.8.74.165.ipv4.supernova.orange.pl.
 [83.8.74.165]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc3efb13sm3310266a12.42.2024.07.11.03.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 03:45:06 -0700 (PDT)
Message-ID: <52707dcf-7f34-4573-b713-2d0f834d7f46@linaro.org>
Date: Thu, 11 Jul 2024 12:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/arm: calculate cache sizes properly
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240710173512.424547-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-q8uUzHaF1KazB7uuhgpbtrTKdL153Btzwnz6pvuOPWA@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <CAFEAcA-q8uUzHaF1KazB7uuhgpbtrTKdL153Btzwnz6pvuOPWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LVCnjCJ/boUW

On 11.07.2024 12:19, Peter Maydell wrote:
> On Wed, 10 Jul 2024 at 18:35, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> Neoverse-V1 TRM says that NumSets are [27:13] not :32 like in code.
> 
> NumSets in fields [27:13] is the 32-bit CCSIDR_EL1 format
> (i.e. what you have when FEAT_CCIDX is not implemented).
> The make_ccsidr64() function provides the 64-bit CCSIDR_EL1
> format (i.e. the one when FEAT_CCIDX is implemented).
> 
> I would suspect this is an accidental error in the Neoverse-V1
> TRM -- if you have access to the real hardware and can dump
> the CCSIDR_EL1 value I would expect you'll see it matches
> what QEMU is implementing here (and that ID_AA64MMFR2_EL1.CCIDX
> also says that FEAT_CCIDX is implemented). See also the comment
> "The Neoverse-V1 r1p2 TRM lists 32-bit format CCSIDR_EL1 values"
> in aarch64_neoverse_v1_initfn() where we document that we
> don't trust what the TRM is saying here.
> 
> How did you run into this? Is there some guest software
> which is assuming the old 32-bit format and not checking
> ID_AA64MMFR2_EL1.CCIDX to see if it needs to use the new one?

I started adding cpu cache info into PPTT and so far the only code I 
used was old 32-bit format one:

https://openfw.io/edk2-devel/20240710-acpi65-v4-6-bc32224e4be4@linaro.org/


Will check for CCIDX and adapt proper way. But that has to wait for 
August due to vacation plans.
