Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp581783ejc;
        Thu, 19 Jan 2023 11:49:13 -0800 (PST)
X-Received: by 2002:a17:906:9417:b0:86c:f7ac:71ff with SMTP id q23-20020a170906941700b0086cf7ac71ffmr12399900ejx.10.1674157753072;
        Thu, 19 Jan 2023 11:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674157753; cv=none;
        d=google.com; s=arc-20160816;
        b=qkLO8moGAahM9U8r5Ql4F1caTvN2rwympqq90SKoZpTgjxZkmCHnfTq1TNRiid+/hb
         zMVQvNaWjZxW+rdBu5kgQwkSGNLXTPI0Uiqw4Hy9rY32K9zq+yUXruZNu+WwoFKYaxcv
         iEeCQ6lXHNWYkuSRy61gKvDBE9qMdJ9aLYdP5CQplr0/V0GqQhlY0bkiKKrn52oZltP4
         SZnmQmKABd7IG16IEMuN7ZVJUXO/TnTmGzg78Rj5tq4kjcbeB+mdqbZ3+66Ch+pOcr4L
         /RZVvtjDFRR1pIIpldyixWxS1ZiphHgdNo2CQXxCnkiR5ZCiRHbHsBLQRfdGXpdSnlLb
         lAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uDQnUo+GAsNpaWlrHycGOWoaB4j3psxCMiiaytQPb48=;
        b=tALRs36x9qo6LDRYftdB2bI2wmvEhhQMxYPibhEN3yzyLmY9xHx9hzDFBWYMME7k+3
         iPqQGE5BxZuwhZgDInG+NOeJwWLvT5uoQitdP52YzR2q6TunvS/mikjxe+nsg4o0mf2Y
         AE8mq4YTtlAhDXgyz+OaGGQv1cdoXRWlCZVIUFHfhJE5+kW0YVfvhOsNSZD9xvTf0sAw
         1BS/Cmt/aokOimNWhkkT2RjMK3Ql+pPbul28arWsWxcbD6Al3nQsaa9HoM3FzSGP/FJA
         o6vaVf3TQvxbgkVOg849HyNlHRKHF/1giOFNherFSrLdi9xwnO5apyTpnyu7aMzTxerZ
         V45w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xzDwvfSX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id la5-20020a170906ad8500b0086e210acc58sor7573677ejb.103.2023.01.19.11.49.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 11:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xzDwvfSX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDQnUo+GAsNpaWlrHycGOWoaB4j3psxCMiiaytQPb48=;
        b=xzDwvfSX+SlSwCQUIWTaVaZs4DDka8kMEfryqfxKaKJJyfduK78Q85A06IvBBMqyAQ
         u4XuMBITWvZelDUJDJ7pkEibmSZG/sqJO4TjeSjd4gMYUNoWYCvd22ykTmZIheNBqLzC
         gByUoCQNefKHTLHwlINFM0cUG0Hwkqh7vqE/XL3FOFx7s8KKsiva5q3qUAyX3dWvhL8k
         rv0KGzzBQITeCoJZ9mDuAiKwoaa9AnXYhdZRsnTt0ysX0xfHXSXdpv9zAuJwhSObwUj0
         LqeA+2Ol1eyjJwLX7CWRPNNzjQ2rcGVnmrFl0QsKBHCTkTs6iqHUOiekgm4Nzlb+WZD/
         NiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDQnUo+GAsNpaWlrHycGOWoaB4j3psxCMiiaytQPb48=;
        b=aQUruE7qZeu4XnBsM1fkCwP9avDIkHFMeZcJ3RRYvowFRZk9EWGWqkPpsJPAboWzv9
         1cfs3c9BlrRawoB0cmceZo0altBqZQ3IAEyFn/UJxv72kBOxnbV99zLcwqK9vq2oxhNu
         UKgtRMVv3c3Hpaksr81W2D5BTdQa+WsvWSXMDmV7maIEKtV6dICwACz7m3zFMlKLWJwo
         ORD+Qp5Md7e07YPUL3avzIZdr7gx9g+6vwDUhZTY5rClprqLV2j/Vw2q8mAJxE40Sja6
         t2fRocd6g4ey+1ZcGC4hTj4lC2kiUn6W0HtRApchKPqdgwA0ndfbHp65SRTImGUxP4bw
         DW6Q==
X-Gm-Message-State: AFqh2ko/EMGwsRx6eiteSJ6JGbKNsPOTwOW9WXkaZmFY7WueKrpTdIND
	EZyic/SD5oOfbGDFJ2l/c1IAdgv4
X-Google-Smtp-Source: AMrXdXvTQH5y56Swf2ZEtudzm8kJ+cVTVgQcpMqt0r6DHqdF3WJXEG5o+Sk6tI3DwBCDZCxSZHE6Uw==
X-Received: by 2002:a17:906:8d08:b0:86f:e30c:72c1 with SMTP id rv8-20020a1709068d0800b0086fe30c72c1mr14030191ejc.8.1674157752831;
        Thu, 19 Jan 2023 11:49:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id b2-20020a0564021f0200b0048c85c5ad30sm16002713edb.83.2023.01.19.11.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:49:12 -0800 (PST)
Message-ID: <54802c99-05fb-9362-6a75-1509d77621af@linaro.org>
Date: Thu, 19 Jan 2023 20:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 12/15] tests/tcg: Do not build/run TCG tests if TCG
 is disabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-13-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119135424.5417-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kwASF/qXA66y

On 19/1/23 14:54, Fabiano Rosas wrote:
> The tests under tests/tcg depend on the TCG accelerator. Do not build
> them if --disable-tcg was given in the configure line.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configure | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
