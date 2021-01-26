Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1118707lfd;
        Mon, 25 Jan 2021 23:10:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ+CGQKVDNJeV+D8M6MiNGrDSBVsHd0seB8D9i3X6YbqgaA/gA0W4H0IS1OtIhDl0TFTqF
X-Received: by 2002:a5b:eca:: with SMTP id a10mr6842520ybs.91.1611645007622;
        Mon, 25 Jan 2021 23:10:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611645007; cv=none;
        d=google.com; s=arc-20160816;
        b=ufdbdpa5VnxR3hbImuoTatwvlNWdF26gcU8BGUXkAy/k0rOGP1otzQnVA/kgHa7c1E
         JB/rSA9GWa7p9jrg8yVjriodK5KKTHX5CNpXv2hllvP+Zp2KKdset8ntyU9lhpDW8hfu
         g7YvfRGKQhSB4WXptEiRENPyN4BPZRCUxZbE2KuN08vqtzab2GwCUdim0Ew/650p8uQt
         bFkkO5+1Y/mbKAXIYZTqfgnnNvj9RmE0kKKu8J83EnDaW7Wx+6ewh9Io2h4YoP7qlWqg
         7+T2uMugD0YbS71QVuPL4+L2rCKXkqK8A8bT76Hg0CslBjQ8ZbzoM+qSJXd2jofe4JNq
         zB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=eABIBSfHg25qEjVsDPleCpqtmNsP3swnJ0Ty981Y1Vs=;
        b=qkI3yehnx1ZfP59l94hF6KLw5UQmxLsrAZ4kUxDl5GGKpSZDpS4zW518jmBlw4r2fD
         8prfwQkUgYjZ9b/kpSY55Ai1bD+TPWs2dfQ1jY/X1mueaWzvLzj0uphXUD8ZRBPXWV8D
         U3T3OyMHQS1gJf6vc7Cadl3X1qicdmfzcMzhXE9u//NQUEM30XCz7uFTsZbuJGJZzsXZ
         Uko6FhKZMgNFy2v7u3x31TzWXaRf++7o0xoMBaK0OhKTHO7k0EosSCe2BhZV7m2atvff
         z0Asu1g3aaM1gZgdwGYeVgZEOaKZuGQXDRakxpEFSunEcjjXCULRQTVAVce5hxUnA38t
         0oJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s64si17984508ybb.2.2021.01.25.23.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 23:10:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4IUI-0006Dj-UL
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 02:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4ITy-0006BM-CC; Tue, 26 Jan 2021 02:09:46 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:51157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4ITv-0007oQ-P5; Tue, 26 Jan 2021 02:09:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 647777F4D16C;
 Tue, 26 Jan 2021 08:09:39 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 26 Jan
 2021 08:09:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0066d7b8d4f-3e69-48f2-93ca-e44363ec3563,
 5D556FFD98B84F2EA34A7A8BED120B5F5B9D3368) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [RFC PATCH v2 04/20] hw/arm/aspeed_soc: Mark the device with no
 migratable fields
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, <qemu-devel@nongnu.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-5-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2314bde6-58da-fde4-885a-1df380be766b@kaod.org>
Date: Tue, 26 Jan 2021 08:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117192446.23753-5-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7cb56b63-8a51-4b8c-807c-7abb7bb3ea6d
X-Ovh-Tracer-Id: 13849413280123685834
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h9dFlToZVRJ6

On 1/17/21 8:24 PM, Philippe Mathieu-Daudé wrote:
> This device doesn't have fields to migrate. Be explicit
> by using vmstate_qdev_no_state_to_migrate.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 
