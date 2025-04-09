Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7626135njd;
        Wed, 9 Apr 2025 03:54:57 -0700 (PDT)
X-Received: by 2002:a05:6000:220b:b0:39c:1159:fe1f with SMTP id ffacd0b85a97d-39d87ac4b62mr2258321f8f.32.1744196097639;
        Wed, 09 Apr 2025 03:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744196097; cv=none;
        d=google.com; s=arc-20240605;
        b=b0q3d+q4/7tpVaj4CE9zjyaualgq7vR9oaJIEbmTPq5n4XYUO0OG9b/WDvatRYJIio
         ay8rQU0SwVDC+R7mStEO084y/dy7PtXtsAylKLPgDD3iSA58uJK+LdfjOmio8PjAcMRH
         QAhhb/lBh8D2/MMtPHhR8op+F1tStjIw6vMgitK5RVi6QEJFpS5O0Zut6Tbekv59WVVw
         6ohDOmiGpfqSa7PJglbt8gbXC7VpgiHcooxrgwpBzs06Bd10HFIIbCy6yQZn2mkE/5pH
         dBEbgI4v8TCCOdTqQg1o++4dB9hy+JvjV39h0Lal3CMAUMKRXTQsYOedMxqqcUSYM+5C
         avTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jcBAbBd5FPIILIqTt7rvo07REbaJqjD83akAyEzos0E=;
        fh=RDkVV6McDzl5AGSWeQEYfMLoxwMSy8uHCupVGoJ0Z7Y=;
        b=dI6bSY8rWAt1oI9nPYyRJ5OFUmxWg8xDEpW57jp60jE7pPpp61p68JU8/bqt8TlMgW
         jITcEzm7kgH0UDJ12rA7W5KeKlgi5GklAAjklEVzG6LDa+2q95TXCRNfkgRlXgRIrER4
         xDye8k3J/uQO4nVz/rxfjMI1V4z+/8X5dQWE6vKte0bJI7L+HAuuKRf2Lvh3cyqW2SJQ
         y2/6UwRtsTC8+2TdAdSYDfd2MLqu98l+zH2z0buOKeBmpYipPOXRoTxprz/+UDQH815T
         GJ20Klkel8vf5itLJmu0HJUiCndB5E9urKFYV3t50pE+AD+Jp+zdEtR4EikVsmUqSeb0
         AGiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4uk3M0Y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39d8937776bsor333892f8f.3.2025.04.09.03.54.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Apr 2025 03:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4uk3M0Y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196097; x=1744800897; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jcBAbBd5FPIILIqTt7rvo07REbaJqjD83akAyEzos0E=;
        b=Q4uk3M0YZeW7FPrge3p1W9uqulxeFi0ZGYuvE0Q9+aYZp4lNXZXxNK7TWaBzwGhCo5
         e8BBUuo1sinZabInetEZA76ufjsOQxdO/lDNCtxQWaAYNqcUNGtjSgnajwv4DSanZjaw
         9iGwv3Isz9tovWQ7GBaRsUwFjSLFf0jQ9betFg1Z5RMP67mue/pj5Gnq01BCDPfnNsbP
         9VWeWK8fgmFMvPEBdrcjJHAeHuYAfTQg2sV9fp2OZnqbMruI8bYgkoJ6wcZy1LShJbbI
         9G3orI+sHG3APuR0B+M+q98rFPkGQEctPZymjbIA1MNj3ZPjCegMRqLsa2HKV03oLBF9
         qIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196097; x=1744800897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jcBAbBd5FPIILIqTt7rvo07REbaJqjD83akAyEzos0E=;
        b=Vo+FD3sv5QRfogentsD+HgA9+Wvec49S36Nd+c0kfMmRiDXWPLajXoBVtURinamnhh
         32nNfIDdsnrXYIQYEC7P0dhqfL121tbbLAv1q6Rn+3ZDti6Ym59draTqy2S9I/pMpqBe
         RC23EdH9OkPQJZaR3r4MPd75jFj/jb2u4d9C4RVFZ6muRUJZMmYW0N0H51H6QQU0YtSE
         nwiPOFy1AxRhvstfaFVB6WFilJPLRNXbTi/B+xk4N5ZUfJBfcxsVEdc5AHzODazMtQaP
         NWBSM6/UY+C2qbs/8xsE3d0O1CQ3CUgueMbfeB3IPe0nDOKJr0kKPxAUHTF1hAvKss6S
         ILIA==
X-Gm-Message-State: AOJu0YwhFVLXf7r3cr9gNSJWt+pGnl7xAB1a+QkSAmwqJcY/nJb1MkTh
	nTeHkRvKqH1VPzdkV6Q/J7L1yg420CwrCaKH4/TnipghCiUsCJHFXh7Z7N047qPHkg==
X-Gm-Gg: ASbGnctghyLpklpnMHvsftuuwxcpAoVGv7eYFpQ7ZlB+dwJYPUqfnY4BmjEWbu8IGkK
	ElguBNK1tmi5Lht8smBjChNhXMcmQBxSbymwIhKQ6LUhLj2zLI42D268wjKtuoy0g8ozp13fSe2
	igbIvL0/+8bBexrM2UwPuORu6f2B7cdibvCTwB+y5SPcb7UT6UdXkC8x1Sg/3+9qtnTlUv5cgD8
	uk5wcj9h6dYEEEimQjptLc42sADkcxN+yK/o93tuVaHi6pQW1WZ31JRuaYL9yc1zv127RNHzncR
	Puts4WSwru3l14uJvMbXAlsNkrivenqqMTY6LSvQDPloSYIfqhWHNJXNFZDqbfGqHQ+QNvH6o8U
	mOBrJXj7tSxU=
X-Google-Smtp-Source: AGHT+IEv7Xxdb4HKM1O/QUHyqJdmOZet1wAx2IE66VhM4OMBEgcQ+cG2syd8513zhiem0AbxZJ42og==
X-Received: by 2002:a05:6000:2a10:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-39d87cddd45mr1521437f8f.59.1744196097044;
        Wed, 09 Apr 2025 03:54:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625592sm16121325e9.10.2025.04.09.03.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 03:54:56 -0700 (PDT)
Message-ID: <e6cbd3ae-356d-4805-bca1-90b0e98c4d0d@linaro.org>
Date: Wed, 9 Apr 2025 12:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] various: Fix type conflict of GLib function
 pointers
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <2be81d2f86704662c9fa33ceb46077804e34ac77.1744032780.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2be81d2f86704662c9fa33ceb46077804e34ac77.1744032780.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: s2n4qPdTN7aq

Hi Kohei,

On 7/4/25 16:45, Kohei Tokunaga wrote:
> On emscripten, function pointer casts can cause function call failure.
> This commit fixes the function definition to match to the type of the
> function call.
> 
> - qtest_set_command_cb passed to g_once should match to GThreadFunc
> - object_class_cmp and cpreg_key_compare are passed to g_list_sort as
>    GCopmareFunc but GLib cast them to GCompareDataFunc.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   hw/riscv/riscv_hart.c | 9 ++++++++-
>   qom/object.c          | 5 +++--
>   target/arm/helper.c   | 4 ++--
>   3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index a55d156668..e37317dcbd 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -102,10 +102,17 @@ static bool csr_qtest_callback(CharBackend *chr, gchar **words)
>       return false;
>   }
>   
> +static gpointer g_qtest_set_command_cb(
> +    bool (*pc_cb)(CharBackend *chr, gchar **words))
> +{

Why not use a GThreadFunc prototype, casting the argument?

> +    qtest_set_command_cb(pc_cb);
> +    return NULL;
> +}
> +
>   static void riscv_cpu_register_csr_qtest_callback(void)
>   {
>       static GOnce once;
> -    g_once(&once, (GThreadFunc)qtest_set_command_cb, csr_qtest_callback);
> +    g_once(&once, (GThreadFunc)g_qtest_set_command_cb, csr_qtest_callback);
>   }
>   #endif
>   

OK for the rest, but it might help to merge by corresponding maintainers
if split in 3 distinct patches.

> diff --git a/qom/object.c b/qom/object.c
> index 01618d06bd..19698aae4c 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1191,7 +1191,8 @@ GSList *object_class_get_list(const char *implements_type,
>       return list;
>   }
>   
> -static gint object_class_cmp(gconstpointer a, gconstpointer b)
> +static gint object_class_cmp(gconstpointer a, gconstpointer b,
> +                             gpointer user_data)
>   {
>       return strcasecmp(object_class_get_name((ObjectClass *)a),
>                         object_class_get_name((ObjectClass *)b));
> @@ -1201,7 +1202,7 @@ GSList *object_class_get_list_sorted(const char *implements_type,
>                                        bool include_abstract)
>   {
>       return g_slist_sort(object_class_get_list(implements_type, include_abstract),
> -                        object_class_cmp);
> +                        (GCompareFunc)object_class_cmp);
>   }
>   
>   Object *object_ref(void *objptr)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bb445e30cd..68f81fadfc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -220,7 +220,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
>       }
>   }
>   
> -static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
> +static gint cpreg_key_compare(gconstpointer a, gconstpointer b, void *d)
>   {
>       uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
>       uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
> @@ -244,7 +244,7 @@ void init_cpreg_list(ARMCPU *cpu)
>       int arraylen;
>   
>       keys = g_hash_table_get_keys(cpu->cp_regs);
> -    keys = g_list_sort(keys, cpreg_key_compare);
> +    keys = g_list_sort(keys, (GCompareFunc)cpreg_key_compare);
>   
>       cpu->cpreg_array_len = 0;
>   
