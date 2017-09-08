Received: by 10.223.172.38 with SMTP id v35csp1810423wrc;
        Fri, 8 Sep 2017 09:05:15 -0700 (PDT)
X-Received: by 10.84.194.226 with SMTP id h89mr3990986pld.54.1504886714890;
        Fri, 08 Sep 2017 09:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504886714; cv=none;
        d=google.com; s=arc-20160816;
        b=c8T9FzpywCAq2nTkJYso9A8g3uOro36JS6q285ntl8Cehj/3iXvdzkgO5G+22C/eXA
         tuvSW8Ecg6i8yL14a6GvM05STpstBfM2RkWF+2xb73YmlJ2hlpIBSJgWwqiEWjdAPZRa
         MhZLFHY+WdlG+TIsu+HeiD9Ymg+gJaYjWwgZ21XorZqtL0PHAHE0THQoaNWt1j5iAPtB
         0Sqq/9ErAceURbjBid0g1W/SSD391SAap6UVgntVzn0CJcEEDKh8B3d7yIeEbnweKigk
         5Ix04GOppgt2x0ZhWRyyF0lTF50QMJ9E3JnYK6KSepUG3zbR00cCnt0OWOHHtHKPFrEF
         p05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=6WZU30/tNyz6lTU7kwE/+M3ehitpxNA7Wr5ap7MwgZ8=;
        b=wKutMe1IWEr7U/HV+WqiSW6EXfIGJI77TlXlzvhjMV0Bk9f+WXBUzxRStdaYIMPs4k
         JqwQZX1A5GdtxAPP8WFI7/WTI73gGVFHzLC4SvMUCtLlsF2wsYcQ/CwmasGNedLef5IX
         sqp+2SXQeKHrdkM2Bm3N7fi1Y83CwYqv7ABPyUAfBy8VTRfk/77a73FHBBHBFyd0otxY
         siITm/pytEVN8B/CQbtiKjVyFWx+Dyy9CANzOPmOrgzNbU9UasTUWlv0LTu6nK+0eqiS
         R+mzQGTw6to0ZAWFuMk7VIDQrJ307e4kr0UGb+1hPFe3BFJieHHEKN7ObfblPbIAtHAk
         ZArg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HF6f42Nq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b14sor1382507plk.91.2017.09.08.09.05.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Sep 2017 09:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HF6f42Nq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6WZU30/tNyz6lTU7kwE/+M3ehitpxNA7Wr5ap7MwgZ8=;
        b=HF6f42NqGE2D7UbYLSSMqdamSlKOr5CUZFBCfnPN5BVoxzxT3Yvbt/oVhl9+fEY9na
         J+zheFAvH14WYGPkIuxZZPD9ewQCTDEBm0ZD/qqWLAo4Wqg+hjC5Wl5bAXnqYBEnxITa
         lL1vLxW2eaSv/J9+MgrH8Co/Vaqqcgn0/KLxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6WZU30/tNyz6lTU7kwE/+M3ehitpxNA7Wr5ap7MwgZ8=;
        b=XAMoqz/0/eCUJEdRkcfKTcwi2iI+cTvYhA3iC454WWyJjQztg+yb69lsR4bbClQexq
         lMYTBaRAVhdFDv3zH/qR+dmk50brnIE4m7FRB9Q15rZV2AdjnV+xJfkqXSgLzFwgxf99
         Lh1YLrXJKcB8fQKrsU3mQzRhECGbGcVIlwjZOquS12zqi7PAPLMxmVWmsXqtVCUH3Eq9
         zsmIG5TbMhoJoK2CN5YEeXJTTiUflsx4Y1RUQTbG+W8sujR8Qg1+UU/bwzpgi6bbXfu+
         Z0/BYeNkoWTDlpBRckdYVt81cm++Vms9ogwDt+KGrD2Om0FMEc207p/+NbLfxtk4UZRg
         gOIA==
X-Gm-Message-State: AHPjjUjhvVoEjjMZBGNBfIrCkbHlT8nSCdUrrgl3/kHAPBs0MtwO5RLd
	EQqUAZIDxsTjn5F/ynrfZrtf
X-Google-Smtp-Source: ADKCNb4AXorc6KsO4K5y3CkxkZyLd1XzrvljdNzCExkSyo4yXdwD+MZO6i6tfAvoXJfNIIIbKVQ7Qg==
X-Received: by 10.84.132.33 with SMTP id 30mr3996012ple.372.1504886714473;
        Fri, 08 Sep 2017 09:05:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id p71sm4961336pfl.56.2017.09.08.09.05.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Sep 2017 09:05:13 -0700 (PDT)
Subject: Re: [PATCH 0/8] TCG vectorization and example conversion
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <87zia5gv12.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <629373b7-ab89-638b-d566-0b35fcd5bb58@linaro.org>
Date: Fri, 8 Sep 2017 09:05:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <87zia5gv12.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ja8NcCp1bDk7

On 09/08/2017 06:49 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> When Alex and I started talking about this topic, this is the direction
>> I was thinking.  The primary difference from Alex's version is that the
>> interface on the target/cpu/ side uses offsets and not a faux temp.  The
>> secondary difference is that, for smaller vector sizes at least, I will
>> expand to inline host vector operations.  The use of explicit offsets
>> aids that.
> <snip>
> 
> OK I think this is a lot more complete than my pass. I'm done with my
> review for now, I look forward to the next version. It looks like most
> of the pre-requisites are merged now?

Yep, all lead-up patches are now in.  Thanks for the review.

As I work on the next version, I'll do aarch64 host as well for comparison.


r~
