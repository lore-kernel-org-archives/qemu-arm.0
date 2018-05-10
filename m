Received: by 10.28.4.212 with SMTP id 203csp1092419wme;
        Thu, 10 May 2018 07:34:09 -0700 (PDT)
X-Received: by 2002:a17:902:8a:: with SMTP id a10-v6mr1615024pla.89.1525962849632;
        Thu, 10 May 2018 07:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525962849; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTFdquJiZdjviF197kb6NHz/x2NNs3WXZl1dIhUUHP3H2KLgw2OHJx5wNPxZCgUTUC
         N5fX5utgnRXxU+33R2va/ejrhfNuJNXlMY+Pj0DwNXzrAELzAlIdxymRduOexY4uocsj
         nO9LoQw0eWhx6QrV6D70FO9H9nwnaKc2vK/WxVnNal3gZCSxJUdDgv6HMkjmsne2mVMt
         fzs6DBATRNtQNzhPMQYtTQTohsxrwMB3HWioloHJ7xZEhl2jp2dDuSTc8XFucBwNnVhI
         SIjt4+5UlRJVBSquvoO4E4uKs7Cv0nYkY/7Y77MGUqOC4LDSg7pTRCcpnGUs8z5zdlBA
         QtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=67nz+XfQJ4HzQUEZ+786JGp31+aELnEdVi8Vtk+Wzf4=;
        b=lzSJbSeVWZx/e+c9NwZc4L35R7/+P3g5InZml1/4p6k0SyIXNKKMaTppjmpEzp9/18
         kFoicv28unwvIXuBqqLn6whib5wFh/DM8V1AyVLadNDV6cTTzxvtDUf2JwbcBbHUgvFx
         2/KdyQu8qyyqP0xj5QDDpd3/84lhUluW4V5q102t8tVAjC9PE2pk5UMbbs2tn5RuaRV+
         2Gneq5fNqHr3FuXkyACQGG8jSjqWe3be8hg3kpLQgBwC+L25FtqYVxVQgBFJx2FjUsqX
         h15ZnK02Elc2KyA7pdFMU79/yKqz2S//Ah8pOj5oQOmKK7ENEUUeh2DnMyGTi4e6Q4fl
         ocKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DVRXcPe6;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n4-v6sor340467plk.27.2018.05.10.07.34.09
        (Google Transport Security);
        Thu, 10 May 2018 07:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DVRXcPe6;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=67nz+XfQJ4HzQUEZ+786JGp31+aELnEdVi8Vtk+Wzf4=;
        b=DVRXcPe60FH8w+omUc4X6/9qKhTJsqIyGTMmrX4lTUm1u7gF7EHcDclbXW8MgHimnf
         c11SB54Iyvef/C1gQq9q2ci6i+iUxqwFBY7H36BUpbPQ2tPNaO/OrioRw36XDEYkUdiI
         J9ZfqwIeHFh6jiYANHiQfOzH25FXuga3G1HQ+OnxI2HB7OfHzniJZnVcIp/2i8yd7UG6
         gDHNK/KI7xNpkxKPwsWkkTfDesK2ozglQ2PhFBjBo8wjoJo3ihKRsoPNy28ELfk8DmzK
         fPaHlho/dQex5ifGF53w4Nr2Od5COw4hZtvy8upevm0VVCOUx2+IvktkhpxbjolG1atf
         XTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=67nz+XfQJ4HzQUEZ+786JGp31+aELnEdVi8Vtk+Wzf4=;
        b=q63bFnN6ALQ9iwZTFG05DpjAimoCjEZlI829WVc1oqk3lvVo/2KyHLB+Dqo7oSgNcO
         11JoEgKG+AzI5zcl5s7jZtVBLSi8IICjYBGZcMDSlozffdahuk9LXKW27mI1/WqURFLm
         gp+EoC8H0VU91mrYjMFv438wnWKMNz2bC8xlcax4hcaH2EyV1Z49zGxLWdSE/ZNBsrUA
         8hHNqTjWsd4qGmuDYnt/W8Foiu7BInUwDgytb5oU3Ncn6Aw3HvtxKE8rimZi63hpu3x3
         +ZLLAPMoWu/XRDe7iiYoDn1WGNoeOXc6JOqDf1XJtwk7Bh5XfY8gmXdle0HFlAPXd0il
         Z7gw==
X-Gm-Message-State: ALKqPwfnZdinyC+1EK3CoY6sQ1AmEv1RNNn4g7cGMFKpGEsO+qF2baQr
	SAarl2JNSKtb/k36/b6kU9EwAJyO
X-Google-Smtp-Source: AB8JxZp0yA0EiJtShX8vTExMIIdy6nQcIsX+aIIW2I+eKCyWRoYds0/DDGYKEBfraF17Z9AbvRc9Dw==
X-Received: by 2002:a17:902:bb84:: with SMTP id m4-v6mr1610005pls.339.1525962848734;
        Thu, 10 May 2018 07:34:08 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.googlemail.com with ESMTPSA id b5-v6sm2201471pgc.16.2018.05.10.07.34.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 May 2018 07:34:08 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] fix fp16 tininess
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180510140934.22855-1-peter.maydell@linaro.org>
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
Message-ID: <7a4a1ad9-0e47-5c2c-6f93-4e13066ecfac@twiddle.net>
Date: Thu, 10 May 2018 07:34:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180510140934.22855-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: jNEwfSCqUNp3

On 05/10/2018 07:09 AM, Peter Maydell wrote:
> In commit d81ce0ef2c4f105 we added an extra float_status field
> fp_status_fp16 for Arm, but forgot to initialize it correctly
> by setting it to float_tininess_before_rounding. This currently
> will only cause problems for the new V8_FP16 feature, since the
> float-to-float conversion code doesn't use it yet. The effect
> would be that we failed to set the Underflow IEEE exception flag
> in all the cases where we should.
> 
> Add the missing initialization.
> 
> Fixes: d81ce0ef2c4f105
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
