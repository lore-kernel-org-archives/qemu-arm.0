Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp400340wme;
        Thu, 17 May 2018 13:15:46 -0700 (PDT)
X-Received: by 2002:a65:64d9:: with SMTP id t25-v6mr4889522pgv.283.1526588146262;
        Thu, 17 May 2018 13:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526588146; cv=none;
        d=google.com; s=arc-20160816;
        b=gry+G+Fm7b+dVTMmOL2hACayoUhtVnnSFXQg3AaxrJQ7YW0/YXMZ/prZCnDgfZyJwO
         3V1Oc8cyaeyyZN7JLu5uYWUvZ1fTym6gxEizxqdhWpV/a16oGZR99DSi30RYg8XDzCZa
         0KGCYprsCpea/BALebBNr92HGsJzeuQ1vXXkJCHMZ/1pDivDjXUW1PWlNXAUkKM02mPw
         WpXsWmCHdpw/rpr2JMGFcC6dtc0fcwXgB4jvisOwd8QoX8ok4NG0K+MpnDABhLZRGwki
         8y9Kl4LVGb1BuE9L3fgnZdGynsi3plY5VDRtClsn4/3LtcrYdVolpyG2EGpR1njEe/Zc
         lH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=jff5ZEqsdhSgp9zIWHuAAdc41xhwrnBMAvObxspLrEw=;
        b=AEt0aQGbboEttNjRBrYKtJl5goOt9f8iNVWDgVpuZ3172RYkhWCYGv2hlaj1QsKZ/M
         w1AivCWKKYkxC9HLRkb6Maudv9ze9BXPjCLFiaOWTouSY9RxIT0PbH2d7EPJBGvVCYVK
         9tFv0vyYWapcq22xa5KQVxA/OwVwNEdbpzRRDgTTF6IsnK8zbcqO/ZqNn6hq8uN6JfNS
         xKZ57F/2wrTPcw1V40Aa2seB1ZkLrKuJiJXVfKhxlUEtzbNs4rAWr2MnbenynpgJxp40
         /LTPkmxeieYRSMd3+8N2xoUevIrukkpoYHiPJgBdWUzEX7wFqmVhV12pP6rmi4r+HmeP
         GSIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rc5lXaTd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i1-v6sor3443655pld.99.2018.05.17.13.15.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 13:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rc5lXaTd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jff5ZEqsdhSgp9zIWHuAAdc41xhwrnBMAvObxspLrEw=;
        b=Rc5lXaTdwiISPKSRD40cPSOaSC+f/sAxkayxrn0Gl4MBdnBwr+S/hyQIqAUe5vEzY1
         iWNN9NP7iceq0HyGcCngPvY0Yc3Y9qhTogDSXNDBLqNtAR7J4Gy1sunFvaQNs5G3ngbi
         BI+oFj2tPNaNyqQKVBL6kjU78NLUUw+kRnMAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jff5ZEqsdhSgp9zIWHuAAdc41xhwrnBMAvObxspLrEw=;
        b=HIEZm7OmvSoBU7lPQo+2gpE6m7ghtxHM5JW9OlJg3pJCEYWoaCTDvINPal3eXtcbmX
         kfsDUcMM5A/SimEZxax8ggzM2fnI3lXoeLHFIeKFkCiZd6gw8+H9CGUT7ug6WxmtbokO
         E8T3aU6+Qc4xFF6KwSjveudXxAZTEdDVBq+isiqqIDPQSdawNxxfj1Qsq5UxhnQE8jCC
         juaQlblpVXBct6apLYeSoY7S1mZvCogInShzRroFTwK7f5ysEOq7JiQ7JOKLzPYUpkV+
         b2HEnCw9Z/v4QTCxxx4Rle47G2OkCZ5Abst2spY44IWDXwEFRnPf/ignBAR3M/cXOG4N
         J1yw==
X-Gm-Message-State: ALKqPweRZjg0y0r85Xl2ceaHIX2aT2FVadmJ/2r1qtwSawmH3nz/vf4Q
	lWdiMPUo7Z4OmL7Kv/SLt6e/zETH
X-Google-Smtp-Source: AB8JxZqMEl9K/2WJIyRiVlSu9oOac7SHtJtZnC9Kp0uwZ5oL4Om+F3a8e5oCJFVSE6OAY8abs/DZuQ==
X-Received: by 2002:a17:902:7402:: with SMTP id g2-v6mr6726667pll.246.1526588145818;
        Thu, 17 May 2018 13:15:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id z16-v6sm7668592pge.90.2018.05.17.13.15.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 13:15:44 -0700 (PDT)
Subject: Re: [PATCH v4 28/49] tests/tcg/arm: fix up test-arm-iwmmxt test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d1b655c1-1e22-6ccc-7865-2f830f62ad85@linaro.org>
Date: Thu, 17 May 2018 13:15:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: S4aIR3lib2C2

On 05/17/2018 10:46 AM, Alex Bennée wrote:
> We need to rename the source file to a .S so we can do a single-line
> assemble and link invocation. We also specify the additional CFLAGS
> for the compile as it's a non-standard ARM binary.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> [rth: force fpu configuration]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> ---
> v4
>   - include rth's -mfpu=fpv4-sp-d16
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
