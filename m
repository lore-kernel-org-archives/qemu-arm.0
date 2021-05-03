Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2887758lfg;
        Mon, 3 May 2021 11:24:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKZtDZiTG0zd5IopaAxqwSHjtwO3s9PDQGHI85GcGHKSKaGFue/Q9wI/HwO3TEqtFY8cO0
X-Received: by 2002:a02:b698:: with SMTP id i24mr11169451jam.121.1620066262281;
        Mon, 03 May 2021 11:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620066262; cv=none;
        d=google.com; s=arc-20160816;
        b=qQGmHw3hvd5jd7LKErC2aPsyj7XQr9a2HxozXgaFuB8AshwHJfXEEeCn9N3WOzxu3H
         AfjHbmdsijPyiF3m8NAuukz6+zahOtzEvwer/JAO7vLFVxrPqFsZlN/4Mo4Y4VdI2ioR
         dpUyYGe5eLzTSYerFdU0wuHaoqTQ2WpBYz3Di/7Q1tc/1v3HJJeT3Nxm/npE3emZbWRH
         YlPu+KIi1/Jj/ZzBkiDmZqMoGBVZiChC+DNzxqeCpSlhwNDqQji9CbWMH3lQeIAUudXF
         QIN1GJUDaU8w7EQujbzWEOP9Phc2WvdLnXJDu1Knav8apSachsDPzcCGRu7zXWMcYkZR
         lWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=bOndVeIoEuD6BxxxnUoCWdomohKYh7q5QO21fTfb7Rs=;
        b=DUYjetU7YI6O7O3GDtffrdSC2wNeh1zCevTRX08Q7hPVqw7GHstfmdmeuFM1VBpMwg
         etMzaiFaQWfIRbU+oEy632dse1IepNXdKc4G+paaSaICVmCKf04hHVt+68jRE0LNSztR
         qXdeX4+IFSu8d01tw5utuBnGWY1IRUxpnINygI2D0OX5HLduVzO+B1saHnvvHOHqgWA0
         8y1IcM3orHPRKzBAYlArkNySJg2JdaLxAXtVkhsJgVCwYChSvVn/DM1gfhACXkQvlYMT
         QQ5Xitx0R2/YzXvGt0/VcoVqCluRLj30J7YdmMxOKK5HGJMPiCwAffhtwF9Ok4jgjkQj
         EKpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HxCVTStf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si370470iow.83.2021.05.03.11.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 11:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HxCVTStf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lddEz-0000Ld-KQ
	for alex.bennee@linaro.org; Mon, 03 May 2021 14:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lddEo-0000Is-64
 for qemu-arm@nongnu.org; Mon, 03 May 2021 14:24:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lddEk-0001FO-5o
 for qemu-arm@nongnu.org; Mon, 03 May 2021 14:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620066244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOndVeIoEuD6BxxxnUoCWdomohKYh7q5QO21fTfb7Rs=;
 b=HxCVTStfXW6vpGxROXM5r/Ml0R6gAPgoigEik7sdcGqMcZTDh2tjMDhHocL3g8YnLhUmis
 9UERtNsouU5/upvD6pV6q2dmzi29rqk4xqGYgix2j7AEubWlnF3R4NYS+6kdtHl1VsDdyL
 Jv9ylLFmhxMCk8KXwbEer5QcZRvkluY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-wJoHu14tMkqq6VCExnMgoQ-1; Mon, 03 May 2021 14:24:01 -0400
X-MC-Unique: wJoHu14tMkqq6VCExnMgoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45556100A608;
 Mon,  3 May 2021 18:23:58 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8979B6061F;
 Mon,  3 May 2021 18:23:47 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] spapr: nvdimm: Forward declare and move the
 definitions
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, david@gibson.dropbear.id.au,
 groug@kaod.org, qemu-ppc@nongnu.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, pbonzini@redhat.com, stefanha@redhat.com,
 haozhong.zhang@intel.com, shameerali.kolothum.thodi@huawei.com,
 kwangwoo.lee@sk.com, armbru@redhat.com
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <161966811094.652.571342595267518155.stgit@17be908f7c1c>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f33dfff6-a1f7-244f-531e-ef0d93ad0c3d@redhat.com>
Date: Mon, 3 May 2021 13:23:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161966811094.652.571342595267518155.stgit@17be908f7c1c>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com,
 qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com,
 bharata@linux.vnet.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: olsXfmFAx8vz

On 4/28/21 10:48 PM, Shivaprasad G Bhat wrote:
> The subsequent patches add definitions which tend to
> get the compilation to cyclic dependency. So, prepare
> with forward declarations, move the defitions and clean up.

definitions

> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  hw/ppc/spapr_nvdimm.c         |   12 ++++++++++++
>  include/hw/ppc/spapr_nvdimm.h |   14 ++------------
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index b46c36917c..8cf3fb2ffb 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -31,6 +31,18 @@
>  #include "qemu/range.h"
>  #include "hw/ppc/spapr_numa.h"
>  
> +/*
> + * The nvdimm size should be aligned to SCM block size.
> + * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> + * inorder to have SCM regions not to overlap with dimm memory regions.

And while at it, even though it is code motion...

> + * The SCM devices can have variable block sizes. For now, fixing the
> + * block size to the minimum value.
> + */
> +#define SPAPR_MINIMUM_SCM_BLOCK_SIZE SPAPR_MEMORY_BLOCK_SIZE

> +++ b/include/hw/ppc/spapr_nvdimm.h
> @@ -11,19 +11,9 @@
>  #define HW_SPAPR_NVDIMM_H
>  
>  #include "hw/mem/nvdimm.h"
> -#include "hw/ppc/spapr.h"
>  
> -/*
> - * The nvdimm size should be aligned to SCM block size.
> - * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> - * inorder to have SCM regions not to overlap with dimm memory regions.

... this should be "in order"

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

