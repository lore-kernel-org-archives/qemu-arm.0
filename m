Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1542285njk;
        Thu, 18 Jul 2024 09:19:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmJ3e1A2YysabULXzM+HNgOj+44MVZCY/i5hbKrekVPfvFGr77Xp4nb1CjWqEDx8DWDBy7B7/q012501up5aUdzBahB54r
X-Google-Smtp-Source: AGHT+IHylD7y20AqJ7yTNJK/OCen60YvsaW3b08+mFOZqmdRQXtjApCEsj6qFTAlpbUw11SwcNK/
X-Received: by 2002:a0d:f582:0:b0:664:e8aa:26dd with SMTP id 00721157ae682-664fe263063mr60335027b3.24.1721319550362;
        Thu, 18 Jul 2024 09:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721319550; cv=none;
        d=google.com; s=arc-20160816;
        b=EK+Wv1M/qek8PhWOr5V842GnAe5UkX7/OJV0XvZDn0GWYtfWYBmG2yJwgoAV0pydin
         vKiJNxvshvAq9+lhnuT8zPJ8XOLEla3TIPw4iUWZWYPvWXZwNaR4JdTyoZs8tzOxLfCG
         tD0irnJNQvwVdPHivlp7BY7hWj+WgKRAUgadgmdkxlla8lQOGMoROntquYpkfVwoJO+e
         svRac795xBWGZ17PHk9m7AAAzvJn/ZqpR4BjLlsiOVZr3CcXoCAbq+9tCp/xSGMEuHcC
         kwo5E/EJ6fMxCI5ccjBuK0PmhOmdYJ++GeTSrZConJ0ORdwg6TLU3WXaJaA90t35dQz8
         XCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Phow8dJL8g1TNU+/wQgC7hi9YGy21QQc3CDb78pnsuc=;
        fh=e8fKElCAwnjn7OXumipD+0CJsAEYvgF0r7dZWXEkaJI=;
        b=Sx1QQuUWjC4GpR/+7IpFrWB7xmpkDWgSJrMSIWBnDPfWPC46LcsFYyUy4wNORcsUe/
         bSIamI0cTprJ0Yp/a0w4rXfKpQ9XUt8bbub2TU+iKfEsEm80c13q5RbydtI+w55sYKOu
         ioc1ki41jg/VWjIYgu17v2PhOS/M2JR77Wcpw7Dz7EjPHgz7lyDbtWsvsOm2rhtchDkC
         ubXxhnUZ434t3DZiMMUSkMEPqs/Et9nRvY81o/oURMYqzj0H0qFsHPzTnSnoa89i5PJP
         8tGenRMRDt97loOzDiuBndX0rNkELiJO+cNY/VPKOES4WBvuY1fyZoWlnwm24GDksV9z
         clKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a193972be9si90484585a.293.2024.07.18.09.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 09:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUTqS-0004lH-AC; Thu, 18 Jul 2024 12:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUTqN-0004il-Ve; Thu, 18 Jul 2024 12:19:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3riu=OS=kaod.org=clg@ozlabs.org>)
 id 1sUTqK-00084D-NA; Thu, 18 Jul 2024 12:18:59 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WPyfh5M3kz4x3n;
 Fri, 19 Jul 2024 02:18:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPyfd0YR3z4x3J;
 Fri, 19 Jul 2024 02:18:48 +1000 (AEST)
Message-ID: <70226be1-a54b-42ba-8680-edb0f8ecf4b0@kaod.org>
Date: Thu, 18 Jul 2024 18:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] aspeed: Add boot from eMMC support (AST2600)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240717063022.549849-1-clg@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240717063022.549849-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3riu=OS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: uS3UTYzHd8Kw

On 7/17/24 08:30, Cédric Le Goater wrote:
> Hello,
> 
> This series enables boot from eMMC on the rainier-bmc machine, which
> is the default behavior and also on the AST2600 EVB using a machine
> option to change the default.
> 
> First 6 patches adjust the machine setup and HW strapping to boot from
> eMMC, the last 2 are for the AST2600 EVB and are optional.
> 
> Thanks,
> 
> C.
> 
> Changes since v1:
> 
>   - Rebased on upstream, now that the eMMC device model is available
>   - Rephrased commit logs
>   - Fixed SCU prefix of bit definitions
>   - Tuned 'boot-config' and 'boot-partition-size' eMMC properties
> 
> Cédric Le Goater (8):
>    aspeed: Change type of eMMC device
>    aspeed: Load eMMC first boot area as a boot rom
>    aspeed/scu: Add boot-from-eMMC HW strapping bit for AST2600 SoC
>    aspeed: Introduce a AspeedSoCClass 'boot_from_emmc' handler
>    aspeed: Tune eMMC device properties to reflect HW strapping
>    aspeed: Add boot-from-eMMC HW strapping bit to rainier-bmc machine
>    aspeed: Introduce a 'hw_strap1' machine attribute
>    aspeed: Introduce a 'boot-emmc' machine option
> 
>   docs/system/arm/aspeed.rst   |  2 ++
>   include/hw/arm/aspeed_soc.h  |  1 +
>   include/hw/misc/aspeed_scu.h |  4 +++
>   hw/arm/aspeed.c              | 62 +++++++++++++++++++++++++++++++-----
>   hw/arm/aspeed_ast2600.c      |  8 +++++
>   hw/arm/aspeed_soc_common.c   |  7 ++++
>   6 files changed, 76 insertions(+), 8 deletions(-)
> 


Applied to aspeed-next.

Thanks,

C.


