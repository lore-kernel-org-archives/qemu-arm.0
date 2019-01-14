Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3464840wrt;
        Mon, 14 Jan 2019 13:07:47 -0800 (PST)
X-Received: by 2002:a62:31c1:: with SMTP id x184mr459288pfx.204.1547500067877;
        Mon, 14 Jan 2019 13:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547500067; cv=none;
        d=google.com; s=arc-20160816;
        b=pVubBGsOGRVx+MNVN7hZ8QVTWKIEhedl4qBglqFRAot9wF5xIteJhVOSsWuYf8r2Ab
         tUvmVHUp3PoRFH05u3nTYJU41CaWWqhaG+3pWp9kyHttHEqmMYdgc96ePKo50hDDWFET
         iHls611KJ8mPRhoeVcNwZ9xdXQj2jXqbIJvH19vW/r4ywtnUvagQhMkPJy1JkLxChROH
         NbK4R3DBbZyDXLILkKYQcioozay7jJnUVy7T0JbIGUGFz6fq8XyPxCm5563IecxRjp8e
         O0sFD1IekQhcwUup0rOv8wqnnmYVUm2rmxgWMzwWP+Fw/cf1oTj1kX1vkOLXUFw0uytc
         7s5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=VemYPBEOTGEbQHGnsbsY+GXNgbQou+HnXbyPtA/TFrY=;
        b=l3dMhsRkU6F6PyW+YeSjh0CSgu5ACUbfzDPTHA4Icz1VZcpF1h/w96aTGvFVpyyHMF
         GTsI1vVaIWf0IbzM+uSrHvLAa00FpVNWD90gGUX8M9uyLV094uz/6uzQHW1Gh6gUZGgb
         A2qyks7UNbpaDkrzfH1gPbNt6zBXcZBpfqOCIH/lTn4y2eNEHS/S+rPohiFZm0+xOr2h
         7WX1e/XFrjDRzEzc5X1ZbF4f2vHCoqXFLV7yqnPH8A6wnL+KzlCb7Tx8gDZHFrVhLh4B
         avBvhclLBMhx/2r8JXnr/3Nj+xS2lrtt9GBf+uH3/c/Ee2Vjhe/ErBO0znE60uZzQpe+
         cdvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LPG+k+aH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y73sor2486881pfd.54.2019.01.14.13.07.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Jan 2019 13:07:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LPG+k+aH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VemYPBEOTGEbQHGnsbsY+GXNgbQou+HnXbyPtA/TFrY=;
        b=LPG+k+aHiXzklbkrcbuG5z4U1na/RgQqzZJfiWwQCilJ8Igw+2XTH5fuHbnUBTr5Hr
         D8cEioigQOlsVvlMhLdSeo7cs0bbdSfUJiDxo3J1xNqtSF5EkDFmToxmRUFK491SU/+4
         G95IpVJIawHJjXEzsDjbhvt7MJU+7V6uio7to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VemYPBEOTGEbQHGnsbsY+GXNgbQou+HnXbyPtA/TFrY=;
        b=LTnamJnOVuuyTHrHsoo4TIeuK7M3X0IHh//v+r1UNQgV5Z5ZrkRXfj9cRygrONgM8E
         utuX0p+2jiwGD5FjJKDsBiZJ0Ru49lzUIfm/c+5ad7NJt2hkwSmirvNrzKrU5VkBacA0
         5ajV6uM2jtT4xfAfUCtM/pIjnPrB5YHSX6C+YMUlv2jqzyo9su5mk3r9JKUvfiw4vfVQ
         JJL7dOGY8Zhh0k/jBh9yu+iK33BISSfx7L+L6gAhylfVsZcP+4yb2wTXRnuycmH+k7Gw
         c6RIiOmsaeWeov+EEH9aqKnS89M/rREDD75Yf+RhG/66DbWzvhW1gdDcWpe9HqHYHCG8
         4gJg==
X-Gm-Message-State: AJcUukd3vtruXYEeN38A9EZwreZE+OthqEx2iv3r9PCndVxPr0jMvX1u
	ErOAW663WZHlVfvTSmWM+r3WiCq0T5zJgtUj
X-Google-Smtp-Source: ALg8bN752tXgwXRFw2K1oULiexyLm9PhEDz8BF5rlrk91w82UnboU/yGGSsD7+T5K2zke6tFs8Nhwg==
X-Received: by 2002:a62:1043:: with SMTP id y64mr474940pfi.78.1547500067246;
        Mon, 14 Jan 2019 13:07:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net ([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
        by smtp.gmail.com with ESMTPSA id h15sm1377277pgl.43.2019.01.14.13.07.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jan 2019 13:07:46 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 17/17] tests/tcg/aarch64: Add mte smoke tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20190114011122.5995-1-richard.henderson@linaro.org>
 <20190114011122.5995-18-richard.henderson@linaro.org>
 <878sznpbd0.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <57ff8f98-95c9-734d-99dd-22d4ff350951@linaro.org>
Date: Tue, 15 Jan 2019 08:07:41 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <878sznpbd0.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: KGCnQSpWHda9

On 1/15/19 1:22 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> ??? Requires a quite recent aarch64 assembler.  Use .inst instead?
> 
> How recent? Given buster is nearing release we could start using it as a
> basis for the ARM cross compiler images. That is shipping gcc 8.2.0 as
> of now.

Not yet released.  The patches adding the support include

commit 3a0f69be5589d351453afebd0974992cff3ee4d1
Author: Sudakshina Das <sudi.das@arm.com>
Date:   Mon Nov 12 13:29:38 2018 +0000

    [BINUTILS, AARCH64, 8/8] Add data cache instructions
    for Memory Tagging Extension

but the most recent binutils release branch (2.31) is from June.


r~
