Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1593964lfk;
        Wed, 2 Feb 2022 20:25:48 -0800 (PST)
X-Received: by 2002:aa7:888e:: with SMTP id z14mr32787345pfe.46.1643862348114;
        Wed, 02 Feb 2022 20:25:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643862348; cv=none;
        d=google.com; s=arc-20160816;
        b=0Utq6D3+dtJYBmQOCFuDF0+GgONb7oto79xW2xgnyfhUHEcaN4CbWEtXWi/oGrHNCt
         mZI1aLeeeJlSOO9+ZbajvLPMeUSF7gqeQWYUHW8aJrbQC7EWShD6oLL8rxkV0bN0EIFI
         bQlFosuv7uLGd620qxXfZGNTQbwJtuyptPBW50Az5YTRYzc897ThEudKKTOKFqn07wv2
         4k1D4MkxjpyVTfD73zohO8GvX51wgcS2sITouEAzqmSCnVioVbjiyEIeRS6X/JfViSkV
         Ui1GbUvRKYy5BBlzSw6hl5gH33ZJxJjRvEa5rqphya16iunYIyBpzYgZuLcCCNZEhfoU
         HZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ob3c1nMnYia3yR9+nQFKOrstQ812bzQe8rceE0ZQykc=;
        b=imvnSn61llRqAl8MABNh4KQXuCaN+TphcnSO+S1KiLo58LF4fkOZ4ckPNkO9P8e+Uk
         ujJlb2I59A/9zZ6B7zRukPT1BZ36WBGASzwpksSerdEH7/ztN4TfRxompBmlgMwpfrj3
         t7QnwQQ7vfeXVFDhWo3IK1FUBUt6PboNFGrv+5MaZSRz3DR81oYbblTAk1SMl6WQiwqm
         QzRJch45M/mYivMMiofyvRZR6C7anUOzbvH2KK8e9eMkIMRYwY9RE1YctCads0Wqjcop
         4O4gMeJtV43wWNR7/NqvtgOJCO+gqU3IpXYPu4sOS/BblZPs2yK8Zs+ZY0G/Ph8ezhaU
         Nw9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vua0ym/E";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id rj12sor3524095pjb.2.2022.02.02.20.25.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 20:25:48 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vua0ym/E";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ob3c1nMnYia3yR9+nQFKOrstQ812bzQe8rceE0ZQykc=;
        b=Vua0ym/E34RqXXPTETJA5EzZ84okQIG5dnLgo4lzOUf6P8pvlPBncxpFmodI9tePKS
         ty3z2kPiOHE8TR6xic9EsSUm4Wvmbejw5KW7BQj5kF9OZWJ9fWmGUBXd85CKrYdArFEt
         X5tRnw4Wegsk9TJGzRYGgW4S4ENgnPrgJ5SAGXuQLFSKMwqG7aHymQkWEV+QnP5alPKP
         rqY5mcR3Pkd7AlTjHSglK/BU4fwIqkF3bbuYpdYK1HcOTqXEn3mAMiKLnAkRpAePhgj5
         ZuO6gPU1b1CddFYeubuNvN0UF0filg7sx90F9cvG8pU8SDibBfraVadyjzKrz9N9SMRQ
         EA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ob3c1nMnYia3yR9+nQFKOrstQ812bzQe8rceE0ZQykc=;
        b=RSwn2B3p/4Iah+h4hJ2Cw9hqUbFJ3tftXbg51SEn/oOu0fM/ossD+w70WsCQlmwX4j
         X3Wr6fkJQ8oIzjoUZWTft4czWwD0/ff9rlDDTEJDmTNjc9nS6uHLiUj0rhX3L1rwoztf
         SXjed71b3dNtac6DI89dJ++1H6COidk+ik66JhMWI1pY9PAfrBnBJcvP+zXk8noWSl3+
         hRJAPo6dhhedsK982VgNr3vyywLPoSwLH8QKs2DrE8f8mCY5u/MoJa4OsiCnE4IaHgI1
         6IDXlwcYOhrosHRMdO3JecNNxKmxZdks79dp8xhnZV/nStI2CsqKyECL//e9GOMKxgAm
         e5IA==
X-Gm-Message-State: AOAM5328sYRxppUDCb7SncgJ9UHdXfg2Q/3zDGdBCm/uvlg1AbP/Nw+b
	qPrMpLyO/bzgnRPoNGqy5pI3GEgq
X-Google-Smtp-Source: ABdhPJx2ZJVK28nRLeYsxFamNktn580WD7oynKI5luq/3S5njWu9hSwqPwQLXgpvVLqN5PolIrClTQ==
X-Received: by 2002:a17:90b:4b4a:: with SMTP id mi10mr11556844pjb.103.1643862347627;
        Wed, 02 Feb 2022 20:25:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id kk17sm8996190pjb.21.2022.02.02.20.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 20:25:47 -0800 (PST)
Message-ID: <28b4e3ab-c1a3-ae03-5ddd-cf3ae8fcf49c@linaro.org>
Date: Thu, 3 Feb 2022 15:25:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/13] hw/intc/arm_gicv3_its: Don't allow intid 1023 in
 MAPI/MAPTI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: WO4KQ35Q4QvJ

On 2/2/22 06:32, Peter Maydell wrote:
> When handling MAPI/MAPTI, we allow the supplied interrupt ID to be
> either 1023 or something in the valid LPI range.  This is a mistake:
> only a real valid LPI is allowed.  (The general behaviour of the ITS
> is that most interrupt ID fields require a value in the LPI range;
> the exception is that fields specifying a doorbell value, which are
> all in GICv4 commands, allow also 1023 to mean "no doorbell".)
> Remove the condition that incorrectly allows 1023 here.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This one's my fault -- Shashi's original code did the right thing,
> IIRC. The spec text and pseudocode disagree here, and in code review
> I backed the wrong horse. Sorry.
> ---
>   hw/intc/arm_gicv3_its.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
