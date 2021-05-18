Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp191731lfm;
        Tue, 18 May 2021 01:20:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZC3m6uDfoMFbsCRZ9DSqoc0c8lguKm9u84QLniG6bj7PjyjmQd+fFATIDGNe6ZlRlRV6S
X-Received: by 2002:a9f:35b3:: with SMTP id t48mr4840092uad.129.1621326027514;
        Tue, 18 May 2021 01:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621326027; cv=none;
        d=google.com; s=arc-20160816;
        b=fWJuY4Ovp/CgufnC++Z4tZdep4FbelXRH+5HY3/JI6h/baG8DrbIUo+SOo8jt0TyOG
         rEFgvvOoqbnzvKE5HVousAlkx24K2PwshqOcq/7z01e9IRrLDc7zn4mH0RiFYDl4ajwd
         BRIqUof+K05dLfowEq+uneV6tSJA3k035qWECagutFlwjxoNwF6FxGqqiOVCpsjIgsq4
         QCXH7OZJ/jhsBcnn9i+Qj0a07WTXboi+zCsFtW4kmVIJQRNIvYQI0z6SPweGKWx65gjn
         8Og+mOvXIyOLkJCqWl3rwdJXO4TFfElz4glIYGn0fQ0IYjX4U1YWKsYdXhqiz9iRnaaP
         HX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=3JRVJcvPn+Ioya9we+Wwf0CUOqiqWvoOEgqsBdEscYc=;
        b=Ev4YnXT4XifOXP5WB+0+UHlDPAePU7Kg4GvBULAo9TRtPE5JnFrC53oMHi5tdxGles
         WE3lRpMe9Gx1dHuPOMzjvdhZlhcKfVPVvQtHTZ7b8A/7w3cKzLuh+9RiTOFpKN8TdaSo
         GSd06T2RuejicXEcuCLydO9mvE6LNoGAjcaEXsfMUBRf3GAItyWSkORW2v+WXeFyIjn7
         HieePeGIUMp4Ryp/auBv5Q8964c7lJzVYM0SHJ3SKwlg8BSGhVIGU4sVqhATac8HCNq2
         jSOHEOq0cbebEq33nXIQuXtbkySnssX3vDxJDtAL/xN3+7dxskclaEPaEyC7ScR4Wm3R
         Sq1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g7YrBwFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si4548242vsj.47.2021.05.18.01.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 01:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g7YrBwFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liuxm-0003yn-PA
	for alex.bennee@linaro.org; Tue, 18 May 2021 04:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuxP-0003wM-SM
 for qemu-arm@nongnu.org; Tue, 18 May 2021 04:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuxM-0000Lz-Dp
 for qemu-arm@nongnu.org; Tue, 18 May 2021 04:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621325999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JRVJcvPn+Ioya9we+Wwf0CUOqiqWvoOEgqsBdEscYc=;
 b=g7YrBwFYBd5ylQpLugMyxeo+1Zm49So13jEdSz2t/f9A8HZKrE9z//7e3DpeX0NmRKsCM9
 PP611YhRgMjAOGUFAWdw0mb9nXngiLrZNEgnQuIfscJ2wOgc5Q4bXEN7vnUBg2Bj+0ISj8
 x1nRloCv8CCEq5eJ4U7ke+cZRUdpmA4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-XokNaNp1NC2wyVSMu7VYSA-1; Tue, 18 May 2021 04:19:56 -0400
X-MC-Unique: XokNaNp1NC2wyVSMu7VYSA-1
Received: by mail-ej1-f70.google.com with SMTP id
 j16-20020a1709062a10b02903ba544485d0so2079907eje.3
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 01:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3JRVJcvPn+Ioya9we+Wwf0CUOqiqWvoOEgqsBdEscYc=;
 b=qxEcBpLNvw1XoSoOdfOuVuJVDctrCy3KB8WthhtMchmFol4ae5iou0qSeBqFrkyjHL
 Ed+cxbQw6S/kHfkGVkIGjq/Vcs2Ez0yji0LjnGUCtFwbT4E7RhHsPt2H3S8zzaTqoOXD
 FE9Js1QYoWaLNUDiXanB7wZDf9K9PktZZzZmoUqmg/p6qu0zA943y7dki+THvZJycMem
 xutvjVA12Ycsf4SC1Au+avF3qCf5rPxYP0/IwwrBTlpidsFeVWiv4iOvvKVcIwbrWrDP
 A7ndIw1OiTXb3OYsil1VOO/d+uwKCVpIxSRYckL+sgD9vFjZQIX5avIANQw1C+7mPw6r
 B6Ww==
X-Gm-Message-State: AOAM532M7DUwQVaJndPzFHO1qQRFUAswN6+agcOW/9g25jF79nVCjwOs
 Q7gi8J19FHGXeNWhikFJlkiMXyQ946wRM6DQpd/SGOLnIszukEQiQEf3ABitVuJ2mNIThifDeQc
 tG7JAHZYntS2Y
X-Received: by 2002:a17:906:dcb:: with SMTP id
 p11mr4859151eji.117.1621325995728; 
 Tue, 18 May 2021 01:19:55 -0700 (PDT)
X-Received: by 2002:a17:906:dcb:: with SMTP id
 p11mr4859117eji.117.1621325995407; 
 Tue, 18 May 2021 01:19:55 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id ck4sm12488275edb.56.2021.05.18.01.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:19:55 -0700 (PDT)
Date: Tue, 18 May 2021 10:19:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Message-ID: <20210518081953.5dn4rhs3o45yasj3@gator.home>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
 <20210516103228.37792-5-wangyanan55@huawei.com>
 <01351414c3424710bf3dc5eb949f0d75@huawei.com>
 <3f6756a9-409e-f273-a6be-8cff57a7cfff@huawei.com>
MIME-Version: 1.0
In-Reply-To: <3f6756a9-409e-f273-a6be-8cff57a7cfff@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Salil Mehta <salil.mehta@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 prime.zeng@hisilicon.com, Paolo Bonzini <pbonzini@redhat.com>,
 yuzenghui@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b1hOB/lTfgLc

On Tue, May 18, 2021 at 11:48:34AM +0800, wangyanan (Y) wrote:
> Hi Salil,
> 
> On 2021/5/17 23:17, Salil Mehta wrote:
> > > From: Qemu-devel
> > > [mailto:qemu-devel-bounces+salil.mehta=huawei.com@nongnu.org] On Behalf Of
> > > Yanan Wang
> > > Sent: Sunday, May 16, 2021 11:32 AM
> > > To: Peter Maydell <peter.maydell@linaro.org>; Paolo Bonzini
> > > <pbonzini@redhat.com>; Andrew Jones <drjones@redhat.com>; Michael S . Tsirkin
> > > <mst@redhat.com>; Igor Mammedov <imammedo@redhat.com>; Shannon Zhao
> > > <shannon.zhaosl@gmail.com>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > > Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; Philippe
> > > Mathieu-Daudé <philmd@redhat.com>; wangyanan (Y) <wangyanan55@huawei.com>;
> > > Zengtao (B) <prime.zeng@hisilicon.com>; Wanghaibin (D)
> > > <wanghaibin.wang@huawei.com>; yuzenghui <yuzenghui@huawei.com>; yangyicong
> > > <yangyicong@huawei.com>; zhukeqian <zhukeqian1@huawei.com>
> > > Subject: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
> > > virt_smp_parse
> > > 
> > > There is a separate function virt_smp_parse() in hw/virt/arm.c used
> > > to parse cpu topology for the ARM machines. So add parsing of -smp
> > > cluster parameter in it, then total number of logical cpus will be
> > > calculated like: max_cpus = sockets * clusters * cores * threads.
> > > 
> > > Note, we will assume multi-cluster in one socket is not supported
> > > and default the value of clusters to 1, if it's not explicitly
> > > specified in -smp cmdline.
> > > 
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/arm/virt.c | 32 ++++++++++++++++++--------------
> > >   1 file changed, 18 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 7de822e491..678d5ef36c 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -2642,8 +2642,8 @@ static int virt_kvm_type(MachineState *ms, const char
> > > *type_str)
> > >    * with the -smp cmdlines when parsing them.
> > >    *
> > >    * We require that at least one of cpus or maxcpus must be provided.
> > > - * Threads will default to 1 if not provided. Sockets and cores must
> > > - * be either both provided or both not.
> > > + * Clusters and threads will default to 1 if they are not provided.
> > > + * Sockets and cores must be either both provided or both not.
> > >    *
> > >    * Note, if neither sockets nor cores are specified, we will calculate
> > >    * all the missing values just like smp_parse() does, but will disable
> > > @@ -2652,15 +2652,18 @@ static int virt_kvm_type(MachineState *ms, const char
> > > *type_str)
> > >   static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
> > >   {
> > >       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
> > > +    VirtMachineState *vms = VIRT_MACHINE(ms);
> > > 
> > >       if (opts) {
> > >           unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
> > >           unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
> > >           unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
> > > +        unsigned clusters = qemu_opt_get_number(opts, "clusters", 0);
> > >           unsigned cores = qemu_opt_get_number(opts, "cores", 0);
> > >           unsigned threads = qemu_opt_get_number(opts, "threads", 0);
> > > 
> > > -        /* Default threads to 1 if not provided */
> > > +        /* Default clusters and threads to 1 if not provided */
> > > +        clusters = clusters > 0 ? clusters : 1;
> > >           threads = threads > 0 ? threads : 1;
> > > 
> > >           if (cpus == 0 && maxcpus == 0) {
> > > @@ -2676,13 +2679,13 @@ static void virt_smp_parse(MachineState *ms, QemuOpts
> > > *opts)
> > >               cores = 1;
> > >               if (cpus == 0) {
> > >                   sockets = 1;
> > > -                cpus = sockets * cores * threads;
> > > +                cpus = sockets * clusters * cores * threads;
> > >               } else {
> > >                   maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > -                sockets = maxcpus / (cores * threads);
> > > +                sockets = maxcpus / (clusters * cores * threads);
> > >               }
> > >           } else if (sockets > 0 && cores > 0) {
> > > -            cpus = cpus > 0 ? cpus : sockets * cores * threads;
> > > +            cpus = cpus > 0 ? cpus : sockets * clusters * cores * threads;
> > >               maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > >           } else {
> > >               error_report("sockets and cores must be both provided "
> > > @@ -2695,25 +2698,26 @@ static void virt_smp_parse(MachineState *ms, QemuOpts
> > > *opts)
> > >               exit(1);
> > >           }
> > > 
> > > -        if (sockets * cores * threads < cpus) {
> > > +        if (sockets * clusters * cores * threads < cpus) {
> > >               error_report("cpu topology: "
> > > -                         "sockets (%u) * cores (%u) * threads (%u) < "
> > > -                         "smp_cpus (%u)",
> > > -                         sockets, cores, threads, cpus);
> > > +                         "sockets (%u) * clusters (%u) * cores (%u) * "
> > > +                         "threads (%u) < smp_cpus (%u)",
> > > +                         sockets, clusters, cores, threads, cpus);
> > >               exit(1);
> > >           }
> > > 
> > > -        if (sockets * cores * threads != maxcpus) {
> > > +        if (sockets * clusters * cores * threads != maxcpus) {
> > >               error_report("cpu topology: "
> > > -                         "sockets (%u) * cores (%u) * threads (%u) "
> > > -                         "!= maxcpus (%u)",
> > > -                         sockets, cores, threads, maxcpus);
> > > +                         "sockets (%u) * clusters (%u) * cores (%u) * "
> > > +                         "threads (%u) != maxcpus (%u)",
> > > +                         sockets, clusters, cores, threads, maxcpus);
> > >               exit(1);
> > >           }
> > > 
> > >           ms->smp.cpus = cpus;
> > >           ms->smp.max_cpus = maxcpus;
> > >           ms->smp.sockets = sockets;
> > > +        vms->smp_clusters = clusters;
> > 
> > This variable naming *smp_clusters* looks out-of-sorts. I thought a similar
> > variable *smp_cpus* was destined to be removed for the reason given in below
> > link - a patch by Andrew Jones?
> > 
> > Link: https://lists.gnu.org/archive/html/qemu-arm/2020-12/msg00418.html
> > 
> > Am I missing anything here?
> The smp_clusters is added in VirtMachineState and nowhere else because
> it's currently only used for ARM. But I think maybe I should also move it to
> CpuTopology structure like [1] is doing to move dies to CpuTopology.

Yes, please do that.

Thanks,
drew

> 
> Move clusters to CpuTopology won't affect other architectures that don't
> support it yet, and will also make it easy if they want to in the future.
> 
> [1] From Paolo:
> https://patchwork.kernel.org/project/qemu-devel/patch/20210513162901.1310239-10-pbonzini@redhat.com/
> 
> Thanks,
> Yanan
> > Salil.
> > 
> > >           ms->smp.cores = cores;
> > >           ms->smp.threads = threads;
> > >       }
> > .
> 

