Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2130231lfb;
        Sun, 3 Apr 2022 05:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFB5AGcRG9YZFSYLPnDNUY6z/W+BEaTrlYRn3cE7Z0wdw1UXU6Fj/B9VmDHLPKpIXBDN5h
X-Received: by 2002:a05:620a:29d0:b0:680:9c1a:557a with SMTP id s16-20020a05620a29d000b006809c1a557amr10942585qkp.646.1648987248156;
        Sun, 03 Apr 2022 05:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648987248; cv=none;
        d=google.com; s=arc-20160816;
        b=pbN2okF3+reAEME/V2JIXsnXbj5JylQnKFW85SOT8NjdvY6kLT8AG6PBTdl1/mvGsH
         YyNde7nlxL8aQVmAZ3X6r/Wbw8K639/n2ZG+im0FVrVczu0eEwJwLyAkdU1rwJs1NueJ
         gy8qNDrjJUOAlUa+KIWI3Ebd0bM1jr4/QfwXHW9kyLsyekBDQH8r3mZlkxQenxjW93qf
         GJItXXRcMU5nkwKIcw9TbNQlPQHi0VsuXQ5gymh/to0DffhWSy4uYWigxg3tLmOBJmtd
         oy5pbJYEVLny/PTsrqk3y00Gw5foOzpuflN+7e5XR/QJemEXDVHwJJaugjELIczIMkNw
         h0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=FrwycE0eEq0GpPgg3RgVw1Ju5qXSIABgClfJkj82T0s=;
        b=XImbCaRo4G8hBc4Ywly+HlfNsGAK+xDuMkJc2Aw7Zc+8fgGh/vMENeWMlTYXGXtpP1
         50a6UkJIQD/jHiDA5ekkYpYjQSScOLNS7o4XtxxjST2PO2fyjLQ8moifEgTtP4UDgzHk
         cEHhIOuH0mWXcXZF26z5D52Dy2Dq/WEaI8ws5oLrMAnXpv3+OqQXenuM76wkpVORtkUW
         fqLlIROoplF6Lz40ZmXWS2hBe13ZiODJpmZ0vJVXbHOSZQI5/TDt2FIYeEF1EExAss5W
         AW+ybGRRq/4TrB1QnwaLLAvv6TnEBNx4VxffT0Xi/3MlSKa/LYIVsew3lJS2kjOUMWj/
         T/Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cpcY6OOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bo5-20020a05621414a500b00440e46a7ccbsi2036333qvb.361.2022.04.03.05.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 05:00:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cpcY6OOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nayuV-0006Zm-Lz
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 08:00:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naysr-0004co-8U
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:59:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naysp-0002FI-P3
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648987143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrwycE0eEq0GpPgg3RgVw1Ju5qXSIABgClfJkj82T0s=;
 b=cpcY6OOVP3sA1/gQLYxoFU/GBMbu/cy5f3MZQU7YrFxXx4mzvNNmhidFZJ+k5ze9PLaEdj
 Yoe43khkMp6HSIWzkfz2GjrLvOZNB5g3GwhBIWQpqRAX5j34l9b8q4qt2K7bcqEz2B11CL
 vB+DDktGEpo6wftG+3wb1pgRDWS5apE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-FPt-AJVIPkKFOVakLWEZNw-1; Sun, 03 Apr 2022 07:58:59 -0400
X-MC-Unique: FPt-AJVIPkKFOVakLWEZNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B22B38041CF;
 Sun,  3 Apr 2022 11:58:59 +0000 (UTC)
Received: from [10.72.12.82] (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44D74C54197;
 Sun,  3 Apr 2022 11:58:54 +0000 (UTC)
Subject: Re: [PATCH v4 0/3] hw/arm/virt: Fix CPU's default NUMA node ID
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
References: <20220403110036.5531-1-gshan@redhat.com>
Message-ID: <b11c196a-7232-f1d6-97ce-3637b3e9352e@redhat.com>
Date: Sun, 3 Apr 2022 19:58:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220403110036.5531-1-gshan@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4pSTQ7eAfHL4

Hi Igor and Yanan,

On 4/3/22 7:00 PM, Gavin Shan wrote:
> When the CPU-to-NUMA association isn't provided by user, the default NUMA
> node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
> Unfortunately, the default NUMA node ID breaks socket boundary and leads to
> the broken CPU topology warning message in Linux guest. This series intends
> to fix the issue.
> 
>    PATCH[1/3] Uses SMP configuration to populate CPU topology
>    PATCH[2/3] Fixes the broken CPU topology by considering the socket boundary
>               when the default NUMA node ID is given
>    PATCH[3/3] Uses the populated CPU topology to build PPTT table, instead of
>               calculate it again
> 

Please ignore this series (v4) and review v5 directly. I missed some of your
comments when v4 was posted and they will be covered in v5.

> Changelog
> =========
> v4:
>     * Apply '% ms->smp.{clusters, cores, threads} as x86 does
>       in virt_possible_cpu_arch_ids()                            (Igor)
>     * s/within cluster/within cluster\/die/ for 'core-id' in
>       qapi/machine.json                                          (Igor)
>     * Use [0 - possible_cpus->len] as ACPI processor UID to
>       build PPTT table and PATCH[v3 4/4] is dropped              (Igor)
> v3:
>     * Split PATCH[v2 1/3] to PATCH[v3 1/4] and PATCH[v3 2/4]     (Yanan)
>     * Don't take account of die ID in CPU topology population
>       and added assert(!mc->smp_props.dies_supported)            (Yanan/Igor)
>     * Assign cluster_id and use it when building PPTT table      (Yanan/Igor)
> v2:
>     * Populate the CPU topology in virt_possible_cpu_arch_ids()
>       so that it can be reused in virt_get_default_cpu_node_id() (Igor)
>     * Added PATCH[2/3] to use the existing CPU topology when the
>       PPTT table is built                                        (Igor)
>     * Added PATCH[3/3] to take thread ID as ACPI processor ID
>       in MADT and SRAT table                                     (Gavin)
> 
> 

Thanks,
Gavin

> Gavin Shan (3):
>    hw/arm/virt: Consider SMP configuration in CPU topology
>    hw/arm/virt: Fix CPU's default NUMA node ID
>    hw/acpi/aml-build: Use existing CPU topology to build PPTT table
> 
>   hw/acpi/aml-build.c | 95 +++++++++++++++++++++++++++++++++------------
>   hw/arm/virt.c       | 19 ++++++++-
>   qapi/machine.json   |  6 ++-
>   3 files changed, 92 insertions(+), 28 deletions(-)
> 

