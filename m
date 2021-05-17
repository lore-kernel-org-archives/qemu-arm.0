Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp987967lfm;
        Sun, 16 May 2021 23:44:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjwrkcXcxePhn9jhzLRS439DsXOkNWBJj7Vm/R5q4aHK6JLa4MvWqteg+fEXeR5JYypbeH
X-Received: by 2002:a17:906:1815:: with SMTP id v21mr17648316eje.376.1621233868426;
        Sun, 16 May 2021 23:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621233868; cv=none;
        d=google.com; s=arc-20160816;
        b=wc9wx3IwAasJSNkIteCSNozEDBUPpqK8EzIzqBljQhbiOBofoL4i/WaEfvwdf0oSjo
         VMR5QenQ5q4ON7ET8U8UdkwpB6SnGmfK01pntKOkgRTgok5omkbaP2eP3Mo9cMfs8NrI
         uVBGsfVihrR1y0ydFf4LeGBCTy2cmYGT8xtnDuM0XqG8hLyjZdNAcvTDEb/kFAx2Hrzn
         nnhxXt1XQzsHoIqS+cICZlT0UItI8G0o+L4SoY0HT56rHtLzyt7VkSb3UX42YQba+8n0
         1BkkrvnL+Sl1Xv66LKuxFvVE++19S4y36nAd38ElQkw8ptzjshZfpBO74J7nuoPiGVYB
         l/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=jnz7vgZp8IFR0leJpkXvhmBpMNZia4tjRUIGnAecZgc=;
        b=priZd4zIr1x3KsFs54ruoc6veVZ0Jc9D7m9J7VVuifm5Wmqy39QJuVLxCTcEKAqPfN
         MYefHc9tKtSKFzDg1Y2oayNPVch3te8qbEwFkQy62Mlqjw64EXNX7oDJZXOdYP53jBpt
         qI7fxEd6V4DsdIVwY0AU0IhWEls9929DpBpOWit8/9zqKr59xI6+5eBUzex5LEfGT/Hi
         MQRRy0858ZjoNLJ2P+OGRPkRJcMiLH35DKFE/GTyQxNfxRv9lEVl3t2rAbt2FlbZKTMn
         CXPjLQ0YMCXlPUxW1ifV94MI/14C2IdQsDoVtMFU9h2hz+X0Wc0aoyh+Izn3LVuPSj6N
         KKlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RRLTEoiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dn6si7087346edb.275.2021.05.16.23.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 23:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RRLTEoiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liWzL-0001xI-7R
	for alex.bennee@linaro.org; Mon, 17 May 2021 02:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWyx-0001x7-Ge
 for qemu-arm@nongnu.org; Mon, 17 May 2021 02:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWyt-0001Hn-HQ
 for qemu-arm@nongnu.org; Mon, 17 May 2021 02:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621233837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnz7vgZp8IFR0leJpkXvhmBpMNZia4tjRUIGnAecZgc=;
 b=RRLTEoiuPuNZ/MIgjOymdgZ5Wn7cKEk1gHFhnHhaFk2RVyQ2pMegRWTEV36bmnqU0YhdmE
 DR0MhhUvr9NbYJoVlAw2F5J03MDmJ0yw3w8nUp+JucFVkGZZ4zYZ9zrTgAhs9SwQ49mT7o
 xz7pobzGMZ0bwCGEGkyrWuXRzwdZ5TA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-3L_PTRLhP12F_Dzmxv2k0g-1; Mon, 17 May 2021 02:43:56 -0400
X-MC-Unique: 3L_PTRLhP12F_Dzmxv2k0g-1
Received: by mail-ed1-f70.google.com with SMTP id
 r19-20020a05640251d3b02903888eb31cafso3352943edd.13
 for <qemu-arm@nongnu.org>; Sun, 16 May 2021 23:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jnz7vgZp8IFR0leJpkXvhmBpMNZia4tjRUIGnAecZgc=;
 b=WFcUaDpC1Bm//KrH+K0OJspCKRoRYc5l2NZyLCzBOLXiaZv4TUxf4tI8QKCGKequiv
 OxSL0FUBISFODD/TEQIOXbS/o5FoTzfPTvjHOtk5bIGRt56+5NZu9C2UPWTeuMgOj81y
 TGYttyNqSSeew91VMKoLTSxGMEhfKYoxu4NsdHrVRl1X2FUDxDTSMGG/6XywW5j7l6o4
 1jykyMowl9S4Ue28AFTXhZJL2QY6qXAJEkIfFVIbv4h5ryhIj3kZOmHhSDbtRgoErKlZ
 p3iD5X0xhsxwgOJAbw/v7dTyy6EYavXPBvkXoRBcNV6zhGl3++kh4p3Rq0ywrtctzKTQ
 C2mQ==
X-Gm-Message-State: AOAM533zI7j4refgV9xcb0a82QFTmNXqMeg8F5Xmv1jrgYuG8fMhwXgu
 6fnNcJjd0KqC3zq6bIwtrPSyDUzJKPxse7ROMNTUm7uKrlMJYNWnFwoLGxg9WMsZG8JkCsxKC9E
 dmLNsui1RUtDn
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr24538688edu.273.1621233835010; 
 Sun, 16 May 2021 23:43:55 -0700 (PDT)
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr24538658edu.273.1621233834849; 
 Sun, 16 May 2021 23:43:54 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id gx23sm72736ejb.125.2021.05.16.23.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:43:54 -0700 (PDT)
Date: Mon, 17 May 2021 08:43:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
Message-ID: <20210517064352.fhif7lomuli3mrzp@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BVPpKlHwiuhc

On Sun, May 16, 2021 at 06:28:55PM +0800, Yanan Wang wrote:
> We create and initialize a cpuobj for each present cpu in
> machvirt_init(). Now we also initialize the cpu member of
> structure CPUArchId for each present cpu in the function.
> 
> This will be used to determine whether a cpu is present
> when generating ACPI tables in later patches.
> 
> Co-developed-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e5dcdebdbc..50e324975f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2061,6 +2061,13 @@ static void machvirt_init(MachineState *machine)
>          }
>  
>          qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +
> +        /*
> +         * As ARM cpu hotplug is not supported yet, we initialize
> +         * the present cpu members here.
> +         */
> +        machine->possible_cpus->cpus[n].cpu = cpuobj;
> +
>          object_unref(cpuobj);
>      }
>      fdt_add_timer_nodes(vms);
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

