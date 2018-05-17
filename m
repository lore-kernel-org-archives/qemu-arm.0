Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp404162wme;
        Thu, 17 May 2018 13:20:28 -0700 (PDT)
X-Received: by 2002:a63:784a:: with SMTP id t71-v6mr5160840pgc.382.1526588428045;
        Thu, 17 May 2018 13:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526588428; cv=none;
        d=google.com; s=arc-20160816;
        b=S265a1wQhc25ZO6s5OB/yqoPENPtmhLed5C0PrUIi1+L3RhrWU2s7Bsfodfu6B/rN5
         MCE8v6lYFm/Mpj9u3ePvswvbJvxFqR8KpiHHcTOy1SG+bTgppEkqRt6I7GycmhiZPBoF
         gH4VMK62sMI08PqqSOtt0KTK3VB3oQxhyPy16IstnGk7yMejaBOCzGwH8qehVnYIdpcY
         2Q6AaciuxrWXo9i9zSkQcmkxgi5HvMWd0EDC+085fgFV5JYv6S07Xmec/QQEjxZJcwy2
         KgUtxPfOZ7g18o09by7DCFc5L3ELZ+aA28tr8f13p36QaVAXFvrpJ+a9wlkTB+gtx2NV
         EQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=QAj55lwzoMImFBdTBojlVfUwdC4IiTbHvOa+oyZ7JCI=;
        b=PcfYV66c4eCEE9I8YTmDm0m4E3Djg7yONaeJjmkmiKY6ew8qtbjZu6vFwb7mxivxr2
         ZVnwJtympjNmpNgVcTguW9ApbOHbJCTBPMUPQyMxv9T9qmimcOC5Pm/wKeqVgG3ctOMm
         JX8org1E9xzupFct2hCOnjYL/iIvSNZMP9gjGoYzKabahsyjeVo14f7VtPRKZDfAe/D2
         fvSvBvOQcubBfPdfIZl2BVsJfSPeC2TppZ0KjPuLoYVXZPZldNmx0U+03B40ccT/8YFv
         gohXPe/9t2LlgUbBCBrv0QOlBsgd4eMKieJWXz4Vm2UikapV3G0vbAGRCPCvEnP9gc4x
         waDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IpAWIPGA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a4-v6sor2203631pgq.44.2018.05.17.13.20.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 May 2018 13:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IpAWIPGA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QAj55lwzoMImFBdTBojlVfUwdC4IiTbHvOa+oyZ7JCI=;
        b=IpAWIPGA6IhN2uiiWunZKHa631KbszG369RPZzVi9NOdApF4CECrsPlow9BpjQbIbi
         2CghMlLTz6zQGb5CIDqOFl605drfgOL2Lb2A6viseiJcGsNwz6xkdHTGKvMhvKO8VPfG
         qZOjpLCt900jWO1FsJVXmrayzHR/vc3ZDm6hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QAj55lwzoMImFBdTBojlVfUwdC4IiTbHvOa+oyZ7JCI=;
        b=Bpu3BSYXhlg/zKbOxuL6kKdVcZrKzYERpu7xQ6VTPUSNKnxr4zCTH3KyQoUEpQ8Zh3
         axcSDaGmbfE3xTmvebdzr+ZQHRDADmarfTNcOW4pUVw+swcTv0CJm/ocrfhL6EwDCa6o
         Zw3/92RfgVeI8ymt9891b/tZdjTfNlkFEFZAhOZMdLDCuNCUpZE5TYu8+cOeaR18QZZI
         1GM5iy4eNVOE5O3lry/pwXWikBu8lO+sBuSKsCUFNsgnkBM8L+ySZCHzckBYDz+Ah38p
         Y7808aY3GriygPtXWcZZKTp8KkAz+W6JL2CtE/98c0eXsbq6r85dHFrCgn4xGWXoUWeo
         FFvg==
X-Gm-Message-State: ALKqPwel0V0HhPnWpLsJzahiENM06RYs/KXU5cSv/q9w9XDahlI2TPxd
	GHaRwYmd7KDB2GA0RIClCBAWxbIo
X-Google-Smtp-Source: AB8JxZrG881QJvst62xBuydzguUswl3xLXnl77UxBH+HCjIbv/JfFEdLJebOZVf/B3DgNaR/0AfCeA==
X-Received: by 2002:a63:730c:: with SMTP id o12-v6mr5076767pgc.1.1526588427649;
        Thu, 17 May 2018 13:20:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id 68-v6sm9619490pff.35.2018.05.17.13.20.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 13:20:26 -0700 (PDT)
Subject: Re: [PATCH v4 29/49] tests/tcg/arm: disable -p 32768 mmap test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, f4bug@amsat.org, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-30-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9b8a5a71-2071-ef5c-07b2-3797883ed22e@linaro.org>
Date: Thu, 17 May 2018 13:20:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-30-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RDEtTUu4Ks/l

On 05/17/2018 10:46 AM, Alex Bennée wrote:
> Broken since I updated to 18.04
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/arm/Makefile.target | 8 ++++++++
>  1 file changed, 8 insertions(+)

Meh.  Most of these fail for hosts with 64k pages.
So, sure, disable this one, but I don't think that
the others are useful either.


r~
