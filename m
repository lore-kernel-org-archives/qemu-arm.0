Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2059208lfc;
        Sun, 15 Mar 2020 11:56:48 -0700 (PDT)
X-Received: by 2002:a62:7811:: with SMTP id t17mr22824943pfc.268.1584298608188;
        Sun, 15 Mar 2020 11:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584298608; cv=none;
        d=google.com; s=arc-20160816;
        b=ee3g2hBPZwggkfEUdjINpUN6gsDcs7qFxTok7LQw5IaF/Eif4r7+re/rit2pnRPvue
         0VilnDeZYZ7OnMTfV4My/Du4cZ3GXz0KKCJqqOIgB1Xd3IkC920IrRwEmZ7tXrbIgIsD
         zl6OscFSiLiL+U4S/RxkP1gHwuYIrDztghDRWH1C269T27UtrD7a54KO7i6BypXInamY
         vbqb0PUfVNoCiLsC/m/Gu4EfqpQ613aSTJl70SNbzCOkwVVe0IL0nL/g+UvwcfMWCaZI
         LEXuPIhnh33ZrrialwOlGdQhjqLo2AACD4TXw2Vg8+UA176gpqJISniM+RXIEIUbhCbO
         QtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+0bPhTfpVLm4Se5rDwEqA55OKY69NbCPYl3fbHYKAck=;
        b=BiA0kagA4fxAATiPYPE6Q1ZYXcIn9kCBjL6VKWRBNVFcQoQV0I84J7w/y50tC9kIVq
         +5BNJn5I/4rYpVR7NS0qFT09QgXhnsy3sc20ZMThmYgYP92VVrcXg/K3JZdPNZwG/yvl
         PowaDWcPBKHhDskqAegI0Ev+MyW9U9J7OVg+ILI/Nb27btbg9RdbLDa8mA6UR4xg8UUC
         zWSrqQIJTHLzRBornoiZ8hAxTgBHDehbto9LPrqbHpWrGOSg6FfxmeOgbUfvAUE1VkJS
         eKWfaz606XClPCgY6vv2tUDRzUKtVJVY9vDezDEuvqLv2cXBvs6X1pgvoC+gYVXweT1X
         CQ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilX5sU4d;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j11sor17306931pjs.19.2020.03.15.11.56.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 11:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilX5sU4d;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+0bPhTfpVLm4Se5rDwEqA55OKY69NbCPYl3fbHYKAck=;
        b=ilX5sU4dFpK/NhyhH1vn1BPelhTO+RwCmWtiQq2tl3gg7p90tPBze0byGPdeiBbQP3
         k1Ax5IwEv+lu14+hNncL8j1ql0pghV65ACV+p5inZwB26AEUmg9E5Fw03g9xWhDF7b/k
         k82e9D+RDVKByPyE1/6QfxS5qzMJVHYIUEn18cOECyAyhUAm3Wvg5EWGJ4FDYU8fYTRE
         S038QamyzRhEyXVunuq8/4F1sIDEFxJPAExuZCjQpdjTh7+0tR7+wGdcAFHzutK9eyyc
         r47R/2t+ns+VS5I04Gi21uh6v4Q6C0uYvfdn0fsHTlb+06SGzp3TztNbS5yibVhFT8P6
         0ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+0bPhTfpVLm4Se5rDwEqA55OKY69NbCPYl3fbHYKAck=;
        b=VU8tXlSSBu7dqN+ok0xiKhOUIWEgDg7pjJoiYjPP5rTNM86YD5K702ixnxY/i9g6tZ
         42iOrTOvCGyoA/y/LCWiyDNXzz3q/nC7ffTPV0IhKJnilwuWnr1foy6njRXvbxNzT3UI
         YYLVJs/OfTqRTbWj9zOsqRBHgxtzh7bCkuc668i6YrKlGZD7wiQNqs4eoizznqg5n7pk
         pAzk9YsJ7EgLTdxigZurVDyMwsX/c/iKeNNqewyFU9BoVSnT04ChrJW7Nzz826D5Ew2k
         QaYI5BMoDqpCh/OwpIXITPDSusM+DWFmSvKd0fG3kVnzhdxEF/Zj1UVeaD5SndLoeNBp
         2omA==
X-Gm-Message-State: ANhLgQ3WtBFkFHNM5eh3JEaK9lzNjVL8ZR9pqlq1NfzJimt164ttcb+t
	ZI0z+MkIxDG2yV3i5F1ZouZI4kRa
X-Google-Smtp-Source: ADFU+vtXbpdOvdCuYM2qC6Qn8qlLsgLKKgnbyPRjsnLFfemCqboJpjTiLiK+B29tkCKGrkJOQQZpeg==
X-Received: by 2002:a17:90a:1784:: with SMTP id q4mr11450982pja.174.1584298607652;
        Sun, 15 Mar 2020 11:56:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id 4sm7787455pfn.156.2020.03.15.11.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 11:56:45 -0700 (PDT)
Subject: Re: [PATCH 02/14] configure: Avoid building TCG when not needed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d9da349-fd48-1d64-9f84-ae027c4c9d2d@linaro.org>
Date: Sun, 15 Mar 2020 11:56:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2Gp48R1iE7wN

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Avoid building TCG when building only tools:
> 
>   ./configure --enable-tools --disable-system --disable-user
> 
> This saves us from running the soft-float tests enabled since
> commit 76170102508.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
