Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5653270wrp;
        Tue, 17 Sep 2019 12:49:59 -0700 (PDT)
X-Received: by 2002:a17:902:76c1:: with SMTP id j1mr382185plt.270.1568749799216;
        Tue, 17 Sep 2019 12:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568749799; cv=none;
        d=google.com; s=arc-20160816;
        b=dRq+P0ououefI1FhImBOIvGdL4UdEb93zZyiap+gnxI1fk2k9o3jdBBJI5eKPzRpce
         CkAYDGxK8vBipIxzfxnu021J8KvaFHL+A5rBfA5rkNS96v61G7S+C9peOqaItFDpN9JU
         ScWTxcD2rnaIA7gQ0HXaAXntP2C/YBtw6A2j5jx5Y231TG6bVPUZTlpeWW16yEy8NRR/
         Vno6UdShSQhvZMtTf+XFZPIbHZjUT+QosdPFhJhlpDITKg6zCkoBFnRs9sD0urfT+vQ4
         Gn2vjBKbMsXrh8J9kZNBWtR4XegLyr7q3Xsb3T6ChMU9NvviWwmaTeUBj3yn4MRtITJP
         lRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=nbAmRYOxfA7k1SX2rSFY4zTSP5cyUlaEEmRK84BsP4E=;
        b=epPq2JG23HRf4v/uSxoy3TYaQokwaZtzHN71YAHmWdTopqAY8chflKQICwkUw9nstt
         kPbnyCe5o3a6t06ZcyOp2okaZbcSJMLIVCjr/lNtWz/lg4PBdsmxe6gWzA5waoY27UFD
         Q/HcsvvuM4uxQ5DXdx7agT+EdJbbw0h3t0r/hI7Yvfr6eMTmhmalwOu9sAEptx/B/yVB
         Zv/gxZNB+KHqYV9xKRoTAJ2zjQLeMBRyh8ZSqgm/SGs23ViBtTumGIyasQXno4LyjS6E
         mz9dp5ECB7PM+5feH4EUPNoO/gsrvXarrcHoRk7hCckVt6yjrSnf42SFRMgca05mq6tf
         Nr6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WrMDTfpu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o9sor2855388pgm.15.2019.09.17.12.49.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Sep 2019 12:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WrMDTfpu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nbAmRYOxfA7k1SX2rSFY4zTSP5cyUlaEEmRK84BsP4E=;
        b=WrMDTfpuHs4mh0k+11Fgu3FJx4nA/p1vi6Cg7shV0jEInEXle7Y7k1mPbZe/FfUjLo
         buylNTxlG7lySuFAIp4NQeecF+TZqWwHnA6er8bm053t5TD6uRPJh8Jbg33CbI2a9BxQ
         MfwTw5GVhNvugvGGdfo1uLGnZbMm1+R+vDj27aECXMJy/7Q7+/WSDpbh64VDNk+OmWwT
         iZLnM7ZtVTBA2Txk2WsDBFikAvvuvrXH/NerOIIVZQZIJ0quTLnfN7jxmRgiN3epiMBW
         tmd00/1XhaAIkYS7t5qpYwi3B+eAposW9ADrdaSl/p5IgwrbS4auyECtqgIJjSPcGJmN
         VmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nbAmRYOxfA7k1SX2rSFY4zTSP5cyUlaEEmRK84BsP4E=;
        b=n+Wb066EFixhoBr+lHBG8sDmCn4yOUUq6ggx7RTovoO+g8NXjlpUh0YYQmUAk300RE
         9AgzsfdYg8tmwXupK/wuwG2r9lNmgES+QZ6O0qDgWzBh1rM20Uebu8a4pXf1G6rHupKc
         L8SE0/zQM1DJxqIYn2YyJTWmsdVI4JyN0xwIYi/2Nq+rzqFWL0DMj1/zh1zWyBwkIRYQ
         Wiw8w9zDxM3dcY8Uf05tLH/A3836z8XhMLLtanIg8gjzPRw6k/OnVhc4hhoOwaF2czpc
         S8pvX2Vw5Ney3R5Lw+/d82Dt1ch8UPTFQScAplwrYRW+O2+3ELdnA/8hHrIK+pt9I70S
         tBxw==
X-Gm-Message-State: APjAAAXvbpZDLi5jkft5mHKTNLsROJyTqE0eN+CnFtMiGc2ApylfsPg0
	0DdMp/BGJeO9M+FVIv7oDHwqz5Bk
X-Google-Smtp-Source: APXvYqwtssx0wp1N5RxV+P5a29Zs0r+YFwTyUcWQjVF8JuN+x+YOyEQTh7Zh80AXYEeclkf4LFWD7w==
X-Received: by 2002:a63:4c5c:: with SMTP id m28mr520915pgl.333.1568749798644;
        Tue, 17 Sep 2019 12:49:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id s73sm3261748pjb.15.2019.09.17.12.49.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 12:49:57 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 8/9] tests/tcg: add generic version of
 float_convs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <73df6b9e-d096-f58f-dfeb-aad0c8e50d39@linaro.org>
Date: Tue, 17 Sep 2019 12:49:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917184109.12564-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: aFpyY/o95UCC

On 9/17/19 2:41 PM, Alex Bennée wrote:
> +    for (i = 0; i < ARRAY_SIZE(round_flags); ++i) {
> +        fesetround(round_flags[i].flag);

If we're going to make this a generic test, perhaps
continue if fesetround fails?


r~
