Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1413277lfb;
        Thu, 6 Jan 2022 17:26:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY0qHN32R6lpwvUBPuDrvaKvcFLUp5IbWKgv/ZBCqn0VP0+pDleoyB3n0PEOmoV9jcy0Ra
X-Received: by 2002:a25:1b56:: with SMTP id b83mr1436732ybb.85.1641518773148;
        Thu, 06 Jan 2022 17:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641518773; cv=none;
        d=google.com; s=arc-20160816;
        b=YR3kSnBPHnjP54zliL5HDdO3msIwvlmNBuNOTfV2hy7jiLIpYfD9fiQEvKMAx+xf37
         jSccF3tsbFWFR5PRA66IpwQKvh6ndBNnhGxDg3KWOsD5VmB9sxmpCB9hSX9tqKWz9RFh
         t6B4+Y93X4zjvReyOYVzVV0PuduU/KW7K72Ps2eK8aFs0Ng4611XiH69E0f+FSmfZ/Lk
         I74FWpvieC/gUaNLUjG8bUKHsveG0XAYFg7+AtzrqBjUsN/teDQW2aSyFT+lYPRwTEmW
         QR2mipNJC7M4Y8BksgUrfXD53tEmIFLP32lgVFfhb4xCqBJeUB9YOcca9YsFrFIV954s
         oTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5DocmTehJBloY7vDxORMh33IoGBmiNc2Xu9fT6rggcc=;
        b=qSW0i4VvwtQG6tHFv28fZNYQ+jXoG3K0fpdDWaSCCNqnvFSF/Ert4HI+IvosAb3qW3
         nYey7zJCNwUbPtw5BuCI7RwgVQ5CvTpT8++TgjUJ9/oUCg83iZBU2N0RyF2wL0D9koKB
         UU6PZ7ec8Ft122nL9kxD+YT17AFt6EidNhXUqz0h4p3y+0Z6vPM4beFY5EN2edpJ2ERe
         sr/TTpW5EE3LnPZRfrohvAvQzGNqVc3oBuxNr/EdY1DazfjqURcSAGgK5kQh5qudlcbL
         UzdpXckMgDrQClYsjfPqinW63Yw0BGa3/MLmZf7aN6fcyJRiplEJZeULmd1cpQ+kNjVB
         3UAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nMfSag1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si3358232ybt.545.2022.01.06.17.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 17:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nMfSag1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5e1D-0007Lu-0D
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 20:26:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5e0m-0007Ko-ER
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 20:25:44 -0500
Received: from [2607:f8b0:4864:20::633] (port=40952
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5e0k-0004B0-LQ
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 20:25:43 -0500
Received: by mail-pl1-x633.google.com with SMTP id l15so3709440pls.7
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 17:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5DocmTehJBloY7vDxORMh33IoGBmiNc2Xu9fT6rggcc=;
 b=nMfSag1yMn5gs2JijKAxm/7lwU3pDQKdjMetz0t9ZObZcGORYxK/n0Obs2QxbmClDQ
 vRoWHfIbkdAKZVr2v5yt47Z3mDD0ncjjUNArBmlIVh2snhUG3Es4tTjX+r/iTnL31BJL
 9zPUQqnwWE7DGuuIdlXMznyy1fqEm9rzj0/kqaexJAgGJ8gAuDqtavmW+UyRQB/TiIBu
 Uz7+mJOKS7NxvugU68el6sljN9uFmvctzzSwSmYghnWrmG5fBnTzkrDOeMFa8kIXH0vc
 Yhhji+9nCcfKxwKHb/wKIg6u0SLiYhCoK6h6h/drLEux7vO8dJNWKvtSqCTBYO/jaYRg
 cOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5DocmTehJBloY7vDxORMh33IoGBmiNc2Xu9fT6rggcc=;
 b=VflWUUvecAvAMTHJRwpDEzdRJj/vjTMXKslR8/JoBMRGwwyxUlQjfe6b0r9FJzktX0
 cs00Yd7kF0tk8NVQP/EouiNgBDcbQn96kuoJvXQ7jg83jaEgASj41X7akOW2dvbCQCE2
 ME8cqor1mtSXiKZlCiPS4jxckcqrWfTwIShVQ72nR/YJnE8pr50Pvlnl8hx2BGbAWWFn
 5udvDEZazyAsq41o+1aFCTBuekSAuTb9se/taC7RBiGd/EjvLeeFlx2rOI/q5pSLoQ25
 P3yKNcvvZaUt46nh6rrkfxFqbHy1M58A5+w9fwfDNRmd+aqNoAYt4xLfo6mG6F5H5Sxq
 ujDQ==
X-Gm-Message-State: AOAM533vww+BcO7auQVPTAe5OqGUu0b/YBt2Z/Y5gyVxCwF7kJv7KW0w
 fcAQFEH5PmE5b6iDHABz1Ns6rQ==
X-Received: by 2002:a17:903:1110:b0:149:a428:19f1 with SMTP id
 n16-20020a170903111000b00149a42819f1mr35122216plh.120.1641518741235; 
 Thu, 06 Jan 2022 17:25:41 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e16sm3464535pfd.38.2022.01.06.17.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 17:25:40 -0800 (PST)
Subject: Re: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20211231103928.1455657-1-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0570193f-7a2b-9fd2-ac4e-76aeb671f2e9@linaro.org>
Date: Thu, 6 Jan 2022 17:25:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231103928.1455657-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5tEofkBzfF1I

On 12/31/21 2:39 AM, Idan Horowitz wrote:
> Some of the instructions added by the FEAT_TLBIOS extension were forgotten
> when the extension was originally added to QEMU.
> 
> Fixes: 7113d618505b ("target/arm: Add support for FEAT_TLBIOS")
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
