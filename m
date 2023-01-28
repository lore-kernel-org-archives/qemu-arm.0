Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1533613ejc;
        Fri, 27 Jan 2023 16:34:23 -0800 (PST)
X-Received: by 2002:a17:902:db08:b0:194:d4d1:2928 with SMTP id m8-20020a170902db0800b00194d4d12928mr145469plx.50.1674866062989;
        Fri, 27 Jan 2023 16:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674866062; cv=none;
        d=google.com; s=arc-20160816;
        b=CKOfHiz1ONwLIpB1CHGhks/wV3GykBQK6kpqWIXlXmJ03ebrtp5GgxZWnXW23InlXr
         TUBvYxin1/9niQBYHvL8RB6fWsWP8aQu3R4e86U9OxTiUkVbk+q4Qoo2uhi2QkPL31bj
         HinIT8hDOIZhPKRl3L+YTNEEc2R1cNTVI+Z/Ef0+CnJDEym5NLwsv4Ru6eJY2NFCpBqm
         nOZjCkZm6+ewS7L/EmH+JUbaO1oRficjPUxoJj30/KG7U6IRZ/QEox9DeyJFKfAcmaeU
         VcJdboIMhoq95Ye66yLGWZzAFbHBXlc3+obg80Eq6WaVsRpjixLtgjKkR0DfchcV7bi1
         DVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+riGDnnTyCKxHbDh4Xpce9MLdZMG/QvSswxcb+9gc7Y=;
        b=S4+MtvUgCpHU2VGAAiy5CDn5b2PoYEApAkeqv3lzL3FiIuwpKgacq7CQhBUwXUfEfA
         dd4pDK430zzeWmA4t5br9hlKSXALHzQAruNqG6mbqlFfzkf6dA+E6vuaSn/LJ4Ty2wDB
         X+RcGF3oGGRemtlV2ETdJoUwdr62KhYLnFZ+PRrs6Te0nCKPXC+qtbdAyRaJ7dbSIWtu
         tiWBArSwi4SdezGrfoWGo5ZFWFQnKbmb+7kdnbCy6W+QJRd0cBkPH+T8+VS+CrGrBlFH
         dMRwfUww2OLE9xSHZMCvzTdrGtaPhkeFYo/r2NBT0rvJNkQhAY6jd86zrvBCE8+fUczl
         IBxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXBj7jxv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jw20-20020a170903279400b001965cca6026sor965739plb.73.2023.01.27.16.34.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXBj7jxv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+riGDnnTyCKxHbDh4Xpce9MLdZMG/QvSswxcb+9gc7Y=;
        b=lXBj7jxvCYOKTcwGkZhrwsGk6TcCucB7XN0oMuUibpT4LW76jgLETC3TnOIhJph3j3
         pT22RKjnxJXslki3dqjkV7uV0S0ox31tuImRlR2LItauCPBmJghkhH5timCAG3VU9zm3
         +MFEb8cD+wmge5eoCqz8VW+o973QVjYn/jfHziGX6yZFcJy/OjYJpxmp1N0XXjVfXUxJ
         WKAak+shtntRbUyuD9BPxZsmU+/p5IQQ2sqovsLT6TELE5zJYpRLSwdEF5kCYq9VTLGM
         JRzqN3PPWupQKCkCTnxSUW1Im5T0zuif5qGFyMzba7wq3N3BOWIgwpOhnJKKyIFG2f/6
         5qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+riGDnnTyCKxHbDh4Xpce9MLdZMG/QvSswxcb+9gc7Y=;
        b=5kmkq/UAEzwvmRys4BVc2wtEgsnSWfzHOavDXwv5naenIhdoqbfdL4Dh/IP413JJVF
         uW/texJbyjUzEAu2LgrSIV3HAGFbbAtj5gqMM55zBT+WL7DDDOGeUfxYEbK6c1HHsSfy
         B01WQd3fd8d/Vo+fYK7Ue8dfNGRnVxJrR6FXymMu5vcCp1zNNvTs5O5dpy5Yw+5mtESP
         X/18n4LwuEje/ttmGpFgeJk2O6obYnRLtMVzcJnVjvSRPJGuYI95p3m0u+HwpA5T5Bm3
         hN/i7f7IniuURlkwopY/GjsMLlOWh6tXCMaMHyF+zhEY4s4K304xUqe3VV44jAILUdaG
         gyFg==
X-Gm-Message-State: AO0yUKWG8Jb1qMpnML0Q9e5WE6pBocIBftgkpLqF4rvxQYt6nRttvBby
	qUNna1+PxPr6To3E8JJTdovuPlG5
X-Google-Smtp-Source: AK7set941AapHrHLUFx2RVTASspmx1IWxBGT6ge3/6nF4urcTVNg/fFtuTrifVUKy3hl5nYg1B55FQ==
X-Received: by 2002:a17:903:124a:b0:192:ad82:dc98 with SMTP id u10-20020a170903124a00b00192ad82dc98mr248321plh.34.1674866062467;
        Fri, 27 Jan 2023 16:34:22 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id l10-20020a170902eb0a00b00196503444b0sm2226532plb.43.2023.01.27.16.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:34:21 -0800 (PST)
Message-ID: <9c2cd343-cac4-3944-0638-2a3e9d7f49f6@linaro.org>
Date: Fri, 27 Jan 2023 14:34:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 14/16] target/arm/kvm-rme: Add PMU num counters
 parameters
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-15-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-15-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /wRu2b0VlEfJ

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Pass the num_cntrs parameter to Realm creation. These parameters
> contribute to the initial Realm measurement.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   qapi/qom.json        |  5 ++++-
>   target/arm/kvm-rme.c | 21 ++++++++++++++++++++-
>   2 files changed, 24 insertions(+), 2 deletions(-)

Modulo the comments vs sve-vl and use of more specific functions,

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I see that the KVM branch you referenced defines but does not implement this.


r~
