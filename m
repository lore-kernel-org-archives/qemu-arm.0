Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3391987njb;
        Tue, 9 Jul 2024 09:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVE77glx2ZEjIWG+Te4zMez6a3nrsP99Qw21aQJKGsKmmsSZcmBu7hBvPSOiYBV3MB6l1VSIvSSaaKrY5liukYEzvLzygtq
X-Google-Smtp-Source: AGHT+IEeoHM68PiUk9xzWKYszAoQW2bbAz5WWPPb1/Je7bb/r6IdGnhgiNZxEhCSj94PJ9ORig9p
X-Received: by 2002:a05:6830:91b:b0:703:6883:30be with SMTP id 46e09a7af769-70375a16d14mr4300897a34.11.1720541886874;
        Tue, 09 Jul 2024 09:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720541886; cv=none;
        d=google.com; s=arc-20160816;
        b=rkDrNKUf+MQ0/aX5b206ENDrxLdKvRyR9FdhFWAGLrnIMcw8rebTU4nHGbA8O3wbny
         Rn10kxH1mSI7DawUzhEBBlHM28FH+PlCMvmPtLQ1SavjkK4dn1lgln/JcohYeOwwNign
         q+GP01YmjMFsmrtAzkO0q1O/B6VFDlNy+fNRn28ERYhndtcc57ws99nldhFcSUhNXwy9
         OVti8VSS+eMHxYBOt9flr3NSHmPWnnyEpdXCYeW2u/vsvtJVpsOnrHHnRBWMMsEyMXM6
         VU1W9KH4/HAMRS7GQfDXWcGnpc3Y5T99fzaxWMWqTOdIh3giELHgGW5AWmG5FeAVF7ST
         1KDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HQV9IqPRxLGXxLIQTrXSG6o4U4NPQXcg+KnhPigLzPU=;
        fh=s7lhMNpO2K7duUy3w61VQ66YbWVQYpi/qjI+2u1UsV8=;
        b=MT4wyIDf2dLjBiGvxW6cJDEU8CV/CxmBRQ+/gAQKTRzYrQw+B2Mo3hTzhu4CNLmYdC
         v3SAqRy4HsI2E4FPFFQjNuAebU9Qmed3U5lXDSx21mah0sHJ8dNxsaR3R72kVhGpQBPe
         2JexzEVX7vMpJo59EFofiHCVLFRjbT2u+ZK/ZMs8zOTZKV8Xn9T47Z+SY4RvKTzIq5wr
         LdsezeRqpzlQ41OhSwWVD2PMddJsmsdonZqTQka7J3fek2v8zGRiN6rM5revRHQSUZYV
         6pptoghVcLkcGZfmhJ3de81iU/7N5KPh0eklkREiT0AgP6liO6QqyL7jvb1J1HF2WrTB
         4yxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qf0xGbHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4903153f5c8si361291137.195.2024.07.09.09.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 09:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qf0xGbHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRDX6-0008Qw-AX; Tue, 09 Jul 2024 12:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRDX3-0008Ic-67
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 12:17:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRDX0-0007x6-H8
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 12:17:32 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1fb3e9e32ffso23075915ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720541849; x=1721146649; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HQV9IqPRxLGXxLIQTrXSG6o4U4NPQXcg+KnhPigLzPU=;
 b=Qf0xGbHLmYxaSuUWzOJPY1OLswLa6Hwv6yl2TrVXLOYbAZZbPaNRsWRdV03XuBnE+Y
 Je01S2TYCEPaGjQxqvioE0+V7qbsPXTlpYgQXx5vdlWTxz/Byagc4oidUNd3DlItdeEB
 AJlwLa0a/YsxPdGtM7Ds/XQow5Ksp0rXDtBt8+hFfoidlplGbIRJKgfQhtC21/lS7+8h
 RzqPK/c/BZnrOv6fskQfPYTTus8awtLRoyiVat/Q2H6xQrkEsntiYjvDSz44f3KoelMG
 mByCIzv+pguKJu2S28QsDklC8xT5SViVNbwipo48Lcg4wTEArSglNRqEudp+WbYmsbzo
 pSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720541849; x=1721146649;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HQV9IqPRxLGXxLIQTrXSG6o4U4NPQXcg+KnhPigLzPU=;
 b=ltpl4fOl/IhqHyy0KEAVAaV1q99f0hZDFcxbLyzm8ZH2AJqyGQ70doasaF8d36m6W0
 9FOJfuigbXW/reL8OeU5OyyYEeK5FZGT0vTjyA5DLmQd9+gTAsB1N6F0v1AYJ0lIWGOZ
 V2b9Imrk7K78bGYKBi9Hj7JZiZcrrJLFF2pgxyxJh5dXUaEiA3ITx8kGU5hPjJOdGkKQ
 TFDS6sWgHcaR2qdEKQ+x55gt2cP78vuCMamSv99LWD6V9mJMm5xdsW3dtx8NYVI5SBfq
 ocbrLeWF23n2U4eAdHHDusne2vTqxitU2LvZrucW07Z+o4ZaHOni/NtDJBd/gI5jkLzf
 FyMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwz55wWI5E7ZlvJpeAmcs7XxVFVmmcK+lQaMSyqQ2bDsqpYTKiZy7eRVE0bmH1aA8RzRFLmrlWX38xdDrfwUrEysE2
X-Gm-Message-State: AOJu0YzVXJOXmfe086yxiRcXdk8tppRxON9pOxz+QIJifuirrJlEuwn8
 jQcPWHNstiaXOfp9sDPVu/2kuEKF13GOUqKV+zd47tts9P5/bnW2W7uXtKz2uNY=
X-Received: by 2002:a17:902:ea0d:b0:1fb:a077:a846 with SMTP id
 d9443c01a7336-1fbb6d253b9mr21822865ad.3.1720541848968; 
 Tue, 09 Jul 2024 09:17:28 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a122a1sm18490235ad.45.2024.07.09.09.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 09:17:28 -0700 (PDT)
Message-ID: <c5c033b3-54f9-4c2e-95f2-060e2bb63842@linaro.org>
Date: Tue, 9 Jul 2024 09:17:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Fix unwind from dc zva and FEAT_MOPS
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 iii@linux.ibm.com, david@redhat.com, balaton@eik.bme.hu,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
 <CAFEAcA9+EP88kUB_3qpiFdsf1Lqb1NmbqM=+hNaC_5=kYWiJ9w@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9+EP88kUB_3qpiFdsf1Lqb1NmbqM=+hNaC_5=kYWiJ9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: Bx/R1gSOq0Ab

On 7/8/24 07:25, Peter Maydell wrote:
> On Wed, 3 Jul 2024 at 00:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> While looking into Zoltan's attempt to speed up ppc64 DCBZ
>> (data cache block set to zero), I wondered what AArch64 was
>> doing differently.  It turned out that Arm is the only user
>> of tlb_vaddr_to_host.
> 
> riscv also seems to use it in vext_ldff(), fwiw.

So it does, followed by a second probe for read.
That's quite wrong...

But you're right that it has a similar race condition.


r~
