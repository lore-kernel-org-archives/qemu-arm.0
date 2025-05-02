Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp677702njj;
        Fri, 2 May 2025 00:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpZ6sYM64MgiTFVbpvbeAEuGRUsUJDBgsF8OMtJMkL3dDFOQfhMMubAH9wqRq7jPGpf6eSJllhOnZPuw==@linaro.org
X-Google-Smtp-Source: AGHT+IEfVBInywhqdRz5gGxLHyG1+Bx0mH5YtaddaXobBiuikOwuYtohxQsUifsKbDWzxo0UR/l1
X-Received: by 2002:a05:620a:43a1:b0:7c5:3b52:517d with SMTP id af79cd13be357-7cad5bb7f04mr361852385a.54.1746171862366;
        Fri, 02 May 2025 00:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746171862; cv=none;
        d=google.com; s=arc-20240605;
        b=cFTJqgm+XOgx0XgbGqV2Vpt5fN8gjFsb6kU+Tu1dBUIMuO+uIRIGqd6Tm+FgwpwnMg
         zATd0b7Kmcy9BsZA8UyauKDGGoVAbrDQwaZHc8Ap7stqy6mYbWkI6sYXBmWxBGtlUvhS
         0wwen+o6xU4wKDcYC5cWKDt/BS5nQPOjoKA6jSJiJaL0xxJ8AyMW5xzucsmDfynhLAXv
         2Eh5n4tvyEajJlEwbqSrfrS8kOMtD+4Ce/pzBQT/hg/+3VNr8e+j8jBszNm2LTlTHM3p
         VeruVbdQPTlKNSjXWze6zJMQyyOR63VD7V7dJWXFN9/CCjkJ85Tzsr2RhAyq/AOo596w
         kAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=ppSeZSR5ueV3OoQ3Mrr3BgyRqPDpYeMAQNGlffItm00=;
        fh=9fSTg57Z8/5qODGkbOspMwLLIoslmI8qf+5es3qFPPw=;
        b=TWVvEV1ibyz+/6qkJxSsBGA1Kxz4z8wsJN6HeUDaAL75Z+y6TLcXGxiKr1lFnn3I6u
         vLph2gB9hTj+6oZ8kBMHBeOxozmeB/vrDdUjRlsU5yS4hJzuaGCbT68wfLvwh9yXomR/
         yWrBZdDMmV7Y12NQ45UwYJBK4uZ09fJXTD5i+LWArqidaDfSWm0dRUzcq+7I22SIIJGa
         0Bs2yXMIFIOVRPzKzidMEM7skKMa+T/S22B4/y14rQ3bYCykZgUbWObMBJYQHJ7ZtmYM
         N1hkd+9NC/v3ciDocKaUmwW+5oSwnkaMh6i1J2uUZ+RZnRwNa9sNxJIND17pmO2ElXal
         axgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad2434f2asi258652385a.376.2025.05.02.00.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 00:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uAl3p-0001OQ-VO; Fri, 02 May 2025 03:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1uAl3n-0001OC-2u; Fri, 02 May 2025 03:43:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1uAl3k-0001lT-O8; Fri, 02 May 2025 03:43:50 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZpjbN0Qqyz4x5g;
 Fri,  2 May 2025 17:43:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZpjbJ3h4hz4x0s;
 Fri,  2 May 2025 17:43:40 +1000 (AEST)
Message-ID: <7069b98c-5099-4264-bb9c-da60bae04482@kaod.org>
Date: Fri, 2 May 2025 09:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Introduce AST27x0 multi-SoC machine
To: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 "longzl2@lenovo.com" <longzl2@lenovo.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20250429091855.1948374-1-steven_lee@aspeedtech.com>
 <cdcf1ec9-9b67-42f5-970c-db82c91cf0bb@kaod.org>
 <KL1PR0601MB418091FFA5FBCB0159A577C9858D2@KL1PR0601MB4180.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSBDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQGthb2Qub3JnPsLBeAQTAQIAIgUCW7yjdQIbAwYLCQgHAwIGFQgCCQoL
 BBYCAwECHgECF4AACgkQUaNDx8/77KGRSxAAuMJJMhJdj7acTcFtwof7CDSfoVX0owE2FJdd
 M43hNeTwPWlV5oLCj1BOQo0MVilIpSd9Qu5wqRD8KnN2Bv/rllKPqK2+i8CXymi9hsuzF56m
 76wiPwbsX54jhv/VYY9Al7NBknh6iLYJiC/pgacRCHtSj/wofemSCM48s61s1OleSPSSvJE/
 jYRa0jMXP98N5IEn8rEbkPua/yrm9ynHqi4dKEBCq/F7WDQ+FfUaFQb4ey47A/aSHstzpgsl
 TSDTJDD+Ms8y9x2X5EPKXnI3GRLaCKXVNNtrvbUd9LsKymK3WSbADaX7i0gvMFq7j51P/8yj
 neaUSKSkktHauJAtBNXHMghWm/xJXIVAW8xX5aEiSK7DNp5AM478rDXn9NZFUdLTAScVf7LZ
 VzMFKR0jAVG786b/O5vbxklsww+YXJGvCUvHuysEsz5EEzThTJ6AC5JM2iBn9/63PKiS3ptJ
 QAqzasT6KkZ9fKLdK3qtc6yPaSm22C5ROM3GS+yLy6iWBkJ/nEYh/L/du+TLw7YNbKejBr/J
 ml+V3qZLfuhDjW0GbeJVPzsENuxiNiBbyzlSnAvKlzda/sBDvxmvWhC+nMRQCf47mFr8Xx3w
 WtDSQavnz3zTa0XuEucpwfBuVdk4RlPzNPri6p2KTBhPEvRBdC9wNOdRBtsP9rAPjd52d73O
 wU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhWpOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNL
 SoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZKXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVU
 cP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwpbV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+
 S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc
 9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFUCSLB2AE4wXQkJbApye48qnZ09zc929df5gU6
 hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iSYBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616d
 tb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6gLxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/
 t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1c
 OY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0SdujWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475
 KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/JxIqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8
 o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoX
 ywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjKyKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0
 IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9jhQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Ta
 d2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yops302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it
 +OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/pLHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1n
 HzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBUwYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVIS
 l73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lUXOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY
 3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfAHQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4Pls
 ZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQizDiU6iOrUzBThaMhZO3i927SG2DwWDVzZlt
 KrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gDuVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <KL1PR0601MB418091FFA5FBCB0159A577C9858D2@KL1PR0601MB4180.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vWPF4vYJ7jnJ

On 5/2/25 03:22, Steven Lee wrote:
> Hi Cédric,
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@kaod.org>
>> Sent: Wednesday, April 30, 2025 5:31 PM
>> To: Steven Lee <steven_lee@aspeedtech.com>; Peter Maydell
>> <peter.maydell@linaro.org>; Troy Lee <leetroy@gmail.com>; Jamin Lin
>> <jamin_lin@aspeedtech.com>; Andrew Jeffery
>> <andrew@codeconstruct.com.au>; Joel Stanley <joel@jms.id.au>; open
>> list:ASPEED BMCs <qemu-arm@nongnu.org>; open list:All patches CC here
>> <qemu-devel@nongnu.org>
>> Cc: Troy Lee <troy_lee@aspeedtech.com>; longzl2@lenovo.com; Yunlin Tang
>> <yunlin.tang@aspeedtech.com>
>> Subject: Re: [PATCH v3 0/9] Introduce AST27x0 multi-SoC machine
>>
>> Hello Steven,
>>
>> On 4/29/25 11:18, Steven Lee wrote:
>>> This patch series introduces full core support for the AST27x0 SoC, along with
>> necessary updates to the ASPEED AST27x0 SOC.
>>> The AST27x0 SoC is a new family of ASPEED SoCs featuring 4 Cortex-A35
>> cores and 2 Cortex-M4 cores.
>>>
>>> v1:
>>>     - Map unimplemented devices in SoC memory
>>>     - Intruduce AST2700 CM4 SoC
>>>     - Introduce AST27x0FC Machine
>>>
>>> v2:
>>>     - Remove unused functions
>>>     - Correct hex notation for device addresses in AST27x0 SoC
>>>     - Add AST2700 SSP INTC and AST2700 TSP INTC
>>>     - Split AST27x0 CM4 SoC to AST27x0 SSP SoC and AST27x0 TSP SoC
>>>     - Add AST27x0 A0 SSP SoC and AST27x0 A1 SSP SoC
>>>     - Add AST27x0 A0 TSP SoC and AST27x0 A1 TSP SoC
>>>     - Add functional tests for AST2700FC A0 and AST2700FC A1
>>>     - Add Documentation for AST2700FC
>>>
>>> v3:
>>>     - Remove A0 SoC support and related functional tests
>>
>> Please rebase on upstream QEMU before resending. There are new changes
>> breaking this series (meson, class_init).
>>
>> Also, try compiling the documentation too. The last patch has formatting
>> issues.
>>
> 
> Thanks for the review.
> I'll rebase the series on the top of https://github.com/legoater/qemu/commits/aspeed-next/
> and fix the documentation formatting issues in the v4 patch series.
perfect.

I should merge it on top then.


Thanks,

C.


