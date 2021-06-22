Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3263222lfg;
        Tue, 22 Jun 2021 10:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd+LoMdiTLJr/6a9mF5b1kEfbFWDQOq9IA3cPBvw0Mw4jXz02H8F6XhAWVMNd0rTyk7BkD
X-Received: by 2002:a17:906:2bdb:: with SMTP id n27mr5104515ejg.312.1624381718152;
        Tue, 22 Jun 2021 10:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624381718; cv=none;
        d=google.com; s=arc-20160816;
        b=us5boCBQJQrZf8/cEmdie7b+Fta9OMBnOr8UD3eocH1cmxXZFRj1fpd1Vs/RyMVVNd
         DFgMok3980H+aMH4gw2w8UUbZIGt91mZlW47I+g4NXKLFL5WXiN6bmDiYDkai1UV7pvH
         aLkiiTdEaOPLJQd4xv8M9uqG1J4zqP37OjfLG4fv4VTsHPVdLWLSAm0gqmnKMOm1H5U8
         zJ/bDYugbMTjCTi0y1wJ3Gt0ISYcCDR0CikN1xnqhbX4bm/XDIi0ZZbHcZCFm69RnSdJ
         V9ANezFbqgcJzvrdNeS/LLJEFnRVnhUXj9gsgi9YpB0u8Z+Dg92tiCrz2y7zKDl7W5OZ
         o2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=QQgP1LdSaC5ip8UfkYchb6vjZS1qYRDy5x2qvcLJFoU=;
        b=vtLvGuZK0hA5GJssMxekIfIuXRO8Oi1F3x5MSyZQ4/MRWZ5HC+e6zwv3xcOmm7wtiL
         c+G9s3wd0GPCgg62B+53kjf781+fHtsXgGDzMiV8l0AlQra0AF1T6M+vxZVJSRVBNt7w
         1MFRpEZHAZoUUsTyz7SosDJbPgVDGxEEFvp8queWbzoj7+ah2werbPARhTpNp1uqZRTc
         9tdn2fCCsLUFXC9KQ9NGJK/DimHbeJU225U9PFh21KMCoicWXtPRCgUpwbfkYqJrmO2p
         c7xGRKVh+8wzZQ0+M1mBRFlk3McX5yHaAsKi2fbInPPZrYt918aJKru09E3z3nBKxI89
         U1qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YFyMNJ9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ce18si8288402ejc.316.2021.06.22.10.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 10:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YFyMNJ9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvjt7-0007Lh-4o
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 13:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvjsx-0007K5-8d
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 13:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lvjsv-0006jF-Bm
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 13:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624381704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQgP1LdSaC5ip8UfkYchb6vjZS1qYRDy5x2qvcLJFoU=;
 b=YFyMNJ9AFvrBNs9inHTd0kL5SEML0v6sAq6llg/WTOLrhNqQIxo62i4gsAaTGR0e+KSUxc
 6dZM8nxhTRgPQC+h7HiJR9xmQSy27s2K8JZfeZK2pvvyz6XB0+1Tx+Ys3I6+LRc5LDfkN3
 PuXhsdv672X+ST9LFtEcnaQJj21zzoc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-1t0MDhvmNiCZWaFh-Bv4aw-1; Tue, 22 Jun 2021 13:08:09 -0400
X-MC-Unique: 1t0MDhvmNiCZWaFh-Bv4aw-1
Received: by mail-ed1-f70.google.com with SMTP id
 p23-20020aa7cc970000b02903948bc39fd5so7781975edt.13
 for <qemu-arm@nongnu.org>; Tue, 22 Jun 2021 10:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QQgP1LdSaC5ip8UfkYchb6vjZS1qYRDy5x2qvcLJFoU=;
 b=oyqODeNKcq+RwHQ2YPpM+GcbOdo8UskMiAq8Irtro7VgXHox1HX9MTMKDGgoBFxSIp
 E3ZVRXJ+D92GGU/WN5+vUUXCZw6K8NRNoJ5FC5gst7oOuYTc5wMBReTwEdqQ6GOqFejp
 YruIzv0BEcfE+iEGYBe/I2olojh0NJ2xDRrAUcWT5aq15c+vguI5qw/1JGLp+UTRkkkv
 bxG6pFeZUk6VN3drjH6nQSLCcTAhJmuDuSFeHi/J3Dn7LUcscTRBnu81ioi0dhDQx597
 7DbjgpklX8ux6SnWJMFEtiD7c6pVROye1UEJ3yepIEz3226ql9mNMDYPLkqR3FMxv581
 nM1g==
X-Gm-Message-State: AOAM530KLCQhqVZ1FRpnFmR/S5687UW4AY24yAIllbDIjQWEDTPwQ7S2
 yuWhDxMYCpMaA/vekM8jMs0qoyPm7WnjEqKC0q1sfGko8g0aKcDRs4ZOqP1xbC+PJtLcuYJ3rxi
 Ex7UaSh0nzMAg
X-Received: by 2002:aa7:c256:: with SMTP id y22mr6481078edo.177.1624381687920; 
 Tue, 22 Jun 2021 10:08:07 -0700 (PDT)
X-Received: by 2002:aa7:c256:: with SMTP id y22mr6481032edo.177.1624381687683; 
 Tue, 22 Jun 2021 10:08:07 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id d23sm3749406edv.14.2021.06.22.10.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 10:08:07 -0700 (PDT)
Date: Tue, 22 Jun 2021 19:08:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210622170805.thoybinmc2xl5kem@gator>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com>
 <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <20210622142915.pekttdvbi3q5vnh3@gator>
 <20210622174013.52422c73@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622174013.52422c73@redhat.com>
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 yangyicong@huawei.com, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0HUGP+1gq5tk

On Tue, Jun 22, 2021 at 05:40:13PM +0200, Igor Mammedov wrote:
> On Tue, 22 Jun 2021 16:29:15 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Tue, Jun 22, 2021 at 03:10:57PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Jun 22, 2021 at 10:04:52PM +0800, wangyanan (Y) wrote:  
> > > > Hi Daniel,
> > > > 
> > > > On 2021/6/22 20:41, Daniel P. Berrangé wrote:  
> > > > > On Tue, Jun 22, 2021 at 08:31:22PM +0800, wangyanan (Y) wrote:  
> > > > > > 
> > > > > > On 2021/6/22 19:46, Andrew Jones wrote:  
> > > > > > > On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:  
> > > > > > > > On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:  
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > This is v4 of the series [1] that I posted to introduce support for
> > > > > > > > > generating cpu topology descriptions to guest. Comments are welcome!
> > > > > > > > > 
> > > > > > > > > Description:
> > > > > > > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > > > > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > > > > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > > > > > > research and the related performance tests in [2] for reference. So here
> > > > > > > > > we go, this patch series introduces cpu topology support for ARM platform.
> > > > > > > > > 
> > > > > > > > > In this series, instead of quietly enforcing the support for the latest
> > > > > > > > > machine type, a new parameter "expose=on|off" in -smp command line is
> > > > > > > > > introduced to leave QEMU users a choice to decide whether to enable the
> > > > > > > > > feature or not. This will allow the feature to work on different machine
> > > > > > > > > types and also ideally compat with already in-use -smp command lines.
> > > > > > > > > Also we make much stricter requirement for the topology configuration
> > > > > > > > > with "expose=on".  
> > > > > > > > Seeing this 'expose=on' parameter feels to me like we're adding a
> > > > > > > > "make-it-work=yes" parameter. IMHO this is just something that should
> > > > > > > > be done by default for the current machine type version and beyond.
> > > > > > > > I don't see the need for a parameter to turnthis on, especially since
> > > > > > > > it is being made architecture specific.
> > > > > > > >   
> > > > > > > I agree.
> > > > > > > 
> > > > > > > Yanan, we never discussed an "expose" parameter in the previous versions
> > > > > > > of this series. We discussed a "strict" parameter though, which would
> > > > > > > allow existing command lines to "work" using assumptions of what the user
> > > > > > > meant and strict=on users to get what they mean or an error saying that
> > > > > > > they asked for something that won't work or would require unreasonable
> > > > > > > assumptions. Why was this changed to an "expose" parameter?  
> > > > > > Yes, we indeed discuss a new "strict" parameter but not a "expose" in v2 [1]
> > > > > > of this series.
> > > > > > [1] https://patchwork.kernel.org/project/qemu-devel/patch/20210413080745.33004-6-wangyanan55@huawei.com/
> > > > > > 
> > > > > > And in the discussion, we hoped things would work like below with "strict"
> > > > > > parameter:
> > > > > > Users who want to describe cpu topology should provide cmdline like
> > > > > > 
> > > > > > -smp strict=on,cpus=4,sockets=2,cores=2,threads=1
> > > > > > 
> > > > > > and in this case we require an more accurate -smp configuration and
> > > > > > then generate the cpu topology description through ACPI/DT.
> > > > > > 
> > > > > > While without a strict description, no cpu topology description would
> > > > > > be generated, so they get nothing through ACPI/DT.
> > > > > > 
> > > > > > It seems to me that the "strict" parameter actually serves as a knob to
> > > > > > turn on/off the exposure of topology, and this is the reason I changed
> > > > > > the name.  
> > > > > Yes, the use of 'strict=on' is no better than expose=on IMHO.
> > > > > 
> > > > > If I give QEMU a cli
> > > > > 
> > > > >    -smp cpus=4,sockets=2,cores=2,threads=1
> > > > > 
> > > > > then I expect that topology to be exposed to the guest. I shouldn't
> > > > > have to add extra flags to make that happen.
> > > > > 
> > > > > Looking at the thread, it seems the concern was around the fact that
> > > > > the settings were not honoured historically and thus the CLI values
> > > > > could be garbage. ie  -smp cpus=4,sockets=8,cores=3,thread=9  
> > > > This "-smp cpus=4,sockets=8,cores=3,threads=9" behaviors as a wrong
> > > > configuration, and the parsing function already report error for this case.
> > > > 
> > > > We hope more complete config like "-smp 4,sockets=2,cores=2,threads=1"
> > > > for exposure of topology, and the incomplete ones like "-smp 4,sockets=1"
> > > > or "-smp 4, cores=1" are not acceptable any more because we are starting
> > > > to expose the topology.  
> > > 
> > > Incomplete specified topologies *are* acceptable.
> > > 
> > > The smp_parse method will automatically fill in any missing values.
> > > 
> > > ie,
> > > 
> > >   -smp 4,cores=1
> > >   -smp cores=1
> > >   -smp threads=1
> > >   -smp sockets=4
> > > 
> > > are all functionally identical to
> > > 
> > >   -smp 4,sockets=4,cores=1,dies=1,threads=1
> > > 
> > > 
> > > The QEMU man page says this explicitly
> > > 
> > >                  For the PC target, the number of cores per die, the
> > >     number of threads per cores, the number of dies per packages and the
> > >     total number of sockets can be specified. Missing values will be
> > >     computed. If any on the three values is given, the total number of
> > >     CPUs n can be omitted.  
> > 
> > It doesn't say how it will compute them though, which for the default
> > smp_parse and for x86 is to prefer sockets over cores over threads.
> > That's not necessarily what the user expects. IMO, we need a 'strict=on'
> > parameter that doesn't allow any collection of smp parameters which
> > require unreasonable assumptions. Reasonable assumptions are threads=1,
> > when threads is not specified and the rest of the math adds up. Also,
> > maxcpus == cpus when maxcpus isn't specified is reasonable. But, it's not
> > as reasonable to decide how to divide cores among sockets or to assume
> > threads=1 when only sockets and cores are given. How do we know the user
> > didn't forget to specify threads if we can't check the math?
> 
> or just outlaw all invalid topologies incl. incomplete by default
> (without requiring extra option), and permit them only for old machine
> types ()using compat machinery) without topo info provided to guest.
> And maybe later deprecate invalid topologies altogether. 

I like this proposal, but Peter generally does not want currently working
command lines to stop working. The 'virt' machine type always points to
the latest machine type, so '-M virt -smp sockets=2,cores=4' will
currently work (even though no topology is generated), but, if we were to
merge patches that outlawed that using the compat machinery for 6.2, then
it'll stop working, possibly breaking scripts. The 'strict' parameter
allows one to opt into the strict parsing and actually get the topology
described. Everyone else will still have working command lines without
topology no matter what they use. If Peter agrees to making the smp parser
strict from 6.2 on (possibly by issuing a warning for a release or two
instead of an error, like Daniel suggested), then that's indeed better.
If not, then I don't know how to get a useful -smp command line parser
without the additional parameter.

Thanks,
drew

> 
> 
> > 
> > Thanks,
> > drew
> > 
> > > 
> > > note this qemu-options.hx doc will require updating since it will apply
> > > to more than just the PC target.
> > > 
> > > Regards,
> > > Daniel
> > > -- 
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > >   
> > 
> 

