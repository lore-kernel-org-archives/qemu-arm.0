Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1215175ejc;
        Fri, 25 Aug 2023 00:31:29 -0700 (PDT)
X-Received: by 2002:a05:6512:2813:b0:4fb:896d:bd70 with SMTP id cf19-20020a056512281300b004fb896dbd70mr14835760lfb.46.1692948688906;
        Fri, 25 Aug 2023 00:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692948688; cv=none;
        d=google.com; s=arc-20160816;
        b=maqrzQsN5jjKfSQlACt0umKBZ0Hig8j/rQ1RTe9spphOkdoFKEkVesExcsKqpLrvhe
         KanpgYth+xfYPJrpa/Neurg1zuZzVKUaLpBtyZZLCmG3ivhEJikxzRctrx7QHSQbGcuJ
         Rd6n/z7sbDrjdAFen/sDSJi9QqRIssgTcepMmt5DqBre/vccDUygR2xGJWUvyLGzkTYR
         NJdYfLnvK3FLW0i5YTv544r/0d8NnprmAehgzDmaoznOIyMeoHU2c6LBEj01lidqu0JF
         EcMRXa9o3s91JxskI1l5T6+WzJPsdFVs5B9k1UD9W1142ktfHMLQboiOJWL1UWnnyzeH
         6D5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QtUKgvKARl40I7Fd/UN9egDPP0h5VEUmBVJ6Nb1u2fU=;
        fh=qmZ05mhLeMuz4yNBZ/q0UYaw6VXqQk8kLliJ08JnGGo=;
        b=T6k5BgfMRYsyhDkyLViG0W7Mk10cHXtxlhk1p23GT8GY6GvBh0ETsHOrswqOofRQv+
         UocJWGPyNioR+eobVR46H+KhvU2Wbb+2rwwqDD0UqOI7nFrhx9FKvAStMdSBMeSBk3dY
         YLYgzUi1+YXRhWzn4DxX7V7g5+4jifTBJnKc6KyPwFenPwWQskhi/a8DWvkFIJ938P8m
         7M4o25rE4idyej8yMNtgV+Eqv7JZjDtTmbql4MuNsgW/YOt8eqNRS41quoopy/xDWUFw
         /UHcpmwdL4MZ87MO5XxxsdBDy/r/wkSesqG/14cWnh/nLoG1nO3XXUKYOgKkDNpWf9tZ
         Vllw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fr26ym6A;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j29-20020a056512029d00b004ffaf8fccfcsor399672lfp.5.2023.08.25.00.31.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Aug 2023 00:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fr26ym6A;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692948688; x=1693553488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QtUKgvKARl40I7Fd/UN9egDPP0h5VEUmBVJ6Nb1u2fU=;
        b=fr26ym6AHvoshWMNWRYTe3qFCxj2ShXDBqErVsibOh11pvnNINHtLgKpP+80Jbyv/t
         lR9mg1pc467H/WgiaPZ9RmjWac8V6Kr6Sg8NAZaLylQtUcRNSBDsBmZ5v4l8JUm/ODOx
         UMqQ3ISWGbVrOmzhPaAz7yFyHNJrbySL8r7ESwm0W7rR00ZrdCYhXSRzAhyB/1n5PxIV
         UQHWvVuC6Twd1VhgyBmCyPMwJOp3MQrq6aytbNLCAYkk1dBBS4wyrzPaauCGdYbJjN8L
         cNXEk19BrUUJ1AJL09uZXcax4sLFjE0rWyvpiDbVtmKI5p1coWIZQBAR/LB61fapSWaR
         z5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948688; x=1693553488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtUKgvKARl40I7Fd/UN9egDPP0h5VEUmBVJ6Nb1u2fU=;
        b=RE9Fwb7gL+mdv8hl2656H6VU/KkPeRelSi1NpjLYHLznW/zQzynjDZMpMTbjbxQbp0
         egg305ag3nUGkHFTm/zXit8KJdDl/WBQtZB7LXE4a2BCJrRgwstL/EwxuU0Y8jPIIV3J
         aVSh89nIK11Kbj1aIHVX2dX9f59wcECFcbdO3yBrrvQzqhe8/uDaRcxHvJCYaAIzqeSt
         Tz3u+8+FSZx51XtubK7d5eB+8+4S/2gZdEMCg5lYmvIfu9+s49syhgoH50ijjpSwM6Yq
         derqq/Id5WdWJL7Xdx9YOW3H09sVlTGfV2iDPrxjsg/aTctXS96BQkiSbXH40BuZVdL+
         A8xw==
X-Gm-Message-State: AOJu0YzpHq9hSu7c3E5gLbhMY9fPPa5UuPA2Sxi0etgwd5QXaQJZXr4h
	63XETnECFnu+r4lWbNkb/HXc4/WZklKHbLEVqf4Uzg==
X-Google-Smtp-Source: AGHT+IGQK+tbW+b/sW3c9kYHBzbF/JrctTB0fzkD9PAGgwdoWsomRzS+bT7A2KZIL/tzKbOs7gT7Aw==
X-Received: by 2002:a05:6512:aca:b0:500:9f7b:e6a4 with SMTP id n10-20020a0565120aca00b005009f7be6a4mr3805893lfu.32.1692948688145;
        Fri, 25 Aug 2023 00:31:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.164.69.26])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bcbd7000000b003fef6881350sm1412685wmi.25.2023.08.25.00.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:31:27 -0700 (PDT)
Message-ID: <e81f9d03-b52d-6ea5-4f4e-1bdc69a88d56@linaro.org>
Date: Fri, 25 Aug 2023 09:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 09/12] gdbstub: remove unused user_ctx field
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-s390x@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230824163910.1737079-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9nB2FGgpgtNF

On 24/8/23 18:39, Alex Bennée wrote:
> This was always NULL so drop it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   gdbstub/gdbstub.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
