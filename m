Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1642969njc;
        Wed, 21 May 2025 22:55:59 -0700 (PDT)
X-Received: by 2002:a17:903:187:b0:226:30f6:1639 with SMTP id d9443c01a7336-231d45e637dmr301680905ad.51.1747893359493;
        Wed, 21 May 2025 22:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747893359; cv=none;
        d=google.com; s=arc-20240605;
        b=NoAvd/8Vt3VTfPf4x4CJS5MiEtEefIQCGMEaPHLgIjcDU3TbZ14i7CoaQ2kXEgON2+
         ktMqYp6bHagMWCFyigDYNUTO8hrgMkv1y/tO+uzbtvjs4nUU9ipmIPjYi9GeiegoYb7F
         VcBbRxtxQgvMZUMA+5OHPst14sQ/5VqX7UtUKt+HxkQ698SUiAyc/yb+JI3w6lSLtExb
         Mbl5uUdAJllHUFJkRmrbWAbSg7rvIC8GCMT4pkiIDDTK9euBc5SoYLO7+AU4T+iZLKDx
         Ftu3xYvyU6ZSDYH2ArKx8MXj9uc3R+OKp5AEZvcxahrzWvz/1dOmm3fePrZu496qE83g
         Nm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P9YtVX6tHIM4S8SiNEOfAuBtEEKz6i8ukp0QFvwVbCI=;
        fh=0BpcUhEAu/ygqO2hQQNVjK8pf3EEaf00vml9Hn/yKkw=;
        b=d5e0xAKa0GtkrIPj5bN6dnYoHx1p9j5YL1L+1kaoTfTC1hc05G6KksnhgSR4tVKGgt
         TAc0kgK/Hi3qLa0QaJPr6u9ku/LN2fTgjZBz2WJR+i2q4Fiw9rKm3nH+TXjhDFR2+grI
         JxXoMM4/9CJslTRVCQPYa4Sp4IhzoBRv/ynYTm0pRxB+IqSOhDQDazEPw5RZ/TzvwKH3
         c5PDCkIsLNdy2oK/lDB/KWjl+8QV9UVA1GLUnVMA6wS92oILn416In6bMsG/x8jajqcn
         Jg4ipxUB3PFimXjzHX15BvDRhIvtRo7CRDyBf9nJqBCKRdJ/v7ncLvJpNJKoKuudn7GB
         xzlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IGrhByzt;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d55684esor9940304a91.4.2025.05.21.22.55.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 22:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IGrhByzt;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747893359; x=1748498159; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9YtVX6tHIM4S8SiNEOfAuBtEEKz6i8ukp0QFvwVbCI=;
        b=IGrhByztLI5QdGurSnO6+ETUPNRM0FnEjZvPHufF1lG3nydBVCflZP1u2dd5lae5Es
         Nc+5oUzU8AxL6HN7Q9GZxHdRhzBP8xQy0rRrtU6s0cGbqUsOscY3Aq0OJ6UCWbU7Q/s2
         EcEX8GtrwTKQ73tl2UCWe/j+wWnumUyHYkPNg4l4AvrFfGJUW4/Fjxs7BN1gbpxjphPT
         YrWuhWKCmG1eNRjPcbqERDpO+EfGCigIMhYUdI1z1p5lC+xFO75+dXon2lQzpObo8cJr
         9YRSivwHKVrcTTdsiFQQMzn1Uq7O8JMozeVv9RrGbH0pe/pIVLPhxZrex5jLfzjyY9T+
         QT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747893359; x=1748498159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9YtVX6tHIM4S8SiNEOfAuBtEEKz6i8ukp0QFvwVbCI=;
        b=GCbYFFdnHsZb3wBRT4JyIAfhiYSfRXKevCl5IxIHAfe/Lx5mBBzykTW6Ji977bQWOT
         cYapzWFxOml0ztVIEj7HAFdqaMIVi5LxxB8iY3YFoO/2GdtmrYjlYq3hsUb9LrauwmV/
         W8shyrweInisUwBrT116t1qsPJhvWXdfBd06/oyJ375O8cAP72VRRcQ/azUs0JJlwKZx
         3DzTaJorQZyI0ftAB2Z4lvfLI0nnGbIRnfEmXKcJpkS4fb5+oVzBNJQLie5nYRmgzNOk
         oWErE9MDna2Y4P+rLxyyC1ZgtQzd/lcvds5gXdJddXdc2la0znYA+vqCcAQgTnG5J8vo
         77AQ==
X-Gm-Message-State: AOJu0Ywhuds26pHyoKQn5tig1oHeXOTk0k/fvQFwlOAWRcfhmu5GQ5vW
	RbzO0jE2GM8iZrYbas5Dy+17n3D7Jx56ezC+ck1bttJnQVFXiBy/HpeYh6bU5HylwNT9e48NAvO
	V/pq3
X-Gm-Gg: ASbGncvQvoyNSP3RV1ugqtOdPoU8TTDJAW9Q6R18clZ+xD4d7y1hFd0F0HoffroxM68
	Y+Pq23fo2aRrMLkrkY+W6pn2l2EPc7O8+pDZmsq++/n/Dlb07K0XTzTY0Kd4qNFvNgbBVGRL+bB
	Kevyr3e4AYlLXznN9ZY53vSwP4G0tYFXZPAYuoozLafnz7ZBe4umuIgPVg7D1otcWC7I6a6uHMN
	ufZqxGh0I3UJuMd/JwrBfLpvzxhrllKVFrF9MUZR6FPP/rn1L8b6BhlXAA4X8kyPYT+CBg3btiW
	h1vFLgMXbA3aYcVi84bmZ5O5DwG7rx/Qo90Asy2b5bG/Z3eQiz/2iRjbqMbnTw==
X-Google-Smtp-Source: AGHT+IHT+x1bXD9VP4n4gXHsME7KhEB7XkFIWRQM6Y47ObixU0hopbdl14D5eiQBNFc4FZJFOCVmnA==
X-Received: by 2002:a17:90b:3e8e:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-30e7d5a93bamr34284005a91.27.1747893358872;
        Wed, 21 May 2025 22:55:58 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6e609sm10581840a12.19.2025.05.21.22.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:55:58 -0700 (PDT)
Message-ID: <c3f5ae11-1333-4267-a07d-ff4112714cd5@daynix.com>
Date: Thu, 22 May 2025 14:55:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/20] contrib/plugins: allow setting of instructions
 per quantum
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-9-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UYz9JFF+xDcE

On 2025/05/22 1:42, Alex Bennée wrote:
> The default is we update time every 1/10th of a second or so. However
> for some cases we might want to update time more frequently. Allow
> this to be set via the command line through the ipq argument.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> ---
> v3
>    - error checking for ipq
> v2
>    - checkpatch fixes.
> ---
>   docs/about/emulation.rst |  4 ++++
>   contrib/plugins/ips.c    | 15 ++++++++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
> index a72591ee4d..456d01d5b0 100644
> --- a/docs/about/emulation.rst
> +++ b/docs/about/emulation.rst
> @@ -811,6 +811,10 @@ This plugin can limit the number of Instructions Per Second that are executed::
>     * - ips=N
>       - Maximum number of instructions per cpu that can be executed in one second.
>         The plugin will sleep when the given number of instructions is reached.
> +  * - ipq=N
> +    - Instructions per quantum. How many instructions before we re-calculate time.
> +      The lower the number the more accurate time will be, but the less efficient the plugin.
> +      Defaults to ips/10
>   
>   Other emulation features
>   ------------------------
> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
> index eb4418c25b..f1523cbee3 100644
> --- a/contrib/plugins/ips.c
> +++ b/contrib/plugins/ips.c
> @@ -145,6 +145,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                              const qemu_info_t *info, int argc,
>                                              char **argv)
>   {
> +    bool ipq_set = false;
> +
>       for (int i = 0; i < argc; i++) {
>           char *opt = argv[i];
>           g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
> @@ -175,6 +177,14 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                       return -1;
>                   }
>               }
> +        } else if (g_strcmp0(tokens[0], "ipq") == 0) {
> +            max_insn_per_quantum = g_ascii_strtoull(tokens[1], NULL, 10);
> +
> +            if (max_insn_per_quantum == 0 || max_insn_per_quantum == G_MAXUINT64) {
> +                fprintf(stderr, "bad ipq value: %s\n", g_strerror(errno));

This check should follow one of ips.

First, it should check errno. Otherwise it may emit a cryptic message 
saying: "bad ipq value: Success".

max_insn_per_quantum == G_MAXUINT64 is unnecessary. A sufficiently large 
value of max_insn_per_quantum should result in the same behavior anyway: 
a quantum never ends.

Following the check of ips is an easy way to implement a correct 
checking and it also ensures consistency.

> +                return -1;
> +            }
> +            ipq_set = true;
>           } else {
>               fprintf(stderr, "option parsing failed: %s\n", opt);
>               return -1;
> @@ -182,7 +192,10 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>       }
>   
>       vcpus = qemu_plugin_scoreboard_new(sizeof(vCPUTime));
> -    max_insn_per_quantum = max_insn_per_second / NUM_TIME_UPDATE_PER_SEC;
> +
> +    if (!ipq_set) {
> +        max_insn_per_quantum = max_insn_per_second / NUM_TIME_UPDATE_PER_SEC;
> +    }
>   
>       if (max_insn_per_quantum == 0) {
>           fprintf(stderr, "minimum of %d instructions per second needed\n",
