Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp196455lfk;
        Thu, 21 Apr 2022 02:04:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQOg1aQUQkyDUPKVG+JG0b9RrYUBh7PrSlsM7vIMr5p+BFU7Is2HEOt8pzg/IruI46qaVu
X-Received: by 2002:a05:622a:1ba2:b0:2f2:e43b:a566 with SMTP id bp34-20020a05622a1ba200b002f2e43ba566mr9252493qtb.671.1650531853888;
        Thu, 21 Apr 2022 02:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650531853; cv=none;
        d=google.com; s=arc-20160816;
        b=MY73PkYB2J6+yFTgt2xCohC0XHuszx9qaJCEqCaDKDMFoEkXczrAUzZ8OOr6t2unBJ
         T8d2tCVpbsr484p9wvI+yC+pLAs8MBOpHxFZ9vcZcTw+bwDoZanSBsXC7lkPiig8126U
         wwPzVLEfYJ4+QRBrwxjY6RDiyFAvExF9eAvkem8C9oVz/Cj+XK1oCszO/4fQNP/Ea6hk
         rxFUZ7mmhcfYpSvgQpaEXzsTKyuXmUaDTGSCO9+qVpg6t8PaMEcF7lpTD5yYsuTw7hC3
         5A5OMPojJIL3lGycjkrHNWUThhkmB6zPrvR5/mQxuP1l4esPPNkk9v5egNwfCN+xIt2z
         sRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=0Yqmx+bpUE2MADKJnlTIjk/ZfQ94wM4wYlGjUx2KmP0=;
        b=IXjj4GsEV+oAN6fTxRRnVaZwFfp9UFvo+yZ8DUsNUfz98Lt8mrGZqRyGDzZ/8ANY8U
         CCwbhaLvGVxr54/tRYk6PUkdDtUncWQp6yeWsIEvXZ7ENG+pc6K+9QRv+5bg4QjH8vlm
         2O9hCZqbyRKQGIyDW3cTGbsSiU7ffY+SdIfSUKcCMtTB29jsGcyDNLaJWsDJnh5hjdUh
         YSpZFE1bi5ZoEaMk6FPs189ungXHqaXUUzufmIsDSbGZOnRv+CMy5X/9E2dpva6P9WtX
         N1kuxfv2zUUWX+c7gD6HbunZjN98UEZbT6TZhKF6Az5Maze1Hzczp/HsBOtW8zVYaHZO
         tM4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ac/i3V5U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy9-20020a0562140f6900b004462ea24ee6si1228077qvb.13.2022.04.21.02.04.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 02:04:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ac/i3V5U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhSjV-00087m-0z
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 05:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nhShv-0007mN-14
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 05:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nhShr-0005Ja-R2
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 05:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650531750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Yqmx+bpUE2MADKJnlTIjk/ZfQ94wM4wYlGjUx2KmP0=;
 b=Ac/i3V5Ur7lT+qcEXZb/4tEFfg7YDdpR7NJuwEex0Gmqozl2SBa4DHN3VDH4fS8sAcJFPz
 2o8nP20i7gXlZeZH/U2BFndP0PAQRsKb4+smuFtH+C55wDSGC6iI+0RqCKLy/+rfGp7yIy
 IET6XE35o3rnIYiB8Re893y1OnRa7Ec=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-iG5in1_1MPS8pX5VJnLowQ-1; Thu, 21 Apr 2022 05:02:29 -0400
X-MC-Unique: iG5in1_1MPS8pX5VJnLowQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf10-20020a1709077f0a00b006efb6ecc57aso2166484ejc.17
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Yqmx+bpUE2MADKJnlTIjk/ZfQ94wM4wYlGjUx2KmP0=;
 b=optdJ2YdVJMqNQKM10S9JQvGuSbYBTSKD9Ogx4NYpDx9ijiKhJel3eowVSGdB16HAv
 IXP/vZf/whliKMKfly5gl2XU3v4k85qQP34DkQotVjJWX0F/QYBIAOnXteqsy12lpTH7
 AdIJxdcdlCerbRVCJDC9wbWEBM4YnKj2b9R7meBfX52CqloOzaoFAeIXLsUv4GNImSqe
 g7o3yV7BtHzm49O6MK2r+uHNJedjAbgPhi3p8u48Wqms39cL143NnVCWGenGT8Z3yT+R
 scqeAe784Sb7kTysK9F7Qeoz6SFr5n+AmpftJxUuD8r4vJ6Txqx4XXSeOSD5wB7D60gW
 vJjQ==
X-Gm-Message-State: AOAM533Xr2MaHUVs6mYB+0sCuEsbXl4FDWlLgY7R5RnHNXcW5IQteRHg
 BJBiokqIBgGGjLGXQyH9ZMtl7QvdtdmkDaiVgI2aOpwWbnRQhKhssDYeBGCOp78aslloPQ37Ac0
 FO2xy/qeUuP2z
X-Received: by 2002:a05:6402:42c9:b0:423:e275:28d9 with SMTP id
 i9-20020a05640242c900b00423e27528d9mr22572192edc.176.1650531748588; 
 Thu, 21 Apr 2022 02:02:28 -0700 (PDT)
X-Received: by 2002:a05:6402:42c9:b0:423:e275:28d9 with SMTP id
 i9-20020a05640242c900b00423e27528d9mr22572169edc.176.1650531748407; 
 Thu, 21 Apr 2022 02:02:28 -0700 (PDT)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm11201938edt.80.2022.04.21.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:02:26 -0700 (PDT)
Date: Thu, 21 Apr 2022 11:02:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220421090224.l6i3qcu53seiz5yf@gator>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
 <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
 <20220420135032.43711096@redhat.com>
 <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, thuth@redhat.com,
 shan.gavin@gmail.com, pbonzini@redhat.com, mst@redhat.com, lvivier@redhat.com,
 armbru@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, wangyanan55@huawei.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, Jonathan.Cameron@huawei.com, ani@anisinha.ca,
 Igor Mammedov <imammedo@redhat.com>, eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g1ijeybLOuB+

On Wed, Apr 20, 2022 at 10:24:46PM +0800, Gavin Shan wrote:
...
> With amend to the command lines, the following one is used and below error
> is raised from the test. The error is mentioned in the commit log in
> PATCH[v7 2/4].
> 
>     -machine smp.cpus=2                                   \
>     -numa node,nodeid=0,memdev=ram -numa node,nodeid=1    \
>     -numa cpu,node-id=1,thread-id=0                       \
>     -numa cpu,node-id=0,thread-id=1
> 
>     qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found
>     (reported from hw/core/machine.c::machine_set_cpu_numa_node())
> 
> After the changes to virt_possible_cpu_arch_ids() is applied, "thread-id=1"
> isn't valid any more. The CPU topology becomes like below. Note that
> mc->smp_props.prefer_sockets is true on arm/virt machine.

prefer_sockets is only true for mach-virt 6.1 and older. It's false for
6.2 and later.

Thanks,
drew

> 
>     index    socket   cluster    core    thread
>     --------------------------------------------
>       0        0        0         0        0
>       1        1        0         0        0
> 
> With the amended command lines, the topology changes again so
> that "thread-id=1" is valid:
> 
>     index    socket   cluster    core    thread
>     --------------------------------------------
>       0        0        0         0        0
>       1        0        0         0        1
> 
> It should be ok to split the test/qtest/aarch64_numa_cpu() changes into
> a separate patch and put it before this one. In that case, the specified
> smp.{socket, cluster, core, threads} isn't used by arm/virt machine yet,
> and 'thread-id=2' should be still valid. Lets do this if I need post v8.
> Otherwise, I guess it's also fine to squash the test/qtest/aarch64_numa_cpu()
> changes into PATCH[2/4], as we're doing.
> 
> > 
> > > 
> > > 
> > > > >            "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> > > > >            "-numa cpu,node-id=1,thread-id=0 "
> > > > >            "-numa cpu,node-id=0,thread-id=1");
> 
> Thanks,
> Gavin
> 

