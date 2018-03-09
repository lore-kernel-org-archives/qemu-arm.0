Received: by 10.28.91.67 with SMTP id p64csp1000585wmb;
        Fri, 9 Mar 2018 08:49:23 -0800 (PST)
X-Received: by 10.223.150.41 with SMTP id b38mr26491769wra.229.1520614163944;
        Fri, 09 Mar 2018 08:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520614163; cv=none;
        d=google.com; s=arc-20160816;
        b=P9P2dR/2a0xFxjTooYYZEUIf3evuDHmtt7bqjpPROoJU/jybvtpbVodYE4ZIE+fYY2
         Jl+Fvxl1kqmzNwBee/KRCtrUnpXr84m7lLt1u3NCmsOz4ShNoDv4urRBUJJav8mcOTCB
         tT3HbWZig1i4fbkTjJ+240lzkkt4VUAfMla3uxvrqAIFx2WPpJwmr7llM2Ol9qWNTMMZ
         1MRKZA35bKNeYWlDJxUBg3CysttgoBxl/TpB4zUCv7NlmugSE21PrggNRaYeK/SYquTV
         yFYRaSFyXreIdPY6blkdIK9DawRe0fnM2a645FQPey1SiGSkwSTrK7VbwY63kyvIPDb9
         6SNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=4ZMLBWpCwDd+eqQ0BWKskRpbgCd8OtdXemfcHxANjwQ=;
        b=kQGfC6rWliVdyqHvW1wW64j9NM1kmcnWx2nkfBOW8764oWuYsU8vO8D4B7cyo0xkb7
         IW5swSyj5nNW1A37U0m7jLwHI4Hdgb0D4oQuMbSRXT1W8Rwuetn2IEBc+ag3KhxjRF3I
         +4k0zx8cHjc3SimnlVDTaJVd+VeRGFGTfUUfebh2vEi18QLkpCZMcbSeBJ8+DnPdFkpS
         3GgWjzGDQiMRNnPuOjNECnw+EDOtY3uW72CT6jbd1Fy0/fJIzv61h9NCScubj3mjO/vW
         VBzEvb7HMVX2PEn2OoO+qCrr/Iw1wskVIq0bFy6Wr73+Mm0dr9xE71Itd/GfMXFQLbwk
         Tahg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UCFXU2uR;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 39sor730043wry.5.2018.03.09.08.49.23
        (Google Transport Security);
        Fri, 09 Mar 2018 08:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UCFXU2uR;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4ZMLBWpCwDd+eqQ0BWKskRpbgCd8OtdXemfcHxANjwQ=;
        b=UCFXU2uRcIx9WnruaG8CAiKBMltyVtBqsz2ObDO5wnq4gueREGgKiGrBbjfoYp90XS
         bjltzRzwuqT9+ZPw8xoAt5DTPyPH76DbgpuzqBReT+H0lp7aGA2zWbGJEQMhlFHifdhW
         Q3UjAs9osboItIX3OO2VbhHUc0IzEoBoKWV2nhxmS2WyrjdkiND9nwMg5IYB/xkeE79z
         SaWAT4QTE7LgZzTy5AAPyt+rM5JZYKP3RdH2VkrpvqLFngOSX+IpIif0ejFYGR+JY+8Y
         UbZnVG1jt+GnfOZQIfMr1Cgy4jI79OfcLexk9ocpiPauOhlFInxFXltbYvfmojtqwLhB
         K7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4ZMLBWpCwDd+eqQ0BWKskRpbgCd8OtdXemfcHxANjwQ=;
        b=aytZsB4K1sn8r3QDcj/IdGvxGG5Rq2w1ec1gckjCNCfcewKjRRNn+smiPbyeZw5V72
         LEN3Vubl1TLO6gbu6XpRT0XMdUOcCtaAncKGRqoJJlKfImtMCrbRj32ymf0Th5V0RXaW
         NYTG3VzODXVpoXozjHDRXeDitBdnlHvGNyasF/pRgXyQ2gpw1G8nYzuqjaL83A40sO7h
         BHRn2ybYDaGJtpuaxyPCxE7hz5GE2W1N76oPIdqqyiQ0lNP/F4afrt0ZM57msBbn4mlT
         t6Ll8H1+LhaOM79c6A6MJIhYgSC9j9GX4/gIY9+/4QCtLkYn1XwTv7aB3Z+FKX3PeluR
         6qfA==
X-Gm-Message-State: APf1xPDlEdYS4hHbc0eBxqRwTCZirDdnQUkj869gNrMV6j/EaG/Gaway
	YecyOW6bOI3O7jkNY9g7eRuCBHZM
X-Google-Smtp-Source: AG47ELtslNqRVAH4/1RvrarGKm0gD3qNPLvyZGSQb656OzG1+BpalYO3FNK1YQRpi83cheRoKKngTA==
X-Received: by 10.223.133.214 with SMTP id 22mr27711427wru.130.1520614163371;
        Fri, 09 Mar 2018 08:49:23 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.22] (ABayonne-654-1-76-150.w86-222.abo.wanadoo.fr. [86.222.219.150])
        by smtp.gmail.com with ESMTPSA id f142sm1798350wme.15.2018.03.09.08.49.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Mar 2018 08:49:22 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 5/6] hw/arm/virt: Add "max" to the list of CPU types
 "virt" supports
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
 <20180308130626.12393-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1de4234e-fa02-fc82-4057-f1be7b11d2e5@amsat.org>
Date: Fri, 9 Mar 2018 17:49:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180308130626.12393-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8ZpjpmvONViV

On 03/08/2018 02:06 PM, Peter Maydell wrote:
> Allow the virt board to support '-cpu max' in the same way
> it already handles '-cpu host'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index dbb3c8036a..cda4b83586 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -169,6 +169,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("host"),
> +    ARM_CPU_TYPE_NAME("max"),
>  };
>  
>  static bool cpu_type_valid(const char *cpu)
> 
