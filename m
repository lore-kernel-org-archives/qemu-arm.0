Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1593382lfk;
        Wed, 2 Feb 2022 20:24:28 -0800 (PST)
X-Received: by 2002:a17:90b:164e:: with SMTP id il14mr11607651pjb.90.1643862267884;
        Wed, 02 Feb 2022 20:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643862267; cv=none;
        d=google.com; s=arc-20160816;
        b=m8XPMukfFZWx3Uem/f4E+C0LHUyz3QM28MM/DvfH9kE4v1IYfOCZMcQ0lRUqPTj4GT
         PLEL6WUWvXx5D/lSp15evYVuVqcxkncbFJAqkKMfWXNgG7RmKp/35eSkI+avsOpHLCKE
         7F0MDrO7Y1xMNMraCUctnrpuvETcGKt8xBxFDABtgq1XlohDbU8r+9s7CWGU2L9XN9pP
         mBv8DnjWPqiL88fiUvMK+mcbCyayHrCg+uXE4hR7lu29InTOQkyiFciPucETujV1St98
         wr6VQ0upDR2ps2hFL/QlsIxRxIl7WhpS4Lzgkmf0sQwpSXwDY4/qbvaeS8t9Qf5iAn9F
         evgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J3WWggaqs2cslW7md4LjRz2oJZ3NxXGp9dbfD5rxGAs=;
        b=D9zGv/sg+baZ4if3Jg3OOImhOhCWX6sv/pBGJAPgUIYgVkFgZ7S/QnK4NTVFrNR70H
         JeRhKfdJIc7/ACQkeAIZL3UQvbUUeGVEH0d1oUoaLs+zagO6EBl3Np1tenJGsJNvy96H
         Q5t5KcIKj18tADNq+p/bKjXcwJ2o81khAkvWo9M3N2kpaw1rsVZNl0wd1r+XYQwSsCdF
         jjlVV3qW1OgtT2OP5iBgJos3HiywulkDJQUg5A1HzhINxfd9jgqcyamzU7DmCnAwMp56
         MVXBOmBNXr0xet2WFK4ZBqJvZDCb6zSla52D3N4JaZ8akR+umADc1RqruM7C4pdluXUq
         2POQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yl7dIeQz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lk9sor3587410pjb.7.2022.02.02.20.24.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 20:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yl7dIeQz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J3WWggaqs2cslW7md4LjRz2oJZ3NxXGp9dbfD5rxGAs=;
        b=Yl7dIeQzyS9rlV3YVbBmfDtD9St28iS2JcoeNhO9u8uBa+wAb03c3UV2YmcXnwLIrf
         +sCEp/Z1b7RlHEdRC53U/2ABcRQ3jZGVZQYUB0pOM7v4hc9FhT4PPHw4XPTzHxkXt6Km
         7C2fdyDVHlpUNNebSH7Mdiq8GN+NWS7E1JWH/x70IoPue789soDUBfcR5LkyZU1io7LZ
         EGTQwCCxFfrh3MKE/ff0uyqKP1/UoSLP4OOQj2n4eNJPPUzyT4rNvZeeek+79KA0zMv0
         YiKN2YWPsdS7u/AO6Kz/OMEf19RycnRebYvXzW9C5du1JGpE8SsgRZjQUDNSaowqro/h
         Pi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J3WWggaqs2cslW7md4LjRz2oJZ3NxXGp9dbfD5rxGAs=;
        b=4foAg6udjr2FbYR1IiQ6N4VLxhSwOPOFEFzteOJpEldfspEY13Yb8rZNnG0hL39zHu
         AWfBNKw+3xd+peTrmvbkVeTJlp4lsSI1QiixxcvaSSFgQ98fv5MMw1N1TcigzER8N1yE
         OUE3BHjeTrOwiEr4R8A81V6FncCT90p/ROdepczTTdkiuNqGK0UeMTgxYqtZZAn0YEQV
         9fesJ9ZTD+QYPJJLFUBgh/Qxl3aa5rHQwnnWIRUorGnVPGUpjhQy+ZwUoeHuySBWt/sA
         G6pG5A5gOIMhXmmqruzY+DXdOb9BkWoHyl4uXm5YE9Fyah6C0Vdt88OkyyCVnckqzjZo
         ijew==
X-Gm-Message-State: AOAM531sgVCD4kmMpUyb4RC5qJYOeyjyoNUkgEu8hFoC6VRXAzffZt4o
	SLv1Q2m0iZowG/wuMaiugG16pLV4
X-Google-Smtp-Source: ABdhPJzI5WkUewWYvBH3G0q7MlyXq++VVVWRuLEEOc+mjiMvXO0BrrzrravyoWQcpa1H2KarIywvpQ==
X-Received: by 2002:a17:90b:1c06:: with SMTP id oc6mr11963410pjb.213.1643862267427;
        Wed, 02 Feb 2022 20:24:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id ne23sm4643630pjb.57.2022.02.02.20.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 20:24:27 -0800 (PST)
Message-ID: <221f3e4b-20f9-a8cd-5999-038f8e68ab1c@linaro.org>
Date: Thu, 3 Feb 2022 15:24:22 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/13] hw/intc/arm_gicv3_its: In MAPC with V=0, don't
 check rdbase field
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MWVSNbN9wKcH

On 2/2/22 06:32, Peter Maydell wrote:
> In the MAPC command, if V=0 this is a request to delete a collection
> table entry and the rdbase field of the command packet will not be
> used.  In particular, the specification says that the "UNPREDICTABLE
> if rdbase is not valid" only applies for V=1.
> 
> We were doing a check-and-log-guest-error on rdbase regardless of
> whether the V bit was set, and also (harmlessly but confusingly)
> storing the contents of the rdbase field into the updated collection
> table entry.  Update the code so that if V=0 we don't check or use
> the rdbase field value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
