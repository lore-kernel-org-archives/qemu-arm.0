Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3198409njc;
        Wed, 16 Apr 2025 02:04:00 -0700 (PDT)
X-Received: by 2002:a05:600c:8707:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4405d5fccd5mr11764565e9.4.1744794240377;
        Wed, 16 Apr 2025 02:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744794240; cv=none;
        d=google.com; s=arc-20240605;
        b=L6BFC5QJ4BiJh5qXUSU2TKr7eDPbSRGrs8zLc+u0/JmIt7Gg9v+JVXQ8hte1UIL/9H
         Xk3T4c30vYrb5WMfbJEu2pSKdQmTpU0GYc7rsx4v8Vw5rgu+d26Hqzf4ZTys8efEjkPx
         aY31v2750J9iRWAlefuiiFkAshdqdvyoe/6CFPBzxq1V/XRv+NyaAuPLuq5NXM7w/U2z
         jb8yHQzYYLzvVviSgBtqjmJjYtUhevj7YxXMj+tpGtyE8PTUAlVbeWTEgtIPnR7ikXnl
         0NEefvza4XFQrSFdPG9RBEt8Kf7YBNW10RQJqndUomUvl5PwfrDlxejMZgHJNj+L8Yee
         QFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nUWYxnXh8lwhGY2OO/SccjnOI4f8xd+wiWjlUO6Csa4=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=SE9IYEyMJWbjyWflJDfCjYDmL2hNeDjChcfDwse00WSe9akVkDM1I9tDfC6VQ4ICUm
         Mp51TmWElzjXRqB9/SpLOyqynES5VJ/j8PurdsJyRLg3ALFzrHNuNdzGy80dkLlN2kG8
         WkReFW4wzi7IHUfltNnEPXDU7phMi3Or6YdOqw2ZJTKhKOwiuXzputj3A2qau8a0KF9W
         7IofIu63YSz1rhgbcksLXNmwyKh3dxGmj/1PgW6+I1aT/XmzltAzAULOoDVeJub9juA4
         E7qIzPLAJhWNZ6rIlbyjBUjjx1EznUUZDOA7W1TscakDNfxDezH1yNoeTP1eghPEhthD
         aKtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4WjNDhH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f235eccd0sor74671535e9.10.2025.04.16.02.04.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4WjNDhH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744794240; x=1745399040; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUWYxnXh8lwhGY2OO/SccjnOI4f8xd+wiWjlUO6Csa4=;
        b=T4WjNDhHUNYiJdjeIrzZUtoD60A0QkTqi3K6s4/IA/BoBewXCRxVHBFr2m7WbGXhn3
         Px2FGMrGvPiKlAG0bGSOxpcHGi7+Ks/FsFdsBo08NA5rNnBekj11/q7epwOu4e4xxmp/
         MIM16oM3KhUS6RGMbJLTsl5jjXORpc9z4TF/90MZyUUXygBYcOw63q0TA2Acvq5xyJYy
         AwnRgbZ/Pd+5x8Xhm6GsZv0Up8rS3GYx1AFMqAFL7N/5gudCYZ2jrB2DCne5SlovRuLU
         RPyYOLh4w/5XLDIY9meNp0EQqkgrKoSWR0NMTLCzWQ6qZK/RsRrFA36Y6eOCJXqDzxis
         q1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794240; x=1745399040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUWYxnXh8lwhGY2OO/SccjnOI4f8xd+wiWjlUO6Csa4=;
        b=YouuAQjYy/0kfjc3lvYivxPai0+2idYXy80aeWT4nXqpI4sN5T0b6uYcdgIzcb1EMd
         mcQW11oWo8DkcZTeBexyy+NScM73hDs63O5I5133o/FL392HS9NwC84y2+L0KG/GOEfH
         tgSesczpdVz+JYjuvjYUwtGwwOr+fqiHCLebMSxQRctvMgEIgxWPRRdcv2C8krphdUlS
         4e14s6xf/WEH+F9r3eCf4WJQCv83DO9U4TSniHOBr+OyO4OJROkDvk07E9CuLFUmkt6b
         yTv+HAG2a/n9rNT1hTERDsu3UPhIwurCMACS2HPN1I6bL7JbaBY/EKQuUJANN/lmoXfE
         n6nw==
X-Gm-Message-State: AOJu0YwGvc0GBqlb2q/04zg97lR/1QkjHH9s422jXfrMBDv2RCFZQ8XI
	PZWO6ej/ODrvdgBkIbLOcwTySDvBM7+jDfDYkLY1Wxf7NBfCY2BCkbILY1hg13Auhw==
X-Gm-Gg: ASbGncsmSF8FdosBq6ZzhmHWxMy8mI4Ms0+2KTYTC8kXS7oTuj3rcEt13CdbIDmJfxp
	SAGG+zy9hhwsqLy6BD9GTOoBD9OLXiu8rqcqdvNAZtOiBH1525ZOtK8W/xRklxbOHs/UWG0Ntt8
	zJYOo/IW0ZRP0Qqj4wnO5laGK9LrXcY+jC3CdKad1pJSPkEDuw2vsI/YmGT+0sfUiMmv/VQmU92
	GyLNpUKOmg4wM+6awFhKovNuqHD3wqdicfklLpEdEjvS9hcI/WLy+dpwyKnjcJ8Bcn40kA9DO39
	ftLx6mshWERmRZkDb/Hn9HHj2oHIFpmpbpacG/JVuydbIzaWmP0VtfDLllutR1GzL5eGsrZsLtZ
	Xne0qj27mocuLSyftw3PN6k3l
X-Google-Smtp-Source: AGHT+IFMBlwQSmEgqm/NTnMes5Uq1j9emF6+odX1U04PVh1jhQhYgfi2u1ppgJChumoqqCfveWDkGQ==
X-Received: by 2002:a05:600c:34c6:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-4405d69b68fmr10008205e9.23.1744794239868;
        Wed, 16 Apr 2025 02:03:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8294sm15258185e9.2.2025.04.16.02.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:03:59 -0700 (PDT)
Message-ID: <e10f052d-b098-487e-a667-a0a19630d082@linaro.org>
Date: Wed, 16 Apr 2025 11:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/19] Disable options unsupported on Emscripten
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
 <c2e3a58825c39678fcde361b685d1bd69d2fb1dd.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c2e3a58825c39678fcde361b685d1bd69d2fb1dd.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: VqU7m5oHz4Qz

On 16/4/25 10:14, Kohei Tokunaga wrote:
> Daemonizing and run-with aren't supported on Emscripten so disable these
> flags.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   qemu-options.hx | 4 +++-
>   system/vl.c     | 4 ++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dc694a99a3..20ed22afe2 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4863,9 +4863,11 @@ SRST
>   ERST
>   
>   #ifndef _WIN32
> +#ifndef EMSCRIPTEN

#if !defined(_WIN32) && !defined(EMSCRIPTEN)

?

>   DEF("daemonize", 0, QEMU_OPTION_daemonize, \
>       "-daemonize      daemonize QEMU after initializing\n", QEMU_ARCH_ALL)
>   #endif
> +#endif
>   SRST
>   ``-daemonize``
>       Daemonize the QEMU process after initialization. QEMU will not
> @@ -5249,7 +5251,7 @@ HXCOMM Internal use
>   DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
>   DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>   
> -#ifdef CONFIG_POSIX
> +#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
>   DEF("run-with", HAS_ARG, QEMU_OPTION_run_with,
>       "-run-with [async-teardown=on|off][,chroot=dir][user=username|uid:gid]\n"
>       "                Set miscellaneous QEMU process lifecycle options:\n"
