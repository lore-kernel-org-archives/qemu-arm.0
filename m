Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2825329lfg;
        Tue, 24 Aug 2021 06:55:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2V0+GyiWPVkcLdokDrju09nYhT543s5BZ5U0xS1j4gYTLyVhfhBMviSluSji5p8ezBjbQ
X-Received: by 2002:a67:2684:: with SMTP id m126mr23409898vsm.30.1629813314871;
        Tue, 24 Aug 2021 06:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629813314; cv=none;
        d=google.com; s=arc-20160816;
        b=kS8ch3V3e+IWALlEhbAUTktuvgAnG6aQs4+f+ELH600+6U5NpWRYWU6G1obiInQ1Kl
         fFBJAdFWvEYmoQmvOhtwyAqvgbOTEy7moq/CPKznuGo56vWbjoQd+qMBGEF1RLcQAT+J
         aQp8f/7KPS35GK2druixsIQ1tfBovy7EKI7PqKkXLE090yjUbbYDxsqb0AGXc1tjmVBG
         jFemaHr+HrjO8AWlabBH8r3Ec3AMV217uzQfKSyIfsefVOgtWTo1WxXcdh9NLcHijIJK
         Rp8pNs/tPC5OBNcgmR9j/zNDJobiGttBVDXGWzceN1Dmr3wdRlVn4/fmnoppIb8fGWxd
         6BnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OfKhkeL/wWyD3xCekfPGHfoYbTaumpDj5yGtt9EHmWo=;
        b=yPZGlNoT1r1RrGLt2Ph7RXNm/QpgY0jmktEvVQEWoJeOr/epFBPXYxQItORVVDjc4x
         Is1QLNhsg0iCCNCYl/xI4zwSiZMn/W6peZLcYxQyI/uuiWbU/xjzx4MylizQ2cHXu+9S
         67zBzYuMAPyqAe3RihaRsl5DinRIgjwrsLFWnIH/QhdZgZkYMe3+05sTvXlyirBLzDBs
         My+p6OxkxX2LU40GkAZfyjN6V/hA9sN+BoLavIdqI/qy5ghEtR6VpfiQcmjjhYl1oWaE
         QcqRuSqXxFwctOBNtMcr2XYgyIG9TOHZfIwmIHj26jt0Eif78HNOVh0CjKme9Z3Ata0I
         tUCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jHeHHTcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si6103452vsf.245.2021.08.24.06.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 06:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jHeHHTcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIWtW-00025I-6y
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 09:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIWtN-000255-Sz
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIWtM-00029S-Fh
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 09:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfKhkeL/wWyD3xCekfPGHfoYbTaumpDj5yGtt9EHmWo=;
 b=jHeHHTcYNII3KNHmsWfhRt6urZ3h1tyh/hizUYLQnep4Jtu4vqYf45y8SghUSjbG0pIqlp
 lY0nAmUyXWj+AvarUdfYKQeLtneEtv9qcz30IoYQEGPPlnMFeQZ3uFUMMwDFogI7WAmQS8
 meoIs4/xXFh2v0vv0wJPxLIzj04za/Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-cx5ap5y6N_eUkVzq6aVBsw-1; Tue, 24 Aug 2021 09:54:19 -0400
X-MC-Unique: cx5ap5y6N_eUkVzq6aVBsw-1
Received: by mail-ej1-f69.google.com with SMTP id
 bi9-20020a170906a24900b005c74b30ff24so363589ejb.5
 for <qemu-arm@nongnu.org>; Tue, 24 Aug 2021 06:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OfKhkeL/wWyD3xCekfPGHfoYbTaumpDj5yGtt9EHmWo=;
 b=XB+w2HaOe0d84YVljKgsIkmPMSxPunPLGHleLkv4nL3NevdoxyyJWG45f+kYFl16hM
 woH9TbamCwbKRgRJphYhs15czQFqVnrXbc9OxDVY2drsZeIZg9WQ9V5X85g9BvkkUTUj
 9w23j+U6VfvnlXwVBW1H+rio1UgYxIJ1eFhzUwNyqE8rCG77hITlrdLgHgq4NdhXjnAF
 HjPHzWyKgc4Ghdis36Hdq1JhWueEC4QabFjB4FJjx5NTui19SzGtT93Gpdw8WfUUppYn
 BGZyo9XaXo6e/hPPwiairriNNqjaW7fHnpHHd6T/UbUguACpLBWVYE9XipmH7U9RYT1I
 cNmA==
X-Gm-Message-State: AOAM533qZDfon08n1P7IJLx4HXl+f1m27FaYoNy4ewXjGKtY2zIoJFhD
 YLqkXRXlmqo3hOJ+qGDNd4D4DAEbXXcAkg8cA8vpFjXN2bRVIA7BV5lkdZSudNgmIq3M0/sLtRJ
 K14zKQuLdKckk
X-Received: by 2002:a17:907:1108:: with SMTP id
 qu8mr21323783ejb.58.1629813258208; 
 Tue, 24 Aug 2021 06:54:18 -0700 (PDT)
X-Received: by 2002:a17:907:1108:: with SMTP id
 qu8mr21323766ejb.58.1629813257963; 
 Tue, 24 Aug 2021 06:54:17 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id se22sm3393904ejb.32.2021.08.24.06.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 06:54:17 -0700 (PDT)
Date: Tue, 24 Aug 2021 15:54:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 1/5] hw/arm/virt: Only describe cpu topology since
 virt-6.2
Message-ID: <20210824135415.3kqhsl5nigsmkivx@gator.home>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <20210824122016.144364-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210824122016.144364-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Salil Mehta <salil.mehta@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7OX7o8Sg6fiD

On Tue, Aug 24, 2021 at 08:20:12PM +0800, Yanan Wang wrote:
> On existing older machine types, without cpu topology described
> in ACPI or DT, the guest will populate one by default. With the
> topology described, it will read the information and set up its
> topology as instructed, but that may not be the same as what was
> getting used by default. It's possible that an user application
> has a dependency on the default topology and if the default one
> gets changed it will probably behave differently.
> 
> Based on above consideration we'd better only describe topology
> information to the guest on 6.2 and later machine types.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c         | 3 +++
>  include/hw/arm/virt.h | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ae029680da..82f2eba6bd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2795,9 +2795,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
>  
>  static void virt_machine_6_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_6_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      mc->smp_props.prefer_sockets = true;
> +    vmc->no_cpu_topology = true;
>  }
>  DEFINE_VIRT_MACHINE(6, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9661c46699..6ab21ea90e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -124,11 +124,13 @@ struct VirtMachineClass {
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
>      bool no_highmem_ecam;
> -    bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
> +    bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
>      bool kvm_no_adjvtime;
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
>      bool no_secure_gpio;
> +    /* Machines < 6.2 have no support for describing cpu topology to guest */
> +    bool no_cpu_topology;
>  };
>  
>  struct VirtMachineState {
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

