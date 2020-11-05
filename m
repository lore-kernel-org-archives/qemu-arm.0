Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp96160lfb;
        Wed, 4 Nov 2020 19:47:26 -0800 (PST)
X-Received: by 2002:a17:90a:d082:: with SMTP id k2mr387508pju.195.1604548045944;
        Wed, 04 Nov 2020 19:47:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604548045; cv=none;
        d=google.com; s=arc-20160816;
        b=ghnhsoGCXN8wURnhc+XvJVTYzO0BHO/DFtg0/jfRkoorTlWXkUNLkqDPz5MWOVWUUg
         rryztPwmQlEyToA82qzd2ZRIaXmWEn0ls4TKf7Z/cBP6s95rUgVfq0ddsQePsow1YUu8
         vFkfP1H8xAdgHdjCsPQI9D8j2mHPoH/Du1X9E9TfOkUig5oGt+PHwAXjr6RecoKI8KHd
         yTJ6FB+OT+Ur8V8HasKNP8KcVv6kLF0djcbTs9h+F0wQI/WwRoPyrF2/ue8ellQVfBAJ
         4s57fEaiVe0M/oui6STq15ycEyq7btaMSz0G/YTaPr5D3XoXZbVfV1Q8c7u+l9kqKEOh
         6nGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=N6QQUqvOMh4CMWrSZ6mzBbQhbDDdpJ7YtoAcVTGIV2w=;
        b=mKxNFD4xLaFFMryK8QNU5G/Gv6649s/HIs+ZK3hyemLSiiA5POklltgNeSvCCiCuua
         La7XL3Ktg4/luTVkrzHsKsKhUIs8YWY2Ko3OrmmjZeDnwMbSPBnZGXavD2o/YA7DHzgi
         fXg9FkXGG50/S7ipTNDOiuEdjVgHaD33BxJMMiES9qw36TCngd/WWfcUBCjZ/NCATkQr
         LEov07ki/VftTgzXYTDPcFOms9qhLB8Qr8N0OYl2Q/ugkh+681UnAPjoMrzAaRhwhdlU
         2l270IBAPV5C3vIeeWlzBImtQLQDW9+xyoGsdCDSzubR0mqjQ/VNkaxWtkc3NUV9QLtf
         9iDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJ1n7udF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o198sor61214pfd.60.2020.11.04.19.47.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Nov 2020 19:47:25 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJ1n7udF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N6QQUqvOMh4CMWrSZ6mzBbQhbDDdpJ7YtoAcVTGIV2w=;
        b=lJ1n7udFA22WEeZ2RVhLgXMgKikpifQNUXSGUA2azUMTjBK9AEzEjOdRu+ouZ+hCuF
         mnGs8woJ0ua9UEgqGjQTKgSIx/kyN7tnsck/p6YGDTxJBN/KaahJtK68onqyJAEd+Jx3
         r3EviprzoQTLfeJq9+1k0Q8HesrP9b4rgDHG965HJLvVsnPNtcApvRrA05sGGcJokMY/
         PkmcRhYmlXJNlFdPtonvhKJu6jKHZHVzXtNuQ9ERS2eNCcspB8TEb3/H60Ff7DYEmZJG
         0DRSYfXqm6QYe5a/8LBFG3VJasqebmMa9gzixltF7xisp+d9ASj6XQNCqwi70cFG/1bt
         8GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N6QQUqvOMh4CMWrSZ6mzBbQhbDDdpJ7YtoAcVTGIV2w=;
        b=TBHwf/nXmZEmkvPNVZek+R0/yh39q4wbsLrL2qPtQJEArPrSHjn5T4JWBbjAahT5Ev
         GgGuNRFSfZiWlG+XAXpMZW6/oBO93l6GyZF0YxDwmD/0R0yXfCf/xbQrGn4GCSsVMIxm
         LgHsaZp70HcMp4Ct2RDnUC4pOhLe7Qs8GGD9sRQc0lQah+YAez3bHgqOOaGgqp5D8bM2
         P/rCSG/vldr8+SZSUZ7lb4G90RyJebAXJlxlmJpKqTr8AwvsYR6KabERIFFKOXD1mui4
         KS2oE1kSbvznpUXfn3M9PQuj8LUJ6SCIrbCTq40TotSJtWRdxAAKyuGxZwriWNoRdoNl
         Uj8w==
X-Gm-Message-State: AOAM532WvUWJ3d57Umi/9m3C4YqL634FolbCK9uKWa/9H4RoKLQ9nRPK
	aoCn/ntpOPNW93dqflEAhU8zzXPb
X-Google-Smtp-Source: ABdhPJzNxyCn9EX9ZVlPF+hllXc9NcmenybExMh/b4f3z9pfr2YedVFF99yfOhjU1a/G78Df7kxG8Q==
X-Received: by 2002:a05:6a00:2126:b029:18b:6372:d444 with SMTP id n6-20020a056a002126b029018b6372d444mr525913pfj.26.1604548045374;
        Wed, 04 Nov 2020 19:47:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
        by smtp.gmail.com with ESMTPSA id hi10sm580641pjb.0.2020.11.04.19.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 19:47:24 -0800 (PST)
Subject: Re: regression in TCG emulation of VTBL neon instruction
To: Ard Biesheuvel <ardb@kernel.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org>
 <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
 <87pn4taufd.fsf@linaro.org>
 <CAFEAcA8VNRTbSN4jowTzdZ-4fC+mKu+yEJ1nobo1CG668dLZWQ@mail.gmail.com>
 <CAMj1kXH1R4gjCHHNYSXd+4mEDE9_AzAqcFDrOETrqHBf=BKcAA@mail.gmail.com>
 <87lffgc104.fsf@linaro.org>
 <CAMj1kXFjBWKRmAXR3osfQA_UP6_UNEwOstNnKmdvy_aUaAWeDw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb102bb8-8d20-c6af-01d4-817ec120f06c@linaro.org>
Date: Wed, 4 Nov 2020 19:47:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFjBWKRmAXR3osfQA_UP6_UNEwOstNnKmdvy_aUaAWeDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: G2IlsAfayy9a

On 11/4/20 3:18 PM, Ard Biesheuvel wrote:
> Looking at HELPER(neon_tbl)(), it seems to me that casting void *vn to
> uint64_t* and indexing it as an array fails to account for the SVE
> view of the registers. This also explains why qemu-system-arm works
> and qemu-system-aarch64 doesn't.

Yep, you're right.  There was a semi-recent change here, but it merely moved
the point at which we treated this as an array.

There's a different tbl version for aarch64, helper_simd_tbl, which might be
done correctly for both.  I'll investigate more tomorrow.


r~
