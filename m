Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1596800wrq;
        Wed, 13 Jun 2018 22:42:33 -0700 (PDT)
X-Received: by 2002:a62:c20e:: with SMTP id l14-v6mr7973901pfg.185.1528954953663;
        Wed, 13 Jun 2018 22:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528954953; cv=none;
        d=google.com; s=arc-20160816;
        b=Wf4dFeGmP0jp7TwZPtyEqRM4fAl5f5DCgeyTeCxl7dgbdPMt52F/phdicyVl4A31gh
         QbksNXefolcVqk30kUrMKeyJj0vcDdc2AtJPUFaIJHLAv58F4u5+X4rL4d92Yx63ac7+
         uPpo791gHy15BrzYdPbxSlpPjgZ4hyUBcS/KBk1gbu0Iz+Z1JIOK7tShKK/tz0p/1T2M
         NrGL2zsIG5ZTZhuWC1mTb66kPXZJml1ucxbEXiSPONnlchFW1yhaG1eLRVKeqtHKfyVj
         55/nhk2Ast96IlLOwqeZcvTicWQepJM3mCIiUqOAcLrdp1czY5n3dmG1EllsHGDkWXzt
         BpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=aDlNgWjjoKgEvBlA41CCsxR7HJB7yfC+v10rtNlTYa0=;
        b=RSzp7xBbvLD8AsLoj2Boa8xlLQWUOHnaSXI/1GCVUc0YcHlULOnutHUoySoFIyB/yK
         yGgsoX3zby7ywsk0iKpemqXYb9jWscf5sE03FJOaGhVyyCz7B8DadcWDDaqSsKy9MEAh
         kmYEK2EPNHXJ+qApIcxdquBygeFVoGc8ZwrbXB50umOcPGd17KU658JaZvFaQxte5bhF
         sBAvZdPczibfssXOmENc5gV2zGITqK2LMVJwpLYGT/4F0ttNLpqG2nufgvB5u5FfT8a/
         7mjRCND3ReIsHqUCnBdZpJ9K3yT3jwXQ7sK3TZdB+qbkrsUj8faDOlOBE46zG6i1q3Ck
         IJ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGO4944a;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v3-v6sor1529877plb.24.2018.06.13.22.42.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Jun 2018 22:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGO4944a;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aDlNgWjjoKgEvBlA41CCsxR7HJB7yfC+v10rtNlTYa0=;
        b=LGO4944aamAMiVWAaY+bKe+ogBaX3WaM6Km4467XiHx0gsTz2UobSrvfOfgV/b7WjS
         ae/GeASv3aQ1Di95Yc2ody8g9I4zki0MSxSyCD8HGJY//WykrIfOmdORAjTdALb0yBba
         Uk1md4Zm5j85rWyW7iUCVeMe8qmDYM10fv/1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aDlNgWjjoKgEvBlA41CCsxR7HJB7yfC+v10rtNlTYa0=;
        b=nhywbfQ+tb+a0IQ9V63zoJrSg/pwJJLCkRXDw4TaBJoVhVkL/qoAIi9oIkp/hqpJ38
         1trVBYyz3OlhnW4tFVBCY0WypYnhaATONx4FuqvfyuZZmt13BdYPWgco1S1TiklSISTQ
         W6+ejJdm1SG+r2KjrwG4Ctuek+UTUMaZdnaOyTxtHJkqS/4FVE42HNPpP/6QJHoesFFC
         m5UJqpYt4zOBkb8qjTme7rJcKaLLfg2VaidkF8MO6eMK/beQATniLWN/5gsXAPObA+fr
         QxRpf4bi0aRWFJXuc1Ct+FrlsWX3kLLo7w72k7xQp1Fubjpc+xLOzdixi6BGFU4CmaPX
         zO6g==
X-Gm-Message-State: APt69E3sXZWugs3MlyQN+r04ELKsGbJV+0OkofdCbjk19Z/BoIf3++f9
	IrDb/OzOysr+5AW/Wk00Gji91d4E
X-Google-Smtp-Source: ADUXVKKiPgrqn5WOAegPDCwoi8/OTU5ImMUgLNdJ6jPH2RlcZIRs1gRAZzMIiYk1j/aCM0W/Bu4QKg==
X-Received: by 2002:a17:902:7c84:: with SMTP id y4-v6mr1352030pll.262.1528954953266;
        Wed, 13 Jun 2018 22:42:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id x2-v6sm8048602pgq.33.2018.06.13.22.42.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jun 2018 22:42:32 -0700 (PDT)
Subject: Re: [RISU PATCH v3 03/22] build-all-arches: expand the range of
 docker images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <89c73abc-c27a-0a75-50d3-f75a24938103@linaro.org>
Date: Wed, 13 Jun 2018 19:42:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jZBnuqhFl2Cu

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> We won't actually want power, we want ppc64el for the 64 bit version.
> Also we will soon have m68k so include that as well.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  build-all-archs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
