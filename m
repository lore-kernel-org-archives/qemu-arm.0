Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp145938njk;
        Tue, 16 Jul 2024 05:42:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a07:b0:70a:ffa5:41dc with SMTP id d2e1a72fcca58-70c2e9bb1ddmr2570838b3a.24.1721133776502;
        Tue, 16 Jul 2024 05:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721133776; cv=none;
        d=google.com; s=arc-20160816;
        b=gdq3p3aZ3Z/MCDYx6x+w6cJRLPrPLj9l+jkDWvokxpGpbRpChAdanrNfxEGVnqNFRB
         EZLDTtdox47AZYx0FOkJRDfLp0iMNjYKyTKhsmQSrvKd1rIFWSmlkwpWjnv/jQNUMJY6
         RwAv4/1dfcq+cjR21niFT7c+e+5sB8LY9iUTgbWqA9i9emXteOVxg/r1Rx7efhrJqXMQ
         lqu6eL7O+xrqJwPSeQ/vutuBtjrYHZy0fN6LqeYgD0Fg+/RJu6A8z2PaBOyJqSsc/ERw
         Stw62REELtf47v9WIJ/8s59vKdG/YlH7QDBmglxGUcYlmG6W1uWAfnaCKVbJ4lw2UTb9
         EfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=rBKhieTfpFAHTsjnbaFrzTTNSVsaLXvtM3nLXTw8r7Y=;
        fh=cXksCEj5HT1CFazOFM2X0HVW65Vn4/QYFEPpOqUI0xA=;
        b=PS9HEpZrIQrFFz09dktpQdC6ei7yOwDVTi/fyC8ZgjTI2YxRQNeOTFqWG+9ieY/Vzx
         sua6iY9EdW/LTKTFnrYkXAxYjsXf99IFjX6bQfxP4RFD5hl7O56i+PXhQNkwArDBHbx5
         H7gOQr7mKSvlEhLmY83I/Dtoku8p0A3+XI47sMZ0m1sgls8dotAwqKOi6K6wrUP412Cg
         uTNR3KpQptz7R0/SSZ0lqXJ7Fv5KnfllDrrVMg+Uz7vITgsEMg1jTC37ltgWRyDIsh22
         8etK2Ir+lIBiIWiGPECwqtsBNgHvF4YbsB03NCwpqRwq03sdL56f9EYJv3C4rhR8qbZu
         sg/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkuyb1IV;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-78e3757eb30sor2032657a12.3.2024.07.16.05.42.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 05:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkuyb1IV;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721133776; x=1721738576; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBKhieTfpFAHTsjnbaFrzTTNSVsaLXvtM3nLXTw8r7Y=;
        b=hkuyb1IVZItq+ewRzPCs0iM1mS8W9yd9vEYjKpmk47OpJrLZBJ/enBbZHzZORAfUzv
         xaCc1QMOVhPbuHEmK36iEsRdjQymXmyu19caHyzfdVLELelMzCFW0ZmePFeNY1vK8CBI
         rIQxXOQHr1Jh4DyMlyKPlNa5BCNJzu//gpAmsOSmjycQcAMp8qGRk7ZGFuCXYrg78Ows
         6o0s3ALtqJRR43Mak7LJV10uLiMZVBq798PU476tQOWcuKlGMq+m0edrms7SoHvvALqa
         g7bqFJqRIffu/aWrNG9gmpJgUDRsUh7/lccLkyPMKmcGd8irgLGN8mJM7tMC9Gvor8nL
         qXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721133776; x=1721738576;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBKhieTfpFAHTsjnbaFrzTTNSVsaLXvtM3nLXTw8r7Y=;
        b=i1uGdRjpc091odNl8GhZtYzFv8ygwte556RpGxh+XU0EuB43TJn+6uRFmbQLslfMi+
         AezcQMoPzlo32aHY1VpHivL8KyhRQp5HMh+Rnovl1K6NqgWvNH60NqSj2/ORULt8unKS
         wsXO0AtrEgWTxNMNTxpVKAu2dCF7BnXug1AJYEr3kB2t+J7bF970OPS9AMFdUIt+bL5a
         0xZ/OHkxqTdNoRqJ3CWv3gKk7/JR7imtad7/SERfPJk7Xu92OTTS5v5TByqNhbqcZryQ
         LKsaT356aFDY74l7jUPrffjqfsK26vXD84OCz+ft20vm3mJjxf+0iye6VuQ3uUWaxJQS
         ZW/g==
X-Gm-Message-State: AOJu0YxL6BjD3j1VoEs4+vh8D2M+C1dkJihiEJ9RoItcsSZ/kLBGKHbf
	ILGsHSBPFlg+3HKK+RWl1VQSmK+dTUDUV4KFuhWyb91Ysa500YBuM21RBK4RZbAa4Q==
X-Google-Smtp-Source: AGHT+IFNB5QEj84aXPWCUWFi+7nkU9tR4WTy8SVIIZUMRcrtlZHmDEwkNIlWWDLleO/20pChjxuDuA==
X-Received: by 2002:a05:6a20:7286:b0:1b5:d063:339e with SMTP id adf61e73a8af0-1c3f123a5cdmr2225247637.23.1721133776047;
        Tue, 16 Jul 2024 05:42:56 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] (201-1-50-128.dsl.telesp.net.br. [201.1.50.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc2634fsm57506685ad.127.2024.07.16.05.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:42:55 -0700 (PDT)
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20240716114229.329355-1-alex.bennee@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <b9690162-170e-1f74-f148-0642a8503002@linaro.org>
Date: Tue, 16 Jul 2024 09:42:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20240716114229.329355-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: evO6opedZJy0

Hi Alex,

On 7/16/24 8:42 AM, Alex Bennée wrote:
> Coverity reported a memory leak (CID 1549757) in this code and its
> admittedly rather clumsy handling of extending the command table.
> Instead of handing over a full array of the commands lets use the
> lighter weight GPtrArray and simply test for the presence of each
> entry as we go. This avoids complications of transferring ownership of
> arrays and keeps the final command entries as static entries in the
> target code.
How did you run Coverity to find the leak? I'm wondering what's the
quickest way to check it next time.


> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Gustavo Bueno Romero <gustavo.romero@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
