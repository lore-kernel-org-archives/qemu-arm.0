Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp772675ejc;
        Thu, 10 Aug 2023 08:56:58 -0700 (PDT)
X-Received: by 2002:a7b:cd09:0:b0:3f9:c8b2:dfbd with SMTP id f9-20020a7bcd09000000b003f9c8b2dfbdmr2250243wmj.19.1691683018182;
        Thu, 10 Aug 2023 08:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691683018; cv=none;
        d=google.com; s=arc-20160816;
        b=cU6gnUVtrqeZeZrRm1j5n8clo8bfRREIxHmcdaI39EoEuHqRfwDwzi78VAu0uHeXcn
         LIWZcF7wkQjVeUOeRvP+Y6WlAg892moAM28r+eYaFnNriwfxRhXlR7CsGI7c5gRIuX//
         Um7Z5T20If5ip0AjJI+l4cjEanFSH4hV5PlbgyGZNipXSPXukOBMHcH5eSZfox1myYFQ
         ixgmSLg1+E7amJSdkOktnAw4G9GtiglpFRyWvXppU2PFyyW/As1QOVmrqRddgjEQvulu
         A1HiUEs0r8jAfZbluYuwPnVjYWHC9nDsDRg6wWY2Rl5Tc0GAN8vrYN+5q/FmnH25ydrE
         PI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IftU204Dx3wX9GbOj52OKsZdF8meIuhiRJV4tTtRhzg=;
        fh=+je1WEKIZtiagav2P2aAqYUnMyGc+PHtDYmQyBHVjkc=;
        b=wlcx1qsR3+Ote8hVX6ckz6G7aPZCxxMB77fFUl4xM7n6xYzAeioggA2RmuRF1FurCd
         Wk4UcookzQit1kPSBoIZsCZ8WZzoJHfopZSqb5Oxju+xUor+IwrY1ZOPyjCRc7ZWmkqK
         BT8YAkvDcCon2L4yX+cfMXKfVVNPqZYYghHoKAejCLdINTfqK2zM8Shm3GIl+m4qPqx7
         fcLl1ErAmhVhEWOYxeBy7qHUOrVXvcqEXsiGqp5GigjT8U7yV8wIIHVrbYt3jPPlc2Aq
         mwNj+ajKIxIS1yNpFzg7icwpP+etnaTQMjZWqaMh3udhFsOEHHidbLAUrMshHY/Qud23
         JOiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lmF79bjO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o17-20020adfca11000000b00317614af3a3sor622067wrh.10.2023.08.10.08.56.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 08:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lmF79bjO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691683017; x=1692287817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IftU204Dx3wX9GbOj52OKsZdF8meIuhiRJV4tTtRhzg=;
        b=lmF79bjOH3NyzLC7ga1wH5kFoakb9ECoW34XxZMk87j519QTw9AejqWdKL/gLU9U6e
         EIYBwq5uj46BaVsIcPLDTUE0W8eaLY6vX7mY+cGoXvOa3zoXGCN4+tAinRfxSiKGFzS9
         d7ztFMbfyGgd7bLIr2Ezq7MW+wAQrXHdng7bABtfOfxfnPclRFndCap5MZre1AMfvmt6
         OjeE+FOQXB0dB2hIgzRZ/eCWgKqeiDUoN08RoDR0oNtlHRabaQeXyxFb1IkC2OLdxF9d
         C2qpBfzBPIjRlIi2uIqjhA5sh0LlK+nQPUatyH7QymoXa4ZsfFTUvGJaIrm8YdcQBXHE
         6r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683017; x=1692287817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IftU204Dx3wX9GbOj52OKsZdF8meIuhiRJV4tTtRhzg=;
        b=V9jMjNozVeyFCE6sJJOghvY821nlX127vwKXqD/0LN4RAzCMciKF+WIhXxHTPiHSkO
         2spymtD4M141fEoLNysNzgvdPuk7Cb8rZxy2YWEXJ2lhB3yUdPq6THLgslBUWxMrTTl2
         j7UnL2wgAPPQQbglel8MfbhoZ15ZfJrZwo40jetN7EQQU0fOV8rM8BU5FazKOq33rZfU
         wtzDyRa+9QdzY/4IMWkHPwGJzFsfHEWIgLbv8GwG20Xh4xj5KrC0Yj/yLtLW+lKKLLSm
         9yN9qHSJUkd8wHj6rF2t86khsWkGeRGO1D4XC4P22NTvdwH8i5flWqILuvpTF1fT2sD0
         EjAg==
X-Gm-Message-State: AOJu0Yzw2upABUVWNjOKC3nXtHZ2E1tJ3mPDFvmiSGBWSsgQzDsj8qPb
	vEGovQLvcfJE5qEy+vdpecl4sHoNxvE16bVeb1nhBg==
X-Google-Smtp-Source: AGHT+IGsVbOUUzCe6wYBdQ1X431JQoVBiwZ7U+plB+t2qApaP2vuzvOhdKQmW4ARmvk+t+LKPDfWag==
X-Received: by 2002:adf:e34b:0:b0:317:6681:e426 with SMTP id n11-20020adfe34b000000b003176681e426mr2167114wrj.25.1691683017449;
        Thu, 10 Aug 2023 08:56:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (tre93-h02-176-184-7-255.dsl.sta.abo.bbox.fr. [176.184.7.255])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d452d000000b003179d7ed4f3sm2601025wra.12.2023.08.10.08.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 08:56:56 -0700 (PDT)
Message-ID: <e3b16390-d174-6c8c-3a36-d31dc5298376@linaro.org>
Date: Thu, 10 Aug 2023 17:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] gdbstub: more fixes for client Ctrl-C handling
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230810153640.1879717-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rpLaNwMWUFtu

On 10/8/23 17:36, Alex Bennée wrote:
> The original fix caused problems with spurious characters on other
> system emulation. So:
> 
>    - instead of spamming output make the warning a trace point
>    - ensure we only allow a stop reply if it was 0x3
> 
> Suggested-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <456ed3318421dd7946bdfb5ceda7e05332da368c.1690910333.git.quic_mathbern@quicinc.com>
> ---
>   gdbstub/gdbstub.c    | 5 +++--
>   gdbstub/trace-events | 1 +
>   2 files changed, 4 insertions(+), 2 deletions(-)


> diff --git a/gdbstub/trace-events b/gdbstub/trace-events
> index 0c18a4d70a..b383bf8d29 100644
> --- a/gdbstub/trace-events
> +++ b/gdbstub/trace-events
> @@ -26,6 +26,7 @@ gdbstub_err_invalid_repeat(uint8_t ch) "got invalid RLE count: 0x%02x"
>   gdbstub_err_invalid_rle(void) "got invalid RLE sequence"
>   gdbstub_err_checksum_invalid(uint8_t ch) "got invalid command checksum digit: 0x%02x"
>   gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got command packet with incorrect checksum, expected=0x%02x, received=0x%02x"
> +gdbstub_err_unexpected_runpkt(uint8_t ch) "unexpected packet (%c) while target running"

Since unexpected packet can be non-ASCII, better log its hexa value.

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


