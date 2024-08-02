Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1231488njb;
        Thu, 1 Aug 2024 23:41:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXq8uTqOffN6Dc/7h+CgUmkgZfTP4La5sQDYO8BCjThpH8dBtjG0fxCcgHEi1XIL23SLC3eRgkfQ/WN4EruytqAq1VfMY/D
X-Google-Smtp-Source: AGHT+IGynUQ3MLR7zZAgCYMTUc3ImWPYJ6r3+Tjt2jpH0kDUA/iGhUsTY2V1DX6kIiPHnEm45JLL
X-Received: by 2002:a0c:e6c9:0:b0:6bb:9a9d:c77e with SMTP id 6a1803df08f44-6bb9a9dcad5mr17841446d6.12.1722580914871;
        Thu, 01 Aug 2024 23:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722580914; cv=none;
        d=google.com; s=arc-20160816;
        b=rxajxXvA8B9GOmTEI2dN/ekSyPkfWLxlgB/3ZcCLZjc5TQK7oCI5aLXH/dg6vzzPdc
         Wc+QCCtuW/1ZlASuc8bCp7aRH7PuEyUlTVVT0bibf91zA+93SPALGN32TnGV3rDomf19
         bHO2e9znvpuyGOjCWRvHsnUPGr+nZpgvKlRCTrt+Tr6wvXi6qlb5p7mI+/Ubffmb4mXL
         hnUpt/BgOqbdSwbYEBtCjD7TF4fCP0ZW4o3oRlvUr5x592JXTdaRnPC9wQVd+4LenHc8
         6bL3rtD6ConOsu8Rciw1fF5qPo5pH+AF1+8hcmFrrDUTfV7eOQ4DUcSNWOFLOcoVPHII
         psWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=S/9x1Xh0wBmo4derdqirR0ZQGy3VUaV8stajdJoEOHk=;
        fh=4GyWwCXC4txz5TyVD2NNBA4uBke5XabatV1Pa8s+jpA=;
        b=qx15bKxnrEwvn4bqiWVv/N9Njakdb6L5E8abi8MmaZ3daYx4AsLyfHu8yJ4+MQBrI+
         iQAc4XHEh+0//eX0fIMmPtzkKl1/zuOKJBcomznE8MupvBHSHibKW7OOLg7il/Grl4jw
         gXbZkktk+hJTSSXEYdnlM0Z2OUDXYVnS7aGwiYugBJ1rBWrmJB5Wexx3RPBEH2ROtNks
         r5FboZWBWJZv+nqUJw/+6PpnjA/HWK8LLAwxYuX3JT0FrGXHcNAOEDOhEIoEs7mB0SA1
         d27GiNF3tLDnIrbiNN3KLamBaG+DBpz5avZ1Xtp57KO66jobyeJe+fiDRv1XEnXHJg49
         5fHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c76f890si11562466d6.121.2024.08.01.23.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 23:41:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZlyd-00061W-4i; Fri, 02 Aug 2024 02:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sZlyb-00060Z-Lh; Fri, 02 Aug 2024 02:41:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sZlyY-0003Ts-QQ; Fri, 02 Aug 2024 02:41:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8CCE080388;
 Fri,  2 Aug 2024 09:40:42 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 001CF1199CB;
 Fri,  2 Aug 2024 09:41:06 +0300 (MSK)
Message-ID: <7bf379b7-eb51-4fe3-a93b-88849a8d1292@tls.msk.ru>
Date: Fri, 2 Aug 2024 09:41:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] hvf: arm: Do not advance PC when raising an
 exception
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20240720-pmu-v4-0-2a2b28f6b08f@daynix.com>
 <20240720-pmu-v4-6-2a2b28f6b08f@daynix.com>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 xsBLBETIiwkBCADh3cFB56BQYPjtMZCfK6PSLR8lw8EB20rsrPeJtd91IoNZlnCjSoxd9Th1
 bLUR8YlpRJ2rjc6O1Bc04VghqUOHgS/tYt8vLjcGWixzdhSLJgPDK3QQZPAvBjMbCt1B6euC
 WuD87Pv5Udlpnzf4aMwxkgfTusx+ynae/o+T5r7tXD+isccbC3SiGhmAPxFyY3zGcFk4+Rxc
 0tP8YY2FWE/baHu+lBDTUN79efWAkHhex1XzVZsV7ZD16rzDbXFK5m6ApvGJWlr5YDEEydTF
 WwmvwBfr4OINVxzEG/ujNiG4fpMf2NsnFGyB9aSbFjXZevB4qWkduYYW+xpK1EryszHtAAYp
 zSBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PsLAlgQTAQoAQAIbAwYLCQgHAwIE
 FQIIAwQWAgMBAh4BAheAAhkBFiEEbuGV0Yhuj/uBDUMkRXzgoIBEZcUFAmBbcjwFCS5e6jMA
 CgkQRXzgoIBEZcUTIQgA1hPsOF82pXxbcJXBMc4zB9OQu4AlnZvERoGyw7I2222QzaN3RFuj
 Fia//mapXzpIQNF08l/AA6cx+CKPeGnXwyZfF9fLa4RfifmdNKME8C00XlqnoJDZBGzq8yMy
 LAKDxl9OQWFcDwDxV+irg5U3fbtNVhvV0kLbS2TyQ0aU5w60ERS2NcyDWplOo7AOzZWChcA4
 UFf78oVdZdCW8YDtU0uQFhA9moNnrePy1HSFqduxnlFHEI+fDj/TiOm2ci48b8SBBJOIJFjl
 SBgH8+SfT9ZqkzhN9vh3YJ49831NwASVm0x1rDHcIwWD32VFZViZ3NjehogRNH9br0PSUYOC
 3s7ATQRX2BjLAQgAnak3m0imYOkv2tO/olULFa686tlwuvl5kL0NWCdGQeXv2uMxy36szcrh
 K1uYhpiQv4r2qNd8BJtYlnYIK16N8GBdkplaDIHcBMbU4t+6bQzEIJIaWoq1hzakmHHngE2a
 pNMnUf/01GFvCRPlv3imkujE/5ILbagjtdyJaHF0wGOSlTnNT4W8j+zPJ/XK0I5EVQwtbmoc
 GY62LKxxz2pID6sPZV4zQVY4JdUQaFvOz1emnBxakkt0cq3Qnnqso1tjiy7vyH9CAwPR/48W
 fpK6dew4Fk+STYtBeixOTfSUS8qRS/wfpUeNa5RnEdTtFQ9IcjpQ/nPrvJJsu9FqwlpjMwAR
 AQABwsBlBBgBCAAPBQJX2BjLAhsMBQkSzAMAAAoJEEV84KCARGXFUKcH/jqKETECkbyPktdP
 cWVqw2ZIsmGxMkIdnZTbPwhORseGXMHadQODayhU9GWfCDdSPkWDWzMamD+qStfl9MhlVT60
 HTbo6wu1W/ogUS70qQPTY9IfsvAj6f8TlSlK0eLMa3s2UxL2oe5FkNs2CnVeRlr4Yqvp/ZQV
 6LXtew4GPRrmplUT/Cre9QIUqR4pxYCQaMoOXQQw3Y0csBwoDYUQujn3slbDJRIweHoppBzT
 rM6ZG5ldWQN3n3d71pVuv80guylX8+TSB8Mvkqwb5I36/NAFKl0CbGbTuQli7SmNiTAKilXc
 Y5Uh9PIrmixt0JrmGVRzke6+11mTjVlio/J5dCM=
In-Reply-To: <20240720-pmu-v4-6-2a2b28f6b08f@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4vMEE/O/KN7C

20.07.2024 12:30, Akihiko Odaki wrote:
> This is identical with commit 30a1690f2402 ("hvf: arm: Do not advance
> PC when raising an exception") but for writes instead of reads.
> 
> Fixes: a2260983c655 ("hvf: arm: Add support for GICv3")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Is it -stable material (together with 30a1690f2402) ?

Thanks,

/mjt

> ---
>   target/arm/hvf/hvf.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index adcdfae0b17f..c1496ad5be9b 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1586,10 +1586,10 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>       case SYSREG_ICC_SGI1R_EL1:
>       case SYSREG_ICC_SRE_EL1:
>           /* Call the TCG sysreg handler. This is only safe for GICv3 regs. */
> -        if (!hvf_sysreg_write_cp(cpu, reg, val)) {
> -            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +        if (hvf_sysreg_write_cp(cpu, reg, val)) {
> +            return 0;
>           }
> -        return 0;
> +        break;
>       case SYSREG_MDSCR_EL1:
>           env->cp15.mdscr_el1 = val;
>           return 0;
> 

-- 
GPG Key transition (from rsa2048 to rsa4096) since 2024-04-24.
New key: rsa4096/61AD3D98ECDF2C8E  9D8B E14E 3F2A 9DD7 9199  28F1 61AD 3D98 ECDF 2C8E
Old key: rsa2048/457CE0A0804465C5  6EE1 95D1 886E 8FFB 810D  4324 457C E0A0 8044 65C5
Transition statement: http://www.corpit.ru/mjt/gpg-transition-2024.txt

