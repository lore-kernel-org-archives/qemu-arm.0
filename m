Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1454866lfk;
        Sun, 23 Jan 2022 14:01:09 -0800 (PST)
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr8998076wmh.170.1642975269500;
        Sun, 23 Jan 2022 14:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642975269; cv=none;
        d=google.com; s=arc-20160816;
        b=k9E+WMBNF3xcAoil47IUa/aTY356uEh6911SmbDeY7L7UrdCCIB2RkZuhksu1+gabr
         7y7Nr2euMiBQPi88ixB8c51/eCUOho8yzesKe1MzSQY+9VN105cqlMKRfBFuZwqvZyhR
         NVAk7733mykgLiqtIzFniisBax3g04eRDPHOBkAbKS8RKTsLQntdmEqlMlUUQL6xifrP
         LTZhl0DWTahBygTu87IwMVZBhdid8s2yLPIhgfvf+XWroEuS7E8Yq0CvdSUA8gOJw/Hc
         Fpsv5eOfDrGFaYK7fSSc9OhEYmVN95SqC+1Ib4FjD9lZR1ruRv2eEZm80dbHBgEtSl56
         lHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=pTGQX95Dv8AoDcbQQ93OOXTT6OP+9Q7MmFjvZWVUJdo=;
        b=zqMWhVBD0wCoGxRfFFXZAp3xxKOceb0Kzp1D95R30l1G4GTTQ8bKKhCrO3j2iOQH2F
         1UpgwIVbBjFZR/cyIpvcCeDpKhZhS7cPDKa7/+Yuhu6CMftxlJSWNn6R+9+fA8Py69yn
         jTi7GJW4WrzFnxQ6PKHxxI2nMILo4NIga1W9C1xBspLvjs0sV8MItEjdPSwI45KpRMqO
         a7Sz3/E3KhjOysMC6KUbpNjU6ei+CvNjfhdOnSJ6ci8/qxbYIwPRJnYT6QNaJkpyoCqu
         oLS3Q1ItGupnz087LZ9lM3zD6P5Z8qdi9s6NtQM2+Q4mNvaUjdzlSGpNhwxkG0t68dfW
         zBYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yc9J0mWL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o2sor2158304wmq.29.2022.01.23.14.01.09
        (Google Transport Security);
        Sun, 23 Jan 2022 14:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yc9J0mWL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pTGQX95Dv8AoDcbQQ93OOXTT6OP+9Q7MmFjvZWVUJdo=;
        b=Yc9J0mWLtCvbP+9M2wsFmRmECI9gQ0hs3e1GGW4+XcSdh+A4Cs6pFuNYrW8USRfRFl
         5J/y2Vz6vO9cEAeyd2s4eyrMk+2h6ourhDHrn/wzcqoiSDPUq1ts9RJZV9Z3l0AMrl6R
         fXl0YUxTyDytOoAmKeb6mJw4JuMrvKlkTfoWjzrC/jr9pRxI0mQVUTK0jEeF1B4yoLHp
         DdaXBCrpnjzJ7vH89/5h2/Ogx7WdNltu4peuKk3ji6tyYt3dWQ76Lv8WBDOevX+5SY0j
         ulPgJGcXAOB+ny+7Z3GuZbEFTwE9m7yGSaQ4WRn6yjPZiFOs88uhv9axYM4HbGpVcQN7
         3B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pTGQX95Dv8AoDcbQQ93OOXTT6OP+9Q7MmFjvZWVUJdo=;
        b=wACnjOPd9R2xRI39SsAy+qKWCxamc/dXRkchKVIv1mR2QEIW2Rgmbv28Em34nH5Pu8
         MF9xavguHr+BqtMlALloC8jqS/2EEngMG7gxWkeF7H0kWerYruPZrB+1KNUjT69o2vt6
         rbXpf7StnASLGVoZNsXEwlQhLhV9dRaO6Ua4/8bSSlZSzhOUpodQWUWBAsCQiY36b6cr
         Y4+xFDtbCj/NF4OuZ5LA2k8kmICmGmkCA70U028NKKGcaqQZ+aZ836RtI2eBcUCQQYxT
         Ow8eEJOeY/FkDk1P+LqEl5KQLlHd58iUZ40u5u259blZn2MW3kQDtkso7QyCIGWm9Vio
         j4Hg==
X-Gm-Message-State: AOAM532OMXHIdi9TPTAotEiZfsauoOXjwSJc7WHj47x8MA55NBZ7ZFvK
	zIoUfm8VarK6WOYNvc7L/Z+qhjLWfbU=
X-Google-Smtp-Source: ABdhPJyL0qBRGYWkJi490QxLQFi1wDHy3EjHaSFNylC5L5IWIiJ8ez0s4kTo9vrRBg5lfNMYvUloyg==
X-Received: by 2002:a1c:38c1:: with SMTP id f184mr8976682wma.153.1642975269078;
        Sun, 23 Jan 2022 14:01:09 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id t14sm2236211wmq.21.2022.01.23.14.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 14:01:08 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <701dc0cc-e633-e4ab-fcf0-e074c1a41423@amsat.org>
Date: Sun, 23 Jan 2022 23:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] hw/intc/arm_gicv3_its: Add tracepoints
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220122182444.724087-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hxJVKdaAD1ku

On 22/1/22 19:24, Peter Maydell wrote:
> The ITS currently has no tracepoints; add a minimal set
> that allows basic monitoring of guest register accesses and
> reading of commands from the command queue.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 11 +++++++++++
>   hw/intc/trace-events    |  8 ++++++++
>   2 files changed, 19 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
