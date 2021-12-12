Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3543342lfk;
        Sun, 12 Dec 2021 14:34:49 -0800 (PST)
X-Received: by 2002:a63:131a:: with SMTP id i26mr49457717pgl.448.1639348489229;
        Sun, 12 Dec 2021 14:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639348489; cv=none;
        d=google.com; s=arc-20160816;
        b=oUnx/vUc2dCg5wARfMZQn6ctE+640MbkLgVVaZwbYigdcZTgCBmYbq6KYoe3hly6Lh
         c+bsscyaN8v9XXYg/1bmaSGgBR0dGZTe1XwOJV0TnrSK429nDIDIjGfLgmMbmOZRQPmq
         MWt9SRq+AGqKk1IbQ4M909ri7Wc2qmyAvri6w9xm3qpgSbOOmc1a7ZguH7R/VcVcomA/
         B3BCEAIoTYu9hP7nT35YN4qTwuXTjvn6xo14aXSWIS/DR+ncYBr+HlAO0k0NgXy3oXzr
         IFH2+DAxo8eJ5xSJdaBBZdZeDiXjlE8SbijWnvw9F+99YhAUU1b1BWg1QFLP7P0KF0oz
         2T8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=acbSfOOzsY5FfjDLZFw5/SNVgCTblqKPK45SZYefde8=;
        b=z7qmYti+WdmlG3lViaQvTMQg1gIfR8O6pknXpNr4O3p/WJSSC3BwwfqnvjliSvQKU5
         1MpmWakCWVkF58lQd4TWDQl24r/zafSWtPuvTxFlJ8h9LP3wLRM4bfK5/N4F0upw2aBL
         3/+929SyFzPp36Exa8JMOTbgvlSO4HqwAURrCKCyonYK/e3R0b8K9J8DoEf6U1/2kMvo
         ExMmbDEDZW5/RljVfIpVaC6964UmtYA1zt1U/bS1wzaFSb7iyB8kxbVfEGmzOtenfqv4
         HK8E7WyHHhcbjJtZO++F10h8wrHERuUxLeLh4HfCB2VEGARzye0lezCL24HMSlbO/GXO
         brcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0kNTrhV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o25sor4226714pgn.9.2021.12.12.14.34.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 14:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0kNTrhV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=acbSfOOzsY5FfjDLZFw5/SNVgCTblqKPK45SZYefde8=;
        b=G0kNTrhVcmgsUXoJfYNnPggJGGSRRd/zcBXxyso5LVOu/tWXNO0BfTh/Vo0vLMr/ic
         b/sH+7jkCLVfzYRW0fNqbHlVuTDLpamqdl66RDD+stLJtvZPEA7wQ63z2lE1IjuvGR9b
         4rOc42xlTsGsHw5nNEA7p3ex/fwbzwb7xLMmSf1zOIQzQ3nJRo4jEavHl6CquY1oiVFA
         PsLdDABhBaxrBOYouSx+WkCfvck2f7SbDjhCDEzJn8ZJBSYSd7N6pGmOt/fKQwReI281
         h6S95II4yNS3NPmIv+BljnABKxwImUHxdjbR+WAlivro7SjeixBK9bA7HVAGYiwzx8qv
         LC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=acbSfOOzsY5FfjDLZFw5/SNVgCTblqKPK45SZYefde8=;
        b=iHKerovHX62Vgv85BmV+x+hRFPVvgFnZ1TeFAtlBQNc80F3QmyWLZZ9tD8WZBTPgfo
         gDms7R8azj0BdspuREgH6yCHjDT/5cvsgjp8vnUK5a65vGxT1bzENtrHI8UYqbTOkaeE
         LrhK0/aoCecib4HTBIu7n2msegFfavtjrWoU7x642H4N+ufwy7ZRMXX5WBOkO4DQpcs2
         xHgAv81ro4+q3AlhIEMBviErX581tuqWKg1/a6DYgeNVO5VBflkSvMRUQvZepC8dibpT
         9UryOnkvUvuChzaScud5mhTRSDkDbtddXrQH0/BZSyDW80W092tLJo69crVyO1jkbNRd
         dwQQ==
X-Gm-Message-State: AOAM531UNOM2w5pjfN86SwAX4Dp9t1QOuzPsRmE+iC6ppvImPw5JH8re
	O8ZKrVSzSk9NdTnQz4BmuFec1VLVHanf7DRQ
X-Google-Smtp-Source: ABdhPJzP1EcPW4DmZAiVnlzJ9I3txUIPTPBC5tJxTGdEsCT6q5ZykmCcNY3+/2qrMA+lyPbjDMq4ig==
X-Received: by 2002:a63:1158:: with SMTP id 24mr48672450pgr.193.1639348488648;
        Sun, 12 Dec 2021 14:34:48 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id j20sm4266874pjl.3.2021.12.12.14.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 14:34:48 -0800 (PST)
Subject: Re: [PATCH 22/26] hw/intc/arm_gicv3_its: Refactor process_its_cmd()
 to reduce nesting
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <567178b7-3ad4-f6f2-e569-4b6b1892f646@linaro.org>
Date: Sun, 12 Dec 2021 14:34:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 8/Grrrw1w15c

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Refactor process_its_cmd() so that it consistently uses
> the structure
>    do thing;
>    if (error condition) {
>        return early;
>    }
>    do next thing;
> 
> rather than doing some of the work nested inside if (not error)
> code blocks.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 103 +++++++++++++++++++---------------------
>   1 file changed, 50 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
