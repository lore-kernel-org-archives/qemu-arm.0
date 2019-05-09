Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1015602wrh;
        Thu, 9 May 2019 10:03:20 -0700 (PDT)
X-Received: by 2002:a63:6fcf:: with SMTP id k198mr7001432pgc.158.1557421400595;
        Thu, 09 May 2019 10:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557421400; cv=none;
        d=google.com; s=arc-20160816;
        b=d1Dq0SfI1ZSMcc978TuYG7MY05G7PJSiqZJaycKeLiksLHtFUt8DPgo2th8BiC9Ba8
         Uyz3bvodXoj+OfIbdJN+LMVP11WdDXE6hasobb1rINIAA4H2jDhnior6EwSBw0VGluup
         H33eMPC7ZV4uiwRFqQh3ccz9uiTRYFciKV5mQIYscwyjpgUPmvfUEbkFoW807vrVZehb
         My8mNjHap6p4T2B1lw02W1yvQWjXLNE3ZOWcvl4RwoKbY2+MV6llp7vzSVZdTftzDxiG
         efzMQOQSqtYu4EHIa9zAxn/YU0/QjND8utmm3AlgXUxGnUhYP4E+rxZCKDso9udZnNa8
         JOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=IIuO5kDuhc+1kljyLHIpwp4aYnt0QxoweXrTUyYLx0E=;
        b=UB24wfMBXznJw6p+dw3T9dQDY1T6LnMY1jvt8q0vbflM7QeGqecGRhajuxNw5TXP3q
         vfZu+9M7AyXBAkUInCpWMujWUJDwUKc2ic/n218/5DEYvzGzYNAVtYgBx+9PS74lPuPh
         jgdcRIK5clOXrqsMrEoFAtKug1IATH7sAIth38/JQ5AM2bFIsaw8rs3dHLaSr4xbJG2+
         z4MhFjD4e/9Ji07r3lb16L43qrOZY/cMt+wZh06Zt/EbQgNysGOSsxKom512lKIqTKfW
         cGpRNeX5lr0NVBRMyrh06ICLgYoVlZeoMm2P2Jn7DKB6jKj4R7cSesqQNWwEzkUHc/+T
         xl7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ze0YLmR0;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f3sor2861375pgv.57.2019.05.09.10.03.20
        (Google Transport Security);
        Thu, 09 May 2019 10:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ze0YLmR0;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IIuO5kDuhc+1kljyLHIpwp4aYnt0QxoweXrTUyYLx0E=;
        b=Ze0YLmR0td2vHu0oL1PM56kdXJiChCcmAr9bKQzUXjxZSo6y2BmN60KKXsy6b6gdFM
         sNid6lrruXvFIR4q4DQamak1F+1Trc+fIQBdmHfZe7m1KQv5HTKBbpf/sDf4/H4TC8K4
         GljQvm40WkC/9+f75fT5C7oCD79dK4LSv/qSijvmgIlLYRztsc2rhqLLWniUeFbm7l3n
         mj2LHbTIGO64Y/joaswwZPNB7HNordRPMDwcVDEVSnlzOVzO/DBcraqV1yc539sMgbdv
         fZkofFVii272dxIs2/jGRDqnfIlBgEiPyygESv27TzcEbXCTKF7H/TIYwnrNd2JUj+U/
         TDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IIuO5kDuhc+1kljyLHIpwp4aYnt0QxoweXrTUyYLx0E=;
        b=dWKpi70ro8/bZ4CE1UW3qmkr65Yql/Hj7ujuydv2RjZufwCF/jT4pLy7H+C6quHL9D
         cUXrrn9zxigDyeXpEV1s2Cct903V0FlGeVPkt8rd3t6glt2o7uLAL43+tggiD6fTuGF0
         J1oWxQpPeAbcsYn8ryC4XBmR5f1VpHPushxxVzBp7cWmuTt/Rhrv8kJm/h7NJIyvfhMB
         ofT4SGaTAem+XX6Sw3KE1WjS7nTES2ET5Nv/dKGwDtsDPpMzUapOyCT0y1CFsp/IiQgY
         5unX5DKCHnEC+wddHQZY2tE3V6TWyEgsBkta/sbPfcvW6KW83qfobxGFV7T6XaG3i941
         ufSA==
X-Gm-Message-State: APjAAAVEy87vV8HYmkQ7FcrIDBIriP0Q63Rdd/CXD97DENCUJaUKCGNN
	LbxZo5pJllo0xKu5ZFxii8I=
X-Google-Smtp-Source: APXvYqylwXxRxLhEqHkAQ2znYIVqOrIGWyH/7aK/puSfE3RASjQK1Jkqm7HoXMdzVptvOnVcpLr0Zw==
X-Received: by 2002:a63:b1d:: with SMTP id 29mr6993073pgl.103.1557421399819;
        Thu, 09 May 2019 10:03:19 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from [172.31.99.192] (50-248-210-99-static.hfc.comcastbusiness.net. [50.248.210.99])
        by smtp.googlemail.com with ESMTPSA id l9sm2886206pgq.48.2019.05.09.10.03.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 10:03:18 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v1 10/23] tests/tcg/multiarch: expand system memory test
 to cover more
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-11-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVuQENBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAGJASUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <fa94b57f-12e1-62c4-e67c-f83667adea59@twiddle.net>
Date: Thu, 9 May 2019 10:03:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Zy1gGbwUr03e

On 5/9/19 9:58 AM, Alex Bennée wrote:
> +memory: CFLAGS+=-DCHECK_UNALIGNED

I suggest -DCHECK_UNALIGNED=1 here, and elsewhere -DCHECK_UNALIGNED=0, and then

#ifndef CHECK_UNALIGNED
# error "Target does not specify CHECK_UNALIGNED"
#endif

Then you don't need conditional compilation within the tests as well.


r~
