Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2310177njc;
        Mon, 4 Nov 2024 10:15:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3gIEm/FfyhAcRqhOFMAblRRmKrUoHwDlOnfzfUhzYxe36EIZfi0CBz/nM8W+x58kLagP5e85rEiMYlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE744cIeI2I8WqfkqB1FAPhSaEW8ITaCFZIhtLRUF7QSDurlFomm2BoR/Ww5InQWzcXWkP0
X-Received: by 2002:a05:6122:3196:b0:50c:4efb:835a with SMTP id 71dfb90a1353d-51014ff7a57mr28330771e0c.1.1730744135748;
        Mon, 04 Nov 2024 10:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730744135; cv=none;
        d=google.com; s=arc-20240605;
        b=HN6pT4rQ3bY1S/LNBGDjlq8c/e4FXzu73nC96F7ASYi0ZQii/kElFxf0uszSlQwVSY
         zEPGckhZVAuexajQjFELGdMA+ojwddYYh3JYunwKa4Wwgd7EyhuIsW7ROrL40AhMXal2
         ecYvRt+atc4cWUQhE6/XfDLaYZ6Oh26H1ptxGnFv4pkklW3t1IyLVSA1KA0F9R7Wzmfx
         Eb+Q9A7dAY0awqxdly/f+02MxrUoat5rgLN3hl0O5Oo4Lh+3qlmfUJiaqyZLQCbaMSGj
         RxjvvHRWN3rsgWDwlPfNhXtymmCNxHAIqKWrmdsOVS66hEc+d9cnLsAtEA08l8Pld3Li
         LNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=lBmPx7J81kPDhku9+xjmgrgbxAjE1ApCT3Q/Pe7qD4o=;
        fh=8+2ypMcWrMpfPX/vHq8Yie3C2ZU4nU7q2JVjNdtOw1Q=;
        b=NOpDh6//1zYgothRAjsRIcBs2hrbGFwWLTnlUZd/rVR22Gh2/i4Z/Kyt6c470blimQ
         /vsSgnzZ6VsazVsHePFa2LemxFMZl8N+1KrDUe3KXjh/SR5s5ZiN7AZ0S2PnX//cjMnJ
         UD8IhOmjl5PJqoSxFEY7J1ErW8w/vHzw/hhfXx1kh3O1/pDi6R1QWBMJ7nkZKqsFZkuB
         pXNfX2vJfMfGYJbjprgZLlmS2eibW4UdeYN9FtFfPfYkVKBYOJ1p4iX2BZCHTcVVVuMe
         d+NgPvyHdy2SpGBTVk526bGTmcws6szSpFbkJf6ASwtTV0CpkxDq2Wf/mQO7Iti/TGmO
         yuUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V0Q7b4He;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5106f283b8dsi2644762e0c.16.2024.11.04.10.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:15:35 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V0Q7b4He;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730744135;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBmPx7J81kPDhku9+xjmgrgbxAjE1ApCT3Q/Pe7qD4o=;
	b=V0Q7b4HeHI1zWgIvSPlqfjtl4VVdV+ej5Zos2UM//I+aN3uFyzK1W5nLJwJoWzcKU/gWxY
	2Of6HUNbzZbgsqZsXGPqYlvRHpRc1gyPg39qy1mzTLdev13hSQuIlLZy7bqAlQQpU33HMm
	Nx6sX/jl0dX4EHyukoypW5b0znmryCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-fyxA0OyYMSOqsT2E4EW6bQ-1; Mon, 04 Nov 2024 13:15:34 -0500
X-MC-Unique: fyxA0OyYMSOqsT2E4EW6bQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d49887a2cso2405441f8f.0
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 10:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730744133; x=1731348933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBmPx7J81kPDhku9+xjmgrgbxAjE1ApCT3Q/Pe7qD4o=;
        b=FS2kQ09h+DJClkb4zqHuLiUcBCHwLyqnmXMShT1BC+4llUadK5BL/H8SETG+AF0jy/
         EF7sNIG8dA7kCP/b57Kd06TIptngU6uK8qLdNCJOAdLwOf1cIuWw0LWjZ2fg9+ubjp16
         9BSfuI/KmyHXJsoyyJcLFTqwY8XZexDga7yEdsF9fk/8KMnHn929tU0nVYh5CNBmuWfn
         xDtv0NG4zkK5fTZ0zsUz2OA+DeteFHSa5y/jF9c1NPq2GLY64R4OTIBu1GbOGQ8WagLA
         TjAHrX1OvjwEXMuiFkMZ2BuA5oPuXMTqai6vpMgptzQdpuibZdLMmnPqgiPJztMLd60w
         dT4g==
X-Forwarded-Encrypted: i=1; AJvYcCXRHDryYCevnlroWNPKj8p2OnF0nqTvoht9h3UytygNtNhbRbv6mxfF1hQ2B5Hud455ImE4eXeovGf//g==@linaro.org
X-Gm-Message-State: AOJu0Yx1IyOmTX/Y3oYS862qcIIglW7/OmlmdAktADkAq8qPCqOb0Y+2
	97TyAk9t2c4nGoTsMW3qC0bIh2Ki/svtoNGXgrF+sQSOjOoKXkNApWJJD7Y6kTCmNsnJLno3kty
	twW1EL9EuC6qmnMbLG7YR3Gchaud7+i425QIwIZCitqAvQtqxY3ADDA==
X-Received: by 2002:a5d:47ac:0:b0:37c:fdc8:77ab with SMTP id ffacd0b85a97d-381c7973202mr11463754f8f.7.1730744132999;
        Mon, 04 Nov 2024 10:15:32 -0800 (PST)
X-Received: by 2002:a5d:47ac:0:b0:37c:fdc8:77ab with SMTP id ffacd0b85a97d-381c7973202mr11463740f8f.7.1730744132625;
        Mon, 04 Nov 2024 10:15:32 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432a153125asm1938525e9.2.2024.11.04.10.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 10:15:31 -0800 (PST)
Message-ID: <d275b86b-75d0-40a4-90b6-b519748ccc5f@redhat.com>
Date: Mon, 4 Nov 2024 19:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_CU9eeQByANMRW@linux.dev>
 <6c05fc4e-ce14-4000-bb2a-63496bce9e98@redhat.com>
 <CAFEAcA_XhkBrco=V3Ky+cgvyp3cwqHXjDkmm+dP7N2B2av03bA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_XhkBrco=V3Ky+cgvyp3cwqHXjDkmm+dP7N2B2av03bA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: JlIKP8g9aftT

Hi Peter,

On 11/4/24 18:16, Peter Maydell wrote:
> On Mon, 4 Nov 2024 at 17:09, Eric Auger <eric.auger@redhat.com> wrote:
>> Was just wondering if all the writable ID reg fields were associated to
>> an official FEAT_ listed in this feature list.
>> Let's take for instance CTR_EL0.DIC. Is it associated to a given
>> extension or is it just implementation defined?
> CTR_EL0.DIC is IMPDEF choice of 0 or 1. There's no associated
> FEAT_* -- as an implementation, you are effectively just
> reporting here what your implementation's properties are.
>
> (CTR_EL0 is not an ID register in the architectural sense.)

thank you for the confirmation. So this means we also need to be able to
tune such bit although it does not have any fellow FEAT_*.

Eric
>
> thanks
> -- PMM
>
