Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3394687lfo;
        Mon, 1 Feb 2021 05:09:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxegOC+qkPeaZ8B2lFyN8eqWy5qq9coSQJ/ouyIiVoeY47KlmKmk1lY7cQhls8WSYtmy3YY
X-Received: by 2002:a25:ac94:: with SMTP id x20mr13255963ybi.411.1612184968945;
        Mon, 01 Feb 2021 05:09:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612184968; cv=none;
        d=google.com; s=arc-20160816;
        b=CHgzhqpdrcmp1U1N5ZYfDwyGgU7EOn+vsPduRV00qzthI1NnSb4Cfo/LD0uaC+v+MY
         G/fo/iQxxUMtVDmqVJn+B8+zvCv1xAbfH+GfjIhcb2FxV0sA3tSVI97mr4Qt7yGqpeIp
         J2IBR4V2sC/MBCfQaBiSutJk42TYltnuf+HwMMWy0/4vDSr1EqJjsz1tpT5QkxW7sEpZ
         miYgBo/OtHPkJTf/Ir1pvN4Y7aLY0ZR9VM4LNYBNINERFJ0iWGpXcyIVNwOF9xwBcPMD
         ryJ/4O4pZsZfPAJtvjstLR/K7mFL0+i0gRKeJDGWgXvuZ9TneS4iaSTNIOit7gVcldfn
         GHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:to
         :references:subject;
        bh=bz4pkAiAqPmpaBKE/sizLdTDb2tAwaA60XDpe0muaZI=;
        b=iPZXeGxC3czLhghkW9kVJdGxaLo8mD4eCDEnWmSKi4xsEQ+170CRkZX3EG/VlBG3Bf
         nze31cw0C5YcKO8/grvd1tVoltwMlZPAXGKXnz2r521/SWqTIEMMBIT6CM42l9TNsHeR
         p2ILx4XKFxsXtq0m5J3tWCvMVnIPZZnVX2DPYQV3hsMQwq1NEjwbLgO3PoFXhikxYveF
         sSAIV48rMkZ6KZJ72P05rI09g3+nIBgO+Jqy4OapNUwmAkSTn553GaHcswfKMAx3G/LC
         CzHc4QUG+exyQDh/MKV875sLk2yYv2RZfMTzjskStHgjfqX84QZCsPZ/zA64+WpdY0uK
         aFGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h133si5741568ybg.15.2021.02.01.05.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 05:09:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6YxM-0003Tv-9l
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 08:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l6Ywb-0003R8-O9; Mon, 01 Feb 2021 08:08:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l6YwT-0003Rt-23; Mon, 01 Feb 2021 08:08:41 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DTp9m6XPhzlF09;
 Mon,  1 Feb 2021 21:06:36 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Feb 2021 21:07:59 +0800
Subject: Re: [PATCH v2 0/2] accel: kvm: Some bugfixes for kvm dirty log
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <b81889c3-2823-22b1-9087-75157abc414f@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <2be6b8cc-30ee-dcd4-87ca-215fc9161cfb@huawei.com>
Date: Mon, 1 Feb 2021 21:07:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <b81889c3-2823-22b1-9087-75157abc414f@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
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
Cc: Andrew Jones <drjones@redhat.com>, jiangkunkun@huawei.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 29avqtESHV4G

Hi All,

Kindly Ping ;-) ...

On 2021/1/25 15:51, Keqian Zhu wrote:
> Hi Paolo,
> 
> Any suggestions on this patch series :-) ? Thanks,
> 
> Keqian
> 
> On 2020/12/17 9:49, Keqian Zhu wrote:
>> Hi all,
>>
>> This series fixes memory waste and adds alignment check for unmatched
>> qemu_real_host_page_size and TARGET_PAGE_SIZE.
>>
>> Thanks.
>>
>> Keqian Zhu (2):
>>   accel: kvm: Fix memory waste under mismatch page size
>>   accel: kvm: Add aligment assert for kvm_log_clear_one_slot
>>
>>  accel/kvm/kvm-all.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
> 
> .
> 
