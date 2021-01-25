Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp261609lfd;
        Sun, 24 Jan 2021 23:52:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwq/v3gK4LVBj4Dx6w7U11fNq0o7KgbfC/k44urdFroQMdkacsz9wk5eVwyrKhLpfWP5gpQ
X-Received: by 2002:a25:6602:: with SMTP id a2mr23289064ybc.283.1611561138042;
        Sun, 24 Jan 2021 23:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611561138; cv=none;
        d=google.com; s=arc-20160816;
        b=xzT83qHp0GBT8gwHvAE39Eecnw0p4p9m/AH9s3EPjggJ124VA9NJqwhFeZEUJrmVyU
         gy2zgUop5op4T7Sr3G0PfL4FfrIz9pheTL9KeHa2grK7nlQN/v44mogmJVlyrUJhaBOL
         KwVMq+BrUO+lmIuF3K/uKg60vSkYwbUUh6b+I1rWArAnD0PAUKsBtVHd/k6UCQaKNrJY
         rT8XOHGR291nOfuSdtaofeN+sfW7hmO7+vVtnH0VWR9n33tmXve9ijAPEAwMGDTFLanr
         qZICctSVo0Dlteuze8fNpgTaSU8zu9SnzI0bGdKZ3BmCXu+b7dBbdn7Odv7mSXHQshlK
         7TPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=gYZT0YV+qPK3uJj9R12H9Sq+ZvPFMVozr37WeWyok1g=;
        b=ZpLRQwl1b/ovuHo6Gc3nOxBpemV/vjvjQ0xn/6EAZ0iMfR9kdmJDTkof/R33ViD2ER
         88aQBCqMPaqsx/PHJty0qOhO0ZI+t6MkdHUlbHIQHT6af8mCy8ZDMkjHnnKaKL+QOTfc
         A81me3eFfwBY7xWyVxs9OoVNqP2j5n5aiCbXaiajBsojfIYYYmV/4B53nQ96Cf0JdNMU
         LjB8ueVTvyob4/NOq5Xlmxt31usewxZgAOngiRCl9dzWm+GgLjYm7AuTgmuXBLbMWIKL
         2ofw1ehU0CgnWawtphDLOe6FM64j1FfdWVtupFLcrS20l7sBZdQNaRo7NeqxCDpuzXU8
         dS+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y132si17739812ybe.350.2021.01.24.23.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Jan 2021 23:52:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3wfZ-0004Mx-E2
	for alex.bennee@linaro.org; Mon, 25 Jan 2021 02:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l3wf4-0004Mi-NU; Mon, 25 Jan 2021 02:51:46 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l3wet-00013M-68; Mon, 25 Jan 2021 02:51:43 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DPMV15ksmzjC3G;
 Mon, 25 Jan 2021 15:50:17 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 15:51:04 +0800
Subject: Re: [PATCH v2 0/2] accel: kvm: Some bugfixes for kvm dirty log
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <b81889c3-2823-22b1-9087-75157abc414f@huawei.com>
Date: Mon, 25 Jan 2021 15:51:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201217014941.22872-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 jiangkunkun@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f8FfbF2iLm8R

Hi Paolo,

Any suggestions on this patch series :-) ? Thanks,

Keqian

On 2020/12/17 9:49, Keqian Zhu wrote:
> Hi all,
> 
> This series fixes memory waste and adds alignment check for unmatched
> qemu_real_host_page_size and TARGET_PAGE_SIZE.
> 
> Thanks.
> 
> Keqian Zhu (2):
>   accel: kvm: Fix memory waste under mismatch page size
>   accel: kvm: Add aligment assert for kvm_log_clear_one_slot
> 
>  accel/kvm/kvm-all.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
