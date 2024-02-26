Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1907226ejf;
        Sun, 25 Feb 2024 23:56:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWHgwcKgvDG5ee2Cso75Sadhzt1y3kiUlfo4NyA6Ddt8HlSvA+7hIzPhDYIge8vFDr5MdH7q/MqxtlAU9bJBU81gjstD/dU
X-Google-Smtp-Source: AGHT+IEzICOEQUAAjokj2Or6gUj0ySoAS7cSIoiZR5AxMgHJIYo9q8DQkhPor1ExVz/UtGhyfl+9
X-Received: by 2002:ac8:5c44:0:b0:42e:74b:c4da with SMTP id j4-20020ac85c44000000b0042e074bc4damr4147029qtj.5.1708934202762;
        Sun, 25 Feb 2024 23:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708934202; cv=none;
        d=google.com; s=arc-20160816;
        b=04iGa48qWe4JRdOrNyHLHFEbmNQMx5Xy//FzrYQNoulYxXTgdXjotI/1fWxE7aiSTD
         3FzVjBXXmpoHn0irvE0H6tQc09bpUE1bdN+3JD7Wx6PtaT2Z8M5gL0osvKKz12L3O0Cf
         Ie1V064G/RrXKaVviRds2nogIrm57lGK4FrStB1ChAO/mcYPSFvyJu2Vy4wv6k5JUeeQ
         2yBnMQEQMXZaGBabkW694qy2JZHnaUWxPZZtlSe/QUlwhwtsNRAyoP9zNhCoDvO/Stoz
         TQgBP8f2n/AayMY0tFFXcxvznMMqbaos1SmFBwdH2epvsvU3xP9ub2jH29eDpSkNYRW6
         Kszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=uGsOqpTP6osYG8FaocPDaPvgSl2PY/mJXXIgeUP4uG4=;
        fh=Iytda+SU9+A2VH9sYLKoInLBhbOfo0tq02yPJ3a95g0=;
        b=NeeYhEHM4GUN2U96QEywjxL1jbKw60a4PFOVo/v7k9rmromVhPPR/8TyE+FiPm2KXa
         ggWHsBZV/6sCyuYp5MlHSN1+LAdQTSmfJVqjunkuRb2PrDaAnPO6GYJsRyoEEAgBovXr
         QepvEBazbVaW3/yWcRSvP0w0bBgR3uZomKKo1RLALBA0lPjfgAl1s9UR8flSdqCevay0
         iYNiV0iX6l5XZi0fIvCpUdR1U+p1qMZvDrMJFonNfmgkbGSxrUzeZNA23KFTUBbDgF2Z
         eu5z3CYihMkhSMyP+QYVXWODGzBxUw/XjmENNxkI6Y1zpLnojb9PRWLr6neYAJa5pewS
         ZGHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEPm4HFY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h21-20020ac87155000000b0042e58058ce1si4560744qtp.14.2024.02.25.23.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 23:56:42 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEPm4HFY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708934202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uGsOqpTP6osYG8FaocPDaPvgSl2PY/mJXXIgeUP4uG4=;
	b=QEPm4HFYZ9fkVfuLcHU9uiNCfpBjbWde7Y6s4y5s5LRlxal6OOmVIHv7ik2zLXkD2Zkcbh
	Gxs4xYm15/IJ2cYK08SjxvifA6Hy5BABCJ0FzIIZ3G+tflQ0dAr93abKbvx12a6ryi/wnI
	uXrX/PqyD9E0KwrRMVu5nQtHKSP+Zlg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-lhSk8_jHPRiYRO87_2diDA-1; Mon, 26 Feb 2024 02:56:40 -0500
X-MC-Unique: lhSk8_jHPRiYRO87_2diDA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d2549572e7so21332031fa.3
        for <alex.bennee@linaro.org>; Sun, 25 Feb 2024 23:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708934199; x=1709538999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGsOqpTP6osYG8FaocPDaPvgSl2PY/mJXXIgeUP4uG4=;
        b=iq/+31rXshWQ6tEnlYZOX23on3/nSualUR2pMsHcawZj4Ezkw312GDZ0N0cVlnH7DY
         dR0ERTH9ReEUt49qYUDrwf56nIhTWV2/t5459GjKnumjOY5ylHcsC0FsRmSTT5s9dp9F
         EPTpDoKQGu9BNmZBAvPUCSW4F0/l0vAL+G+AUVILo6i7byBfiGQNVpgrFpVpaC8a6by0
         QTAVcCBFoWe40QEEMyLMAc9hdEe36+5Mkg4/ttmfc95UOCr3pAZbykUEWROmM/m2jJ8l
         BXtMKo2ojnfgdNod89nZPJAMYV8B1k4JBb9yms10bjhDr7wbptMzbqXwXOVyNt/pGeu/
         XdOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWioDKND4kW0P1xv8J4doeqBpumyidQQhiszF9wR9NTUYN6kwp3MwwlikVklPTdKo/rIuNsm5rGSxMXIiQktvPzT8dW0EFw
X-Gm-Message-State: AOJu0Yw9udR3BgffyZxDqKDq4ThYS+wEL+hHZiunV6B1h7lIGEHigbpI
	79QBnMdHC0FvZebk9XbrblSwg26MCgHdJVJtnDkFOYXfyTi2DWbShxjw69CL1ZPneiP1eW40WIo
	3cB1JNbL4U+JQ479uKejRKFgPLF08+I8AoMuekgAqGwvwtalVqAW+Cw==
X-Received: by 2002:a05:651c:128d:b0:2d2:3186:4597 with SMTP id 13-20020a05651c128d00b002d231864597mr3001047ljc.25.1708934199321;
        Sun, 25 Feb 2024 23:56:39 -0800 (PST)
X-Received: by 2002:a05:651c:128d:b0:2d2:3186:4597 with SMTP id 13-20020a05651c128d00b002d231864597mr3001039ljc.25.1708934198999;
        Sun, 25 Feb 2024 23:56:38 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-176-215.web.vodafone.de. [109.43.176.215])
        by smtp.gmail.com with ESMTPSA id g6-20020a7bc4c6000000b0040d5ae2906esm11033407wmk.30.2024.02.25.23.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 23:56:38 -0800 (PST)
Message-ID: <ef2f00bc-e920-485f-ba6c-c94c5aa5d615@redhat.com>
Date: Mon, 26 Feb 2024 08:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] tests/qtest: Reorganize common code in ivshmem-test
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org
Cc: lvivier@redhat.com, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, anton.kochkov@proton.me, richard.henderson@linaro.org,
 peter.maydell@linaro.org
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
 <20240222222218.2261956-6-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240222222218.2261956-6-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PBpOVF/tRNfh

On 22/02/2024 23.22, Gustavo Romero wrote:
> This commit reorganizes the ivshmem-test qtest by moving common structs,
> functions, and code that can be utilized by other ivshmem qtests into
> two new files: ivshmem-utils.h and ivshmem-utils.c.
> 
> Enum Reg, struct ServerThread, and mktempshm() have been relocated to
> these new files. Two new functions have been introduced to handle the
> ivshmem server start/stop: test_ivshmem_server_{start,stop}.
> 
> To accommodate the new way for starting/stopping the ivshmem server,
> struct ServerThread now includes two new members: 'server', previously
> present but not a member of any struct; and 'status', a new member of a
> new type, ServerStartStatus, used to track and handle service
> termination properly.
> 
> Additionally, a new function, mktempsocket(), has been added to help
> create a unix socket filename, similar to what mktempshm() does for the
> creation of a shm file.
> 
> Finally, the ivshmem-test qtest has been adapted to use the new ivhsmem
> utils. Adjustments in that sense have also been made to meson.build;
> also 'rt' have been removed as a lib dependency for ivhsmem-test.c.
> 
> Two lines unrelated to these changes have had their line indentation
> also fixed in meson.build.
> 
> Message-ID: <20231127052024.435743-3-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
...
> diff --git a/tests/qtest/ivshmem-utils.c b/tests/qtest/ivshmem-utils.c
> new file mode 100644
> index 0000000000..c2fc3463dd
> --- /dev/null
> +++ b/tests/qtest/ivshmem-utils.c
> @@ -0,0 +1,156 @@
> +/*
> + * Common utilities for testing ivshmem devices
> + *
> + * SPDX-FileCopyrightText: 2012 SUSE LINUX Products GmbH
> + * SPDX-FileCopyrightText: 2021 Red Hat, Inc.
> + * SPDX-FileCopyrightText: 2023 Linaro Ltd.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + */
> +
> +#include "ivshmem-utils.h"
> +
> +gchar *mktempshm(int size, int *fd)
> +{
> +    while (true) {
> +        /* Relative path to the shm filesystem, e.g. '/dev/shm'. */
> +        gchar *shm_rel_path;
> +
> +        shm_rel_path = g_strdup_printf("/ivshmem_qtest-%u-%u", getpid(),
> +                                       g_test_rand_int());
> +        *fd = shm_open(shm_rel_path, O_CREAT | O_RDWR | O_EXCL,
> +                       S_IRWXU | S_IRWXG | S_IRWXO);
> +        if (*fd > 0) {
> +            g_assert(ftruncate(*fd, size) == 0);
> +            return shm_rel_path;
> +        }
> +
> +        g_free(shm_rel_path);
> +
> +        if (errno != EEXIST) {
> +            perror("shm_open");
> +            return NULL;
> +        }
> +    }
> +}
> +
> +gchar *mktempsocket(void)
> +{
> +    gchar *server_socket_path;
> +
> +    server_socket_path = g_strdup_printf("%s/ivshmem_socket_qtest-%u-%u",
> +                                         g_get_tmp_dir(), getpid(),
> +                                         g_test_rand_int());
> +    return server_socket_path;
> +}

You could simplify that to:

     return g_strdup_printf("%s/ivshmem_socket_qtest-%u-%u",
                            g_get_tmp_dir(), getpid(),
                            g_test_rand_int());

Anyway:
Acked-by: Thomas Huth <thuth@redhat.com>
