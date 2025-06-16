Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1830908njc;
        Mon, 16 Jun 2025 05:48:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOg0jNUQtv2chdtbje43Fs9LAgzn9LygfbA3nnnvvVKz5c0JCGjV0tU6hlXeBxQH9Yo2AZtZwgukadaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFbJ7JZ2yGXiP1s8PgcKXtyem8y1ltpBhfTe3T49qM8UUV228RGw7E87bJ9Y0lcH90zFWOO
X-Received: by 2002:a05:620a:1a2a:b0:7c5:dcaa:d799 with SMTP id af79cd13be357-7d3c6cec2d1mr1343003885a.39.1750078132829;
        Mon, 16 Jun 2025 05:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750078132; cv=none;
        d=google.com; s=arc-20240605;
        b=erhviXSmQrx1yWyTt8Ref38dL5FRiD7vZNxjbgSyMRn0EfD33Xwl8SspvG3UrE2nsw
         icXpUWn2MiwVPFzuLCItsaTfhJry7z1+WYII/UuTHwAxC728rqOIg3ZxrYGnXvksLZsw
         bPzGe1mThzms5pIbIXv5tdlpxyTTid5F/Ous7uvEHlN/Sb0yLZNSYkfobfbhCp19t4CT
         9eFwiC2TtUL8BCpFu0G+0ekrhAiGd4pNxGqEw37RS4DXka1nnS6cYA6lGMxUxGh/uWYl
         LIYhFAbcIz4EaV44I/nTzjYTdGG1okLQOS50W7LzB/iM6i84BdfMWg+tyfn87o6hHT0o
         Wzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=SToNXkmXkjN8h29heaOt21TQKmoZKXKujC/lnqpdZhY=;
        fh=xX1PfcJgFxz17JvLQ3am5Rp9wh4oXpv+OjagWgW5VKQ=;
        b=CYo1pXPWmVOsEJrkxKVSXbEP8n4W3g8nK4AnECoTOdoTFEYEMBE9rupo1e7hOi1G4s
         6pSQByryBwRlGkUgt9A9xk0tgPRDpGDw/foyYOIpZHc7Pgv+aruFzuQn3waqZgDKiLIA
         0rwNseHPAebyhyAR/FLbkJmxE8cvSCZO2uApZ11stPrYOoLQ8H6gzREbsfY8PxsEMe1V
         o5rURMHcyLK1L434tFLsbs5zNDUkUTzlrNpxtrwrYSmso3ckz1/HV4YCwF1bcuKb5oYg
         vpbFJB0s0xmYNY4VZRNzZbZT2e05JK6QLJpvfZ/bJieDI2HQTrOv3lMbQK2nW8SdZVmL
         CzdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f3e3c4si963584385a.578.2025.06.16.05.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 05:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR9G9-0006Dh-N6; Mon, 16 Jun 2025 08:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR9G6-0006Cz-O2; Mon, 16 Jun 2025 08:48:18 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR9G3-0000hn-PY; Mon, 16 Jun 2025 08:48:18 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLVC14X0Pz6M567;
 Mon, 16 Jun 2025 20:47:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id C40E41402FF;
 Mon, 16 Jun 2025 20:47:57 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 14:47:56 +0200
Date: Mon, 16 Jun 2025 13:47:54 +0100
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <qemu-devel@nongnu.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <armbru@redhat.com>, <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>,
 <eric.auger@redhat.com>, <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, 
 <imammedo@redhat.com>, <jiangkunkun@huawei.com>, <linuxarm@huawei.com>,
 <maobibo@loongson.cn>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <shannon.zhaosl@gmail.com>,
 <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: Re: [PATCH v13 2/7] hw/core/machine: topology functions
 capabilities added
Message-ID: <20250616134754.00004530@huawei.com>
In-Reply-To: <20250611155618.351-3-alireza.sanaee@huawei.com>
References: <20250611155618.351-1-alireza.sanaee@huawei.com>
 <20250611155618.351-3-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vvy/YZs3fxRt

On Wed, 11 Jun 2025 16:56:13 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Add two functions one of which finds the lowest level cache defined in
> the cache description input, and the other checks if caches are defined
> at a particular level.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  hw/core/machine-smp.c | 52 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/boards.h   |  7 ++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index 0be0ac044c..a4d79e0aa4 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c

> +
> +bool machine_check_cache_at_topo_level(const MachineState *ms,

Maybe avoid machine_check naming. It has too many other meanings!

machine_is_cache_at_topo_level() perhaps?

> +                                       CpuTopologyLevel level)
> +{
> +    if (machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L3) == level ||
> +        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L2) == level ||
> +        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1I) == level ||
> +        machine_get_cache_topo_level(ms, CACHE_LEVEL_AND_TYPE_L1D) == level) {
> +        return true;
> +    }
> +    return false;
> +}


