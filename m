Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3585170lfc;
        Mon, 1 Jun 2020 17:40:28 -0700 (PDT)
X-Received: by 2002:a17:902:ec06:: with SMTP id l6mr22902642pld.193.1591058428100;
        Mon, 01 Jun 2020 17:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591058428; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ1avQ/4qnWK00PtqrQUt4OGnx/y/8ACBxjti1pEVwwLjej5nQl5jyesgUerkZhwRe
         uoGSkeZe/RSYzxEhOAtSCZGugpmSygW7iW0Ben6TsZh+oxHC2B4/dH0hwoS8+cZf3fIl
         +UIUSLPF7gSe6kWPLlPhYRdLEblSnRVwLsd0dfUQY9oiLqxXxpx5gSsZph16Wt7qtquk
         kiV462INVFYYIohlGCz2VBD1jD1uyMKJjlM9sBpajvPxJZV9KtW1cWXkggqipqFBKJZE
         To1MbCBD+i3adiwkqLgNlg4v4c910qMuOUx6Od3ntj1Ekf7e3ruGr1AJdHO4/yhFMirT
         9nFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Nzvkza+wwUwUXI0A7j5G5COIwo/zVmiMKp97kPpxA2E=;
        b=DtRxTtPHlLtS09tibdSTdyHTTVB71CxeyTKMS1d8POWfg/9zoKV+nRCcyMoIMZDMpC
         pX50rrUdMPYSu3Yrix43y6uWM79xzHmGdKpqtEVdVGKaYV0dS9QTpzwg034ZhWepbTTk
         qmicIGxrUisCQShicROuiVhUHeHRzaTEQzNyu8qnR9avqhuW50D1qTtF9xcR9/Fultix
         /wjzv3YRFgh68O4SaILczsPv5I7nujTajLhJBPbvDphq2tubO6ElqERVjOtpGNJzjswa
         GyPoU1hxmSmSZUrsov0kkak7td8KkxoYWVSyxoOejzqwbvfPBldeaQtLQcprHP6b29eW
         BYtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QaKPWZIK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o123sor1342872pfg.64.2020.06.01.17.40.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jun 2020 17:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QaKPWZIK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nzvkza+wwUwUXI0A7j5G5COIwo/zVmiMKp97kPpxA2E=;
        b=QaKPWZIK70ZAUq/SkyI2G5L0bse8Ppy/qht16sYJyVc+28zAO5mnTMp52Azk51kwjB
         gyJv1gcB9Bm4/alla+tL6xydbM3q7qM7h3+BHCoK8lmt79nR9SXUi/DtL4EPOt6PrBNO
         Nuj2NgxKHVbzwi4V1bMouEILJKlx52amOFWiO8C46U/0DVKMJF5TAnlWRsV+uqr/VFpW
         hRQFm96E5uRYx04DUfOlM6qUb0//uEa25SN5kTq9J7FnVYxqsRAK7f4nbd+5uPUnWK14
         HdT3ghPBZ+53EjPi5T2vHR3ci4I3FZjugXtqeaFAJS+80MFnSEVNezExKUfxhEFiUCTU
         dgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nzvkza+wwUwUXI0A7j5G5COIwo/zVmiMKp97kPpxA2E=;
        b=NZ9oSGla9b5a6dijF9OIBZMDz1MZZREPRSCmqqHNw0h82tjDtOKRzBS9lUmmp0hY54
         lqjdt9qXYeFefhtVrzYPpG2PTUuvu7FduMXH5YNzDFEqUbluxib+p6qBO8qasA5UK3KO
         m8iD08uK9Ki9xHDa7sOPilCrYsP6TOpyrkQYEI7/uQ2WsLvoE9DNa5jCuWs2vo7FBkaA
         DgUEqVFct+lv/o0O8OXHQxUsf+mN1IyMPpAiHo7l8tOLV4u39+ChRpJQOhvEet9iO3lu
         RxRwX2TtcvbPzfMBEAJH/oorLCh2zwtW2PSK9N03JhPDZVBJfI0jnY1/LmEV5aaOF47i
         +yhA==
X-Gm-Message-State: AOAM533pV3B5hdFa/l0xIgQeC/skdjz3EYZlsiWZ6TVbzvzGEFM5SzAK
	wju6zKBlNhRuNJ+AsOIacR6NxIQT
X-Google-Smtp-Source: ABdhPJxjuYhMorI1goZoK9RpI4ZKj+CKK+ZnQ6NNyWKbK6S4T+4nDT2mzaJAfSijmkAOAzSuSPz6Aw==
X-Received: by 2002:a05:6a00:843:: with SMTP id q3mr22078614pfk.107.1591058427630;
        Mon, 01 Jun 2020 17:40:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id l23sm519373pgc.55.2020.06.01.17.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 17:40:26 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] tests/tcg: add simple commpage test case
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200527100546.29297-1-alex.bennee@linaro.org>
 <20200527100546.29297-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <286ec34b-06e0-92c5-4073-4951727ecb50@linaro.org>
Date: Mon, 1 Jun 2020 17:40:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527100546.29297-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ZyUqTRbVXSsS

On 5/27/20 3:05 AM, Alex Bennée wrote:
> The COMMPAGE are a number of kernel provided user-space routines for
> 32 bit ARM systems. Add a basic series of smoke tests to ensure it is
> working as it should.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/arm/commpage.c      | 61 +++++++++++++++++++++++++++++++++++
>  tests/tcg/arm/Makefile.target |  2 ++
>  2 files changed, 63 insertions(+)
>  create mode 100644 tests/tcg/arm/commpage.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
