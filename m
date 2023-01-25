Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp22767ejc;
        Wed, 25 Jan 2023 15:21:29 -0800 (PST)
X-Received: by 2002:adf:e507:0:b0:2bf:c14e:ca00 with SMTP id j7-20020adfe507000000b002bfc14eca00mr1085389wrm.51.1674688889838;
        Wed, 25 Jan 2023 15:21:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674688889; cv=none;
        d=google.com; s=arc-20160816;
        b=wJKauB9D1gD11ElQuJmbrCKOStFlu7d3OIyL3+6hXd1tXK6SSPFVC29kNUDKAzKmNw
         XdYUBSuZsPRZNJW302fzFV9JXz6cXSKnuMtdeSfuJ7fRK9CvDks9zj+1A+XNMpXdxhM0
         bArKcIr/1dpvMEtxQ1U8mlp7ZKk9MI635V9azn02Qja6mQ1Q7Ujxx1oj6Cka7wm4mtXz
         kCykqBT+5QGp9aqqE6zUdz5Ly3LUIGYD0EK0y9QPeoFyjls9a6/SODO/p1cmPnQ8D7oi
         B2Whq/bOizR/U5s/yz9mzffhDT17bnZrVOsYhxSCEIj2euGDciUWSNPSojmQAv/10OjR
         vSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HftnaraMrzMu2NCyDy8hZZSwOEARFdrJ7zUueT2gBQ4=;
        b=bOPMybI29DN9cbBBSN5o31JX5yW8AoTUSXnSdqUsbChKkpKQ3npDzm/0rAGRl+z2Uz
         GINtmpJ2reRIQM00SeNgJplbf5mE4fVKsWY60sQ+PIcOW+scZuuZIRW45H4/9+30HEM9
         GNz+FzNVqGZiQ2mdQwbNSxy713Cw/gf3F/IahVHRntpLVetMwE351EzZeOTqWOojxyGh
         g9t5124iuxn3gv1mcKPo9+hqcA6EEUB5g+fAZxqcwp/q8wzrvtRbwH72aAEBHmU3gXMB
         l1sg2A+Io/cTL9caNfqbvwHVbSo7c6h63nc/J/FD6+BjJKyDvQbIA+cObtDf5iX8IRtC
         b87w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHmNkl17;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f2-20020adff8c2000000b002bfacddbbf2sor3059984wrq.65.2023.01.25.15.21.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 15:21:29 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uHmNkl17;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HftnaraMrzMu2NCyDy8hZZSwOEARFdrJ7zUueT2gBQ4=;
        b=uHmNkl17V9+XCIazx4KSiwXxkt2jFww6TVm2+RRj9MUwzsF66JkIKgtDXy2Iulbtib
         57f20+IZ/0FkvYc+XDl77Nb3jgpbfSdbTlaWAduhgP13v4TJEozNRGn6P/wPZrUck9Aq
         Zl0muIMiuLYxMQqJs5sdEevHgn45ScfCD50ZWdUAfTmuPG+2Y7cHp9eIW6OfcVbPgnY4
         DySdnp8heERUYrQGX+CukajVF3jgd3SVG7RmhnyP5sp8eJV9wCEISWUBZ2bENJt1IxZc
         C6pO4J5inC6YEesl6MHn0XQIrLi+bk793AFuSSd5W/9WOYK2zkC+puXaVri9PlpKUslP
         Wftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HftnaraMrzMu2NCyDy8hZZSwOEARFdrJ7zUueT2gBQ4=;
        b=U70swfvkUV9Z5HxCEm8dIB5I/rlQgeIcFAt3Gzd2RHeQKsgz67YUoNivaF15w3VD4B
         thyAH8i+SB3SMUmkW2eptdRPdjtODoMIrqR0/rOL8rBviM3vz/g6OLVN3AxTFPFYL9HO
         kemNSWDQxGE6HkLiIMQtkM/WCe+L/PhgNy+9bi8IZqOmu2c3pHikgptGHXnMCTHqJBlm
         I7lzwuDTCddV0PPAgXSQ/EFaIQLCthUYdscccPBaSz+8g57srYGD2vLDt7LEoqGCcqJy
         WJ4pAOk3ktfSrTWIReFOlDEEfBiY7GNd4Plyb9hYQf47DQgGWefq0AVzYz2AJrmEHGxd
         phdA==
X-Gm-Message-State: AFqh2kqbELIcStrFKHXwlMAtkvxQW5jfPCivIk8VOZlNwJ+uEAOAleHG
	iZiaLt5djOaFazNyvYwucDed/39M5971wcYveLA=
X-Google-Smtp-Source: AMrXdXuOSXkBNGbtoNq3ID6gLMxrs4HfyfU6oD9mLP2yUiBNH43OAQ0eS0ohSP6WxikhDWT9Zon62w==
X-Received: by 2002:a5d:6f15:0:b0:2b9:28ef:24c9 with SMTP id ay21-20020a5d6f15000000b002b928ef24c9mr33806198wrb.39.1674688888058;
        Wed, 25 Jan 2023 15:21:28 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.22.181])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d650f000000b002bdda9856b5sm5438042wru.50.2023.01.25.15.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 15:21:27 -0800 (PST)
Message-ID: <ac49a96c-449d-ce00-3ec9-6d949300a6f6@linaro.org>
Date: Thu, 26 Jan 2023 00:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 23/35] semihosting: Write back semihosting data before
 completion callback
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Keith Packard <keithp@keithp.com>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6NBpeYSa/CsJ

On 24/1/23 19:01, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> 'lock_user' allocates a host buffer to shadow a target buffer,
> 'unlock_user' copies that host buffer back to the target and frees the
> host memory. If the completion function uses the target buffer, it
> must be called after unlock_user to ensure the data are present.
> 
> This caused the arm-compatible TARGET_SYS_READC to fail as the
> completion function, common_semi_readc_cb, pulled data from the target
> buffer which would not have been gotten the console data.
> 
> I decided to fix all instances of this pattern instead of just the
> console_read function to make things consistent and potentially fix
> bugs in other cases.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20221012014822.1242170-1-keithp@keithp.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   semihosting/syscalls.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
