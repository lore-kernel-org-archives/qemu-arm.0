Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3214772lfk;
        Wed, 26 Jan 2022 01:16:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylmWG+EtU2ZQKl2pF9MKzI78zjgBREAJR3fDevwK0w0SM2PYiZ70DL8+6jMQM03+VfyOw5
X-Received: by 2002:a37:9b10:: with SMTP id d16mr10398835qke.413.1643188567226;
        Wed, 26 Jan 2022 01:16:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643188567; cv=none;
        d=google.com; s=arc-20160816;
        b=VdQNAJw7yce45F8hzUVE5Rz11B5hLTpn1Hj5NW+HxbOsFWld57/IwDfA5FdgoIhCcJ
         abnAOr0Sd8JXv9Ld5KTuMidGKJ81itMv4vISy2S05EqFF1CsG792jHgE46KPBaMMnyDM
         rRT2NxshDA0TG0JxM040jQrS1mMo9BueqJ5NiQpPLKo7gkaRV/3SmODjPu6UX7etHX0c
         XynMCpdmxZLSnqX1rr1XPvY6kgg6zeO9CXJfuPR1fSa5VD5ZhgSo5A7haUUqrnjzyEyN
         5z6Fy2as8RSBwvGUAhgzkE9qhbeooeMvVI+sZuZ0Fz65Of++I5A3BEnwkm1tfSMPW9oD
         jLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=qsJZ0k6nGl/3sdNEEomOxBCWt40O4S2du5yVW+QiMdY=;
        b=EwTDd3AN+w7Rk0+sFUtIVlCbmLOwgTc3msW1fKIkbmUArOYXx9P6zy104A6hZXyh7S
         uEwKKRwv2lVZSJV9qtUY2+5hzQ3/E5IbXzECXTZpfp//WzJVcQoS4GcGXOeZOGdgiT7J
         wd6gJRfVf7BRtq3Bg4ubQLUvhT5C/vkKPPi6K/bfD27+9Od53q4XQBAjmsGUC4CM6sMp
         7jhB0Mb+DSanUSwJi7zSR+d0UoiIfPHAiiezA3vd5IOtKR2R9S2I2i3Zr6mR6S3EnlBM
         DGarHEjoOO4xVn6auKCQ20hX8fq4NYJ2AIAeokg5bOsb2ZIM4GELE7I8NN93wiHiL7m/
         emIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TQfQkh6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si4283468qke.638.2022.01.26.01.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jan 2022 01:16:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TQfQkh6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCePO-0000AB-Nc
	for alex.bennee@linaro.org; Wed, 26 Jan 2022 04:16:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nCeOI-00008d-9k
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 04:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nCeOE-0007PN-Dc
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 04:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643188492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsJZ0k6nGl/3sdNEEomOxBCWt40O4S2du5yVW+QiMdY=;
 b=TQfQkh6WoZBExWhtxlvaVURWgN1BLjWN8XFjAKfWn6rpdsVYjtNNKJcAyc9n05xtBEKWT1
 B5pX/RID+SIHv8S96RsE77mtr7qa8x8vNfM0/nm9Y4xr8Wh95yjrNd1DRYG4yDPDHLLOdO
 38KvBj2xwt9YnLX7wvMf11nNqX5A1z0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-iTI7woQYP-KweElY8tq5uw-1; Wed, 26 Jan 2022 04:14:50 -0500
X-MC-Unique: iTI7woQYP-KweElY8tq5uw-1
Received: by mail-ej1-f71.google.com with SMTP id
 q3-20020a17090676c300b006a9453c33b0so4574354ejn.13
 for <qemu-arm@nongnu.org>; Wed, 26 Jan 2022 01:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WDnYmUedBNaiZufTSHV898HkfqaFMA1dPWUKAogQwm4=;
 b=us4R1vBAxtkdHcHDvrBtWPSZQdEswU8+Mbj7NLIkw+qzkW7TZskCRQAYsL1/01J/aL
 QHwkXl0pJS4MFjlfsAkGFVJ9Ra0QCQW6ZDyzrKL3f1pqwZYJoSzBrRmwEiW8ISNpXeC6
 JqXf5xaLdN7PQp8Mwsk3D8v3Bx5pqH4mrQ2rlrEu1OxT8kJ/rzjHC/V9+4yPrkuE/pf1
 nEm9B+nGMsMC9kJykafQk8UOU7zr2OBOu9e0RuedUcIq9W8+GuyWBkDFTjpmzIUb/REh
 lDxqff2M8/9FWqw2Fr7VLDDTHX4jlZPqJXUGdCAiUo9Jy0o6h5bVJ2lOqO83B/wKm+x2
 bG0w==
X-Gm-Message-State: AOAM531/qI7F6dy8iU+tGw0EfVWt5AddEpzge64vpCGAKGmZjZClPng1
 4W7nNPMIka/C9jCEnTBx9dvb8l1zctHkPxnZUl+Qj/9rvaP7n/dn+mFKlj445O8PPPtOSehSwrS
 BTpYUW5tkMzQw
X-Received: by 2002:a17:906:c14e:: with SMTP id
 dp14mr12773287ejc.184.1643188489234; 
 Wed, 26 Jan 2022 01:14:49 -0800 (PST)
X-Received: by 2002:a17:906:c14e:: with SMTP id
 dp14mr12773270ejc.184.1643188488949; 
 Wed, 26 Jan 2022 01:14:48 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q23sm4760685ejz.30.2022.01.26.01.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 01:14:48 -0800 (PST)
Date: Wed, 26 Jan 2022 10:14:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220126101447.5d4f01f9@redhat.com>
In-Reply-To: <20220126052410.36380-1-gshan@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Pfmmv+FKZZP

On Wed, 26 Jan 2022 13:24:10 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_=
id()
> when it isn't provided explicitly. However, the CPU topology isn't fully
> considered in the default association and it causes CPU topology broken
> warnings on booting Linux guest.
>=20
> For example, the following warning messages are observed when the Linux g=
uest
> is booted with the following command lines.
>=20
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=3Dhost               \
>   -cpu host                                               \
>   -smp 6,sockets=3D2,cores=3D3,threads=3D1                      \
>   -m 1024M,slots=3D16,maxmem=3D64G                            \
>   -object memory-backend-ram,id=3Dmem0,size=3D128M            \
>   -object memory-backend-ram,id=3Dmem1,size=3D128M            \
>   -object memory-backend-ram,id=3Dmem2,size=3D128M            \
>   -object memory-backend-ram,id=3Dmem3,size=3D128M            \
>   -object memory-backend-ram,id=3Dmem4,size=3D128M            \
>   -object memory-backend-ram,id=3Dmem4,size=3D384M            \
>   -numa node,nodeid=3D0,memdev=3Dmem0                         \
>   -numa node,nodeid=3D1,memdev=3Dmem1                         \
>   -numa node,nodeid=3D2,memdev=3Dmem2                         \
>   -numa node,nodeid=3D3,memdev=3Dmem3                         \
>   -numa node,nodeid=3D4,memdev=3Dmem4                         \
>   -numa node,nodeid=3D5,memdev=3Dmem5
>          :
>   alternatives: patching kernel code
>   BUG: arch topology borken
>   the CLS domain not a subset of the MC domain
>   <the above error log repeats>
>   BUG: arch topology borken
>   the DIE domain not a subset of the NODE domain
>=20
> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CP=
U#5
> are associated with NODE#0 to NODE#5 separately. That's incorrect because
> CPU#0/1/2 should be associated with same NUMA node because they're seated
> in same socket.
>=20
> This fixes the issue by considering the socket when default CPU-to-NUMA
> is given. With this applied, no more CPU topology broken warnings are see=
n
> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there =
are
> no CPUs associated with NODE#2/3/4/5.

From migration point of view it looks fine to me, and doesn't need a compat=
 knob
since NUMA data (on virt-arm) only used to construct ACPI tables (and we do=
n't
version those unless something is broken by it).


> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 141350bf21..b4a95522d3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned =
cpu_index)
> =20
>  static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int =
idx)
>  {
> -    return idx % ms->numa_state->num_nodes;
> +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->=
smp.threads);

I'd like for ARM folks to confirm whether above is correct
(i.e. socket is NUMA node boundary and also if above topo vars
could have odd values. Don't look at horribly complicated x86
as example, but it showed that vendors could stash pretty much
anything there, so we should consider it here as well and maybe
forbid that in smp virt-arm parser)

>  }
> =20
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)

