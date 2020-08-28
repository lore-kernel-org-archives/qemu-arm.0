Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1193967lfc;
        Thu, 27 Aug 2020 23:17:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnYAFY4vniAnIuZ0Aj24/cBvgSTcBTmTxS5cf57SiHpRAngyVcrPZx2/S0QabVbkB6ostD
X-Received: by 2002:a05:6902:4a9:: with SMTP id r9mr376332ybs.242.1598595440642;
        Thu, 27 Aug 2020 23:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598595440; cv=none;
        d=google.com; s=arc-20160816;
        b=DaB5sk9rbJguzM6bb/U9anNjEueiM2oJBp84IQozscVYkxhic4o5TLEqybXapT4sOz
         PwvqU7FYY6ZO7uO52UQHMqNkM5Cw4mxHiaTafKMkjwA1KNxr/jARK1yWA/Ka1wqJpiTa
         7uWLlv6r206McgxipcgGm562s3cV5W0suA1fMwkmI6iUpb9J/XIVyvsPqWjcLLKAFAkI
         CTUMXSXW3UBTJ6O0LIchLDULuUfFov1aPNE/8Cqdx2AQNGYtX0safg4zDN9mPznde4io
         YSzak6SW0dCgxrYmSPfgMEKKi6gLVkyXkpH/V7VmyWLX8spstmv7BJaVqL2u6c/OimpH
         TwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=50DLv6sZM/UQPBxKkXvx6s9GEfFww4i/yf143cmF5L8=;
        b=jbTZghANKs/2sY2tG7u14//JcKuyxDIGPYwGqA4+fRuCP1uGMcU7RTVgXAZNVOhtpZ
         XhpZvOUt98NMth3yPmY05b79iAAxGvSoZ3CQaYa7DpLd4BbTZkPrMmF2Dfs4hSibbHmb
         vWBb/AUUH5uibUqVK7k9LEiofSZCdtN1K2qwGADp0aMVt1S6nF09do7VqJRiYdqt/yeS
         Wq0/zmJwfAoZ1x7gu8SI3SI9idUBkUTKadBHoSnt6N6Us+HlX4QwqNj6fbAby7xJvt1r
         MFZD6dFWQRqLBbZp/LN6w2irvh4tr8UBWLJzw2I+58QaJQu0SGDt8+ASmPShKckOUx9H
         jlWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si5273686ybk.319.2020.08.27.23.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 23:17:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBXhQ-0003sJ-2b
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 02:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kBXgg-0003Rs-Ar; Fri, 28 Aug 2020 02:16:34 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kBXgd-0007YL-OL; Fri, 28 Aug 2020 02:16:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.107])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CC00A54CDE41;
 Fri, 28 Aug 2020 08:16:27 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 28 Aug
 2020 08:16:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002934ce7b5-680f-4e07-919f-195c73ecf257,
 83DB9928FED85C7E3E19C59E4C9B962512512EEC) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 05/21] hw/arm/aspeed: Add board model for Supermicro
 X11 BMC
To: Peter Maydell <peter.maydell@linaro.org>, Erik Smit
 <erik.lucas.smit@gmail.com>
References: <20200819100956.2216690-1-clg@kaod.org>
 <20200819100956.2216690-6-clg@kaod.org>
 <CAFEAcA_GwY5qqLFYcttobLRnt_b=HoMNHMXEZrDHyRZJ4mjGug@mail.gmail.com>
 <CA+MHfou4eE3wYCMv4ojLSnnUeffKy73V6FhpaBC551bsfkqa+A@mail.gmail.com>
 <CAFEAcA9e=wbzXD8-Fim7JE4etNc0kmB5_Uuh7=q3tUa0vmk__w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6b9451ad-ab31-53d0-9352-465c6a01af89@kaod.org>
Date: Fri, 28 Aug 2020 08:16:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9e=wbzXD8-Fim7JE4etNc0kmB5_Uuh7=q3tUa0vmk__w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8de38938-96f9-47cc-8b2e-fac0a5f118dc
X-Ovh-Tracer-Id: 11617879667574737702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddviedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejhfdvffdtleffueffffeitefhtdejueevgeefveffjeevjeelvdevleehhffgffenucffohhmrghinhepshhuphgvrhhmihgtrhhordgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 02:16:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.782,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wzM0Qy+XuAoF

On 8/25/20 5:18 PM, Peter Maydell wrote:
> On Tue, 25 Aug 2020 at 15:37, Erik Smit <erik.lucas.smit@gmail.com> wrote:
>> On Tue, Aug 25, 2020, 4:33 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Wed, 19 Aug 2020 at 11:10, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> From: erik-smit <erik.lucas.smit@gmail.com>
>>>>
>>>> The BMC Firmware can be downloaded from :
>>>>
>>>>   https://www.supermicro.com/en/products/motherboard/X11SSL-F
>>>>
>>>> Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
>>>
>>> Should the name in the From and Signed-off-by: here be
>>> "Erik Smit" rather than "erik-smit" ?
>>
>> I don't know if it matters. I'm fine with either.
> 
> It's supposed to be "your real name" (ie not a pseudonym,
> email address or username); obviously for some people that
> really is a single word or all-lower-case, but I usually
> check because separate-words-with-caps is the more common.


I have changed it to "Erik Smit" in the patchset.

Thanks,

C.
