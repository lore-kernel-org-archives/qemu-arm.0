Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1013837njg;
        Wed, 26 Feb 2025 08:17:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEfk8nAPZfGMQ9fyhZpDByAZ61WDzHG/mwcLH6aOX+2iT93tRzMuhFHcatD2y5Dr5d0mv3
X-Received: by 2002:a05:620a:44ca:b0:7c0:b0d4:e12f with SMTP id af79cd13be357-7c0cf95484bmr2814020885a.41.1740586664615;
        Wed, 26 Feb 2025 08:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740586664; cv=none;
        d=google.com; s=arc-20240605;
        b=UKJoUgBcaFk+lb4WL3CgitavpP/KdrGIh2CFKmkb05rKIAIJgIZjYVvYyARdpznItT
         PbFW3kxa4gRxthbSnHvG18BVZ4PYDNej7PFjy9DUCOhm8w6v9rZ+lQM/E6OVrQN+mIdz
         si6qAcT+gkdAiCwB3mK9q0Rh8IHxGQ/+GWaVljZR9f0QTndMJlO4Tkqefnl4VtPmFGAc
         1tGGvKEsE9fxC0VZK4kqBfp3seJ+L9THH5s5mfSixFGjdCmfEvVjhtn+RmKy+BF5m+6I
         WexBHx4/0mx+7c1w7+TB0g69pz11nFhvopEzTgqmGCYdbY1TSre91PyJeJF7E6fLjegC
         KjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=rfC2A6kasbTFFVmo6oaGbjK3+zjtJv/rd2YzI/ABI5c=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=KasfVwaTEFEbktSLh6E61eyHu9mm0TrKUzTMhm9xpvxX8grMREAzxbLMV1CZdYolVz
         FATgRFbPVNNiNfCYMURPmYaklAIcUXxtG8kGo9LaAiyOleAMWaqE+ICp9FarRHMqpfcR
         57fMfx/DfQIINwf3N74LQv68UfOP0ZFHvWNE8ePdAnvMznBvKp6seSvEZP6qox1cJCWi
         1Hg8y/gP7m1zbO2xNc2J3+/9Dk/k2EubMIAsSLebql+XRhA1jDLgW1tY7yhQworOCXhx
         Q1NIKYSayCPUQrGJ9IMielhCLxzEhxXWdJ103nSqkch/8XWPUa+BJs96VMQsD4dbe/uQ
         sSJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GMuaPLn/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2d9677si379466785a.446.2025.02.26.08.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:17:44 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GMuaPLn/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740586664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rfC2A6kasbTFFVmo6oaGbjK3+zjtJv/rd2YzI/ABI5c=;
	b=GMuaPLn/1NpTB8LbtabjTm299+llBoXPW+RBwiwHc7tqtox25dPVKG/aISCeohMH/3KHZp
	5Jp0v8Az+QtP3zi/DPbLX59+O5mmymWB/SANlEQ+NMgxeUiaVFr92NtSp2vllggqtjSWsI
	yrXKtvxyXSGTW9QCXKpFfDm/zOEiS6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-YCYHOJZ1PnqjF-yk37aXoA-1; Wed, 26 Feb 2025 11:17:42 -0500
X-MC-Unique: YCYHOJZ1PnqjF-yk37aXoA-1
X-Mimecast-MFC-AGG-ID: YCYHOJZ1PnqjF-yk37aXoA_1740586662
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4398ed35b10so35569145e9.1
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 08:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586661; x=1741191461;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfC2A6kasbTFFVmo6oaGbjK3+zjtJv/rd2YzI/ABI5c=;
        b=HHFYfGIBegw6oI4WddIBnB8hprYgh+ONEnRgKbZmvph7yC8WYsVwIR/1cYq3ryo44D
         9EjUCaT2Rx1nfrtmtcvmOg3QsxOZt5F4QPKOQ/SKrmjfi1VKhXLK5REPDK+lQeIo3F2s
         nySUV3zsMmkLT+AEPR18HuH94fYepwekxtWqwBwRt10w33lbQubLLhiAtQ4G/X3YBMgo
         28RSuiG+WcDSo6ASaHGk3Wf5vZUoebip7sbyjmh1AtZGkzfEaJBzf0qbRHXk1Wis4ZGJ
         Pcpoi8Zwa4zuthj1lP+nwSRLhu1pRG6V4FUsdAbrSq2ZULJCyVrUOeb6T8e7RcIcVUj8
         348A==
X-Gm-Message-State: AOJu0YwSjxALUqDl0bUCK6lFM7LYMFUV6X/2A3KcugnyhTp4RYItFORN
	3SlBA8RRka8BcVCj9DN8qNA5Ek+w6JzLYMTKH/A0mgovR6+sDLnBNZIgjM59rRTiRvCCsMNWpZg
	poIgLCxM9SOpvjeFJKv2tJLmyujSy9A4wliVa/d8hIe1RdEx4i/eTN1wQWPjER9uDl+dhxU33rm
	4+H3soU1WbXMa/o650rEdXxxyBYvb4ek4agA==
X-Gm-Gg: ASbGncvfynW0s9RyzqQ3BDNmkISaXcuvHhqL6rjVu9xHlE4LAu7V6q83U35/5DKlAO3
	GpX3IVaZywzLMQvPU9XYKuW3177kghPqsQYBkhQxQOd+vz3MFGcL8176iEIEtOePRsJ2UyXK0jr
	ffrmnMIs3fNdWjs4A3f6Lu8RvUQEtswONcBAla4bQEgJDON8vkkffp0YRLylDQiygQiVN4QMWrR
	m6iR52FiDyipTzU2QX8MBGVaPj+ddUl+H0q2DmVdaHHKbQij+DhP9qtr19Rx0+ZrPPBcN49CBL0
	6saQ+TedLp47YqbttAMXlbPc8gWrSofxSkIBM5DjKLJL2pU=
X-Received: by 2002:a05:600c:3c95:b0:439:a88f:8523 with SMTP id 5b1f17b1804b1-439aebc2d5fmr151331435e9.21.1740586661700;
        Wed, 26 Feb 2025 08:17:41 -0800 (PST)
X-Received: by 2002:a05:600c:3c95:b0:439:a88f:8523 with SMTP id 5b1f17b1804b1-439aebc2d5fmr151331065e9.21.1740586661261;
        Wed, 26 Feb 2025 08:17:41 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532bb1sm26546405e9.9.2025.02.26.08.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:17:40 -0800 (PST)
Message-ID: <9a730bdf-9d91-4839-8e45-06b9648baa25@redhat.com>
Date: Wed, 26 Feb 2025 17:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] tests/tcg: add message to _Static_assert in
 test-avx
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250226140343.3907080-13-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g56NeLQvpkAa7b2QiLfMoiMCrRFOTO_WtZ_6H_VgYxg_1740586662
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Fqzf3dOSBBEL

On 26/02/2025 15.03, Alex Bennée wrote:
> In preparation for enabling clang and avoiding:
> 
>    error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
> 
> lets just add the message.

let's ?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/i386/test-avx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/i386/test-avx.c b/tests/tcg/i386/test-avx.c
> index 230e6d84b8..43df2226b9 100644
> --- a/tests/tcg/i386/test-avx.c
> +++ b/tests/tcg/i386/test-avx.c
> @@ -244,7 +244,7 @@ v4di indexd = {0x00000002ffffffcdull, 0xfffffff500000010ull,
>                  0x0000003afffffff0ull, 0x000000000000000eull};
>   
>   v4di gather_mem[0x20];
> -_Static_assert(sizeof(gather_mem) == 1024);
> +_Static_assert(sizeof(gather_mem) == 1024, "gather_mem not defined size");

s/defined/expected/ ?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>
