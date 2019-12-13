Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp458220lff;
        Thu, 12 Dec 2019 23:35:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYePmze8rou+z0lE8es08U9NUEuhnyzFQ2dloTV/VJFkf6N00VOaArOgq6CDLYvnfrkGkA
X-Received: by 2002:a9d:6045:: with SMTP id v5mr12310261otj.252.1576222541704;
        Thu, 12 Dec 2019 23:35:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576222541; cv=none;
        d=google.com; s=arc-20160816;
        b=NONWK8AiqOlMNvwRf15krJL1j4O7iUua5frJ74U62AVibMajkF3598I4EmI/6rEoHg
         r9nMdPoiDT40ckql8WrR4q93bUcCSqumZrxUA7uVrnOGoSIM5aGs+8L60RvYJ6p89Ovu
         DBszaLtovGECwEFN18AAJwFwp3j2iuxXq1/uouM+lFIMRiSsabfPjeDD+4hNrmFKPVQY
         u4EbHneOzb2RY0rCYDMTdn0zbkJWMOolMn2eWWDX67s9Oxal1X8/uHuTMA2+hhoRJy+H
         InPeDbTMmc3L+auohgqyZ3efpQW8oxjukKcJKorLgOI2hYrKM2gm5C4Pf5o8jcxtf3C4
         Opew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mfk8TokwRTRBTx3hjPW59UtLhmiwufMXQF/fNWJG/Xw=;
        b=gHBDlF/ljbMzeEjoQ3ZtfiZlI/ZOAkQHMFxTFU+pUcfEZkl7UOcEag3l/MNQWcu0hg
         pUpD0SNFMN4+9zdt+mViYbzd9Gc2hJ9cXGVfmITAAzStwYydy93jl8/OrpGhEXmeqyAl
         G8ANNnR/lzlEpvEaB3yl6/cq09I36w2dFDIC1V/tDQsSrLdRLPY0tT+qluTZU7/ywdb5
         0DdDYxlHgkgDn2amgzEJ3VCw3aADhUTdRD8UyLqC2iL5jMdPacSpWSb4MRXeXOOGJpuL
         yTuXr/J9GTtOM06fhgh4ILW9O8dsy30HwTqqNWcnUNRM+iqQ2Dz8CiMVWGjLnf/acxJR
         mBPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si4634115oih.186.2019.12.12.23.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 23:35:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iffUC-0008IM-Tq
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 02:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iffSV-0006TK-5r
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 02:33:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iffSU-00030e-1X
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 02:33:55 -0500
Received: from 4.mo4.mail-out.ovh.net ([178.32.98.131]:57492)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iffST-0002vQ-7M
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 02:33:53 -0500
Received: from player692.ha.ovh.net (unknown [10.109.146.86])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id F40AE21B21B
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 08:33:50 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 426B9D1E3521;
 Fri, 13 Dec 2019 07:33:46 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] hw/arm: ast2600: Wire up eMMC controller
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <16c90bb0-a3a9-06ec-e79a-bd98471d9e11@kaod.org>
Date: Fri, 13 Dec 2019 08:33:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cover.fc3e5e495d85ebd919c1f06a1a2c7c7730518f9c.1576211124.git-series.andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4530058279157861184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.98.131
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: crwzvYjh2bjv

On 13/12/2019 05:28, Andrew Jeffery wrote:
> Hello,
> 
> The AST2600 has an additional SDHCI intended for use as an eMMC boot source.
> These two patches rework the existing ASPEED SDHCI model to accommodate the
> single-slot nature of the eMMC controller and wire it into the AST2600 SoC.
> 
> v2 contains some minor refactorings in response to issues pointed out by
> Cedric.
 

I think these patches are based on mainline. I fixed them locally on 
my aspeed 5.0 branch and I plan to send them along with other aspeed 
changes in the 5.0 timeframe.  

Thanks,

C. 

> 
> v1 can be found here:
> 
> https://patchwork.ozlabs.org/cover/1206845/
> 
> Please review!
> 
> Andrew
> 
> Andrew Jeffery (2):
>   hw/sd: Configure number of slots exposed by the ASPEED SDHCI model
>   hw/arm: ast2600: Wire up the eMMC controller
> 
>  hw/arm/aspeed.c              | 27 +++++++++++++++++----------
>  hw/arm/aspeed_ast2600.c      | 23 +++++++++++++++++++++++
>  hw/arm/aspeed_soc.c          |  2 ++
>  hw/sd/aspeed_sdhci.c         | 11 +++++++++--
>  include/hw/arm/aspeed_soc.h  |  2 ++
>  include/hw/sd/aspeed_sdhci.h |  1 +
>  6 files changed, 54 insertions(+), 12 deletions(-)
> 
> base-commit: 6a4ef4e5d1084ce41fafa7d470a644b0fd3d9317
> 

