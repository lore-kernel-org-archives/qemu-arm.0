Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp128870lff;
        Wed, 16 Jun 2021 02:06:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfKim1NQD4IZBvFbHVmKrxWPwAChUHCmGpoHCjnubLdttEsmyw2924o03yjknAb0QKTGKu
X-Received: by 2002:ab0:4046:: with SMTP id h64mr3507120uad.43.1623834377294;
        Wed, 16 Jun 2021 02:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623834377; cv=none;
        d=google.com; s=arc-20160816;
        b=fkOCR5zd5qRsiTmr/RfgPT1QN1sCH9KEtTUUgVr6BX2n2kVPnLOrLLiXeimjXiR+bk
         v+EETOZyBhaA6z7jhFbyFwtE5UFXsK5bL81BiN6NfYA9Ao3KOLBQN6yrYbH60seus3Ek
         zyBGHPWE9RHLFQUtCcCzE6V1IyvQHKqoD7Zp+kayIr2yhO26hzzNk1pU0scLALYUNHnH
         1+SI4mWzeGsKjtPxOw1fjcyka41j9E+gdPV5hccBi0EbD+u/RtHrZRUqSisXEq869Vyb
         cDOaVGQucQAWzb2pUdnjbD9IjeVuQyUJYUAWwzr+lL9TVNIEbn0lNbEGuKX5XlnWoaax
         /PTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=J2ENmH4aK1LUZK4j2LHL6mdoUQ5GHb4uO0cWVSl4XlQ=;
        b=x92NidfFRPYfnDcVELWcbCGhQwywKShLxE7rm6HlwTm4rDwUhp8n+PWd8heqWfk80M
         4CFNQNCJqzdkR8yARJkxl2RctJr9pPzZDkoA/dLmjSEYRnly+Z96Dzxw5sDrWKOHyGiB
         aJBYr8HDjwigkn3GCkfb78OLKzl23huzSJjgDhhhbdD1Ft+JFBaKEO3bQWK09c62hLDv
         VaOFK3ZY6XGkxzT1cdRjlwx9NhPe7RLzl8vxZOv7WCq/flzKDjrsv7aPPH0NK4Ixt/gL
         0+guqbPslADDUzB7fFRIKRtt/7LKhhl7+hLjBgCM73EKkVlNi/7sM/QatMQ0mpXWlnrA
         PemA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24si962363uar.184.2021.06.16.02.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 02:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltRV2-0003LW-GJ
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 05:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUO-0002sH-B0
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 05:05:36 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:50361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUI-0007yX-Jv
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 05:05:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 8DCC014004D;
 Wed, 16 Jun 2021 09:05:25 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 16 Jun
 2021 11:05:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059fbf1422-bcba-4473-872a-5e395f123ce4,
 06345D7E1B8C8FAD34147FE460F0DA442DB8F7FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 2/2] docs/system/arm: Add quanta-gbs-bmc reference
To: Patrick Venture <venture@google.com>, <hskinnemoen@google.com>,
 <kfting@nuvoton.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20210615192848.1065297-1-venture@google.com>
 <20210615192848.1065297-3-venture@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c98887ca-33b2-e8b7-6413-535ab9f430a1@kaod.org>
Date: Wed, 16 Jun 2021 11:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615192848.1065297-3-venture@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e2e9d053-da1a-469b-8efe-8e9e3699431c
X-Ovh-Tracer-Id: 13750897037679496044
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PqurNsTxiYSg

On 6/15/21 9:28 PM, Patrick Venture wrote:
> Add line item reference to quanta-gbs-bmc machine.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  docs/system/arm/nuvoton.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index ca011bd479..197d149f66 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -1,4 +1,4 @@
> -Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
> +Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
>  =====================================================
>  
>  The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
> @@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
>  The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
>  Hyperscale applications. The following machines are based on this chip :
>  
> +- ``quanta-gbs-bmc``    Quanta GBS server BMC
>  - ``quanta-gsj``        Quanta GSJ server BMC
>  
>  There are also two more SoCs, NPCM710 and NPCM705, which are single-core
> 

