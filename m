Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp128681lff;
        Wed, 16 Jun 2021 02:06:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySg06wOtiCut0LFoysk5CjUHBcwpS4AYj4LfGG9Llkaw8AtVUEvsd2YelUc8KELaVFs+K1
X-Received: by 2002:ab0:76c2:: with SMTP id w2mr3586139uaq.105.1623834361498;
        Wed, 16 Jun 2021 02:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623834361; cv=none;
        d=google.com; s=arc-20160816;
        b=neGg+2KxAq/uZEuohQH7z3gGFneVcZEvPHgKsS4OEleXjo+FbeXLlTzfgO0fjru5pA
         Zwo/J+EZ+tzy6gutl1s2ljtzUGUK1YoVjFy9gGTQAUg9reCJCW0jwxo///+vP2PCVz52
         t6t87nJp0s7hJmORnzcnAH7rZtOiLSK5Lxyc28vuh9ZQNIkhhajTslXE6fgjWC46v1pr
         Lz9IFQp51tEQjjzrCYIvyv2yFwunzJ6UPVBF9Xj6CIvLdn61mfvd/7FiYBiYtaHlm88s
         PwHwWkiyzu/D9sNAxRfDV2Zqa4BHeCIdYH/QTjN7o16hFlwDe1LCoB3DJOgcg2Tyciia
         +sVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=SnttodHGztD4gWOddGOLTnDMpFF5J8KJKP3ISTQ8frM=;
        b=ubAdjedQ1GKNvy7ZZd22mwAyKeAZVRF4WoxbEnxhVkGDCQXX7yJya+zrS14/gEVw//
         1VV+Vv8gmzp6i33HYN3HLIrkySun5iLX8vdPh28F2lvEw+HOuB4SzzdytT2xc9FeHWEx
         DtpYKA7JK5QDqRiXCKH3zGB84zqeagPeVWPECGSFF59xoRdOPnmPeZ9nFQXsYecFIbpr
         NcZw8aZRrDlUdu/ZFsPuGeauncyGCVvMGfL4i3ea/GD0qIRgKYn1HbBhp66QZKpNHHXK
         UG5QgDMQT29XHz1BmAILkdTDyuL2Rm6gj3CHibsqk5FC/HISEV5MIkOuZyz3xNbM6zut
         syTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x191si828058vsx.278.2021.06.16.02.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 02:06:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltRUm-0002lI-Nt
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 05:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUD-0002it-8n
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 05:05:25 -0400
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:48385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ltRUB-0007nF-F3
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 05:05:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id C89922A9217;
 Wed, 16 Jun 2021 11:05:10 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 16 Jun
 2021 11:04:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003cee9dd8b-4a17-4100-975d-f396ae1f45ad,
 06345D7E1B8C8FAD34147FE460F0DA442DB8F7FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 1/2] docs/system/arm: Add quanta-q7l1-bmc reference
To: Patrick Venture <venture@google.com>, <hskinnemoen@google.com>,
 <kfting@nuvoton.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20210615192848.1065297-1-venture@google.com>
 <20210615192848.1065297-2-venture@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5e439c14-9566-8e22-4bfd-8bf4505bbebe@kaod.org>
Date: Wed, 16 Jun 2021 11:04:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615192848.1065297-2-venture@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8f5aa93a-7c4f-4725-8dfa-170c66e7e090
X-Ovh-Tracer-Id: 13746674916479372140
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepvhgvnhhtuhhrvgesghhoohhglhgvrdgtohhm
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qBZ3607PDTJL

On 6/15/21 9:28 PM, Patrick Venture wrote:
> Adds a line-item reference to the supported quanta-q71l-bmc aspeed
> entry.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  docs/system/arm/aspeed.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 57ee2bd94f..cec87e3743 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -13,6 +13,7 @@ etc.
>  AST2400 SoC based machines :
>  
>  - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
> +- ``quanta-q71l-bmc``      OpenBMC Quanta BMC
>  
>  AST2500 SoC based machines :
>  
> 

