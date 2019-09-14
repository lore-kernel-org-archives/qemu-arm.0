Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2211586wrp;
        Sat, 14 Sep 2019 11:17:00 -0700 (PDT)
X-Received: by 2002:a05:6402:1259:: with SMTP id l25mr2640322edw.174.1568485020358;
        Sat, 14 Sep 2019 11:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568485020; cv=none;
        d=google.com; s=arc-20160816;
        b=qfK3aknD5lrX7Q4TSb7fU2zEcVchyI6kxsZ9QUAFucGRI1/IPeyw8ju0xIsiNELIwx
         A4nmRaBKkQHTX79q5tpKMfz7k7hbHhDCtYtfUdDurhhR8C/Nf9yjra8JmMNJy1Ih5GmK
         Fsu1nMsWpVtPpSUTIgsUG8bSMskxSaNMBHU4vjFsB5bFHmuourOA+WHVcP4RdQutPM8L
         SXcRqADLvVmu8TH9C90dwLoAu9x0FuA6M/YPpCKV1lcfqdcb+G+BxTk/k7JHeNzMpcHb
         tFPAveHWeZvUG6EWx9tOhRfUAjC5PM2bYh8yJgULi6ubKm5Ldd3FMAxggmlvo4wCAKPi
         IZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=X/Kyf7dYtaqUSu8ByDG9rWgwKebFYKkdIdx1ypmMZ/o=;
        b=rAEyDNsi2v1Ryw6/MZb6dWQz8P+DFysu/uiWZ+Mg9xyl5KsHRpKVS7LNTe5fiT0UTB
         Wud57dygXfxIv/wQojuTqeYyVqwfML3ez+dM7j6OvGJyUyo6K+6rZHZhnzjg7m02Sagh
         3qijr1FTwDMpK6fECUc7vRsQJWSXMasPdlzRExEPtQT2fB/BqKzgSTHHpTv4PvntjmnW
         UJcd7bwqlLA4C2IPpLmQkgqd8j13yDg2MQDCUaHR0XcgReQ0mdoTvxc75oCDlasOKKt+
         9e5bfHoSwzeEOLFItEmWBJJzPB07GoGAUICFq332y/B0Zz/NmKeHmVoj0pFXL/igbjtd
         g5jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWG9XGJZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p26sor12987860edy.18.2019.09.14.11.17.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 14 Sep 2019 11:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWG9XGJZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X/Kyf7dYtaqUSu8ByDG9rWgwKebFYKkdIdx1ypmMZ/o=;
        b=OWG9XGJZdvsV5UxbsSHFa3ZzBLXbOKz0GHLVrQhIPHEnNolhH6f/3kyUXq23WghvVI
         WL/kGQuunYeomXtdJzvTYOffC7ScqlWsFz8IibjIBUSN69ag+rskogPmEVrJpcqk7NRI
         4oL0i0dqlOMcee2B6n5bTAjXLihDvIKnIWSNTd0FpUKUMj8JktM6k3uOkwEFYY6urrHO
         NTReWnKMbN0pUvCDwcV6J5et9HizqUx+gqM6Eqv7A2PfC2XR+xdQw0zQTXClbbztL+Rg
         kElv0yR3DKfxczipj1NXcaOP1VeC0MmMAsZH8hGEpCDx53ElB6mMCVv2wEcxj1Fa2s94
         IFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X/Kyf7dYtaqUSu8ByDG9rWgwKebFYKkdIdx1ypmMZ/o=;
        b=pXKD7MZJ1dEgMw1Tgu2nYj7FswqVt1ew6PdPXuIW6BVB4HE2ZsDIxrDEgK5vJ7+RDm
         FFFHbog5c9rvtkphDrhtmw1/IoWKO6mYUGZyBeUqIIP2lJx/7q3A830higr79zvSbFzk
         EuCoTe2w32PXpWJHu7BwwmnQoD9s7P27T6hv4g2GAKCrB/lkL1JltGcwPhgSVti2Urdv
         YlhBX2KKJn2lVwhSpvZZLbo+EGf6I6WDspIr7XI9x3JLRkBr0wd8ihJ/mFFvZd4EIJ4w
         WRVjHokee3+CCmVeOmrT2/1mPD4C2djz7l6sU3SFteSE7mtX79xOP8OzrsVT6qIrc/Px
         JAfw==
X-Gm-Message-State: APjAAAV8Qf3mBkUrdgArVj0mPCE7NFZ+mSOlJVKNdaARhqNoxDumTiuL
	qu1JiNLPrw9lB88ytph9sm9avljj
X-Google-Smtp-Source: APXvYqwjEchJshBQc+B7kiCGgxi3upnAPIE+e6KSHLu9vi/XJPV4X8i3jgsrsClS042RLGtmqpXYTA==
X-Received: by 2002:a50:cb8c:: with SMTP id k12mr46120379edi.94.1568485020047;
        Sat, 14 Sep 2019 11:17:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.44.107] ([185.81.138.21])
        by smtp.gmail.com with ESMTPSA id j5sm5984212edj.62.2019.09.14.11.16.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Sep 2019 11:16:59 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 3/4] elf: move elf_ops.h into include/elf/
 and rename
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-4-alex.bennee@linaro.org> <878sqv1by6.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bac4e3bb-8454-fa32-8b5a-b600fc1fb410@linaro.org>
Date: Sat, 14 Sep 2019 14:16:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <878sqv1by6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 17tbs5KYMKNY

On 9/11/19 4:20 AM, Alex Bennée wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Lets keep all the Elf manipulation bits together. Also rename the file
>> to better reflect how it is used and add a little header to the file.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  hw/core/loader.c                            | 4 ++--
> It is arguable this could be a private header in hw/core as it is only
> included in one place.
> 

Let's leave it here.


r~
