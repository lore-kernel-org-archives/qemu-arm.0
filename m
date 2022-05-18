Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp514594lfh;
        Wed, 18 May 2022 08:42:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZk5nLls/3PGKZ/QS5+9Mu143CSy5CTdLuB6q8b6p4012czu45OO3fc0SfUth+yrDdbz04
X-Received: by 2002:a05:6214:21e4:b0:461:dab1:d9c0 with SMTP id p4-20020a05621421e400b00461dab1d9c0mr100089qvj.93.1652888552944;
        Wed, 18 May 2022 08:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652888552; cv=none;
        d=google.com; s=arc-20160816;
        b=h9GlW9QA2cdZfoyDZCpV/BpvBIYS8m0g5xzaT4kY82mcT7v7f28DdhjBBfLZElrfXN
         sErGS43w1Zaoe3zpHK/67sFVXIla8RoOWOtsoy/0xKOYF+9OKL7uE2GRugAREQQEn4CT
         vLojOPCe1DqGL1Ivi/P3eYbWOGP7iVnoKPphKges+robPVXhcIPY4waiidHfciwAdln3
         gYE758EivdF9wHDoPXHuA/QVDftVFfJ63Mh4QRJkwhizinHLidl2qkkP4I5uRilq1XJU
         kseytIDDqbBuKSdOy2x3HwyZCDQYLC5c5s96K91dhNfqlNdqeSXX3v9pnEr5JxjZ5PLV
         cFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=aL+pDwLuXBhmobSCYyX9Wi8PrWeU334jP1yReq6Rd6E=;
        b=FABvw0le6Ga2osxdWRXcmzAGIASUnmhBoQUXt5bL1V7M+H0IjViB6xPcwAzOGf0r68
         c1keqAV/JXXAX8Gg0jM6UlQELefThHK46iLJlisb70JwxJtc6lWjUDk8S+0hlj5a9leL
         Ig8pIYm045Cgld+1L0Uy66NHodenlyMmpn7tMKs/wzqvp7UafTz7EyhzyuU+jotH9ypr
         64Y75QT/Qx8n0xpMnlzDUzD5v26jCFsxIfWyEtvCFbC+RZsi04k4nGI7afxuKkK3WGGR
         X0NM8zM9npECrXF7hrGbb8SqNn7Tx70krrSRfd+Qah+mXz+CVwm5gWZCauGBZT+yL2ch
         q5Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cnaeHoth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t62-20020a374641000000b006a050e79509si1370663qka.458.2022.05.18.08.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 May 2022 08:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cnaeHoth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrLom-0004Hv-Dx
	for alex.bennee@linaro.org; Wed, 18 May 2022 11:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nrLoc-0004GY-Sk
 for qemu-arm@nongnu.org; Wed, 18 May 2022 11:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nrLob-0007K2-9E
 for qemu-arm@nongnu.org; Wed, 18 May 2022 11:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652888539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aL+pDwLuXBhmobSCYyX9Wi8PrWeU334jP1yReq6Rd6E=;
 b=cnaeHothaxRBNW5anuuvt56gBigIC+mJVztwdD1Zz5a5EBwMF75vpK/KUi74JaiQ4Lo2yP
 lgiKl+wFC8QKSoUdbt3LODus6n6W67c7PZ4Wve2KuY05ceOj1FRBLO8cVRvrJc2VxRyPWj
 q23JgiIMi6KzxMDY3xjG4meI58jQ4jk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-TpCRDFymPD2DDewY_2z09Q-1; Wed, 18 May 2022 11:42:16 -0400
X-MC-Unique: TpCRDFymPD2DDewY_2z09Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi5-20020a05600c3d8500b0039489e1d18dso3061888wmb.5
 for <qemu-arm@nongnu.org>; Wed, 18 May 2022 08:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aL+pDwLuXBhmobSCYyX9Wi8PrWeU334jP1yReq6Rd6E=;
 b=i7pIVB5XF7ilgWfmcATlgM+aqOSx77N4CPJHTnXlTZfusH3Q0UU0ZN3JHrvmySrQii
 mcwJdCQeD06OCOBkUv1F12QhGCnTdgN3qy+ACgs4ceGXUy9s5elSqF5Rtsx77blm25FL
 N+3F2lzAI4Ow0vznb1qV0cy58NdhE3j4mW2UxKERj/7AiLnkwG6BX+SUSiWMXzekF9Pv
 2Xw4ByldtmOZ6zRrfy+cZXwcPrulbnvhWkiYbC73xggcWMiUSzRXTQr1k3Ett+ayJBn3
 IOum+Uspb0refIggh8xa315/Dhk3A6yIB1ScaauY6ibvrK4ILCKQRjmPAvMsErgXlkNP
 Vt7g==
X-Gm-Message-State: AOAM531DAnj9QzRtHbCsFNTbZrmAK2fSEpHZj8G1gccNfugcZ2r2N+8u
 cNBa973CZtww3mOGl0iNbPd9XGUsNB+L3eR2vAUIJ3Hy8MbVkUurmF8En8mnHdF4HZ+B1yus5Uw
 i/hgcMC2lsQ4K
X-Received: by 2002:adf:efcd:0:b0:20d:4b7:ef9c with SMTP id
 i13-20020adfefcd000000b0020d04b7ef9cmr276885wrp.228.1652888535540; 
 Wed, 18 May 2022 08:42:15 -0700 (PDT)
X-Received: by 2002:adf:efcd:0:b0:20d:4b7:ef9c with SMTP id
 i13-20020adfefcd000000b0020d04b7ef9cmr276853wrp.228.1652888535263; 
 Wed, 18 May 2022 08:42:15 -0700 (PDT)
Received: from gator (cst2-173-79.cust.vodafone.cz. [31.30.173.79])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c089200b00397193aafc7sm1875666wmp.47.2022.05.18.08.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 08:42:14 -0700 (PDT)
Date: Wed, 18 May 2022 17:42:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, wangyanan55@huawei.com,
 Jonathan.Cameron@huawei.com, peter.maydell@linaro.org,
 berrange@redhat.com, thuth@redhat.com, eduardo@habkost.net,
 lvivier@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs
 in PPTT
Message-ID: <20220518154212.i6usstptkvi2zssk@gator>
References: <20220518092141.1050852-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220518092141.1050852-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 02BraimbskEN

On Wed, May 18, 2022 at 05:21:38PM +0800, Gavin Shan wrote:
> The {socket, cluster, core} IDs detected from Linux guest aren't
> matching with what have been provided in PPTT. The flag used for
> 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> nodes. In this case, Linux guest takes the offset between the
> node and PPTT header as the corresponding IDs, as the following
> logs show.
> 
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
>   -accel kvm -machine virt,gic-version=host -cpu host       \
>   -smp 8,sockets=2,clusters=2,cores=2,threads=1
>     :
>     
>   # cd /sys/devices/system/cpu
>   # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>     36  36  36  36  36  36  36  36
>     336 336 336 336 336 336 336 336
>   # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>     56  56  56  56  196 196 196 196
>     356 356 356 356 496 496 496 496
>   # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>     76  76  136 136 216 216 276 276
>     376 376 436 436 516 516 576 576
> 
> This fixes the issue by setting 'ACPI Processor ID valid' flag for
> {socket, cluster, core} nodes. With this applied, the IDs are exactly
> what have been provided in PPTT. I also checked the PPTT table on my
> host, where the 'ACPI Processor ID valid' is set for cluster/core nodes,
> but missed from socket nodes.
> 
>   host# pwd
>   /sys/devices/system/cpu
>   host# cat cpu0/topology/physical_package_id; \
>         cat cpu0/topology/cluster_id;          \
>         cat cpu0/topology/core_id
>   36 0 0
> 
> Gavin Shan (3):
>   tests/acpi/virt: Allow PPTT ACPI table changes
>   hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
>   tests/acpi/virt: Update PPTT ACPI table
> 
>  hw/acpi/aml-build.c       |   9 ++++++---
>  tests/data/acpi/virt/PPTT | Bin 96 -> 96 bytes
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> -- 
> 2.23.0
>

For the series

Reviewed-by: Andrew Jones <drjones@redhat.com>

