Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6171838wrh;
        Wed, 1 May 2019 11:35:34 -0700 (PDT)
X-Received: by 2002:a62:b40b:: with SMTP id h11mr77625371pfn.133.1556735734236;
        Wed, 01 May 2019 11:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556735734; cv=none;
        d=google.com; s=arc-20160816;
        b=dlnf7B/MhwfSBZAh51U9iJi0MkWhQgazyAIWpTvMNoAtPhdJRcAqHkVQKIzFAxZyCi
         r8nXGa6LVHVeItLRYflfenw9nH2rDywJUOdsT+1JiQQtvqEOOBQje6gL2gBJHjRP4FEz
         m2dnVdPEQqUYgvD7qNgakjZLTyXoA/E8Tqa/1iD9Ynt4wNwuQurotDdn3ACdcvuDPuwp
         RHfJahX2Zb2oLtd+T9x60UZVNs6LnCvWHIPOGdxL0keBK8RI01TtF2SFaoFNsqiOeqvv
         u3+DrTRPXzveHp1YWOU9b0BLroZMBg3u3qAhbvhuIAHjbbkvv4t/l6KVwldj2hoKkUjZ
         1Rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=/sComUGv87sauQhT7gaTU1Nhjwr3oZnxQdW/a7IN+KE=;
        b=incAlC+VxSs+CvgAo3nCLIKyLPrbVWBCTRatLFN8QiiONBAwDBji3FCW+ABi8xrsP1
         Z3l6OrQ/PpCVQjry28KND3udxH94wjBjHdug1VTUJVm4GyetMSUEPOhBxPJbMCIlGlZI
         zfCzGwCvS2AOmlNd3soiS9CRXjrtLjKTWTdQWmst9asxKA7lerhFNQHgA0GoMWKZJ1zF
         2/7FHasofvV0fRqC3oSsNOGgPmS/+Q9BuAvDOdd5BAmUaSS7Zy/tkK/DZRVCFmjVKvjm
         Xoi5srEdoszw8C//lS5ZUsk2nzCPxoAEcy9JWpTqOytSbe30tNZ4TVzASKlfRHRvpVTE
         dIAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h9IH//8w";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v12sor5227238plo.32.2019.05.01.11.35.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 11:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h9IH//8w";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/sComUGv87sauQhT7gaTU1Nhjwr3oZnxQdW/a7IN+KE=;
        b=h9IH//8w/lZ/Xp4zLI9gSESVuVsS7Ijv4ftGWZd5LR2YmCs9VDM/zRvS3pdQHooIRZ
         xgbPToo5SSpIifF5/BYOqHLnbE8xvUS3yXhKAO4XIoAMNhjH30dNoxRaNA3TkQbn05vm
         wV6WDZviLnN0/dfQJtBqcco0q8lOBuc/2fQP+kNT/AKYyaCn0B4tfsJUjeIvDK46Y1OA
         jt5C5tZ3DUKQKh38RiJNKDoce1uKbbqeK9z+xxk8FvnuEnkL1AFzg/MvRVAMVnbdx2sG
         GJNqDuwZsMnfx9DVhMTtGnX92TUoXCq5sMMUcXqVec8dtuLANSa56MU1btgVg2qjLdad
         BbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/sComUGv87sauQhT7gaTU1Nhjwr3oZnxQdW/a7IN+KE=;
        b=Mq+xzfkfnGQQcPrIKNJP6tpupD9gk0k3qtpDALbI/Obi7ylV6M5R3IXljXOHc4RQkJ
         LxTMt8aC0KJxxWj6zS36R82fMnESFvp4P/q67TENwke5aNhgpsYKfJ/HH6keg8QgPYTO
         AU4plcPX//mvE8l9UaC+BXj6dxIGG+x2glGHguL3Hzv6zImicCCtVUh1Yl54mk8cQ+3h
         tbgFQkM3Nqs7w2ju7LzQpMhVeH5y3zW/GlYFpQP4E1BWSq3+9A0pxxaR7sUOI4aWVKR/
         xhY3xJ6sg3fnaHelFPEOOBvbpbTYcELipxw4+ZZtOHL/NqB9o5AGgUyy0fPb8PTcDTaI
         1Yag==
X-Gm-Message-State: APjAAAW4zePMYDPokzNdksz4x0Ns7rtQtIYhST+sQMtQSZ+/X0/lrfPc
	Q6rV4XTxkQ/pn0eBlwCvr7bgUM3cK0k/3w==
X-Google-Smtp-Source: APXvYqy7PLLE6DgMd+d1PKCY+sVkEku0f0QpX8cH9UoYCkRKASvNXEOGpO5lrQlob+Vrv4eNFPXGWQ==
X-Received: by 2002:a17:902:968c:: with SMTP id n12mr33436801plp.105.1556735733635;
        Wed, 01 May 2019 11:35:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id p27sm10523470pgb.94.2019.05.01.11.35.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 11:35:32 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 02/15] tests/tcg/multiarch: add hello
 world system test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d4fc9a25-f382-8008-5e42-09269fd39c08@linaro.org>
Date: Wed, 1 May 2019 11:35:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EULS0XKs5GiD

On 4/30/19 9:52 AM, Alex Bennée wrote:
> This is not really i386 only, we can have the same test for all
> architectures supporting system tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/i386/Makefile.softmmu-target       | 2 +-
>  tests/tcg/{i386 => multiarch}/system/hello.c | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename tests/tcg/{i386 => multiarch}/system/hello.c (100%)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

