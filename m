Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1518907njb;
        Fri, 9 May 2025 21:42:44 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-30c3d3eb4e3mr10999897a91.18.1746852164461;
        Fri, 09 May 2025 21:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746852164; cv=none;
        d=google.com; s=arc-20240605;
        b=T3repA/0Ji2rXRN/T8ouuiLZJNA7xiNudor3QwlrlSa7HewBcqltuwSlTXnBIzGpQA
         JSMT8jEB8JYQE2U6g48F02BxbFRwUl+8f8UuBK9XQXkuXAQ0IhuGN8wNuakz1S6cn7B7
         lVF2HFFhCR1PEIZp1wHHAM8HuTmx95I7PUS/c5WILnjlzwjzCG7Qg7LUThnD2aJc9E/I
         2V8YsaycptDmk0aPSGWJuGZxPwhPzmkBUoVuduV7VPMt+TGO6wEtXrWpzeBMl7ZWhY9p
         bu/e9eeJJNnycTRC19ZOyBvQ83qK5fxXr30U2Eo6KLOUTWgo9PRx7ht6/4Q1cexGBrwB
         IbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pKj0+92XPB0tm2IzBJgADrWacxZv1TgpLy5sr0GANuY=;
        fh=ZHcH16rPeTNtLnvhEH+sm1+eIB2p2w58S6Iys3eeOi8=;
        b=giKyJ7O2b4JwHCx2Z3dXDoXulxcBmiO/QiRZxvsDTSqw77X5aDCHc5hvg9moSmZX1O
         naaLaoPJ89XLwt6keiW1kuD2xds8PfZhbOKBo21qRKBngQjuIxC6V68jhotGh2iuoD6T
         ecupPVf49xX95ees/MnvBPjAtPpCIlCz3cpS2X9yV28vPspLcHbAg/JzUZXZPoE46qLg
         FavbZV4jh9ln5vAwS6kIJdL9rB3xpo1w53F6QMLpAqKQ2w6UL8vcnzYWMZPNm5NFj99+
         aiJRmbNWFP00BK8z4h9woisV3TAn50uCpZr4JVgArCRaIn7KtPyRTPtwz5H7CwkLBXze
         ttGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=LdpXSnas;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30c39ed0ec8sor3277425a91.3.2025.05.09.21.42.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 May 2025 21:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=LdpXSnas;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746852164; x=1747456964; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKj0+92XPB0tm2IzBJgADrWacxZv1TgpLy5sr0GANuY=;
        b=LdpXSnasQwolaYAWpa1FxvmHPPcgscYVB4NYed7Z5cygVnHOojyRwlg6hBBwwpNAct
         SDPkWffeUVzqqkzj4e0PmB1Gd7vvnD+o98rW5QJ/etmfbs1iDVHmsO/Eyw+yYbThbjTV
         ND42SwoMjEdEJfO2KVIjQypmBi2vxrHkc2Q8GTInghKrK40JFB+9iGH8QNMyPpQmvuot
         EGHxuqfnEGmHn+o9w49tQc2a3sjYFFDEr9daIKrIYlKrXtFv6UPbREpSJu/FKEM4sHwq
         ttp2C/9M2lknI44BaqEhFk0nIXQwosHxzhogc3NI3VoeX4IWTJYf8Kq5VIibjwS2DS2B
         JJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746852164; x=1747456964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKj0+92XPB0tm2IzBJgADrWacxZv1TgpLy5sr0GANuY=;
        b=VsMa+vWCtLw3oxPgxNL13utcDSUAZ10FrQFUbnHGxDdKpcdgh1BMvtOHQBq9dr0rB6
         65tpBPXX8P1knMD5LHe8KNDY/R1lPuBHCf47fvmOFI5b1TSPnfioGwK7+gQFdJzJx/jF
         tM93tnvzXiW2buJqh0ljwzUFKyOEexKlAw9K/i1u1Tjz1qV2DYU3KF9EBsiK4FXDfn7E
         rfKedrckSSSWHpnrIRpd8Y0URaTsTqJSH/PBoXgBPogj38jP7+ssFovm/Qeh9m4sw7dh
         1+rdTcPOyOUgmK/Jjhxv5jNVhptXOpUXEwM8jbPlIk59atmX1DUI692YEnFAumiUlAfJ
         ROqA==
X-Gm-Message-State: AOJu0Yxp2VL/IFCO/tMaLjHOWs64q9uwofw+dcQ6+bL8WB4edt5WepPa
	L47Fcey6r020BMuJRZe96WkUJsryAAkhp9QKoNi9bb4w/iB0XA+xsF1DlIiNGf0aYZKz1c+2KJc
	w
X-Gm-Gg: ASbGncv8jGBYffTsgGv4N8s8oIgcCC0zcVZrEX1a0/VQ+TLpu3mOW6eE0dIq7cHrTq0
	5RufNTdNwfKEzS47bFs989D77J7Uj0dQeU63n9wFLoaeV0jaUMRnNr6u8/3r4270bgIy5yGlof0
	COHPhma4A+RN/fN2GcSN1K9wHfJxOr2wBTN8IPTl+2vC3N7DVXQ/jbAt5817pTJUy00JhqIPy+z
	ac0UGXng7oyvZJunWUTEEwF/iKa5CJK4GasS8x/FTJwzFWkWVy9QUX7+GqXbMMrj4WyhrQrFm/7
	7rFjHvYfgEMOqlmuqt4usnytSkyDYduDzaDVijJAPee8yBDpJlAGMQlny5udVg==
X-Google-Smtp-Source: AGHT+IHfBq0rzikQMG7X7NlwScAD2E0MqGgqTMZKI44qGpJNGbd+9I4OMMDi5xYz0ZOR2fgUcih/Pg==
X-Received: by 2002:a17:90b:55c4:b0:30a:dc08:d0fe with SMTP id 98e67ed59e1d1-30c3d3e83c7mr10742320a91.16.1746852163791;
        Fri, 09 May 2025 21:42:43 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d56976sm4957693a91.27.2025.05.09.21.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 21:42:43 -0700 (PDT)
Message-ID: <cabfe49b-38af-4ecc-a338-1fe175dd7226@daynix.com>
Date: Sat, 10 May 2025 13:42:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] contrib/plugins: add a scaling factor to the ips
 arg
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-6-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250506125715.232872-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ARpoaXQtDPtC

On 2025/05/06 21:57, Alex Bennée wrote:
> It's easy to get lost in zeros while setting the numbers of
> instructions per second. Add a scaling suffix to make things simpler.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> ---
> v2
>    - normalise the suffix before a full strcmp0
>    - check endptr actually set
>    - fix checkpatch
> ---
>   contrib/plugins/ips.c | 36 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
> index e5297dbb01..9b166a7d6c 100644
> --- a/contrib/plugins/ips.c
> +++ b/contrib/plugins/ips.c
> @@ -20,6 +20,8 @@
>   
>   QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
>   
> +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> +

G_N_ELEMENTS() is already available.

>   /* how many times do we update time per sec */
>   #define NUM_TIME_UPDATE_PER_SEC 10
>   #define NSEC_IN_ONE_SEC (1000 * 1000 * 1000)
> @@ -129,6 +131,18 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
>       qemu_plugin_scoreboard_free(vcpus);
>   }
>   
> +typedef struct {
> +    const char *suffix;
> +    unsigned long multipler;

I prefer to have an explicitly-sized type: uint32_t in this case. It 
also saves typing several characters as a bonus.

> +} scale_entry;

docs/devel/style.rst says
 > Structured type names are in CamelCase; harder to type but standing
 > out.

> +
> +/* a bit like units.h but not binary */
> +static scale_entry scales[] = {
> +    { "khz", 1000 },
> +    { "mhz", 1000 * 1000 },
> +    { "ghz", 1000 * 1000 * 1000 },

Having "hz" as suffixes look a bit awkard. "1 giga instructions per 
second" sounds natural, but "1 gigahertz instructions per second" 
doesn't to me. Practically, it would be easier to just type "g" instead 
of "ghz".

util/cutils.c has similar code though I guess a plugin cannot be linked 
to it.

> +};
> +
>   QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                              const qemu_info_t *info, int argc,
>                                              char **argv)
> @@ -137,12 +151,32 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
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
> +
> +            if (endptr && *endptr != 0) {
> +                g_autofree gchar *lower = g_utf8_strdown(endptr, -1);
> +                unsigned long scale = 0;
> +
> +                for (int j = 0; j < ARRAY_SIZE(scales); j++) {
> +                    if (g_strcmp0(lower, scales[j].suffix) == 0) {
> +                        scale = scales[j].multipler;
> +                        break;
> +                    }
> +                }
> +
> +                if (scale) {
> +                    max_insn_per_second *= scale;
> +                } else {
> +                    fprintf(stderr, "bad suffix: %s\n", endptr);
> +                    return -1;
> +                }
> +            }
>           } else {
>               fprintf(stderr, "option parsing failed: %s\n", opt);
>               return -1;
