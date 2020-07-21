Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3491454lfm;
        Tue, 21 Jul 2020 10:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9kgNp+GboDrN5x7zhnkegI9HCPv1FK++p2UQ6u+x2T1eGlYJxxxFAwBbRpx9wV3YnD7xo
X-Received: by 2002:a25:9cc6:: with SMTP id z6mr46206743ybo.202.1595353055335;
        Tue, 21 Jul 2020 10:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595353055; cv=none;
        d=google.com; s=arc-20160816;
        b=0vyVfQql7upEQC3HCPS7BGcQIRoJNl5fUHv1JfKYhuHelyJHVao0GjEKTbfHwjQjqI
         kHjIRKokowdSI6f2Hf76Wzjps6QQRTR75j8aawYTC5uw3JhvRF2UhHy9kdW6v/fH5WSu
         rCh1j44wo+Jns0M1fqYH/YLxUUSLv3dT8d/EJP2h4TjQKqBIQaLAkZqYeFBiA5rk/wGZ
         CY+Jgp8DauepzoNubSUp0sbC0i2SgKnDHqtRZuqvzy0PkXc/H0ARZrX150+qMXYcBPuP
         y0oHsDHjV3HcQDn3LvucFmt/OhcPaTFFgFLmkGNkBglZY9oWjJilCg7LEl7w700HpOsW
         sLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Rmq/hOMjUnj8LdZcw5eZree6a3G2ICU6sZfzTbvBBOE=;
        b=R1Iyfl/Mpe1puG9uB5Z/ZtKsmkhu4mbQAR/qtyxJuhoPRLA2BibgL9PNg1ShckZLLE
         te5FuOPtoH06O5+u7klsDwRndyPK2OMQ3A5OkTP4XRFyoBzTADJHwILACupP7oiF6c/r
         Kcph0/M1FQkMbG40NdeQUpvs7hToT+a2o92YiXqHEqxwQvhV2dGivGBx78uq+cbqro+a
         kIvTt4aIrC+mKbKv28P+JA7XCg0V4UlZmOPUxnRWfMkNTlN5qTkZFw556exMk+OtV9t+
         s6mxnkHknpnOAkr98TR62vOjGY3yXELdQQ0IOcPBzLteZupsu+F+jXLjnPa4VIcFF+57
         Ozew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63si20309091ybc.8.2020.07.21.10.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 10:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxwCs-0007jb-JW
	for alex.bennee@linaro.org; Tue, 21 Jul 2020 13:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jxwCc-0007jO-8l
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 13:37:18 -0400
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]:39999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jxwCa-0000Km-4x
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 13:37:17 -0400
Received: from player788.ha.ovh.net (unknown [10.110.171.117])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id A1E7728D604
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2020 19:37:05 +0200 (CEST)
Received: from kaod.org (bad36-1-78-202-132-1.fbx.proxad.net [78.202.132.1])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 927871490F6D1;
 Tue, 21 Jul 2020 17:36:48 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001ccd963cd-f319-4ddd-b0b3-80e0a7efa07f,622D537D4FED1CEB9E006CC2F7D967EDAF2A62E4)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 2/4] m25p80: Improve command handling for Jedec commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>
References: <20200206183219.3756-1-linux@roeck-us.net>
 <20200206183219.3756-2-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <eb21047a-aa9f-eb39-af8a-b5858e01fee5@kaod.org>
Date: Tue, 21 Jul 2020 19:36:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200206183219.3756-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2864570841254169491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrgeeigdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehfeejgfeuueeutefgudevfedtvdduvdeiffekudefueduveefjeefheelgffgvdenucffohhmrghinhepshhuphgvrhhmihgtrhhordgtohhmnecukfhppedtrddtrddtrddtpdejkedrvddtvddrudefvddrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.182.191; envelope-from=clg@kaod.org;
 helo=13.mo5.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 13:37:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Erik Smit <erik.lucas.smit@gmail.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPu2dsFI1v6I

Hello,

On 2/6/20 7:32 PM, Guenter Roeck wrote:
> When requesting JEDEC data using the JEDEC_READ command, the Linux kernel
> always requests 6 bytes. The current implementation only returns three
> bytes, and interprets the remaining three bytes as new commands.
> While this does not matter most of the time, it is at the very least
> confusing. To avoid the problem, always report up to 6 bytes of JEDEC
> data. Fill remaining data with 0.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Split patch into two parts; improved decription
> 
>  hw/block/m25p80.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 5ff8d270c4..53bf63856f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          for (i = 0; i < s->pi->id_len; i++) {
>              s->data[i] = s->pi->id[i];
>          }
> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> +            s->data[i] = 0;
> +        }

This is breaking an old firmware (Linux version 2.6.28.9) for a SuperMicro
board : 

	https://www.supermicro.com/en/products/motherboard/X11SSL-F 

which expects the flash ID to repeat. Erik solved the problem with the patch 
below and I think it makes sense to wrap around. Anyone knows what should be 
the expected behavior ? 

Thanks,

C. 


diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8227088441..5000930800 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1041,7 +1041,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             s->data[i] = s->pi->id[i];
         }
         for (; i < SPI_NOR_MAX_ID_LEN; i++) {
-            s->data[i] = 0;
+            s->data[i] = s->pi->id[i % s->pi->id_len];
         }

         s->len = SPI_NOR_MAX_ID_LEN;

