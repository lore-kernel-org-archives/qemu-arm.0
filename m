Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1640464njc;
        Wed, 21 May 2025 22:45:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:a88f:b0:736:73ad:365b with SMTP id d2e1a72fcca58-742a9831308mr30816727b3a.14.1747892756615;
        Wed, 21 May 2025 22:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747892756; cv=none;
        d=google.com; s=arc-20240605;
        b=av2xoNfW4oJG3DOXJ8GYTQmO3J4Kj0PZ5KkdVSEKx86YVMZhQzrrA1roNju6e00fgO
         1NIlh4OtOLbhRwQmfb1103/ZVViNYjpmbVADOYrq1t0+Zw+Az8I4kAKTJ6RidBs1kDJ3
         EHamHdditZrrAABwvimQzSDUmP9uE/WvCzmPyeo6WogsQDSHh22xK95d0mgHCoeObsdB
         JySfrZyAPW53+xCTwRPPu0nJtjrkw/GotLLfo8d9M2+QFyBT8+Gpe02OQX6wYoFiqBz5
         YxwHKTClOZm+5V6S7gBDo+NdUxgT//n28ADUWFdRtk0qV5yQb81GL3zRi2RK/zDH+m02
         uVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vridlo6qQCo3NODDccBj5zdty2ixnQZBJifxBZfzpAM=;
        fh=0BpcUhEAu/ygqO2hQQNVjK8pf3EEaf00vml9Hn/yKkw=;
        b=iXf81P73S3WHBScBldur/PYMb7V3m82ZsS08kaz+uayy0yylM0v92fmCmByhcGq6lV
         X+B10bk92HKsXzTKGtHsegOdKkya74+NUDvxuG0zaO4Me4sPEbz3UJtbXpfgdfEvqqZ+
         CZtn4ewU1v1jJPClGuwtN0N8EV7pux/+P05gnh1W3n3Ryb9Yn16vwGSRZuuOaOchc4We
         MLQAAo/xfAZb3EK/zD53R145OGAXsVWL13DHSvyF/7cE4ADq4J1JhUfBusd/wvVI3w4v
         ugWeSI2mjY7Xx3ibPwlSqYt51zqB7ALPY9sLEFcDQWnXoBunpFfHpKvtydxZJ61LuniG
         cvoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zZgohAdK;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eb08fa40sor10439860a12.8.2025.05.21.22.45.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 22:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zZgohAdK;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747892756; x=1748497556; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vridlo6qQCo3NODDccBj5zdty2ixnQZBJifxBZfzpAM=;
        b=zZgohAdKuQfBVBpUXMgIWkaErxh3pZfOWfqqcBvTk1dIEArQZulcMC5UFyubr7KJJg
         oIywSW8rt+cHae7Tki2wP/EvftZJKGRiO4TXCzna2ieSBBGOJrD8WqPK2MUCPd3BV9ir
         28/cDpc069gt9obfKsCaUylu2t0LozJeNJaPqBLYjtHy5ejgWVnZlKub0K+EswTciGs5
         XKkyF09tScc2LpIt6ZKYqAA/crQC9lluAD+d1Apj1L55rbvcGPVCFI4iGS2z1047sAj9
         /7IJ00mOsr7YNfPxxfTavUusqK+KWropEtsWoGS8QEq0W6GTC690joAJSg4Uzo4keHaP
         Iekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892756; x=1748497556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vridlo6qQCo3NODDccBj5zdty2ixnQZBJifxBZfzpAM=;
        b=jCzDX/wayst6KCKLIWIf25GP3Pbf60lO4pbMxclMWrIXqycKLePYcR945r8aINiYG+
         JL87II4FSJBg6wMOO+tC/PAhq4OJGXniOcmdPB1M95Wib0L2jfeLp0G2YP756HB7IMMv
         /gLabPMviM9ZDPuiMUx/wt/h09XRW9k6IvwSpyntsPkRUamb1pfcrbDspAiowqSrVFWI
         z0V7o8bZ/9yUEcl+FORfHEKAnITNFy23yprMemyPJ0vagQ1JDxXPDF8O7BZ1OBRQ1+ff
         2oYftza9tDkcj+D37VRGg5feJcRw8FMYk/ova6RcTG0XvvyuGcCAQzPEZWsvQg4KDG5l
         f1dA==
X-Gm-Message-State: AOJu0YxTqqBt0jJFUXArn418oRJHY+fgynIuIrBPlVM2CsHE0rOtVXqy
	FP4ExwXJ+i9qb/zxyBnaEmc8cM8kfhBl0v/FmQqDjthGp6WQoLdkC2Wf/GJmlhLct/sIcqz4gnI
	Ohqo6
X-Gm-Gg: ASbGncuPM3tu6nj/iswjahWqwYR9BE+szETfVkZEvdjUMwP5hvUTSn84YtwpicIXTP6
	Ig4nlsR9Zll4PI1eAO8HSIBwTPA+0/KLrS+bu91Q2py+NLJOnefOuOeOE+WyAzv3kWZf7+Xxltw
	+RS1pO0z2J5VFIrxBJApUNvXXir2v5nFsWl2YlfKVbEWPXfg6HloyCQJnrdwPlAIUzusfx2lSDX
	ynH2Z+i2diAfCQC5g3Ofhe30vhRh4BZhUvrs/UxvUlS0G4mz4JjpvqqEVzXyTtolXqkwxUeWo5Y
	crA4X51BzZ2Cmi7KWEm/TH3ielKyJpGlTfkp790d0Vx8oNAkkSSIHnRNZseUoA==
X-Google-Smtp-Source: AGHT+IHnDxQBWkuSpF23l+n5qWSU7kgnedR8lLOx4kEnAuPmd7bVoid4joG8z8ac/0StnzDG1A9SJg==
X-Received: by 2002:a05:6a20:2595:b0:1f5:64fd:68ea with SMTP id adf61e73a8af0-21621882852mr36594161637.4.1747892756011;
        Wed, 21 May 2025 22:45:56 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398ecsm10472562b3a.79.2025.05.21.22.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:45:55 -0700 (PDT)
Message-ID: <2aece273-04e9-48ee-aa97-dfe1d8c0d6d8@daynix.com>
Date: Thu, 22 May 2025 14:45:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/20] contrib/plugins: add a scaling factor to the ips
 arg
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
 <20250521164250.135776-8-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7M+EnEwpxHgM

On 2025/05/22 1:42, Alex Bennée wrote:
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
>    - scale_entry -> ScaleEntry
>    - drop hz from suffix
> ---
>   contrib/plugins/ips.c | 34 +++++++++++++++++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
> index e5297dbb01..eb4418c25b 100644
> --- a/contrib/plugins/ips.c
> +++ b/contrib/plugins/ips.c
> @@ -129,6 +129,18 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
>       qemu_plugin_scoreboard_free(vcpus);
>   }
>   
> +typedef struct {
> +    const char *suffix;
> +    unsigned long multipler;

As I suggested for the previous version, let's use uint32_t or uint64_t.

> +} ScaleEntry;
> +
> +/* a bit like units.h but not binary */
> +static ScaleEntry scales[] = {
> +    { "k", 1000 },
> +    { "m", 1000 * 1000 },
> +    { "g", 1000 * 1000 * 1000 },
> +};
> +
>   QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                              const qemu_info_t *info, int argc,
>                                              char **argv)
> @@ -137,12 +149,32 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
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
> +                for (int j = 0; j < G_N_ELEMENTS(scales); j++) {
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
