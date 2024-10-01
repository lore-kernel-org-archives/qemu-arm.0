Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp218841njl;
        Tue, 1 Oct 2024 07:25:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhZJCAbqdBZElX0tPDdA3WIcNEf9oMKapVguhazjxMwoFJ595YwInOd2jyKlHFnZsqL8wMxsU5PK0xLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHU/o4/7Hbc4F3UeuUccI/S+4i28XfM5wk5u3fgxZZm0/6z/RSxqHWolZCwbEsC5DtC7x/W
X-Received: by 2002:a05:6358:71c6:b0:1ba:4d06:34ca with SMTP id e5c5f4694b2df-1becbcaac6fmr409284455d.27.1727792741060;
        Tue, 01 Oct 2024 07:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727792741; cv=none;
        d=google.com; s=arc-20240605;
        b=QDWJy+yMgYrXV/VeB3cyI+jRNo7hsDWIoaVMeFGMgSQYWz8TyO2UV28+jXnNPG2kAF
         Jg/5WHLj9o95HfqVX1V7JRxBgHvicMmmqJwGuMPpbIrg7Wmb1M/+WsBUVzNh26/UKyDO
         Q1PNeu2hIK+nf2OMAUeL/yDXHQHGBPNTMqvqn49MTRGtgPFr5xgvLcr8QBfBOIGIUGJq
         d0/5HdBS1LQDgyuK2Gg1gfPx9Q1MoQZrOoS7DONdG+HXhcYJY+0RI1P2+WYHir52rin9
         ZyqdoD40QmQk/RNbSjNFoGs3cUz7idWU5BIr/McVJliRWqe8BLYx2pxA5gRws+hjdD3G
         j4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=geHzH/PYZAkGMPO24i18hLYwsJwOdnHwRa96F9T5VgM=;
        fh=oQm81RvuetIWr/WU8c5l4BSpgmoyl+7qw60oMlzP1CY=;
        b=jCMopq+mK1USvGDtKBGf41o7Fw9sUdV+XF9YMA6upmMK2x+qOSp6lE6+UEbxVgSTQJ
         9v2hSOlwAEFC0kXycTOgusuBBBZ+pDXloIaQaSeJZm5rGL8VAMjaWTkvs/9/EXDx6TTP
         IMuT1mqODnIGNVMx5HBbFuG6mF2jrZe7Mo+blIWtMmPD6AOlPLaQQhuQYSv3YR+CsvVc
         3LiMx3T9u/mAzichrM/O+kzRDz9DQHUbC4w++WUdn6P4admt3UrBLQ1lY8eRCnr4j/pE
         XEUrYO5jjep6xhuaxS8bR/xk2Y0arIxHeuuXIUFtl95edezWvocLFsKM4e2od3dSlwPD
         uR5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378710d5si1072641085a.594.2024.10.01.07.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svdoe-0006ef-Iq; Tue, 01 Oct 2024 10:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vEdf=Q5=kaod.org=clg@ozlabs.org>)
 id 1svdnb-0005ex-Pu; Tue, 01 Oct 2024 10:24:26 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vEdf=Q5=kaod.org=clg@ozlabs.org>)
 id 1svdnT-0005nG-5v; Tue, 01 Oct 2024 10:24:21 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XHxH80nTdz4x8P;
 Tue,  1 Oct 2024 21:56:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHxH271JGz4x11;
 Tue,  1 Oct 2024 21:56:05 +1000 (AEST)
Message-ID: <8e725955-8696-4809-a23a-87e390cccb5e@kaod.org>
Date: Tue, 1 Oct 2024 13:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Support GPIO for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
 <SI2PR06MB5041260E63C468FB348E1F2BFC772@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB5041260E63C468FB348E1F2BFC772@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=vEdf=Q5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: d1e5i6TEQbec

On 10/1/24 11:43, Jamin Lin wrote:
> Hi all,
> 
>> Subject: [PATCH v7 0/8] Support GPIO for AST2700
>>
> 
> I don't know why I send this patch series failed to the following email addresses and got the following errors.
> open list:All patches CC here <qemu-devel@nongnu.org>
> open list:ASPEED BMCs <qemu-arm@nongnu.org>
> 
> 2024/10/1 上午 06:43:04 - Server at nongnu.org (2001:470:142:3::10) returned '451 4.4.397 Error communicating with target host. -> 421 4.2.1 Unable to connect ->
> SocketError: Failed to connect. Winsock error code: 10051, Win32 error code: 10051'
> 
> Do you encounter the same issue?

There seem to be an issue with the mailing list. I don't know what
though.

> If no, I will re-send this patch series with Thomas reviewed tag in v8.

I think we are done with this series. I was going to apply it to
aspeed-next when I noticed b4 was not able to retrieve the patchset.
And I don't see much changes in https://patchew.org/QEMU.

So please wait a bit before resending. No hurries.

Thanks,

C.



