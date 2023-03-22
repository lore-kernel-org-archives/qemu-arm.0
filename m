Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5841862ejb;
        Wed, 22 Mar 2023 16:01:52 -0700 (PDT)
X-Received: by 2002:a17:90a:1c2:b0:23f:7c8c:4f2d with SMTP id 2-20020a17090a01c200b0023f7c8c4f2dmr5016007pjd.16.1679526112552;
        Wed, 22 Mar 2023 16:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679526112; cv=none;
        d=google.com; s=arc-20160816;
        b=AUQ77EomXVdR4EnRHelY1ofyVbHfGyerQ+o5lEGVlz4vsSCrltol4x+SSggWY19+TP
         QA018kWWT+zyubBnXn1YfeyASZoRqlZQttV7PxF9OfuvC7Uj/9yVH/Vbgc/2Q3AI6QM1
         JV34SU0WQo8qC+ff4CZLF0DPckHJpc141yvAXAB2KBfTyWeRU8OH8sM+pe7zcHLZfBlw
         fLIaBYR3BIVroaaAaHfIeikeFsOEyG8Xcrlrbi9RWZNKrnao5yg6YoXe9+/eYOYQQ9hU
         uewgKQg7iQptbLRxfw9BvIHjtsq3UAZUyPwBOpa+6mB5T330GQanttYPfXSsa9SK19rO
         G2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ReUryx4gvbmL6JuYVbeBQ/DwzgdscFh2cRootuKwalI=;
        b=QrHSeDnz0ZF543hu5M0CUh+Jz5FhrE3BnqI2GyFTfdfEIACjZhL7tXnq88nQgB+NB7
         Pl95wh/Z2/0NzvzP1zO02uBmE0dvfx6b4HOAiqbZBan/1fwNGfa6QXHVWMY2P1auv22y
         Z5JQMDD9LhJP4gckSO9WGgzwhlnBtgAcgduF4Y9bTqA0BwCh2+KjGtOxsks31se+k1VV
         1DBtUhPywrh4M5Cqt5H1/jm7cKXjTMmCrYkam6WhUHO7ooT288psy9xtM8EsPWFiFL32
         wJz67NY25i2IAdsbj/eg0qXs7Qn42Y4MRFnR11z1bgGUh/pzZpu2Ig6ghsKdUcb6E4j4
         000g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HaS/3e1D";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h6-20020a17090acf0600b0023f06e7f46csor62659pju.1.2023.03.22.16.01.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Mar 2023 16:01:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HaS/3e1D";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679526112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReUryx4gvbmL6JuYVbeBQ/DwzgdscFh2cRootuKwalI=;
        b=HaS/3e1DZGHtmimyUSFqrB46JCFgLUczs78+0lsmc1FEwRluWRcF96reV4Td5vsows
         jDGiVCzuSVyHTENQOPBIvHS9wy+dA+jwQnB7MX1E78OwnDSce5Bc+dE5+iV5ZegrqrQ5
         REbGavtzg7QyTlp9a+O4NYLeEAj3geLh29NAM+Kp6/CZN6YTxa1WY/z183txucnMuEkV
         R5lIcHyup6aWlyFzNrzOvQ777L2VBhMPItH4NDr8httLwBtricyn5ukTTsrV8h14Qata
         zgrtNcw+/Nwre/+UjRCmS4yFtkUJAGlaMdVXV0VO4f5f1RelAzvSBrEqiIX0GF0nUzpC
         6xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679526112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReUryx4gvbmL6JuYVbeBQ/DwzgdscFh2cRootuKwalI=;
        b=ZHC3Xen8VP6gRoo+FX967KRBRQtnvKBmqG58iGFiMme2vlJuKW1r93cJBL/GVH/HF0
         W5l8kXcOxZfxxD5Jk9eQQ684T/OCZwkvYZa8VVQ3Vw2rRDop2xocDM2LOHItCzbJR1TB
         p+D57G9t67zvoShu+Aa9noCSemYhgyQ01NNMK+IKR/K4PEU5y4wp9l5n2v1UVnfizKAu
         M67wMufH3vU6piLliup+sapW7yDk4p/1IuFoHAbzm/fqTUuhOEPzXpptJhOK59DfvkH2
         t/qzLg5KyW/qQPkJ/WytBreZnYa5X8auzZzSvteEdVGgRPOzXpSQHDl7HZuZwN8gMHR5
         gCfw==
X-Gm-Message-State: AO0yUKXoma8+Ey0YqAtEkHJFRMAL6Wd37FJiIZzXNnB0rVM//RKdjObz
	D4/6175/NU6HRhOgMBy1Dk3NoJUk
X-Google-Smtp-Source: AK7set91Y/TxFCTTdHcU84bCfgLZMWohrWdHuauIyzOsI8O9WWD2niON4urfPz0uCLkWo2Pf3dHKHw==
X-Received: by 2002:a17:90a:50:b0:23f:ebf2:d3e9 with SMTP id 16-20020a17090a005000b0023febf2d3e9mr5472371pjb.6.1679526112101;
        Wed, 22 Mar 2023 16:01:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957? ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
        by smtp.gmail.com with ESMTPSA id e21-20020a17090a4a1500b0023b415305a4sm30381pjh.43.2023.03.22.16.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 16:01:51 -0700 (PDT)
Message-ID: <9e1799a7-bb14-7639-1792-717fc34a1844@linaro.org>
Date: Wed, 22 Mar 2023 16:01:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-8-aaron@os.amperecomputing.com>
 <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
 <ZBtm15EMqUZHRx3a@strawberry.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZBtm15EMqUZHRx3a@strawberry.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: plh1KmWYVYpD

On 3/22/23 13:36, Aaron Lindsay wrote:
> I have not played around with this further. Do you feel this is
> important to look into prior to merging this patchset (since QARMA3
> isn't the default)?

No, a mere curiosity.


r~
