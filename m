Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp115142njd;
        Fri, 18 Apr 2025 02:51:56 -0700 (PDT)
X-Received: by 2002:a05:600c:1383:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-4406ab78e24mr15019655e9.5.1744969915995;
        Fri, 18 Apr 2025 02:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744969915; cv=none;
        d=google.com; s=arc-20240605;
        b=Je0jXGeWi2Qfxcx9Zb8shcWwS780jspRdi9Y3tpjpTJKxQzuM+W+3Avspbl10pxgyy
         LgTTdHQSNH2i7nLtKMY5HBx4KA0XSb2DjFaCRNhPelp5JkU1qr2HXx6Sv5QpsemT9+5j
         dhEbRZXQ7hGBoVbWgSRtiYtAMM3KKCO6aiBQRe3CpDMCJuNZY3gcT1IHiRR4YsWj5MDS
         rktmULSLdXSXkqgG8D++Agmx0kasesWSqUxbxcC5qkLiAMQfL4qIzdA0hNodKo4kK9jf
         7lCk3LuKw07b/uBHIelrvq4z3CxAneosx760HHYHLFsFjT+pN7JGXQBYVFoDqQvz7nr+
         ttCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sRW2Z+u8s5/P5dIlcyOgmjGfvowI9yQ/5JBUpt8OXGQ=;
        fh=K8o4Ox7Br8ki5o+gVPFXJhTrN2WllZLEVjJqTkXP1W8=;
        b=jNfJkUarpMQX42YTyBt0noSqmafbYi3TTfwdKbJ+N1KtwBJ42sQZsuC9d9iUnUcES/
         aYRwVnf3K+tF+JakQ9A36tudvjMG/HKE/57VM4+4Csb0bPpY08aqbCGkDmHEUsAXdwu2
         hkiKxFLMyudfXjB5vXg/y6E6+wOj0pGmHHMw3lnmqf4XSbcOagY/VEJi0PK+ARwpkdSo
         3d1Bl10eaCvVN8ttQwDvAu/SrPSJQPmY7AvUn7UhYRJfYSOxK01pgsiYbKB2aMGxiJ94
         6Zcf85RsWHjpRKaYST27tf7Wr6O/ZnL6zmPlne8SeZi8fcY1F8EbPB6xXYah/6Ty42Un
         6BYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uCv/DGJ4";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-44069957a48sor6496655e9.5.2025.04.18.02.51.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Apr 2025 02:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uCv/DGJ4";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744969915; x=1745574715; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRW2Z+u8s5/P5dIlcyOgmjGfvowI9yQ/5JBUpt8OXGQ=;
        b=uCv/DGJ490Xinhw4V6SpX3BhgDEnHHwhn6c7bXbMkhb8uqAccg2UGZCGOPLTE0GdTc
         kCh85v1wgxC5RLva+qLGwBAmnl9WXXLHMvAZ9n5khH9bCqU5rDRWQI/2+AYgLX7uXAsU
         Mq3nkxbVZoTDJwbZxZ4SSwqy+pMWRTFYhou3iEWgIiH3AjQwliBQvka/k5JmssAqztC+
         riJ+bvRm5zNSoXXy6gb8vT8mVzUdy1gufk7BfoVVz2/aJqOF+8a7hsHXqgC401H9oSoX
         96fB+Bj+detaQZbjl4rb/ugWI52raAA+yeYJlxTEFDUL+KqNi2LyFMDg/+2wsaJ6Xclq
         CphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969915; x=1745574715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRW2Z+u8s5/P5dIlcyOgmjGfvowI9yQ/5JBUpt8OXGQ=;
        b=qz1VQlmPCS0y+ixIU3dV/ProjAvX5NYFbCefaDL1qYLFxkvzJUVLseVBFp6Ajw1Zm2
         BgpAKGla+0bBDB2LLnR3mpvRKcAUFDMqWqIfMJtfsNFYj0JENbzp7pvxniu4AWiItZBT
         c7vYwQQrKGtvF0yEjm826svBSv8nGAHiOJi8yq9pinF7r+q7MYfQnjyouck+ZjiCJhOY
         4NIEN5rXpJhkxHhHhyUhhx1b1y9QRovTM/9GLKMx9V2wAime3ObZt5f/7GLBNiRFPMXF
         uZVIrPE3w+92veXsRdGpsL1nUZVMwWQgJSGyJz0bf8KL7zjnQvbe2xaLR+1TEHo1buc9
         36wQ==
X-Gm-Message-State: AOJu0YyulBNGKfsNbzao8NagWNmisbZmJfoZudjJQ57j9h0RpVNPwImp
	BdXDFQQq6ShNy9gtEWCvBPaPKWBNp1SCNAcEJw0kX/jxPIJIGOFK+t8Ai86RHpWavA==
X-Gm-Gg: ASbGnctKrc05cJEcg6eJEtJOnpXglfbsfBc8an34+RfNEyHDFJGZY7lndsWgWI2nF4j
	pI8E9oPcc+MIMMNt4gmNYkTzxkLQ8ju/XJqGov22Y8tjvHE4A2VnbKKGk7kbdiaJm+gGz9Vn40U
	qQFoOPSf/o1F8lEmfunNNwM7g/f7omeU5eXqPH/FWRWLyhDtiEX5OrJ8+mTGaZ4b9URRMJvx+RR
	w8OSNkauH4D+t9eHcuF9C7ZNNX3qsLaw5g6/WjfF58TBI573NxwqCaXzLccCdn9eQn5iFk/lesQ
	VgJqk9KELnBXJUbSzCWloI1f0y9chY9w4DOCCgNY/yOjB3Qvt17KSNrvd8DdUVae3/lTA/jWu8j
	QFTzFflnH
X-Google-Smtp-Source: AGHT+IHtKK8FL9xDdm93n7yAz0+/VUOCHpF3jHNphM1cCbOEjbLSnn3qsyO179OXMEuY/Lkucd7VAw==
X-Received: by 2002:a05:6000:40de:b0:39e:e438:8e32 with SMTP id ffacd0b85a97d-39efbb09208mr1461886f8f.55.1744969915504;
        Fri, 18 Apr 2025 02:51:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa420740sm2292836f8f.16.2025.04.18.02.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 02:51:54 -0700 (PDT)
Message-ID: <f6e39f49-2eb1-4f7c-bc0d-1cfc7bd60091@linaro.org>
Date: Fri, 18 Apr 2025 11:51:53 +0200
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
 <e7f66ec8-ee38-453d-a6de-4ed8d5a54268@linaro.org>
 <CAEDrbUYw2mp-UrYGXtEDSuwRP+8oC3nHq5s9VppGj=7f7_Gq_w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAEDrbUYw2mp-UrYGXtEDSuwRP+8oC3nHq5s9VppGj=7f7_Gq_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wAMAwUWALW2R

On 18/4/25 08:53, Kohei Tokunaga wrote:

> The following is the patch updates file-posix.c to solve this error:
> 
>   #ifndef HAVE_COPY_FILE_RANGE
> -static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
> -                             off_t *out_off, size_t len, unsigned int 
> flags)
> +ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
> +                               off_t *out_off, size_t len, unsigned int 
> flags)
>   {
>   #ifdef __NR_copy_file_range
>       return syscall(__NR_copy_file_range, in_fd, in_off, out_fd,
> 

Yes, LGTM!
