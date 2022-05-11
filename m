Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp4973343lfj;
        Wed, 11 May 2022 04:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG/N/JBOTKsqok267w7oIROiOHz1sy28meeHzEDuJKPgxylto4UG/lC+AbpHqJ9bIKmvYd
X-Received: by 2002:ad4:5cc8:0:b0:45a:8a4c:9d1e with SMTP id iu8-20020ad45cc8000000b0045a8a4c9d1emr21550086qvb.97.1652269876124;
        Wed, 11 May 2022 04:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652269876; cv=none;
        d=google.com; s=arc-20160816;
        b=AkTdur33kFmmHGDSveVK71yFwn3IXWGiwMFHL7VdL3QGB4LCX/9U5LeFM6FakZG5up
         SBHYm6u+6nh4nHvOM6dhcNs9hQ0TwdJ/WBcpqaqfmwHHQkil6NIQgIBUs5xcsh7MF4hm
         XCKzv/CoM/kFD3XxI5kT1q++BfsC2qu6xXkcIADiFLPjYjzm+ZZrH/t3xEZTnYWsbxbr
         FuZveCmvrzQ0rnrWFvLiiep/juStdzCHfBhW3vlupHAbdrdni9R5LpA7tBg6i33L372G
         oPNWX50KRGo0952fuo1Ddk2ar+HfjVUw6AUXwEOehhGbRoGzfHrcOqj3Pag4IEB6xO6h
         DA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Z/R37T4zzgdh/H1+GQVb+hmZLkIWYx1ZqLzV7KxOSqI=;
        b=ctToHiHZx984krr6nYO48eN888p8aEPLRYeQdKz8xznrf6atP0YJ7ltlTIhPeW8ASX
         5zxB4cm5laqw81eNKPWg3T8nq7dTnjnLQBNilCRbS9l6tSm0XllkLRWdMrF/rZkwWfeb
         sG4r5Mg19vXgEV1qb5mItoKtU34wVRIGVTlabfII1TYwT4ooYzyJQ9LB+LxdJguZPXj2
         xuu+J0lOTMTmwNAtKXVBtQlQynM5Mu6ofVGZQkgh6oQ0JNpHn+dJQ+oJo+TcleWzp+lN
         7XnUHeyGi2znzCJjrdCx7WOadfto2FMj590a67YK6HfnlHDrB88/Y0FvaKadTGrKWfEO
         6BOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020ad44148000000b0045ab44614besi933429qvp.422.2022.05.11.04.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 May 2022 04:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noks7-0004eW-Kh
	for alex.bennee@linaro.org; Wed, 11 May 2022 07:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nokrg-0004cy-6Q; Wed, 11 May 2022 07:50:51 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:48639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nokrb-0002Wb-Cj; Wed, 11 May 2022 07:50:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E8643FEAB836;
 Wed, 11 May 2022 13:50:37 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 11 May
 2022 13:50:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028736767e-4089-4aa4-bcb0-cdab8faa91cc,
 0573B671C186F18DA7A9CA3D7ACC2C84049858CC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6ce2d5a2-476f-d2a9-6eb7-928cd5c1a08a@kaod.org>
Date: Wed, 11 May 2022 13:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] docs: aspeed: Add fby35 board
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220506193354.990532-1-pdel@fb.com>
 <20220506193354.990532-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220506193354.990532-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 33bb994e-6253-467c-a1b0-2c5af91e6802
X-Ovh-Tracer-Id: 11749047004905901024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q31pWIaySCee

On 5/6/22 21:33, Peter Delevoryas wrote:
> Add fby35 to the list of Aspeed boards.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   docs/system/arm/aspeed.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 60ed94f187..fa98549c11 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -31,6 +31,7 @@ AST2600 SoC based machines :
>   - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
>   - ``rainier-bmc``          IBM Rainier POWER10 BMC
>   - ``fuji-bmc``             Facebook Fuji BMC
> +- ``fby35-bmc``            Facebook fby35 BMC
>   
>   Supported devices
>   -----------------

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
