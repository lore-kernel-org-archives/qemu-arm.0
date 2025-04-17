Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp648332njk;
        Thu, 17 Apr 2025 02:50:26 -0700 (PDT)
X-Received: by 2002:a05:600c:5494:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-4405d6ae57fmr39852325e9.25.1744883426063;
        Thu, 17 Apr 2025 02:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744883426; cv=none;
        d=google.com; s=arc-20240605;
        b=j6LtmhT64b0FyAjqYoJLMhiclbe0NY7UKFthZXMXMeaANVEEvJyZeZWgCBCuaXKSEJ
         kPoAgS1aL1+wyGYdGGqVcaKruTNw35Wad+d/r6WBC37bLciODBw3jgNpTwaoW+ok7qMR
         UgRSXYOPRdEfv+MsYlnIzbfoJC2KHlhF8ZAA8h9opc0emd9h4hK8hxqN6r28+QVbQqEm
         rTPsgEjdb103DuJUy7Kp5EDLauS8gF8FRJnUFRfS2n9RFvmnNlTTSnH0P/0VXMmYT6ah
         3TdlAT2zyKzSjAH0R3tSFsssNmeU2ljrktcZEbqzQFXclc85P8Hk3qih/EVZuVyfPefI
         6jLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5BxTtwAQkIA/7hmrydh5BciZVxfSCSymTFm+usKP8Dk=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=Og6PAPorn+2uuupjZWmN9Ea3IkzDvW3IPOMBNsueg3UOShIq6id45qWwt245bfVPZI
         m19irPIwwaLZw0lfjHJMBgfdXheZ3xb/TPvEEx70cr3v0l75v1SIe9hq1nIYLtb6sLGg
         W/a52u/9oXqLTwNwa7SN2Q0C5dSTNN+iyYTMcop0IVDbvFYhFz4m94/c10JJ+m5POH3t
         VQ0/4BnhbVi50AtF8aUurx0pKbQcYiON7rlz0UVpGMNgHWAr5L+FfbSDaMRcNdshAjIe
         fnMWndP0lq/trrvunuIFme4pBhU/i5sgKl5Fo69nbiU0hvZKiOvgUhhWef8OgAEUsFnx
         XbXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hGKqdkok;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f2339af99sor74309075e9.2.2025.04.17.02.50.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Apr 2025 02:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hGKqdkok;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744883425; x=1745488225; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BxTtwAQkIA/7hmrydh5BciZVxfSCSymTFm+usKP8Dk=;
        b=hGKqdkokxG5sEH+ZxEMscq51b2BoQN0Kb7NWQB3hVMkNKTXQglw9CzBoGz4wxlVa6I
         VSU5CA11SjnS/9nCZZgYutB7ZGYhS/V1FGaCja8s6UnctRx3NH4nQZVIMRUW2G5O73j2
         Mcq/5w+j/naBy5h9sfKZFmmQYihhe4Fe+593bY7889fMb1oUxhCljzspBsGvmZCHQ30y
         7EDOEGP16N9t4r6W0EFVKL0q78R1ocxLIwqW1q2VbpT+rTzZa53iHnMynrSXct94Mugz
         T/8QVoX92Ah4SnFBcEAEc3GA2cUsuXWYemsFmxBR4EbALDXsCSUkXpUVDMDve87sJDBM
         FH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883425; x=1745488225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5BxTtwAQkIA/7hmrydh5BciZVxfSCSymTFm+usKP8Dk=;
        b=vw046AmoKmXr3dra6AUFBfckngVaspi+7Y9cgjpg8EfGW2CNTx0QuQOq6uYTxYHbeW
         aLHQTE1h8ssQum7t4KpY6SRcIsYWHqE1o0Pl4ir+1gRmmwgZQZJk64mkIUsGaRyl4WYe
         TAmBRS/02blz7ToUi99HUUDB9Gj66jPTo2tRpHjpjJ2rmyfUccVty9ZIiGns1Ojfg2A5
         uD+caX+F3TpfmOQARDgoq+erZo0a3vSjaGPfWYO86OChmdwYfRETQqFB8Unr19+J5FJE
         UA6/gryxXY6RqgsaU6aDdyogdYKLJynGURTINSIdMrWPSIMPPQe2tN5JYvWPXGqAtUmz
         1tfw==
X-Gm-Message-State: AOJu0YxRxazQGIws/paPPMYAxejB3IyzdAC/bvn7W5VRMq3/X/raRpUn
	/6pky24PDB1vLuiZICWnY6E/FRp1bE52H/7C7WCZLPhhjDgQp4Ltg0o0NRbv70CU3Q==
X-Gm-Gg: ASbGncsjLy7I+iFpxK013L9E0yOdeeUoS6+vHb1wfTOa/XmItiLKDwI4CiyCTeQIPq+
	a4TMP2BJ3TGpcAxv8b8mCiLDEeOvBDy4rPuNqXEFWJurFCafk9uGWKJbWuoypojcXdabggbsnux
	w5M1SOvQo4knnRDiVxmn7yXsHcjynEh7+8leZrzRodhPPKBIjPiGq/dM4OFBkSQrsjABDIoqK2E
	ARONG+oDnY1fHLinV7MsJ7qFAU36MJvmnueio6Okl2EjtmQMXHwHpvD/9CG9i5P2igwo3oUWMC2
	FmTKfkcSo8aFjq/PdLgko9Y9IlmEXM2VJsyXg2WV22SMJWUZdys8+MD+uuDGdxbmPjeStuyWWZC
	CcvOhRx05X+j+3WU6hpk=
X-Google-Smtp-Source: AGHT+IFcQflbDZ12X4g9KWaMhIedgJHwJNO6CgZ3fYxf3VIS21k+SopVHxHUIJawnYDlLSKN75t0zg==
X-Received: by 2002:a05:600c:45c9:b0:43d:16a0:d82c with SMTP id 5b1f17b1804b1-4405d5fce94mr50473445e9.2.1744883425515;
        Thu, 17 Apr 2025 02:50:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f39b1sm47042825e9.22.2025.04.17.02.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:50:24 -0700 (PDT)
Message-ID: <c2bcfa70-1b6f-4182-ac3d-dd4493232a16@linaro.org>
Date: Thu, 17 Apr 2025 11:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] util/cacheflush.c: Update cache flushing mechanism
 for Emscripten
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
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <97a2164b3f428265136bb1c01615a16b516138c2.1744787186.git.ktokunaga.mail@gmail.com>
 <29330430-61a8-42c8-a87c-259f0cdbefe0@linaro.org>
 <CAEDrbUYu-NH4Dwkby-UTtQpiy0ApN+Z4dwt+iOs_SZjCwfM_ZA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAEDrbUYu-NH4Dwkby-UTtQpiy0ApN+Z4dwt+iOs_SZjCwfM_ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: P6SU+5SJ4FZm

On 17/4/25 11:27, Kohei Tokunaga wrote:
> Hi Philippe,
> 
>  > The "why?" isn't clearly described.
> 

I'm happy with the following ...

> Although __builtin___clear_cache is used to flush the instruction cache for
> a specified memory region[1], this operation doesn't apply to wasm, as its
> memory isn't executable. Moreover, Emscripten does not support this builtin
> and fails to compile it with the following error.
> 
>  > fatal error: error in backend: llvm.clear_cache is not supported on wasm
> 
> To resolve this, I've removed the call to __builtin___clear_cache.

... used as commit description,

> 
> I'll update this patch to include an explicit "#elif" branch with an
> explanation, like the following:
> 
> +#elif defined(EMSCRIPTEN)
> +
> +/* Wasm does not have an executable memory region. */
> +

and this comment in the code. Thanks!

> 
> Please let me know if I'm missing something or if there is a preferred way
> to handle this case.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other- 
> Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache 
> <https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other- 
> Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache>
> 
