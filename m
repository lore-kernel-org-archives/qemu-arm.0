Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1031376lfm;
        Mon, 17 May 2021 00:48:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydtiDq7oKAR3Hpaz1tz+OzoHuT6SDKxUgq0h1toqJn5VmdzemxyY4U3C1zeKXgMUFjmek6
X-Received: by 2002:ab0:3748:: with SMTP id i8mr5489135uat.61.1621237693481;
        Mon, 17 May 2021 00:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621237693; cv=none;
        d=google.com; s=arc-20160816;
        b=OCDDnhGYpTqwS3W83aNlVDEQN5KeejpE3Q1d0A4dvXyQoAJTg/9Mu6LMc+/OWCGx97
         bGGIwgK50PmydmVa6uxlhj8cJYUBzr1Hn11tCzUqG4PgIWbjatA4Ww9XKXj2MbmovE/B
         E2lS+jZvtXIUYcsEqf/4WgNVIaqBT+22dqXuB+kt0zcyYPmZ7h4dj+whaPpmQWBvEYdq
         DMj7IYMHLyLS/H4ZuxHmaKLf0FxqzkpwPhiwmANPHz3jBNe/ScqoxP5jA67KX9UngDA2
         9ZxMg06UQlKNQkMmUakYrE5quq0rwD0HjZJvuz2fspvlCFFqdTwfNup9F9CXT1joQ6Cy
         CWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=+igg/I3iudDo6B3PAWIxBrC8nxpEoLBCXED3IDJmsuk=;
        b=gmTEheF9qXaMf88EACZChXOYNf/6IXDwwtUKCXwODTBG048QoxMB/bkEx2CoGv2Jnz
         0ygjCj5TKHBxwp0kYxI5gu4uojMX2ju+fl2YaPHWQ+Yj1vJtnR9deg30G0IiMsAt/Vy2
         +r7eNGYmvMwFxXuF3jTfpIY+a8S8voJl3lIOJDK5rRUiUBTEUv7gQuZmpP7jX8UZHENK
         xa1UOWwyWF24k10ScvaFCl9mXkxIsCFZoKCZw9p6JgkmCWyV+GxvqZAngGr7bajBM8ZJ
         3fDR0RW4Hwsr0PwiOrkTnx7kw54Bi+mIG5oOKM/mFhQAazA+qf3vvwOsfuTSSqVGQWbz
         jCvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CgdPfIkO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si7364177vsr.59.2021.05.17.00.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 00:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CgdPfIkO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liXz2-0007Mr-PW
	for alex.bennee@linaro.org; Mon, 17 May 2021 03:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liXyr-0007M2-Im
 for qemu-arm@nongnu.org; Mon, 17 May 2021 03:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liXyp-0007bw-0P
 for qemu-arm@nongnu.org; Mon, 17 May 2021 03:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621237677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+igg/I3iudDo6B3PAWIxBrC8nxpEoLBCXED3IDJmsuk=;
 b=CgdPfIkO23UBh35SLKhWrMskn0PISNgDyerr1i62wZJ8YCeN3Lg3JHJtDHqFbvsBd0rS2r
 ZGkuMpDndQgXLCZ0NLI0PpmmZB5RGU4wTJ8UAyHxRM92f9vLdJm3hXnRBqIgmBkyJt2ii+
 2dBZ84hvsT54e3FfMzRenlVMnAEk4ZY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-5pY7nmplMwWXl-rcDVqiLA-1; Mon, 17 May 2021 03:47:55 -0400
X-MC-Unique: 5pY7nmplMwWXl-rcDVqiLA-1
Received: by mail-ej1-f71.google.com with SMTP id
 i23-20020a17090685d7b02903d089ab83fcso688097ejy.19
 for <qemu-arm@nongnu.org>; Mon, 17 May 2021 00:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+igg/I3iudDo6B3PAWIxBrC8nxpEoLBCXED3IDJmsuk=;
 b=eX2tSx2lEKoGcTjfgv3sS7gGdUzQUFutMIC/ebAljN1wSQ78He8Pbv/zxF6I3jOzml
 tvMUX9avnOoAk+D+IR5ObhW3R4lFIbedweLbwhv0T526EzTIUvvyGS6e/S8tJFyQy1Rq
 AbuMEDCpS+biyGye9r1CmdpdOSIbV5LOqTKNuzcBPPZBBsqrbNssCpCpg7yjzbo1ZpNs
 3Az3LmF8UFTGOyB/Hm7QJfkaUBUJgPViLDXJh9kfIGK0ZWqeqPfeKXCqzXcJh5cFNCUP
 D+t6wWLdDHLsudhPy084dwtWalSyHg54G1SRyptsGGztY0vL3lZXsTAdKGTdibAlk7ls
 MIBw==
X-Gm-Message-State: AOAM5314Hv72ivNucBpzCkRgyrE4U3zfq3b5J7BFykG9PuInTN3T3zDJ
 I/11/2JLjH1xMjFKu6B7xiM62WTSBPwHnrCfhF1O8zOu2xuReqE3sAp87I/kkmb4xh5fsNf7PUA
 AqZN4FnpZNCj+
X-Received: by 2002:a17:907:1002:: with SMTP id
 ox2mr6332364ejb.337.1621237674052; 
 Mon, 17 May 2021 00:47:54 -0700 (PDT)
X-Received: by 2002:a17:907:1002:: with SMTP id
 ox2mr6332340ejb.337.1621237673938; 
 Mon, 17 May 2021 00:47:53 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id w14sm10510484edj.6.2021.05.17.00.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:47:53 -0700 (PDT)
Date: Mon, 17 May 2021 09:47:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 7/9] hw/acpi/aml-build: Add Processor hierarchy
 node structure
Message-ID: <20210517074751.7kexuvcktazidlup@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FwbDBmelALSI

On Sun, May 16, 2021 at 06:28:58PM +0800, Yanan Wang wrote:
> Add a generic API to build Processor hierarchy node structure (Type 0),
> which is strictly consistent with descriptions in ACPI 6.2: 5.2.29.1.
> 
> This function will be used to build ACPI PPTT table for cpu topology.
> 
> Co-developed-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  4 ++++
>  2 files changed, 30 insertions(+)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

