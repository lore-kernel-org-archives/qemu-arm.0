Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2161038njd;
        Mon, 21 Apr 2025 23:43:12 -0700 (PDT)
X-Received: by 2002:a05:6000:188d:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39efba4e3e1mr11567026f8f.15.1745304192360;
        Mon, 21 Apr 2025 23:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304192; cv=none;
        d=google.com; s=arc-20240605;
        b=M3hQ5tHhMTjKX+MP55GUhWZlHQAvPaBGKNlPIO6RHundtg+tJER1cmdPR/KgEptFO6
         dj3tg9/KctbxC3P4CXbyKhRwGP4bsOylowOKmEG5/qrNXWhmc5KtQWArpy6wONeAfx9J
         xJnSAKh03609oexBdnKqt9jocL1+68adQtqtq3TkuPizcPcSvq0PJWBoPVd+yMlzuzuk
         BDkxbC/KQSQv4YenM5dPGn3o+iZ/VERkVikAylleblb7pvcK6kKVGbhgzy3Hf9rrZYWY
         SetngPqSpbUII6/ZMiWGR6DSjHweu+uacNa+3xiFBKh+tsievRfmlNEnZYclmkASslN/
         GnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AX7kKboruwAu8J9cxBWEtuts3z3qq+WSvcjIXuA4QTY=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=EZWb7inlurs3ZP8+WrNvwxoX3gvKEfUOLcHe76tpF4X2MEQFYe/upbhNMRFJNbZA4T
         MnlPj3HxMU4305ngITq7L4dN++GDodFxr+g9q0+mejgLs7RXLFdTdHCw6ONWgae1bYeN
         1VF0V4gfGBSzBUP50frpFFdXnBTrt5j9K15vAkT9OhRiDd2BgPHCqaOJGiZiaj9iniec
         nHctXZl4s1jDDAmGm3pxmNpZW5Yt1tXavzPJzOL1vtfgCRcf3428nYLQy66RN4Bc2hGd
         co3rE3b56SvcmTE6XznmFUaVioVjr9zxrwlk8710eB+xzNG5iiARd8cxR/pSC+1kyxL7
         z4cQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=riZdaaUn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39efa426d41sor2585484f8f.2.2025.04.21.23.43.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=riZdaaUn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304192; x=1745908992; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AX7kKboruwAu8J9cxBWEtuts3z3qq+WSvcjIXuA4QTY=;
        b=riZdaaUnMbrEtCW8NIt7ZyDhu5NdhV06q5RyjkH2o1mgDoRJVtsTbIqF/g8t6WOZF0
         vJaM5okOuR0Tej72ES6o0kuFmFbJaQubWKd787j+rNzTOQoJXrcAWPfXmC2UpjKBD/Qz
         MZMc9ldKQdvGALJ1IfL4m4ZvvIDG6U7gMK6KgO8IPsUo2/NNwm0F9U+veQOB/we3Q2rJ
         zVKgPMWJdIXJ9f6r52NpAXvkCpclLRLBh+lKGLeS/X3SCkVgqEeQOSNQ9xczXfElrniB
         8f24+i01cBRdm/MRj+ashyQ/S/328Z20e1G5sNiIwMdYdC/b1DFJ+tOw7sBgp9YKQXBT
         fseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304192; x=1745908992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AX7kKboruwAu8J9cxBWEtuts3z3qq+WSvcjIXuA4QTY=;
        b=J2m6bLtfh4THq6hsK7Pnq/UNKHexdVVLoGiRVfJDgbP1cs7gi+JnTgEFGJ1cglxlIU
         J/FO3yDXEy1tSIzIlh1BsxK+38ms8ogwZWxHe9sf2x3m1vnOVtNODuZwzltr21UdqD8/
         p69nxKC17gE+mPtOfxd+U4K1hx/IfNPpvwPWqGPxmRniR9RMymJvJl5C3P4kfB6eJAy9
         6qyO8L4OqP8gRvI/MCPNo8ZOXH0zP2DYAD+oZ+y66ZbPup6o9auKxYBjgkn7XYxk7V3c
         LhLkDZw1ozYC5A/ReuGGIDFPa23ziC3txF9rVfwz5VhBlh4EGWg6s8Gy0viN9NMmYU2U
         Iu9A==
X-Gm-Message-State: AOJu0YxKbcKxGQu1V3Lxi6fIW5p9u3g2zfUIDqt+xhNaHmlT9TPhvy0C
	Xnr9wmmX5ZiGAsNVB2+1Y4qwlZALZdH1ruSJao2siCU/h+SMR1HSmc8wnHOSt4VqPQ==
X-Gm-Gg: ASbGncv0YAbCc0XPs+7rD/0dbi34yAXKONXZq7qxNofXz6lHJsIuq4HPHXGjzp0gxih
	ygoyTfrNfV8sXgjC+Np5yvD/vnwUe/XqK6ZhMBNLrOj6ZvsvY5skHhGizZ1I19WGhGwBhmjdGQe
	d6bH0JpF2UPIXD0hGqharqReuwmCVjJC6VOMqNByu7xzOElYjok175EcAGp9OSvMh8Z4jyCMPqF
	JwUv2HU7oOFEN5/qD4y/ArZUGdxUYPwXQh3omsbEj6o7XG/C8vBuZnnp75seJwt3kRsdjlfWhFW
	NqlQ6CzjSqnEUwEWAiEf3/PwkkEwnXSC2cMEmbnevFWW2iHC5q2gK98fkLPM0UWi1c7ZIVWICTj
	PI4A6xmMz
X-Google-Smtp-Source: AGHT+IEepHdK7IYO8HBEjYBhodRfYRb2HZU7yu/DSYXhUmsEh2yoLRvCtz06id9IG8c95DaH3egeUQ==
X-Received: by 2002:a05:6000:40dc:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-39efba383bbmr9963080f8f.8.1745304191777;
        Mon, 21 Apr 2025 23:43:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e38sm164703545e9.2.2025.04.21.23.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:43:11 -0700 (PDT)
Message-ID: <a0579d5c-8a96-42e7-ac4c-37cd65b4148f@linaro.org>
Date: Tue, 22 Apr 2025 08:43:09 +0200
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
Content-Transfer-Encoding: 8bit
X-TUID: dFBZqrmIvzYM

On 22/4/25 07:27, Kohei Tokunaga wrote:
> Although __builtin___clear_cache is used to flush the instruction cache for
> a specified memory region[1], this operation doesn't apply to wasm, as its
> memory isn't executable. Moreover, Emscripten does not support this builtin
> and fails to compile it with the following error.
> 
>> fatal error: error in backend: llvm.clear_cache is not supported on wasm
> 
> To resolve this, this commit removes the call to __builtin___clear_cache for
> Emscripten build.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   include/qemu/cacheflush.h | 7 +++++++
>   util/cacheflush.c         | 4 ++++
>   2 files changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
