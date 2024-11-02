Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1136389njc;
        Sat, 2 Nov 2024 07:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNeCWNED0WILg1/twIFwViMCdbnZwTq6edjJ+3nQF18j5UK5CJMqP/i5UBYvmrRZwI6SZ2y5jvla3W3w==@linaro.org
X-Google-Smtp-Source: AGHT+IEoLf1ofkGtDKaJ0PFaJHXwMeUZ/lxtmIlv6k2EyaTSSyuOujnmPeBXy+hqyb3KcFHsilWP
X-Received: by 2002:a05:620a:2415:b0:7b1:50ba:76e8 with SMTP id af79cd13be357-7b2f24dd667mr1348789985a.23.1730559584397;
        Sat, 02 Nov 2024 07:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730559584; cv=none;
        d=google.com; s=arc-20240605;
        b=JICIoOYRDLWeePKE680bP6KHGv5xLwnGGhru7FN8l85lXEXsJAv/l/ypF74v+k0fXL
         gpWNE1al2ye/OwVZZjoKw5Pf8CX1yc0hLRSa1dyivSYdanMezjLyfQ7eix2xFKKeFgGV
         yy360MB1J1NyG7CgVZpxwN6e08Cb0rMBUtHfbJDkt3yeV3aCLxClVIo3z75xUFGhaJeg
         83BgtrLdmGpqtU3Tbtm+n7O20qJCPI3L3+biuwhUVDLa17pvF3DU5Y85Clhokb7kGxrS
         YPPUum+QFZPlAeO9wXhL5g8yM/9nrCD9Du7KZjert9gbum8//kUM+91YTIONYsKvR23E
         zk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=awjxor/cCag8ZSC45VyVRN4t5fK85IZFxpUUEJWo+eY=;
        fh=69NGYnohrDubQOWj6solZL1B6bi1lpItFR35GWUpHWE=;
        b=Toz/wcsgBfonnStLbFI4toDy7CqQ/FblHPAhrpuqyHoGyv/Zv72PQod3f9wNNDg3hT
         0NXYMfluOCwzwSrDjJYsNL+YDp0+Z9bIbWNnoPqC81apwJl018wOxCSA/NoLtjFeOVRG
         nyDxCWRLIPuLyhMZ0kyZgVFGDsYiKXHn4uow7v/Tjlu1koAh5o5b2oeJt/oIy0wlBs8V
         Zn2rDRsMen73pVOExdDC7jl0gmhfRF4w6ibsnT8ZAUwiEmcdA1x5mX/xcrcavYAlsGjF
         wRUdiK3UbuFmvItdM3RP3iPE764i7LZoDgovuJ7Wn7Po/i+/BQsB8cqTN2+HKESJdKRN
         rn1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ab1658si647413885a.568.2024.11.02.07.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Nov 2024 07:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7FbE-0004fO-3z; Sat, 02 Nov 2024 10:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7FbB-0004f0-Gh; Sat, 02 Nov 2024 10:59:33 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uVOK=R5=kaod.org=clg@ozlabs.org>)
 id 1t7Fb8-0004AB-WB; Sat, 02 Nov 2024 10:59:32 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Xggqf4QNzz4x8g;
 Sun,  3 Nov 2024 01:59:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xggqb641xz4x7H;
 Sun,  3 Nov 2024 01:59:23 +1100 (AEDT)
Message-ID: <cc10d775-2924-4fed-a64b-8ab5b320ede7@kaod.org>
Date: Sat, 2 Nov 2024 15:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hw/arm/aspeed_ast27x0: minor IRQ number cleanup
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20241101161125.1901394-1-peter.maydell@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241101161125.1901394-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=uVOK=R5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: CJ4HzwykYDta

On 11/1/24 17:11, Peter Maydell wrote:
> In the course of a conversation on IRC with somebody who was using
> the ast27x0 code as a model for a new board, I noticed that the
> code currently defines a local ARCH_GIC_MAINT_IRQ with a different
> value from the constant of the same name that we define in the
> include/hw/arm/bsa.h header. This patchset cleans that up and
> also another minor awkwardness that I spotted in the process.
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    hw/arm/aspeed_ast27x0: Use bsa.h for PPI definitions
>    hw/arm/aspeed_ast27x0: Avoid hardcoded '256' in IRQ calculation
> 
>   hw/arm/aspeed_ast27x0.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 

Applied to aspeed-next.

Thanks,

C.


