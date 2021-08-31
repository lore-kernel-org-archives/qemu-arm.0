Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5070357lfb;
        Tue, 31 Aug 2021 07:07:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsSI8PTMUgBfg9ZFxZ1mlatFQS267iuJbcRzCn8SdYIcg8vVM+Q33V6TzkpBzRDOcUcui3
X-Received: by 2002:a5d:456d:: with SMTP id a13mr31881477wrc.364.1630418842392;
        Tue, 31 Aug 2021 07:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630418842; cv=none;
        d=google.com; s=arc-20160816;
        b=aBQp7JZOziwiHNg/Mtzb9Ey0EPWB/zAke4gMrm0x0LSjQOWX/FV2Ftl/yIl9E9FgWJ
         MP2gNnAUHwUB7jvmNenseo5O5OGyvRIGHv4tPwHYUBOgQmmphJJsXFDnEq8ZtRUbP+NL
         P6ZYGA0TSFwFVBDP2/yFaMINs+VqBuVAWNrLeeBMWjfqylY7ViYR6qwqDx35/e6bvcyv
         u5APwLNVEEqMO3L/eVyYLUKtx+2emuLgvGbyDxP5dhWqWfQ+USLDVhW907lu1fQdJViX
         fwV6JX/D65k3IweL9R11SmZj9rBVW3Scqq+iXDl16d+c2y78+Fp0apTgMhaLOKm2iVry
         J8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+AJRWB+eo9/ROiL8xmMW1SiSXwWbZ7hu955VsGxw0Uw=;
        b=qN2uOrRei8JvkxL8fkmAF5bDF3hCsDHK8kYUL9YSqsuXheontAlLjpA1qYM2vYEST0
         V4Rim8Lf9zzoK/bP65cILxN1CabK/zULJVaGYPwRd3OPHcoyPTA7CXuO2dqPOkLkROI5
         kAkTX2vHOzpGt+x3ZynbT5HlA7N1kxzyDQCAs95pev22N/HA32aDXvY6+1zEBGRPvvMB
         V1DUuC+zet3k++Z56J7l0nz3WQxm3NOQXH116Or6ATiNL2Cg38a4H5ghLW91zdrpTR30
         SZZjM/Yw626Et2Mf7GsvBUYa3CeQ5goiYsrZfW4v5zddqv82jJhvY+dXzIDCqac41+3F
         tFRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si2374172wml.38.2021.08.31.07.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 07:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL4Q4-00051h-PN
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 10:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mL4PP-0003QQ-61
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 10:06:39 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:56885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mL4PM-0007Ga-WA
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 10:06:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E2FDC210F1;
 Tue, 31 Aug 2021 14:06:32 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 Aug
 2021 16:06:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0048c262bfa-db0b-4b11-be95-01163435858f,
 3D02C4E7E229260F021FFF691A6C377EE278DEFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
To: Peter Delevoryas <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <a67c22a2-eb11-87f5-54e7-14c2d771861b@kaod.org>
 <65C83ADA-7546-40AF-9EF5-C990FC09F0B4@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <90a52916-d043-4ab7-c27c-5dc62a027f67@kaod.org>
Date: Tue, 31 Aug 2021 16:06:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <65C83ADA-7546-40AF-9EF5-C990FC09F0B4@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eae2fda6-f637-4716-8346-4ab83f950d76
X-Ovh-Tracer-Id: 3992441073260006307
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S5wT9rDvL+J+

On 8/31/21 3:51 PM, Peter Delevoryas wrote:
> I’ll resend PATCH 5, and like you’re suggesting, I can use the existing ast2600-evb machine type for testing.
> 
>     # Setup serial_hd(1) as UART1 in 2600 SoC realize (I won’t include this in the diff though)
>     UART5=serial_hd(0)
>     UART1=serial_hd(1)
> 
>     qemu-system-arm -machine ast2600-evb -serial null -serial stdio

yes. that's one way to do it. But it's a bit hacky. 

On the other hand, if we were to initialize all 5 UARTs, the user would 
have to add 4 "-serial null" devices to use UART5 as a console (and none 
for UART1). Which is not that good for a user API. We added the 'macs_mask' 
for a similar reason btw.

I think your proposal plus the extra SoC property is better though. 

Thanks for testing.

C.
