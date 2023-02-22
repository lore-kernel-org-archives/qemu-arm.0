Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5046ejc;
        Wed, 22 Feb 2023 12:50:36 -0800 (PST)
X-Received: by 2002:a62:1c97:0:b0:5aa:39a8:41a2 with SMTP id c145-20020a621c97000000b005aa39a841a2mr6689618pfc.24.1677099036246;
        Wed, 22 Feb 2023 12:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677099036; cv=none;
        d=google.com; s=arc-20160816;
        b=MBWSX/YccsfpiLuJ1rww0tSqgEAst8s5nOX1S/mhPGj1RxaV8mBmc+G23shv0UNLAV
         fY8hsuwMsbClB9ihC91k3N6x2XjDYNoD/WJrWXoKUl4bEdaVA0ITYo9dkfSTZw4gB03V
         2/EKf8u2lzmuOX2W12j1X/b93C1PnxGPlJVgpUNWNDncP7wLAwVl9tA9s37z9rmp+TSJ
         9x0fiptNmkoq+BZ2yiJNGNuw9ah/Ox9NPyTYeJMI4dCrlfnX+KtcpTjRFjx3zjuaohW0
         11hq4FUTr0CwSO67xP0HFCRjxcFsuLFouWrTEKP+lC7mzdK9Iy1Dd/NORqCQf4gZJAnY
         RD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1SJnQiiPoXc2ckflJYsxWP4AbYgnprIeOE/8hqQh0WE=;
        b=a9ITrDNCKTX5X6fG989olXyGkP0iZ5gl6EcQ2jUwW45PjadH3mD43rEaEZ3tDw/vAr
         eZkCNRWJd5K1QQHlXqFghcV4Dn7YfAI1bKhIDWgIPRZa+PxK7Rgc2RffE9kxbUNtann9
         u6Vaf5vB4IJ8mrjFzg2NaZJ5K0OdYuQQ3cbjueWMiV8Ffel3vlhozfQcwxElnzdTwPVi
         ApGDVg2609pRjUX1sWhMvISpBM6c4GcsCBCwml4E3aRdo/GuHCEji8z+Yf2gI1HUfPer
         tcJJ+pQimZ8y2L/rWhbGfmeIUxvyrQWRILqOcJFnKXCfH/D4190KR3s2w+RHO5Jx6oyq
         68qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="co6ChzT/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g17-20020a056a00079100b005a8ad851787sor1964652pfu.53.2023.02.22.12.50.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 12:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="co6ChzT/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SJnQiiPoXc2ckflJYsxWP4AbYgnprIeOE/8hqQh0WE=;
        b=co6ChzT/VHVB6Qa+rLbtvRAhFUZDq1yoikJMPQkpDtqnbdUGIaEmXXL+SkR26xG4jz
         Z4TpIsjnc63b0P1KRBW3V0wsaHM4eGGTmE0hfwNs8amkATSkyNFju79AVaVHpKuj4kPx
         fR/mmxLA5pDMOIZQlLMq8lwn0JN8pYgBO+mIOAEvOfBNs3WYosYvk33SHZ9/vy0JDw/8
         1qov8WD3OPEEl0xT6TXCVmmi4CKRR4l1CCmj7zs2+gCGCQK89kEN4Ksnhae9zZCsTeRc
         6dlccJfQNpiBbKzka14jNFo3akGeC0D0PFgXM/hKSl2k7cXrQvrOMDFSrvCTU2Ae3yL0
         X+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SJnQiiPoXc2ckflJYsxWP4AbYgnprIeOE/8hqQh0WE=;
        b=0U6pOe6kFGO84aOUQcd6400eiyrOywrqA1CUbrSffLuWov+YirmqqbCcKDaxN1Yg4J
         RWlUU6yuFDLqLN0EWKuDryoOP84Yz54lAF7s/cgqfaoVcSMS/qAeEQ+vcywtmpYLt64R
         rbiF6nSQnjX22Zs7mtQvaM2iHvUdXG/P3Je1xXMtQ41IzWGiHtw5g6uq8rIKatDCcJzW
         ycwyyULlL2svN3UL4E4RWSJ9c6ePuRPdgkMsINYZgtHj9Ys/MKcjVuiEM2G6m4pxK5XM
         pUvtgOVq/tu3jarlSd1AXKyihreN1KXFpiJjmk60mybionZX5naYxequXUCKcmGMLO3f
         V2Dg==
X-Gm-Message-State: AO0yUKVvYEz1nsmpP84EXmmMH3phO1awf90LybaMLDox73qIq61FmRKN
	IHO/UF4XCAEuMhXku6K25Nca6JSn
X-Google-Smtp-Source: AK7set91hEzLkq2vtp3yxBICSlwrF65GKhS2Be1cT3q9vKZgzpSQLp5NIFMWllGlRmB0q0SVyuBXxw==
X-Received: by 2002:a62:524b:0:b0:5a8:adc8:6de1 with SMTP id g72-20020a62524b000000b005a8adc86de1mr8138808pfb.29.1677099035681;
        Wed, 22 Feb 2023 12:50:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78816000000b00571f66721aesm3342365pfo.42.2023.02.22.12.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:50:34 -0800 (PST)
Message-ID: <05dc1251-593f-69de-4ee5-f76b702601a2@linaro.org>
Date: Wed, 22 Feb 2023 10:50:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/7] target/arm: Implement v8.3 Pauth2
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-5-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-5-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0q0usN5TENga

On 2/22/23 09:35, Aaron Lindsay wrote:
> +        result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);

Simplifies to

     result = ptr ^ (pac & xor_mask);

which, IMO is also clearer.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
