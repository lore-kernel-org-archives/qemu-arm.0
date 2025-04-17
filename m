Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp650053njk;
        Thu, 17 Apr 2025 02:55:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4690:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-4405d6e078bmr52886705e9.31.1744883721381;
        Thu, 17 Apr 2025 02:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744883721; cv=none;
        d=google.com; s=arc-20240605;
        b=Ot1t1vtjDjiox8/0OS09qS3p83oEc8r93Slg+3jNMSWmaGezwiPeFMS9G2w6HBbU7S
         fjnB0+uwj7SYdACHfHBjZzB/+/+1eub11qzAfmgVmXjh2nJRAIHSn4ntHU7Zye0lsmps
         MENIEVL75iK/Ho7Kl85gh5XinoQD7gW5ZlqGAUWfgSLiJMJvQCHVvBZHVURovf/cN0gY
         ZHSoYbpIS+9BEKs7dudHy/JbFUX1SrE7919b4vtZRzdJdvxM5dTJj/FlDL/V8pHosXcV
         Umm8rd/VRd3AfBnXA/m8HQz0NA5REnDsBO3KcIvptSwjr+Mdk8tsJsPLDWmuQ9uRTLdZ
         KxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ESxmPEsDrgjCRYYmui/83TcI+NXdgh7xp9aoly0xOU0=;
        fh=K8o4Ox7Br8ki5o+gVPFXJhTrN2WllZLEVjJqTkXP1W8=;
        b=diUvEvrRy0HVhyvYFbAijJTQqV8H614tj2ySJ606kgBkBXlHx+Y6Akc/WcA7/FX6rZ
         2XBLCToho4aJsSq+Jqbij9UF/6uNKY1A22vI8JB8s3wyGOiYVJJHqaZAT6lrNKSRCrY9
         pTN4Jj1F5H51dg9/kjYC/m5xOetNVlYsZ7I/9l1gUDk1sWxzAK74tGgpQXRie9CWkrfH
         YcFeFnrMQ3bJxycD0Kyvd2lY5NypEpoQUlL+lzzXaZoc1oXU+BrjJS1dXif3KOxi7RdM
         iBSnLvmLknv11jaV0i8a7xNNV5eIUld2nUA+6karv7Z/OgZeD48Qe5IKgHGpOTVQAXXM
         IxvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOCYnAn5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f2339ac80sor66891115e9.1.2025.04.17.02.55.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Apr 2025 02:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOCYnAn5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744883721; x=1745488521; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ESxmPEsDrgjCRYYmui/83TcI+NXdgh7xp9aoly0xOU0=;
        b=VOCYnAn5FPptK5pEOh+DsTNV+MK/lRR0B3ZLqMaZcyqemp2FRl1V75x+wuWc4RtqXZ
         l8Im7SsUEyjTWP0n8GcnbLunjFHQDPv3k+FLACSBRbKyIj5N6Ju6rGCNJsl7Wql5+em8
         2UQL2cISCZZHont7lSjeRcFD2F8peYl7ucVJaIKPw2jKZCqim2vIa/5ZPgB6BlXwtk7m
         rZEW9AJOcSZPKz3Q7sa7P2VIwyqIBxSJWrIZPRFKi5tsVa9ABDn19zppIRvYHkxDHkxZ
         GFjBTiDHJIeCFXfC0vyMI1uUIsnYLJffY8ksCI1VdGif4kR6+NMBIhQehyHsYxYYOZg5
         NiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883721; x=1745488521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESxmPEsDrgjCRYYmui/83TcI+NXdgh7xp9aoly0xOU0=;
        b=R4r04vPgV81/HnNhJ5fHKV9uM00IMWqPosMMaoHUEquRmSgSOCRZ+QVPx4Xn16xRgn
         HlLDrpzj8fq5vo4hD7Otejl/y0sLfQkqmphKoxUZeQ2xj2kZ8XDyqFXKyMlwrq01XR/5
         3iOJpKTGNAtNNg00pkeYZ/sP9nttOoEd+TnOszdXdF1ueDv+B0akD1GJAZS9epULST49
         K0f4wMD6oZs2LO59C7ZLgHD+oq4II6p7pH6LVKYHP83wxNuWGrbFHL61WEnMbTcCMQ2a
         pdF69/UnhbKeRXRglQcjmb15h5YEBBnyQ/x8Hfmaz2J5GVsqFMpbbmxxz6GqEPDOBV22
         E5JQ==
X-Gm-Message-State: AOJu0YwK7UtrBOGONrkgpcC8tRzEeZlrgYmI062Mgesx7mrhME2ZcWCi
	KPI4aGQB6/5FBOmVSADQO20gF5nX6SBwHJSyg63GxCpbEoMpjyztxvulA65vOPQN0cn3826RmXa
	2lWI=
X-Gm-Gg: ASbGncsIGKdhls3I2EcK8UmGYN4YLOSFydndNZYn9nElHz7XmJDNKaW702PXl/gEtgY
	butsOuMUqk7abv0vui6JnZRPUfPTYjboKRHw+q2xPsuP22cIAhLD+yFI2ax6MKcO0MxsIpdC38Z
	JmkiASI0xp1eh8GdoM/BRE5Vq+uZQLtwbcsOAyajW24QXCZcnFcHS6QpfVcd2k5fpmgYGPUoryo
	vIsncpdowPFvEzfpcwFOKRWG8cjT0zrMlRnp7CcmykYfOwURZ7Lu54dKBOrx+ukqT2tlvn7HjRO
	l9NJd9XsHni6Hhdazy1S7+TNH/Wj91iZi3SSD4rQZNI3wGNdW83he8Dl5M9Z3cehmtVumP+eQp+
	5XP9vkyoO
X-Google-Smtp-Source: AGHT+IHUr52I6Hsu8tzshHOgbhzDkiHTPYbRD/a44+LftBX99Q9Ir//2EM1w9KGuA1rTB9OD9MQhsQ==
X-Received: by 2002:a05:600c:a09:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-4405d6decb3mr40538105e9.29.1744883720794;
        Thu, 17 Apr 2025 02:55:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c184sm19871210f8f.30.2025.04.17.02.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:55:20 -0700 (PDT)
Message-ID: <e7f66ec8-ee38-453d-a6de-4ed8d5a54268@linaro.org>
Date: Thu, 17 Apr 2025 11:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] block: Update block to compile with Emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
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
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <9da41d784991f77e2c1f38d0781cd047b593e053.1744787186.git.ktokunaga.mail@gmail.com>
 <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org>
 <2d232dbc-4613-4352-8ede-3fd5dcefc32c@linaro.org>
 <CAEDrbUbQ2h1wj-KJqjYjcGPb4Pyp0te8ycy2DoJGENvT2+Mxcg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAEDrbUbQ2h1wj-KJqjYjcGPb4Pyp0te8ycy2DoJGENvT2+Mxcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fFsn2irwKSCv

On 17/4/25 11:32, Kohei Tokunaga wrote:
> 
> Hi Philippe and Richard, thank you for the feedback.
> 
>  > Actually what about checking the symbol presence in meson?
>  > Something like (untested):
>  >
>  > -- >8 --
>  > diff --git a/meson.build b/meson.build
>  > index b18c46d16a2..33185fdf315 100644
>  > --- a/meson.build
>  > +++ b/meson.build
>  > @@ -2654,3 +2654,2 @@ config_host_data.set('CONFIG_TIMERFD',
>  > cc.has_function('timerfd_create'))
>  >   config_host_data.set('CONFIG_GETLOADAVG', 
> cc.has_function('getloadavg'))
>  > -config_host_data.set('HAVE_COPY_FILE_RANGE',
>  > cc.has_function('copy_file_range'))
>  >   config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
>  > @@ -2756,2 +2755,6 @@ config_host_data.set('HAVE_UTMPX',
>  >
>  > +config_host_data.set('HAVE_COPY_FILE_RANGE', cc.links(gnu_source_prefix
>  > + '''
>  > +  #include <unistd.h>
>  > +  int main(void) { return copy_file_range(-1, NULL, -1, NULL, 0, 
> 0); }'''))
>  >   config_host_data.set('CONFIG_EVENTFD', cc.links('''
>  > ---
> 
> Emscripten doesn't provide copy_file_range implementation but it declares
> this function in its headers. Meson correctly detects the missing
> implementation and unsets HAVE_COPY_FILE_RANGE. However, the stub defined in
> file-posix.c causes a type conflict with the declaration from Emscripten
> during compilation:
> 
>  > ../qemu/block/file-posix.c:2019:14: error: static declaration of 
> 'copy_file_range' follows non-static declaration
>  >  2019 | static off_t copy_file_range(int in_fd, off_t *in_off, int 
> out_fd,
>  >       |              ^
>  > /emsdk/upstream/emscripten/cache/sysroot/include/unistd.h:207:9: 
> note: previous declaration is here
>  >   207 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, 
> unsigned);
>  >       |         ^
>  > 1 error generated.
> 
> If introducing a new stub isn't preferable, we could update the existing
> stub in file-posix.c to match the declaration used by Emscripten. The
> manpage[1] also aligns with this signature.

You are correct we should use ssize_t instead of off_t.

If meson fails to link, it won't define HAVE_COPY_FILE_RANGE, so you
shouldn't get "static declaration of 'copy_file_range' follows 
non-static declaration" right?

> 
> [1] https://man7.org/linux/man-pages/man2/copy_file_range.2.html 
> <https://man7.org/linux/man-pages/man2/copy_file_range.2.html>
> 
