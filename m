Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5966930wrh;
        Wed, 1 May 2019 07:46:35 -0700 (PDT)
X-Received: by 2002:a63:6103:: with SMTP id v3mr11314610pgb.48.1556721995013;
        Wed, 01 May 2019 07:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556721995; cv=none;
        d=google.com; s=arc-20160816;
        b=JYy7CgL1nMHZWexG9lui04eSfktmk1y6j1PaIcOUv2G9cyNeVWvZ96u/7j25PZGti0
         zx0+Lb2qYIdya4C2yYsb4/tOAB3MsRojyDydsWt2yIWafrzvKTmHb2zeIedWWtvpRaJ7
         s8g3P4NI+a26WXAeGWBhgJbTW5SWpW9JpmI3r9pCerZWtmzGU2FsJZxHdSDsOPUGURv3
         knKweDgo6ubTqKYOYrDRGM60sjAqkLbCMCeQnIRfvFfVM5I5RXIbl6aLv1Daj2jxDD5t
         8cBe6H0Of1UjzpoXJ+bAgBYVqJue9VmnQpkJxOO+IW8lLej1XesMsACOVSnIEjb+jfuV
         Hhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=MXeR5ucxkzn+BPA9oGPvA3bdjTpeJcJstRMgb0ixZZA=;
        b=wG4CFObDnsXXE21xmrbq2AWL6jdZSGeTMbF4GO9EKoAEk5nZDGQW/VLVLCUzEp8pWN
         C4QitVn7hJ/f4X/tWEO2aCvW4D48Fj2+VDqcQ9dgXMulDe1CR5Q5AkG5raTo6xgy5rcd
         RwA6IriCsT+3AGxFEQAPDLNULOTZ9DA0+1jggg84FT4gC4UDt8vRe2aakjlVLrJN+Ham
         HMyChiyM9UNTSBebHaOBpXoe+1Xz6g2Sy0IMZLtftoAuqG3xOZMOwQop3VDej7Xinzy2
         GTGNWqB0Fe2tQ0EviL7Q5w7ECMVAJ5DhLmi1jVKGu4dLuaeeL4PFdU3x6aAUSmYNKGnW
         9sxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPORCtml;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m6sor4498587pls.17.2019.05.01.07.46.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 07:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPORCtml;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MXeR5ucxkzn+BPA9oGPvA3bdjTpeJcJstRMgb0ixZZA=;
        b=SPORCtmlyjzoEx20Iq1dz94iilotwGaZvFrkKwVJ33VOlZpm5k0Tr8VEt7q8pka//L
         7Ky6f2Ca+qhvYDY6pDmmjA3WLEHsVY4V2wygw9SCAf7Otgvlik/0ptbQplindhAN77uj
         DwWivTrutlWN1qguEP0vVsZvEBSMcUoYGtBIxc3VtSeoRVtt2JAzTHT+lCGfloHfCl6e
         /yMknLQXesHSDeGPFJBd7hV6ieO4ttG25BiL+TArEU3C3GrsV4xqhljPiFqW9MG14N+K
         IXaj1zNGeZRbcCbWDNpsvCdw2ybodV5KD/b6m56VyM5UedwnwUIAL1oP4xLAAxMrnXkw
         +cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MXeR5ucxkzn+BPA9oGPvA3bdjTpeJcJstRMgb0ixZZA=;
        b=bQFm53pItXxYEc4M+y37uJkFN9gfC6nnsZPh0f8AsDIBW4LprX+qzdYhr0kagphRCr
         KXLSmMJiGyPJMuDxO47FHkppfSSPJmms/pCqQyus3qEIjwBGFVOjHPXg2p0LCy7eNMN1
         kziEj8onvCZHPfpJ4jSySW/1C04DBp9boor4aIxNMUZjNtlf7xTh1hUhffW9kCVGK9HL
         Ip+tCevJM9oxCwJcIk862ObyfClG9D3fV4F+jP5YX4C2ObFafM3V64kcuzIvaB8D2Mt/
         Vk0zvfmsLUSem9l+3JlyGlY52ZAvcG9lBr93rCSjvGdQDatBZpkD2vNfE7nWb43P9iLg
         ZZOQ==
X-Gm-Message-State: APjAAAWus8MX26sSAchJECRanz9pUoTft8FayC55IEh5cH/UA2AhKRej
	Cz320Sf84RAr7P4mMXJ3FtyUrQWc
X-Google-Smtp-Source: APXvYqyCBrU2WNKPZRFf0OOqFS5TQFw2JS8uC8J0tCdKjdHIqb4GAsl0mEIUGJz4cM7ra79FK2E6YA==
X-Received: by 2002:a17:902:29e9:: with SMTP id h96mr58689711plb.258.1556721994556;
        Wed, 01 May 2019 07:46:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id q144sm46948224pgq.76.2019.05.01.07.46.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:46:33 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 09/15] accel/tcg: remove
 softmmu_template.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <357d799d-898f-3e1e-d4cb-beeac89cb528@linaro.org>
Date: Wed, 1 May 2019 07:46:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yFwZUOzBgQu/

On 4/30/19 9:52 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/softmmu_template.h | 454 -----------------------------------
>  1 file changed, 454 deletions(-)
>  delete mode 100644 accel/tcg/softmmu_template.h

Why is this separate from patch 7?


r~
