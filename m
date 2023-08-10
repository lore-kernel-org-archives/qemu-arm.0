Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp768948ejc;
        Thu, 10 Aug 2023 08:50:06 -0700 (PDT)
X-Received: by 2002:adf:e612:0:b0:317:7441:1a4 with SMTP id p18-20020adfe612000000b00317744101a4mr2300370wrm.29.1691682606682;
        Thu, 10 Aug 2023 08:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691682606; cv=none;
        d=google.com; s=arc-20160816;
        b=aU3y4o0x3exPllMpZg80eIHDoGrp7E907lTuOf486giinBvcuBirZu/ZtSVsU1WJul
         8QBpmsQFxgmOnYuVPyj+k990QLJp3IuDiVo2XoVqAtul44ALeVQsFLY8P7h+ETCAVSgF
         Qwaqz0X9kNbdL3H0kQNq0axVLqP7sds4y8KVCXZt6H5ihGVvOcnDYT9kF5EC9cp0FR05
         stErjX9mHjCzuFDMIWKtfV5VLJPb92Tg2ckyRR5hhFpz01eU1zKY0jDcif942mNCXVeL
         m1HgIxNkE/5zq4goCfjitHha1eWtuAU1mo/KXybAH8qBcY834igWwmaaz2Aaupz57YUC
         qjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bzWRg9t3NBeGgqD2frdxXgTFnImdvBvy/pZ8Bw5TM0Q=;
        fh=hZHd94xEkdF5xjkkqgSIEkZUvHOT7gdWLbEaNYunhWw=;
        b=fB1QNMTb/VzZrzN6CaD7ZTtZJjCFB3hrWlYOwqHIgVSFwOx2/fAsKpE/gTTYdFKv+f
         tJ+YXeV5y7itonoXirze2MOUdsnKQ+K6LCDxeBAT8Rg1qCgDyLu3YvRD4L2A/Xl7kM14
         /hOGql2Hb+lR1chzU3hLAiDibOiuuGKMGxx2kJfcJK6NEXfSYeiRokhmmbmOiFiAIvhZ
         R7mO9PwPszsz+VtzfjocGNoDm9pq1CNa9eqTtYisq0eQ06AZiDxD6XrRyU//kacncqU6
         y0v0uAebalvKv9OE5rmY9scjDGvk7dXsj//Xnem1NUa2oKpqSWiSE9xRPMaWlUgSvYww
         0rxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YUPmdPy0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z24-20020a7bc7d8000000b003fe1d2b1da7sor680796wmk.3.2023.08.10.08.50.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 08:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YUPmdPy0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691682606; x=1692287406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzWRg9t3NBeGgqD2frdxXgTFnImdvBvy/pZ8Bw5TM0Q=;
        b=YUPmdPy0avWTCLsih53YzXQ2G1REDZ5Dc3mL3EkCUcWOApcVO/tSU6Pe8xeA/Ou1rw
         uSA5cAfD0SXznfjMarb/GHFDrNuIOis9LPUa7hMuM4n7+7cTyg2Hkp4KrXgtPz0NVHU4
         FKt0O4Rf0RIrJnz8aWgQVTXtg0wQO8IwpvylxGrItVci1FngJ5gjKXk4GkYDTi5cMZbI
         zLPbOETCcJULjJiPT/2ZBSWRCPNk+gwUZf9i3vo5WJMwT93o7N2+UAyI+b5B8wWNtQUW
         8IuG4uT44dJDp3SIHfoQJ/l2hg785MJiUHSIrek2hTvVSCojVJMCWahptRRPeWYDZUQm
         OkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691682606; x=1692287406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzWRg9t3NBeGgqD2frdxXgTFnImdvBvy/pZ8Bw5TM0Q=;
        b=BvdyWxoWQ8JqiM5W4hteHM5dPaf4oFsZ2Cg0ToCEf+yfLLR3dLDM/EaOiXsy5Gf3wq
         dV4TWxMmLaCB3WE3B+6OLkyZVRYHZfsqpgh9MW/LKKmloFDsHbip3M3CSTfFFpWdgQAc
         ouKxkOdnK/+i5xh+kK28F3cwfUTgbAKcCBrJCcJbhuh0aLP7zIyvVK/Y7xVgp7ZHAa4h
         aQ0YfzIi5FrDVhXekNr2EV7lYbPE9Lqu0HbhHnEpxsGRUaktyCeIR1QONHe6BXWtp6ET
         LxUu0SFec7skKW0/PsTUEZrZVIF9FC0WPp1IUCXr47seVLM869sV5fM4buJUjovqRswH
         OQLQ==
X-Gm-Message-State: AOJu0Yz69BzDajHOVwnFIOA3c5cUwoEoAEooI8LD7DHaIJ/Eaj/gvsqJ
	oFmIo4bfEFiYlWJNQ3Ef71fL44iT3yYd68BNX5+d7g==
X-Google-Smtp-Source: AGHT+IGYKxvfnVLx2tEvZBQWdhrTj0bEbFmZH/mSmzSVoTYms2qQik6dKMN9s0OBWScmyhK/SUb0wA==
X-Received: by 2002:a05:600c:3654:b0:3fb:403d:90c0 with SMTP id y20-20020a05600c365400b003fb403d90c0mr2226663wmq.39.1691682605963;
        Thu, 10 Aug 2023 08:50:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (tre93-h02-176-184-7-255.dsl.sta.abo.bbox.fr. [176.184.7.255])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d6610000000b003179d5aee67sm2543434wru.94.2023.08.10.08.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 08:50:05 -0700 (PDT)
Message-ID: <9816ed3e-28af-508c-62f6-b638827436c4@linaro.org>
Date: Thu, 10 Aug 2023 17:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 8/8] gdbstub: don't complain about preemptive ACK chars
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 gdb-patches@sourceware.org
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230810153640.1879717-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PgkLGXbq+FZ0

On 10/8/23 17:36, Alex Bennée wrote:
> When starting a remote connection GDB sends an '+':
> 
>    /* Ack any packet which the remote side has already sent.  */
>    remote_serial_write ("+", 1);
> 
> which gets flagged as a garbage character in the gdbstub state
> machine. As gdb does send it out lets be permissive about the handling
> so we can better see real issues.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: gdb-patches@sourceware.org
> ---
>   gdbstub/gdbstub.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
