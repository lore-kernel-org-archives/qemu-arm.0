Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2160355njd;
        Mon, 21 Apr 2025 23:40:59 -0700 (PDT)
X-Received: by 2002:a05:6000:184c:b0:39e:cbd2:986e with SMTP id ffacd0b85a97d-39efba26215mr13992315f8f.5.1745304058874;
        Mon, 21 Apr 2025 23:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304058; cv=none;
        d=google.com; s=arc-20240605;
        b=kP3j49hBGLoQI309Xx6DRBaGAYZ2GHF0B+YVjzP1nQ4sjQTcZV8pQam0KUePL8O5I6
         SvTXzh4KYZVCDecD6NH1u8tH2ELN1RTSbknJVVV6FcEDnEeh7f0cAxNj1S8SNZzsFdZH
         82YQgYMTe+IINXsZQhSxJBLrPG4PG7PR2ecEw5RFUwN2qheCouVr9mhG6DoEmJsMjpPp
         X7XeL1pq7/mh6IpmePUxpeHS7fAvyxpHvg4caLXoiMNkKUgWub5uVQFdsOrmKkd+YUJP
         wcfdABddbFItyzWsa3VSDhE0+pHnZ/wlFIHoiP4WnRn/Eo01+YAqJ5GTi/mVkebO9eEZ
         hYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nKJFeLlUbpZe7YuWGal+rk0qK1HvBE9EVeqOrPjomVI=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=YSNOECwiYP6IJfdCR0b9tgJTaBELuBhbo0M6vh/YDNtyQLOPYWTchtzFmSQGfUEX42
         vl3tlu2AuHpXNs4lw7pPEKBkSdUXX+dqk2isht+aTc+wU9gJNvS2EcLggk8KpkALRrtK
         iiy88Og2SKhaTlkxP0UX2nwTunb+827AmDDtyki14tWW6NFzaGraeQm+4W9S6Ktcarw8
         eM0dZ7cF9tjhpPE/yP3TzmlLfMQ1y3B5ko7U6U7O7LWUrAZ8s7r1jwQwF3RlPYB1LqU7
         ONw7jSaoEEELiGdcBr1l0TlEwTKWmtvHBrTIA73Fcl0kiENBgFmf97SO4j9ltNw59W+m
         7hJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYxrvUos;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-440699e63a6sor24500865e9.8.2025.04.21.23.40.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYxrvUos;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304058; x=1745908858; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKJFeLlUbpZe7YuWGal+rk0qK1HvBE9EVeqOrPjomVI=;
        b=IYxrvUosApQibSn7jEa3wg5eCJW0nS4jnel0A7X+Tpcqlur+xMbOJQ7ne7pMRQIS5N
         74vgrH/fqz1ebqSo2NNLhzCvos0u8TZfXApeo4LMdeEG+jf/aE8vfyPfSe4ovK9+2El2
         6RUngmQkGi87K6Y8Ctg65LJiLifP5h8uElT1Pf7EB0dt5LfuHbb2V8QlvHHzPVD+D6eZ
         DREL+Z6cPiX+b5MZ5s6zmQejT1FORp/o7ScJY73lpH4LAGtLlelydZjjZ/MDu7NSJY+6
         jhw1B2R/Gt+iiV9D5hUGVir59An2JttFbgu48Yd1ZvFnyE+hvvgzdGFl0ujsAS2vpjZP
         BNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304058; x=1745908858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKJFeLlUbpZe7YuWGal+rk0qK1HvBE9EVeqOrPjomVI=;
        b=YHQ7kkoQT78pARHiGKYd0b5CatN9jx97A/gsLKB3lHy18T/i0LEsQC/q0FffEih98W
         d3urR1ltKbgt2hF3rR7pAy1AOmIEk0/O2pr38cz8Y9o3I6VDMfk7H444SoSQxC6BK9Ws
         yVG5wtUxVfU0BzIQs41SwWqzuRNvt3hbGgQ+eQZZWK7W0sfNx1SrC1GZKOTXjfqUten7
         yZgTvrT7FY1TlOTSehFb9nWDRF7/1GyBaysgAot62SgzYgLGerxUpMQrVeiOfask0KXz
         c7l5vKasfNdV6MtLHyDT2hixsV67oA1iR9Na9AdcSEMjKjEoWA6UKwKTxsaCB8JjHoqs
         GEWA==
X-Gm-Message-State: AOJu0Yy4TZ/PfHhmDqXPlBTW18V3a9p6S+w/cndtcNIRzM//Gnn1hVOe
	JiF26M60vMq1ttZumpIdHzBo/aLtrIhSDCGqhQXeSFVyMIlNN5bgH43GYMQNAOmlzw==
X-Gm-Gg: ASbGnctl2PnqgeddXZAd8UvLoMQgWNer5ydD0bBiGEEmTiccWeJB1MZ4JSp+v769rWF
	PL4QMMYmJfcc9AeUIkIHORsZiPPEg5qRvBAFHev9afKYZ+9MgY5r16o9MpgrQ/i8Fe6JzWMol7/
	RTXlcjyxRUhfC7KJe0ziP01JWI83eYGnXPAWoSxtFRFXYxnbN92MzvV8+nYGGe0PnwK4c+jiW8r
	MoXFIkN1JWMFekHo5A0GjwMNXxcRWqLC+o2z2B6NpBEhNQu1yKkY2+3+NQZH5KIHTG3zXArWrbC
	lgLyy0ikVLX3XDiJJiYkTEn3bwieVfuq6bT4lBl20P+a/NCKRmpzGU8cJhP4UfLLQQ7biTdciJR
	dDdCmOZCb
X-Google-Smtp-Source: AGHT+IHcsH8adNlZwrRlN7mr+Ppudxls9pRBnErGa7/Mp6qPgu/+F0y8fjs6Hnt0hcPXdfZIWPFqYA==
X-Received: by 2002:a05:600c:3acf:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4406ac2040dmr126725005e9.30.1745304058402;
        Mon, 21 Apr 2025 23:40:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm159563065e9.14.2025.04.21.23.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:40:57 -0700 (PDT)
Message-ID: <370fdc99-1b95-41a3-bc41-3956f5b3040b@linaro.org>
Date: Tue, 22 Apr 2025 08:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] contrib/plugins: Fix type conflict of GLib
 function pointers
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
 <0fcddfca16ca8da2bdaa7b2c114476f5b73d032b.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0fcddfca16ca8da2bdaa7b2c114476f5b73d032b.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MYjCDeaN+/Ec

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
>   contrib/plugins/cache.c     | 12 ++++++------
>   contrib/plugins/cflow.c     | 10 +++++-----
>   contrib/plugins/hotblocks.c |  4 ++--
>   contrib/plugins/hotpages.c  |  4 ++--
>   contrib/plugins/howvec.c    |  4 ++--
>   contrib/plugins/hwprofile.c |  8 ++++----
>   tests/tcg/plugins/mem.c     |  4 ++--
>   tests/tcg/plugins/syscall.c |  4 ++--
>   8 files changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
