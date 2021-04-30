Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp7851lfg;
        Fri, 30 Apr 2021 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW0R8ryR13vjW0q4fD1avu4C/t4xNkkeQPjMGc3SuTH/vf036dDCVt1WuLg3jjRstidE+7
X-Received: by 2002:a17:906:e84:: with SMTP id p4mr3777133ejf.248.1619781702289;
        Fri, 30 Apr 2021 04:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619781702; cv=none;
        d=google.com; s=arc-20160816;
        b=iaTohhpngKHZ+wQGNXN8CWJsI+AZ0L5KRkqUa3dGRjGO//q/fuc2m+VVXUAfKqXBqC
         fPMlKyUaqVJZBGW7Gg466PILHx67DzeAL3aiASuEBPRb2B/1OelNzHIu9sQlDlWvWzYo
         r/jLIFU+gQfC6arYDKA6nU9EVmgnvXdHBZ0Hf5+Ttnw6VODusFrV0t4fBw4ox+zSHofr
         apjtkbwO+y56TFEd2eJxD+ro+FaFMR/G+GjqQfbY8FjcreNY1TM4yA3BpYTAyS75t2lt
         14yx7ha2lpCxhF1YwAjjfT8IF18lgxljRoEHZ2xcY+EPoDwnIl2qjIXkxJXYgs/alCzf
         +3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=f4lI9W48YGze8+hoSLaASvFlUv9fGm1sQpXqoYtZp7A=;
        b=WrN7XhF2dbSNmBp4Zmyb547wasKHCWeHa9Mr0lwSyNe0WOzHct3qr2WiqTjk2f6173
         NrGsR0/e3H701Fiiwgyitw5Ux1MR7rxrIUfOHeka+XiUCNPtUokr8EgTuPRIwyvtgKWN
         hMjep5cJuUDRs/y6PfL9H4Cvd/3w9e70NPkbqkVhqhZ3ohIQ6RkXE9naDhe+wGQISypz
         /dtOBMRr3SaiPaHaGeSDM6hRnD6aI+HkIM1GmFDC+IEyZuwjAGa2FNl35Kq+174qeth0
         412rq4PllJp9Y/h61C95sOf2ayYZ5Nd+BL2aKbGTAH4Kn4B1zAjix2SgC0IHCyB469Fo
         9N3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQA9quZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si3436072ejm.249.2021.04.30.04.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 04:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQA9quZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcRDJ-0002VJ-6h
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 07:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lcQiG-0000zD-Jw
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 06:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lcQiE-0000p9-7x
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 06:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f4lI9W48YGze8+hoSLaASvFlUv9fGm1sQpXqoYtZp7A=;
 b=RQA9quZ0DvatySiIrZ6laGHQXJVhfm0VuNn2I5YgEVA/AzsQyVj43Bgwa/8p5KE4aZGXnY
 fUvTBpXXySWerMULyEm83bocx/AvYW7XG9sVKzNrX6RukgmkbUZL6uXwm2vOHA2Dvkvski
 A+k7jMkQx+FUzr7RhcZ+RYrV2sVAjc8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-HOY7pq01NJS7Ra63Ckp-2A-1; Fri, 30 Apr 2021 06:49:31 -0400
X-MC-Unique: HOY7pq01NJS7Ra63Ckp-2A-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a1cb3020000b029013850c82dbcso704635wmf.5
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 03:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f4lI9W48YGze8+hoSLaASvFlUv9fGm1sQpXqoYtZp7A=;
 b=hEiA3gXNw6J/H5cqc78UikDAZ4WinD0zC+kaoQsXbdZaayj8PNZD0UbqaeCXF/P9Vr
 hZwE16sHuLr4zpPnNoS/W/fEX/9C5L9ddGOGTPDYe85fiAgQNrzARjjiy1YmoJQufwob
 +r8lM+9UXPuWtu4CJ0aKMpvQ8pHlEQvRtzqtgQZbs1e0/LOYgq9eajhazjDlNBs7Y7Tt
 3XOq6/SV875iFgzkhZmMVeKbUBSnaeGmBBI3A/Tf3dm5hf9jp9ot/ImELjHzEwClJUw+
 i+aE7Z1ENVUh1VUIoabkgsyKdnSPIb7UWmrZrv0pODDVsEaDPQcBCJSobWS8H9fc4uK/
 cNRQ==
X-Gm-Message-State: AOAM530qfQe7go9lYzvxBMhLbqTygXVbPmzHz9FVzbIeTjlU5dH8kiVs
 ZlsV3jBQ5z3ufuhGs/M63iw0PGbXpP/apUPlSftov6zQfGYPMksLMNM5ZAvqtApo8thHQ1uGHtW
 sTnzusbxCacVM
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr5913525wrn.281.1619779770488; 
 Fri, 30 Apr 2021 03:49:30 -0700 (PDT)
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr5913496wrn.281.1619779770334; 
 Fri, 30 Apr 2021 03:49:30 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id y5sm1815356wrm.61.2021.04.30.03.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:49:30 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:49:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Message-ID: <20210430104927.do6cxs6yw6yqlq6e@gator.home>
References: <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
 <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
 <20210429071614.lywpbfpeyclqxnke@gator.home>
 <ce557539-ac8f-7245-747b-8212a4857811@huawei.com>
 <20210429110229.7jtz6hfrfvqdkrbx@gator>
 <f5b264ff-58ed-0cd2-3b84-42fa1724b8ac@huawei.com>
 <20210430064125.3b5fjolwqculrjxz@gator.home>
 <20210430070131.kkavbosw27ze4iuh@gator.home>
 <dedb07c3-b6fa-ccb0-9d06-65c7866238db@huawei.com>
MIME-Version: 1.0
In-Reply-To: <dedb07c3-b6fa-ccb0-9d06-65c7866238db@huawei.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +dXSx7pL7yQX

On Fri, Apr 30, 2021 at 05:33:42PM +0800, wangyanan (Y) wrote:
> 
> On 2021/4/30 15:01, Andrew Jones wrote:
> > On Fri, Apr 30, 2021 at 08:41:25AM +0200, Andrew Jones wrote:
> > > On Fri, Apr 30, 2021 at 01:09:00PM +0800, wangyanan (Y) wrote:
> > > > But I think the requirement for ARM "if even one parameter other than cpus
> > > > or maxcpus
> > > > is provided then all parameters must be provided" will be better. This can
> > > > ensure the
> > > > whole accurate users-specified topology. As you mentioned, if anybody who
> > > > bothers
> > > > to specify one, why not also specify the others.
> > > > 
> > > > I can add the requirement for ARM in the documentation, and also check the
> > > > parameters
> > > > in virt_smp_parse. Will this be fine?
> > > We sort of have to support command lines that are missing 'maxcpus' and
> > > 'clusters', unless we work together with libvirt to make the change.
> > > Currently libvirt will generate '-smp 16,sockets=16,cores=1,threads=1'
> > > from '<vcpu placement='static'>16</vcpu>'. That's sufficient for our
> > > stricter, but not completely strict requirements. And, I still think
> > > 'threads' could be optional, because there's a good chance the user
> > > doesn't want to describe them, so a default of 1 is good enough. Also,
> > > given maxcpus, but not cpus, it's pretty obvious that cpus should equal
> > > maxcpus.
> > > 
> > We also still need just 'cpus' or just 'maxcpus' to work, since that
> > already works now. So, at least these should work
> > 
> >   -smp N
> >   -smp maxcpus=N
> >   -smp N,maxcpus=M
> >   -smp N,sockets=N,cores=1,threads=1
> >   -smp N,maxcpus=M,sockets=M,cores=1,threads=1
> > 
> > since they work today, even though no topology is described.
> Yes. I forgot this point that we should consider the compat.
> > If we want to
> > describe a topology for the first three, then we'll have to pick one,
> > which brings us back to the sockets over cores stuff. Or, we could choose
> > to just not generate topology descriptions when none is provided.
> I find that both preferring cores over sockets and not generating topology
> descriptions
> when none is provided can't solve everything. We can only ensure guest will
> get one
> socket with multiple cores with qemu cmdline "-smp N".
> 
> But if we specify N cpus without any other parameters in libvirt xml, a qemu
> cmdline like
> "-smp N, sockets=N, cores=1,threads=1" will be generated, and as a result
> guest will get
> N sockets. In this case, we still can't avoid the silent change.
> 
> So maybe we should just prefer sockets over cores like the general
> smp_parse() and libvirt,
> and let users use "-smp N, sockets=1, cores=N,threads=1" to get what they
> want if they
> use version 6.0 or later.

Rather than doing the preference of sockets over cores thing, let's
require that sockets, cores, and one of maxcpus or cpus are provided,
as we discussed in the other mail.

Thanks,
drew

