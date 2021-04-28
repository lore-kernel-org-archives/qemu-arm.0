Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp444143lfb;
        Wed, 28 Apr 2021 03:15:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsq4aKRaao9K5m0EMdrryV0lfir5L6qCUsjHNg8G7EUaUL+xYCxcxm0ILTx7C6IB/q2rDg
X-Received: by 2002:a17:906:e28c:: with SMTP id gg12mr11040343ejb.483.1619604937294;
        Wed, 28 Apr 2021 03:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619604937; cv=none;
        d=google.com; s=arc-20160816;
        b=0O9oVqWUGMSwnvOrZifa/iOINS8wpsvCuwvuZc+iNMV9H+VdJ6yELQn1Ro0rP+oszs
         uJqFyeoakHd/2tZW99CtwpkGbM8oJzLt3sAWxHjIiGsNYoZKjs02KZxRsDOP+gLmrgBz
         Pu7EJrblCOgYtc2yTzY1uJ5dfHAQ3NnPM0aH9wqTswVxUQAZerRad9RKuhAMotXBcU6M
         FzRhO6hE7acY0cPoHU+MPtlcfsc3rvZTrPtdzs/NC7mG1ASg9b6El3pb/VujF9V2GY1R
         IQmN/E9aHg5OTawLpf6jvjxszWR6ce38Wo+mvBBugmhJSUeME3kDCQo1Je9ggQDPUIWp
         J+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=n17u2C5vbjDvLBkbAez4FfxnqF4uLwspP0dvWXuPevk=;
        b=qz46KnynOXNznZFvk1T72E6bVd6y/bZD8bzDAoWKDCB19R06bj292+IKN2hn5uJvAi
         LPyMzKPN1bVR2+WnSiBt+z/QZOo33bHcWLZMtz7b2G9L+WVTwnXZdobQnupMweHLQ97z
         pauL/O04RcNzC/ZnxOaEZwz6TZD1DGdJB68LT1CFQZv6+fQQxRin7kmlaPWDp5GitELR
         lEBf+eQn8/eUK8E9ZYEnoCVqK5NubR+Gaexw+Y9Ur1dWFqlIWvDTK0GHVeaD0qsCk6sv
         VjJ41rt9SVcWjojmmvsAhRCN67AGwOmMUv1XLpK20btLwIO9pXuJG1caVHx3DNjLJOwP
         Z14g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DiMEVFb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si2655029ejj.228.2021.04.28.03.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 03:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DiMEVFb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbhEG-0007Iw-9d
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 06:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhC8-0005f6-Ba
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhC1-0000wp-Hy
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 06:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619604796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n17u2C5vbjDvLBkbAez4FfxnqF4uLwspP0dvWXuPevk=;
 b=DiMEVFb8JxWTFLMoB+O38wuc3jfsXvENHdp5ESe7dYe1qL3qDQ311HBDVj2/BZt7kuHahQ
 tycWh0LveQzp9FfjuVkYh+oABrRuSjI7cZgYs/6VYHe+32ujk57IjFCAJRTQ3kIbkUwgsq
 mfCQxWxN7tt+BYAX7hoMPr28wlBa3EE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-PKOmBVpKOH6nmUsdK1yR6A-1; Wed, 28 Apr 2021 06:13:14 -0400
X-MC-Unique: PKOmBVpKOH6nmUsdK1yR6A-1
Received: by mail-ed1-f69.google.com with SMTP id
 w14-20020aa7da4e0000b02903834aeed684so24790163eds.13
 for <qemu-arm@nongnu.org>; Wed, 28 Apr 2021 03:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n17u2C5vbjDvLBkbAez4FfxnqF4uLwspP0dvWXuPevk=;
 b=cUbNvJIWQzK4XXqM0jkPo/b2bLPbYZYZbB63+VCLfpYVyUzT81J34SUeZK05Zg3M53
 vpfx8m2kR3Nw5CZrzwbUl0zbY6NAnTcZ2Wh0XCTM/W+Q65+RH7v3cka2Z4vOQI0gAoZ4
 kq9+eNtlbYlcrzk7UoJADnLK/PLjCK9I4n+rmPMPA8I+qJSw5B2gwVewuJd7tccBnAKL
 DsZhH8vkN7orpk6ncJjJ3WAQeskgGNvjz0g9CkXQhzr1hn2seh8QzjXTxtyN8ryhbtr+
 dgmHrwe0RdHvB76hUX3Ki3LYWqi7WvfHOFdQLkHmLijd4GD8+PSr9VSqKW6lBHW/m+/I
 H49w==
X-Gm-Message-State: AOAM532zPSghj/XnIkFAMdpSpnFvdh7dROzk32IzyHeljbPlbjhJmdGG
 t0bgcGysP44pRnBCgmNWB7f2uZ01ZWmJkaO6IcLkjH4BdBjgLBmeu3bJELnL9Q1xhlKtIDuBbFb
 I9Ix6hafdbZsB
X-Received: by 2002:a17:906:8a59:: with SMTP id
 gx25mr17797635ejc.63.1619604793092; 
 Wed, 28 Apr 2021 03:13:13 -0700 (PDT)
X-Received: by 2002:a17:906:8a59:: with SMTP id
 gx25mr17797598ejc.63.1619604792803; 
 Wed, 28 Apr 2021 03:13:12 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id w19sm763317edd.52.2021.04.28.03.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:13:12 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:13:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 6/6] hw/arm/virt: Replace smp_parse with one that
 prefers cores
Message-ID: <20210428101310.cwkjm53kftffw3th@gator>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-7-wangyanan55@huawei.com>
 <20210427145856.5qaetgzdl6ovnoni@gator.home>
 <f3d5172b-13a5-a8d3-8cdb-03788e43fc52@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f3d5172b-13a5-a8d3-8cdb-03788e43fc52@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AEsc7wu/Bn2z

On Wed, Apr 28, 2021 at 05:36:43PM +0800, wangyanan (Y) wrote:
> 
> On 2021/4/27 22:58, Andrew Jones wrote:
> > On Tue, Apr 13, 2021 at 04:07:45PM +0800, Yanan Wang wrote:
> > > From: Andrew Jones <drjones@redhat.com>
> > > 
> > > The virt machine type has never used the CPU topology parameters, other
> > > than number of online CPUs and max CPUs. When choosing how to allocate
> > > those CPUs the default has been to assume cores. In preparation for
> > > using the other CPU topology parameters let's use an smp_parse that
> > > prefers cores over sockets. We can also enforce the topology matches
> > > max_cpus check because we have no legacy to preserve.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/arm/virt.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 76 insertions(+)
> > Thanks, this patch matches [1]. Of course, I've always considered this
> > patch to be something of an RFC, though. Is there any harm in defaulting
> > to sockets over cores? If not, I wonder if we shouldn't just leave the
> > default as it is to avoid a mach-virt specific smp parser. The "no
> > topology" compat variable will keep existing machine types from switching
> > from cores to sockets, so we don't need to worry about that.
> > 
> > [1] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd
> For CPU topology population, ARM64 kernel will firstly try to parse ACPI
> PPTT table
> and then DT in function init_cpu_topology(), if failed it will rely on the
> MPIDR value
> in function store_cpu_topology(). But MPIDR can not be trusted and is
> ignored for
> any topology deduction. And instead, topology of one single socket with
> multiple
> cores is made, which can not represent the real underlying system topology.
> I think this is the reason why VMs will in default prefer cores over sockets
> if no
> topology description is provided.
> 
> With the feature introduced by this series, guest kernel can successfully
> get cpu
> information from one of the two (ACPI or DT) for topology population.
> 
> According to above analysis, IMO, whether the parsing logic is "sockets over
> cores" or
> "cores over sockets", it just provide different topology information and
> consequently
> different scheduling performance. Apart from this, I think there will not
> any harm or
> problems caused.
> 
> So maybe it's fine that we just use the arch-neutral parsing logic?
> How do you think ?

Can you do an experiment where you create a guest with N vcpus, where N is
the number of cores in a single socket. Then, pin each of those vcpus to a
core in a single physical socket. Then, boot the VM with a topology of one
socket and N cores and run some benchmarks. Then, boot the VM again with N
sockets, one core each, and run the same benchmarks.

I'm guessing we'll see the same benchmark numbers (within noise allowance)
for both the runs. If we don't see the same numbers, then that'd be
interesting.

Thanks,
drew

