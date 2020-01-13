Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3808636lff;
        Sun, 12 Jan 2020 23:45:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1sjkvrQh7IH6SLUCsrtY2Q51AtVc1C2PbAnf0Kfn9JjtSoqvkeeBtG8kZlnOe4DFBbWHb
X-Received: by 2002:a05:620a:997:: with SMTP id x23mr10481435qkx.143.1578901513492;
        Sun, 12 Jan 2020 23:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578901513; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9Xjjxh79DlIKY3qQHRbMHSWTzLlkLy/KAgiMXzDmvQmwVikCyp03KZDCcbDjnUts/
         FFcMvVV2aJvItcx7do0aSLX8dwerzs/PQdCZ+xbrL5xlTve8IQgmc/qLKx0ICkpHwkPS
         usRvOm8g+eJSiO5xuFWuZ7JjiiCoUZ1UcO2Fro3QIK0ohjQOETLm6sLnOaAh4ZOeSJaV
         +AOg2VRUTzGEwriUAA7acd+6galYaK+idE0eZDsvhPFzewGwv03Qb0+nhflxqhdWW9da
         wGqgm+aNwfY0aYz/+MHAJzEO4TQZyznsVZhWzYqRjjcifwKHZHdTGvdC5+k3C+8+N5VF
         Gjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=1LWKqwMJFdgIsU1VPyBlOm1kjcK79ysv51DJSjQBvs4=;
        b=qs0eWdAFNwsFbn4am1Z6SXuELm/BuNcKQiywxOo8C/ndrPp5j++Sidf4tAcs4sh9fS
         ZiuZ0ysZDpRuNk4XZyQDu+6wL+nvb05/Y9UI5n8iuDg67YYBZnMC/oB3AvKZnxBspO2t
         DQsF2Xd+bvsDQbSdGLCrMwFIl4BEEfqUfqvFAIV0ShLa/7XEUGXFP4zGngUJ1ERRyM00
         Vq88LSFAeiYNSrrrNbSA4Jr7es33TiaCh4Gr98ybBUnTTpxi93edsW6bqr+px0hNEI54
         hUy09dYOEW7DDBCMYSlHXw+fmsohxRHl6bov/+HF7CFsuSsdXSHIoIp4aELx49c/IdKh
         ko+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v29si6054132qth.396.2020.01.12.23.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2020 23:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iquPQ-0004HC-QD
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 02:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iquPG-0004F6-B6
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 02:45:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iquPF-0002fL-DL
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 02:45:02 -0500
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:58669)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iquPF-0002P3-86
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 02:45:01 -0500
Received: from player729.ha.ovh.net (unknown [10.109.143.145])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id EED271BE85F
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 08:44:51 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 005A1E45ECCB;
 Mon, 13 Jan 2020 07:44:44 +0000 (UTC)
Subject: Re: [PATCH 0/5] aspeed: extensions and fixes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c059d9c9-a04b-a7ce-7738-62ee88f23463@kaod.org>
Date: Mon, 13 Jan 2020 08:44:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107073423.30043-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2302183835244858147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.48.182
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHQOXVytlkRY

On 1/7/20 8:34 AM, C=C3=A9dric Le Goater wrote:
> Hi,
>=20
> Here is a short series adding :
>=20
>  - a new eMMC controller model for the AST2600 SoC (Andrew)
>  - accessors to control the led state of the pca9552 device (Joel)
>  - a 'execute-in-place' property to boot directly from CE0

There is a naming issue with the eMMC model. I will let Andrew resend.
We can drop this patchset for now.

Thanks,

C.
