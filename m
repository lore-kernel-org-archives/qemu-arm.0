Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6305903njn;
        Mon, 20 Jan 2025 14:05:17 -0800 (PST)
X-Received: by 2002:a17:902:c951:b0:215:b058:28a5 with SMTP id d9443c01a7336-21c355c65a3mr189986515ad.18.1737410717471;
        Mon, 20 Jan 2025 14:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737410717; cv=none;
        d=google.com; s=arc-20240605;
        b=Haph2ZtphTndJzAMyDV5sf9cfGmvxrOzBjCjECqJn9WrgDurQ44vUi+Zpyz5fQG9QW
         sY/RGDXAXdb7DVEnGutM23ZqJJeesiiTs8QBxhX89yCAHjBSTAdn2gMeoqYau+hHDkGL
         9A+w1cxZhLvUYe49ZIEGilglb7hyz7Mid0yj8M7kasYI7fC2U2yObGsoxHqCy9yKlin/
         SeFrsxDrjozMo7eROMF7VAC2bLeoZ1Boo81d3VStpB2rM7WprE6iNBwwuZWe+Du92haT
         q2tYXk+9eHa5nWY7js7A5dVoB7qjfKt3U4H5s8nP/DnPf8D29BQDLLyGds5zVh/O2+Jt
         LIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HAcEusjzYH3QqmuK9Xi8ykEJwD47DNBc0rTmFjn7ETU=;
        fh=79DIJ5y2Dl9rJQyjd8KbU8sSTOaFvo4fj1/IOPTo+HY=;
        b=VA8xgX68b4yB5dlT1vYP066eWlyCqwGycjNiuUUtqmTDgaHesDzlt2OKihSiUBloVu
         iXgUV2Eyw8Pg9ORZ4ERmZKwhVcr2FVMmvjygA+u43bOTH/n1ZUde8WmMekTrCIgXvP8Q
         NBHjeC1klXWGzCc4sv3XuT0Zrcxibfmw98ekOYDE3sSITU63OsVEFRa4BGj8o9q8fAdS
         vu0l11WwplOrE6u+9BaxgnXcIg37zLpnKmT4mlNKpWzaZU27sXJPE6+YzoY2T3hvY25u
         9Zs+MO3Q2RgCzHLEeGvClBA3IowdM40vbm+KyCA4eli1Ok2NvezrmNjr/S/EQgQGe+iC
         T13Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=L4Kpu0ri;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
Return-Path: <dbarboza@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-a9bcc22be2esor6587377a12.1.2025.01.20.14.05.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Jan 2025 14:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=L4Kpu0ri;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737410716; x=1738015516; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HAcEusjzYH3QqmuK9Xi8ykEJwD47DNBc0rTmFjn7ETU=;
        b=L4Kpu0ri66i+kZklHYcItWNamvxsu13BVOEX56kPkwXVvx9NTxgvJ0C71+v42rWmuD
         WOQFHd7Td6MSn53ggwZTqcTOp4NNswjY5rKAZCnOTOnp8QOYBlQAOAn8gqG+V2tflLru
         UEN2SfVqqbK7dSkx/phGB+q5Un5Y6DKUMT9KIp/rX7wpRQKX7l5keP7/0AkSEWdO5EPK
         8li9QrJfd6S73klZ7kzWuJToIXSvpqhbhXtXP7/IRBAOekwFlyvphDRtuC8u6OjWWSQ1
         6/IFuECx1hLesDmtZ6EAG8xhRAQaCDv+j9vSP+SMxuZxa7fxZpXgRc3LoQJcLumHy2mG
         5Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737410716; x=1738015516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAcEusjzYH3QqmuK9Xi8ykEJwD47DNBc0rTmFjn7ETU=;
        b=SfueeUQCzio9o6y2pF1jaHPV2Ja+2WWUcgoj4y1filhtLky2UCNFU6aM0iV/Q6+sKO
         MC2h6APDiLnwxf80/XBiM5zBpxB8zHGY6Hhg6KxrhkHcT5UJJWviEefAcmm9BZD5qLP1
         HTNx8+ON3BlshSvIWKvigjjTcNeAqGK1TMfvB7Jw0zpi+xFzRNtg9w+jifMv2jZ3PmWI
         qgxS8lHRZ5Ivy/s6M6zociIT7d+H9xfMCyO2zcCazimq0wXWJF3HTlo2EjasKzj/Av0W
         aHdXNWPztp6ntW3NQ74kqNtkGxCPVjk1+JVhgQ1Y3UFnrrNuvFBbe7fcTXqd2et6435Y
         Nu8g==
X-Gm-Message-State: AOJu0YwlMcrBZ7sFQgfyKrpPlaNiiHFvfIwuXmihfxSIyfzQq6XNYKVv
	+vLHttfMu0+c+atOAtDSMGQP0BVWu3sFduO0IulnZbuF0zjrAnHqMHM7IS8f7KUp6y8arf2kYvo
	f
X-Gm-Gg: ASbGncvwXTl+L1pnwJDWIFItg852uZYQT8ys2NGTHVZwRREBVUX1qX3PO8XA/GZ3614
	qPPgQ1iiDtqH+vAyieW3sH3zdW4d9LBvM+ZZlx1FdPL4dnEB4oH0ZbnCt7/QcjjCCC7BTaz7zed
	AhkehyvwqyJaaxJel061B1BGK2F9eVUPzv7ZDZhwmhg7vGFD5AvR43N6WuE0W38f/QGWBH+wvCT
	vbZsCg3EjQzQrkJZoiJoF3V2ADOcW/kLQkMunEx0pH0gIMs+JUehWMIQhuJ17s5TJQnz330zZo0
	ERcn//bf
X-Google-Smtp-Source: AGHT+IFmvruijp1BEvAnBJfOm1j9+gPPi9V7Kkx3ueo6O/d/NXd36XGCBQQTWZBTOae1S2dEL7DSTw==
X-Received: by 2002:a17:90b:5485:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2f782c4bd9amr23642731a91.7.1737410716602;
        Mon, 20 Jan 2025 14:05:16 -0800 (PST)
Return-Path: <dbarboza@ventanamicro.com>
Received: from [192.168.68.110] ([191.202.238.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c17f6cdsm12535617a91.12.2025.01.20.14.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 14:05:16 -0800 (PST)
Message-ID: <5dfb0ac1-5f1b-4132-8041-16d6a8907319@ventanamicro.com>
Date: Mon, 20 Jan 2025 19:05:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] tests/qtest: rename qtest_send_prefix and roll-up
 into qtest_send
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
 <20250120210212.3890255-6-alex.bennee@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250120210212.3890255-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oNnwD/inmEaU



On 1/20/25 6:02 PM, Alex Bennée wrote:
> qtest_send_prefix never actually sent something over the chardev, all
> it does is print the timestamp to the QTEST_LOG when enabled. So
> rename the function, make it static, remove the unused CharDev and
> simplify all the call sites by handling that directly with
> qtest_send (and qtest_log_send).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   include/system/qtest.h |  1 -
>   hw/ppc/spapr_rtas.c    |  1 -
>   hw/riscv/riscv_hart.c  |  1 -
>   system/qtest.c         | 26 +++-----------------------
>   4 files changed, 3 insertions(+), 26 deletions(-)
> 
> diff --git a/include/system/qtest.h b/include/system/qtest.h
> index c161d75165..6ddddc501b 100644
> --- a/include/system/qtest.h
> +++ b/include/system/qtest.h
> @@ -24,7 +24,6 @@ static inline bool qtest_enabled(void)
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> -void qtest_send_prefix(CharBackend *chr);
>   void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr, const char *fmt, ...);
>   void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words));
>   bool qtest_driver(void);
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index df2e837632..503d441b48 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -565,7 +565,6 @@ static bool spapr_qtest_callback(CharBackend *chr, gchar **words)
>           g_assert(rc == 0);
>           res = qtest_rtas_call(words[1], nargs, args, nret, ret);
>   
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "OK %"PRIu64"\n", res);
>   
>           return true;
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index ad67cd7645..a55d156668 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -94,7 +94,6 @@ static bool csr_qtest_callback(CharBackend *chr, gchar **words)
>           g_assert(rc == 0);
>           csr_call(words[1], cpu, csr, &val);
>   
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "OK 0 "TARGET_FMT_lx"\n", (target_ulong)val);
>   
>           return true;
> diff --git a/system/qtest.c b/system/qtest.c
> index bb1efba9fd..28b6fac37c 100644
> --- a/system/qtest.c
> +++ b/system/qtest.c
> @@ -265,7 +265,7 @@ static int hex2nib(char ch)
>       }
>   }
>   
> -void qtest_send_prefix(CharBackend *chr)
> +static void qtest_log_timestamp(void)
>   {
>       if (!qtest_log_fp || !qtest_opened) {
>           return;
> @@ -282,7 +282,7 @@ static void G_GNUC_PRINTF(1, 2) qtest_log_send(const char *fmt, ...)
>           return;
>       }
>   
> -    qtest_send_prefix(NULL);
> +    qtest_log_timestamp();
>   
>       va_start(ap, fmt);
>       vfprintf(qtest_log_fp, fmt, ap);
> @@ -301,6 +301,7 @@ static void qtest_server_char_be_send(void *opaque, const char *str)
>   
>   static void qtest_send(CharBackend *chr, const char *str)
>   {
> +    qtest_log_timestamp();
>       qtest_server_send(qtest_server_send_opaque, str);
>   }
>   
> @@ -324,7 +325,6 @@ static void qtest_irq_handler(void *opaque, int n, int level)
>       if (irq_levels[n] != level) {
>           CharBackend *chr = &qtest->qtest_chr;
>           irq_levels[n] = level;
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "IRQ %s %d\n",
>                       level ? "raise" : "lower", n);
>       }
> @@ -380,19 +380,16 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           is_outbound = words[0][14] == 'o';
>           dev = DEVICE(object_resolve_path(words[1], NULL));
>           if (!dev) {
> -            qtest_send_prefix(chr);
>               qtest_send(chr, "FAIL Unknown device\n");
>               return;
>           }
>   
>           if (is_named && !is_outbound) {
> -            qtest_send_prefix(chr);
>               qtest_send(chr, "FAIL Interception of named in-GPIOs not yet supported\n");
>               return;
>           }
>   
>           if (irq_intercept_dev) {
> -            qtest_send_prefix(chr);
>               if (irq_intercept_dev != dev) {
>                   qtest_send(chr, "FAIL IRQ intercept already enabled\n");
>               } else {
> @@ -419,7 +416,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               }
>           }
>   
> -        qtest_send_prefix(chr);
>           if (interception_succeeded) {
>               irq_intercept_dev = dev;
>               qtest_send(chr, "OK\n");
> @@ -438,7 +434,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>   
>           dev = DEVICE(object_resolve_path(words[1], NULL));
>           if (!dev) {
> -            qtest_send_prefix(chr);
>               qtest_send(chr, "FAIL Unknown device\n");
>               return;
>           }
> @@ -457,7 +452,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           irq = qdev_get_gpio_in_named(dev, name, num);
>   
>           qemu_set_irq(irq, level);
> -        qtest_send_prefix(chr);
>           qtest_send(chr, "OK\n");
>       } else if (strcmp(words[0], "outb") == 0 ||
>                  strcmp(words[0], "outw") == 0 ||
> @@ -480,7 +474,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           } else if (words[0][3] == 'l') {
>               cpu_outl(addr, value);
>           }
> -        qtest_send_prefix(chr);
>           qtest_send(chr, "OK\n");
>       } else if (strcmp(words[0], "inb") == 0 ||
>           strcmp(words[0], "inw") == 0 ||
> @@ -501,7 +494,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           } else if (words[0][2] == 'l') {
>               value = cpu_inl(addr);
>           }
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "OK 0x%04x\n", value);
>       } else if (strcmp(words[0], "writeb") == 0 ||
>                  strcmp(words[0], "writew") == 0 ||
> @@ -537,7 +529,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
>                                   &data, 8);
>           }
> -        qtest_send_prefix(chr);
>           qtest_send(chr, "OK\n");
>       } else if (strcmp(words[0], "readb") == 0 ||
>                  strcmp(words[0], "readw") == 0 ||
> @@ -571,7 +562,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>                                  &value, 8);
>               tswap64s(&value);
>           }
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "OK 0x%016" PRIx64 "\n", value);
>       } else if (strcmp(words[0], "read") == 0) {
>           g_autoptr(GString) enc = NULL;
> @@ -593,7 +583,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>   
>           enc = qemu_hexdump_line(NULL, data, len, 0, 0);
>   
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "OK 0x%s\n", enc->str);
>   
>           g_free(data);
> @@ -613,7 +602,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
>                              len);
>           b64_data = g_base64_encode(data, len);
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "OK %s\n", b64_data);
>   
>           g_free(data);
> @@ -649,7 +637,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>                               len);
>           g_free(data);
>   
> -        qtest_send_prefix(chr);
>           qtest_send(chr, "OK\n");
>       } else if (strcmp(words[0], "memset") == 0) {
>           uint64_t addr, len;
> @@ -673,7 +660,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               g_free(data);
>           }
>   
> -        qtest_send_prefix(chr);
>           qtest_send(chr, "OK\n");
>       }  else if (strcmp(words[0], "b64write") == 0) {
>           uint64_t addr, len;
> @@ -705,10 +691,8 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
>                               len);
>   
> -        qtest_send_prefix(chr);
>           qtest_send(chr, "OK\n");
>       } else if (strcmp(words[0], "endianness") == 0) {
> -        qtest_send_prefix(chr);
>           if (target_words_bigendian()) {
>               qtest_sendf(chr, "OK big\n");
>           } else {
> @@ -726,7 +710,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>                                               QEMU_TIMER_ATTR_ALL);
>           }
>           new_ns = qemu_clock_advance_virtual_time(old_ns + ns);
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "%s %"PRIi64"\n",
>                       new_ns > old_ns ? "OK" : "FAIL", new_ns);
>       } else if (strcmp(words[0], "module_load") == 0) {
> @@ -734,7 +717,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           int rv;
>           g_assert(words[1] && words[2]);
>   
> -        qtest_send_prefix(chr);
>           rv = module_load(words[1], words[2], &local_err);
>           if (rv > 0) {
>               qtest_sendf(chr, "OK\n");
> @@ -752,13 +734,11 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           ret = qemu_strtoi64(words[1], NULL, 0, &ns);
>           g_assert(ret == 0);
>           new_ns = qemu_clock_advance_virtual_time(ns);
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "%s %"PRIi64"\n",
>                       new_ns == ns ? "OK" : "FAIL", new_ns);
>       } else if (process_command_cb && process_command_cb(chr, words)) {
>           /* Command got consumed by the callback handler */
>       } else {
> -        qtest_send_prefix(chr);
>           qtest_sendf(chr, "FAIL Unknown command '%s'\n", words[0]);
>       }
>   }
