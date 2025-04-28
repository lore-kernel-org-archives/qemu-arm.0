Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6104345njd;
        Mon, 28 Apr 2025 09:56:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f4f:b0:1fd:f8dc:7c0e with SMTP id adf61e73a8af0-2093c7e3001mr263047637.12.1745859373941;
        Mon, 28 Apr 2025 09:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745859373; cv=none;
        d=google.com; s=arc-20240605;
        b=gCwf+m0l4re7sZCdSceXiWn6444P5Vc0jSFqWNHeHQYTXTblzxkCxWNQlK4Nv/obdS
         R5FwMM2t3qa00UUVCU013cO2X3rdvbH2DSJTYb78u1MkyTcur0Rd8BMGWA8tv74yoiLU
         0ilfaTAS/ajMlfvk1wYZNqp/ZcfvZTjMnLoep2yBZ1k9XhfKgkCkWbEM6Af3UT0WErOw
         NgBCnGOX6T6ocM6PLatAWDNHLk0PPV9cnAFrOxEyxJYOueQoHc+na0rsojUQf716nwjI
         KF3Hti0Ve79wRE7v14aN2o3eEi6A4Ma1CFyPaz2rznplUC0q8N2mHHx3ZLhE3MuPQ/NL
         VZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T0KaVqr4Ya2Lhmm7Rv9ZGRlR9Ju5Y9CQh4xXn4kVikI=;
        fh=j9FrG7sAAwroZdkqoiCD7M+owrUR1dkXcZ1pHKxE6V4=;
        b=U6c7mKn6CEUdezm2WGrjBNuJtxXY9b+7PmZ8N/0oW+cnfV1r+2cW5qfrvWsCfZjVnf
         +MVIJGYqMc8MxX1m5uPGdchlOBO7hLBJFZHSHOgjNg62AQqbvh8izLKjbuqDLZbq+rRj
         RQg0qnNw8LqH95FFnf6rP3bYacygTtOHpjBVoOAbJQpurBV9WnIAAvBQ3Fneu2Eo/Yre
         MT6S9KIPY8rvQR770XbEZkBbNbdyG1ClQQq+I674rQDiGqo8ksPIxvalO961R7VgFiuD
         pFvWlzVgjRsuVSI9Q7aS5uNrC1gPBfkIFAVrbD0tX2Enf6boQ43km/wC+DrzxPTU3csE
         7RZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l33lnwGe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b15fa42cf3asor5283951a12.5.2025.04.28.09.56.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 09:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l33lnwGe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745859373; x=1746464173; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0KaVqr4Ya2Lhmm7Rv9ZGRlR9Ju5Y9CQh4xXn4kVikI=;
        b=l33lnwGey/EXxcUIlJgojhsy4GsL3Tcak/Cgxj+s0sKNrz7mJuFof1f7Orbh9YNUnt
         Q6joY40ugxiHgvJ/YcWWMZgHIO9REVTuR6xY3fdnpvGoUMt5n7N5Y79qQJtqRFZT83c8
         jS9fV52z6dJTTU0Dm4+G1fRnwgDRfQncPgkyz405MpErM4zGekZJ5LqqnFX6ZbPUHTc5
         d2UoXwJEeHU2tqIJ5yYeq62e+q6lwZR/HeAfvwoauXQRaUd7b4T8cgMmsscUT18i828f
         +ndZ7K1K460seaQi99j8OATPd6p2616c4cEYb+79L5Ly5ihmvqEbKKHiU9k7qsM7Al4L
         avwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859373; x=1746464173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0KaVqr4Ya2Lhmm7Rv9ZGRlR9Ju5Y9CQh4xXn4kVikI=;
        b=C3+qyY11kgcP1escU/CV9/mOJu4xqBHwY0WBpT6DFoqZ0BGBzzgoOP6+SnF/JgT/1j
         XFfniMZJin+RuOGjC6CPgbwiSyruzyWpPF51i9g9JFPz8mrdwDwWAMyreYuJGgomWhqp
         xhmsuHFmvRH0sFtkCAF1CQQOM55i8DxJ30Mw0fufxHBxb4o4jtYWUM4vHKwnUSRPfHRF
         FeJXBduW5M7iD28oqT7q8RE+L0TWPktG/zOV8qfk1jSVDnh2nHomrko07BvXjJroIomE
         07b3hf7M96jsvqQsabchJkWrnJBVRdZB0HsrjajKcjaqOptujHjD6e+8euL4iJLmYIu0
         jW7w==
X-Gm-Message-State: AOJu0Yxm46vBhX0WBC4o30AAEE2NVIZlrnnve9owXYmvCdesOscr2lq/
	VI5Ep5oaDIPKiho/EOtDDFpXiedX81Zekg9ZOdaVye7TrZIaDITe/VXCchpmhyUW2dWDpwYzTSK
	txks=
X-Gm-Gg: ASbGncu4BRP2h3LPPdRHUZ4I3ROuFqzCFIZNF8inJ4Ql3ZEmdRDiLPuMXSzdlExhNGU
	t/CV79vSkpTfdN8rizuP6fb50OgaVKa0FN5w7BJVeqM2zoZblKwDQpgZcxt6+wSapug0mKhfl26
	P9VMUqyouMJ/mghCFRQ5s6U5w2ogFV5qmyzNbyO3WP9qFkxnVPHy+V3Dzm05E6x+LomemksuIDq
	dn9Ry6AndJuioCBxi1FCu92o1DmyjYIxpl1ThsrXCnRdV1ktgYJTPmUw4m1rveObvWrWDX+giEu
	V6kqmqClDbCqWt491aRH2NFIGK9LsoTr/m8WzscfSD77fJk+qJY6Uw==
X-Google-Smtp-Source: AGHT+IFWDW/naykJRmwiHJrpKMrDij+sH4NpvuvkN/q4hd+zMKFtEvhLJ0JOLm668nkejInRHYYbDg==
X-Received: by 2002:a05:6a21:31c8:b0:1f5:520d:fb93 with SMTP id adf61e73a8af0-2093cb057e0mr374850637.24.1745859373476;
        Mon, 28 Apr 2025 09:56:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25ac87d5sm8239698b3a.157.2025.04.28.09.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:56:13 -0700 (PDT)
Message-ID: <7f047917-75b5-46ff-9069-3da224931777@linaro.org>
Date: Mon, 28 Apr 2025 09:56:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] contrib/plugins: add a scaling factor to the ips arg
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-5-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250428125918.449346-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H4rfXUn5uxkv

On 4/28/25 5:59 AM, Alex Bennée wrote:
> It's easy to get lost in zeros while setting the numbers of
> instructions per second. Add a scaling suffix to make things simpler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/ips.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
> index e5297dbb01..1952e0866d 100644
> --- a/contrib/plugins/ips.c
> +++ b/contrib/plugins/ips.c
> @@ -20,6 +20,8 @@
>   
>   QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
>   
> +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> +
>   /* how many times do we update time per sec */
>   #define NUM_TIME_UPDATE_PER_SEC 10
>   #define NSEC_IN_ONE_SEC (1000 * 1000 * 1000)
> @@ -129,6 +131,18 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
>       qemu_plugin_scoreboard_free(vcpus);
>   }
>   
> +typedef struct {
> +    const char* suffix;
> +    unsigned long multipler;
> +} scale_entry;
> +
> +/* a bit like units.h but not binary */
> +static scale_entry scales[] = {
> +    { "khz", 1000 },
> +    { "mhz", 1000 * 1000 },
> +    { "ghz", 1000 * 1000 * 1000 },
> +};
> +
>   QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                              const qemu_info_t *info, int argc,
>                                              char **argv)
> @@ -137,12 +151,19 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>           char *opt = argv[i];
>           g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
>           if (g_strcmp0(tokens[0], "ips") == 0) {
> -            max_insn_per_second = g_ascii_strtoull(tokens[1], NULL, 10);
> +            char *endptr = NULL;
> +            max_insn_per_second = g_ascii_strtoull(tokens[1], &endptr, 10);
>               if (!max_insn_per_second && errno) {
>                   fprintf(stderr, "%s: couldn't parse %s (%s)\n",
>                           __func__, tokens[1], g_strerror(errno));
>                   return -1;
>               }
> +            for (int j = 0; j < ARRAY_SIZE(scales); j++) {
> +                if (g_str_has_suffix(endptr, scales[j].suffix)) {
> +                        max_insn_per_second *= scales[j].multipler;
> +                        break;
> +                }

Could we add an error in case the present suffix is not recognized, with 
the list of available ones?
As well, can lower the suffix string, so people are free to use any case.

> +            }
>           } else {
>               fprintf(stderr, "option parsing failed: %s\n", opt);
>               return -1;

With the remark above,

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
