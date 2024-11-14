Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp155030njc;
        Wed, 13 Nov 2024 23:39:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqxOCBP9M7EJeyQoRmuFWz4ql0NIVy9/B0G9XAB8ghSUyY96btrd9KMDJPgQ4IY9qXRPHnld5wnwPX0A==@linaro.org
X-Google-Smtp-Source: AGHT+IEXX/lobY/XLOPg51TLyZcgr0gPxNBETP1u6dwzIo8tQbuvp+4PiDcc8FOWkGpejF2O7LZf
X-Received: by 2002:a05:622a:1988:b0:461:9d9:15c2 with SMTP id d75a77b69052e-463401610e0mr128903351cf.1.1731569965512;
        Wed, 13 Nov 2024 23:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731569965; cv=none;
        d=google.com; s=arc-20240605;
        b=kZp4k9+7KXK06izQVrg3B3eavfmZfViq+SH9rIZOdh6VUZzm5t5Xx79lIkpTarbk2K
         mT7QCAoM02wm0PPOQs/+0VVtR/TXXKp+aZO490g8c3U3oEEs4AI05c5zDfgW0h0TBtMH
         TA39fwKzpNUsu4miLPyphx5gdH7e3QgWhXKNXuiXgLZ11ofscDOxI2Jba4z90YDjYnOr
         vUTDb6S4HBUkwCrn5/AY/4EG5l7j/LL9tqmNxmRDGlWQA1hJmEP9Cg356vaoDyYqFNrI
         fNytsjDbZJYbv5vAc2abvs8fm9R3w3+EBEUrDndb2aQ1UTjzZfBmALm9SIHUlKazoehy
         XPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=CGUFON/8zkiOfY/iJlx6Q4cqXnmPVFmHrNJY2sB9lmQ=;
        fh=oYAkwPHFdJ9u0eDvwJfliFAiwUWbZzxx8J31NdrWVOo=;
        b=fNynvrS6BX5lZy3l888R/AdoAICTfkOicQ8Cf/+QydnKONYduasxMDzoPOInvifDgw
         NejQviEa4AxK/y+CR1QSmJ8UK8srQgByP0XqPjf/PeVTvyK9MdzcYFr6afn2DW4NpVll
         OKfSu/rUSazWDTqwNz/sy9RaMPqe5IwADe/IXQUlt77TxLdgqdlUZHRYxSUhbGBpebi/
         ltnCD0YLvSFfZ9PJ1EiTQzGQom+no6NdxeCc+O+CotiaI2qM/6Q+K2waDstyh2Jgh2LL
         byk0Z+W6L2Hmj86W0FsAs0Znqeu23ahUb1ACAJOUjl9ICuxRTlOSd0SFvcOF7F5DIzPq
         uZ5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aa96d46si5275151cf.327.2024.11.13.23.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 23:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBURJ-0001nv-IF; Thu, 14 Nov 2024 02:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qUE+=SJ=kaod.org=clg@ozlabs.org>)
 id 1tBURH-0001mh-OZ; Thu, 14 Nov 2024 02:38:51 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qUE+=SJ=kaod.org=clg@ozlabs.org>)
 id 1tBURF-0001vb-QP; Thu, 14 Nov 2024 02:38:51 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XpsTZ1Rsfz4x9G;
 Thu, 14 Nov 2024 18:38:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpsTS4LYTz4wcy;
 Thu, 14 Nov 2024 18:38:36 +1100 (AEDT)
Message-ID: <ed89cef1-96cc-49f1-8f22-655fe0677f2b@kaod.org>
Date: Thu, 14 Nov 2024 08:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Fix write incorrect data into flash in user mode
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
 <9fe3e1cd-6aed-473f-9193-8541a202b7a0@kaod.org>
 <SI2PR06MB50419A139B7233B352CD1E31FC4E2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <SI2PR06MB50413F4922CA4FD3F61E12CBFC5B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <SI2PR06MB50413F4922CA4FD3F61E12CBFC5B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=qUE+=SJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: 3JNwPyLBz0eM

Hello Jamin,

On 11/14/24 06:30, Jamin Lin wrote:
> Hi Cedric,
> 
>> Subject: RE: [PATCH v2 00/18] Fix write incorrect data into flash in user mode
>>
>> Hi Cedric,
>>
>>> Subject: Re: [PATCH v2 00/18] Fix write incorrect data into flash in
>>> user mode
>>>
>>> Hello Jamin,
>>>
>>> On 10/22/24 11:40, Jamin Lin wrote:
>>>> change from v1:
>>>>    1. Fix write incorrect data into flash in user mode.
>>>>    2. Refactor aspeed smc qtest testcases to support AST2600, AST2500
>>>> and AST1030.
>>>>    3. Add ast2700 smc qtest testcase to support AST2700.
>>>>
>>>> change from v2:
>>>> 1. Introduce a new aspeed-smc-utils.c to place common testcases.
>>>> 2. Fix hardcode attach flash model of spi controllers 3. Add
>>>> reviewers suggestion and fix review issue.
>>> I have applied 1-6,8 to aspeed-next and should send a PR with them. I
>>> kept the test extensions for later, to take a closer a look and also
>>> because I will be on PTO next week. Tests can be merged in the next PR
>>> if we have time in this cycle or in QEMU 10.0.
>>>
>> Got it and thanks for help.
>> Jamin
>>> Thanks,
> 
> Could you please help to review patch 17 and 18 ?
> Do I need to re-send patch from 9 to 18 of this patch series?

Not yet. I have some comments to send but I am busy on another topic.

We have some time before QEMU 10.0. They are in my aspeed-9.2 branch,
so that I don't forget about them.

Thanks,

C.


