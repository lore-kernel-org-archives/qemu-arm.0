Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5200751lfb;
        Tue, 31 Aug 2021 09:37:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhctOprsl7VIUvEiwEo685HvZ/PQrTAaXZs3YdULi1Mg9li6qjxb/MV6Up1dsA5tGYI/ou
X-Received: by 2002:ab0:6887:: with SMTP id t7mr19645619uar.114.1630427870943;
        Tue, 31 Aug 2021 09:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630427870; cv=none;
        d=google.com; s=arc-20160816;
        b=UDM/d8lHYA/npSIbIx/6xhI04ENbUg2d+xNA74lk7k64IexukmbHquIngQB7SMcP6y
         8fN/Ew4N4M+ztJZjQBCrAZOZZgCPvcjD6DSrUYCvEh+trT6yeXd/53D2rYU6i6vDkhms
         SlYBeI47TFCZppl5e9WNO0BTfr8Ny8upxofE+795nU4QyzWHjDtKBBr4qqr/3FXlZb7S
         HHbgG6VKzFpOxeyl0zGKhSW6rzHLsDg7jKpx/momo7OTcaN8IrABFz76Ivc/qbvebVid
         Kvyy4GzWqpcySxymhU5c1fablf/draudzV96k/4U+z3NnmTgOjIEKAfyZu/I/BGKAQyy
         GbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ZqiF3G+doBrs5B7cN1wBe2cqqVLsLe8N6lqLayFhZVQ=;
        b=OkIW5x2y4p+qpIzCJ3N3JY7bEBnSmzLnyZdop6ttKVhFzTZoJ6NAciuNb/DYknoCpv
         yCHhD7BNVpRByzxFq3ahsz3vBvA0z40AuP/7O+hdwjoDJF+mmNYa0ohb8xy1aUpmFlGl
         nN2YhEMUwa9dTtcBZzbzb0hP2b4gxL3/aaxaKR/p6DwEK278BByjAJ6a8lPlCY3kBCYi
         P31VCD/PurOC4S18BHDCQGkqDkZzM9rLldtb3n0kFBA32l3+Ka/PhQybo89jp4FwKCds
         g3hhZTaTppTaNhZYCznSjKkfF4Bk1hdndelN3YPXC33LtcxZYLxhNuIPFm5DiiwRuucH
         xArw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si5883026uaq.26.2021.08.31.09.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 09:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL6li-0007ST-2x
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 12:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL6lS-0007SD-Cz; Tue, 31 Aug 2021 12:37:34 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL6lO-0002yB-3e; Tue, 31 Aug 2021 12:37:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A218FBBC52B8;
 Tue, 31 Aug 2021 18:37:25 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 Aug
 2021 18:37:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005b981459e-59e3-472d-a477-89c00a7071ef,
 3D02C4E7E229260F021FFF691A6C377EE278DEFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Andrew Jeffery
 <andrew@aj.id.au>, Peter Delevoryas <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
 <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
 <a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org>
 <db657491-35df-8c35-3354-98a76492a4a0@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <52d36017-4f7e-d49e-a258-52118efd0a27@kaod.org>
Date: Tue, 31 Aug 2021 18:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <db657491-35df-8c35-3354-98a76492a4a0@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0b3d4826-0b37-4e2f-afd9-75d465a89790
X-Ovh-Tracer-Id: 6540634036975733542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AV9A7/uGEYt8


>> I don't think we should initialize all 5 UARTs of SoC and let the user define 
>> all the expected devices on the command. Unless we want to do something like
>> 'macs_mask' ? but at the SoC level. It might be overkill for the need.
> 
> I'm not sure I'm following what you are suggesting. If we are talking
> about QEMU device initialization, QEMU must initialize all devices
> on the board, regardless the guest code uses them or not.

The console is UART5 by default for all Aspeed boards and the SoC model 
choose not to initialize UARTs [1-4] to simplify the command line and
avoid : 

  -serial null -serial null -serial null -serial null -serial stdio

This new fuji board uses a firmware which enables UART1 for the console. 
So we have to change which UART is initialized. The simplest way is 
to tell the SoC through a property and change appropriately :

    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
                   serial_hd(0), DEVICE_LITTLE_ENDIAN);

The above is doing the shortcut : serial0 <-> UART5.

Cheers,

C.

