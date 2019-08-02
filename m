Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1134266wrv;
        Fri, 2 Aug 2019 11:20:05 -0700 (PDT)
X-Received: by 2002:a65:5144:: with SMTP id g4mr73059266pgq.202.1564770005164;
        Fri, 02 Aug 2019 11:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564770005; cv=none;
        d=google.com; s=arc-20160816;
        b=AbPIQ1OdhgcXNaDChYNwgmfrnA5KGrLx9UKMANjbSTzm2yQXte7mINaZ0lLhKA7ByN
         4cUaBH1igowW7TzMTEVcpHozEkbgNtc5Z3XKj6+AMolOudaRGxaURaAfgEESX/wnCarj
         4MOI/tBujflJYHlbu/ORADMFxQjI1dumhv0q7j+efq2YRcYQe44TbBgidbTCi47lMV9X
         3h613D78PAsfhRPzBnndhQ0FXum9XP6uEoidhwGuyM6TshaW1IPr4a7vak8l8dXTdTM4
         B3Y2RgqyPT4HxPe2Gq+1kKMwikHmEWEE78N0dbiGXGx2turOQi2NEyLDmKSOVEF19w9J
         t2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=CEab7MRD4OmSqSGMXpwBnnpVmCxOKxwkGPRss1ZomKc=;
        b=NI995AYrKR5l99BZacLbKiQBfXP/H6gJolYtgIcX2akeQaiUCwUNxQSdAy44jUaY/0
         AwiIH1Nj5KR11uz4tKkq5WAwjTFYK7XIGFQIQZZ0RUHcLziIBfVl1DOND17v5HgOJ825
         fkrXVhBUUiRdAtas7bdqfm7UlzCfcywi16ykBrd1n1p/nzRdp9tH3mpovatM5keZO82D
         mqlHTuU1y7Afx3xbVk/iF9nvN1QUBprbkWPCIfbFOJVahHxRWWp88IJlanCMbsUXIKhX
         DBft3XhmmN03d64cgYZIaURLzrjf/nCSB9aaoEg2SgEwpR0bcoZmAfAAps6Rc5PjBLsp
         3V7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RTR8P9ux;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d6sor56854448pfd.59.2019.08.02.11.20.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Aug 2019 11:20:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RTR8P9ux;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CEab7MRD4OmSqSGMXpwBnnpVmCxOKxwkGPRss1ZomKc=;
        b=RTR8P9ux6IXYHU5wLo6HuiAaeb9PWkfAta+qQrd6QDk6wGsP8brtoEAa3yk9ZEbYeZ
         OuXzBJNiKr07fRt7aNmC3iJrWjxlQg/u7LgrQvk8tP/zrDrlvNianQFf0qALKiv1dk4v
         /FuPf9sT0XfJd2EI16cESn4Bbz7pOiDNF6oV4CdEu3376QRiE7ZiSLddWe1pX/kWXqJL
         khL0JUaNPNCUYzPggjYbr58NVmn5nF8KwQGre3f1YuWPLxRcxXLoHX2uCeL2W6Hcxt3n
         SSl5ht1Al00os0AgAoPwj8CguVim9e53ac22Oqvgd2b14/kC2N/orfwH5dPEvarKT+oa
         goiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CEab7MRD4OmSqSGMXpwBnnpVmCxOKxwkGPRss1ZomKc=;
        b=DrD2W/Xido7JRgplDlQ4cYzZK5nUsMKD2m6okiciQmnf3l373RobaanObu6HOwDCFl
         06gFNa2BDgTYkLon2HfG+iHoli6W95+W1JpNncepynBrkmUHIUGq4+HrQd/wruky/Uv5
         uGDAW+Awp6LNVipB/Cr3HJPwjbDN7vFAl2n5yrMK7cuXwoTc0vGDmJVXy+AVGEjOMd4A
         DY9Ko8Ewn6NfNLh4amW9JKPBmhLue6/uiO9Qfogmyx7k8TgVO8iR2ZvY3h3p3EVRgtfB
         VefnemPJxENpzWPxyU5kZXg4j+e2H/IuURANNswiqFfXqNMyggMGfkZclG7ARAR3F97j
         eGkw==
X-Gm-Message-State: APjAAAVG4U5Fx4aF5lZhlQUw5bnbBfzus0xblT8knrG7qZLtVEIK/vYq
	I6zyBGcanER64GNicgputDvHLdir
X-Google-Smtp-Source: APXvYqzUbxhtJiSkF6cOoK2u7Az6Knj8kqLQx0pjBFs2ekefIcHESdT9SlD6aqVOBWeLuAHH0gogpA==
X-Received: by 2002:aa7:8817:: with SMTP id c23mr61774976pfo.146.1564770004672;
        Fri, 02 Aug 2019 11:20:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q23sm6288041pgb.68.2019.08.02.11.20.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 11:20:04 -0700 (PDT)
Subject: Re: [PATCH v3 12/15] target/arm/kvm64: max cpu: Enable SVE when
 available
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-13-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <34039f42-3810-0149-4575-a03509c84884@linaro.org>
Date: Fri, 2 Aug 2019 11:20:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802122540.26385-13-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: stsEzioDbohv

On 8/2/19 5:25 AM, Andrew Jones wrote:
> Enable SVE in the KVM guest when the 'max' cpu type is configured
> and KVM supports it. KVM SVE requires use of the new finalize
> vcpu ioctl, so we add that now too. For starters SVE can only be
> turned on or off, getting all vector lengths the host CPU supports
> when on. We'll add the other SVE CPU properties in later patches.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu64.c       | 17 ++++++++++++++---
>  target/arm/kvm.c         |  5 +++++
>  target/arm/kvm64.c       | 20 +++++++++++++++++++-
>  target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
>  tests/arm-cpu-features.c |  1 +
>  5 files changed, 66 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
