Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4749497lfp;
        Tue, 28 Sep 2021 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGpo1eVYQpydIEsLMWCJu6gQorIJQUVL7gQZJa4QligivKoeWZhKLMmbNnFa+Ngz2n0eWT
X-Received: by 2002:a92:c683:: with SMTP id o3mr4124933ilg.0.1632826671488;
        Tue, 28 Sep 2021 03:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632826671; cv=none;
        d=google.com; s=arc-20160816;
        b=CL0ZDv0YZyFs0RM/WMf5eQ/6byeccfRax0cmJ8C2/BLVRxcQ97iffbyCrL552Tbwvu
         f9LUuuSjTt8Ruw8NiCSyNu9ymcSKemiI6IA3t/5IQXK6/EDgvq5oCWTbH+9VgSEPkWwQ
         HSunw9JZ+v4GZRNMzWl2rgxV3KS1/QBckotXCduu3c1dmTw/ON4vOtids/8sIO/QoHXI
         Qbqf3ftiaTPTSLyUhWCe8Li+6EyYY65PYdy8NEhWNnHWDYGn1G34mbgJfs8giJVe1l1u
         PngdQDqdLDiuknc/ItfhC6+F1OOc6Kg3Xs/FSKRz9s4p/tbT0xruwLxI4upBAA+rhHUs
         VHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=mXKCsPu6wY7iDMU4HgvA+TIWDkRyDj4bF8zux9JV8Ig=;
        b=LufPjuE7TQIjNCgRGeaZv7ISET+3m9EW6m5yLvGYRBjkx0/+LUOq5Jd6sAll/MsQk5
         UHyB/vXowxils00P8jNXj/OXBN4x3wppJkyT0rrohAoDA1Uq8N75SNNiZ4Q5RLczgBm9
         gmfA9e7BEdCt1gEYjaKmjl1VZrs2FdkPlmFMvx2mqRccznHq7XKFj1YPMapE6BcgVKkO
         W/vstQZ9dk8kZwrDMGOyQ61e5EF/dRTPaPIbUM3WYgTokLHEame4tYdhZ7NaDO2LE2uZ
         vH+Es+Ak1jrDp2og7PVMPnuYTWWFqtIYpIvo0VJy5kj0hfi324HR+lDJmNnd8g+fraGl
         JtwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HUCUkyGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si10963415iop.100.2021.09.28.03.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HUCUkyGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAo2-0007gK-Nx
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAnh-0007eo-SD
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAng-0007Jw-C1
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXKCsPu6wY7iDMU4HgvA+TIWDkRyDj4bF8zux9JV8Ig=;
 b=HUCUkyGcR+3Kf1PoklcL+ZhYt5oQZJy4rLJANTmQ/aO1foc43z0njnmw9I119WOUc1Os07
 VKByu7T8Qnh3dOjx+hES5wafW2NL8aJ2mrBXXMTneEiCVaId1rzMwsoq9YRCvopPLEN1/c
 Dn7YQo3Wv9Mnwv7TG2221KTQ/yGILqI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-8xWWFAm9PuuJ5TCnxUxZdg-1; Tue, 28 Sep 2021 06:57:24 -0400
X-MC-Unique: 8xWWFAm9PuuJ5TCnxUxZdg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so14974448wrg.17
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 03:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mXKCsPu6wY7iDMU4HgvA+TIWDkRyDj4bF8zux9JV8Ig=;
 b=vYqdj3+5OdpM4QL0pWwCIH0Dl6FZJlZw+HDPlsGrLPYXYkNXh+eY1OMK+ZOhGHfI1T
 BYkEQZ4oQvXlQJYeTWgVXikc+cLXi7cBOA+uC7hp7TRWAgoAtZX8kFlP0rgBNXRsvyqc
 Tnp8ulf8uVffAcR4ZPXMJ4/e491BYwnU2PawbDQOd0Aw+g3YolQ7xIf66XdyOfxzoH+r
 s6QIgf+BmVnvg6QmQWE95+g3lFMZDz9uLYLTOnVdY9Ss1xwR3d6w4pGKZrMvyvZG7ZsP
 GY6Ynu194bh/ZRmlgnVB186MVfT45LGjgZo+8B/ncU8TfSTk/G/UnUm2cEA2jktoQvFI
 TrFg==
X-Gm-Message-State: AOAM530quoNfKGKJrBPV0PnDXhHKcgAhD3rGovp8JSOlWuXsu2J4CbmR
 87xDrGsPCaPtRgRcBLybnEgdgCLJfUwt/6VwSFrGhbMGp0yJfQOv6iX3d5LcirrpjEV4AzMKpn4
 ODjlFef9/pzRY
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr3947313wma.35.1632826643387; 
 Tue, 28 Sep 2021 03:57:23 -0700 (PDT)
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr3947284wma.35.1632826643190; 
 Tue, 28 Sep 2021 03:57:23 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y11sm23422869wrg.18.2021.09.28.03.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:57:22 -0700 (PDT)
Message-ID: <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
Date: Tue, 28 Sep 2021 12:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-12-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HcTGF3m5x8Jl

On 9/28/21 05:57, Yanan Wang wrote:
> Currently the only difference between smp_parse and pc_smp_parse
> is the support of dies parameter and the related error reporting.
> With some arch compat variables like "bool dies_supported", we can
> make smp_parse generic enough for all arches and the PC specific
> one can be removed.
> 
> Making smp_parse() generic enough can reduce code duplication and
> ease the code maintenance, and also allows extending the topology
> with more arch specific members (e.g., clusters) in the future.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
>  hw/i386/pc.c        | 84 +----------------------------------------
>  include/hw/boards.h |  9 +++++
>  3 files changed, 81 insertions(+), 103 deletions(-)

> +/*
> + * smp_parse - Generic function used to parse the given SMP configuration
> + *
> + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
> + * automatically computed based on the provided ones.
> + *
> + * In the calculation of omitted sockets/cores/threads: we prefer sockets
> + * over cores over threads before 6.2, while preferring cores over sockets
> + * over threads since 6.2.
> + *
> + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
> + * maxcpus will be computed from the given parameters and cpus will be set
> + * equal to maxcpus. When only one of maxcpus and cpus is given then the
> + * omitted one will be set to its given counterpart's value. Both maxcpus and
> + * cpus may be specified, but maxcpus must be equal to or greater than cpus.
> + *
> + * For compatibility, apart from the parameters that will be computed, newly
> + * introduced topology members which are likely to be target specific should
> + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
> + */
>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)

Can we have it return a boolean instead?

