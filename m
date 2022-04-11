Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1423889lfq;
        Sun, 10 Apr 2022 23:55:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRutBX44HGYCQM4ZyU5pfLiPhbb27sTXYxfcG9qdO0z6229/aULlMw9B39gvZHjVmalhPL
X-Received: by 2002:a05:620a:1406:b0:69b:ff59:90c5 with SMTP id d6-20020a05620a140600b0069bff5990c5mr5590726qkj.699.1649660158919;
        Sun, 10 Apr 2022 23:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649660158; cv=none;
        d=google.com; s=arc-20160816;
        b=O5dElGccIJnEC4P3w6yzsntbiR8/0UbuVA0ypYJVksvir49C2pf3n0VJwfhsIQXOdC
         sgfTFjDr1uendFi438z/r/dwUGZDYgfhuZdQyR7MCNrONAJoJCfCF6i9oaNdA5zaIhLk
         y2CgwoVpATm63ifMpIFybexzKMKg/S6ttuBWCNdTfomIn32gTfo9dMfUxNeKJSFZIlrD
         ef0aSn67cRFsVYtEXUv9PojMRwEzMInkcJec1lqqQCL1s8jHQ4n7yVUI7bPc4TZnBKjg
         7Dzs4VhaKLIddumih06tZpBEQbPYgio61RmeeO1oB++hEAoqjACzt47u7msKo5Co9772
         P/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=6krlZoPpu++1PI6K71u7bndkhvBtVYooaatRPeFuyx0=;
        b=pZMH5/DRxQFIVG3zNHVasx8i7+rwOQdAXghewYkA0AW2GddQ2k7igi1AcyP39qQdzc
         1+BM3f9fz6FZOWbNSYCksv/784sOGj5KHqN5jpGjYx57cejqiVBxSEl0ShesgpRtOawB
         hpst4Sg6iw59EhB74RZ5mIr7PT5SueyR0SAtueE8BNWmFWYVfs4Ta4FfeKhDzNlP0+/I
         IXoPeeunPJwfBGCDUNf4o3/aVS1Goi2X2XYRzSRIGAxaAntpX8F/BGng8GlYKrPuhoGV
         TziP11xtMMcG7XLwCpNRgWFd8a+G8mqyvIIXtGznA8khEtU7WY3c/p9y28/u3HutVINf
         RkSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkRLtRWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl21-20020a056214519500b00443f0971584si3759016qvb.281.2022.04.10.23.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Apr 2022 23:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkRLtRWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndnxu-0005Fb-CM
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 02:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndnqj-0000LC-23
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndnqh-0005UB-Fb
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649659710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6krlZoPpu++1PI6K71u7bndkhvBtVYooaatRPeFuyx0=;
 b=NkRLtRWhqsRjLVcmUoWRHlv5YVqXKdFIHjRJkkGibBEMtvPjt59ZNgODaP1HoNKeTBjrT9
 2DZxEphXt/Ya2NFpOS7TEsXiNmqzrNWZixJuzU5t6z4V4E5laJv0R8kOgA6lGv8kcfK3nR
 Wp30T/umNeGP/K1Fpt34hFyQrF7biGA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-Y4A1tQ9mM1ynaFzdYfEIIA-1; Mon, 11 Apr 2022 02:48:27 -0400
X-MC-Unique: Y4A1tQ9mM1ynaFzdYfEIIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C79A3C01C0E;
 Mon, 11 Apr 2022 06:48:27 +0000 (UTC)
Received: from [10.72.12.73] (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E51562166BB1;
 Mon, 11 Apr 2022 06:48:22 +0000 (UTC)
Subject: Re: [PATCH v5 0/4] hw/arm/virt: Fix CPU's default NUMA node ID
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
References: <20220403145953.10522-1-gshan@redhat.com>
Message-ID: <3b6db41b-0a05-1c81-00e3-96331950c164@redhat.com>
Date: Mon, 11 Apr 2022 14:48:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220403145953.10522-1-gshan@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-TUID: GZ9YMuS6Thr2

Hi Igor and Yanan,

On 4/3/22 10:59 PM, Gavin Shan wrote:
> When the CPU-to-NUMA association isn't provided by user, the default NUMA
> node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
> Unfortunately, the default NUMA node ID breaks socket boundary and leads to
> the broken CPU topology warning message in Linux guest. This series intends
> to fix the issue.
> 
>    PATCH[1/4] Add cluster-id to CPU instance property
>    PATCH[2/4] Uses SMP configuration to populate CPU topology
>    PATCH[3/4] Fixes the broken CPU topology by considering the socket boundary
>               when the default NUMA node ID is given
>    PATCH[4/4] Uses the populated CPU topology to build PPTT table, instead of
>               calculate it again
> 

Please let me know if you have more comments for this series, thanks
in advance.

Thanks,
Gavin

> Changelog
> =========
> v4/v5:
>     * Split PATCH[v3 1/3] to PATCH[v5 1/4] and PATCH[v5 2/4].
>       Verify or dump 'clsuter-id' in various spots               (Yanan)
>     * s/within cluster/within cluster\/die/ for 'core-id' in
>       qapi/machine.json                                          (Igor)
>     * Apply '% ms->smp.{sockets, clusters, cores, threads} in
>       virt_possible_cpu_arch_ids() as x86 does                   (Igor)
>     * Use [0 - possible_cpus->len] as ACPI processor UID to
>       build PPTT table and PATCH[v3 4/4] is dropped              (Igor)
>     * Simplified build_pptt() to add all entries in one loop
>       on ms->possible_cpus                                       (Igor)
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
> Gavin Shan (4):
>    qapi/machine.json: Add cluster-id
>    hw/arm/virt: Consider SMP configuration in CPU topology
>    hw/arm/virt: Fix CPU's default NUMA node ID
>    hw/acpi/aml-build: Use existing CPU topology to build PPTT table
> 
>   hw/acpi/aml-build.c        | 100 ++++++++++++++-----------------------
>   hw/arm/virt.c              |  20 +++++++-
>   hw/core/machine-hmp-cmds.c |   4 ++
>   hw/core/machine.c          |  16 ++++++
>   qapi/machine.json          |   6 ++-
>   5 files changed, 80 insertions(+), 66 deletions(-)
> 

