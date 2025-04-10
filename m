Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp51578njc;
        Thu, 10 Apr 2025 14:17:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHkZI3B5RSZod9fBlLMfW8v+XhssQvgEFYIw3+fCzEsricufC+Nud212a7i5Yu9+wKgUuCUyoMGnRcNQ==@linaro.org
X-Received: by 2002:a17:902:db0e:b0:223:66bb:8995 with SMTP id d9443c01a7336-22bea4ab827mr3679715ad.20.1744319862680;
        Thu, 10 Apr 2025 14:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744319862; cv=none;
        d=google.com; s=arc-20240605;
        b=ZuOwpyPzRmmzwX+W907dUoSLgvqAUQWiVUhntcbtY0Zf5CP5WoJQqoe7j0KPodIp5s
         XnPDW/AsRfBQPN7rIfelISsT8xgCOelUX192xE0e18EDwskQ3eDs+4uO3xfU7PWuJWFk
         dkVIoUGjxEoHhO5hL2o10ne9fd51fWPMkn0WqlLo1q/tyQpjhccuaNifQLR/KGyZONJF
         SKel4QwPmXQcIRQKtYIn0TVBoN7oaPqa05640cFM8zd+TFW7YzHTn1Rc6eGSd7kvRJ8v
         HtPVhH3CZ+L6mmVKHhTXNr4w+R933Uf057Sws4CQWR/XvNacWKGFxPb0E/z7iY8TWUXW
         yJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=k27xR+gZgLXWoqf6VEdoeK1pkVf6pdMIpwfEk9UWv9g=;
        fh=9cEYlxvbcVeWD8Bbktw/uN/6PtpG0APAsbAixVFY1dA=;
        b=Zt2MOCMS+TD6fh/T9vqaZT/yTkyRZR0dJtD1tiQON7Z7qvcglIFrEQRtuLes8pK3zW
         Yio69b7+UYR64ZW2IB4XSDQqSxe+4S7bdnLHYMhmH5i466LA0CNtVnpuTVedpwLc9D7u
         oSVCdukFMHigqyS/vcO5Q1VML3cyWDkupswWDNJjXYIGWtoiKYk9p7WZwIBch2AW7YR9
         chFZ0Y9kIUi88u54sBkGMmsv9nwAqKWh1qlVXj5SGTTnocOJXh4nnDpWBn1tbe7qwgUB
         rLXMKgYls3GNQotP/eI6XUADt8cS67HQST73lYkrAQH1EQH11TehxLsAC4/YJgs8PJLO
         naYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4P9sFPb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-306df2bd51bsor3581507a91.4.2025.04.10.14.17.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 14:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4P9sFPb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744319862; x=1744924662; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k27xR+gZgLXWoqf6VEdoeK1pkVf6pdMIpwfEk9UWv9g=;
        b=O4P9sFPbhcHhn9HBsrydUrNEBtYpOCwD0s2+HJFl767Z6P/X+IxinUOYsmrBf2CEi/
         mwVOp3EeoFpi7ZWhLqeYU1CvKap3piXuMrejYsSjiSHvsCN9cDnKGeLnaNRRRcO0AMsa
         N8d5XyIcSDW+qoBlaNKppIrbiMV1CBUr4FcWmrHR58s8ZP0hPAj4EOUbBGsUEbvT8857
         3QXi7l7ebEdS2WMnAkc8+XBtQn/16ga8TzMpAM5ThIDVjdjxEIvGl2sBjDiNzZ2Wv4GE
         FbqA4T5qIpjpEjCT6MfzxdNiQQt55oYKA+dazs4QinrHxRvkMEfz31a+s5d+Yk0r9hq0
         FRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744319862; x=1744924662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k27xR+gZgLXWoqf6VEdoeK1pkVf6pdMIpwfEk9UWv9g=;
        b=q3EIV1i5Y9KYtRHeyx+mFHLDt2Ol3tf5gzCfHX/PpO2HutJj5o3fwkP6c8oCE910vL
         +JO8N8UxNhruq1HLJbQ1fEf/YeihETZEbgtX8c4kLfHibh19Shk34avtj8663Qyny8p6
         GEM/+/Xv29mpkq3jtV7H5E1Pc3DEOLaZghJ7TxiCb+yOiTGwPzmL/xtwsINbr5/wTom+
         C9pbCIksUBK0Na7LcMD0Dgwj9L22IIZfTrW34Tk05k6kmS2CfUgml43eYUv6IDAGBaKv
         nZrL1JLw+GqTR7AgkBISk0swYyyi0UHoRuaNiEfB3anMBSNOjTkxPrDip+E75s0FbaFy
         1/VA==
X-Forwarded-Encrypted: i=1; AJvYcCU0RRTmI/RueT17zqz7cxAjeQwGgWcVjQBslSRUwDPgYQnm+hF3syflxK9G6NspzW2UziXX1znUgzkaug==@linaro.org
X-Gm-Message-State: AOJu0Yxi91jp9v2AdlHdD7WxfLt1JLYRf7LnY/iHJNZz8Cp+dH9ZNMP2
	smlfri6f2EVgs19s1vaeuapIhmWvdJ1BclYOX1L4S81tIcXAuILXKAvcKX13pQ35kw==
X-Gm-Gg: ASbGncsL0dW7pv6TQ0qpeUezDGpFiadpNFdCvRtWvsPRSWdjtHXNMQurK3p/zfu18XO
	YKvwSwiE3dtxLWKAx8I63obnMDIslSLreAopbHbAI7LTrgXpY7jVNZ+cmHRt+QUlR3hAccSEIj6
	d3zP02tDbqU0fhVK+ekRmlvIdoPQO0uzJeCX6ZDvUJBXpIoArr7FuDehwA7l6NlN9xPVqc0Li7c
	T3HhiOJbTsbRHclpS0/ppkW9DkVt5BdAecKr3JyIngrDoT1zHET30LVHtvucK5pJw1EtvE1qjJm
	JnFA5j9GS8Clv4oJhIlcVVplQ1ukr8HJJ7TKEibC3N5JPRnaMePlLQ==
X-Google-Smtp-Source: AGHT+IGV9Kr4rUGiX4wwreN3zU1Uxyn4f5lAefTT7MLjbAvXrDAG3ctGkzG9xhc3nM2j1PGz5SNXeA==
X-Received: by 2002:a17:90a:e7ca:b0:2ff:6ac2:c5a6 with SMTP id 98e67ed59e1d1-308237cdb4amr522205a91.31.1744319862237;
        Thu, 10 Apr 2025 14:17:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4d5sm4653646a91.25.2025.04.10.14.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 14:17:41 -0700 (PDT)
Message-ID: <83f44749-0eea-48f0-8aa5-3882132e30d0@linaro.org>
Date: Thu, 10 Apr 2025 14:17:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
Content-Language: en-US
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora>
 <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
 <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: LJ/da3gESsFP

Hi Kohei,

first, congrats for this work!
It would be really nice to have this available upstream, starting with a 
modest TCI port, before having the tcg backend also.

On 4/10/25 06:13, Kohei Tokunaga wrote:
> Hi Philippe,
> 
>  >
>  > The biggest problem I'm seeing is we no longer support 64-bit guests on
>  > 32-bit hosts, and don't plan to revert that.
> 
> Yes, so the sixth patch ("[PATCH 06/10] include/exec: Allow using 64bit
> guest addresses on emscripten") should be considered as a temporary
> workaround, enabled only for Emsripten builds. It will be removed once
> wasm64 gains broader support and is adopted in the Wasm backend.
> 

Do you have recent information about wasm64? It seems to be something 
that has been discussed for several years, without really seeing any 
progress.

As Philippe said, we can't really revert that (it's now an assumption 
for our softmmu implementation, and would break code if we enabled it 
again now.)

That said, we can always have a first version supporting only 32 bits 
targets. And later, when wasm64 will be available, we can extend this to 
all remaining ones.

Regards,
Pierrick
