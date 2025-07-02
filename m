Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp142188dyc;
        Wed, 2 Jul 2025 14:22:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIcPBAnWsmvoIFPVrLxwSFe/OQk6+JUu9PoIze7YV5uOf7psGvS1uie/tNTEMrCFWA0LHa1mnGiXx4Ew==@linaro.org
X-Google-Smtp-Source: AGHT+IHrSIt0FMo8LNKk9ZPlzqpoNKVdz+8iDopFQnSodhyp1H0Xasz6IKI7s7tLhSsrRjjUPj/C
X-Received: by 2002:a05:620a:198d:b0:7d3:914b:abe6 with SMTP id af79cd13be357-7d5d1c74442mr109229685a.23.1751491321874;
        Wed, 02 Jul 2025 14:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751491321; cv=none;
        d=google.com; s=arc-20240605;
        b=bb2YgqKutjtpQMEIb/k3VbeMSzdv2y92hE7dyZj43Tmd9WnsUXZQRHfwOC5KtLE1bT
         xFDg7QmXSA92E3i3oaU5Ce+ahXpSrCdsDik9ojygLNjp+2SspFnGnwdxFWUggqWyLmEe
         4/uJWhLWrjiUgKz2YwT7fQ8Ya0kim2acgM+9FTCKhzT2007n/8nOMSLDlhwwWr0DBRPs
         iU88d9K0MV+Rdk12QVa7G5/ZWnY0T91cOXDK1da9ZWgH7UcYI08pN61oCDQ3WyHiBurn
         YQBlJJk+VkhgjRXD4FYJ/5Ln1A84G2qhjvJeOZRug+WB4QEV4fctKqblme1sKhRIIL9O
         p4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=jO0p6WD53jy/utA3lzsHVD1/Jpyx8s3e7wGY0t4UfKI=;
        fh=BB/ONc8iK39vsyAn4Oe+bnNu06drIPZ6oDZqx70OXng=;
        b=KJDKbJI6gqw0efBRe/n/jeKQBpz+82DSFkILEmUFZxN72Z4a81G2bHh1TjeWu5hJfZ
         4Ti+53XwH5G7uXAZxief3z/HNJVfLDu7t4D5xg/fifO4gsh7gLTvTvyi0Kt5s/jRAoNb
         3rK6r8koKSYzXgu8NffTQ8fUzP1fPU4o9IDB81RrYmFj1WJB8sJNj5pnLN9KRkqOzMqa
         CZz4+oLfnxSUVs7F2ZL/ddusR9g73IkwF9hVOI0cnFwwDhmvuXnvTKwvnX5ffCmMw+6z
         ge+6hhScnpsuC5sLOY7xSyuzliz18T5w4jFfZ9fFCO4/qmF0Rfjg2RuhB1kUxPErXKBM
         ipww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44323df6dsi1250803185a.327.2025.07.02.14.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 14:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uX4tj-0007nK-6a; Wed, 02 Jul 2025 17:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=U4+o=ZP=kaod.org=clg@ozlabs.org>)
 id 1uX4th-0007md-3T; Wed, 02 Jul 2025 17:21:41 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=U4+o=ZP=kaod.org=clg@ozlabs.org>)
 id 1uX4te-0004M7-PR; Wed, 02 Jul 2025 17:21:40 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bXXrV0KStz4x7j;
 Thu,  3 Jul 2025 07:21:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXXrL2k2Pz4wd0;
 Thu,  3 Jul 2025 07:21:05 +1000 (AEST)
Message-ID: <a86f62f4-8df3-4eeb-af0d-ff93fbabd45a@kaod.org>
Date: Wed, 2 Jul 2025 23:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/arm: Add PCA9554 to ARM target
To: etanous <etanous@nvidia.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
References: <20250701203400.71677-1-etanous@nvidia.com>
 <20250701203400.71677-2-etanous@nvidia.com>
 <f7e9fcba-e844-42e3-8e4c-9cc67a3069e7@kaod.org>
 <e273f8c9-6479-4ae7-95a4-5f3a3053ad76@linaro.org>
 <aGWGl-9v4Nt9e2O1@edtanousvm.nvidia.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <aGWGl-9v4Nt9e2O1@edtanousvm.nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=U4+o=ZP=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FbO8Lme+Cko/

On 7/2/25 21:20, etanous wrote:
> On Wed, Jul 02, 2025 at 09:04:25AM +0200, Philippe Mathieu-Daudé wrote:
>>
>> Hi,
>>
>> On 2/7/25 08:47, Cédric Le Goater wrote:
>>> Hello Ed,
>>>
>>> On 7/1/25 22:33, Ed Tanous wrote:
>>>> From: Ed Tanous <ed@tanous.net>
>>>>
>>>> There are arm targets that are connected to this io expander,
>>>> specifically some varieties of Aspeed 2600 BMCs.  Add it to Kconfig to
>>>> allow use.
>>>>
>>>> Signed-off-by: Ed Tanous <etanous@nvidia.com>
>>>> ---
>>>>    hw/arm/Kconfig | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>>> index f543d944c3..6ea86534d5 100644
>>>> --- a/hw/arm/Kconfig
>>>> +++ b/hw/arm/Kconfig
>>>> @@ -532,6 +532,7 @@ config ASPEED_SOC
>>>>        select I2C
>>>>        select DPS310
>>>>        select PCA9552
>>>> +    select PCA9554
>>
>> Note, these i2c devices 1/ aren't part of the SoC, but boards/machines,
>> 2/ nor are they required to have a functional machine (i.e. a i2c link
>> could get cut or an i2c device ending dead).
>>
>> I'd prefer 1/ add a ASPEED_MACHINE layer selecting ASPEED_SOC and the
>> external devices, and 2/ use "imply" statement instead of "select" for
>> devices, as per docs/devel/kconfig.rst:
>>
>>    Boards specify their constituent devices using ``imply`` and
>>    ``select`` directives.  A device should be listed under ``select``
>>    if the board cannot be started at all without it.  It should be
>>    listed under ``imply`` if (depending on the QEMU command line)
>>    the board may or may not be started without it.  Boards default to
>>    true, but also have a ``depends on`` clause to limit them to the
>>    appropriate targets.
>>    For some targets, not all boards may be supported by hardware
>>    virtualization, in which case they also depend on the ``TCG``
>>    symbol, other symbols that are commonly used as dependencies for
>>    boards include libraries (such as ``FDT``) or ``TARGET_BIG_ENDIAN``
>>    (possibly negated).
>>
> 
> ACK, seems reasonable.  I tried to follow the pattern that was there,
> but agreed, it was odd that "board" level things were added at the ARM
> layer.
ASPEED_SOC has been there since the beginning; when the timer
model was first introduced. Kconfig was introduced, then meson.
We simply kept using it.

ASPEED_MACHINE would be nice. We would still have to "select"
all I2C devices because the devices are always created at init
time even with -nodefaults. These device are soldered on the
board and it doesn't make sense to make them optional. IIRC,
we have flexibility to choose the SPI flash devices though,
this is because real systems have sockets to replace them.

Anyhow, if you want to tackle this, you are welcome.

Thanks,

C.

