Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp703870ejc;
        Fri, 13 Jan 2023 13:56:37 -0800 (PST)
X-Received: by 2002:a17:902:f08d:b0:194:6286:73ba with SMTP id p13-20020a170902f08d00b00194628673bamr5718892pla.13.1673646997152;
        Fri, 13 Jan 2023 13:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673646997; cv=none;
        d=google.com; s=arc-20160816;
        b=L98zh9aDAr2AxE+pDMqxWQrvfPoShBkP+4gIFAXGwfXnjJyPAl1Dj6d+xKfM/DswFd
         QvrNK20lowe/2ACwnaB6lt0/FCZaMAyVgDPbi3fl9Nb6t6vRq4yBumtTl7NgYINTN9uR
         r800FmocdavYEbwM6FzFuJcL8BX9V4C3jdzB4U6AN3zGMgKvS9CCaE5ITJhoNAobYiDg
         rqt93LG43KHWKo3/tQg6ISO8d3jeW4xALapb8sXdoQhsW7SVqOzFwOVl/Ta+6OdQY8ED
         I5EEBiz5RbiTNDfFgoK/Ko1Nl1j8MuFzBakocsS9gJtckYOccaG5VPewenQ2ETi9p505
         1mjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kIqN+jE3uSNrC7qr0Lqm4+Wo/4eLFOzxN8Nk7zc9IVM=;
        b=zX6J75KYDTz/gIMqCbeV/m4gJ0BKHTENiJWiIclZNuwoya0zWOikQoAYhLDTz5W8w8
         RO9+3HdxJN99oZWQthH4DzxpphlRyvTLeUDOMMhqu74imC9Bd5If/JQxXH31seo+nHhu
         sqWDXnBkJ1dzUwknA48BnO175ZAeZoYp/6vxDBLNTOS6bPsd/U9pGEPZ4EuSrfyVTcFC
         9UmdjJZGJOy4YBnKoYqRZex1ikky7aYS/JpJ78MKUYgZubTlGzUlrtLvyNuIG1C3l+OF
         pk8DPlqTolCiM+3GJeKIICmY+Uz1gQ6d771tLOUt7Ah2EKfvHpJNRyt2D1ZJR4T7aqlW
         7ACA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jrgWSeu/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ja1-20020a170902efc100b001933789c91csor7961311plb.172.2023.01.13.13.56.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 13:56:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jrgWSeu/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIqN+jE3uSNrC7qr0Lqm4+Wo/4eLFOzxN8Nk7zc9IVM=;
        b=jrgWSeu/G77Yg+pfArmC3T1ogNGwsj6F+0ubkRNsymD8OmEFjChn1eRs90PwwCzLYC
         2VV1bDwpUJ8W64ij6tK7B2Yi7yrb59On8/U5u9jzJTFUi+PyZqzDhgk761o5xjCkIixh
         NMHTRLBLM1J5fec7WePyMtBXHqjuZtm00w0Jj2kH3ho4mfzIjvfU+EPtA6OybmG5zRcv
         RwLWtsav9fGrNmJd0s/TsS2WWhTpLN7PqiKbmdRrCMSA3BiEPSldGDtwvaTjSsA1LSGt
         czZg9rowEsCumozFc2DsLZ5ONd9QrIUkJVTDu8Ifj5K4C6f7h7Hg4d7bPrv46z6PcC1P
         3BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIqN+jE3uSNrC7qr0Lqm4+Wo/4eLFOzxN8Nk7zc9IVM=;
        b=i0wnvvY8/eYkr/Is3A8IMe65+2SXs+D0aZKW0GTgXbVh+/kFKLl+9ubLNmFgIiGFBN
         xl8i418sRPbqHW/VEfgTmKdLYYZiN4QNVvmE/XL7gA759p2xcCxmbuMouqSsF6adPqoU
         uws1plbQNbSYgLblndVbLBGfjLjP73BCfhOX2npTpmR+SMXpe0IjH5+OCuK1neK6YJ6U
         7TJbRwmdi+cZF9NkaFTCVDAn2+w/dn3WvvT3hPlYUEaaehuNJL3iT92Z09P0RkcWXnqK
         5nMH7JByLIdvoC55yqMlvOnPD7h7VrKVh96bwMqGUUcJGpLPLsETTfMuejhe/LVUYPSh
         08FQ==
X-Gm-Message-State: AFqh2kq1ZraveHJsppOv7gua8FNmZIfa4i6TBMEoKnlkna36ooIsPx4I
	1ZzabMbhXeY7l5h6YcSdnWHZSKcf
X-Google-Smtp-Source: AMrXdXsW9ZiUbChTF6nNBT+89gxnaedfeXBj5ZBoYWhhe2sBd60s/GCtN4Ed2VgnV34pl+x74urzvA==
X-Received: by 2002:a17:902:b613:b0:18f:98bb:c08e with SMTP id b19-20020a170902b61300b0018f98bbc08emr79322532pls.36.1673646996604;
        Fri, 13 Jan 2023 13:56:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902f68400b00192944e3650sm14592915plg.268.2023.01.13.13.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 13:56:36 -0800 (PST)
Message-ID: <3caea45f-6f4e-f683-c063-2146c94aad2d@linaro.org>
Date: Fri, 13 Jan 2023 11:56:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 12/28] target/arm: Wrap arm_rebuild_hflags calls
 with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OwKjYlmmBRzC

On 1/13/23 06:04, Fabiano Rosas wrote:
> This is in preparation to moving the hflags code into its own file
> under the tcg/ directory.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> I extracted these into a separate patch so we can discuss. If I move
> the tcg_enabled check to a header that would add overhead for all the
> calls where we know for sure that the code is running with TCG. And I
> don't think we want a new arm_rebuild_hflags_foo to be used for common
> code.
> ---
>   hw/arm/boot.c             |  6 +++++-
>   hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
>   target/arm/arm-powerctl.c |  7 +++++--
>   target/arm/cpregs.c       |  2 +-
>   target/arm/cpu.c          |  3 ++-
>   target/arm/helper.c       | 16 ++++++++++++----
>   target/arm/machine.c      |  5 ++++-
>   7 files changed, 42 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
