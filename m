Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp800285ejc;
        Thu, 10 Aug 2023 09:36:01 -0700 (PDT)
X-Received: by 2002:a17:903:1206:b0:1af:e302:123 with SMTP id l6-20020a170903120600b001afe3020123mr3974758plh.3.1691685361216;
        Thu, 10 Aug 2023 09:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691685361; cv=none;
        d=google.com; s=arc-20160816;
        b=oo9WM+BZcJo05FXpWH1ZN0CfTg2/f5huUry+RzshATUUPJKZ9Y2EsjASSv1vTJMxF+
         DiXf+614Yjh691QQ0/9HgR0aFcmXCBA3EGvn+EBHnbHE773PV6TY2NEYKuN6PLSbUgZK
         n75jVQm3zOt9czfU18Uk3sAN0UA3vIkD0fLQ/XdJ8rBE9OTTtQkQcg5wDQsQxvErA9YS
         WXa7TPJxgCGVK7B7fAh+Vx8lH2TxwYsgUcZUmZqQQhQQRpHna/kEsOkSedbvwo4TMwej
         BMHkAF3YPIQ5UERaueqHcz3owQ71l2JBW9cStRVj+Zy8lb4ZAbJ+tMwEowvTc6qHyK4Y
         FU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/fB2jB8/Dp4ZCXvVFDjbyAyDrvHeNEfl9bPkIXNKtXc=;
        fh=4AqlbZu7L1l+i0ZcU4tGJhAlcFZr6n1q0P3d+vk5y0Q=;
        b=smWsstt+B22x0IpIXjcvPHuUlPDaoqPZJqgm4MTZmuxShLc4SqJxTpuCZXMc0e7iUk
         UATb1eFeXGJqbfN7OppxOsVp2bK42dBspAqMCpoqXw1/vSexe7kS/XaFATkUruVUd6P8
         xEH745W2V8jayeuv8tWPxFTHcvgdpTs9onXBVJI7pT7zM4bokTLgPjcOaiAn+BWpiMcd
         LPBbUL1m3KMX1PHHLp1SFxtXd4bzQshfzgJnda4uC0A6qd95eIYYyCOiWDaWfy2dzFux
         nfpkqU+Z52HEQwT5lJiWGxp5VEfkv0Im6vQwiXHun5aauzCLr+eEi8udmt1RUfUsPni1
         OGQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnmVzGyR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q8-20020a170902a3c800b001bc16a33963sor1015953plb.9.2023.08.10.09.36.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 09:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnmVzGyR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691685361; x=1692290161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fB2jB8/Dp4ZCXvVFDjbyAyDrvHeNEfl9bPkIXNKtXc=;
        b=jnmVzGyR062CsZFVn8JxB0ZQAfcLot6frlE6YC61LGEmvaFqKoj2OdQCbsDNy9+fZ+
         A2h1T6yxZhUwnGSIAz/NQmMTg6c1vufKFEgpcN2sq9V03SmtvrZwfJMGusQBC/I6NGmg
         EkacUAb6SN1WoI/HEnBRg2gZYEdlQW0cAITIL8bSRfq4cRd+kfZVfnY0zIYt3ha7kcj9
         V+UfqQqxFp7FbSThbswO9Vf11b0jekPpR9DA4RamJ7Ki0nJAc0I40jd9tcBNqlYqbJuk
         FdujA46Law3+rsQAMmeX/xzB5RHsYadwhrTJZS0QMyqUu2E1uo7x9kQEKBSLVStT8gKP
         n+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685361; x=1692290161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fB2jB8/Dp4ZCXvVFDjbyAyDrvHeNEfl9bPkIXNKtXc=;
        b=g9A2VJKWOzwMJYtD014bYSNKgZZ/9Z5aL7gPjUCP+ibN+2uQvG1asU5IqvS550pgMW
         qh6OvzDluDzc3wT5/1ovI4Jm2qb1MWOr608tHQL1HtWPfkunHBLsqS1RuwXImrYGGajY
         04jFBYWBp+mzHyHK14tvSudizKrOliGAKIoMPYwqSQ9QqWDWRg86Zg0/Cw6E/dHgKb62
         pubFSSn7KUNRaayrJR3pMhejB6k3xlFBnEb/p/42WM3Qz0yHNIYZFkokKqTRV5n/Aa+y
         brbr9694wx3Z8Q+S4sXEkqKxV4T0tAb0cRvceOKATFpQ1LPc/l6pfj5nIkSrLjqoYCtm
         PdGQ==
X-Gm-Message-State: AOJu0YxUWixzdXZRDPy/3svAanxOHSfyCcRVZ4y0neD1sMcUrN4xGD+4
	lcbEJeueoUSJSPeINbf725Yrhr5Q
X-Google-Smtp-Source: AGHT+IGlm6Cha62z2DTFwWT1s1jAX6kGToO2ivmSpqyzJuEUq9jHo3GiF3Aq54bx/tBqUKTl3E+LWQ==
X-Received: by 2002:a17:902:d48a:b0:1b0:3ab6:5140 with SMTP id c10-20020a170902d48a00b001b03ab65140mr3235924plg.4.1691685360463;
        Thu, 10 Aug 2023 09:36:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164? ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ab8200b001bbbc655ca1sm1984287plr.219.2023.08.10.09.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 09:36:00 -0700 (PDT)
Message-ID: <2773d29d-80cf-93db-ea09-06ba769cfdb6@linaro.org>
Date: Thu, 10 Aug 2023 09:35:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] some testing and gdbstub fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <CAFEAcA9bOS7tJDe_TRKOUGFcCDq_CjUfzAF7dYYRJbZA=5hvqw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9bOS7tJDe_TRKOUGFcCDq_CjUfzAF7dYYRJbZA=5hvqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IuvAYip7CFDf

On 8/10/23 08:58, Peter Maydell wrote:
> On Thu, 10 Aug 2023 at 16:36, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> This is mostly gdbstub focused but I cleaned up some bits while I was
>> in the testing makefiles. This is mostly to make the "check-tcg"
>> output as clean as possible without ugly line wraps. I tried to
>> eliminate the gdbstub info() output but sadly this is harder than
>> expected.
>>
>> I've tweaked the gdbstub handling for Ctrl-c packets as suggested by
>> Matheus. While I was there I also noticed we were being a bit precious
>> about gdb sending preemptive ACKS so I fixed that as well.
>>
>> I don't know if this is all late 8.1-rc material but its fairly simple
>> testing updates and the ccache stuff from Daniel should help as well.
> 
> At this point in the cycle I would favour putting in
> the minimum that actually fixes bugs / test failure issues.

Indeed.  Which I think would be patches 7 and 8.


r~
