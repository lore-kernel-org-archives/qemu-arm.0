Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2162670njd;
        Mon, 21 Apr 2025 23:48:37 -0700 (PDT)
X-Received: by 2002:a05:600c:1e8f:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-4406ab9426cmr159395495e9.10.1745304517564;
        Mon, 21 Apr 2025 23:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304517; cv=none;
        d=google.com; s=arc-20240605;
        b=DLhu21laZckYjoWefn9WCW88FQgZ1VixwJrbCJrA8tM+6yPDCSBa/SA4Dj5TJBBUL3
         KiUeyVQ1JZzSaKTlw8KjQCEvkicgiz6Q8fN7Z2z/IasgK8h9rYqejtPuDF3G9CyhSuEd
         svdVTD5jpE9fP7qAyiONEQqBglpLjQfY8lltqYfTIcw2Eq3FxlTjlwCjQPQ0Yp5VMVoD
         +29QKrW5tBPhQS2eTdrSolDdPucOGsWdEGeZHHmOYc2tsTNGGiNFvvtKE/qTIE+9JvW2
         3yJ/6qYke2MBe5E5tcAlYMZ293BrDBumcG8HKWx+YhzyATScXTRyF56qL/wz6NWdOI0K
         n2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DnXZYZpCsMlxjMJ0yI/E0kE04njeYYS2BakI6UaObjE=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=BlWReXN6lV1gGMYNEgRrJ/bkfA+pBzu4knrerqdhz+OViTUc3BGyCfn6pUDSoJDclf
         FqsMBLrz9OB62bsu+zSKytECehk/rhravoa5TC3tpB4a/7lmppf0QPl0xiSVkYfkI0Eq
         WEcyc7+yp+/TQ2snxnDPS32ErUUPY4WqIUwUY95If0LAbpKb9rs3Ii5JTxASGmrXKKza
         4z70OJj6SzUo2I/+u9MXjFHlOetLeyq3tmMdTN1P//6cpQ7/SgbySokvq1NgcL1maktJ
         r+6uCMEddt0scSx8GX3wlynM2/S2zDkG0oGIZhe8TCQvIl93KIpMRz1rm7fevGthRnoM
         bj8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5DEkk1Q;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39efa423b19sor2064029f8f.1.2025.04.21.23.48.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5DEkk1Q;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304517; x=1745909317; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnXZYZpCsMlxjMJ0yI/E0kE04njeYYS2BakI6UaObjE=;
        b=M5DEkk1QueXXku5Pb/rtyVspe1jdRm/YP0yWlhBWtZzfd92qQGZrdK050zsPbfaVBt
         PJe7P0ci54+Gl3yyQJmrhh00Pz+VKfuzgbE8cJQfzDIXJTbGrGDmD1Hy1TF72hs6x5Pq
         7Tea3QzT5t1+wmaRVp69ErLrW9HTnLHkMcmSu3AzHAtUotDq84xZIK+TF95TtMsZmKkS
         T3xGKx1MtpahG8NjVrmkWKA2qGunGOVXgdHHIkPlX8bPM2Lcts74XGMrfxQoaKkuw1wN
         KtzgE2kCmPQnZbRL7SRvGrjRZKZTIpP1Z+UqMZXSrsgsOoT/+QWM7iMzrDzXESh7G+fV
         GQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304517; x=1745909317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnXZYZpCsMlxjMJ0yI/E0kE04njeYYS2BakI6UaObjE=;
        b=X2L9qS8t/7/u2ZhT01jJX3WV6xTvccP28xJ5DCU0wSD2Y61d6Fjim30CzyUtr+MUQJ
         r9gDJe/U5n23yv4DeaqXDUD8u9Ax3QkOvPIIKlOYu8bealKiogm9CuGTPOitEuN6Icn3
         G/S1xWGvPA+CMwy4L55kSVZc/F8dlHOEemdFI9pQSXtu6K9/BgkjaJzGinmxKSzA4UxP
         fwbaGAPWV50hZsfHu+Q5hfxzwXRulmup0EJub4nHdGup48SlmijrjmfMhjgPoiOd2YbI
         K1yaStPT9JGVEFyY43irTxqtHL99nYv5IveIsXYqqXNFLVafx1Uzr5mzhtd+kLD4cVVV
         o7jA==
X-Gm-Message-State: AOJu0YwTww2yylIrgsaexxRwFvB0v9z5cfSReKka7wR/+y1kcObb3nQd
	9aHLiAtwa9M32YgonPab/TYSBMg8QSuheJ7Ws8+g1emWERAswvD/bYwSLRyXD0q6+g==
X-Gm-Gg: ASbGnctr5H54yJBTCuDpfJ1iRxQvs+xrFfVE3/SjusfgSn2FOhSMjD7df8bHlQzWS6+
	A8NLelY/XmnIaU7KhZc3aPC1OCZ+BueLY5Faa2+p+GHYNTOiv3TYjqe1qFJofUwUcYqILhYDIcR
	NPE0aVIVWLFM0sELjj8OUhagx83uAlix1wt1inRkfgBBQATWaZGr5rQuZxvBq9o+UFyQQZvnujH
	XoVbVtEmREF7WwwkCzTmW476V1biibYm+6ITuFPy6EwdyFwOKstU5LFJfAeotjjSC74XZHzIWVi
	bA04Iphgna35oTzTZGYSI2zThMZLPosLS4ViAKCuF1HcJ0XXUapDC0fg4FVTc3jkHTcCCjy/mfo
	buy3x5836
X-Google-Smtp-Source: AGHT+IHMpt6hktBQcp63unlBelOTUarNTXCE5b0mE/3wPmn6HjNsKZhrJ6P4Ob4YbC3B5cCFDHXW/w==
X-Received: by 2002:a05:6000:2913:b0:39e:f641:c43 with SMTP id ffacd0b85a97d-39efbaf689bmr10720478f8f.53.1745304516970;
        Mon, 21 Apr 2025 23:48:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa420683sm14169010f8f.20.2025.04.21.23.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:48:36 -0700 (PDT)
Message-ID: <e163300b-307f-46d9-9bf3-10f17c998e78@linaro.org>
Date: Tue, 22 Apr 2025 08:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] util/cacheflush.c: Update cache flushing
 mechanism for Emscripten
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
 <73301cc216217d5c3e0d7acdd32482e36f4f045c.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <73301cc216217d5c3e0d7acdd32482e36f4f045c.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OCWUUj0Myk2K

On 22/4/25 07:27, Kohei Tokunaga wrote:
> Although __builtin___clear_cache is used to flush the instruction cache for
> a specified memory region[1], this operation doesn't apply to wasm, as its
> memory isn't executable. Moreover, Emscripten does not support this builtin
> and fails to compile it with the following error.
> 
>> fatal error: error in backend: llvm.clear_cache is not supported on wasm

Note, you mix LLVM error ...

> 
> To resolve this, this commit removes the call to __builtin___clear_cache for
> Emscripten build.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache

... with this GCC documentation:

   If the target does not require instruction cache flushes,
   __builtin___clear_cache has no effect.

I'd expect __builtin___clear_cache() to be OK, having no effect on a GCC
WASM implementation.

> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/qemu/cacheflush.h | 7 +++++++
>   util/cacheflush.c         | 4 ++++
>   2 files changed, 11 insertions(+)
