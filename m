Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp266817ejq;
        Fri, 19 May 2023 21:27:14 -0700 (PDT)
X-Received: by 2002:adf:db4c:0:b0:309:51ff:a77a with SMTP id f12-20020adfdb4c000000b0030951ffa77amr2717230wrj.10.1684556834515;
        Fri, 19 May 2023 21:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684556834; cv=none;
        d=google.com; s=arc-20160816;
        b=EuoFnGujJ5q3i8Vx3rRUKQB/RAmJJCM9p/JEgYLRhXxu8tcHvNTqpuPzYZk57Ho+ER
         pYDFPXzt0BkNoo/pOf2m7u+qeVFaxCF+kOSijYgN5UJ1WNkgUCLlWC3i5x20xs/oFnU4
         SmJSliH7aLFYadOWDHcNl9RVyePJAWFz7vw7Th6UGYwjRvlTr7kb1ZsfFte7VzD7vS0W
         /CEZhJJAT8bOztreQQZs7LpaHx6w1mNWVxpJFnSKBYHWgQJjzZARi1iyiqTNORD0dgpZ
         idOD5Bg8Ocx5PVHkCj9Ou+NPdPbExUZLfeiy5Qxx6SgWAMJWAVjoMEO2GcrK8c9sJkGX
         iZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BqqRdB82FF9k3X68vHPmmMnha4dD0tnXuZnyDaYPNjs=;
        b=03sBQ6qpyeVL6x7hqGj2wOflfd3dZtXBMNVsX9JRxY/djDSaeC6p81O3TVtJsvSDOw
         cgvKEnG2LH23QN8GCCkygPPMNPrVRV7zAsHDXW67EuK7dgvLHm7u64bbxPBrhPtPhZyv
         Xy6kruB+RQ18izxhay+Rc9ZpC2ujFj/qwpWcqnqlQgX0/I+C8dHpXrXESX2v6u4wb9Um
         bEHRAAII6F2h0ZUMvdkjDFSCSdIglrplDWb9BoiD14rTDlI55Bu4ef5KD412var6Hnjd
         A5qvjYAHgNR/S5JegUDNgBuw4llpq4lcdaMPKi9KX721yGF6UC5SZfzGixe73KQtfwfR
         CNvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uGMqIfka;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bx25-20020a5d5b19000000b00306316489easor194173wrb.7.2023.05.19.21.27.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 May 2023 21:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uGMqIfka;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684556834; x=1687148834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqqRdB82FF9k3X68vHPmmMnha4dD0tnXuZnyDaYPNjs=;
        b=uGMqIfkaYycpfRQZx2rF4aaNJ+OESXOV6kEJdsoO/IkmDv8bwYHA9XSF/Puak3034b
         HBOU3r6YL2IYOBh3WJHitf/ifs2LscmJki9umGHH5cTR0fxv9TDdV4Z+YRmmnLCP+0a0
         7f2nFag8AfRuS1XpMy5HOJjFvavneQTyKbeGFxiHRWC0AB9iMzDnuLmNbjaST0VOmWwp
         TPa5cQ+a4wLAGXzOgAbiM4axbRVN6YryNTZZ0zoo8QS3b+JeFEALthHqjx9xNDtIXo/Y
         zv1TtDH7NPsZwPUcB4Z21QistoX+lxC2kfdTCNSbuXELFaEbfh8PSzT6UlOcNwWoTC85
         oX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684556834; x=1687148834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqqRdB82FF9k3X68vHPmmMnha4dD0tnXuZnyDaYPNjs=;
        b=ldWDef4c+GWbDDKEIvKeMyJh98vqFzokfGORDfKiDxfwONBK711Q00BlynxKQ4zciz
         L6vd1nb86CJ3lTsmTQJs6CNGHVAgB4UZydODri98s/Y/fvmZih13JEtqWe6V8FHqyMgP
         nmpCPVxGMk9UjXeCOrdF96/a6bwGFTs+mqeP9go2inPSK/ZTDGsJTVwaPtddUMTFSu5P
         e3zSKH/r54A20Kq2sx9SfEYUhT605WS6JcTFgZI0Gnw6s6te/jahVzciFZGnBRw87iT2
         HF/zq4fXi7utfm7GUlzHThbsLsMnkWmYlNlmvzUoJcP0gYvGQTQxT2rFcmkq5h2kaMVw
         V9aA==
X-Gm-Message-State: AC+VfDwgXC9yQYtOFBeA5vUR867wz3Bu9ZZ9X6TvBlEB4fHa1yk3+qCQ
	2TPwysRNGDkBNTs9fx+5A5F56mcNmA3ulDtQohXTRA==
X-Google-Smtp-Source: ACHHUZ7Le+TYqsXA2T7TuoqYzTvtH2h8sco4iQGTud4VrxezYm2ayrDtMtsHzVRNS3xHFoMxOEkk1g==
X-Received: by 2002:adf:f604:0:b0:306:2b56:d268 with SMTP id t4-20020adff604000000b003062b56d268mr2796929wrp.15.1684556833961;
        Fri, 19 May 2023 21:27:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr. [176.184.41.228])
        by smtp.gmail.com with ESMTPSA id l17-20020adfe591000000b003079c402762sm751072wrm.19.2023.05.19.21.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 21:27:13 -0700 (PDT)
Message-ID: <740615df-440b-288a-f98c-933c042b7024@linaro.org>
Date: Sat, 20 May 2023 06:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 6/8] sysemu: generalise qtest_warp_clock as
 qemu_clock_advance_virtual_time
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>,
 Mark Burton <mburton@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230519170454.2353945-1-alex.bennee@linaro.org>
 <20230519170454.2353945-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230519170454.2353945-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fzYhsE8+iARX

On 19/5/23 19:04, Alex Bennée wrote:
> Move the key functionality of moving time forward into the clock
> sub-system itself. This will allow us to plumb in time control into
> plugins.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/timer.h | 15 +++++++++++++++
>   softmmu/qtest.c      | 24 ++----------------------
>   util/qemu-timer.c    | 26 ++++++++++++++++++++++++++
>   3 files changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index ee071e07d1..9a1a42a400 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -245,6 +245,21 @@ bool qemu_clock_run_timers(QEMUClockType type);
>    */
>   bool qemu_clock_run_all_timers(void);
>   
> +/**
> + * qemu_clock_advance_virtual_time(): advance the virtual time tick
> + * @target: target time in nanoseconds

Maybe '@target_ns'?

> + *
> + * This function is used where the control of the flow of time has
> + * been delegated to outside the clock subsystem (be it qtest, icount
> + * or some other external source). You can ask the clock system to
> + * return @early at the first expired timer.
> + *
> + * Time can only move forward, attempts to reverse time would lead to
> + * an error.
> + *
> + * Returns: new virtual time.
> + */
> +int64_t qemu_clock_advance_virtual_time(int64_t dest);

s/dest/target[_ns]/
