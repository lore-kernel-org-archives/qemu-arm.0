Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp147988njc;
        Mon, 19 May 2025 16:24:56 -0700 (PDT)
X-Received: by 2002:a17:903:41cc:b0:22e:1791:2e5a with SMTP id d9443c01a7336-231d459a551mr247270775ad.35.1747697095787;
        Mon, 19 May 2025 16:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747697095; cv=none;
        d=google.com; s=arc-20240605;
        b=J3pIJRAQHuGubjKOCCEza6wt1RXURoF0JV8rKsLTEC3umYQdF3tdKuZuzYu+7yN/Rz
         8kh3NvnpSkgg1Y/cvw8gXfC4vQ4MQly7yCtAyMCi0JkElnKL7WOVFf6p6qWw1s0Ks0qC
         T1owN/IQMOyLX9Ps8ObZQgJ3mjw6fqSVhsGz6IIt6OidMtCO9UkubtqxLt0rHTwIw05E
         ZUSvVdFS0fMRywokXv53Gwx66wIif4iJ0UlW05RZsDMSQIvWH5+97Rh00hTgHmcWZWtZ
         uiXm6m1ZGp7eEp4fYs7at/EnlRRo6b/60sh65FW4XAUgOGNk4rLxTlGiX/Xw4fvIk84P
         mzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tZaq0aPbjEuS7KoDg8k+HasqE2XJEw/76A9C+uBVdwg=;
        fh=6neRkkP/FZdBsucIFdsAh0bl0YpIU8nHs7OwNqE9Qmg=;
        b=YWweS/E4ezgEqlaIpwquVSIAeYaQlyqv9V84dxq0gG1vGiFjYkTN6fo/qdIjOhoovw
         jpCwiQ1MlI0d2v5G6vrxSScvhc6JZBeQGIYNPKLg0z0fb5/MW+Y7+FvDU+xObKh8Df9O
         8skqjIvyQdd98VtRM6y+j8loWKzv0OzZNIShybOmC4AQOgItpplNJ0BNG4zEL6ICFQLn
         jnzyuBBv2B15E9V3FYqjfhV/NMNeHU986tSwsDH9+amTV/uVcCs654Ykm5YZXMsSSO9m
         l+HN+2zkX70C+SBVGXmdDLCSbbcSWEN3DF7dilo34ZBU+KYAOVTEGxrp+tXLpmoful0Y
         5lMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="t/Wgqi19";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d4ab4d77sor51647355ad.3.2025.05.19.16.24.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 May 2025 16:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="t/Wgqi19";
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747697095; x=1748301895; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZaq0aPbjEuS7KoDg8k+HasqE2XJEw/76A9C+uBVdwg=;
        b=t/Wgqi19I+ETIPJx3s3kXdGf8x7Unvexc45llA0M4P7Mp3QJERJgrowlpjamuiKTd+
         S9UD7J1GZ54KX2JbAPZH2D2nIbdNn2cWFFPcledjK7jY341Iygb4kyquE2TMVcIstty8
         i/m/r+/kGZ+y7HiJYZV4z32yixrYQ/zKM4cKKMymwQzge4CdNg+frAwhi1337aOnuHOV
         kxPL4An7LBCUyfP6m2Mez+AhTizlatBw5IcL8HoTkveAZujodMsnsUaB5kUbMe6rS0K2
         jo/vEyPwjUQBSfCanwf1jTnpfSZBeJ22Y3Ycadhf08CUtnhvAQ1OHoaZ6GtmCYfTiSDL
         t3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697095; x=1748301895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZaq0aPbjEuS7KoDg8k+HasqE2XJEw/76A9C+uBVdwg=;
        b=uH2t/Immr2N4DcjBZwkzsdq4tEGlFcqypUUouMlAYbkBnvX98ab97I9FwBGiScG1AP
         1OO4xZMcYXVUdgma4khTfntb6zwD6X4yltrPHg/9TJlZbXlojbQ5lKaEd/6hOLGmBs2m
         jSiepDyWKqqimR4KTflcsIRw12hMxlmxQUTDT/fNp4Ma6EUa6iZu0l6dwFwqtF1cx8HR
         xoVtPLjyB4HXo3Nj/L/lW5etfxqLbVPlNyXqUnP2aFZc5Wtc47IpxbxIqZZXiDFr/DUv
         3IB8wiVZt6dXU1dMU5IM+Kgj7LAul4K42IAoG/1z3qk9EfBdyF56WAgqnl7JTBXtnG9y
         PPNg==
X-Gm-Message-State: AOJu0YysYdcCjsOL0ykjf3b8ykUC4yF+KBCSal814k/FQE2SjriRPmDV
	uGvXuSOCflZeDdJTifle9jP3zt5zyF7eP+UgsiUoeeE1wcsK4aTmkj+d3qK2YPshuWJotI+NFDa
	R336+
X-Gm-Gg: ASbGncvKbm1zMoZ/MGNzLG4exq2r+QNKb1+WapUJRmU0Mzk1dwa6mn0JbZgcowP4bYf
	EclT+SDAg2qQ0Od0h7fzhoA2BvbTAmFPC/FyAjaZwChWsEdc19LxWA1yUcnXkQ76TUefmaZKQ/r
	7q9IMkc+71nCjx1DHbv/OZymLRT8LQK8LVm+qshKtEFcWAwkvU08pJuO8zZ1nvim60ooPirkMol
	7imw4ohyxzlRgD0bQarf5N9Zp7rnIsOWobGpF6NoBzrSl7SEfMYoLiSrxw+V5wR0p5hmKohez4/
	Nmk6sSuzTtdtsD2sUzyMxbxikSqn+ShXSCKVFBhO+C9GPoo2rOsqJjCedDhPcpg7mZHjEzrE9s7
	c6OUfDhoxBQqpe8oIY5pReAAFkFaTRQ==
X-Google-Smtp-Source: AGHT+IFP8+sIiE59Vx0jHwK+PrTvgGzZQD8Cx5IogWshJ38KRfnIyY98LnBja0OXcuk/PFt9DyBaYA==
X-Received: by 2002:a17:903:1a68:b0:216:393b:23d4 with SMTP id d9443c01a7336-231d43d9bd7mr216951515ad.11.1747697095103;
        Mon, 19 May 2025 16:24:55 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:b783:b00:4952:3c52:120a:27e9? ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9567sm65447585ad.11.2025.05.19.16.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 16:24:54 -0700 (PDT)
Message-ID: <c790b6c8-310a-49c7-868f-cf88e42b9a88@daynix.com>
Date: Tue, 20 May 2025 08:24:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] contrib/plugins: add a scaling factor to the ips
 arg
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, David Hildenbrand <david@redhat.com>,
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
 <cabfe49b-38af-4ecc-a338-1fe175dd7226@daynix.com>
 <8734d0slbr.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <8734d0slbr.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Xe9HNTz/3L0f

On 2025/05/19 23:54, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/05/06 21:57, Alex Bennée wrote:
>>> It's easy to get lost in zeros while setting the numbers of
>>> instructions per second. Add a scaling suffix to make things simpler.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>> v2
>>>     - normalise the suffix before a full strcmp0
>>>     - check endptr actually set
>>>     - fix checkpatch
>>> ---
>>>    contrib/plugins/ips.c | 36 +++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 35 insertions(+), 1 deletion(-)
>>> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
>>> index e5297dbb01..9b166a7d6c 100644
>>> --- a/contrib/plugins/ips.c
>>> +++ b/contrib/plugins/ips.c
>>> @@ -20,6 +20,8 @@
>>>      QEMU_PLUGIN_EXPORT int qemu_plugin_version =
>>> QEMU_PLUGIN_VERSION;
>>>    +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
>>> +
>>
>> G_N_ELEMENTS() is already available.
>>
>>>    /* how many times do we update time per sec */
>>>    #define NUM_TIME_UPDATE_PER_SEC 10
>>>    #define NSEC_IN_ONE_SEC (1000 * 1000 * 1000)
>>> @@ -129,6 +131,18 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
>>>        qemu_plugin_scoreboard_free(vcpus);
>>>    }
>>>    +typedef struct {
>>> +    const char *suffix;
>>> +    unsigned long multipler;
>>
>> I prefer to have an explicitly-sized type: uint32_t in this case. It
>> also saves typing several characters as a bonus.
> 
> 4Ghz would be a reasonable size and that would overflow a simple
> uint32_t unless we start casting.

unsigned long can be 32-bit so it should be uint64_t if you want to 
avoid overflow without casting.

Regards,
Akihiko Odaki
