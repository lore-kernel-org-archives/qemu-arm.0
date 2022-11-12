Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1388869ejx;
        Fri, 11 Nov 2022 21:29:07 -0800 (PST)
X-Received: by 2002:a05:6a00:3011:b0:563:5e0a:97e8 with SMTP id ay17-20020a056a00301100b005635e0a97e8mr5643557pfb.75.1668230947304;
        Fri, 11 Nov 2022 21:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668230947; cv=none;
        d=google.com; s=arc-20160816;
        b=pOMRLs5HciKVLVre8cAhVl/E55gmkV3vwrh9CHk5UF+zbAtILW7obWndkFuY0djhzR
         HcXv4w087mPu/j4i3HSzekrpkooQCoCYrBOQdvaAwtr6Sk2B5zl2zBIOFCPtRwXhoYaL
         5PbJ5zt8+1BT5nd7FYN3TGwA2IYOhnPswA0Sq+UOz6q8WtTkNQn6MFuvgF8z+Q7B/C5S
         fZtbaZAD/fPrZ1RYxoUbqFNa+ZQD5HpE1zDhc7tEvN+xczBP/1BvDqwEGZcZeb3KBYnN
         v7BuPQgCEZB4QFunhA477GAIy0RO+wuUlk1rExN78Ec6YDMVlJRpZZQg9cx9bh19KCRf
         0qaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q5gU8ipiRrz8dtkFTDLWFTjOXTZAEzfd68uklGNyxIQ=;
        b=C4XaUBa8AqLUrhtfT3L41zmfbseeX3sccMIWADuplwVsDpPHKZJcc9kInBAcQshZvz
         mODeQwf82Ln2jPB3K3NJYev9+I7cg2CWv6FjN+nrzfm9lNLa3ZZxSlyQP/nxjaPumvpU
         F9OjrIrSbMlYVdwU4X4ZecmudX9aSBwBvY/tgHnXIgD/dy9nI/u9gh56CgdJLLhU9FZP
         nrxZbdw2mYrQ+s2yeUGcSZDEkRUkFjB4kOCWkE8pp69fFA2JVkpvdK5H9oChXqy61J3E
         FM5Jpf4Jj2MTUPKg9gs4xiYiIhjgIdNyUSwniyD7mkWWF5+npquA5lqbQ/ldv3purtyL
         jYEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EsTcS/5g";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j70-20020a638049000000b0046ec9889ccfsor1914096pgd.52.2022.11.11.21.29.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Nov 2022 21:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EsTcS/5g";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5gU8ipiRrz8dtkFTDLWFTjOXTZAEzfd68uklGNyxIQ=;
        b=EsTcS/5gFSUpcGEYuuw2MGupOY8zjopRu0ktKqja7Dj6kFaFr5ZxZTsgNGVL3TDH3O
         T0D8Y5J/QHqver1RNfGmBRzlhyh0xOFhQk750LXsWEdMMIPXC70dvKJQqX31E0/UyTzR
         AXdS6eSb5jXwkpUwNrbjQUKFlXmN6y9vLRrF8dVI1cSmyHiYvrSCoCTMeDd70zZ1Tft6
         jHQAIqIgfZv0TkafOOVqQqlbaKviSfFh3eMjElAWFmKOqIFfdE7IY0HqqmQ/WMS4SGG3
         cOstR0jkru4i8Csf/UNpYQBFT9FpSElmEAMXG3mmJVaevLcJKiS6wG1VV+2kkinQOQzj
         RG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5gU8ipiRrz8dtkFTDLWFTjOXTZAEzfd68uklGNyxIQ=;
        b=X6HaeIFd2s7tOMdIQjzq83eCq/13W3ADKbUXr86qMZrIGtYoOndhSz72xblfwCo18Z
         dW17hmSzTdf7OKFecbfNNHtOorzTFOu64IGqLkavOgWO7SvebcILkMAarp6U0eVOp9Sn
         6SGUkGm0a7c3/H3Vd1zDtfv36QKRi17XMPxTsxlBckXNQ1CaQSz7TQ4Oe0HP0fMg1RxM
         Shq7kF9Y+CCJNBfx8GD9rs+QBiITExb3WA4Sayzt2XNyqqxTKHTnGjH8svyqqDGk9YJB
         nlIZPou+uR76N7sh8CvHIrg9hMKTlpgFK5RBstbuJLQh5eNsJmyILHccektMjz9tm0cP
         XsmQ==
X-Gm-Message-State: ANoB5pn9slUb3KkAGflupxWaigQxkgWDMRiSpQ6pDhsrDILTLQ7sKksB
	eqxgv/E64F2govwwpSuhdzFoTrUfvyiwQZ46o/U=
X-Google-Smtp-Source: AA0mqf5nYyjlASOS9piFe90wdi4YeHxP3ydP5US24xV2Sg8mf4qxnEKSccJW83HBVHf8OxSdOh9xkw==
X-Received: by 2002:a63:e00d:0:b0:464:45b5:745c with SMTP id e13-20020a63e00d000000b0046445b5745cmr4430453pgh.118.1668230946854;
        Fri, 11 Nov 2022 21:29:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07? (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8228:b676:fb42:ee07])
        by smtp.gmail.com with ESMTPSA id a4-20020aa795a4000000b0056d7cc80ea4sm2476240pfk.110.2022.11.11.21.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 21:29:06 -0800 (PST)
Message-ID: <97d50924-66c3-80d7-30cf-f157da6477aa@linaro.org>
Date: Sat, 12 Nov 2022 15:29:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 04/20] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ARM KVM CPUs" <qemu-arm@nongnu.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: h+9izYk3Nkfl

On 11/12/22 04:25, Alex Bennée wrote:
> Although most KVM users will use the in-kernel GIC emulation it is
> perfectly possible not to. In this case we need to ensure the
> MemTxAttrs are correctly populated so the GIC can divine the source
> CPU of the operation.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - new for v3
> v5
>    - tags
>    - use MEMTXATTRS_PCI
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
