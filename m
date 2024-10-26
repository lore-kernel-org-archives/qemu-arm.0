Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp254362njf;
        Fri, 25 Oct 2024 21:40:34 -0700 (PDT)
X-Received: by 2002:a17:902:db0d:b0:20b:b238:9d02 with SMTP id d9443c01a7336-210c6c1ea92mr22669325ad.33.1729917634417;
        Fri, 25 Oct 2024 21:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917634; cv=none;
        d=google.com; s=arc-20240605;
        b=G49FkfK84c3Uln6qXJsn2dc55oR47V+DFRB3EtZbWVEbBN1M4Bgp/Jj040UMlA1vEe
         2Nb7S4fq+UlBUVV7/phMU5t3a8FLMYuVsv8iOlNCTcwiHj94GHhAGEpUSFDDzsTbHquJ
         gNhaUBXgfipD0bhILjq3nhB22hx60rAsSR/FCotgy2xM5XcZBTIi4xGoYe6K+jVXKSI/
         Ul9FJwdaG+Flb+nQ8kueDfETzWxMiDXxcz5TXPmRULp0vNjZJUYtfkis4mn/o3COe4XV
         CdSISbQJ2ZeHO4feCtLsdwKrVvhusQ7h/bJEj+fx8TxIJ17AeAX/N1Ld1RDy7K9ZK2mn
         sTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4RmuO6LemlOy23kX5W4IYXwDTu+5KnaCskorosCuINQ=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=JnUW4YE8M+X6bkKMpTqochwE+oB5ALLK3ImQNNWmekKLxDAKMqdZtU4dRZY0aSKzJJ
         Rg9G4OCNks6AWTMhe6MUbHMmfrPGjqYdi55AvaChmvB6YCLwCQ2i8t28DACcbRgi3C+1
         rY1RIk0MgNe1bou5bdxtJlOUV6xcS/B672YeavddHg43GQ8vi6VGvoZiTg64Tp4cfV0e
         LtKtKGIa6cqtJu0GwhEg7+8Pe0KPSQOqdS6F7xVnGjSHAay513rTcjfkCN2bVykqsqHc
         dM9rSQtzVFBfDynzVjO0t5AmaNiO0vS+ucapgIobzQEXKZ4yrf3g6KTcOmYxkJ3YcxZu
         uiuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bKPsw/dj";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bc1a55dasor16270505ad.18.2024.10.25.21.40.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bKPsw/dj";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917634; x=1730522434; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RmuO6LemlOy23kX5W4IYXwDTu+5KnaCskorosCuINQ=;
        b=bKPsw/djKnXzarR8GHhfU60bttsXJ4GJ0uS+qBZF37lgnhRI53gpVMBnAZ/UzV4EUH
         uYGsN3zY4jcmfzTEmnicmtkyLJkWRnPambEAGg0IvDGa2s3MYMYLuxFaDF+ROI7gXw6b
         jMoJ2Jlrf163VJATb7gq4l6aCJYDJyYWdE/wZG3/g9dwdKqnKqgn8qI4zR92PenolNeJ
         7ZMB/qidxEboks6SQh1H2uUhJ3CgHkt8bjusrf9voMhi1fA9uJxZ+mhQT0uQ3onHVWw6
         YXRYzW7wLhusmZxAoUoeJQuY38OJfd37gQ6AOsJ5Q1qq5F9wb3QO/UWX6NmYjIvWFF/N
         gN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917634; x=1730522434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RmuO6LemlOy23kX5W4IYXwDTu+5KnaCskorosCuINQ=;
        b=lraHo7K5LDPKgEvLKQm80nsw8MyxaeCAwoyKzcVlzkmqpiEyRUO+fcJMA9JS9Nawly
         E+CieguxOeXUTlhKQoU5/BFSSBp9Yho0AE/2ocEkiDE0GFcUhS440YsXwkWUEKP2dzie
         jX92O82pQPyjzOiS5eUfIsfKuPpS9zUsyIU3NdPpnIoS6ZimiVarRg//uDcVTJe8m48y
         uYcT8SUyPLd7h96cVhfyAKybW9T8s7wWgUhxSgktmDl02G5/oOtmT1gIyY0H2wIybFve
         FEZDGDh4eagCJZmMRNt7xlK7U5I0yj3l2Y+I5Q34Oqy0Az2k35ab/CG59wq1hiP+oSWN
         4NxQ==
X-Gm-Message-State: AOJu0YznYS/UlWWvtqw0VoEbfWHdimsxhWI6xG10Xr0/qUDmHS0A77IO
	g1BUr7lAyMxiuybBMsdNVG2g44Stk06hN8WmotCGErQUiXq17t9AvWXyFEArWvvOLQ==
X-Google-Smtp-Source: AGHT+IHVhL+alcOrMMwvs3VCt3CaEx/8TgbCrJSDHTxncDhDIi3QoShfBQSU3bxE3uXYOTD/xVm4og==
X-Received: by 2002:a17:903:2306:b0:20c:9d79:cf82 with SMTP id d9443c01a7336-210c6ccfad1mr15870575ad.58.1729917633954;
        Fri, 25 Oct 2024 21:40:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc0133acsm17240735ad.130.2024.10.25.21.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:40:33 -0700 (PDT)
Message-ID: <57e94c7c-fd6f-4036-abf2-24926e9619f0@linaro.org>
Date: Sat, 26 Oct 2024 01:40:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] target/s390x: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-8-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +Aa9xRxTF9sY

On 25/10/24 11:12, Peter Maydell wrote:
> Set the 2-NaN propagation rule explicitly in env->fpu_status.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/s390x/cpu.c             | 1 +
>   fpu/softfloat-specialize.c.inc | 5 ++---
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
