Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3280853lfg;
        Tue, 22 Jun 2021 10:30:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz5hyOBdlDNGHo7y4L1Ixvm1GhnMitfTdjxkdOsVJf7xBSd0nPVdb6Rt9bnQoIeg8gOVnP
X-Received: by 2002:a17:907:98f6:: with SMTP id ke22mr5101083ejc.533.1624383009791;
        Tue, 22 Jun 2021 10:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624383009; cv=none;
        d=google.com; s=arc-20160816;
        b=uH3lipOFtDnY2TQ05jG+j48dtmaAgAIiwparO2vqz8uUbkvCtLHuKATAvGyiA0TPBS
         aAwzQVpUNq1qbRlXBkhDTjrceVMHN21t+c5m4vUP9sfDqO3sCX5sEC58Nrhp2pnzAjFh
         RIY5qxMle1w/jHXZrx+Zue7kUbdcQ6X0GVSMnZvMmc16QPU6jpIDrz8cm4Crp8bqVlg9
         kGnnuzEWN2HrOXOeZAhN/DMUAYnLeqDEDGadQVM2Rwep7hv8FALSJ8bXMuZAb2lpcdq/
         W43LsVRtXZksd3JLiC4+IuXQC613fYQ4//d9F8yqCwzll/MPhTF29p/VxiI3tPJLngMX
         skXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=6lp+zQNNKeCYwIqZQ0D6qkstYfa93zqfdEHq/+ukUQE=;
        b=eN/musyXtsFlUX6BXyqmEOV37KDJr5sNWda3z2u4bSMY2knvJUu0D3JymUyTqdpeIB
         nFVgeiQ8GLjqrD0I/fxeZ5rZPKA5wO9CjpxFTwWXZxsX790Ydhek+qifbfGjWuQ0IVpj
         Sk2wYjoetMqJ0GmI/AUT64JWCyIhG4d1kIW1rHKm4XC+iwwv/4a+xWwf3BlzHuEESl0f
         lzgkX0tWbJ52cvZTcg72lVfX4TMVIqBy7l+JCYPdJDpC3MCg4gaiFSWmpx85G5r9K0no
         yitsoWlDalhikN1rJiywoLWZLUOgh288cnakMLOf7SzcQ16T4IzSdmV1stn0siLGg2fr
         2pVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PQHsagFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ia24si11271241ejc.99.2021.06.22.10.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 10:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PQHsagFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvkDw-0008BQ-Ok
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 13:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvkDa-00089q-Oy
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 13:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvkDW-0003OG-8t
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 13:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624382980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lp+zQNNKeCYwIqZQ0D6qkstYfa93zqfdEHq/+ukUQE=;
 b=PQHsagFB5PzPjpOMXeAn45eIzj55TQsNtg60ti+iSLAsi7lx5MjuVlNaPCId5HWSScZYvZ
 L4HENeh7dTWNj/fHnGgLIt8alpyrkGt2MsMd0aRUEmpeTkKwBwPkYdbx2wy227fCQyR5lR
 8JtJuSWfkefJvQ5r+BR+kqBIuFYtsxA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-eENUsK1CMJa4b0voLIP85A-1; Tue, 22 Jun 2021 13:29:39 -0400
X-MC-Unique: eENUsK1CMJa4b0voLIP85A-1
Received: by mail-ej1-f70.google.com with SMTP id
 l6-20020a1709062a86b029046ec0ceaf5cso5482292eje.8
 for <qemu-arm@nongnu.org>; Tue, 22 Jun 2021 10:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6lp+zQNNKeCYwIqZQ0D6qkstYfa93zqfdEHq/+ukUQE=;
 b=gSDD0fsXnZGYb6VEbf5NGmswKbEBt1pzoTd2DtqfPpwOiKL53TpOTTaZI0ZZdJCze2
 Av0JGEpuP8ON+eRgd6pzWUtXJEkKBYudZeax+750QrNM4zvFQ33h5gwawUxcm1pTrhu+
 BhtDccnjObCldXWT6DTSAbRIMa4CWlUN3iVrwvdIGpYT4sEC7BpLQOXWLKqQonzZDyIX
 n0MyLGmkLTVHdzgn64tKj+RuuP0QcIMaqevM+et1nPCUgIc/p0ZcEBdL2+YpAB3xHvO/
 djLA+01yJQ+LMY8Ne8O2/X8oYz+8lIOez3tq4B+LoVJPnYf1VjKwR8jA1eWAk8xcAVid
 XJDw==
X-Gm-Message-State: AOAM531ZI6IBC320uB+1O7tOPXb2m5OtL2JIKmMbMoE7DbGYQVIvQPXS
 BkwZZDr3TxBhoV0ePAzwIKKgBivclzfAkYgwIVW9KoWvXNudAS4UfCqYkleQBZ4JjzZx7VIBuml
 +9J7rDxZOUkoX
X-Received: by 2002:aa7:c644:: with SMTP id z4mr1574899edr.204.1624382978052; 
 Tue, 22 Jun 2021 10:29:38 -0700 (PDT)
X-Received: by 2002:aa7:c644:: with SMTP id z4mr1574855edr.204.1624382977741; 
 Tue, 22 Jun 2021 10:29:37 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j22sm6270742eje.123.2021.06.22.10.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 10:29:37 -0700 (PDT)
Date: Tue, 22 Jun 2021 19:29:34 +0200
From: Andrew Jones <drjones@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210622172934.537l7e27sxd6car6@gator>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com>
 <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <20210622142915.pekttdvbi3q5vnh3@gator>
 <20210622174013.52422c73@redhat.com> <YNIacfpt+iHHHzT6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YNIacfpt+iHHHzT6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cy3bPYkSTxl1

On Tue, Jun 22, 2021 at 06:14:25PM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 22, 2021 at 05:40:13PM +0200, Igor Mammedov wrote:
> > On Tue, 22 Jun 2021 16:29:15 +0200
> > Andrew Jones <drjones@redhat.com> wrote:
> > 
> > > On Tue, Jun 22, 2021 at 03:10:57PM +0100, Daniel P. Berrangé wrote:
> > > > On Tue, Jun 22, 2021 at 10:04:52PM +0800, wangyanan (Y) wrote:  
> > > > > Hi Daniel,
> > > > > 
> > > > > On 2021/6/22 20:41, Daniel P. Berrangé wrote:  
> > > > > > On Tue, Jun 22, 2021 at 08:31:22PM +0800, wangyanan (Y) wrote:  
> > > > > > > 
> > > > > > > On 2021/6/22 19:46, Andrew Jones wrote:  
> > > > > > > > On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:  
> > > > > > > > > On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:  
> > > > > > > > > > Hi,
> > > > > > > > > > 
> > > > > > > > > > This is v4 of the series [1] that I posted to introduce support for
> > > > > > > > > > generating cpu topology descriptions to guest. Comments are welcome!
> > > > > > > > > > 
> > > > > > > > > > Description:
> > > > > > > > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > > > > > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > > > > > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > > > > > > > research and the related performance tests in [2] for reference. So here
> > > > > > > > > > we go, this patch series introduces cpu topology support for ARM platform.
> > > > > > > > > > 
> > > > > > > > > > In this series, instead of quietly enforcing the support for the latest
> > > > > > > > > > machine type, a new parameter "expose=on|off" in -smp command line is
> > > > > > > > > > introduced to leave QEMU users a choice to decide whether to enable the
> > > > > > > > > > feature or not. This will allow the feature to work on different machine
> > > > > > > > > > types and also ideally compat with already in-use -smp command lines.
> > > > > > > > > > Also we make much stricter requirement for the topology configuration
> > > > > > > > > > with "expose=on".  
> > > > > > > > > Seeing this 'expose=on' parameter feels to me like we're adding a
> > > > > > > > > "make-it-work=yes" parameter. IMHO this is just something that should
> > > > > > > > > be done by default for the current machine type version and beyond.
> > > > > > > > > I don't see the need for a parameter to turnthis on, especially since
> > > > > > > > > it is being made architecture specific.
> > > > > > > > >   
> > > > > > > > I agree.
> > > > > > > > 
> > > > > > > > Yanan, we never discussed an "expose" parameter in the previous versions
> > > > > > > > of this series. We discussed a "strict" parameter though, which would
> > > > > > > > allow existing command lines to "work" using assumptions of what the user
> > > > > > > > meant and strict=on users to get what they mean or an error saying that
> > > > > > > > they asked for something that won't work or would require unreasonable
> > > > > > > > assumptions. Why was this changed to an "expose" parameter?  
> > > > > > > Yes, we indeed discuss a new "strict" parameter but not a "expose" in v2 [1]
> > > > > > > of this series.
> > > > > > > [1] https://patchwork.kernel.org/project/qemu-devel/patch/20210413080745.33004-6-wangyanan55@huawei.com/
> > > > > > > 
> > > > > > > And in the discussion, we hoped things would work like below with "strict"
> > > > > > > parameter:
> > > > > > > Users who want to describe cpu topology should provide cmdline like
> > > > > > > 
> > > > > > > -smp strict=on,cpus=4,sockets=2,cores=2,threads=1
> > > > > > > 
> > > > > > > and in this case we require an more accurate -smp configuration and
> > > > > > > then generate the cpu topology description through ACPI/DT.
> > > > > > > 
> > > > > > > While without a strict description, no cpu topology description would
> > > > > > > be generated, so they get nothing through ACPI/DT.
> > > > > > > 
> > > > > > > It seems to me that the "strict" parameter actually serves as a knob to
> > > > > > > turn on/off the exposure of topology, and this is the reason I changed
> > > > > > > the name.  
> > > > > > Yes, the use of 'strict=on' is no better than expose=on IMHO.
> > > > > > 
> > > > > > If I give QEMU a cli
> > > > > > 
> > > > > >    -smp cpus=4,sockets=2,cores=2,threads=1
> > > > > > 
> > > > > > then I expect that topology to be exposed to the guest. I shouldn't
> > > > > > have to add extra flags to make that happen.
> > > > > > 
> > > > > > Looking at the thread, it seems the concern was around the fact that
> > > > > > the settings were not honoured historically and thus the CLI values
> > > > > > could be garbage. ie  -smp cpus=4,sockets=8,cores=3,thread=9  
> > > > > This "-smp cpus=4,sockets=8,cores=3,threads=9" behaviors as a wrong
> > > > > configuration, and the parsing function already report error for this case.
> > > > > 
> > > > > We hope more complete config like "-smp 4,sockets=2,cores=2,threads=1"
> > > > > for exposure of topology, and the incomplete ones like "-smp 4,sockets=1"
> > > > > or "-smp 4, cores=1" are not acceptable any more because we are starting
> > > > > to expose the topology.  
> > > > 
> > > > Incomplete specified topologies *are* acceptable.
> > > > 
> > > > The smp_parse method will automatically fill in any missing values.
> > > > 
> > > > ie,
> > > > 
> > > >   -smp 4,cores=1
> > > >   -smp cores=1
> > > >   -smp threads=1
> > > >   -smp sockets=4
> > > > 
> > > > are all functionally identical to
> > > > 
> > > >   -smp 4,sockets=4,cores=1,dies=1,threads=1
> > > > 
> > > > 
> > > > The QEMU man page says this explicitly
> > > > 
> > > >                  For the PC target, the number of cores per die, the
> > > >     number of threads per cores, the number of dies per packages and the
> > > >     total number of sockets can be specified. Missing values will be
> > > >     computed. If any on the three values is given, the total number of
> > > >     CPUs n can be omitted.  
> > > 
> > > It doesn't say how it will compute them though, which for the default
> > > smp_parse and for x86 is to prefer sockets over cores over threads.
> > > That's not necessarily what the user expects. IMO, we need a 'strict=on'
> > > parameter that doesn't allow any collection of smp parameters which
> > > require unreasonable assumptions. Reasonable assumptions are threads=1,
> > > when threads is not specified and the rest of the math adds up. Also,
> > > maxcpus == cpus when maxcpus isn't specified is reasonable. But, it's not
> > > as reasonable to decide how to divide cores among sockets or to assume
> > > threads=1 when only sockets and cores are given. How do we know the user
> > > didn't forget to specify threads if we can't check the math?
> > 
> > or just outlaw all invalid topologies incl. incomplete by default
> > (without requiring extra option), and permit them only for old machine
> > types ()using compat machinery) without topo info provided to guest.
> > And maybe later deprecate invalid topologies altogether.
> 
> This feels like it is creating pain for users to fix a problem that
> isn't shown to actually be causing any common issues.
> 
> We've supposed that users are having problems when forgetting to
> specify "threads" and not having the compute value be desirable,
> but where are the bug reports to back this up ?
> 
> The partial topologies are valid and have well defined semantics.
> Those semantics may not match everyone's preference, but that
> doesn't make them invalid.
>

If we adopt the [undocumented] semantics of x86 for arm, then we may
surprise some users that expect e.g. '-smp 16' to give them a single
socket with 16 cores, because they'll start getting 16 sockets with 1
core each. That's because if we don't describe a topology to an arm linux
guest then it assumes cores. Maybe we shouldn't worry about this, but I'd
prefer we require explicit inputs from users and, if necessary, for them
to explicitly opt-in to requiring those explicit inputs.

Thanks,
drew

