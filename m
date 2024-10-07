Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2193387njb;
        Mon, 7 Oct 2024 14:03:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6mLLLDwnZZMCEOX7AoD4zeSgKTZcTEB372ZLR2Lhqm/3vEzoCCMPTZeo4DamsOZbHGl3xfobV1Ggk0g==@linaro.org
X-Google-Smtp-Source: AGHT+IFIahuwLpRMUz0kv2nrZmx6p1qTwknSQVy+fVSXCJa1xlRlAZr4j0AunAgHj/Eb+AuHxg6r
X-Received: by 2002:a5d:5e0c:0:b0:374:c2a3:63cb with SMTP id ffacd0b85a97d-37d290d2d51mr565350f8f.0.1728335022250;
        Mon, 07 Oct 2024 14:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335022; cv=none;
        d=google.com; s=arc-20240605;
        b=Lbe+wyK7PmhjZI74PfYDbQEqAoSGuqYKGgE8nuUWwZ2bLQ9ADzekWAJXui7/P+fRD0
         4U4ts08sYQgmk4ylwuZVPZTGT+x+qqSTePaifEopQ3YCoSLvzEy7/zswgWklxvg7TtR5
         E6MjHTsOxLpvelCPpDJAFFYy7LOB9mECpPUVybLEvGWcLqE/aqKTbfZpfOQq7AsmD4Pk
         K7IAsi9C+Yj+RNKCf2Fh5KhusIzl6LnVpD3HYsN3cnCX8r2FBKu3SBy+EU/zdf6IJfcC
         /Rz5Czx8vtzaFU297LSs36+zCgnerZTAH1vci4YnQ/60OpEoYRzA2a4NsG541zm8KZSD
         qOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=zeag8zsSiy0vNgNC1UzYWjr/V8m5BRLCuGswN8A9LdI=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=WfK75s/eOgPTR6hLtLCe1e3xrkL+/cq0XMsg2GbW2aAtLuG4Psk0l/SzQmhdSKqc8H
         L4nccooFX7dSy47cuptKKJ/d61Yso9ViAyfmhYLuvIMTrdzLqbIChhcErKjcdrGBhWPC
         sBeMQH7KXoiDjY572oxZAONzKUaA9K8tHaTAHKaAl23WYz5Ma4ibfkH67mBHrwedh040
         SiYZw3Y0JxpRsSV0poYR6KzxNGtq2+Js4c4wo4zwDE4rJhOgVqJLhmVtZjMI0I5KUukR
         vQPS4UCfsfo0wFt8l17oGpMZWqMftYUQ1SEftNTMH7TE0EV4ksMaHnfyLs8aWvf+IF7a
         IMkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b="rWKS/SlA";
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d16911aabsi2667926f8f.194.2024.10.07.14.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b="rWKS/SlA";
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335018; x=1728939818; i=deller@gmx.de;
	bh=zeag8zsSiy0vNgNC1UzYWjr/V8m5BRLCuGswN8A9LdI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rWKS/SlAiTjA2EnMwa4d8DvrrW+wT0JNNklto6rHzylxPe35LS2VM4ScJsQ2tEbn
	 pMjIS0DtWfJBodZeO5WDJVncl/ME38tShVb2pjWaC6wt9B/MCntlmAWLxMkCF/QZJ
	 S1IJIKA+XestxhrKqv5lVt3ig0Zcz636h4+ockMW80OpV/uy+Yk5L5d3b14lJ6UZn
	 XIQSpdrT+CBQlC3NteWxBTAU+syeVzwuRc2BABZalD65+ZiTkBPZvkdcQoZW1cvnq
	 0n4dod5YyNVKW8d0d0q1Ezh9/ChXcfs7sWMdh73/24TtSrlWJgq4OgeXyYRyCwGKL
	 RvyHpHhyiZQHbdRZlg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEUz4-1tDuW82ZmU-00BRD4; Mon, 07
 Oct 2024 23:03:38 +0200
Message-ID: <c71c8234-da23-4dee-b356-f91098c4797d@gmx.de>
Date: Mon, 7 Oct 2024 23:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/21] include/exec/memop: Rename get_alignment_bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-5-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uGA6s4/DJkguxWiolsLv3MJyY+yba700uvgBHakOdjkug+/u5jE
 ZAsGU4WQheATM5KIhJQCMq3Vrq1Hl1zRF5zv+kLzop5ZQULILLF0v3/KSRsJMNJPmxf30O8
 qTlFXTqYtgVbCEw7sHN+OLn/mX3P2GqRCk68ytf0EtKoCBLsDYB/rygyLsfQ23iliIr33na
 e3Pjlo44NerYFTJsEhOEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0MFCzOQkQrI=;bUCl29W2Q1TG9ei+52rcDrFsvZU
 3UAjtBaJZULaCWnDwtK1t5Ww9YeyVvQOLdM0kTzGzwIygMQS6YB/cCv14qM/6O8U5J9HAvlwt
 ffhoQvxgQTXlLGwa4buKNEwZ1zDzv2obD18RxGKqpnEi+ncjoXF3MS7z0I96DCPWfEGyoi2ld
 4Ha23xzbRvoHL5I3xt8jmFv5ZmMqUM5EaWsF1Yg7uKYOu86XBHDiy4XbSNNOBUtAcdB7nSBCa
 1J38VP+o2rVisU26kW2akG0DkTHvz1JV+Jsst5qbbH7tzurvgt7OL5rjkdyezydV3b/Xlm1O8
 NpXWeAAeewoXaxzLeLdYXb10e0gtBgYt3AXvs6DILMkEWNqSzP7InnOp2XSICqWp8X03Y2IZD
 9lJfDGuxYYaABDE59sGQLyP75LqSHBvklvLCGvl9QfnMKXbQ49Rrtm4SFMkO9VFrmuhzWCVrK
 7+gLqXwktuBhPzXrc3SNys6VhikG2kUP+P0OkHAfQ8LIbr9w5Uohf9K7nuSdn20KsVaNPnbBc
 ngkhO9FmPX/4uuE8W1bg+70Eycb3zGGBoECVxZQQEnlGiFy3mtMTYfk1q2vuVM5GeWMUhOAFH
 KTvemjH05UdHVyg5Dho/GV/MBiMXVCj+X7xDgGuzi1UwQwbMDg7MnAwm9dwYm1BhN15aqz/qk
 2ZmwHBf40aCOdJDhhtBKPDPf3VPQzHSliZGeju/gRiwjpphUAboGEE0ay+DA5r4+epz1sqWux
 wsXDPFBSp82oUrDxbh0M+zYtClxNVaTSGVfS+uDH9S5X5OA4nU4jAYQSB2eqdEdPnaMvisEoY
 T9Y/0rAbzp1TUjid87Be3Azw==
X-TUID: HwbcdRf+q8p8

On 10/5/24 22:05, Richard Henderson wrote:
> Rename to use "memop_" prefix, like other functions
> that operate on MemOp.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   include/exec/memop.h           | 4 ++--
>   accel/tcg/cputlb.c             | 4 ++--
>   accel/tcg/user-exec.c          | 4 ++--
>   target/arm/tcg/translate-a64.c | 4 ++--
>   target/xtensa/translate.c      | 2 +-
>   tcg/tcg-op-ldst.c              | 6 +++---
>   tcg/tcg.c                      | 2 +-
>   tcg/arm/tcg-target.c.inc       | 4 ++--
>   tcg/sparc64/tcg-target.c.inc   | 2 +-
>   9 files changed, 16 insertions(+), 16 deletions(-)
>
