Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp483675lfc;
        Wed, 11 Mar 2020 01:37:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuoZKxCcOzqqbmX9TZtggPw82Z+PCDNfy6G7P9aYaMosQpQaP0xGSuxihpnufV4kTb3KKF7
X-Received: by 2002:ac8:6909:: with SMTP id e9mr1589340qtr.324.1583915867227;
        Wed, 11 Mar 2020 01:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583915867; cv=none;
        d=google.com; s=arc-20160816;
        b=O25Ro7o64w5luNhkJxnR6IWMOV2kQJ4YG/IYt/rdYNqwCq1GcBCHI1q0cLgTkvBTSe
         jDd7LSJCk8POU3uaoYLC6mfQCJEH+c/4g9ZKV2fFj5MSoiEzRkC20GDuNkrkWthcWCv3
         TFigh6M0j6V/2Lk9tXmtpg9TT4AiCVBW5p3Z/4qWZnu/OmbdqqKDx54MnQhM5QDO3mC2
         WjhmoOgZmPZhy5vvSC/bJDJ6G+VeU3uT+ioA7/jvixn4QknHhMO8cnmgbBphrJBwrj9R
         YztQDP2eRJM+yfj49z2HewaqHbUr7Rv2AKH96aE3rW4LRPPHCmKmQPNp7LuI/3Z9SXKE
         6qHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=fhcebCCYl1UeDiz/YaEdu1clp1XINyFTvvxkGCIMNnI=;
        b=FdAdV9EuVhDrWRBNjOJDoa6F6YUTm2bciQHPTi7MzZL4a+4jR1yOp9c7Bw1RoN1tmA
         46f7mUbNyh2sOIHPo7r4B0/FwQsjsQ5kmFOX8FN3J0daEljUOW1IA5SMYL83Ppf0Nx7X
         8jYWWf8zIC5aipd91t70EnGgW3UBiAdchrPLCztUDN9HugaC9LWoCdLK+0x4W0SwgarP
         4VDN6BCpUQzES/SAUGni7OuPzVy5+KkHR7xrHs/2VsFRsKTbwkAqRTuVkDXnMuXB2Sm6
         rSPJJZTiSdWHng5iqVi3TaYwnl04SDTsw++thmhrkE4LqRhnMyvu+F80p04T+CfIwnTn
         k6Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 137si585802qkn.203.2020.03.11.01.37.46;
        Wed, 11 Mar 2020 01:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D39D54A524;
	Wed, 11 Mar 2020 04:37:46 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSk9pdZC7tVB; Wed, 11 Mar 2020 04:37:45 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E48704A4E1;
	Wed, 11 Mar 2020 04:37:45 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id ABDA04A483
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 04:37:44 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36GKprepQobb for <kvmarm@lists.cs.columbia.edu>;
 Wed, 11 Mar 2020 04:37:43 -0400 (EDT)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id EEDBB4A1FA
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 04:37:42 -0400 (EDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 439021D9CE9A4ADD8EEC;
 Wed, 11 Mar 2020 16:37:36 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Mar 2020
 16:37:26 +0800
Subject: Re: [kvm-unit-tests PATCH v5 06/13] arm/arm64: ITS: Introspection
 tests
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20200310145410.26308-1-eric.auger@redhat.com>
 <20200310145410.26308-7-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <83ffda30-e0dc-7fbf-1775-bc45a308acb4@huawei.com>
Date: Wed, 11 Mar 2020 16:37:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200310145410.26308-7-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Cc: andre.przywara@arm.com, thuth@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: hMrMhyXYvajh

Hi Eric,

On 2020/3/10 22:54, Eric Auger wrote:
> +#define GITS_TYPER_PLPIS                BIT(0)
> +#define GITS_TYPER_VLPIS		BIT(1)
> +#define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
> +#define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
> +#define GITS_TYPER_IDBITS		GENMASK_ULL(8, 12)

Note that this should be GENMASK_ULL(12, 8).

> +#define GITS_TYPER_IDBITS_SHIFT         8
> +#define GITS_TYPER_DEVBITS		GENMASK_ULL(13, 17)

(17, 13)

> +#define GITS_TYPER_DEVBITS_SHIFT        13
> +#define GITS_TYPER_PTA                  BIT(19)
> +#define GITS_TYPER_CIDBITS		GENMASK_ULL(32, 35)

(35, 32)

> +#define GITS_TYPER_CIDBITS_SHIFT	32
> +#define GITS_TYPER_CIL			BIT(36)

And please use tab for all of them.


Thanks,
Zenghui

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
