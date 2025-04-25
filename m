Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4425817njd;
        Fri, 25 Apr 2025 07:51:51 -0700 (PDT)
X-Received: by 2002:a05:600c:1988:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-440a65dc984mr29586355e9.10.1745592711221;
        Fri, 25 Apr 2025 07:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745592711; cv=none;
        d=google.com; s=arc-20240605;
        b=Cwsnm067f3737awEJsP4/bH7YIbc4EIl4/pxdcjKM9ic383U4bksLH2EVlFCek/Xlh
         OsM28rxKweWVihUEAxOENddjzjOKjtyXyhIfvzBM1l918FTlgXWUQVrlbiZKhYvR9hjm
         bECALNmaklJhSvBuyTzKvDbauDi37eh3/tKW0AyhfkQXt3miR3p59sgAHhr8FaEyLPOp
         hJuiJw/7JABeFs3gIipjYGBbkLigzs4Sm+LE4IfXaAhFVXQ2nJc8SVoVCxPeDL2jRslu
         K1k0lYHCyZqZk9CocTy6NzIJlTC6VO3h8xs2wqM743bVu0wwQcfwfRzhY1wXnWPAMMfE
         fbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CGE6UG+OVqd3GaSBfL9qpLMTvgMRYgEqf87pGEIjybA=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=FfJYrt0rYaJZ+9bcqKs7pQoZLQm0LJvXfRIgSyVSbFcWuP0BS1KRnCKWnvYk4ponN5
         fE+aCWWJmuvy/7q9UdXj6n/tJXxGPxKAPIPZe0+aPRYgV/sdAOG1n7OONAP9RSphz6SJ
         KYZ2SzzfK5Qkr/8sDSJS0MicjVkatoyLEuAZqmCo/k8il8AP1duSqrgai/1FMJ35lArk
         z/Txbh0KMs8E3l6+vGGE6Hr2a8GoQfBa0LqkZANTnW+Um8XWojYbXiI8kINXyGbGPFQk
         0xdkwdeDys1rRIDCJTb4phNR0T7hBpg+ZASsszSD/zYtJU5c/qtUH8frXmnfFaJmsajC
         ueeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oPJHQjGS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4409c310e88sor14487785e9.9.2025.04.25.07.51.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Apr 2025 07:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oPJHQjGS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745592711; x=1746197511; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGE6UG+OVqd3GaSBfL9qpLMTvgMRYgEqf87pGEIjybA=;
        b=oPJHQjGSpmvshiua8LbwSSal70zXIiIgAcIkx5SKCpOE1EhjdARxX2F9MDVwP070Qz
         XeVMfnklHtuBGodxNrdE07KsCY3Smr/7ABrKjwtOP65w1rSfGlCfi+ZNYBMpuFnJbMgK
         og+pBjyFfmI4mJToa0v9ScbErLORhZZjebXi69dGyOHJc/sS2ur1tQuuDXsluDd0aStY
         Vzcre9IvWsDCfSrZr/Q8iZhKJ/F1SgOhBoYoxXR9MqT/bFVxE9NzgqgLGbNgHNnmBt6R
         lD9XeYTdI86XWgqBKNsvKZCdRgJyh+c12EFWOozHcpTIpkt2c5Y+yH2p5YtHCodiIgz5
         uAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592711; x=1746197511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGE6UG+OVqd3GaSBfL9qpLMTvgMRYgEqf87pGEIjybA=;
        b=EddHf5IEjzWjTRHRf61BeYUBpxNTL021PQUn9NhdjrzW5tGO/Uc073VZfreLa8rqO6
         n1ckJBwrQLLn1+pzt9v0rz+gNlcjB8s3EDHKLYLUPOwb1G8oxbK2F/3rH0RAhEaxv/Xt
         3jX/NC77OSFzTD3zEP8edi3Z16OSgxJw0FzlffmY3P4lKOjA7lGMP6c/d1XUKcfYaZMr
         kD1ZBbfLO2mc38wmw1I2lAGDM7kMdWZ/BRaLAtvZNGvHHam6ettJZvIzhHRCIMRkOvpQ
         n1Lw/X9v5zRW87rbh4BYfL6CzS7BwPR562kkqql2N46yWOjIGFhL8b3g+mZ6auhcGP7p
         Vitg==
X-Gm-Message-State: AOJu0YxP6rHmkwPOpQBTogH8spI8R6CpRTEtOfbrWiTkl3l5GoNRN5vN
	X2PgUbr31D2fQPwdudhyBUj73M/1R5A3Bmtqh36tfChWBAFHPJIb5YafdWFa843zgw==
X-Gm-Gg: ASbGncvVNoOwOkxb/90a65Pqd+cqTsOHaCMHrxi3glSnzqH+qqMBx+Ar4iPuNFQaZ5R
	AfspFP5Vb3uvPmnAuhme2B6vSA5d4IXH+fgOIEY5ByjEd+x0WDzfvrZnZEIMTIOW8PVapac39il
	JB2ORpvTAXgTx12EaC5dj5B3OubNCxP14e57Aa1tH5JZpVRnUumuc0WA4ieS5vx+VJ3KBuahduq
	4ejtVVeZuICmSG3uWmhZzaRf1dUlLX3qiw+7jNv/4FIMhRfswFJBxjEQj5DZYuo2ThMfcOLqysU
	a55d/Sss8iZ/lzP83o93QTx2KctZw9JCGWqEv98Qf5vN9NvA0Gx2lERlBe+xtD0BlcW5YuDGCle
	3EtkiW8X0
X-Google-Smtp-Source: AGHT+IFSc1UFfFshkZOlDunJCHlH6dSK2nCeOkmDpatGTQV6+ofkvOfND9JWvvMrYs6wH8CXB5J4Dg==
X-Received: by 2002:a05:6000:2283:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-3a074f3a0a3mr2286228f8f.46.1745592710663;
        Fri, 25 Apr 2025 07:51:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ccf44csm2624994f8f.60.2025.04.25.07.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:51:50 -0700 (PDT)
Message-ID: <c22b4b2c-aac4-4e67-a026-1739ff10addd@linaro.org>
Date: Fri, 25 Apr 2025 16:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/20] hw/net/can: Fix type conflict of GLib function
 pointers
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <4d47a75c5768c9a6dc5d8b3504e78837577ad70d.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4d47a75c5768c9a6dc5d8b3504e78837577ad70d.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Hoc2f46qJtwo

On 22/4/25 07:27, Kohei Tokunaga wrote:
> On Emscripten, function pointer casts can result in runtime failures due to
> strict function signature checks. This affects the use of g_list_sort and
> g_slist_sort, which internally perform function pointer casts that are not
> supported by Emscripten. To avoid these issues, g_list_sort_with_data and
> g_slist_sort_with_data should be used instead, as they do not rely on
> function pointer casting.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   hw/net/can/xlnx-versal-canfd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
