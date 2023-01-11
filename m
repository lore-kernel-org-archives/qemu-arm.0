Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3722045ejc;
        Tue, 10 Jan 2023 21:46:32 -0800 (PST)
X-Received: by 2002:a17:90b:3695:b0:226:c6fa:f4e7 with SMTP id mj21-20020a17090b369500b00226c6faf4e7mr22684033pjb.38.1673415991955;
        Tue, 10 Jan 2023 21:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673415991; cv=none;
        d=google.com; s=arc-20160816;
        b=uFXNkjyeJ4i4ZXLHmsiJz4uLUqS1zg5HX1wfNWkyXuLEGd+TFa4Vv3alI5Rmy+wTxn
         r4gksqh5vuG+4+3Ghw3Jbm/b1KB9Myd60VZG8S3mUK55oLDZhOlEetpysAetm+1W2NT9
         7un0urIptLKhRHM295HgW9ZHRgR7Ti5ztgbodnNjwtUPWus4k+v4PiK9LGmDyEZ+sx+G
         YlloJadadlBIx2rbbgJXpKLo59ydnYZE/tOgVIrvieStBNt0zYsCO0tEeCJzm54vLYYe
         jBtdJ0DP03Zz1ThC3INGiYwKC/6QwfHOD7rrQeS/8QmSl36Id3l3E/08euwfMEvjgYFp
         pg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6pPHxgnaNk9PRHf50nmGpMTL8NM0UT/eRMaJksGzcOM=;
        b=G6SEuKXWw0en5BmYEmEt8UncbIPjwWSha/OvmWUZ+ux2dDF07dnt+4uZ6Uu5CdYilt
         2ZoW22D5xaXAyVLPuBsba9toYvUB7fF+5NKHeaGs16UuGZPkBEQgvpLPvRCkchqp0IEO
         1RRYXEBn+q9xqlh9JRH+gdICvO2yc/QLA/m/HrF9lvrNCr0aPAtPWjaliqoP7LaIelLT
         QvK1CzqL3xMkV2nmoAhiZWYggTo0GdnHB5DMDjZjlRqJMUjb0Zil08cwo2J+uomJ67H3
         wb13+IH9M4HN+SfXoiL4bLS6AwGz1tYM00EleaDIrdhMepOqYwKbW3JhhDQOt4a32jHw
         DeZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f1ntgOZS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n2-20020a17090a670200b00226976f7bbfsor6615558pjj.14.2023.01.10.21.46.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 21:46:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f1ntgOZS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pPHxgnaNk9PRHf50nmGpMTL8NM0UT/eRMaJksGzcOM=;
        b=f1ntgOZSOIstpCHFKJsz5Y+er9bCIaJyPLH57V111lDGKBxAZPuzRux8x3gB9LLP62
         YoO+xkM5LZbZYrQiytfUjH3+H/ejR/eU9NrB/akjVFT0Q+mNYn/k9YVhsYVDhS61jPFG
         wYf5jr8C0LeURLzXoAv4m9s46EekZV5Q03aoKPWkinMWv0My+LwYG4HrbqdJaaxoJJVI
         qrw132AigZEf4PMDbrmV/8Pn1c8IR6WhzXBrSgAI0cXSg2xfIruvU4PUCbXV4Nr4d4FW
         qVJNSj9CMA4W6r+0J7JVJCriG+a8aAAD7dUGaFBv9QrfbeQMFmhNSig6YuRy1mhHA9O5
         CRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pPHxgnaNk9PRHf50nmGpMTL8NM0UT/eRMaJksGzcOM=;
        b=XxAXIUc+P9HVh79KlBe/i59ZAqN619es6pszQS6zJZtDozs4EMXkrXiAxAelXfNitx
         QogsDmucqQaP+8Ydl6sZVjMefLYyNLQtF7MtqGpd0AtggQWfMGtVXIBZj70CfPvvGsz6
         oV56jqW0BsdrFNOHx3Dw7j5g5EXGDxPP678zdlLo1DgtZCRU8lDuQd3LvKN3t/Xnk5o+
         zd+D44HzWnkNsTti4py3Mx/YD9vXQ+1JnBrY+i7NKTbeSMJT4xEvizi3o7gM9VKF30Dy
         p6PQ/eDyK72+hw3M9Wlil0jQUdS+ITbtHxmh5xeplinu8jph0husNz8Z08z3C//Fn2lD
         LuRg==
X-Gm-Message-State: AFqh2kozzzBaP4g0nxfBoRDzFMq/8GgAdvSyhkmkKBpEnALaIjNpHIOj
	ouMJfa7sMlsmD59mfrLySTSjnkfc
X-Google-Smtp-Source: AMrXdXvmEQjEMdHnESMJgMojIOdiU1fHMt4HU8mtE2ccOr5QTanBLl8JeKA5QDljB1w8loDO86n8Eg==
X-Received: by 2002:a17:90a:ab09:b0:219:dc24:7595 with SMTP id m9-20020a17090aab0900b00219dc247595mr72262108pjq.19.1673415991464;
        Tue, 10 Jan 2023 21:46:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net. [63.157.97.90])
        by smtp.gmail.com with ESMTPSA id p13-20020a65490d000000b0048f8efc53a6sm7653818pgs.80.2023.01.10.21.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 21:46:30 -0800 (PST)
Message-ID: <523f2bc1-a64b-0112-0309-dc107936d9e2@linaro.org>
Date: Tue, 10 Jan 2023 21:46:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 17/19] target/arm: Move regime_using_lpae_format
 into internal.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-18-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-18-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: h5aVOWeFCWa6

On 1/9/23 14:42, Fabiano Rosas wrote:
> This function is needed by common code (ptw.c), so move it along with
> the other regime_* functions in internal.h. When we enable the build
> without TCG, the tlb_helper.c file will not be present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Richard: this cannot into ptw.c because that file is softmmu only
> ---
>   target/arm/internals.h      | 21 ++++++++++++++++++---
>   target/arm/tcg/tlb_helper.c | 18 ------------------
>   2 files changed, 18 insertions(+), 21 deletions(-)

Not thrilled, because of the size of the function, but I have no better suggestions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
