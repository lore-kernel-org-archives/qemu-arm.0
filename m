Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp270656lfh;
        Thu, 26 May 2022 05:40:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiLBF9qzp9zL9FrDv9j/KJev8u6z1wKAHB347VeF28BT1+PDNmGEryoMxssFZ0RxmW44LQ
X-Received: by 2002:a05:6214:e6e:b0:462:2cd0:9b48 with SMTP id jz14-20020a0562140e6e00b004622cd09b48mr19577660qvb.24.1653568815875;
        Thu, 26 May 2022 05:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653568815; cv=none;
        d=google.com; s=arc-20160816;
        b=gM94ed+NJ0mS9Razq7suGxQ9MQNSOzFMSbkEBiIyHN/mVEHnnzsNGtPQ/MZ4v0wYW3
         Os1p4Ye6u/FyJJiK/KgW62HwHg1qM1bnAkP2WT2cdbTAjGndYpMcyJNQjjBM9Y4k7Dff
         KMwLQCVyobYCKVLRuh2ptgmZ5RTwZppTpV9bjfIZcG8lyo86FSYiU0d1itPLFlTN8MEV
         prkI1v8mWiryxyoEk5cJiuhLA9BZWr+85XZD+cz+FMUEyECebSKQf4xAHPOFGGtc2r+M
         nvvTF1TwP0t6HembxRhJkmgoQgX5GYeAopQx8/qJz//tMgV/Gv+5yS81MqUuPHGbDOXG
         B3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=nrTQOOTW0bmDUXDN6mxa3gLlkwl1a9ANaXQ1WS9Hgm8=;
        b=gmVoSmDH7PzS/N7eInEzjyyPa++4binm8w+qwNImzMcJkqBl12yZhjCVzOoiV5HEZZ
         f/gG7fuIA3UtUNkhF1Q+wNp+VycNNe5ChWhJy57uUZrex1i8DG1NQw2UJ+EC53Z6i9pQ
         feJ/KOdO2NQswPUg/x4mnksFme2ah+wZ9ijJc13X/F1RY97lUHD3Ho4Fp9aIqyxNfrJa
         M10EIX2/Bhn5I+k5TU8KY4EsMFxBW6rqTTldjas2r2K278czEbiHMnn/qJiVhr6RH7Eu
         16pBlXCm70cuEU3Ux896UXmycJbAA13lVqaEgLsx/LgWkF3cgFKu5kYB2S2GtI8P0AN+
         GrcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFBUvNY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020a05620a400f00b0069df52d05casi1012427qko.759.2022.05.26.05.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 May 2022 05:40:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFBUvNY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuCml-0005IX-6Z
	for alex.bennee@linaro.org; Thu, 26 May 2022 08:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCaH-0001Ji-Vf
 for qemu-arm@nongnu.org; Thu, 26 May 2022 08:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nuCaG-0003QN-7r
 for qemu-arm@nongnu.org; Thu, 26 May 2022 08:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653568037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrTQOOTW0bmDUXDN6mxa3gLlkwl1a9ANaXQ1WS9Hgm8=;
 b=JFBUvNY34tqoq3RtXtnmCeB6b2Sxcba4wF4t8jUzLSSxdiwXScx3kKLMmfOttHq8KIQgqV
 vF4Kk3c5OBgcRrFwq6fGSja5sjtCrDwp9Ji9WoZB0gbWvyhyywx32r1OL2dHYodGwwt7GR
 lEpIAicnHRc6qVV6DTHhaOFNiQB9WoI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-r_7I8KcTMKefdQ4U7Gr8DA-1; Thu, 26 May 2022 08:27:16 -0400
X-MC-Unique: r_7I8KcTMKefdQ4U7Gr8DA-1
Received: by mail-ej1-f72.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so742262eje.23
 for <qemu-arm@nongnu.org>; Thu, 26 May 2022 05:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrTQOOTW0bmDUXDN6mxa3gLlkwl1a9ANaXQ1WS9Hgm8=;
 b=S8dH8RxMvnmUJEAqZauzeEqb45lc04zNCTmIUpNIHJCXmuWUbCXPbaRN36vVK7g9uL
 hxhJgfQNMFpD8Lo2Y0Ns8+KG7NPNIB+ScA9p0U2yiJV2hhW9IIgl2stunNeOxVO8ACTx
 HFECOO2JmSXlOozJ8cC+YFDCrdfV/hYP6IGIeM5YRIXupOWrdpIzrl0SacrB2AZ3St0a
 lnauzWZzjfq6IG8QNHWJiYwmZVWn96IXkaz2qKwzN2Jl9LNeI1dusADkRnt5TIQVZF4M
 MYwSLMs355rN5XjHGmN3aGHeugsarW1hK8E2pfz5WkNhvhY9z5aVliQWvK8mAQJavjhz
 OgKg==
X-Gm-Message-State: AOAM533SjH//OVibnvPmrfI2NlPd8yPGjiDcWa7kuizfSrbCFmJ1pPYz
 jmI4HL4Sj0C5bVh+EnSzRmzt2TzfpwAFzJg9OfhPUDrj35JGTvCgH/RbiwhqXRAJ4lKsJwekhMd
 F8eHI9UZfb9bi
X-Received: by 2002:a05:6402:2382:b0:42b:7fec:1abf with SMTP id
 j2-20020a056402238200b0042b7fec1abfmr14711094eda.111.1653568035004; 
 Thu, 26 May 2022 05:27:15 -0700 (PDT)
X-Received: by 2002:a05:6402:2382:b0:42b:7fec:1abf with SMTP id
 j2-20020a056402238200b0042b7fec1abfmr14711069eda.111.1653568034813; 
 Thu, 26 May 2022 05:27:14 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170906828500b006fec8e5b8a9sm465871ejx.152.2022.05.26.05.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 05:27:14 -0700 (PDT)
Date: Thu, 26 May 2022 14:27:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, drjones@redhat.com, wangyanan55@huawei.com,
 Jonathan.Cameron@Huawei.com, peter.maydell@linaro.org, berrange@redhat.com,
 thuth@redhat.com, eduardo@habkost.net, lvivier@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs
 in PPTT
Message-ID: <20220526142712.3bab443c@redhat.com>
In-Reply-To: <5719fb28-0ab8-d8f8-c2c3-2e600451d6d8@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
 <5719fb28-0ab8-d8f8-c2c3-2e600451d6d8@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tKzo4iOyUiGT

On Thu, 26 May 2022 19:37:47 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor, Yanan and maintainers,
> 
> On 5/18/22 5:21 PM, Gavin Shan wrote:
> > The {socket, cluster, core} IDs detected from Linux guest aren't
> > matching with what have been provided in PPTT. The flag used for
> > 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> > nodes. In this case, Linux guest takes the offset between the
> > node and PPTT header as the corresponding IDs, as the following
> > logs show.
> > 
> > 
> >    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
> >    -accel kvm -machine virt,gic-version=host -cpu host       \
> >    -smp 8,sockets=2,clusters=2,cores=2,threads=1
> >      :
> >      
> >    # cd /sys/devices/system/cpu
> >    # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
> >      36  36  36  36  36  36  36  36
> >      336 336 336 336 336 336 336 336
> >    # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
> >      56  56  56  56  196 196 196 196
> >      356 356 356 356 496 496 496 496
> >    # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
> >      76  76  136 136 216 216 276 276
> >      376 376 436 436 516 516 576 576
> > 
> > This fixes the issue by setting 'ACPI Processor ID valid' flag for
> > {socket, cluster, core} nodes. With this applied, the IDs are exactly
> > what have been provided in PPTT. I also checked the PPTT table on my
> > host, where the 'ACPI Processor ID valid' is set for cluster/core nodes,
> > but missed from socket nodes.
> > 
> >    host# pwd
> >    /sys/devices/system/cpu
> >    host# cat cpu0/topology/physical_package_id; \
> >          cat cpu0/topology/cluster_id;          \
> >          cat cpu0/topology/core_id
> >    36 0 0
> > 
> > Gavin Shan (3):
> >    tests/acpi/virt: Allow PPTT ACPI table changes
> >    hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
> >    tests/acpi/virt: Update PPTT ACPI table
> > 
> >   hw/acpi/aml-build.c       |   9 ++++++---
> >   tests/data/acpi/virt/PPTT | Bin 96 -> 96 bytes
> >   2 files changed, 6 insertions(+), 3 deletions(-)
> >   
> 
> Could you help to review this tiny series? Thanks in advance.
done, so far I'm not convinced that it's QEMU's fault. see comment on 2/3

> 
> Thanks,
> Gavin
> 

