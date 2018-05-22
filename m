Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1785311wme;
        Tue, 22 May 2018 10:45:35 -0700 (PDT)
X-Received: by 2002:a65:5a0d:: with SMTP id y13-v6mr20214899pgs.15.1527011135593;
        Tue, 22 May 2018 10:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527011135; cv=none;
        d=google.com; s=arc-20160816;
        b=M/TQLgQ1tl6cKR5ts2NljbeYz4uo7tOTxJGkXkLIh/auE2A+2xowli7mxywtyrXieT
         U1I7B7Y/lOO1p2EkRd+mH397rkHZBHgESYTs26QWco6H5Haj8rz8GFdoto+oBOQyB/2Z
         6bsQ2r28miRfg77TGMw3ixrSZOAkQof+sQn6dQeClFoWZ1XC705WVHqF+BmoyqbtX26B
         g37IZy/xUbnvG5IqV+bbRaA8LQhHQx4jYkHejiw+n80BSwsrHKll+bKACGMfT2Q2uBcN
         EP34kbfv/ztPykEqsGzwQr1BXvrRTYrStQ4pgiaKoi8mPTgyEP2T0QNigDHqfmcSSqD+
         nAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=7P+SxNo4pgdXZe8RezZvD8Xb2lp7eGlJWel4l+CrNAk=;
        b=uUcDleKKMJSmpR2z/dj3LWIS6jms38Zq0EATfKybF64HNI+1F4WCr1i1VA8rIbMLQc
         e0tTYu8fjAMnjnoTQjkjZIzdevZiNVl55AkG61svloftYSOzV7n5O88NPq42bbnkkEyX
         2sHGSN/XoAcyL7LKCfk4UAtneD4LWnWk0OTuL3FUKS2IHJENHD4jNxc0/R8I9xaMustM
         EWVlk/MYiBK2Ol7Eh2CLtogvc9rWUgx1eU7lPNrFBTwPUorvFixl3IckT7/GxqDNjiYb
         Wczw6Z7BuepjmjxDuBYI6+S6bM3fyUvGBSHbn2+9wgNV02Pyl1zYc0F51+OpaXBcu6xZ
         bb6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M6C5l2sM;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r68-v6sor6785578pfi.57.2018.05.22.10.45.35
        (Google Transport Security);
        Tue, 22 May 2018 10:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M6C5l2sM;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7P+SxNo4pgdXZe8RezZvD8Xb2lp7eGlJWel4l+CrNAk=;
        b=M6C5l2sMU931xgMxDkyAKD3nOkwBMQUAj8X38HeUs3YoNeAH46/uMuYWBTpRJqFRDI
         kZV3KGZx8CjCDvy+S6nhW01DMkoPBmM52kjotsdsfkJu1E4xoNg2InHvO3aIZW9uyZ0c
         H1yuDX6RCl55cW0ccXT3XVnO9eePqJ3qNOlsUlKLK4Mdc/C5xVsQ+JT8TT3w57xrFbg9
         /jelDU270y8w5wFHqR33Xw7thplnEbXRtU1WWE7Xu+YIoXeFjWmUfQgpKrPUaGHjTmN4
         SzXKpWKQEC6zkLDJ7x9fSKfA1UrxVHFcCOT2D8jskw5PVdb5s8ORuqwRhenTDqUD817o
         hhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7P+SxNo4pgdXZe8RezZvD8Xb2lp7eGlJWel4l+CrNAk=;
        b=j4wTpnCRW4ZKrUrd/+PnhPm8WC7ffqDMknE36HJBugqpIexTDexQ57nWzFSAPaeCIx
         Iw/zMB+Wf5vBXKjCoA2EsWCBjSfUhefhqNHlNxTvIwR1mH2TD94VKlOvX0UbSo+vD4de
         06BLaZun6aU5DkA7umW/119tQsD2UAgbY5o7Crhy4jPl8oOGrhVD0O/12A2FLcB3o46f
         lTDPGWVowsSLF65UG0ulUB3rfoQUFXBjySGNFLCs9TLcRsddZI9YrpjPBtKGmmjLH5LS
         12fI1DE0FQern9oEEIQEX3rTM17k5ATwT81daYKYHto7JZ5EmVPSUuduuNmKlUX/HDD2
         mLvQ==
X-Gm-Message-State: ALKqPwfegHplBpJpOSro7Fg6ZLO+864y6Q1uOQdiXzaX+kqVrdqDLIM6
	N2ePO2glx/AIuY0j4IFeLlF+KEMT
X-Google-Smtp-Source: AB8JxZqi8l7UJAWxnDH3bhOVJ1N4Ts1RswUYldGmhUdMp+wk+VBn5n1VBEpy7LS+9ehtOCVSN95YuQ==
X-Received: by 2002:a62:105:: with SMTP id 5-v6mr25087863pfb.1.1527011134885;
        Tue, 22 May 2018 10:45:34 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id z15-v6sm25598787pgr.55.2018.05.22.10.45.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 10:45:34 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 15/27] iommu: Add IOMMU index argument to notifier APIs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-16-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <9de4e541-6f68-5e24-273c-d7a61c31c1f8@twiddle.net>
Date: Tue, 22 May 2018 10:45:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: KQckxJ9qhSht

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> Add support for multiple IOMMU indexes to the IOMMU notifier APIs.
> When initializing a notifier with iommu_notifier_init(), the caller
> must pass the IOMMU index that it is interested in. When a change
> happens, the IOMMU implementation must pass
> memory_region_notify_iommu() the IOMMU index that has changed and
> that notifiers must be called for.
> 
> IOMMUs which support only a single index don't need to change.
> Callers which only really support working with IOMMUs with a single
> index can use the result of passing MEMTXATTRS_UNSPECIFIED to
> memory_region_iommu_attrs_to_index().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
