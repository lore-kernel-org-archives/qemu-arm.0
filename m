Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp553492ejc;
        Fri, 6 Jan 2023 12:36:22 -0800 (PST)
X-Received: by 2002:aa7:8284:0:b0:580:e549:559e with SMTP id s4-20020aa78284000000b00580e549559emr41314451pfm.17.1673037381983;
        Fri, 06 Jan 2023 12:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673037381; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMKzivF3SnzBwW0y3WLeFpbya0R44yxpK8QcDqsVKsDroaDWO7iIfVBiQ2C5bLv5SS
         maAGrSk1l1Qyr7kJhOuRL2KKsf8zy6Vcy0pptuDcZ0MjskilDtpJy8nUKuqejEKZF9/u
         msw2zxkUYrC5QurPzLRwVcBTqJa0+prlzE8K4djfJtt2m95Xb069zdOlomOUJhz0rbv6
         lZA4DssNjFYxBCJTucR6vU6CcSMuGnkGVzFdGe6G5EUCHPu2Xszvrn2Q2qsglLBKuvAv
         AyIygOfuNC4kCyVedSQ9Ug0S+SCyzs4AOvUHmojiTHaBTCsRDmntQzhKRT5t70kgEJB8
         BL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WLfKZTA+hdsKPRq63D62Wf7IIcPLQv1De1Qt1eVaRtQ=;
        b=i0inYe2PaV2Ahi2aa/WlObU0y6wliflCOQBQxDQKD4VBYycyrHJMNcEmr+bM5sI9t2
         gwWzApzW6M36UGgpyrWvPeOBlQ9kg+LHwpiVg6iki4SfISc2Hljf3ZVzd/MYVLncXFeK
         2jU4Idv0cHko5Dc0i/ClNZhhpOKq0qAnVjToTcR8QjNAS7T9xcxqyIKAVIc/hCPR3jqS
         sK552BL2zmmWgGxaOqWO3c2RPvZgZZnc7pVDVxUukBfYSeE0XQbHIMpPOgWGXccOmz+b
         mTMIl0Jag7oQJ1W7FDbXgLIq122UG+JHR1uczOnPC+4Uk0jNDZfX7sZ4eJ2IysspbQhQ
         H7PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JniOZ/2c";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d81-20020a621d54000000b0057a9b1468d5sor1022138pfd.43.2023.01.06.12.36.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Jan 2023 12:36:21 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JniOZ/2c";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLfKZTA+hdsKPRq63D62Wf7IIcPLQv1De1Qt1eVaRtQ=;
        b=JniOZ/2cUu2E1biC/jxFbXofRDwTQZpKwjHery8ij1SQw3JQDHu5RMK/O8BDz8akbm
         mqK8dLKbPuHemzjWHQXQDpDTrTH398epDwSLCzdq29dHjGUxZFQ4MVleqLlVjkueH+C8
         pvbE3VnaIGa64UvZbGXb5cNUSHs+ljsGQGm7u1ToRTXQQnfqlADvbDhr5QPztLYM8wSX
         hAp4nFqaPuh8Xaa7iC7jFAdAHDw7EVYt3C1X0TaAXPweI9uoVXydOAcILnlUSAlLLVbT
         X+K142lOEGLEPg7K72fxf2uu3LUU2XfOLLsGVQ+zuvNRJ5ZoDfVNpeqlSkpb6SfMjSLy
         lD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLfKZTA+hdsKPRq63D62Wf7IIcPLQv1De1Qt1eVaRtQ=;
        b=qzrXjKeLQggYKvCXRFhg/5zlE6MODG67zJ80PSybaUbG2WwaJEXXhDa8Y0W4mv0oB6
         8NlF58nDtDYkY8Y6dqE3jmbw+JBtogJpY3xjaiSaezYa6rOWlgiVNBnQzfiudQ+dPdms
         DcEr/mGfzWuuwtO32FisgCOqVJEni65ckq4B0R0t63qOPj9k+z/ru5A0xucD8DmTRirA
         tSnOEELi8B4z6Sykj/FtZgWrc0Rvo52bB5nbgsaFanSp1VmarMAUfn8NA2PIwkw13hwx
         cPcR6BMtPM5kzKmhgd5nJa1ZGiHm+YPQ/t37UlK49b1HtwVKfwDeZPD4/fgTcX79Bpq6
         kACQ==
X-Gm-Message-State: AFqh2kpC28skUvDHgFj6It68mUPN4f0wC2IakfpgrllaUrIf4mOHqvfJ
	J9zq/jyEIS2W+r9mLZKU2C6atW40eYM70OObuuY=
X-Google-Smtp-Source: AMrXdXt3VtfSq7J6h0807yzEPeDrLKwrxRHLLCQQclWdnriJnce84ZZT7k2BQAeDVb+3KMPu+H9fkg==
X-Received: by 2002:aa7:8284:0:b0:580:e549:559e with SMTP id s4-20020aa78284000000b00580e549559emr41314431pfm.17.1673037381443;
        Fri, 06 Jan 2023 12:36:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae? ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
        by smtp.gmail.com with ESMTPSA id y9-20020aa78f29000000b0056b9ec7e2desm1493617pfr.125.2023.01.06.12.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 12:36:20 -0800 (PST)
Message-ID: <0447aa15-338f-131d-bed5-49e768af1a48@linaro.org>
Date: Fri, 6 Jan 2023 12:36:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/21] target/arm: fix handling of HLT semihosting in
 system mode
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PfloVTqW54KJ

On 1/5/23 08:43, Alex Bennée wrote:
> The check semihosting_enabled() wants to know if the guest is
> currently in user mode. Unlike the other cases the test was inverted
> causing us to block semihosting calls in non-EL0 modes.
> 
> Fixes: 19b26317e9 (target/arm: Honour -semihosting-config userspace=on)
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
