Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3205195njc;
        Wed, 16 Apr 2025 02:18:54 -0700 (PDT)
X-Received: by 2002:a05:6402:280a:b0:5ed:1841:18c5 with SMTP id 4fb4d7f45d1cf-5f4b76e74c6mr1052041a12.30.1744795134059;
        Wed, 16 Apr 2025 02:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744795134; cv=none;
        d=google.com; s=arc-20240605;
        b=ZwF5Wk8Kfc+Qnd25213e8QY252RqmuwYwTgjFhQO3wY5omAl3WBpvu+HlPCooh15pV
         NJv5Otuc5OvJiuQr3ViNB3uV/VHIJJ4QABFt6Mh6qtHEvAkMn55vqbl2kJJfOZj0i17h
         /YKogvqeRmun7QrKcL2YI/2OxtFf9C4hdTQJ+UJys1lN2lJPdu7PjKhmdWSThJNo8B1b
         K4VHRRdnejC8+Czh6w2umkkytgzhm3xY1FxqdXPdwFxHJhdT5Iuij70OdP6SnhILFmMs
         EwICTU/IgyvOK3mQP06Wc+Xf1TCQHEfbzSIaO+bZ0PeDDCZ2WKfCnP+2W/gY8/XELYb3
         xFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=opxX0AnLU8z4IF4WKw6Y3YI4gcZ8WAb/hd2WUxU844M=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=hvcjzr3Utpo2TXvbALYNHDdeXmkEfVQd6yLf/KTI0NuwSGgOk3+TXKc43HV0ihXPUx
         l8ePjFADf9fLOyc0PQYEeXpQRfK92/sfm96/E7arUrlDbJj6pMUf9fHKKQfSuOO5Eo2I
         2wxCT4PFcmBe9neB5siRz0CYCzOxO7HW5+gmpaREzivAkHia4OzuKymg5Mj56nfZS+KV
         vkMXEPZ/995sC/0C/CUteS2dTOc2deQR9Gd+N5qbt8czskuBfUKh4ohD1NzZ3ZBpGK/I
         foFa11acWLulGvXRkxfokaCsGY1H/v7s9AhDMgTcxKbQo24CRg9sANOp8voYBFKOwGp1
         gtIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pzRaD7dC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5f2fbb8d1dfsor5688291a12.2.2025.04.16.02.18.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pzRaD7dC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744795133; x=1745399933; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opxX0AnLU8z4IF4WKw6Y3YI4gcZ8WAb/hd2WUxU844M=;
        b=pzRaD7dCx2uPfJKDcyI3UiFXNwHVU9PLOfvj/fT/2nfIm1fnFdUDAycdV4NdlkZ1t+
         GOh+i0Os4DGwepZF/cH4U2HGxW+W/EdPSqNGHH/RNbCvmtFmj6U7TmfZUyCTuFlXuETg
         QmMOahWO0zpdfcj7C0D9nOMKtp+HN96GNevzUolpOJHndOht5RYa6+p6ID4LsvmQu+vO
         m5f1qDMKkNuQIwHLZim5HtMc1vHMrj2/aC8JD3gfpZSSmifqEG/mER4cR9c2EUdPTnwi
         zChfOWSJhJWEdA0c0WfchQNKV5lE2cqQyw6cDL5Q8u+kXm/EqxOUR2W8eMIgIVfudrla
         nCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795133; x=1745399933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opxX0AnLU8z4IF4WKw6Y3YI4gcZ8WAb/hd2WUxU844M=;
        b=AJghKF8IJoNz/u2FyJ0vN9F0rHucbl80KumVSF6DYLf18QvAHwQSeY+vt4j8GA4mPK
         a9t9sCSJRyx6beepMSyW5SD2oJbdGcP6xZVcgR7VoQgwroUrST49zkdT4VLyDpvs1zpe
         Dodk6s/oiHizcAHFIAZXqCB1magvFqSos4vYno+uBDdtfInPIOGzhw3gJrXs7Pd3mvEL
         dCMYsJNvzy1HuU4yahcl9DSXj5tjVUiovJ+DOna5WkNI9cyFBaveg7dyExFIR9M8Uynb
         vV3gexykZceoF4chsztEmrybTS+zPMpNrdCRI/ZYEYqs03BF9eZ8LYv+bs50/q35zB1U
         vO/w==
X-Gm-Message-State: AOJu0Yy1C2c3uCXZcR9ot7Z8O81te37ZMsFKqAEQRUK4dFHDcxQFh27B
	I/A1v8O2mk5s4fzqEb3u1/R4KcVTeQMc5c0G6S1B6gpQRM/TwjqAP0flze9fmL7ZEA==
X-Gm-Gg: ASbGnctKmF/GiKm2UaQo/N2TIjcHZVqBN9Onx9e4LGzzc6SmCpEQ5TAEotpetT1D8PP
	HAXOgjWRHpYeWCe/rRCQM3CG3GKmJuYIe8wVOeJsDmPi2u71E+FlgP0reIKQL+dRzYkISjhJlG0
	rLZdoM0x2YZ1Aae1eeDDpmVuBYh8GU47ZYf4GWcVkpfu+GCP0c+DReIz8J/WwqiH8pIwsS2swvr
	R5jpTUdziOEqG9qM5nmpk9poQ4loVlj4YsQA/5TEfQXNC8eK8rDoL50teq8ghOqbPFvK9xKNmvl
	5wvr8awW1/VqTEBTub9Rj4tDt6wD9NG42sDJj25b1+DTT/VwekkFcQZ5/sUzl7rotfQKsJKDMcd
	JTiOGp+dr6yfUig==
X-Google-Smtp-Source: AGHT+IGr1/MfO5wsf3tA/3dnOJoLlld+cE6SoujA4jBiRHSd8qF8sSM327OsefaPiZzkZU94UvLfag==
X-Received: by 2002:a05:6402:1e91:b0:5ec:9352:7b20 with SMTP id 4fb4d7f45d1cf-5f4b6dfb88dmr896220a12.0.1744795133486;
        Wed, 16 Apr 2025 02:18:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f50569fsm8393804a12.52.2025.04.16.02.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:18:52 -0700 (PDT)
Message-ID: <a92737eb-786d-4ebc-87df-a5518417195c@linaro.org>
Date: Wed, 16 Apr 2025 11:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/19] util/mmap-alloc: Add qemu_ram_mmap implementation
 for emscripten
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
 <7ef485c860a0c26d2ddcf6a96430f5443deb5aee.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7ef485c860a0c26d2ddcf6a96430f5443deb5aee.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: iAGEhpnfHOY6

On 16/4/25 10:14, Kohei Tokunaga wrote:
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   util/mmap-alloc.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index ed14f9c64d..91f33682e8 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -145,6 +145,7 @@ static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
>       return false;
>   }
>   
> +#ifndef EMSCRIPTEN
>   /*
>    * Reserve a new memory region of the requested size to be used for mapping
>    * from the given fd (if any).
> @@ -176,6 +177,7 @@ static void *mmap_reserve(size_t size, int fd)
>   
>       return mmap(0, size, PROT_NONE, flags, fd, 0);
>   }
> +#endif
>   
>   /*
>    * Activate memory in a reserved region from the given fd (if any), to make
> @@ -244,6 +246,21 @@ static inline size_t mmap_guard_pagesize(int fd)
>   #endif
>   }
>   
> +#ifdef EMSCRIPTEN
> +void *qemu_ram_mmap(int fd,
> +                    size_t size,
> +                    size_t align,
> +                    uint32_t qemu_map_flags,
> +                    off_t map_offset)
> +{
> +    /*
> +     * emscripten doesn't support non-zero first argument for mmap so
> +     * mmap a larger region without the hint and return an aligned pointer.
> +     */
> +    void *ptr = mmap_activate(0, size + align, fd, qemu_map_flags, map_offset);
> +    return (void *)QEMU_ALIGN_UP((uintptr_t)ptr, align);
> +}
> +#else
>   void *qemu_ram_mmap(int fd,
>                       size_t size,
>                       size_t align,
> @@ -293,6 +310,7 @@ void *qemu_ram_mmap(int fd,
>   
>       return ptr;
>   }
> +#endif /* EMSCRIPTEN */
>   
>   void qemu_ram_munmap(int fd, void *ptr, size_t size)
>   {

Can we keep this code generic? I.e. with something in the lines
of (only build-tested):

-- >8 --
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index ed14f9c64de..0e52cce5b29 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -238,3 +238,10 @@ static inline size_t mmap_guard_pagesize(int fd)
  {
-#if defined(__powerpc64__) && defined(__linux__)
+#if defined(EMSCRIPTEN)
+    /*
+     * emscripten doesn't support non-zero first argument for mmap so we
+     * don't use any guard, returning 0 to mmap a larger region without the
+     * hint and return an aligned pointer in qemu_ram_mmap().
+     */
+    return 0;
+#elif defined(__powerpc64__) && defined(__linux__)
      /* Mappings in the same segment must share the same page size */
@@ -246,2 +253,3 @@ static inline size_t mmap_guard_pagesize(int fd)

+
  void *qemu_ram_mmap(int fd,
@@ -253,4 +261,8 @@ void *qemu_ram_mmap(int fd,
      const size_t guard_pagesize = mmap_guard_pagesize(fd);
-    size_t offset, total;
-    void *ptr, *guardptr;
+    size_t offset = 0, total;
+    void *ptr, *guardptr = NULL;
+
+    assert(is_power_of_2(align));
+    /* Always align to host page size */
+    assert(align >= guard_pagesize);

@@ -262,13 +274,11 @@ void *qemu_ram_mmap(int fd,

-    guardptr = mmap_reserve(total, fd);
-    if (guardptr == MAP_FAILED) {
-        return MAP_FAILED;
+    if (guard_pagesize) {
+        guardptr = mmap_reserve(total, fd);
+        if (guardptr == MAP_FAILED) {
+            return MAP_FAILED;
+        }
+
+        offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - 
(uintptr_t)guardptr;
      }

-    assert(is_power_of_2(align));
-    /* Always align to host page size */
-    assert(align >= guard_pagesize);
-
-    offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - 
(uintptr_t)guardptr;
-
      ptr = mmap_activate(guardptr + offset, size, fd, qemu_map_flags,
---
