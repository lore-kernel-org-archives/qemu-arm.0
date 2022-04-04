Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp136846lfu;
        Mon, 4 Apr 2022 05:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSZvckuV83IR8RCz1QC7JjS1qxARJDCZN1zDYilN73APgpg1UImn3UveDTBzgnk/UitIWG
X-Received: by 2002:ac8:5f95:0:b0:2e1:dc8b:f851 with SMTP id j21-20020ac85f95000000b002e1dc8bf851mr16678325qta.36.1649073824068;
        Mon, 04 Apr 2022 05:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649073824; cv=none;
        d=google.com; s=arc-20160816;
        b=foG9qun68in8WP8RjFAu1XCAbd1QMHaoUs0QKHO6Ul2lWxApsWIOOHW2KWn2nYRctR
         VpnEZuGtSwC9KaGVBJwtcBsCK5fZKA2JcfQYq1Kmh6R/KFI81AWPNsbgMhww54Bf51FT
         /TjtfeflmkBNFyiyJHkZom1crwiwmh0HjGDtQGRSboPRSAVt0iRWW9mUKjya3JhpoBEi
         123IQxVh95BM5yFlrrKu8OtatgVjDPHYIJ1J+lk66ULbuFBjyTRNfoZpiGQJNdhOPSUg
         ubz6HIcjYRI7HOfxhXha0V/bbcTAxCYbAyWmXb5H1cd5KKcGAIEDe8f3zan8YMo5s+C+
         +f4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=qYh0ZCQabxEewuaJGpqXzDYGhcd5FkfM22Q4Uw4AyGc=;
        b=pteN5SaER17QVX5DBZ1yrhZLPZeDLc577/RFLOIHlJLjJUa7PuYk0d1q/SzafXKxKv
         VED9I14BzPbidx1G1JKRXcDfxHWPfoikzah4ZYCAZkB7EjELur+mpGQnkmofCZnTKL14
         EjuksdSZGgBSNwUo+ThtM+/ZsK8GxVezmAaZSl7ZpNPJlUAIS3RuSRXY+YR2oL5lyyEc
         9bAahBLwqRraAnX/OCl4hVbXgy/NdnrGBv6h5rhSpKpqNrmss1SITYbYnZ1jfMoml9wc
         MjXhfM1FVdrk4+ZGqkfICWyLHY6rz9EQDW252PqS69zfQRmZqEUoim6YKcJo5kcrEbSU
         Sh+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OWGjJuBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24-20020ac86b18000000b002e1fbf3c08asi2824571qts.635.2022.04.04.05.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 05:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OWGjJuBT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbLQt-0001Zg-4S
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 08:03:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nbLQh-0001Wy-2L
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 08:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nbLQb-0002In-5s
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 08:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649073803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYh0ZCQabxEewuaJGpqXzDYGhcd5FkfM22Q4Uw4AyGc=;
 b=OWGjJuBTBLrX3oNEnTMapowEeyNWAGoQend2EYWYImSggxnxQKIuqg/dwv1WTFc+uxlZfY
 xVaUf5Zy10bAbbWATxUgioG/gxD9bvDb8ROIGvBhRKxU/SsLf86ahaTXS7rt50pL+/qnzQ
 d1aQXwQwhGIQu37hJNuEvukCuNRv+Xs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-GEa83qrVPKCNcX773A2G3w-1; Mon, 04 Apr 2022 08:03:22 -0400
X-MC-Unique: GEa83qrVPKCNcX773A2G3w-1
Received: by mail-ed1-f71.google.com with SMTP id
 l2-20020a056402028200b0041cd2975b87so1599430edv.22
 for <qemu-arm@nongnu.org>; Mon, 04 Apr 2022 05:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYh0ZCQabxEewuaJGpqXzDYGhcd5FkfM22Q4Uw4AyGc=;
 b=tCByuT8h3HH9kDubpyWg2Zp8tA+YmbXxSKfQhdhpZFJXHc9qz9G0fvsZvEo+/5uvrz
 UG7QfsusBxH6HmHajmVKlfkgMq89MOWybAj1hV/lfhXXcX1XfFMyImCvHat8EION+O6P
 R61FJ9SGVNIe5Z+W7G4mIjRk5+LClgSUbPwPAru+jfMM+jD46LSceA/cnQ3B0oyLQlbS
 /oqyxGzEEjaxH56Amb/OHT3LZIllC3+coPnffYvbLQvtRJyZ2XZq7CbO+n3hfxrB3Wwx
 KuBKlLAoNytWHWlq8aYKdg6GjbMeFG7DktKmA5jiuoWWbtzvQVJg9oFL/ZFu4uqWwY6f
 ouIA==
X-Gm-Message-State: AOAM532/SPFCXGdNXW02NbQLjU/GvA9XtQJqp9ymjNC6i5ruYCp+ADyh
 1i6Y/dV2anA/rVC4Dty4a3mBVGLkrKR97J8Q+0zWHyepdBods4amZjF5lKhCBxsfUKXGLiz7nTA
 v9TSS60OICFck
X-Received: by 2002:a05:6402:2816:b0:419:2a8e:6d3e with SMTP id
 h22-20020a056402281600b004192a8e6d3emr32236160ede.47.1649073800800; 
 Mon, 04 Apr 2022 05:03:20 -0700 (PDT)
X-Received: by 2002:a05:6402:2816:b0:419:2a8e:6d3e with SMTP id
 h22-20020a056402281600b004192a8e6d3emr32236121ede.47.1649073800459; 
 Mon, 04 Apr 2022 05:03:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 lj20-20020a170906f9d400b006e7f1e1f4a0sm1158595ejb.60.2022.04.04.05.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 05:03:19 -0700 (PDT)
Date: Mon, 4 Apr 2022 14:03:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220404140318.5afd6c58@redhat.com>
In-Reply-To: <17bd5453-ef36-6bbc-3913-d806e0ed7a38@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <YkquyMTJqq+jFvm0@redhat.com>
 <17bd5453-ef36-6bbc-3913-d806e0ed7a38@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, zhenyzha@redhat.com,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: av3Ul+iv45Qx

On Mon, 4 Apr 2022 18:48:00 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Daniel,
>=20
> On 4/4/22 4:39 PM, Daniel P. Berrang=C3=A9 wrote:
> > On Sun, Apr 03, 2022 at 10:59:51PM +0800, Gavin Shan wrote: =20
> >> Currently, the SMP configuration isn't considered when the CPU
> >> topology is populated. In this case, it's impossible to provide
> >> the default CPU-to-NUMA mapping or association based on the socket
> >> ID of the given CPU.
> >>
> >> This takes account of SMP configuration when the CPU topology
> >> is populated. The die ID for the given CPU isn't assigned since
> >> it's not supported on arm/virt machine yet.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/arm/virt.c | 16 +++++++++++++++-
> >>   1 file changed, 15 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index d2e5ecd234..3174526730 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_ar=
ch_ids(MachineState *ms)
> >>       int n;
> >>       unsigned int max_cpus =3D ms->smp.max_cpus;
> >>       VirtMachineState *vms =3D VIRT_MACHINE(ms);
> >> +    MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >>  =20
> >>       if (ms->possible_cpus) {
> >>           assert(ms->possible_cpus->len =3D=3D max_cpus);
> >> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_a=
rch_ids(MachineState *ms)
> >>           ms->possible_cpus->cpus[n].type =3D ms->cpu_type;
> >>           ms->possible_cpus->cpus[n].arch_id =3D
> >>               virt_cpu_mp_affinity(vms, n);
> >> +
> >> +        assert(!mc->smp_props.dies_supported);
> >> +        ms->possible_cpus->cpus[n].props.has_socket_id =3D true;
> >> +        ms->possible_cpus->cpus[n].props.socket_id =3D
> >> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)=
) %
> >> +            ms->smp.sockets;
> >> +        ms->possible_cpus->cpus[n].props.has_cluster_id =3D true;
> >> +        ms->possible_cpus->cpus[n].props.cluster_id =3D
> >> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.cluster=
s;
> >> +        ms->possible_cpus->cpus[n].props.has_core_id =3D true;
> >> +        ms->possible_cpus->cpus[n].props.core_id =3D
> >> +            (n / ms->smp.threads) % ms->smp.cores;
> >>           ms->possible_cpus->cpus[n].props.has_thread_id =3D true;
> >> -        ms->possible_cpus->cpus[n].props.thread_id =3D n;
> >> +        ms->possible_cpus->cpus[n].props.thread_id =3D
> >> +            n % ms->smp.threads; =20
> >=20
> > Does this need to be conditionalized d behind a machine property, so th=
at
> > we don't change behaviour of existing machine type versions ?
> >  =20
>=20
> I think we probably needn't to do that because the default NUMA node
> for the given CPU is returned based on the socket ID in next patch.
> The socket ID is calculated in this patch. Otherwise, we will see
> CPU topology broken warnings in Linux guest. I think we need to fix
> this issue for all machine type versions.

Agreed.
Also guest-wise it's ACPI only change, which is 'firmware' part of QEMU,
and by default we don't to version those changes unless we a pressed
into it (i.e the same policy that goes for bundled firmware)

> Thanks,
> Gavin
>=20

