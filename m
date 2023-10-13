Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1532614ejc;
        Fri, 13 Oct 2023 07:05:21 -0700 (PDT)
X-Received: by 2002:a17:906:fe07:b0:9bd:e036:387d with SMTP id wy7-20020a170906fe0700b009bde036387dmr910617ejb.21.1697205921496;
        Fri, 13 Oct 2023 07:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697205921; cv=none;
        d=google.com; s=arc-20160816;
        b=I2YRyB9lNs+KbRcoA7eGQPguQmRHVkIl1ad+gqc8huWP5ckslcapG3l1GUsVXMXosY
         dyLdan8bMUFjE4/ANDxAR9CSXU+NPEzVkkMBNgGzMtRUDcXR+0eGKSFjQu0tpviqATz0
         F1X9RteENuYGsgEJ4pzx8seGYw6YQjbATebkpM1a4gTsVpfUAzWA2bViwx4OA60oOnm4
         VKeMH3nI5B+9Xe+TYtyxuXLRRm7gn/PQRbd4yrzf+fLDgAFC+YYYF8J1XD0cgazjAu5o
         JUpp1t64fjY10qAps5uNZL5gFErd+lrY5TopQQ9SY6L/PZWBN0YL/HQ6rcvHacbe9VhO
         Xp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EzlKYbgiGyXCh1lKaxUmgJBbtAmhUCw0Z6tR5OnwLQg=;
        fh=z2Z0qjXqXe6f9EH4kzSpkfxh+uqcq7rYZmYetYlJjNU=;
        b=oXFy/KpAw7uIFgO05brZh5GMFbeMCpwKr+dIEq2DWKmli5iTTaelBH0nUrLmGhYCEd
         zW/VGzmk0yJmuFyzykrr1VlRkLWEhwVzM+TtCA07i8Eny/zwv/ymVR3OVZcNzlBc6/jW
         gm/0Fj6ZQYGZdvevWIiQLvizPErOgVOP7bDO8anlLYAmCsDmjdF0a0BLRjubTsuVUAfU
         3vMpoNrfYkyE7LScutMSwY/3npeT28NnXX42lmIiNK0VvNXdviqXU5TOCURu20STqV+W
         YXw0UZsTlUNJj4LpgxY8Wn5WkL69hytzEbzVya0x3QPTrvdZ8o+R5tkMw3xTfR+tVg+E
         tL1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EywUcrae;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ci17-20020a170907267100b009b2b43192ffsor6743638ejc.17.2023.10.13.07.05.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EywUcrae;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697205921; x=1697810721; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzlKYbgiGyXCh1lKaxUmgJBbtAmhUCw0Z6tR5OnwLQg=;
        b=EywUcraeJVwwc5aTVvQnSTAgcvIIMzqVse8yqJXUTWsz/YGvfT0UVZeMcESTsLv5hq
         gjMsyGGI/l74yrMI9mwxmG3o1YP0ggFWpcggnh6hzU78SvKpThehZQJy+bOaf3UreTO3
         rA8kflsApfYgnJLiSaQoOkSvAB+xF9gZuVBKodE1gigiCFCsjYUWCmWy+1nYQQklHFDM
         eXIujU5W7EUlfK/lb8YszPbaIdBE0Y3ZE6V0/MKDtjuGbXy7EfmNL9i7bZCJdSweR7c9
         YYElTmAYrKAVxwImIgSXxSxvtr099cRZyhAwNDH/FErzKXCEIzr4670dZs8DfnCCDZGm
         TUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697205921; x=1697810721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzlKYbgiGyXCh1lKaxUmgJBbtAmhUCw0Z6tR5OnwLQg=;
        b=iL3gGzBQKH/xzPaLiPoKlZIpXF+J0/z59oNamVpK0xxJSOgSDtmxy29Y0XmtxQ25ed
         d1azZHoCrXPEWwrp/PxohKqf7A51nwJvk5gBAp3EGy95fvkzGpsqykD9PLHLDsWWnk6l
         8p/HP5MFSYESLrlFnnbFb0pgMAGZKWVSAMgcgwSwvtqASWzk3U3TcdvePGO5aa1b0Jqg
         0C5MBAIS+xr2qpZxObDKScUe6PNG7E2Cd9lDfzBw9b4IOIAmVPGTAGhpSc2pHUTqfIV4
         2LjukKj8jg8cfaUhAMu5Sv6z9Vzygr97o7TERsYmFUu+Ry6CWO+tP9Fxuep3U76G8pYB
         SjOA==
X-Gm-Message-State: AOJu0YzHcofzvOwQZxBeXHM9Y3/koEGCNRSqiuFrybLNVUzXOpPJ/xjs
	NujWZlSliP/AyrS4QXElC4Y0HwHD
X-Google-Smtp-Source: AGHT+IHWdDI5+k6mh6QP9Xu71GRxahapYXjw1VFneGTJJKcVw+xb8AJCmu3w/l/URjhbCtInQATD+Q==
X-Received: by 2002:a17:907:78cb:b0:9a5:ed5b:241e with SMTP id kv11-20020a17090778cb00b009a5ed5b241emr22201524ejc.25.1697205921131;
        Fri, 13 Oct 2023 07:05:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id ov19-20020a170906fc1300b009a193a5acffsm12354893ejb.121.2023.10.13.07.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 07:05:20 -0700 (PDT)
Message-ID: <a4187886-148a-d8a3-b862-e0bced33e62c@linaro.org>
Date: Fri, 13 Oct 2023 16:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v2 11/11] hw/char/pl011: Implement TX FIFO
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-12-philmd@linaro.org>
 <f9c35a6c-be32-7758-d78a-e63449f864b8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f9c35a6c-be32-7758-d78a-e63449f864b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hSnYjbogdDvH

On 14/7/23 09:27, Richard Henderson wrote:
> On 7/10/23 18:51, Philippe Mathieu-Daudé wrote:
>> +static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void 
>> *opaque)
>> +{
>> +    PL011State *s = opaque;
>> +    int ret;
>> +    const uint8_t *buf;
>> +    uint32_t buflen;
>> +    uint32_t count;
>> +    bool tx_enabled;
>> +
>> +    if (!qemu_chr_fe_backend_connected(&s->chr)) {
>> +        /* Instant drain the fifo when there's no back-end */
>> +        return pl011_drain_tx(s);
>> +    }
>> +
>> +    tx_enabled = s->cr & CR_UARTEN;
> 
> What happened to "Hello, World"?  We ought to be consistent.

What do you mean?

> For actual modeling, I think you need TXE too.
