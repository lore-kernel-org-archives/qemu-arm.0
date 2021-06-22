Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3030531lfg;
        Tue, 22 Jun 2021 05:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4wSrOyZbX4ShQENukXBIk6zek3AcuAiagpkxJFcO6eLZMjUMYQbjML4hjcJy/+Yhck/SN
X-Received: by 2002:a17:906:1291:: with SMTP id k17mr3757187ejb.349.1624365816880;
        Tue, 22 Jun 2021 05:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624365816; cv=none;
        d=google.com; s=arc-20160816;
        b=LmCqScDEjRO2zyVv//hvScGDv9hoYrTeqp6iMiHih+NorTrYMLESg9UzOw7OtvJGNa
         GXrstn2xn4I46qEj7qeh693oZM1zTqiuVTnlT+UC8Ypt9NvDKCcdImHrgVkvI0ESwt74
         DkU3IugmRicma7cuooQ8TDQ1vtwg2ozOnaawhUWRwFnulS14dTiweLq58iwfidMtWcMm
         5E1FJiY/IVkW3NrNSKZZeVOvyOdAM5xF5D01EQMSQd41qkVQbK1XeKUarziApCKKYR7v
         PbLR58n5Xn5eV3OWujbx8ZFMKcZw5CFLhEOP07pOLcNJCC+4cjRUX2uZELdTUsqMKqhg
         CBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XUurdi0rVwBgZQ4zG9k39+Hy+/21QEnVB0H9rWZlidg=;
        b=Oay8ytLla7shb8J+RV4zN2WgLmCFFOlfmKtYBvea8mi/ChLafz33XkcphtGDrb5Lq5
         f1ymrYvfC1m3Xf5rt4E+iySO7n7j1NwT4iiGOL9TjUHcIq+opLcFtaX3HSEQzbCfq3mm
         u7+15Kc0XceyAnkrQMoAdTl+iyCRDlOEzLzll5P1P039nELg6KZMl34bwrb5ghpbl9MD
         2OR8Zm+2NISWGkMPIpIKu9AzSMZQwOB3N+uilj7zd4gtVfzTE7aHZ8RzWTBMQoAOklmp
         b76NRtiQ6KroVGg1HU438lNH4aii1GA3FXEzHUOliTkV8zkqFMnqDqJVYwzQXK8R7j0N
         rO4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BP1dOa8R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gx5si1984747ejc.328.2021.06.22.05.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 05:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BP1dOa8R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvfkd-0003Pu-Tj
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 08:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvfjj-0003Pa-Un
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 08:42:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvfjb-0006dl-HR
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 08:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624365746;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUurdi0rVwBgZQ4zG9k39+Hy+/21QEnVB0H9rWZlidg=;
 b=BP1dOa8R2qWpdgpCf3SzYKJcc6EenPHt4XUB84yBPNtcZL3C7XyCXBe5cqo3kFlaIdDvpS
 YHgqrX/S6Btsm7qqeZhFjfb7kp3hzAAUA9NS0a+lsA04juvVp5yrM3YMgIgeukmQXc9OKV
 IRIqkq+Z0Ph11HFjoX5j3KjxCOUtFW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-UuWvBhUiPQi9_q1urgtOTQ-1; Tue, 22 Jun 2021 08:42:13 -0400
X-MC-Unique: UuWvBhUiPQi9_q1urgtOTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 804711084F4C;
 Tue, 22 Jun 2021 12:42:11 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1E460877;
 Tue, 22 Jun 2021 12:42:01 +0000 (UTC)
Date: Tue, 22 Jun 2021 13:41:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Message-ID: <YNHalhuNZhMa665J@redhat.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com>
 <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
MIME-Version: 1.0
In-Reply-To: <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9cTguIK9vx7f

On Tue, Jun 22, 2021 at 08:31:22PM +0800, wangyanan (Y) wrote:
> 
> 
> On 2021/6/22 19:46, Andrew Jones wrote:
> > On Tue, Jun 22, 2021 at 11:18:09AM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Jun 22, 2021 at 05:34:06PM +0800, Yanan Wang wrote:
> > > > Hi,
> > > > 
> > > > This is v4 of the series [1] that I posted to introduce support for
> > > > generating cpu topology descriptions to guest. Comments are welcome!
> > > > 
> > > > Description:
> > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > research and the related performance tests in [2] for reference. So here
> > > > we go, this patch series introduces cpu topology support for ARM platform.
> > > > 
> > > > In this series, instead of quietly enforcing the support for the latest
> > > > machine type, a new parameter "expose=on|off" in -smp command line is
> > > > introduced to leave QEMU users a choice to decide whether to enable the
> > > > feature or not. This will allow the feature to work on different machine
> > > > types and also ideally compat with already in-use -smp command lines.
> > > > Also we make much stricter requirement for the topology configuration
> > > > with "expose=on".
> > > Seeing this 'expose=on' parameter feels to me like we're adding a
> > > "make-it-work=yes" parameter. IMHO this is just something that should
> > > be done by default for the current machine type version and beyond.
> > > I don't see the need for a parameter to turnthis on, especially since
> > > it is being made architecture specific.
> > > 
> > I agree.
> > 
> > Yanan, we never discussed an "expose" parameter in the previous versions
> > of this series. We discussed a "strict" parameter though, which would
> > allow existing command lines to "work" using assumptions of what the user
> > meant and strict=on users to get what they mean or an error saying that
> > they asked for something that won't work or would require unreasonable
> > assumptions. Why was this changed to an "expose" parameter?
> Yes, we indeed discuss a new "strict" parameter but not a "expose" in v2 [1]
> of this series.
> [1] https://patchwork.kernel.org/project/qemu-devel/patch/20210413080745.33004-6-wangyanan55@huawei.com/
> 
> And in the discussion, we hoped things would work like below with "strict"
> parameter:
> Users who want to describe cpu topology should provide cmdline like
> 
> -smp strict=on,cpus=4,sockets=2,cores=2,threads=1
> 
> and in this case we require an more accurate -smp configuration and
> then generate the cpu topology description through ACPI/DT.
> 
> While without a strict description, no cpu topology description would
> be generated, so they get nothing through ACPI/DT.
> 
> It seems to me that the "strict" parameter actually serves as a knob to
> turn on/off the exposure of topology, and this is the reason I changed
> the name.

Yes, the use of 'strict=on' is no better than expose=on IMHO.

If I give QEMU a cli

  -smp cpus=4,sockets=2,cores=2,threads=1

then I expect that topology to be exposed to the guest. I shouldn't
have to add extra flags to make that happen.

Looking at the thread, it seems the concern was around the fact that
the settings were not honoured historically and thus the CLI values
could be garbage. ie  -smp cpus=4,sockets=8,cores=3,thread=9

A similar problem existed on x86 platforms. When we made that stricter
we had cde that issued a warning for a few releases, essentially
deprecating the config. EVentually it was turned into a fatal error.
This gave applications time to fix their broken configs, while having
correct configs "just work".

I'd suggest doing the same for arm. If the -smp args are semantically
valid then expose the topology automatically (for new machine type).
If the -smp args are semantically broken, then issue a warning. In
a few releases time, turn this warning into an error.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

