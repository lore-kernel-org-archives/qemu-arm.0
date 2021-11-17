Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp254978lfk;
        Tue, 16 Nov 2021 22:50:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfJMpXjMVeCdrRljKFWh1JtbTvQQgQKa05p3EgGvoIvHdnR5QJGtJxoosb4W6Rg75mZlm1
X-Received: by 2002:a05:6122:2217:: with SMTP id bb23mr83949776vkb.13.1637131846175;
        Tue, 16 Nov 2021 22:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637131846; cv=none;
        d=google.com; s=arc-20160816;
        b=fnOBVpeZqCaG5CoST3fZgX2A/wvpE1VgElyze4vNqLHI0KDiZovc+cyJJB2nR8QOtK
         Ch0Smb1cQ8T0QlF/ey3HtcbaWpCkAQATx8p3QYw4sjXJlW0zYmDeL+Er1Bu6NJxLFHSv
         ENpMddm5dz0AByI7bgxPpZr3/zQqe372pCeq28CRcVVWfa5W+YJTDIgIHV8oUToSVe7X
         Nd1Sa6UE0plTAz0tB5SV88/cXxiKqa447K+8gJYS1b9KZbkms7Y5B/U0XQccxhQJnB1G
         tZ/Q3ZGQEdfGIJIFkqOvgt4R3yBbCBEuCDbdxpap+KF+5KSOaSshu/GQqoMsQIofnmLy
         iJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=xslc9weVe/3wktYNd2+5uvKlYf2hTvgdENZc5LzXqOw=;
        b=E5vbmzG2+qF4oRJC3sPVC//jN3Rh6fG+2thWw6/lpIBAdveuuOn0RccxXL0wAopMgx
         YHBuGme/iTe2qoGxL99OYyN12EBiWvMk+N3Yy23aG1wIShZzx/fvY6f6TKrxB4FwER9l
         zPDzOKc3zshPhX+puoc7qg5hy52fJJpU5bjZtdmfPWh070BDy19nsfUix1zMLDHzOvkw
         5PIWxwInDViQKUNW3gIvNdjCnY/4Q8jWFA69r+fDdmI5z6dlDx4SDZoWMMuc5Z3A4u05
         skBeknN3WNeS7E/UfAMnn+AdDeI5QjLMAeNX1cj9qq514fesWo1a8qV/PGRjboo/s2KD
         oB3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si1645364vsa.441.2021.11.16.22.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 22:50:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnEmL-0001Cv-Iq
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 01:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEem-0002Te-Lo
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:42:56 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:38201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEej-000345-Kr
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:42:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.220])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9644020039;
 Wed, 17 Nov 2021 06:42:50 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 07:42:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00487566d1f-ec53-4596-b4b4-e393b2955e48,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2fd46333-bed7-5f7e-c703-bf81bf9f12de@kaod.org>
Date: Wed, 17 Nov 2021 07:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [SPAM] [RESEND PATCH 2/3] docs: aspeed: Update OpenBMC image URL
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20211117010947.297540-1-joel@jms.id.au>
 <20211117010947.297540-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117010947.297540-3-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ce37288f-48f5-4965-b757-02ef48d50e4e
X-Ovh-Tracer-Id: 11847281770761522083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedviedtleelvdehgeevueeifffggeejkeegkefgueefkefgkeehjeelkefhudffveenucffohhmrghinhepohhpvghnsghmtgdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/ETDk3PEBkh

On 11/17/21 02:09, Joel Stanley wrote:
> This is the latest URL for the OpenBMC CI. The old URL still works, but
> redirects.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks

C.

> ---
>   docs/system/arm/aspeed.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index b091c0c61dec..4bed7b5221b4 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -81,7 +81,7 @@ The Aspeed machines can be started using the ``-kernel`` option to
>   load a Linux kernel or from a firmware. Images can be downloaded from
>   the OpenBMC jenkins :
>   
> -   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/distro=ubuntu,label=docker-builder
> +   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
>   
>   or directly from the OpenBMC GitHub release repository :
>   
> 

