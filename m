Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1235336njb;
        Fri, 2 Aug 2024 00:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoZgHZnfBbRf1LZgEQ30BNfBdtTd/sokjhnBVW70XXHqBmTopzmt4ruQbQzDF5662iZ3r6q7zyYvQQxet7kCqi0dUfbK9B
X-Google-Smtp-Source: AGHT+IF9ihG2fduOnGjVsKxARlRmJN+ZYjh1z1Efx0acralJp//SkJbZ+rmrLw2gI1dmAyXGNIaa
X-Received: by 2002:a05:6358:3220:b0:1aa:bde7:5725 with SMTP id e5c5f4694b2df-1af3bb8c678mr240302955d.28.1722582173416;
        Fri, 02 Aug 2024 00:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722582173; cv=none;
        d=google.com; s=arc-20160816;
        b=RSzV1CbvJOgOYE9axX0Su0/7tvCxsNc3pYBD3xd/ZUcJE0mjE/3KKLzPBORLO0enO8
         KmRnN2TLcgIsL+zyTBr9w6wkWdOqbHSHLFvBuJ7+BO0WaCEaqkrpZO0fQzbDrLc9b9TR
         Uc7V/tdnoI7vRCg5Lu6Y60SIpLnWKytsu/6K4lBgvix1ffCfjTlCV+YligpTHNvW/+Sb
         QgXmdMmTyJ/igTB0PcYSS6oHqtRT3XLsmt++OdGpfhz23GR1hb4vh1MZGK6ckN8UetML
         R2Z76BbS33twMbYSrhw6l4IulNMYoiLks1FhcLJG8dLITZ7FOnKMi9HP/Olh5v1T/aqv
         qSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=1XxST6ifZYjYRMXA9L4pCZ/T8DGOA7czPcpJ8FPIUtc=;
        fh=xR6TAZJqLI5GuS/tQlwdo36AJDy/2ioyvS35DmzlX4k=;
        b=bnArX2lP+K5T8xde0LSA/OJYF6Nx0pO2FurpPmgGFFCZsc7XvcyeDDxteONox3nA2o
         UYvHkOslatMTzDtoktFDWZfpB2Q59Dr06qGKXn+j5Xx8EUwxvYpI3pmvmkCyQoimIV52
         jYq+e4ULJysDAZ5Ju+O4Y6K4B8VZaASuejwFg0Qgza28wPdBOMRSd9yxj80rByaYFFuz
         La9D6TQdikIvcS3ubML0p3phnno/UwdIPmykS7EXTDdu+wDSo7vZMRVF9yZIFpoBatBT
         ph+/jKuwZ5yoaG66zATVnv5qx1FG8uz/fV0bx+4DjoOQ1gX2qMXehjVQSQFMephVuU1O
         g6IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb9c88f945si11417466d6.419.2024.08.02.00.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2024 00:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZmJF-0004ox-MT; Fri, 02 Aug 2024 03:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sZmJC-0004ca-HA; Fri, 02 Aug 2024 03:02:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sZmJ9-0007G5-Tt; Fri, 02 Aug 2024 03:02:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 88F5B803E2;
 Fri,  2 Aug 2024 10:02:07 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1F9C71199F1;
 Fri,  2 Aug 2024 10:02:32 +0300 (MSK)
Message-ID: <513b95bf-bf72-4334-b9a5-4d38bce16660@tls.msk.ru>
Date: Fri, 2 Aug 2024 10:02:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/misc/bcm2835_property: Avoid overflow in OTP
 access properties
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
 <20240723131029.1159908-3-peter.maydell@linaro.org>
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
In-Reply-To: <20240723131029.1159908-3-peter.maydell@linaro.org>
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
X-TUID: hCd1wq2EceaJ

23.07.2024 16:10, Peter Maydell wrote:
> Coverity points out that in our handling of the property
> RPI_FWREQ_SET_CUSTOMER_OTP we have a potential overflow.  This
> happens because we read start_num and number from the guest as
> unsigned 32 bit integers, but then the variable 'n' we use as a loop
> counter as we iterate from start_num to start_num + number is only an
> "int".  That means that if the guest passes us a very large start_num
> we will interpret it as negative.  This will result in an assertion
> failure inside bcm2835_otp_set_row(), which checks that we didn't
> pass it an invalid row number.
> 
> A similar issue applies to all the properties for accessing OTP rows
> where we are iterating through with a start and length read from the
> guest.

This is a fun one wrt the -stable series.

The code which is mentioned in the subject and above (OTP access
properties) is introduced in v9.0.0-1812-g5d5f1b60916a " hw/misc:Implement
mailbox properties for customer OTP and device specific private keys",
which is not in any released version of qemu.  However, the next comment
("A similar issue..") tells us the same prob exists in all other
cases in the same function.  So the fix mentioned in subject does not
apply to -stable, while "all others" "side-fix" does :)

I wonder why coverity didn't notice the other cases here.

Thanks,

/mjt

> Use uint32_t for the loop counter to avoid this problem. Because in
> all cases 'n' is only used as a loop counter, we can do this as
> part of the for(), restricting its scope to exactly where we need it.
> 
> Resolves: Coverity CID 1549401
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/bcm2835_property.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index e28fdca9846..7eb623b4e90 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -30,7 +30,6 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>       uint32_t tot_len;
>       size_t resplen;
>       uint32_t tmp;
> -    int n;
>       uint32_t start_num, number, otp_row;
>   
>       /*
> @@ -337,7 +336,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>   
>               resplen = 8 + 4 * number;
>   
> -            for (n = start_num; n < start_num + number &&
> +            for (uint32_t n = start_num; n < start_num + number &&
>                    n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
>                   otp_row = bcm2835_otp_get_row(s->otp,
>                                                 BCM2835_OTP_CUSTOMER_OTP + n);
> @@ -366,7 +365,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>                   break;
>               }
>   
> -            for (n = start_num; n < start_num + number &&
> +            for (uint32_t n = start_num; n < start_num + number &&
>                    n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
>                   otp_row = ldl_le_phys(&s->dma_as,
>                                         value + 20 + ((n - start_num) << 2));
> @@ -383,7 +382,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>   
>               resplen = 8 + 4 * number;
>   
> -            for (n = start_num; n < start_num + number &&
> +            for (uint32_t n = start_num; n < start_num + number &&
>                    n < BCM2835_OTP_PRIVATE_KEY_LEN; n++) {
>                   otp_row = bcm2835_otp_get_row(s->otp,
>                                                 BCM2835_OTP_PRIVATE_KEY + n);
> @@ -403,7 +402,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>                   break;
>               }
>   
> -            for (n = start_num; n < start_num + number &&
> +            for (uint32_t n = start_num; n < start_num + number &&
>                    n < BCM2835_OTP_PRIVATE_KEY_LEN; n++) {
>                   otp_row = ldl_le_phys(&s->dma_as,
>                                         value + 20 + ((n - start_num) << 2));

-- 
GPG Key transition (from rsa2048 to rsa4096) since 2024-04-24.
New key: rsa4096/61AD3D98ECDF2C8E  9D8B E14E 3F2A 9DD7 9199  28F1 61AD 3D98 ECDF 2C8E
Old key: rsa2048/457CE0A0804465C5  6EE1 95D1 886E 8FFB 810D  4324 457C E0A0 8044 65C5
Transition statement: http://www.corpit.ru/mjt/gpg-transition-2024.txt

