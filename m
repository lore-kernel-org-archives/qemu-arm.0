Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp835356lfq;
        Wed, 16 Dec 2020 17:04:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyT4cAsdNp7Q5Jomqecsyv+CnFdGUn3IHVTZfb5s+tKkgbO45EedG3t1EKHlavTPjO6J8W1
X-Received: by 2002:a25:5d1:: with SMTP id 200mr19594627ybf.397.1608167051319;
        Wed, 16 Dec 2020 17:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608167051; cv=none;
        d=google.com; s=arc-20160816;
        b=BImbxbwe3uPdeh8QJUaekIt//br8gMPIJqFQlv0fOCBePV/wIjU3CnJOp5cGvq81nI
         xO6DKm7G5UOo3ATbIV8NgXNLouS67JWkxmIKh38ITNZbYSM/zsf0GDF7NznjBUsYpKRc
         Pp3V26s7PO5gPJeMTWp6bot2gEX5inlMChnjWgx+77gdUVkoBeT0NwrrSZlrT0sV7zcL
         DnNOKcv0jnhlNJnX43igF/fdlME3KrMSfu0hTbJ3dslHYx0cpNyw9uNTMo+LCNFJ4PK2
         +rWmx4nh/61SG2WOiaziA050m/AYxXOKTYELRHWBrvyC8Cyc+A58IPoHA10Q8V0RBS1k
         fGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=GnOYDX2HzFJ0zSmlgzTK4nSyAhXhvwP+keJeBAJksAA=;
        b=VIJjNd7afgg/udosDT/w98RsSQhxFqaW84iA5Nav9PYgl39R5pdfM+PKzwBTKrXSOi
         rgTlbEMJR9FVJqZIjPRKj42MJWZAKGS2YtOp589NhA5GqnB0u3Td5d+J2NKtMe98NboU
         rZ+n6CyMX8Ia/2x5tFW2dJKWgacfz7hQoPQ8aKq1uT73UMAHcQqUn4dxfpPzhBFzCyrH
         2GiF7P9fs7+bpScqipCfXI3Y5Rig2LSgLdEslKPMAnq/noz8pBbcWxcbhxXvj/cHGA0B
         OQuTut1ZDCGpbkOOOxhc5gkFCorq/webexEy5wXWDApBDCEMkWwVMkIgNesZuiRJyyRy
         i8XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si3358882ybk.144.2020.12.16.17.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 17:04:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kphiE-0007vF-Ls
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 20:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kphho-0007ui-Jn; Wed, 16 Dec 2020 20:03:44 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kphhk-0000PP-O5; Wed, 16 Dec 2020 20:03:44 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CxDHy2tL3z7FqJ;
 Thu, 17 Dec 2020 09:02:54 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 09:03:24 +0800
Subject: Re: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
To: Peter Xu <peterx@redhat.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-2-zhukeqian1@huawei.com>
 <20201215175719.GA112585@xz-x1>
 <8a23c62d-1167-d005-e98b-14507e15fbf2@huawei.com>
 <20201216204818.GA39844@xz-x1>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <efdcf433-47b8-9059-e1ee-6306a98bc33f@huawei.com>
Date: Thu, 17 Dec 2020 09:03:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201216204818.GA39844@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +PBx6Nn1OvXS



On 2020/12/17 4:48, Peter Xu wrote:
> On Wed, Dec 16, 2020 at 04:21:17PM +0800, Keqian Zhu wrote:
>> One more thing, we should consider whether @start and @size is psize aligned (my second
>> patch). Do you agree to add assert on them directly?
> 
> Yes I think the 2nd patch is okay, but please address Drew's comments.
> 
> Returning -EINVAL is the same as abort() currently - it'll just abort() at
> kvm_log_clear() instead.
OK, I will send v2 soon.

Thanks,
Keqian

> 
> Thanks,
> 
