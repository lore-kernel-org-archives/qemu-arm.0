Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560B0CCD19A
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 08:49:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLHOh-0003V5-5s; Tue, 18 Nov 2025 03:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vLHOf-0003Uf-MM
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 03:49:09 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vLHOd-0002FD-RD
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 03:49:09 -0500
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-948e1ec34afso146543239f.3
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 00:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763455746; x=1764060546; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mNjNbdrrzFou5StEM9SpfKZgIusGUo74wxT+5i+eQC8=;
 b=b58s4namYOu3SOM1Htk++0TsE9WCPBQbVHEXui7inM7RCMFRwTqbR84JBDzjHSje6S
 hQQY+4NQM2n6gbK8Tok8RdtVcrpO/Pwo6gN4EZyw7yngRIc0lueKJeW8Eh8k9p03brkv
 gLqjkbg9ETziXa9Zwn1qwMIeqWlUKAOHGL+p3zIeRvfDyf/7xbdTNo++lkDu6gHQPWkq
 S8vZEWHI17LB5FzutfAMo0TmNyzuhrrAef10Nv7cPUNSV9wEq/pgDB9yGvJC3tHTFrqc
 0DlbCfSzX3bxfeelt8W3GHfd3K2cOBVdGLYOLNcWwL0Mb4/ggaYqYvQBBnNYx5YDekMF
 AQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455746; x=1764060546;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNjNbdrrzFou5StEM9SpfKZgIusGUo74wxT+5i+eQC8=;
 b=pfNc8Gt7McTTHfTfE5HS1cSjzIyNPp0uIxl6uf1aYecp8H5Xy3jaRS5cX52QKoWDFE
 0Y/k9/rIL5j+ZO/wghXGmXw8O92bal8aKHHvD1rtOGHp3RRIjAv5J/3Nzhlrn3bfxrtn
 Z/QOe51rPxU93bv+MTeMOjd/kMznpH590uyr3PV4ddHEZ3tNuc8LxZkDbKFH0jla7hVh
 ziwF1ySFXr4tMay0UxwHcJPiaAFcQezdYsCRi1p9Yt58C+eQRM9B2eS5x0uKcXy2mKwQ
 k3UpneLe7pM40kJ7B9SS8WvSbch4GZ+Nhf/hv5+pNqPw86ZhA4s2sTekAuPbLYXuZBLh
 sNfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIO8UsgLtnhhVvUS5EGt0uBdJJ2mf2w/ZH2wPc4OPVwXvsy45F0RRWpitPlN/eK+f5WMe7C/04vA==@nongnu.org
X-Gm-Message-State: AOJu0Yy+cGHLd4BaCXPwu5cKLhMcoHp+lU7vMAWA8Rg/+4HcpwFx4/E4
 tyoImZlQ5eDaUikBxZrKkf98zKfLekQ4c+vYjrJY3lR4Ed6qBuXpH1nnHG21bjEZjXI=
X-Gm-Gg: ASbGncvSJggB58+LT//ev0mY3lygul1AkA6VERX34sn+CE3P5EAH2ExIm6e66987tRt
 XVahufLlRCraMHCwgun6EVkCX42W8n/no4mzpcxIk9VWSeIC271t3YlfmZbc6IW4W7IYLrrjo3B
 yBxwljdHFXU5Pk8U3qPacdCJS+ceSUKL4raKyyl0xFEBpXI05goJyaO9ZNjfduF3K6rz44sS298
 3TDOkNbEvAho1uCO3APfbG0uuxdddc0QFPNdKL5hZNbNzrV/sCCtslcN+E7ZFCOm69ZvTd7W8w0
 EKVi1KrGxbKayT8ShcrYubsBrsdxACn11Agi2XsHCLMwB9sEL8BFDNFi6Kr3GAzIf6eJ2PNb0Kk
 l7eylJJVJm1IbNLpBL7sWnblOrJrRsYl+saWAmo4+7qZhJefyqVoVbhaPm1oVPyxTzCneNei1Ol
 OZaEZqBdI3jinvrtLPaY5CfSwXyzyS1vYWUqzmbWfZ3oJZdwW1J8yCRFmHyeeNIoiQPwvFlHWed
 2XIuw==
X-Google-Smtp-Source: AGHT+IEr3YVKt1F5BnBA+NF19rMUQV9IkItWXrb1ae0Ga6Vy1wwelBPzxAS0nRPAqS7aLP8EwjTvBw==
X-Received: by 2002:a05:6638:aacb:20b0:5b7:c2fe:3d87 with SMTP id
 8926c6da1cb9f-5b7c9ecc915mr9120179173.18.1763455746406; 
 Tue, 18 Nov 2025 00:49:06 -0800 (PST)
Received: from [10.89.10.227] ([172.59.191.229])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b7bd3301efsm5700105173.52.2025.11.18.00.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 00:49:06 -0800 (PST)
Message-ID: <f4931237-d274-4802-a167-92f807844830@linaro.org>
Date: Tue, 18 Nov 2025 09:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.2 2/3] migration/rdma: Check ntohll() availability
 with meson
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Nick Briggs <nicholas.h.briggs@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Kostiantyn Kostiuk
 <kkostiuk@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20251117203834.83713-1-philmd@linaro.org>
 <20251117203834.83713-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251117203834.83713-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/17/25 21:38, Philippe Mathieu-Daudé wrote:
> Commit 44ce1b5d2fc ("migration/rdma: define htonll/ntohll
> only if not predefined") tried to only include htonll/ntohll
> replacements when their symbol is *defined*, but this doesn't
> work, as they aren't:
> 
>    ../migration/rdma.c:242:17: error: static declaration of 'htonll' follows non-static declaration
>      242 | static uint64_t htonll(uint64_t v)
>          |                 ^~~~~~
>    In file included from /usr/include/netinet/in.h:73,
>                     from /usr/include/sys/socket.h:32,
>                     from /home/f4bug/qemu/include/system/os-posix.h:30,
>                     from /home/f4bug/qemu/include/qemu/osdep.h:176,
>                     from ../migration/rdma.c:17:
>    /usr/include/sys/byteorder.h:75:18: note: previous declaration of 'htonll' with type 'uint64_t(uint64_t)' {aka 'long unsigned int(long unsigned int)'}
>       75 | extern  uint64_t htonll(uint64_t);
>          |                  ^~~~~~
>    ../migration/rdma.c:252:17: error: static declaration of 'ntohll' follows non-static declaration
>      252 | static uint64_t ntohll(uint64_t v)
>          |                 ^~~~~~
>    /usr/include/sys/byteorder.h:76:18: note: previous declaration of 'ntohll' with type 'uint64_t(uint64_t)' {aka 'long unsigned int(long unsigned int)'}
>       76 | extern  uint64_t ntohll(uint64_t);
>          |                  ^~~~~~
> 
> Better to check the symbol availability with meson.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   meson.build      | 1 +
>   migration/rdma.c | 4 +---
>   2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index df4460035c3..72edd6097a4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2663,6 +2663,7 @@ config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
>   config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
>   config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
>   config_host_data.set('CONFIG_GETLOADAVG', cc.has_function('getloadavg'))
> +config_host_data.set('CONFIG_ARPA_INET_64', cc.has_function('htonll'))
>   config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
>   config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
>   config_host_data.set('HAVE_GLIB_WITH_SLICE_ALLOCATOR', glib_has_gslice)

Should we bother with htonl{,l} at all, when we have <qemu/bswap.h>?

That said, this is the minimal patch for 10.2, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

