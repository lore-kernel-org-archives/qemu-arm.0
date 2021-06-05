Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1700448lfa;
        Fri, 4 Jun 2021 20:52:51 -0700 (PDT)
X-Received: by 2002:aa7:828f:0:b029:200:6e27:8c8f with SMTP id s15-20020aa7828f0000b02902006e278c8fmr7424359pfm.44.1622865171132;
        Fri, 04 Jun 2021 20:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622865171; cv=none;
        d=google.com; s=arc-20160816;
        b=PGV7meB/Z5GTfKBr6P64z+HLWSmGBt69uZDgLD1XWXrSESa0nydAqiUuUOmIsPmAz2
         DQE6yE+v9AnDMnXxmq4iIF4vCDnkAIPE/PvPexwlOLDbtZDFajme3O0im9XJgfCEPZPQ
         zSfNWrj/L8JaMjtZvtv1uCl/9b0tij7cN9wjopM6az40QobaQENGCMiKJFQGyxzF9SiX
         pDF7nhIh4GgLsJVy93N1ISBnHyVEK//FaPrTLMqpUX7MVvcoDoU3T6dpHBW30HOt34wE
         RxzJoNSBagSor+pjrqbx0QBQLgtGR8pcEWTSQt7wwFVIqJ4H7zYGlMir9DVJHIpHj4dp
         LEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=L1gom5IMTTGQCgkbERZIWS2Ac0AV86l1CCiwTuO/joI=;
        b=MxROU/IHIvPtvxi50cd/VBjGabOqUVS3Ox/wsjYTEvvDHuEVJG5n5o0PufI99b/ftV
         TJD6591+HBZ+vBRr90OvIYUqcvFvI8tmoEO+XgGwe2o4Vm/mtrHFMLklhQs02vxHqbji
         fxnbsOkYFqSeqq0TbYJx07YGKzNnyIMUEwkq1FsyWYg07q9om/B6o4LFn962yhMSyfPi
         YnGYo/ZJY6z4txT4QVLw37Q1BnwEmNNvRzpha7wruYuBQUNBr8RznX3jm1/DDYvTL1vp
         /16Rq5ydtuK62Rr0O1aV/T6e/X0P4Rz0kh9wHI+gUbEnD5DCWFNNR1X51/jjC83REKaF
         OSrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFCKQiV4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v19sor4527722ple.21.2021.06.04.20.52.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 20:52:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFCKQiV4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L1gom5IMTTGQCgkbERZIWS2Ac0AV86l1CCiwTuO/joI=;
        b=XFCKQiV4FtaUqIaJ1utvHsb1sFX4hEHw3yAXyBhfah6KvZeT4Pj247N8Ij3aql+ytv
         H0V/NTn5eaarYvjhUMh9gtKiQqgRk/EBZNzuOVrTMl0PbS6icaXSI1QOhpTw6w7GTT3v
         08tq9JauI1VVcZW0SYrDATDp9ekApxYmzcMDbzDIYi6gZFGgoCYJB5dyrP1B7ZK2t94H
         +qB537fHHlyWjrBovLrdbZUk6gStsTTW0AV0rkN0ozPknI4H1UryOySzV95sSEKOnbC/
         i0gPB4/TiMPFIkyYxQ+MffBzQbvl0Iba53i4FsI5VgLPwfT333o6aIuj76sKJ4/SnM1s
         +cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L1gom5IMTTGQCgkbERZIWS2Ac0AV86l1CCiwTuO/joI=;
        b=nrkKvcENz4+BYXnEiU5IgzbNrLoiDBQmnJjXR/NKv3W6Q6O9s2MIQdpyvW8Uh8t7tx
         uY+SuzgMPR4ACvbyDGSyD/Xz2wA3o/F7gRkzFyQpL6DdDC82s3nUvtrpFe8gPoxN61On
         082P2ystz/KaqQnyefHjdNOnLlZDbkvxPfzhj9J5fZLZwR1pw0tHypUY/gDVU30mFPhp
         +jL7xjWIQ/38gMmZV+gvo6Tj5a2gwSxAkManSmx47//C5DjDh7sggWuH9wikty30nLeI
         GeqXa6lDIzBTS1lU/Arx3RIcWwGIB74xXhvaxuY3buQkzR8gFgAbe78awdjx6tbvCukR
         8RhA==
X-Gm-Message-State: AOAM5319I/1SDWeUZT4IWWudjYUYdLjM2BbFFNI1u5IcGBwkAKTdmVP6
	ML820C1NzYAWkoR9AoIV+Ia2PrTtUGjevh8I
X-Google-Smtp-Source: ABdhPJwmT1Z++t9qr6DJtu7zNtH9mevoC2r4iGDbM+uJ5/qBWESZQbtJQhU7Cpxt9UFIL0CMDqcgvQ==
X-Received: by 2002:a17:902:bb8e:b029:f8:b497:825c with SMTP id m14-20020a170902bb8eb02900f8b497825cmr7432977pls.82.1622865170570;
        Fri, 04 Jun 2021 20:52:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id i1sm2713601pfc.206.2021.06.04.20.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 20:52:50 -0700 (PDT)
Subject: Re: [PATCH v16 59/99] MAINTAINERS: update arm kvm maintained files to
 all in target/arm/kvm/
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-60-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1bb22a16-2698-8530-d3d8-1308fadfdcbf@linaro.org>
Date: Fri, 4 Jun 2021 20:52:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-60-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RYAyGDw+oMO/

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
