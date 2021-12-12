Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3401506lfk;
        Sun, 12 Dec 2021 10:33:42 -0800 (PST)
X-Received: by 2002:a17:902:744b:b0:142:46fe:7fbf with SMTP id e11-20020a170902744b00b0014246fe7fbfmr90021958plt.83.1639334022625;
        Sun, 12 Dec 2021 10:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639334022; cv=none;
        d=google.com; s=arc-20160816;
        b=s+yrluyDkatL66YGJOMocF6YUPWncFa2rf9GXF6+/8wAkN2vEiWFn5mNnLUtbbHD1P
         IobRLa6Qj6ObnIVk2XzS2YrMhcjxND75/4DvKK0rAcpousRBmjvqvGArvZXyrPYDPjR4
         s77PpFS2zpjhp4JgCLbd7/qlEfZA/XRqPY4ifIeNi8BhX/VmcWm0XbJLUYraZwIIN/MW
         Ydn6yhm5SvmTrDD9YnqSY4RhuVZt6KshnVvZDfETVJt53IzaJKrFm7hJMcNutlcbQld4
         kR+ar5yME8ntm5i4ISO0qDZu6Iyun3YAOU0tPRGr7dZNZ1qXfWTJa1qxGwU0XCQs82A9
         qRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=I6K7p9UAGSkywjqU0Lyrwcms77bfWHsEYDhZODspA14=;
        b=fjWO2SxxNz3T6H7EKgC4ja0DSzV+/UupRtrRG1edZFk5OximbQKELNK2GBUK9UzFQT
         cO23UHUohPuW3jL7a7GMXiVltfYxFstFM6EGWehLmjmz4iEa+p7FTNKiDmY2c7OHWrL6
         DdGFIt8HPQqU9HlatyZLibPmBBhbzrDd7boki4VnE3kQxNw8gnB8IiU9vhi7f6wfhYZM
         hsnF6/mMDmYvgXWNFhpGEbBrNQkPhCVEKPPPadzVyQEhqD6Zp2gTwUgf7o1Hm4LwLuts
         JRPppOskPBz6I71AEfbF0ZkObKBl94JwxMOUPJeq6qYVDGBarnQNdU4YiYc3rjyyaTLD
         ywMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFDWSrw6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id pc7sor2074136pjb.11.2021.12.12.10.33.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 10:33:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFDWSrw6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I6K7p9UAGSkywjqU0Lyrwcms77bfWHsEYDhZODspA14=;
        b=CFDWSrw6XknwqsdhlRI/2f9hC55Pq12K7IAn4e+5FCw6/94IK36YPwdBT7EYPxZI/P
         EXWw/uIUcPv7DDPOZm4OQ1MLPVanzkEEWF495V5cWN9a0A69xzUuNoyIV5kUAIRJt/6F
         oq4cz82TDeo8nGIvM1Uc5xu+XP+aEWTJ0wt5eXFqDAPhY8TQLf0SkNSa/+U58ZldV1jo
         KPnhqwjfzsWHLy2dlRk38QYVi1mr2M6JJJVXm0DSHuQ0SFlXYWkHNPhWBcJBH/GT8mvc
         fsa0djyZjK9icz/VsZrwmegJK06ZsLg7I8FxfBuMcIMDB53re4kGQKuIvPDl0ZG4vrnU
         loBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I6K7p9UAGSkywjqU0Lyrwcms77bfWHsEYDhZODspA14=;
        b=YcNVHt8mcCwHbqDERIU/N6dWvOOVtNy/TLAgOXV0ytRzyiCHN7ChMCuAuinRPrgp9O
         EkAXY39A97sFXJWe8QcCqtfKg6amNgVvaHlb1iKZ5pHRnOmANP/QNgkinFnrADc4GP33
         DK1WT92KQop+H6KJj6KQuKMFsEe9WQi1Iru1oOEyiJ1PK53xRzoyYP7JmdX7EybKn+Wd
         odGtRi8JJRaYbbfHuWLmx8m4QZSxaJ8mA4BkCGVxEtYkMGLQqoXsCYbC5ECjZU/JOyGx
         so7Gx9iygzOQn/+ZwBkEXefnSm30wTlka0qq1tx4M3OT5x25JiWTVIQkLGATk+kYrU9e
         cA+Q==
X-Gm-Message-State: AOAM533oq7GGgppCO8aXdp1ZTtnbTDPXfxOy2JpeNc1iOW3buurwyl0n
	XyCxj+Mu9ZPHwvhvhL3RJ6l28Qt6RDf2BE2R
X-Google-Smtp-Source: ABdhPJwkQsSJxm3MR4gIynN7aQ0WDE9qMmy97GRupkmJHdFURLRDH9xjlFtyuDp6kE0+OTErTaQogA==
X-Received: by 2002:a17:90b:4a50:: with SMTP id lb16mr39278391pjb.147.1639334022116;
        Sun, 12 Dec 2021 10:33:42 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id y8sm10080491pfi.56.2021.12.12.10.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 10:33:41 -0800 (PST)
Subject: Re: [PATCH 07/26] hw/intc/arm_gicv3_its: Correct setting of TableDesc
 entry_sz
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf8daf2c-f082-d6c7-3889-e80d16fa8ed1@linaro.org>
Date: Sun, 12 Dec 2021 10:33:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: jnalwxP2Q4v/

On 12/11/21 11:11 AM, Peter Maydell wrote:
> We set the TableDesc entry_sz field from the appropriate
> GITS_BASER.ENTRYSIZE field.  That ID register field specifies the
> number of bytes per table entry minus one.  However when we use
> td->entry_sz we assume it to be the number of bytes per table entry
> (for instance we calculate the number of entries in a page by
> dividing the page size by the entry size).
> 
> The effects of this bug are:
>   * we miscalculate the maximum number of entries in the table,
>     so our checks on guest index values are wrong (too lax)
>   * when looking up an entry in the second level of an indirect
>     table, we calculate an incorrect index into the L2 table.
>     Because we make the same incorrect calculation on both
>     reads and writes of the L2 table, the guest won't notice
>     unless it's unlucky enough to use an index value that
>     causes us to index off the end of the L2 table page and
>     cause guest memory corruption in whatever follows
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
