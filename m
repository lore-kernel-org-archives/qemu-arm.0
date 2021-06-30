Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp152540lfi;
        Wed, 30 Jun 2021 01:30:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmwUchU+WB9qX5QmdfXdzk0C+PhHx/oud0XWbDRZCyP1yJwUTWNBrNHtRqldSYQMFXVZNb
X-Received: by 2002:a05:622a:1a22:: with SMTP id f34mr14706738qtb.209.1625041837876;
        Wed, 30 Jun 2021 01:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625041837; cv=none;
        d=google.com; s=arc-20160816;
        b=GCJhB7vWwpmQyvdM+12EmVxWl9m0Km1IEyD+fgmSpbcwYiJnIujRiuA0yrdPPMI7Tv
         ax2GZhu7OMl5izhcLqTXbekLYNBm0JuckXXwtThcENGzjgMlQlUp9N9YGjcRFQKrL9HX
         DH4WxM+A5gVwVXY58S/Tn9ZQq3EbLJGx9jECAMFtRTOS/qUbvuVxYTKXBERqp2oygvzR
         yH0DYYrTTRsRuIYlhNVmHmQiYkybddFa+l9fPaSBxcPW7ko8EEKp978HRMEgpntS5Gww
         AhWhEoa+yLFekqlDiFeP+qGi0Z7orim2c/n1b2M3NUXMCWOk76hEZ19pOu9HF77w0cQW
         KSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=GWEQCVLmbxNWC/yZh9pTCDFWGcgArVMymYjImq5W7po=;
        b=ZZ+qlo+ILc1V0MY3GBvDjhqnnbWUl9tZschjAfjy+5+hm88FZvRzEKiNnzNju0dpZt
         /2HfPqFJaxCyEdmpQpfmBnOLxS8elNa9kZe3bHcL5nHJzBslHbsQJnE5opJ4krnoSkwC
         F2EIjqXORftCdvlz6q/2gx0/2II3+82Apm/x/t51u1dZU2HT+aLP8A2mO8MQpusmaTxd
         tIvn1LFA1KImVHI1/V68lVEeNkJheENHwa5PIcTqGfHG28o8N/jdvkx9uv8C8xEevJNN
         gjyw0547aey58HrV4EY+L5AtZhHQqGiXDVgRR4WoNIkJlS7XcbhgbDVTaS3lXFXsVDyG
         ObSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CD46h6uO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si15613945qti.214.2021.06.30.01.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jun 2021 01:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CD46h6uO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyVcD-0004eh-20
	for alex.bennee@linaro.org; Wed, 30 Jun 2021 04:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lyVc0-0004eY-S0
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 04:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lyVbw-00037S-Rg
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 04:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625041819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWEQCVLmbxNWC/yZh9pTCDFWGcgArVMymYjImq5W7po=;
 b=CD46h6uORg25uqt1Z+VnJ/jp5WDA6ih3ti6//ACbdlpB328HR/XAmpv6TNKbug34+A7c/Z
 JR+dvxVvS99xDXS/dkKDsNSVrRBzW+EV6lajoFKkSSIXrRSnY8qeHLbT++VnPvx376UeXg
 PIttfSfwnQ4Z1iUoE38ntj1ut0AD4Ac=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-HZYvkSxsNVmk9FuT_mR9cg-1; Wed, 30 Jun 2021 04:30:15 -0400
X-MC-Unique: HZYvkSxsNVmk9FuT_mR9cg-1
Received: by mail-ej1-f71.google.com with SMTP id
 lu1-20020a170906fac1b02904aa7372ec41so475695ejb.23
 for <qemu-arm@nongnu.org>; Wed, 30 Jun 2021 01:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GWEQCVLmbxNWC/yZh9pTCDFWGcgArVMymYjImq5W7po=;
 b=acoo8JOJcnUWCsoPDKzjvutRetw5trc2Zc6hcEdxe8TcwjVvSKcK4Mc/lnuf6TPguF
 r/OPoARMGy0iT/YzOaaeoC1cW6PibM1EUzJ4ckI09RrNKhPF+BgFBocHH4mAzhhA4q6r
 JfHlKwAAoRXQ1xxPQIu2tGk3to4YCcE8a80JeH73n9247T3W5/06PnTU/taBTKUyGQ5d
 Yry+sP4xwMepb0LkL3yVS6zRwOcBVaZlmUZt7uUMQGsZxmo4TPahRfKdCOcRNznyBScm
 cPrYuVGzap/IZJIMxDT4ACEHLXnNPD/dUBNhMXFEYKSJNkIIoUNDBDdIZt+6ijyzs/J2
 g2Ww==
X-Gm-Message-State: AOAM533GmMx/BpB8cpGeGwQwUQrlt3rOV5yGa+gLdBTrdiYig9AMdC7i
 N6IodmHmPBe+BzWnksQ/olBfcnqDOG/oayrRfxItrQxPWPEe5wkvliZlXVueSEmvIalYb65mjqL
 7zxocPW6wUdoX
X-Received: by 2002:a17:906:1da1:: with SMTP id
 u1mr11655254ejh.307.1625041814423; 
 Wed, 30 Jun 2021 01:30:14 -0700 (PDT)
X-Received: by 2002:a17:906:1da1:: with SMTP id
 u1mr11655198ejh.307.1625041813942; 
 Wed, 30 Jun 2021 01:30:13 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id w21sm2951420edc.95.2021.06.30.01.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 01:30:13 -0700 (PDT)
Date: Wed, 30 Jun 2021 10:30:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210630083011.neycb222b7vinfvs@gator.home>
References: <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <20210622142915.pekttdvbi3q5vnh3@gator>
 <20210622174013.52422c73@redhat.com> <YNIacfpt+iHHHzT6@redhat.com>
 <20210622172934.537l7e27sxd6car6@gator>
 <YNIgInK00yNNI4Dy@redhat.com>
 <d695bc58-f648-38e5-cd98-9d91fcebd80a@huawei.com>
 <20210628085805.5y7bxvqprx75hwi4@gator>
 <f4ecd8a5-6783-d168-5bd4-5ef58c973159@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f4ecd8a5-6783-d168-5bd4-5ef58c973159@huawei.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, ehabkost@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oJldqcP3eRri

On Wed, Jun 30, 2021 at 02:36:31PM +0800, wangyanan (Y) wrote:
> Hi Drew, Igor,
> 
> I have a question below, hope for some explanation... :)
> 
> I'm trying to rearrange the smp_parse() helper to make it more scalable.
> But I wonder why we are currently using maxcpus to calculate the missing
> sockets while using *cpus* to calculate the missing cores and threads?
> 
> This makes the following cmdlines work fine,
> -smp cpus=8,maxcpus=12  <==>  -smp
> cpus=8,maxcpus=12,sockets=12,cores=1,threads=1
> -smp cpus=8,maxcpus=12,cores=6  <==>  -smp
> cpus=8,maxcpus=12,sockets=2,cores=6,threads=1
> -smp cpus=8,maxcpus=12,threads=2  <==>  -smp
> cpus=8,maxcpus=12,sockets=6,cores=1,threads=2
> 
> but the following ones break the invalid CPU topology check:
> -smp cpus=8,maxcpus=12,sockets=2  <==>  -smp
> cpus=8,maxcpus=12,sockets=2,cores=4,threads=1
> -smp cpus=8,maxcpus=12,sockets=4,threads=1  <==>  -smp
> cpus=8,maxcpus=12,sockets=4,cores=2,threads=1
> -smp maxcpus=12  <==>  -smp cpus=1,maxcpus=12,sockets=1,cores=1,threads=1
> -smp maxcpus=12,sockets=2  <==>  -smp
> cpus=2,maxcpus=12,sockets=2,cores=1,threads=1
> 
> IMO we should uniformly use maxcpus to calculate the missing sockets
> also cores and threads, which will allow all the above cmdlines work.
> Or maybe I missed something? I read the related discussion in [1] but
> didn't get an unambiguous conclusion.
> 
> [1] https://patchwork.kernel.org/project/qemu-devel/patch/1535553121-80352-1-git-send-email-imammedo@redhat.com/

I agree that maxcpus should be used for all calculations. I think we need
to write -smp parsing from scratch using a set of clean requirements and
then use the machine compat stuff to switch to it. And also properly
document it with something like "Since 6.2..."

Thanks,
drew

> 
> Regards,
> Yanan
> .
> 
> On 2021/6/28 16:58, Andrew Jones wrote:
> > On Mon, Jun 28, 2021 at 04:43:05PM +0800, wangyanan (Y) wrote:
> > > Hi,
> > > On 2021/6/23 1:39, Daniel P. Berrangé wrote:
> > > > On Tue, Jun 22, 2021 at 07:29:34PM +0200, Andrew Jones wrote:
> > > > > On Tue, Jun 22, 2021 at 06:14:25PM +0100, Daniel P. Berrangé wrote:
> > > > > > On Tue, Jun 22, 2021 at 05:40:13PM +0200, Igor Mammedov wrote:
> > > > > > > On Tue, 22 Jun 2021 16:29:15 +0200
> > > > > > > Andrew Jones <drjones@redhat.com> wrote:
> > > > > > > 
> > > > > > > > On Tue, Jun 22, 2021 at 03:10:57PM +0100, Daniel P. Berrangé wrote:
> > > > > > > > > On Tue, Jun 22, 2021 at 10:04:52PM +0800, wangyanan (Y) wrote:
> > > > > > > > > > Hi Daniel,
> > > > > > > > > > 
> > > > > > > > > > On 2021/6/22 20:41, Daniel P. Berrangé wrote:
> > > > > > > > > > > On Tue, Jun 22, 2021 at 08:31:22PM +0800, wangyanan (Y) wrote:
> > > > > > > > > > > > On 2021/6/22 19:46, Andrew Jones wrote:
> > > > > > > > > > > > > On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:
> > > > > > > > > > > > > > On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:
> > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > This is v4 of the series [1] that I posted to introduce support for
> > > > > > > > > > > > > > > generating cpu topology descriptions to guest. Comments are welcome!
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Description:
> > > > > > > > > > > > > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > > > > > > > > > > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > > > > > > > > > > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > > > > > > > > > > > > research and the related performance tests in [2] for reference. So here
> > > > > > > > > > > > > > > we go, this patch series introduces cpu topology support for ARM platform.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > In this series, instead of quietly enforcing the support for the latest
> > > > > > > > > > > > > > > machine type, a new parameter "expose=on|off" in -smp command line is
> > > > > > > > > > > > > > > introduced to leave QEMU users a choice to decide whether to enable the
> > > > > > > > > > > > > > > feature or not. This will allow the feature to work on different machine
> > > > > > > > > > > > > > > types and also ideally compat with already in-use -smp command lines.
> > > > > > > > > > > > > > > Also we make much stricter requirement for the topology configuration
> > > > > > > > > > > > > > > with "expose=on".
> > > > > > > > > > > > > > Seeing this 'expose=on' parameter feels to me like we're adding a
> > > > > > > > > > > > > > "make-it-work=yes" parameter. IMHO this is just something that should
> > > > > > > > > > > > > > be done by default for the current machine type version and beyond.
> > > > > > > > > > > > > > I don't see the need for a parameter to turnthis on, especially since
> > > > > > > > > > > > > > it is being made architecture specific.
> > > > > > > > > > > > > I agree.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Yanan, we never discussed an "expose" parameter in the previous versions
> > > > > > > > > > > > > of this series. We discussed a "strict" parameter though, which would
> > > > > > > > > > > > > allow existing command lines to "work" using assumptions of what the user
> > > > > > > > > > > > > meant and strict=on users to get what they mean or an error saying that
> > > > > > > > > > > > > they asked for something that won't work or would require unreasonable
> > > > > > > > > > > > > assumptions. Why was this changed to an "expose" parameter?
> > > > > > > > > > > > Yes, we indeed discuss a new "strict" parameter but not a "expose" in v2 [1]
> > > > > > > > > > > > of this series.
> > > > > > > > > > > > [1] https://patchwork.kernel.org/project/qemu-devel/patch/20210413080745.33004-6-wangyanan55@huawei.com/
> > > > > > > > > > > > 
> > > > > > > > > > > > And in the discussion, we hoped things would work like below with "strict"
> > > > > > > > > > > > parameter:
> > > > > > > > > > > > Users who want to describe cpu topology should provide cmdline like
> > > > > > > > > > > > 
> > > > > > > > > > > > -smp strict=on,cpus=4,sockets=2,cores=2,threads=1
> > > > > > > > > > > > 
> > > > > > > > > > > > and in this case we require an more accurate -smp configuration and
> > > > > > > > > > > > then generate the cpu topology description through ACPI/DT.
> > > > > > > > > > > > 
> > > > > > > > > > > > While without a strict description, no cpu topology description would
> > > > > > > > > > > > be generated, so they get nothing through ACPI/DT.
> > > > > > > > > > > > 
> > > > > > > > > > > > It seems to me that the "strict" parameter actually serves as a knob to
> > > > > > > > > > > > turn on/off the exposure of topology, and this is the reason I changed
> > > > > > > > > > > > the name.
> > > > > > > > > > > Yes, the use of 'strict=on' is no better than expose=on IMHO.
> > > > > > > > > > > 
> > > > > > > > > > > If I give QEMU a cli
> > > > > > > > > > > 
> > > > > > > > > > >      -smp cpus=4,sockets=2,cores=2,threads=1
> > > > > > > > > > > 
> > > > > > > > > > > then I expect that topology to be exposed to the guest. I shouldn't
> > > > > > > > > > > have to add extra flags to make that happen.
> > > > > > > > > > > 
> > > > > > > > > > > Looking at the thread, it seems the concern was around the fact that
> > > > > > > > > > > the settings were not honoured historically and thus the CLI values
> > > > > > > > > > > could be garbage. ie  -smp cpus=4,sockets=8,cores=3,thread=9
> > > > > > > > > > This "-smp cpus=4,sockets=8,cores=3,threads=9" behaviors as a wrong
> > > > > > > > > > configuration, and the parsing function already report error for this case.
> > > > > > > > > > 
> > > > > > > > > > We hope more complete config like "-smp 4,sockets=2,cores=2,threads=1"
> > > > > > > > > > for exposure of topology, and the incomplete ones like "-smp 4,sockets=1"
> > > > > > > > > > or "-smp 4, cores=1" are not acceptable any more because we are starting
> > > > > > > > > > to expose the topology.
> > > > > > > > > Incomplete specified topologies *are* acceptable.
> > > > > > > > > 
> > > > > > > > > The smp_parse method will automatically fill in any missing values.
> > > > > > > > > 
> > > > > > > > > ie,
> > > > > > > > > 
> > > > > > > > >     -smp 4,cores=1
> > > > > > > > >     -smp cores=1
> > > > > > > > >     -smp threads=1
> > > > > > > > >     -smp sockets=4
> > > > > > > > > 
> > > > > > > > > are all functionally identical to
> > > > > > > > > 
> > > > > > > > >     -smp 4,sockets=4,cores=1,dies=1,threads=1
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > The QEMU man page says this explicitly
> > > > > > > > > 
> > > > > > > > >                    For the PC target, the number of cores per die, the
> > > > > > > > >       number of threads per cores, the number of dies per packages and the
> > > > > > > > >       total number of sockets can be specified. Missing values will be
> > > > > > > > >       computed. If any on the three values is given, the total number of
> > > > > > > > >       CPUs n can be omitted.
> > > > > > > > It doesn't say how it will compute them though, which for the default
> > > > > > > > smp_parse and for x86 is to prefer sockets over cores over threads.
> > > > > > > > That's not necessarily what the user expects. IMO, we need a 'strict=on'
> > > > > > > > parameter that doesn't allow any collection of smp parameters which
> > > > > > > > require unreasonable assumptions. Reasonable assumptions are threads=1,
> > > > > > > > when threads is not specified and the rest of the math adds up. Also,
> > > > > > > > maxcpus == cpus when maxcpus isn't specified is reasonable. But, it's not
> > > > > > > > as reasonable to decide how to divide cores among sockets or to assume
> > > > > > > > threads=1 when only sockets and cores are given. How do we know the user
> > > > > > > > didn't forget to specify threads if we can't check the math?
> > > > > > > or just outlaw all invalid topologies incl. incomplete by default
> > > > > > > (without requiring extra option), and permit them only for old machine
> > > > > > > types ()using compat machinery) without topo info provided to guest.
> > > > > > > And maybe later deprecate invalid topologies altogether.
> > > > > > This feels like it is creating pain for users to fix a problem that
> > > > > > isn't shown to actually be causing any common issues.
> > > > > > 
> > > > > > We've supposed that users are having problems when forgetting to
> > > > > > specify "threads" and not having the compute value be desirable,
> > > > > > but where are the bug reports to back this up ?
> > > > > > 
> > > > > > The partial topologies are valid and have well defined semantics.
> > > > > > Those semantics may not match everyone's preference, but that
> > > > > > doesn't make them invalid.
> > > > > > 
> > > > > If we adopt the [undocumented] semantics of x86 for arm, then we may
> > > > > surprise some users that expect e.g. '-smp 16' to give them a single
> > > > > socket with 16 cores, because they'll start getting 16 sockets with 1
> > > > > core each. That's because if we don't describe a topology to an arm linux
> > > > > guest then it assumes cores. Maybe we shouldn't worry about this, but I'd
> > > > > prefer we require explicit inputs from users and, if necessary, for them
> > > > > to explicitly opt-in to requiring those explicit inputs.
> > > > Even for x86, defaulting to maximising sockets over cores is sub-optimal.
> > > > In real world x86 hardware it is very rare to have sockets > 2 or 4. For
> > > > large CPU counts, you generally have large cores-per-socket counts on x86.
> > > > 
> > > > The QEMU preference for sockets over cores on x86 (and PPC too IIUC)
> > > > is a fairly arbitrary historical decision.
> > > > 
> > > > It can cause problems with guest OS licensing because both Windows
> > > > and RHEL have been known to charge differently for sockets vs cores,
> > > > with high core counts being cheaper.
> > > > 
> > > > We are not tied into the precise behaviour of the computed topology
> > > > values, as we have no made any promises. All that's required is that
> > > > we keep ABI compat for existing machine types.
> > > If based on this point of view that we haven't made any promises for the
> > > precise behavior of the computed topology, things may get much easier.
> > > I have the following understanding (also a proposal):
> > > 
> > > We will introduce the support for exposing cpu topology since machine
> > > type 6.2 and we will also describe the computed topology for the guest.
> > > We will not make any stricter parsing logic, however the -smp content in
> > > qemu-options.hx should be rearranged to clearly explain how the missing
> > > values will exactly be computed. And this is what QEMU is responsible for.
> > > 
> > > We know that a well designed cpu topology configuration can gain much
> > > benefit for the guest, while a badly designed one will also probably cause
> > > negative impact. But the users should be responsible for the design of the
> > > -smp cmdlines. If they are using an incomplete cmdline for a 6.2 machine,
> > > then they should have known what the computed values will be and that
> > > the computed topology will be exposed to the guest.
> > > > So we could decide to change the computed topology so that it prefers
> > > > high core counts, over sockets, whem using new machine types only.
> > > > That would seem to benefit all arches, by making QEMU more reflective
> > > > of real world CPUs topology.
> > > If we really decide to prefer cores over sockets over threads for new
> > > machine
> > > types, then I think we should also record this change in qemu-option.hx.
> > > 
> > I agree. The proposal sounds good to me. I'd like to hear Eduardo's
> > opinion too (CC'ed).
> > 
> > Thanks,
> > drew
> > 
> > 
> > .
> 

