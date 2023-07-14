Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3847686eje;
        Fri, 14 Jul 2023 00:06:19 -0700 (PDT)
X-Received: by 2002:a0c:a99c:0:b0:639:d1f8:3e15 with SMTP id a28-20020a0ca99c000000b00639d1f83e15mr2417343qvb.23.1689318379189;
        Fri, 14 Jul 2023 00:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689318379; cv=none;
        d=google.com; s=arc-20160816;
        b=txST9W4b+7ulyFUeJ8ybPsf+7fKoFD4ou0xGvaOKU6ovtjtb/Sx7Tr+9Q+6rgQl6hS
         aLNQ69PWBrd1Ith/HkvWfzqHecjszb6LiANKiVSvnaSrjuJkUBL6sQ82/xreeYKAPx6F
         K1Nt8DlUFpUhN4CVFHkKNrVKtT96ZcRJdO4Sw/8EbbVaNqZcm8XVk0W/rK1SRJYTSlaw
         CVdWxF42HL+Y1OSbMZUUdjYnR5ytd0A/GJVprL30uxxw5TyQqndi0Gm+s0gNw6sZ9o5y
         M0gaHLqRXK9Nm7l/Uf+pM7ORmfufF8DA3+SxuYvvsT+95vwnBmZiL0Q1xj1st9fKudvJ
         T53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y/nraKwf4A13m/XOj/qEjRykkBHYdmzAh91OERfh0wM=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=mDVbgbxDfTq0H7HgdiwN8Y5RZUHZ8ybqU/QbgY3W8+9DCOhWHK8nsdhO6DH7Bvv9Rr
         mp93nvpGjjiMcT+wEtn3ll76JzIg0Kyq9vu1SKuHxaz5gELXb0fqF1Ss5iBdIlLNgKDc
         jvaKWFNGiZucssEENRexYtYefgX+Fte+P9GNDGjwW/TBLUBAmp+Jtlh6egK0Odmztdap
         5wkR43gI/QdC6i7fHr8jkBAZZLdToSoA/xAcjY21IdUNT3sUU0inbjAbm4uHYlG8OIJf
         yTjDn3B9txoO7a4VRE3OT9i0hExnhvEQOZA+Ev6g7K+qbWDAsWpXd/zjdcHalwsXVITu
         jiew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UoOuTGSi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id do31-20020a05620a2b1f00b00767233b66fcsor173088qkb.8.2023.07.14.00.06.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Jul 2023 00:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UoOuTGSi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689318379; x=1691910379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/nraKwf4A13m/XOj/qEjRykkBHYdmzAh91OERfh0wM=;
        b=UoOuTGSiclO9/4oz/pCtkwXipqHfLgSO0NM2qh9Y0f6g2sBiXBexT16ocvsT0rLg3o
         f6vmybCBNthY2xQUT2aqyRtuOZH1MasoyyqycpNVN8iQlgSeihs305wr6Hpih7EhftyX
         1nffKBObe5lE9THPW93myh7TUTpM3NHOLJOOtLasDfHm4r413Lv4YoitMJ4x6CJIi42P
         AWQp+27IQsR+NZNugY37qmLZ331WBXw0+5D6I0QuzWzv5GhNJ1GS9kE/AxL5wST0Dghc
         jrBPt7PLgeMkSc21so/AfzOZxrFuprAEldSK+UTCojfrvdoMrgoLlz0kTzHgAa8/VKp5
         1PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689318379; x=1691910379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/nraKwf4A13m/XOj/qEjRykkBHYdmzAh91OERfh0wM=;
        b=htlsiCKNldpuAgVQJZWxYWRPFw+iRd3ezhWmhDSKX3z6WNnh0xTCOH1Ji9rheeHh/b
         7Yo7t7WNhAmakVqXaQ5GW0Lq0dgLCX4WWYsCCdNAXHNH2/FpBfehogJHbxj8qKkJKPq8
         UUBF70s42GPNxjNLkQfag92Tv4JUkMWC55EToXiCHVJ/986qymAlOcGxpokixkZV1b2+
         TRaGcUvO+nZJ0ycgDEIpF+FsAjMy2+ntFPe7TI1aqQPfyz+6HOZvlFta8NCIWk7GgOOo
         /9ddF6aCCcTuJNGczsXPgItbAs7egq3xvKmXZhzXv9yYBlWVx+4GqZTUroziXvOXemHf
         HEgg==
X-Gm-Message-State: ABy/qLZCL9ztnrf4/RQ0s+2shWY2Fid5QWzUZiMkv0zPXE3yUQAL3OFL
	xOKwuDlnmHRGuCzuKr/6MJpmBWmW
X-Google-Smtp-Source: APBJJlHOI6PeaEOT3TagzDghdAAMY9hhVqBjoZQeAwpeOZtMelsfHu3afu+KpNPkhro9Kjscv+P7xQ==
X-Received: by 2002:a05:620a:133c:b0:767:156e:ddaa with SMTP id p28-20020a05620a133c00b00767156eddaamr1841732qkj.35.1689318378734;
        Fri, 14 Jul 2023 00:06:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id g7-20020ae9e107000000b0075cd80fde9esm3547613qkm.89.2023.07.14.00.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:06:18 -0700 (PDT)
Message-ID: <290271a0-88cd-88b6-a485-3e1a3b9bf3e1@linaro.org>
Date: Fri, 14 Jul 2023 08:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 10/11] hw/char/pl011: Rename RX FIFO methods
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 29xqAkGmt+Ph

On 7/10/23 18:51, Philippe Mathieu-Daudé wrote:
> In preparation of having a TX FIFO, rename the RX FIFO methods.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/char/pl011.c      | 10 +++++-----
>   hw/char/trace-events |  4 ++--
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
