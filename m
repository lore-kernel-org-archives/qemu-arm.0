Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7574481lff;
        Wed, 15 Jan 2020 15:10:42 -0800 (PST)
X-Received: by 2002:a63:6c03:: with SMTP id h3mr33894344pgc.19.1579129842312;
        Wed, 15 Jan 2020 15:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579129842; cv=none;
        d=google.com; s=arc-20160816;
        b=0yhaQEjgzfZF1wGxbMmZJNHoz3QfTPvW2rHP1M4qkEb10MA9BN4/Ao7kKb+QeIPjyp
         OTZbd3aZCeua6vwrEbI4fqLQyVNOEG/le4fVWlC9VzkgGxR3qHKgjR0Uz8RQHa4AnmNA
         20EnJkdGS60owZtRvT+DpPMNadChRjhSaEOn6KbwrHnGzbY/fwpjfooHnyXh5FFoXoHC
         ++uCw2f1xDBb/w11AQxao7Xk0jaGb7XQm31LoaMgYcgxzSE7qUH6e07vaK55YN4H3svH
         7954l6mecj6ZuCjPGx02mgb5OpcqYFqoT6IExlXvI6X37Kz6zdrP8yCjr13av8/1z0te
         eEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=iU/M/tMDQtV2QDTx4kgjjdVVZmyjQMec5xKttgTT0iU=;
        b=nxwaMH3FrBJ1oTxjcVqdVkCiEvVobXCGO95KqYLo2EYwW0Ng5TmJaQsVKoecAHOkVw
         eayD0ddZFCuDhMwEoTTAOAJbeOCZL+6FAu2eyPmI8yH6YsB/LEVAn/be1dfG0/sFOLmv
         JQjexXlIcfRuKX5TZrt4OYv8rn65gLLXjrqxh9dXNbf8RSKv93yl2vAoxHwdjrI6MD9P
         xO6wl/d4cheFWgtXfDvJIOWfwyglNUXxJuj6SjAqfkZXhdjTPAcNtgRktRIZpKliDaPI
         3Xk1xhqdXVJLknGLPlBBiwajfoWb6nGdPJTngmkyiOkdyGMvQZEPASbFfhvuhYia2+/e
         MAXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKv3Lryd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v9sor22461163ply.71.2020.01.15.15.10.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 15:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKv3Lryd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iU/M/tMDQtV2QDTx4kgjjdVVZmyjQMec5xKttgTT0iU=;
        b=wKv3Lryd+1PkiZ4E0Ldm0jsUwEDtpqpICQW1ABI968sRRc3R6gAwUKxfi4twvl9etR
         wv8BK4g3IOXfCvT+gd+yXQV6xnu007XfX4uApmSFbxV4a2oszeqrTuWNkwAS9QPLrl4N
         dJ/dJPLs8fvR0RHY/ByQJvUFjKgRxFYDFj0568R0UOuEwdlskBGoF9uE4Fj5CB3ceiTI
         WsvxXLjA2q8DPuIa91/GbdZ7fDk+oTgfXT0g2wTfVonOJzAyhC/4vcuSF5ZElJQ6gK3d
         Bx3Dib/JiRvdgHxvxUhgMIGSMDBr0geZH4vo9NTVYy1IfpT+4P3Dihvnnklhw8LjmVXy
         q7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iU/M/tMDQtV2QDTx4kgjjdVVZmyjQMec5xKttgTT0iU=;
        b=Gbe+g/xaBfyQcxNz/W6pb3hDo0iFkjhBQPwxdJyEPAly9TP/xN0xYGVRRvxIKFZzmS
         Sgk25UKeyGJyicXLlf7lVLFmEoFYOPAh9Ev8FiWxQTWy1SCIyi7vlbpghIIbWdQxJFox
         sFq3KhbXi5XlO6/BQyp4FcUSTecloVj6TSLwCt1Rx6yxO019cCj2GM3FDD+dO3QT05TR
         UVL1Z79oOpgpZeWSyz6AQpNMZunZhQ9xJRE1dNBURG3LgbRfVFw6nvZ22Q1KlhwFaq5V
         C3fMqgZ+W6jo/JA2MGpjeEqlGUt8hwrH8ajmB1QnEO5iiq/pQhKRq8nMZ237kiDlRQSS
         Ab/w==
X-Gm-Message-State: APjAAAUamH0cCWUSX+HISjzG4mvlXNm9naIVL1kYBcMvJemJ+D3VFxDH
	WlPtZz5qJAePMkEONtlaPe8e7OVs
X-Google-Smtp-Source: APXvYqwIhGuaGuR4vZJPndfMT2sSon6GFwXioKBkwCRY99EPJoyHXHhJcuWi48qsGwMW4550nsxxAw==
X-Received: by 2002:a17:902:d203:: with SMTP id t3mr13868095ply.53.1579129841819;
        Wed, 15 Jan 2020 15:10:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id a15sm23549848pfh.169.2020.01.15.15.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 15:10:41 -0800 (PST)
Subject: Re: [PATCH v5 21/22] gdbstub: change GDBState.last_packet to
 GByteArray
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d490ad2a-4d59-9ecd-6f15-3611af560dfc@linaro.org>
Date: Wed, 15 Jan 2020 13:10:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: u0AwgkbtDlEX

On 1/14/20 5:09 AM, Alex Bennée wrote:
> From: Damien Hedde <damien.hedde@greensocs.com>
> 
> Remove the packet size upper limit by using a GByteArray
> instead of a statically allocated array for last_packet.
> Thus we can now send big packets.
> 
> Also remove the last_packet_len field and use last_packet->len
> instead.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20191211160514.58373-2-damien.hedde@greensocs.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 39 +++++++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
