Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp204721ejv;
        Tue, 7 Nov 2023 02:04:18 -0800 (PST)
X-Received: by 2002:a05:6512:709:b0:500:ac0b:8d58 with SMTP id b9-20020a056512070900b00500ac0b8d58mr22427981lfs.18.1699351458215;
        Tue, 07 Nov 2023 02:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699351458; cv=none;
        d=google.com; s=arc-20160816;
        b=GbtefzKqrk10FlfrzaGbHmOoNsHExvUg+3XjFyGYSzc7r04/GxPg4sBAI7PvtRrAcK
         fV/lunpIz7C/2Wlv5ulOpmFm2SC4gjyEQgVQLCxtJjGmvA656lRsk3A6jcCtIYgzIEIY
         5w4NFTp+E0jW7AGDqfNcaAa52xm2O72EPPQ9H5/Xul7v5LjfGOqhMmDDb+MnYi7CCngY
         rMIl1R5TWoniqnUzW1d1tV/w5nvBt3zvY5JWSDADyZO8rQ/mYEr3udZNaCEaGyBN8uev
         /e2voDceHdEGXbNaQKInJozB1YzBmMX20qwdolcos4ds2v0TekdTfKA69ZJuvxBJYGxK
         gCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7vNQvsBCfS6b/bHw4Id5RTs+WrOWQKLbbdfZpu4FsL4=;
        fh=uUxKfukIu65dm6U3hwSKyRtGSkX30XuqiiZIs75nQ/k=;
        b=icuvneLWY+FI0eFsP6PV4dx9EHiO6qJon1GZQ0WHnLUNmsMTpT50yXatgDBKiH4LYh
         /yYV6lyKcc7ajRpRxPfI+tnKSfaab4vamvz41iShWsx9GcKh8FHvKlh/smGf6DvV1LIQ
         pIm9vdcEGyI8/MjcFPGKdSad+4YGJAz1CHz9LqBFdI/h0OdbBEH+yNBfHD8hTsOMWGuw
         HlDiKESD0oYLDQtp+tXNIysEyWGvpr+/VW9BLAhneK873QSBekOCjbzhJ7Mn3zu0YUih
         SE85SoTGt5PIU2tw3xs/86smcG3h2bQyWoav9WYgVphC3/cpF2zP5Ba/ywwieP+MYgGi
         LA5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iWrbuwCP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k16-20020a5d6e90000000b0032fdffb79a2sor145945wrz.9.2023.11.07.02.04.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 02:04:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iWrbuwCP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699351457; x=1699956257; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vNQvsBCfS6b/bHw4Id5RTs+WrOWQKLbbdfZpu4FsL4=;
        b=iWrbuwCP9D2PdqxsFoVRj/7vS0tL+11hBgQxlwFPqr2W0Eu9JcSzvK86lUcHVsoJYG
         XRlAeZjoCcZ0EOGRwyb6hYwMpmaNjkLueudJ4hX5u0GB33St3lBSXLYTH7+NuPascxlv
         OBg+bn3qeZ8Mx0FeDmbtkCl6k5qkcnpZ3REX1Xca2wmfoTCpiQxo77S+E15T5ebP01g3
         9AK0XSDOB8mIeDKBZKeu1/fL1tYJqgaSbeTTSRKnNsSEmL7LBCPw8rdD52ZeZcQre+ih
         aiowe8UEJ1CThgD819bYGdo0odXwSmWTb5kco3SROe6NYlPQtnycwe1znchvScexqxQK
         h60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351457; x=1699956257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vNQvsBCfS6b/bHw4Id5RTs+WrOWQKLbbdfZpu4FsL4=;
        b=thbFYXbIKkRpSMkBRdriuvR+W6+09lpVJa+6yyp+W8vKAq7EPZH+cPjTkPNtIYS0rL
         bdwlxGIiMBcUNdJoIn+pONMhSujhV68Hj09Bq91b02AFvd0awX5K/9hs2MzDzhmF/xUt
         2cUU1xGMRRt6sRM5M5JPtep0mTxW5twMywHsQaJeU2PaNCjo77CH/IYS/cxEV2AzOI5g
         qAoCkp679Uqloe3z1Dmf9x41Kf9qNogBwL4Mh1jUtYCp8t8vwj6XMDn74cwu+KeEWNSg
         Lb0VNCDSvnpA+Im5/8m/9dkN08lggSahPfn4jgPimAowPVEjJIXL5JcM14W16OcsRDB7
         /s5Q==
X-Gm-Message-State: AOJu0YyX/pzRleNewmQBMP5LnF+qi5xMOPIyGExCR8rOtI8YzGOYCYDk
	B5mvSOd9cAzD2IIrluXr5Gs/6SELZSEAPt+itLxHXw==
X-Google-Smtp-Source: AGHT+IFSNUP6BixpddTjwct03/aKUthvMZYskFrYdaR/REoQ6SNwJ7LXa950l2Xm5T7zs8ezJsvlEw==
X-Received: by 2002:a5d:64ce:0:b0:32d:b031:9719 with SMTP id f14-20020a5d64ce000000b0032db0319719mr26469382wri.42.1699351457492;
        Tue, 07 Nov 2023 02:04:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id d7-20020adffd87000000b0032fb7b4f191sm1881485wrr.91.2023.11.07.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:04:17 -0800 (PST)
Message-ID: <690f6ba4-6b4c-4e7b-b340-39c51759f8db@linaro.org>
Date: Tue, 7 Nov 2023 11:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] gdb-xml: fix duplicate register in arm-neon.xml
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Richard Henderson <richard.henderson@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106185112.2755262-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nVnXgZH5dZMT

On 6/11/23 19:50, Alex Bennée wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231103195956.1998255-3-alex.bennee@linaro.org>
> ---
>   gdb-xml/arm-neon.xml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Cc: qemu-stable@nongnu.org
Fixes: 56aebc8916 ("Add GDB XML register description support")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
