Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp331494lfi;
        Wed, 25 Mar 2020 01:11:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vua2pV1iRSCtbrnvf2OgEil0AERI/vIxMZ1XgJUbq1GNOHGLSyDeLyKMx6NjZDxhzJbR5cg
X-Received: by 2002:a37:a1c9:: with SMTP id k192mr1610092qke.385.1585123872840;
        Wed, 25 Mar 2020 01:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585123872; cv=none;
        d=google.com; s=arc-20160816;
        b=eo9lpQlpl7b+Tr6yI0wmk2cR9Nn1msUVUFgpu4At1pXix4pXXZBq8RtTGRfb6xJjfI
         V47uBrSnQyPzOoz28lnRCdX4U58Xv6V1ruJDVsO4I0XD5DvoGeVuVD/A7+qc6kIkUXci
         wnhySCOPRzf9+DH7UQ9gqGd/Vcy9oYeaLCcwz5leiX15pIqzLGqbVxp0GHV0TrhW/5Ip
         eop9XIwUmPE7pz+MJ6YXrUS7LU4lCLSCMHadXRrE1dZwOTMLJA3KhSDcx7cO1XnqVV/T
         5cPNXmWEKU4HVPl5N1ebGq/+OXGQ5B6dZPBRtbkSUFQOaRqbIET6sTPTZLO8b68nv2aZ
         ngBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=vSD4tWcKZKgByIzZvtghM462MrFji15JB4cBDxPUs/I=;
        b=wHrmLbpWXUaCbs/Welfx7ZRrpWFErAcSHEzsxWUKfMJABoRudIrCc/kHGBzcNFGBch
         c42inOEE/ezCVCwzQI2RqqsR2IrL4CpcCpkaYTF7z3UHPDwu+E2wBikhBFle4S2X4vh/
         AthAI+OZFwjaLRSHvTZEmbtkUacHXDK5pgysbikAvL4/pIypQ/eYJ5H08FqzC6FIVOap
         a2FH3Xgo4UDFb2grV2ZsMk5SBbUGIR8uLqY3ZjMNkT/Cqg7XhRDnEarTVfmKe0jQQLho
         Uf3hRqFwuqMbIGWiFSmHP37+RltjL4q7cxLEO8Ud7PSSyaxoVN9AJTDQtyP427kRpotv
         J4iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id j24si12131748qtk.144.2020.03.25.01.11.12;
        Wed, 25 Mar 2020 01:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 76B954A578;
	Wed, 25 Mar 2020 04:11:12 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1Hi7taTuf6P; Wed, 25 Mar 2020 04:11:11 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5ACBB4B08E;
	Wed, 25 Mar 2020 04:11:11 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 0B6A64A578
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Mar 2020 04:11:10 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8q5iAhZojOC for <kvmarm@lists.cs.columbia.edu>;
 Wed, 25 Mar 2020 04:11:08 -0400 (EDT)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 4F9054A4C0
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Mar 2020 04:11:08 -0400 (EDT)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EA89594B89FE7E0A7589;
 Wed, 25 Mar 2020 16:11:02 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 16:10:53 +0800
Subject: Re: [kvm-unit-tests PATCH v7 08/13] arm/arm64: ITS: Device and
 collection Initialization
To: Eric Auger <eric.auger@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-9-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <63f3d8aa-c1e3-f40f-32a1-fb6d22e70541@huawei.com>
Date: Wed, 25 Mar 2020 16:10:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200320092428.20880-9-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, andre.przywara@arm.com, thuth@redhat.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
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
X-TUID: iujHYVThOd5e

Hi Eric,

On 2020/3/20 17:24, Eric Auger wrote:
> Introduce an helper functions to register
> - a new device, characterized by its device id and the
>    max number of event IDs that dimension its ITT (Interrupt
>    Translation Table).  The function allocates the ITT.
> 
> - a new collection, characterized by its ID and the
>    target processing engine (PE).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v3 -> v4:
> - remove unused its_baser variable from its_create_device()
> - use get_order()
> - device->itt becomes a GVA instead of GPA
> 
> v2 -> v3:
> - s/report_abort/assert
> 
> v1 -> v2:
> - s/nb_/nr_
> ---
>   lib/arm64/asm/gic-v3-its.h | 19 +++++++++++++++++++
>   lib/arm64/gic-v3-its.c     | 38 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/lib/arm64/asm/gic-v3-its.h b/lib/arm64/asm/gic-v3-its.h
> index 4683011..adcb642 100644
> --- a/lib/arm64/asm/gic-v3-its.h
> +++ b/lib/arm64/asm/gic-v3-its.h
> @@ -31,6 +31,19 @@ struct its_baser {
>   };
>   
>   #define GITS_BASER_NR_REGS		8
> +#define GITS_MAX_DEVICES		8
> +#define GITS_MAX_COLLECTIONS		8
> +
> +struct its_device {
> +	u32 device_id;	/* device ID */
> +	u32 nr_ites;	/* Max Interrupt Translation Entries */
> +	void *itt;	/* Interrupt Translation Table GVA */
> +};
> +
> +struct its_collection {
> +	u64 target_address;
> +	u16 col_id;
> +};
>   
>   struct its_data {
>   	void *base;
> @@ -39,6 +52,10 @@ struct its_data {
>   	struct its_baser coll_baser;
>   	struct its_cmd_block *cmd_base;
>   	struct its_cmd_block *cmd_write;
> +	struct its_device devices[GITS_MAX_DEVICES];
> +	u32 nr_devices;		/* Allocated Devices */
> +	struct its_collection collections[GITS_MAX_COLLECTIONS];
> +	u32 nr_collections;	/* Allocated Collections */
>   };
>   
>   extern struct its_data its_data;
> @@ -93,5 +110,7 @@ extern void its_parse_typer(void);
>   extern void its_init(void);
>   extern int its_baser_lookup(int i, struct its_baser *baser);
>   extern void its_enable_defaults(void);
> +extern struct its_device *its_create_device(u32 dev_id, int nr_ites);
> +extern struct its_collection *its_create_collection(u32 col_id, u32 target_pe);

Maybe use 'u16 col_id'?

Besides,
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>


Thanks

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
