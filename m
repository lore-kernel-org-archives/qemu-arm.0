Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp669929njh;
        Sun, 11 Aug 2024 23:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnEkjDSIM/WkQyAqXFlT4x3hvkyTINs5pynPTBJIv0z4FJfNi4bdzmiWtGlS8Wcdt1YsRc
X-Received: by 2002:a05:6902:1b03:b0:e0e:b514:1b12 with SMTP id 3f1490d57ef6-e0eb9a784e1mr9383184276.49.1723443966482;
        Sun, 11 Aug 2024 23:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723443966; cv=none;
        d=google.com; s=arc-20160816;
        b=02eXXWGWCQm66yj12RIS3EJnfad2hNHAr9BrgHjtpLQo1vnrionlOH1xfivbsdVrol
         MSeEUGihPLMxjVKKZY/3UVC/L6Bk2xqnzwR54YKC2eUFU3wz51J7/Rds9shNuq68zsxH
         u3PyKNOCXuP1+OUl/JIwqDTE9Tg3odTMGrPsVxMQ9KsTsDDKpoAZMCdPnAdOThSUwISj
         SSJ2SKZBKPZo44VQRnjgyVYg6KywfO9N3VURERxXViw9ewp2r51V1pCUeZLEghp7Jh1o
         zSCZKIiOsJdac95gSPN+VjWbQoJQ7voA11yJYK6Hnp4At3X0sRUm399TdNs1dGjCHQ9h
         vaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=jHAU9FFiMOqeNWfxhSI6T2JLj4GgxAHny8vmbvedspo=;
        fh=1Am1VE4BPl5TExT3+wqLWYZPKVg1rLZOZELcFdw1Nms=;
        b=ofbpNPAkSzVqZyfujtrDBvlpo7AZrvXtzBDG/4nmMH3ySNXWJ5xuwENJR4r6/DqIgB
         jzOgMLzGqcRhp/KkPr9eRI+2l/Te3chczednM+5TTiPy3TwPvIBh76JMfLCImOURkpoA
         TiSIlxR9u9LHGAHyyIAdzrfM794isEHYn/mP7fxZA99WLPqEe/+/ZBrgnxRb2fZ38HF3
         TeCPhpDmtrxfcpLSLMxg7F1fDE+GJ8wZeOuGxr0Rit+xWsU5BoIX3t4q/FFLFm7+Rz1r
         m7FYrQ6jMaZ6c30cbTThPDP/F1NtRYc+a6pDQCyvQkve9xbYIA97pUdKVc/02w/hs9WI
         bmqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BoG/PQ8h";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7e07099si510995285a.530.2024.08.11.23.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 23:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BoG/PQ8h";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723443966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jHAU9FFiMOqeNWfxhSI6T2JLj4GgxAHny8vmbvedspo=;
	b=BoG/PQ8hRn2s9QiG+PnFWAFBSaMoXpSo0smlNQUM7RjBZrCst2w4UAEuzE1empdWO/9KYX
	J7G/f5wB1dPJbhzsozUPec0sgxV81lf4itnWmX51T4CYm2Q0fxQM+3pACkiGTwcvLikPJO
	QEbqSf3DYWUYcoA01Z5KOdwMBnxHDIY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-YlPXfgIZNrytTnXSN1hBrg-1; Mon, 12 Aug 2024 02:26:04 -0400
X-MC-Unique: YlPXfgIZNrytTnXSN1hBrg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7d2d414949so307596966b.0
        for <alex.bennee@linaro.org>; Sun, 11 Aug 2024 23:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723443963; x=1724048763;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHAU9FFiMOqeNWfxhSI6T2JLj4GgxAHny8vmbvedspo=;
        b=JoWEpZL6dDUqTAo/sfS3WCyZRwA7s5UPYcR6sNtcH/0fEsnjoIBuyX4Z3cTOV3SlWe
         u39xj9DcXqsLAnzrQpX7yVkrIVL3nP4Xe3IeJZk2hbcfBv5C5egv15bHe/CZNnQPFFWl
         U3BvG9To9eUkgRsDPgBbeFiZcmQCYq8UgugqG/QhD/h0jc2BU4cOryxfsEbweLSYsTUR
         FPLVUYjQNArrl7cYN6fS5nw6x4OY/sVkAdnU4tnW2k91UoQ5RoJyAIFlSyajQec/Rxq4
         /WpitnL5EHHhA80o9Uw7g2znkIwj+e44V8hJEeOB0AOE6mTy563yiY2QZ1RKC2JXnd3B
         wfJg==
X-Gm-Message-State: AOJu0YxYmaMWB9FIXSBJK7v1ss7WVEZxy28jfEpR3//7xeG63ENR0wzN
	w+2c0ZKWcu0kMgFvkzixwPWT1Lkr5Wm1T69BsFOi4Lc2LbF6I4ZFKT8GC/FguLibKkzNV3WG5Bv
	3g1ynvWm4YfBECU+cP1iBU07xIaQuv3uy6fSZ9PkectnYuu/FoaB187YJWk1MbKmczPnW+DN7bZ
	ZNn2VxTsEdsk3sOQa0uHrs7nGAxkl50p8UiQ==
X-Received: by 2002:a17:907:2d12:b0:a7a:a33e:47cc with SMTP id a640c23a62f3a-a80aa675c0cmr601631466b.59.1723443962970;
        Sun, 11 Aug 2024 23:26:02 -0700 (PDT)
X-Received: by 2002:a17:907:2d12:b0:a7a:a33e:47cc with SMTP id a640c23a62f3a-a80aa675c0cmr601628066b.59.1723443962468;
        Sun, 11 Aug 2024 23:26:02 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-125.web.vodafone.de. [109.43.178.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb1cdb18sm201429066b.130.2024.08.11.23.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 23:26:02 -0700 (PDT)
Message-ID: <12895a3c-c5b0-49f8-8219-75485d682cee@redhat.com>
Date: Mon, 12 Aug 2024 08:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] tests/avocado: remove tcg_plugins virt_mem_icount
 test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Song Gao <gaosong@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
 <20240729144414.830369-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240729144414.830369-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DGXMv0SAecKS

On 29/07/2024 16.44, Alex Bennée wrote:
> Since 4f8d886085 (tests/plugin/mem: migrate to new per_vcpu API) this
> test was skipping due to not being able to run callback and inline
> memory instrumentation at the same time.
> 
> However b480f7a621 (tests/plugin: add test plugin for inline
> operations) tests for all this matching up so we don't need the
> additional complexity in avocado.
> 
> Remove the test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: 4f8d886085
> ---
>   tests/avocado/tcg_plugins.py | 33 ---------------------------------
>   1 file changed, 33 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
