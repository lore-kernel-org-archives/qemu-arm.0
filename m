Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1121093ejm;
        Fri, 21 Apr 2023 05:49:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1kxQ4WBCqskIRTWiw2v3rsTjAPF5L3yao9s9+J8CglniQco1QxuqWjruTPy7jWEZfNyCM
X-Received: by 2002:ac8:7e81:0:b0:3ba:26a0:d0ee with SMTP id w1-20020ac87e81000000b003ba26a0d0eemr8607294qtj.52.1682081348374;
        Fri, 21 Apr 2023 05:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682081348; cv=none;
        d=google.com; s=arc-20160816;
        b=qQSo8/impdXyv8s96gQBBZZL7V/m50svVKT/cyMOOQDeeNXUkCD9BKQCY5K6s3kCeU
         o16Urqu/jj3x9C2gvQBbWDaFUmM0KHWOodxmDA0/FLK5Xy++LmGq0m8bhn3wpzxpHMYj
         byjetE5gPNZWSDCHPqmUN6+Od3+wNhrfhUr/a6Z2IK5U1T58ML5RepNhH6l/OhCvby6X
         wMc/JGbSL8G3mE2dPhWTSQr53PikuEI/DL1f7qsUdZVM5sF4nhFKmnxghkCkS+KB4zkU
         0WmWaz02lHn1RmDwGrRhWRY7ePtAMjHVFi7nxUw/ItfDzuzbnHlCjLpSQRP06B6Elf5M
         H8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=aiI3vYBD5kXQnR8Lq1nwtdzslIROzrXpGYDxmaWA+f0=;
        b=mGSq51Q0xqKOOngrmTvOpAL4ulygirKlkDU4xE79JjSIifOVVr6finjhX4AR7ajhGv
         ndp4KXDcPrH2jU2MOHU11Xf2VPiGT5YZgMvKyMYG+eL85EioJC5lmNuScv/uXI7NJKHA
         ewrqLavG0cdkZXRWLvRRxUU5eo57LEr/0BG+Xsl8Xwz3TCD+sCDVmqM0rXKUnKKPrRNv
         XECN1sRvoToB2dIm4h9pwM/SV9qXYMVdrLaW8/xV/qUu+fRPzfZb9a3+nH7wWlN5lgg6
         e3LyExaigTpHG7BPQYHC+A/6GutDjvVINhKTM0up36oxze+9FPqoax5Mch5el5etK9b/
         Rd3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a05620a268500b0074e1cdf9631si2910430qkp.457.2023.04.21.05.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 05:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppqC1-0001ci-77; Fri, 21 Apr 2023 08:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqBz-0001be-Gj
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 08:48:47 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqBx-0004oq-Tm
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 08:48:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DC4B021165;
 Fri, 21 Apr 2023 12:48:42 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 14:48:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00644c3f32c-1107-4dfe-80b4-d69d727bb93a,
 7111A4B1C16D83D618E44FD4B545295E183D9861) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ea0bcb34-2f57-eb2f-b015-48d909355c74@kaod.org>
Date: Fri, 21 Apr 2023 14:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] MAINTAINERS: Cover tests/avocado/machine_aspeed.py
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Cleber Rosa
 <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, <qemu-arm@nongnu.org>
References: <20230421110345.1294131-1-thuth@redhat.com>
 <20230421110345.1294131-4-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230421110345.1294131-4-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 506fb85c-70c5-4779-b993-7a7706870621
X-Ovh-Tracer-Id: 9667539550874536812
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddthedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhoug
 gvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: c/Rye6fmNWex

On 4/21/23 13:03, Thomas Huth wrote:
> tests/avocado/machine_aspeed.py should belong to the ASPEED section
> in the maintainers file. Improve the wildcards here a little bit,
> so that it is covered, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c2068ea5c..6d8bf42d13 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1111,7 +1111,7 @@ F: include/hw/misc/pca9552*.h
>   F: hw/net/ftgmac100.c
>   F: include/hw/net/ftgmac100.h
>   F: docs/system/arm/aspeed.rst
> -F: tests/qtest/*aspeed*
> +F: tests/*/*aspeed*
>   F: hw/arm/fby35.c
>   
>   NRF51

