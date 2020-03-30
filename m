Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2467890lfi;
        Mon, 30 Mar 2020 01:30:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsyxpzTDR/qP+HoSiQWrZRo0jqZhyziOt2abl8Y2xp3hsD4H2ExjbiVXg7LvIL8fArdQiKL
X-Received: by 2002:aed:3e50:: with SMTP id m16mr10339562qtf.75.1585557026136;
        Mon, 30 Mar 2020 01:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585557026; cv=none;
        d=google.com; s=arc-20160816;
        b=cg6PpZBP7sTX09kMjF4Rug9HyRMDzHZ4VLgfs0opg1MRyFef0KpV83Hlaozkc/3CEw
         bG150eSgKrSHo3yDXsrWcxB6Ws9jYtSZ3SfLMXgC3WIXx3tGHCR1s6AjvsWK36Q18uGH
         D+TMnaNZ4lSQy2hCJ8yHrTM16B2pSZyK9j+AdyVzDvkVO1WbfjTsCd9cO0NytxKabBGj
         CoUfnoFBTO9OTLfpABHa0Gvi84P4FYMUoDYVnq5XnO6c5aDuRCvW31o40ZioCes8nXj1
         1IRiQg7mIaJmmuPTqSWxV8WU3VeTMknsMXRdT5geylloaXvN5kC8drKlFrapbdDEE+Yx
         jLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=DLx0D09XygMEAVZDPyfFchcYuJtHYkitpTh3pwNycjU=;
        b=RuZaEfFPFU66x24M6bYD3YbZntcCKDTxaMk8/NGg7SyQSrvjGPiZMilOEysxS+5VLo
         Xi6XtoZroDUJEGqRCcpbeB/ZAEQl8l9Zr+rc23LdFM9zn9eUTz08AjZtDtZm03UzA2ma
         6xzyrsZP9Pq+N7xGo9LSmgRFUOOjjO6kQq2MAGOEvdyBYf9nf/3Xxk5i4mZfRrFEfbOe
         ZDBT7e2g4wVpQd/TfrdbLa5jkDeUmokbcmzyPvGlFNA/2CrW3zFayPYDVU+PYHGK3KEZ
         3xEgBQRkktcmJSAxQtVJaJN2Z4vnOlg7n0wSs2zg/eAUYUwr+blTCvkeG0za2bFOAhNv
         tVTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id y127si7409973qkb.132.2020.03.30.01.30.25;
        Mon, 30 Mar 2020 01:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5971A4B0B3;
	Mon, 30 Mar 2020 04:30:25 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLrEPGILtE3C; Mon, 30 Mar 2020 04:30:24 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6ECB34B1CB;
	Mon, 30 Mar 2020 04:30:24 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 453504B0B3
 for <kvmarm@lists.cs.columbia.edu>; Mon, 30 Mar 2020 04:30:23 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7r1IsGo6Blq for <kvmarm@lists.cs.columbia.edu>;
 Mon, 30 Mar 2020 04:30:20 -0400 (EDT)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 7B6D74A3A5
 for <kvmarm@lists.cs.columbia.edu>; Mon, 30 Mar 2020 04:30:20 -0400 (EDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8FB628AC18DDC1F41535;
 Mon, 30 Mar 2020 16:30:12 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 16:30:09 +0800
Subject: Re: [kvm-unit-tests PATCH v7 06/13] arm/arm64: ITS: Introspection
 tests
To: Eric Auger <eric.auger@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-7-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <947a79f5-1f79-532b-9ec7-6fd539ccd183@huawei.com>
Date: Mon, 30 Mar 2020 16:30:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200320092428.20880-7-eric.auger@redhat.com>
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
X-TUID: 0pcZ6m38L3tu

Hi Eric,

On 2020/3/20 17:24, Eric Auger wrote:
> +static void its_cmd_queue_init(void)
> +{
> +	unsigned long order = get_order(SZ_64K >> PAGE_SHIFT);
> +	u64 cbaser;
> +
> +	its_data.cmd_base = (void *)virt_to_phys(alloc_pages(order));

Shouldn't the cmd_base (and the cmd_write) be set as a GVA?

Otherwise I think we will end-up with memory corruption when writing
the command queue.  But it seems that everything just works fine ...
So I'm really confused here :-/

> +
> +	cbaser = ((u64)its_data.cmd_base | (SZ_64K / SZ_4K - 1)	| GITS_CBASER_VALID);
> +
> +	writeq(cbaser, its_data.base + GITS_CBASER);
> +
> +	its_data.cmd_write = its_data.cmd_base;
> +	writeq(0, its_data.base + GITS_CWRITER);
> +}

Otherwise this looks good,
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>


Thanks

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
