Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2442175ejy;
        Wed, 21 Sep 2022 06:27:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KGpOkDjNnrx+7FxnazZGEQmsVJ9e5oInuIjeZBFcM8v/EmOGsA9yvpExgdxGCFeK+d6yW
X-Received: by 2002:a05:620a:4311:b0:6bc:56c0:4666 with SMTP id u17-20020a05620a431100b006bc56c04666mr19759934qko.502.1663766866127;
        Wed, 21 Sep 2022 06:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663766866; cv=none;
        d=google.com; s=arc-20160816;
        b=z6ZU+25lZiFGq9rPL5NWF4WnaPodJTndf5s6YXIjZABhW8XwxOaZeWYuinEeahcrY8
         8ffQRVqY6B7JVL8OXe59A2hZewBKybiZQjQqZ03xtPv1ni9AnnTTuuf43gSNhdvXYtZ1
         vhKo68bxjWQ3NCsDOBhZSwVyLDuv9eOOApwJF6QKzn/ynZZYOxq1Vqd3t8tFeLZypxRV
         veHzO0WXFcMgovtxJOy2wpuRwcfKaoi9uDx/V+Cr4OjaipeSkMTeI8pw7vNBWXl0ZxWI
         HGAAZK7pACCXzcgNMqwrgnMnVZi7SX1s4xHHdTjvLjTR63DAmXtqa9CNx3uo+9+EmRAX
         ZEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=3/foKuq3LrMFu91ZFKCszSU+NXTM6Rf9iWUcrpxd2pU=;
        b=o1w39SI4VjXeRXVbRCa1ccD7kbyiQwzpjs3wSNirbU/A9TbtH0/Vy8iwwr9MEZsyYQ
         Y8Od3+mTtR20p720BbONf5DXLzl1SQ3b5D1NqFWlgqJ590g2zKooI0oUWkZWtThq94xf
         mbHbGCEvGCENbX8uFsgQbcwUERjYM9hyYL5rJT67nICVqBqvtT6PQILsX+qFThn1kugm
         G36SHZ41S31PpRr8bQAXYntvFB/AU4f+aRmdPrsPDPBQ2KNFTvnMtD+Rsa/COEk7aoi3
         JlXI8P4AseURXxbf3BIAf8BzA/z2gOoYlKtxzUiINc34ZQtGzcj8zedbqLl0P36FuTLQ
         Re5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I35iqmAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ac80114000000b0034355e08d3esi1185669qtg.762.2022.09.21.06.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 06:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I35iqmAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oazlR-0001mQ-JD
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 09:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oazgL-0005MP-K4
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 09:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oazgI-0003zg-Ia
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 09:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663766543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/foKuq3LrMFu91ZFKCszSU+NXTM6Rf9iWUcrpxd2pU=;
 b=I35iqmAYpMRpQRoz2k7qcZLo1utBcSunuV51XJZqjEoz+woFbOKOVVOmMswnBh9nhdmHZp
 XtwXxI+Qp1wtRjWh+YFXzItBFiLGQdy1yPmV8Be9Whk0xl2H/n9nOxSmpZVeHn0/7qot2n
 sZHE8F738b/ihplvfPYy8OCJa58njUo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-mWR-Y8cIM8OfMKT9jXX9UA-1; Wed, 21 Sep 2022 09:22:23 -0400
X-MC-Unique: mWR-Y8cIM8OfMKT9jXX9UA-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne4-20020a1709077b8400b0078114a1a6d8so3106917ejc.9
 for <qemu-arm@nongnu.org>; Wed, 21 Sep 2022 06:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3/foKuq3LrMFu91ZFKCszSU+NXTM6Rf9iWUcrpxd2pU=;
 b=OLQfr8O2903lV3LLCC6g9iQZQLE/lItG7SxgYRxaBvW6FBHXmett8xo7FOpLBd60JH
 164Qc8VhAsANRQE3LUFSuI1NiVTO+FoYv0600KN3VF+fPlhnkCvLt0nhhf+L8YkMUgAU
 /80Oaw0aBTRAjTexvSd9jEdJ07czvTFJFP+H1rCwc/PL2r5nVUCh8He6ryq1I5TEUWjh
 1Pj5V/xX93YTUI/JLWKJg0NUr4g8zDFyK4GVcvDW5cQ36q+2Ey2G2Rj3Lsv3mNij7A4A
 DfT+C2JlnCVmjxEKY95HYPnG46Xm04NbhJspG3VCVpHH4ht3hAimct8R2VykhMiTXeFX
 Y16g==
X-Gm-Message-State: ACrzQf3mxNHgIs6aTrQircs+MgcNLn5MNxPRiBp3QC+mACoDP/dwq2Gj
 OCL8ixehCj/plT6BQnq585Y5J/voYR96610e78P1mWnCeKix4B2uRXy8APsJO3QvbIM0kcsNnxH
 RTW1W9aR/DT6r
X-Received: by 2002:a05:6402:1d4f:b0:450:fd05:628c with SMTP id
 dz15-20020a0564021d4f00b00450fd05628cmr25168247edb.419.1663766540652; 
 Wed, 21 Sep 2022 06:22:20 -0700 (PDT)
X-Received: by 2002:a05:6402:1d4f:b0:450:fd05:628c with SMTP id
 dz15-20020a0564021d4f00b00450fd05628cmr25168226edb.419.1663766540452; 
 Wed, 21 Sep 2022 06:22:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 la17-20020a170907781100b007821f4bc328sm643970ejc.178.2022.09.21.06.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 06:22:19 -0700 (PDT)
Date: Wed, 21 Sep 2022 15:22:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org, Eric Auger
 <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>,
 wanghaibin.wang@huawei.com
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Message-ID: <20220921152218.7b55dc76@redhat.com>
In-Reply-To: <CAFEAcA8jdjkZc24FqXBbw+LBJZ5HiCygqY3Y0S2TtmRzdx1P-A@mail.gmail.com>
References: <20220816094957.31700-1-zhukeqian1@huawei.com>
 <20220824170433.7ba675ca@redhat.com>
 <CAFEAcA8jdjkZc24FqXBbw+LBJZ5HiCygqY3Y0S2TtmRzdx1P-A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 90BEXmYorGme

On Tue, 20 Sep 2022 14:15:36 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 24 Aug 2022 at 16:04, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Tue, 16 Aug 2022 17:49:57 +0800
> > Keqian Zhu <zhukeqian1@huawei.com> wrote:
> >  
> > > Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
> > > causes segmentation fault with following dumpstack:
> > >  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
> > >  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
> > >  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
> > >  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
> > >  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
> > >  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
> > >  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
> > >  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
> > >  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
> > >  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
> > >  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
> > >  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
> > >  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
> > >  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47
> > >
> > > Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>  
> >
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> 
> I notice this doesn't seem to have gone in yet -- whose tree is it
> going to go via?

I'd guess ARM tree (due to almost sole user virt-arm).
(there are toy users like microvm and new loongarch)

> 
> thanks
> -- PMM
> 

