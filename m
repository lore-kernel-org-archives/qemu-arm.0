Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2163901njd;
        Mon, 21 Apr 2025 23:52:25 -0700 (PDT)
X-Received: by 2002:a5d:584e:0:b0:39c:3122:ad55 with SMTP id ffacd0b85a97d-39efba5275dmr10828732f8f.18.1745304745607;
        Mon, 21 Apr 2025 23:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304745; cv=none;
        d=google.com; s=arc-20240605;
        b=hmtWPNT3k+umIGpDIjWiqPr2XupkGwU8K2gWaSck2p+l9rzHIxNK2nBGGcrGwSWGaD
         Ex7XtzJi2oT8ZF+lTgwtJuNVPn9MVPTwj3DJQDPtxNMQFeuksOfTPQak3aXFBKpm9cUA
         NEFcp8FalWvKDhesxy1+ngi/mSW/vUpGG9GR8URySMfJ7eJzIOe3KitDe9bd85t0e8OA
         DQn/AOYRg7XXzSNdmQeDzHZyNam4GczSMgUOcR+FL6H/PBV2hzmYXrCuFWhpSBoUktCu
         Wp2A08/hX6IFko4QCXfwIS0i3I1m42YdofdOAM/el64Vhkrwaeb12V+Ktk4I3A4afIw6
         tI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SjiQWxPOlSNVbGc7W9J3JEzK5NR3eJEU8fykCh1e2f4=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=L4AzNUpnpZb+GQcCQdqztniSav45D/sI63OVDBCd7ntbp6OD7PEbo2Hdjldb8MFSop
         COqiuA9Ra+ofE1ztkf5FzOhCziVpzhcpGxHdq7FxLwX+g8oezMZjJatGaDg0JkhMNaEh
         pP5mUPMMNnrndJ43ca/uyeT8Et6M9pvc2DOwgtyzgP1vPPVgHU7EROSScvwJ2MZMtjgt
         BSvkZfw3le4/Jl3d73pJIDcKJrxPRCFZCchKzv9eGCepzlCwyxQRVGvodDMysfBpblST
         n/KcmODYB2MUpxyOOEvGDshX5+eTRN3Cw4wEWCd6tmhMUw2gkh/nY+nrQ5x2MtQlxjSM
         7LjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpRdW1hr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-440699cbe0esor27497645e9.6.2025.04.21.23.52.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:52:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpRdW1hr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304745; x=1745909545; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjiQWxPOlSNVbGc7W9J3JEzK5NR3eJEU8fykCh1e2f4=;
        b=zpRdW1hr8BU1TyX++Oc3Eu3N8HLK7r9Wq1rmhF9pKgOHFdmXBqX5lZ934vMLwfTsQ5
         S4v7wKsFIQt8mOFOsz5rC0RJ46MSwPrGX8woQwKtiiz3iKITEMfBTItH2cpLHNR/5+sr
         wJ3BEx6gNqpTYpctn250e9W5WGO4f753QyIij0fUPQaSTg21v06AbABwK2hAPU30XpHF
         alli+JxE1JsPmYaXNeUYpEG2Y++4OJ0zrgJl0zRWpNnbVXx/V0s1SqWrQpLxqSKZ0ZKO
         F/CjWW6e5wG5qXNyUptEvksncF/ntxdtqcBG/h/mij3gnzAEvXflrL8Q7ftokF6OzP7M
         eWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304745; x=1745909545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjiQWxPOlSNVbGc7W9J3JEzK5NR3eJEU8fykCh1e2f4=;
        b=TEx5DTKWy1OykJQkdAt30DcNvOS73PexLLxnf6xOVK4ljjD5YDFJpkmGzENIuirBMV
         eAxSG94K9WB66pxaaND5x3KJsdgEez9eSpqnioqqERQlN9vQJv3arKRDkaCNsGLPxQ8r
         vvXkz2HHTaFrIDLbsjSa8eirTsKWPSfzZFd/ho++aNJ5F0KDL+dp3eHDVwIFhXJOVLsO
         wiNVUaKLB8zKMaPkyQk9fBj2npFkWbHnKM/zVhFDbBE5xwgpW5cIbbqZ9z9stlF9QMYz
         xBQsbWQfC2kpHnoxRdSGa62ZqVh7OQlZVEjdqTqz8iGEff5aHEcR3bNOTEVDFdjBCw6G
         qQ4g==
X-Gm-Message-State: AOJu0Yx+5zgOLZddTfGLtuO8/1S0/mjzpdsB8l5fDW2F/Q5yDjrzYJx3
	uioKNLyHadOt5Te8wasFs+CBO0wq1+uNW5MlblFTrr4PE5kMY5yZnKGrAIcFOtxCeA==
X-Gm-Gg: ASbGncvrzAxrgEe4DeG9Edy4JAvmSBs2KKLIx5wvc29plwZdaxxdTxp0ybzoVfvdy17
	sVY6lSajcWABsNRiLRyXK4UQsORFoLatmdg5Xzs4tODjz+5ZVzepQzUr3Muva8yaRECI0e1UcSB
	Li6y6xorYM0vIfwdvqjeqQ7aSphqsnHm9pejEt1TZpDhN52zxzWXYi+x/sQ2mW03YzqdSUiMtLF
	fWg+VSUUEF1r4YOAfBvcDLVhKs0Zd+diVzKjqh1SOygamP+XfRr011620H+4K55Gv6jT5z7xl8y
	NQjBGtaY5Mw4jDRgZHTBRh3qKDvzxzgDxiT/7HOgj+m1B22nabsgQ0US/6Bvm7YsF61HW55QdI3
	CQRCI7BkO
X-Google-Smtp-Source: AGHT+IHt3h54M4vtwl7DRF5h65UdgoH4/u8sgi1vZYRuQtRMbNcoheUDjjhNNRdhtzIUU+XdW7CFxA==
X-Received: by 2002:a05:600c:1d95:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-4406ac270f7mr123517835e9.27.1745304745084;
        Mon, 21 Apr 2025 23:52:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm5702765e9.2.2025.04.21.23.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:52:24 -0700 (PDT)
Message-ID: <47fd711e-7d73-45e8-9956-e0f91d513f0a@linaro.org>
Date: Tue, 22 Apr 2025 08:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/20] block: Add including of ioctl header for
 Emscripten build
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
 <1821e79d3977c3645aa79128b823748aa9a63800.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1821e79d3977c3645aa79128b823748aa9a63800.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6KBgZ19xhH/Z

On 22/4/25 07:27, Kohei Tokunaga wrote:
> Including <sys/ioctl.h> is still required on Emscripten, just like on other
> platforms, to make the ioctl function available.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   block/file-posix.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
