Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1238032njb;
        Fri, 2 Aug 2024 00:13:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU32ck8U/ctEZEl9qDOkpZyHSKhSG7TMjNuU4fYd/qeqKLCvjnnWgpas3X4VBOJ1tCQ5HFvfoFAloaxqlg+HQzfh5bmaOrU
X-Google-Smtp-Source: AGHT+IHs7Nzm6uXIQ9ePjzzwWhEXmig6MfPsCxO4ZhmqHGO1zWZI6gP4xbPKHSaNgIPUBOur9EcO
X-Received: by 2002:a05:6102:c8a:b0:493:f8e4:4382 with SMTP id ada2fe7eead31-4945bde6d3bmr2897401137.4.1722582826908;
        Fri, 02 Aug 2024 00:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722582826; cv=none;
        d=google.com; s=arc-20160816;
        b=aaiKGGxU2sVW0yJtdgGN6vv18P7Xez3rOw6lODl+exQIFzGgjAM/JVgJsS4U9qyCRj
         7t4dJ1RrrUCk58FRS46BcYCzSj6ACMWERN4BUzLsrAp6f5buUX6tC/ly5zf8xve7ZIvu
         5Hx9PiP8xliHsVQYm0I0izuXGyqIuMgK/kQ5lm5xqq7LRN0CWaIe/fBxrUFWM4MPIcQq
         qqgi6sDskgQXnd6S67eXZmzMdkF4ScJa4L+abX3N2CHVwEqUY2CwLF/Di7Kz59XIeC41
         T7ZXD1v294rCMGrKeJzg3liDRi6DxVNhBVDb3lfbFNRxTGOr3CBVyR0mGRENY9uD9TTB
         PTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id;
        bh=OEcMr4d+cQLCtgPKwvmv76zZ9rZuoC6JGGNQxuOSZIU=;
        fh=xR6TAZJqLI5GuS/tQlwdo36AJDy/2ioyvS35DmzlX4k=;
        b=lIIuNr13yLKO/m4vKiEieKWG90CR1v3LPqcw0s7lRjy3tdJwCaoXUsEklGAo0m05ea
         08lPCeaopm25zHHJzbvzC2c0Lx9K4ScdJpfvf0xe+6KlPjtbWsGjQeF296bRW7JgggdM
         tgf2u0YqhK8L9VSDre/+sxOwyvuuC0YIqr41Iw23TzFOM8Wzf0UZWE5a6RCuXw2JYs9c
         9fYdOOHal79KEfogXPucny7EpbMZOwsxYOQz8JyiUl0ma4IZhG/KEVpGpgKApirB/Lai
         PlkG25nOQFSCPooFpomFNMQQwSBJ+A2MpGF6OT3X7AFVOwHxUbFzjIr7gQjlKPyjJO+j
         HU4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f6d177fsi176171385a.156.2024.08.02.00.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2024 00:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZmTO-0003y8-Hy; Fri, 02 Aug 2024 03:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sZmTL-0003vz-6j; Fri, 02 Aug 2024 03:13:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sZmTI-00052f-Ss; Fri, 02 Aug 2024 03:13:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F0539803F1;
 Fri,  2 Aug 2024 10:12:35 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7AA42119A04;
 Fri,  2 Aug 2024 10:13:00 +0300 (MSK)
Message-ID: <0d398234-bd2a-4de4-a304-825f4912ca74@tls.msk.ru>
Date: Fri, 2 Aug 2024 10:13:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/misc/bcm2835_property: Avoid overflow in OTP
 access properties
From: Michael Tokarev <mjt@tls.msk.ru>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
 <20240723131029.1159908-3-peter.maydell@linaro.org>
 <513b95bf-bf72-4334-b9a5-4d38bce16660@tls.msk.ru>
Content-Language: en-US, ru-RU
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
In-Reply-To: <513b95bf-bf72-4334-b9a5-4d38bce16660@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-TUID: 0fGzhG6AO9dW

02.08.2024 10:02, Michael Tokarev wrote:
> 23.07.2024 16:10, Peter Maydell wrote:
>> Coverity points out that in our handling of the property
>> RPI_FWREQ_SET_CUSTOMER_OTP we have a potential overflow.  This
>> happens because we read start_num and number from the guest as
>> unsigned 32 bit integers, but then the variable 'n' we use as a loop
>> counter as we iterate from start_num to start_num + number is only an
>> "int".  That means that if the guest passes us a very large start_num
>> we will interpret it as negative.  This will result in an assertion
>> failure inside bcm2835_otp_set_row(), which checks that we didn't
>> pass it an invalid row number.
>>
>> A similar issue applies to all the properties for accessing OTP rows
>> where we are iterating through with a start and length read from the
>> guest.
> 
> This is a fun one wrt the -stable series.
> 
> The code which is mentioned in the subject and above (OTP access
> properties) is introduced in v9.0.0-1812-g5d5f1b60916a " hw/misc:Implement
> mailbox properties for customer OTP and device specific private keys",
> which is not in any released version of qemu.  However, the next comment
> ("A similar issue..") tells us the same prob exists in all other
> cases in the same function.  So the fix mentioned in subject does not
> apply to -stable, while "all others" "side-fix" does :)

Okay, there's no "all other" case here, it is really all about OTP access.
This change basically only removes the 'n' variable for stable-9.0, which
isn't used since the previous patch anyway, and the build fails after the
previous patch due to this.

Still fun, but in a different way :)

I'll add removal of this `n' variable to the previous patch for -stable.

Thanks,

/mjt
