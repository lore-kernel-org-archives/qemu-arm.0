Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1274431lfm;
        Wed, 19 May 2021 01:27:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYQli1trgJThCknV7SnvTkUCwEf6hq9Nq7wZbBOogDI2tc0K3fR6N7DgRqmiZQODZuCDaY
X-Received: by 2002:a67:ed83:: with SMTP id d3mr3227345vsp.46.1621412878319;
        Wed, 19 May 2021 01:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621412878; cv=none;
        d=google.com; s=arc-20160816;
        b=ck0NH5ooEZ2Z2tCftgCtzBf6hjTUtXh3DYnpSeA7d4uO7VeRGXXpiNoY3jCuSc4Uo0
         dmPSRrFjdkdLMiexvmHDdPKBs9lqgc9dL7uNvDmj6XXM7mY6dCkWlnsKokJG/+MdC/tc
         iFjfW8h3w9Asdcgf24fBZqUXt86dqJ+APZX89s2aC7+1YBO3Cbyb6j4K/6jJNNMbfkHO
         krXFMk2+4vBl5vo9ggLzGagfssGIfmLbJkKDzNVqrGmNkwcVeuUHvFHRW/DzBw0eohDS
         6/xIvb/m8utKKCCT07YDK9/nsv9KnoTYQBXMcQjDL+x63ezCB+q7pRCP9B+QJBoLaxLM
         l3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=8GvIeLiZMyRSu2tS3bjDWRNnWJnkqgZWC/Dr+1tRcPQ=;
        b=f0l6jB1B9ZvKbRB2DdvP9hiwF/tG8hkpHox9Pu8PTpTbJC8kHKb3Pc15OPBfHAvkCd
         MmR3nIcUUSfgP0+9YcDBWfXCRG2iciWQ0BtZEb2PwV/JZM3+hHc6gzLsEaKB494zno1K
         q4CwKNNfAYXiSn6sIgsv7FpI2XR+U1mXiIz4ig2/Vhu9zFJOI1ze66s70U5t09Mo3rjc
         L/hjR69BBq8V5EafTrEYwrLTbz2/3zdhUKeJZDVRLJ0d2I8qg+eoZE19ViUkF9EMa+CA
         Db0w1Re4qT5Dj7E7S5oqlA62Nqd2y4mYzk1FHbilXn7GJ5nBN7nNj4IoPHaXAlwDCWLg
         d6Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ybz4vk9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si3567267vsj.196.2021.05.19.01.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 01:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ybz4vk9U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljHYb-0006ta-Mu
	for alex.bennee@linaro.org; Wed, 19 May 2021 04:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHYR-0006s3-Tv
 for qemu-arm@nongnu.org; Wed, 19 May 2021 04:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHYQ-00080f-A5
 for qemu-arm@nongnu.org; Wed, 19 May 2021 04:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621412865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8GvIeLiZMyRSu2tS3bjDWRNnWJnkqgZWC/Dr+1tRcPQ=;
 b=Ybz4vk9UsfRqrOe74NEfWqElRKToTexl18TXbxqiRKPagGVsLmPEjV9SaNrbjGhUNnqEZV
 jDuquw+e0ia81390LEz5hoTdlFl5KAk1domxoIR3Uswf56yT453s5IfJ6J6FsVITvGTYEi
 erdVZMh8PjKS5XNCLoWmnlTjnzoMU0E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-SzawF1-VOkmzgmgsojqhOQ-1; Wed, 19 May 2021 04:27:44 -0400
X-MC-Unique: SzawF1-VOkmzgmgsojqhOQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so1533833ejc.0
 for <qemu-arm@nongnu.org>; Wed, 19 May 2021 01:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8GvIeLiZMyRSu2tS3bjDWRNnWJnkqgZWC/Dr+1tRcPQ=;
 b=GKIyU8OA6yi04SS6/uWZdVoxnnDBtIHouLZstqTWVSGfKHlKzD/qv3B6p9qsPu0OoA
 DohtwXywVdwIbOJuVStT4ps2MMUA3L5IhULRYrVj6HBTuejNchLbrnZJbM+LQNxXQGPN
 sZ0vZoJkPd6r7W/emrGrSP3cJ8AMCFivcJW+6gBqQst/s2RBAgaNkyc5sNsV99hy0Xsr
 WpTMs/VTEq+dWcrZRrVVONK3kUmxZLndKqGfHaust8Rj7hMuPJRJXRs4kAlzB5xta/pO
 p8OwVJay3bncV0C70gmAqWFzx1vFQrZvo/iuZInPoXwBhHNVZ0ot3xe4Rcum1MXzlBh2
 ee+A==
X-Gm-Message-State: AOAM532Sx+nTZiwo9Jfd7pmYH1MCv3JxJT8G9RK0wmQBXhnmxUDAHDsz
 8VlUW7RwBF0bAvFy00doT5fmzpJiWtM8Xqma7bErM3IbhTDPTVFrW5OtIGOf9PEUH2dRZp0YRdp
 6+iAfL/fnX9x5
X-Received: by 2002:a17:906:18b2:: with SMTP id
 c18mr11199353ejf.160.1621412863144; 
 Wed, 19 May 2021 01:27:43 -0700 (PDT)
X-Received: by 2002:a17:906:18b2:: with SMTP id
 c18mr11199325ejf.160.1621412862856; 
 Wed, 19 May 2021 01:27:42 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id bh2sm11027216ejb.80.2021.05.19.01.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 01:27:42 -0700 (PDT)
Date: Wed, 19 May 2021 10:27:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210519082735.yru7wpusq7lnmgj5@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
MIME-Version: 1.0
In-Reply-To: <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gLPqFDPVb1oz

On Tue, May 18, 2021 at 09:05:39PM +0200, Andrew Jones wrote:
> The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
> it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
> we're proposing that it should. Maybe we can start erroring out when
> cpus != maxcpus until hot plug is supported?
>

The more I think about this, the more I think we're in a bit of pickle and
need Peter Maydell to chime in. While we may want to make our -smp command
line option parsing more strict in order to bring some sanity to it, if
we do, then we'll break existing command lines, which, while may be
specifying useless inputs, have always gotten away with it. We probably
can't just change that now without forcing the user to opt into it.
Maybe we need to add another -smp parameter like 'strict' that has to
be set to 'on' in order to get this new behavior.

Peter, do you have some suggestions for this? A summary of the problem
we'd like to solve is as follows:

 We'd like to start describing CPU topology to guests when provided
 topology information with the '-smp ...' command line option. Currently,
 a user may provide nearly whatever it wants on that command line option
 and not get an error, even though the guest will not get a topology
 description. When building the topology its important to know what
 the user actually wants, so we're proposing to require both sockets
 and cores be given if one of them is given. Also, since we don't yet
 support hot plug for AArch64, we're proposing to enforce cpus == maxcpus.

Is it fine to make those changes to the parsing for 6.1 and later? (Note,
mach-virt will override the default smp_parse with its own, so this is
mach-virt specific.) Or, should we only do this if a new parameter is
also given, e.g. 'strict'. Something like

  -smp strict=on,cpus=4,sockets=2,cores=2

would be needed by users who want to describe cpu topologies. Without
a strict description, then they get what they get today for their
DT/ACPI topology description, nothing.

Thanks,
drew

