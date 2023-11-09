Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp816035ejq;
        Thu, 9 Nov 2023 15:14:18 -0800 (PST)
X-Received: by 2002:a05:6a21:181:b0:181:125:e85c with SMTP id le1-20020a056a21018100b001810125e85cmr7975321pzb.53.1699571658150;
        Thu, 09 Nov 2023 15:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699571658; cv=none;
        d=google.com; s=arc-20160816;
        b=NzzFGCbLM8UpiKVnxSZ7M6L8d7eHHygqQqNY5hISjzWgkniwHHoPc3azSaZ8sbetWd
         pDlcF8lRENffrtXC+XNAtZyAIwdqb6PhyAIV9OcP6HLre+ZCdB2s1Lr8jpzYHcfmOa8m
         /XLCqv7tG18nNtplJBriT+10Vh91lhYE0MMU+gbHEqS+IzzDez3gihJjBze63A/JJz2j
         CgSpylxH9Pc+MwkF0YQmIbLtvMF4Bf+w5p/zMl5yQ6Q4abvhdMWSZFbMGc4RTN0FVUax
         baFM7tXo4wA7sG8o8n3J3H0+kch36KLu5RDwuClvJbptc7eDRoQsS2m2nc6AsFyCCW0J
         tS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ceg2Dzo8VRvIyHBrb/SMz9XGS/wJULWIHZFuGmktZ3c=;
        fh=vAoDokjqrynz8jAbtK1xh4Iyk9vBbPhDk9aIWpnLxQQ=;
        b=AVS8unJfL/gwScGuSfdSGtgsAsiwFjFqE8WWGLNyJYCU/VDJNevnTzy7rwDVrL3iJ4
         B7PLQ1qIz6Fcq4dpS/9Abyn80uiUnDc/7skadg8t9NEUlmJus1UBPLH26h065nvifnDP
         ZUvOS4ONej3mZ0POZibL8C5BG7n5IMxfIYeVwuJdLlU6u6LsS27oBwSLPcBSRDmomzGB
         bqkw5xtfrnlNBSTVxkh03ftPuFziunyP9TZjTi1QaM4/87XGiEiWsZkoLpNGdyXnoBL+
         PMIfJznJyYYFdO7RnatTRVr5QdslzRit9hURmlR1suDQ0CSLDqdLZyhN6TcSqszpZ3iK
         gEvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QY0zvX2Y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s73-20020a632c4c000000b005a9f3fb8ad7sor3687722pgs.9.2023.11.09.15.14.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 15:14:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QY0zvX2Y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699571657; x=1700176457; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceg2Dzo8VRvIyHBrb/SMz9XGS/wJULWIHZFuGmktZ3c=;
        b=QY0zvX2YSz70mqDLNJqOk8I1LlkNKbSDit4fBgy+1trsIMyBRBAU68lG5eRfW8YKps
         er4klRtB+4JVMfT5nvLnwPdTFSC7U9dp+jfQbRl+cqk94HwO9J/23k3cF9okWKR6mfUp
         lRWAI310DQPSOyxTSE3QpL8yUh2p9URpsu+3UfBJYUlLL/8HucA0RaElDQ2Kx0Mayv4W
         FTktS3CsRxVddW7T1WY99cRl0Pd3D9glcg2UyGDEc+p+s57Dhed55Nw7PX12JsDyuDnr
         vIR//9MfzmSlr0PlkG11m4/x6zvNfdzFkg9ZkzMa/4o9phkDnrtK7NPLyWzNbpc3n8vC
         t8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699571657; x=1700176457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceg2Dzo8VRvIyHBrb/SMz9XGS/wJULWIHZFuGmktZ3c=;
        b=GED8EWHAJz6+FXbo9yEG7iqlf41K9GNJsIWmdCDNHv8lrN9CLUmzVju19p4LaF2h9I
         nqrztWMTbYL/t4mAaOJTT2V6wPm6B+63JkiWItWOYXo5QiRo10iEfhF3XHcHL0/0+3CR
         tsOMycu7p2AbJKhWc1qJYO1K+lgZkP32A88QXbAc7KLZhEX5Llc9LQrE1eU5F9P16N6S
         nDicbBS8YpR+HdTtK1CQ2J4egSECh+Av9Q7TxdQPHDR9XdAoeYrEObbdXxQU0+NJCJcb
         nR06kEII93dXOZwgh8bbghNqrX/Af4xECipFTDA7dG6KT2S7kD9wyMdVq3tChbXMFPyM
         X43w==
X-Gm-Message-State: AOJu0YzpxE5JByW47EF1PGDfzWWCu9M/pfNXBoM6nYFItmbBI5ws3wBc
	wHTTwUAIlFDvJBJNs8RajLYQcdNcBYKU6dmvm3+9MA==
X-Google-Smtp-Source: AGHT+IEyw/cC4BO5AhJ0LhrdJcSCCN86OVeksnyk16ixEBibhDyOQkl/FE67Bw9WXrVSPs1tNGiG5g==
X-Received: by 2002:a05:6a20:12c7:b0:185:6854:3908 with SMTP id v7-20020a056a2012c700b0018568543908mr2864414pzg.4.1699571657543;
        Thu, 09 Nov 2023 15:14:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb91:1ee6:29b:6626:64c4:1b48:c565? ([2607:fb91:1ee6:29b:6626:64c4:1b48:c565])
        by smtp.gmail.com with ESMTPSA id y16-20020aa78550000000b0068e49cb1692sm11237476pfn.1.2023.11.09.15.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 15:14:17 -0800 (PST)
Message-ID: <569f8c12-3e96-405a-a29f-009d5cc80e7c@linaro.org>
Date: Thu, 9 Nov 2023 15:12:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 01/10] util/fifo8: Allow fifo8_pop_buf() to not
 populate popped length
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org,
 Francisco Iglesias <frasse.iglesias@gmail.com>
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231109192814.95977-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: r6LQEemYJ4NR

On 11/9/23 11:28, Philippe Mathieu-Daudé wrote:
> There might be cases where we know the number of bytes we can
> pop from the FIFO, or we simply don't care how many bytes is
> returned. Allow fifo8_pop_buf() to take a NULL numptr.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
