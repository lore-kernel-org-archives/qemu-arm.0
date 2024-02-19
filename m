Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp706864ejb;
        Mon, 19 Feb 2024 06:05:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJ4aAC96pM0c93Jf4Eygi5V4M/G4QdiLaA1CW1NGTy0wrCQQ3/fYJeV5BNQvOcGBW+46r+lZE0Bq0mn0rBVCp3WrlFKbv4
X-Google-Smtp-Source: AGHT+IEqf0TJVxDEBypmGdZSXPsTFqmgTSawMPA7OdWe11K5m5OnrvsbV1ChTDS9sKnbvlS2eNb4
X-Received: by 2002:a67:f94c:0:b0:470:40d8:6ae1 with SMTP id u12-20020a67f94c000000b0047040d86ae1mr3653611vsq.28.1708351500341;
        Mon, 19 Feb 2024 06:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708351500; cv=none;
        d=google.com; s=arc-20160816;
        b=0CQDMOGXLJKb+EUSRFSbq2/fcL5mMyagW3N8au8uAaTdPSEn6Qa4ms9ORgv6i4BQYR
         h3laerErEdASLuxC9COAmWZV0tPcpiqu4hl+KtkAaWc8nMlhUhe9zShE2pnLePJNhI34
         +KIyIeuvirjlBBXNdvtFA3/PxFfixxboKzQhLRXv73iq1dhp4g1lzgcIt50uSCw+wDNO
         cPTDQaCm/30INkReid5TxaAENzTCMXnbd55lKB3KvFp4MPuaWujylAZ/GhsxEM0W8U3w
         RCaKqCaLYuPZfW0CQzKAAOTi9mzMpDaPFgi3lVy10X/i0ffHpTUdLcKL5eXqOs6fNm9E
         btoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4xPMvllzBCgc7KYC5/MOa2eoS/ye7mk4rZsmxF0dPRQ=;
        fh=ENiqS4qA4i/ZdMyBFokpmYBNy8uUXmCi5WyTH8MZESA=;
        b=uO+Vgoth1kWhCcqdj1zuFv+i5dMcW3by5ZcEng68icROLluyGO8IjuPTzWBFgnszDO
         IC+9PS02vhv/cKDOhxsayr2MoYO9YR90PCBhmB0cE7nDjv5/Vyh8SWaSZv708VhZmsFv
         onLmJpZt9XR/uiSjEClaw1HAdLF+YP+17BgdAPiXED6GXNRarF7poR+rQZnvtSH4e8zc
         vR+2FKANCcVjwLFCwb0mNvOSr9yOrRqI1KSbtdhw/fvUAhO1CryNRZ0CDNK248c+vMVN
         A/45/VEDapywB0GQdckNdcQxemRznygF2U9sHYWSwFWzenNQbUmbcKAtmyco+/Ggn0xC
         ph0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMHm1BYc;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g30-20020a056102159e00b0046d2b701c1fsi934381vsv.724.2024.02.19.06.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 06:05:00 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMHm1BYc;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708351499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4xPMvllzBCgc7KYC5/MOa2eoS/ye7mk4rZsmxF0dPRQ=;
	b=KMHm1BYcgZFWTK50zUPlv/B4zQsmfKj1XnlmF5NWXlXT2MriG1fjOfGZDObTFuIKrD6o0B
	DWXttu9zBCVDjULvypPBG3QnF1qFc+JEJy6TbgV4MW4E7I4OAh9woLUcGnz6XKE/znWqp9
	zvPXxePfvuWobS5JMd3jRRaEu2u4/Dk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-0G7mqt7mP9S-uPd_n2tuZg-1; Mon, 19 Feb 2024 09:04:58 -0500
X-MC-Unique: 0G7mqt7mP9S-uPd_n2tuZg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68f892ca388so1689816d6.2
        for <alex.bennee@linaro.org>; Mon, 19 Feb 2024 06:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351498; x=1708956298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xPMvllzBCgc7KYC5/MOa2eoS/ye7mk4rZsmxF0dPRQ=;
        b=DopLMlylo/0WbvSNhZQVX5ok0rw2heO6x/DrZxZ37PxUi5e+FYgDkx0en27xxIyF61
         LhFYM+nCf11HmXnF6413KsZScVQqZHBBQLY7wW6RhZbDOlkA9SGsoM5bcJdz/qAptsWV
         PxjsBgXqa+coHVi+/sOAnBLkHoMpJ3WJCGLd72X/03c/KwQFQ24rRd8eadl3SwOdFOGM
         IovCquyh4hnTsflCxF4PtucgbSUFHhMyhPQENL5jaQmzhpQuiHMtH9XCe7HPOFFK40KN
         v3ZY9c3I5YeL2E0nx3IeBNLNYGpIRg4cLDxEnMDB7LZi8Eqy+yYI0Kzsm5qWEUpO2qL7
         ocfA==
X-Forwarded-Encrypted: i=1; AJvYcCW5HZFGH9EXgNU+W4cgcQwQvNyXHnatEG/l37ZKKeUeaVCO8jUqK61Dg626DO9RMdX/vGMtddjahS7SXScVFRnz1yHeu3k+
X-Gm-Message-State: AOJu0YzfYe5QIRXjT2X21JyECWUzLhjZCqI8+ibp7aeziOIJNm3jnlXl
	BYrE3GZpseBr3FgRTFkaPHXk2MEdWQIl/36d2HGFRoCC8spXNNcUyc2wn1gBwCxGVMmMABFY6eU
	FHZNO6nxCh3p3Oa2DyHc9kgzgisQzuA2acw+z1zDilYGaW+/zw9wIyA==
X-Received: by 2002:a0c:9792:0:b0:68f:5091:872f with SMTP id l18-20020a0c9792000000b0068f5091872fmr6062420qvd.53.1708351498024;
        Mon, 19 Feb 2024 06:04:58 -0800 (PST)
X-Received: by 2002:a0c:9792:0:b0:68f:5091:872f with SMTP id l18-20020a0c9792000000b0068f5091872fmr6062395qvd.53.1708351497735;
        Mon, 19 Feb 2024 06:04:57 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-177-48.web.vodafone.de. [109.43.177.48])
        by smtp.gmail.com with ESMTPSA id mc7-20020a056214554700b0068caf901c9bsm3260832qvb.17.2024.02.19.06.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 06:04:57 -0800 (PST)
Message-ID: <91aad72f-825f-47c1-a253-cefead336553@redhat.com>
Date: Mon, 19 Feb 2024 15:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] tests/qtest: Add ivshmem-flat test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Anton Kochkov <anton.kochkov@proton.me>, richard.henderson@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240216144456.34992-1-philmd@linaro.org>
 <20240216144456.34992-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240216144456.34992-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UbDl2RdBb7Ht

On 16/02/2024 15.44, Philippe Mathieu-Daudé wrote:
> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Add qtest for the ivshmem-flat device.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Message-ID: <20231127052024.435743-4-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/ivshmem-flat-test.c | 320 ++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build         |   2 +
>   2 files changed, 322 insertions(+)
>   create mode 100644 tests/qtest/ivshmem-flat-test.c
> 
> diff --git a/tests/qtest/ivshmem-flat-test.c b/tests/qtest/ivshmem-flat-test.c
> new file mode 100644
> index 0000000000..5489a0d915
> --- /dev/null
> +++ b/tests/qtest/ivshmem-flat-test.c
> @@ -0,0 +1,320 @@
> +/*
> + * Inter-VM Shared Memory Flat Device qtests
> + *
> + * SPDX-FileCopyrightText: 2023 Linaro Ltd.
> + * SPDX-FileContributor: Gustavo Romero <gustavo.romero@linaro.org>
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + */
> +
> +#include "ivshmem-utils.h"
> +
> +#define IVSHMEM_FLAT_MMR_ADDR 0x400FF000
> +#define IVSHMEM_FLAT_SHM_ADDR 0x40100000
> +#define SHM_SIZE 131072 /* 128k */
> +
> +static ServerThread thread;
> +
> +uint32_t *shm_ptr;
> +char *shm_rel_path;
> +char *server_socket_path;
> +
> +static void cleanup(void)
> +{
> +    if (shm_ptr) {
> +        munmap(shm_ptr, SHM_SIZE);
> +        shm_ptr = NULL;
> +    }
> +
> +    if (shm_rel_path) {
> +        shm_unlink(shm_rel_path);
> +        shm_rel_path = NULL;
> +    }
> +
> +    if (server_socket_path) {
> +        unlink(server_socket_path);
> +        server_socket_path = NULL;
> +    }
> +}
> +
> +static void abort_handler(void *data)
> +{
> +    test_ivshmem_server_stop(&thread);
> +    cleanup();
> +}
> +
> +/*
> + * Check if exactly 1 positive pulse (low->high->low) on 'irq' IRQ line happens
> + * in 'timeout' second(s). 'irq' must be intercepted using qtest_irq_intercept_*
> + * before this function can be used on it. It returns 0 when pulse is detected,
> + * otherwise 1.
> + */
> +static int test_ivshmem_flat_irq_positive_pulse(QTestState *qts, int irq,
> +                                                int timeout)
> +{
> +    uint64_t num_raises = 0;
> +    uint64_t num_lows = 0;
> +    uint64_t end_time;
> +
> +    end_time = g_get_monotonic_time() + timeout * G_TIME_SPAN_SECOND;
> +    do {
> +        num_raises = qtest_get_irq_raised_counter(qts, 0);
> +        if (num_raises) {
> +            num_lows = qtest_get_irq_lowered_counter(qts, 0);
> +            /* Check for 1 raise and 1 low IRQ event. */
> +            if (num_raises == num_lows && num_lows == 1) {
> +                return 0;
> +            } else {
> +                g_message("%s: Timeout expired", __func__);
> +                return 1;
> +            }
> +        }
> +        qtest_clock_step(qts, 10000);
> +    } while (g_get_monotonic_time() < end_time);
> +
> +    return 1;
> +}

The timeout stuff looks like it will be quite sensitive to slow CI runners. 
Timeout is set to 2 seconds in most callers - but on very loaded systems, it 
can easily happen that a job gets interrupted for two seconds.

I think you should either increase the 2 seconds to something bigger (maybe 
use a #define for it), or instead of using g_get_monotonic_time(), rather 
loop a certain number of iterations and use a g_sleep(10000) in the loop 
body - that will also relax the host CPU while the test waits for QEMU to 
progress?

> +static inline uint32_t read_reg(QTestState *qts, enum Reg reg)
> +{
> +    uint32_t v;
> +
> +    qtest_memread(qts, IVSHMEM_FLAT_MMR_ADDR + reg, &v, sizeof(v));
> +
> +    return v;
> +}
> +
> +static inline void write_reg(QTestState *qts, enum Reg reg, uint32_t v)
> +{
> +    qtest_memwrite(qts, IVSHMEM_FLAT_MMR_ADDR + reg, &v, sizeof(v));
> +}
> +
> +/*
> + * Setup a test VM with ivshmem-flat device attached, IRQ properly set, and
> + * connected to the ivshmem-server.
> + */
> +static QTestState *setup_vm(void)
> +{
> +    QTestState *qts;
> +    const char *cmd_line;
> +
> +    cmd_line = g_strdup_printf("-machine lm3s6965evb "

Could you please add a check, either in meson.build or in main(), to make 
sure that the lm3s6965evb machine is really available when running this 
test? ... it might have been disabled in the build ...

> +                               "-chardev socket,path=%s,id=ivshm "
> +                               "-device ivshmem-flat,chardev=ivshm,"
> +                               "x-irq-qompath='/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]',"
> +                               "x-bus-qompath='/sysbus',shmem-size=%d",
> +                               server_socket_path, SHM_SIZE);
> +    qts = qtest_init(cmd_line);
> +
> +    return qts;
> +}

  Thomas
