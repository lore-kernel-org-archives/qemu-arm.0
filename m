Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1844951njb;
        Mon, 10 Feb 2025 02:45:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQ7tFbvj0mxh/yXwViAHwfPBKvYj6ki5xRPv7ARP/qT64YgWoIxDC165Cq66tVdWRue8UBbF7XtLsYlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHWxk+okE8u7CtFTAf/zF3aHHfENyec8kzPCgrO2ok2ZteaOzvCt5y23vlAC3WaD9KyIOfW
X-Received: by 2002:a05:620a:4549:b0:7b6:ecaa:9633 with SMTP id af79cd13be357-7c047ba6bdbmr2311812185a.7.1739184315908;
        Mon, 10 Feb 2025 02:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739184315; cv=none;
        d=google.com; s=arc-20240605;
        b=kurZjYgfy0tGNVpoi05rFhGiODLN0GAGAh5OPaIK+IEjqoT3UKw+4rSKaI7E63dx6O
         DvnRa38B8BqPvyG1bLL1MsrjHgKo+BJM5kylcIqIu0SWd+dz0oPxaaWw9S0i1rHpLixi
         ji0AxYgOSSQvdfVw8CrXYJFBGTcI6gJx1R3V+LQd19E8O0NNSYSckRWE96ftL5R1uwOf
         /olQogn2+XyFki/Hn95lbMzePa/kNTra7fm0eDZz6WNMc3z5tErDFVu2T1kXSq+mkw0T
         gVswhip4wiPfZzTtvZGb4QEFzAucwR2WjVUAlkdKV5dNAS//KsbZwBzELqMCKl9RYhC0
         /UPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D0Dwoc7RY4bZRTzAOMQfPuoeH3Y30Ed9EhRFs8jdDH8=;
        fh=zz4ix6P9Mz9CeH5Hvp6qx/mW4kOs9RjPOUirpTpd5is=;
        b=j39r90+2I3ddAcnMM4uvMVB27b6JquNg9L7+DRsAhmEBtvjav47oATFqfD7FAasfLo
         yWHHMYc9sztFwrDogJ+sjkFXJrwik6fJkxYEyutRWgd9ubCSAnKfORIp5EP5zPqxDBwk
         TeQ/mTaqJ5FWUGODG2ofPN67PkS9K2kII0eJYxALsFvrOj/Q9OPiLrgjfB/UPbwZ+iy2
         FHZy14MBYDGE5JAk2ZCseqj8BjXn3AmByJT7p5SrpZPobwZHKsiPLRgI3RKm8jJrXvnJ
         DX+2zrQHn1ffXglLUMfPUObIJ5JNP1lNamxg/5mlriE9jSEKfjzl/vSU7U9IWh4mh50/
         bhOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m17JTpe4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c05b5fe2bfsi251360285a.62.2025.02.10.02.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 02:45:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m17JTpe4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thRHP-0006kC-2S; Mon, 10 Feb 2025 05:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thRHN-0006ju-Mp
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 05:44:42 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thRHL-0005wV-Vd
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 05:44:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43618283dedso41428395e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739184278; x=1739789078; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D0Dwoc7RY4bZRTzAOMQfPuoeH3Y30Ed9EhRFs8jdDH8=;
 b=m17JTpe4wFr7C3Ww+yEAl39/t23BAi4FQx0auEN/LspKN2yUTUBRdJhwgLm6Cwn6OI
 Nt41JmYqk07w0rdAlVCxBH9LEMrb/CqjXLPakLVMx2dREPueE6Kh3QJmoWZNDlZCjcTV
 F9ALf6d951HwgQ2ETrlEJgSHdOJLUO3FQCD62xRFT8LQ54iesVzjlo5KIk1lI4IZMofE
 44AP3dEiiinsLZpYipt2dgjyuL98B33WfPrwZOfTSVu3I6kM1m3GKBdKKM35JIfVxFfV
 h/HWbDmKEhCUGbxsLqTeNAAtOwoHp1l9UBzNqRQlLcg/qKHte4A7+t6cswDPi6eF78pp
 nG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739184278; x=1739789078;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0Dwoc7RY4bZRTzAOMQfPuoeH3Y30Ed9EhRFs8jdDH8=;
 b=aDQr/kksUCzUkCqabjFCpZ6J82N9/FvBNMnYicdTURhmiOSKi8wQ+EvXB3gA2mPhb5
 YDyizbNaVO/sNrUnYwMjgiJ1s2vfIESvTJBFvK/PGiaVY66tUHm0IFE6ccr1/GiJXNzd
 ECkGnnm0OhwfKbnRLAdeJvQPPzGbX7XXoeAxiizcX/BanoSo25XqSVQNN+8WvVgT20IT
 CJEA3vcqabs9LrqLrmE9gOveoFFthUzH7hGO+sKySq9Ouevw4Dj9MKmOzyk9E/2fvve6
 1ZA9dCMmzSii0y2zp2kHQihK6L8Xt2nrK94qbJA/nVWfJ0tUABTw2jOL0ng1ZNeZhvqk
 gZ9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkIyoQPrTRnVVOJImx/v7WBDr1T88ty6BsclzwYSBgfnZGwUuZKABSMhiz+kIYDxz33V2nZ8q6dA==@nongnu.org
X-Gm-Message-State: AOJu0Yyx5lbe2kHDzr+6iVvFb+RRI86ZICg11yrnSyqrTzkFoiQUIrIe
 zFCEngRLhfJ9sBZuW9nclaXh5zD5fMLGZTi0jHAr6C5J5M+mAHZQ1M2bxHCApyzEi3jM/pueyRj
 WitI=
X-Gm-Gg: ASbGncvvI+ISUVmqKeuWdHyfNbtfp7zI13POrKz6lO90orBWJTLPipE6EELYKTvoSyD
 n7nRJMryiOl65PHNpl7QJ6fwKeFy2c5vQRIXoF7RK5wNACEPXP2plpByfxcTWFWWit2bS0Ggn8p
 /Y35btA4YFquw6PqME+2J+QnzdyHCboHuBPATvgaJAzkq9o9acMJLT7aizBiX2QblMyeyI5HGiN
 wGlfLJ71ylPJWzwdUeCgcmrGed0skFTBlrhU4Ub4BZ4JWw0tUruUE2wqZBbmbIxo/5wAe611+Vp
 3U9scMOXk1xR8gbSEtP0uJxM9RGRV1tQ/DBReto3VbAWzDke5WebGK/HYinIMeJe
X-Received: by 2002:a05:6000:1547:b0:385:e35e:9da8 with SMTP id
 ffacd0b85a97d-38dc8dd3475mr9256407f8f.18.1739184278172; 
 Mon, 10 Feb 2025 02:44:38 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb22f737sm8995633f8f.24.2025.02.10.02.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:44:37 -0800 (PST)
Message-ID: <e5bcfc84-ad3e-4ee2-bf83-b3c4aea4e56e@linaro.org>
Date: Mon, 10 Feb 2025 11:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/net: cadence_gem: feat: add logic for the
 DISABLE_MASK bit in type2_compare_x_word_1
To: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "Andrew.Yuan" <andrew.yuan@jaguarmicro.com>, alistair@alistair23.me,
 jasowang@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20241219061658.805-1-andrew.yuan@jaguarmicro.com>
 <CAFEAcA96ZLjOhBT9rhNhuk32ve0Qv4hUVuTTtgE=DBApbN98Pg@mail.gmail.com>
 <CAJy5ezovedShKH=HFbK9uRY44no2ijQocs29CHLt2jKoNL+Vpw@mail.gmail.com>
 <CAFEAcA8oaRVs8USMDGHvDW82AtRZGAhRCg189hhWtmRm2Y-YaQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8oaRVs8USMDGHvDW82AtRZGAhRCg189hhWtmRm2Y-YaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: o3CubdMCtAz/

On 4/2/25 15:37, Peter Maydell wrote:
> On Thu, 30 Jan 2025 at 22:31, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
>> On Mon, Jan 27, 2025 at 8:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Thu, 19 Dec 2024 at 06:17, Andrew.Yuan <andrew.yuan@jaguarmicro.com> wrote:
>>>> -            rx_cmp = rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
>>>> -            mask = FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, MASK_VALUE);
>>>> -            compare = FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, COMPARE_VALUE);
>>>> +            disable_mask =
>>>> +                FIELD_EX32(cr1, TYPE2_COMPARE_0_WORD_1, DISABLE_MASK);
>>>> +            if (disable_mask) {
>>>> +                /*
>>>> +                 * If disable_mask is set,
>>>> +                 * mask_value is used as an additional 2 byte Compare Value.
>>>> +                 * To simple, set mask = 0xFFFFFFFF, if disable_mask is set.
>>>> +                 */
>>>> +                rx_cmp = ldl_le_p(rxbuf_ptr + offset);
>>>> +                mask = 0xFFFFFFFF;
>>>> +                compare = cr0;
>>>> +            } else {
>>>> +                rx_cmp = lduw_le_p(rxbuf_ptr + offset);
>>>
>>> Is the change in behaviour in the !disable_mask codepath here
>>> intentional? Previously we use one byte from rxbuf_ptr[offset],
>>> duplicated into both halves of rx_cmp; now we will load two
>>> different bytes from rxbuf_ptr[offset] and rxbuf_ptr[offset + 1].
>>>
>>> If this is intended, we should say so in the commit message.
>>>
>>
>> I agree that it should be mentioned (looks like a correct bugfix).
> 
> Thanks. I've expanded the commit message:
> 
>      hw/net/cadence_gem:  Fix the mask/compare/disable-mask logic
> 
>      Our current handling of the mask/compare logic in the Cadence
>      GEM ethernet device is wrong:
>       (1) we load the same byte twice from rx_buf when
>           creating the compare value
>       (2) we ignore the DISABLE_MASK flag
> 
>      The "Cadence IP for Gigabit Ethernet MAC Part Number: IP7014 IP Rev:
>      R1p12 - Doc Rev: 1.3 User Guide" states that if the DISABLE_MASK bit
>      in type2_compare_x_word_1 is set, the mask_value field in
>      type2_compare_x_word_0 is used as an additional 2 byte Compare Value.
> 
>      Correct these bugs:
>       * in the !disable_mask codepath, use lduw_le_p() so we
>         correctly load a 16-bit value for comparison
>       * in the disable_mask codepath, we load a full 4-byte value
>         from rx_buf for the comparison, set the compare value to
>         the whole of the cr0 register (i.e. the concatenation of
>         the mask and compare fields), and set mask to 0xffffffff
>         to force a 32-bit comparison
> 
> and also tweaked the comment a bit:
> 
> +                /*
> +                 * If disable_mask is set, mask_value is used as an
> +                 * additional 2 byte Compare Value; that is equivalent
> +                 * to using the whole cr0 register as the comparison value.
> +                 * Load 32 bits of data from rx_buf, and set mask to
> +                 * all-ones so we compare all 32 bits.
> +                 */
> 
> and applied this to target-arm.next.
> 
>> Other than that this patch looks good to me!
> 
> Can I call that a Reviewed-by (with the above changes)?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

