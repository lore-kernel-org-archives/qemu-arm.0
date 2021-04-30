Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp211200lfb;
        Fri, 30 Apr 2021 00:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN0fB3tG40CAhLBkaWQwLAuU4GHLiJN21/SefYpcoDhrvBJF3OSTHfEFrehERYqvyR45X+
X-Received: by 2002:a05:6402:4243:: with SMTP id g3mr3982776edb.351.1619766235379;
        Fri, 30 Apr 2021 00:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619766235; cv=none;
        d=google.com; s=arc-20160816;
        b=rswXlS/CPHNB+onlFpcGMStMRIe3cuRvHbVi4ljDUoWGfHIqScAUQj58793EjS9PkH
         L+hlVIpM3UdNMRMLntcRJ6ewmTKb4s1IxfR5GfoUmfNrgkZemQpFJG7Ch+Q0Vrx+1h7x
         r/hTF7zyynxB2KWfEruwh2KLMuvqrvpP3NyWt8z+h1JsINPQx5Yufoic6CrLL0sLs6UK
         vUwUrMoRxuibK2E1PeT7FJVuly+sAJ/3/80WQoryQQp6UheQhIp+9+Uj6Vgo0RQOdj1C
         K5kEH81M3XDOciQcBs1h6d/bRBBVnfISwwVmV4x9oPe1Rlwu+J0DVMNfbpBzpH7bC5Zi
         mPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=qIOdlNR064n6xe8x2QLomuSxZK95yEibhQd0cZb8ThE=;
        b=PbdIa78pUDVokRS3z6BNHK97nukxkjijq1oH0PD4yLw4cRzCQjfYMwvFlY+H2LMZNI
         BoQDihchMq0ZDP2HXmEx55mbAGglGWTKWczjhKrXUmCamUnMFZmqOC04Am4BDoFNaXhF
         3gNe5E2JtdPmdeDMDPC2wE5cBAmCi0pJvZLhMpYaogLzRDR0SliU0UNFqVjmlUuunlH/
         CqqhIN8z6Ke8Khpbk7TwBCiu0Z4GjyiLsZwl/WTUrtn/MeHAwQ2YJu1M7jl9qfWdtKQ3
         AuNtyFUcic42q6ymbqD6fG2mmBHTlcLMs4gY9ArNEpk2ou75HRfcqClelH2dI4isQQ+g
         GM+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KzQa4z08;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si986782ede.481.2021.04.30.00.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 00:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KzQa4z08;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcNBq-00005Z-FB
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 03:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lcN9h-0006KU-JY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lcN9e-0002KK-QF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619766098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qIOdlNR064n6xe8x2QLomuSxZK95yEibhQd0cZb8ThE=;
 b=KzQa4z089/ie0eR58bV91Nx4J5kc8HJzTwQW271fJffOeDG0uYnpEBGICurZgileF7D0zC
 pvzGH3eX85CcbP6UMhDU2wInJG5/SZUEG2Fhy1Nb36HYDPUYZakngY5qWLsyojsPt29IvJ
 qnJaCZZac/qfG3QYRTS2RADPx/+RGpc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550--ofb6KzQOUmOQFp5p-0DHQ-1; Fri, 30 Apr 2021 03:01:35 -0400
X-MC-Unique: -ofb6KzQOUmOQFp5p-0DHQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 o4-20020a0564024384b0290378d45ecf57so30063901edc.12
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 00:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qIOdlNR064n6xe8x2QLomuSxZK95yEibhQd0cZb8ThE=;
 b=tLURHb5zXRWR8IOneZiQRBb6rQS782g/5s8x3MvPB5peA5ETDqS6zFBHDtLD2iZ329
 Itfcp7NMZ+7iCpJCvqZfG3WcLqHMDFOGoN6ZCyKvt7ei4Hlyn+Gbgr9BpYDXxmix/+Ri
 aQQSImZ3sJg8rV2/LYBfmTytAGWDn5+kdbU04XLcxz8IpYbu5iF9Ue5BpeqTCEfjZs0C
 WNDeZlS1KU94vSVGyLLG0b1xNs6MUdt04zUpozzPj77AY4mtqMnZHwmczyDeEy4iEATt
 qKYh1YfziWblYMcpguu1VWFRqoqyVV5Lxr+R+m3yxMOihRbHqFYfjnYUQhmGH5fMXa9s
 GpOQ==
X-Gm-Message-State: AOAM531V3jWe+CNxG5soZpNL3BcO5715/9SGVJHcKYc0oHeitvIZ6Aoc
 r49W5LGqaI0M/O9p01d59tnI2tLMiwPMxo4OLnNn+0Swu2PuKHaVqQgr8TIPCSr9plvmFzsxOKY
 QwIZ2on/4jkJjNbo=
X-Received: by 2002:a17:906:ae8f:: with SMTP id
 md15mr2693348ejb.244.1619766094714; 
 Fri, 30 Apr 2021 00:01:34 -0700 (PDT)
X-Received: by 2002:a17:906:ae8f:: with SMTP id
 md15mr2693316ejb.244.1619766094537; 
 Fri, 30 Apr 2021 00:01:34 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id w6sm1350600eje.107.2021.04.30.00.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:01:34 -0700 (PDT)
Date: Fri, 30 Apr 2021 09:01:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Message-ID: <20210430070131.kkavbosw27ze4iuh@gator.home>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
 <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
 <20210429071614.lywpbfpeyclqxnke@gator.home>
 <ce557539-ac8f-7245-747b-8212a4857811@huawei.com>
 <20210429110229.7jtz6hfrfvqdkrbx@gator>
 <f5b264ff-58ed-0cd2-3b84-42fa1724b8ac@huawei.com>
 <20210430064125.3b5fjolwqculrjxz@gator.home>
MIME-Version: 1.0
In-Reply-To: <20210430064125.3b5fjolwqculrjxz@gator.home>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQ6XeRBuDnzw

On Fri, Apr 30, 2021 at 08:41:25AM +0200, Andrew Jones wrote:
> On Fri, Apr 30, 2021 at 01:09:00PM +0800, wangyanan (Y) wrote:
> > But I think the requirement for ARM "if even one parameter other than cpus
> > or maxcpus
> > is provided then all parameters must be provided" will be better. This can
> > ensure the
> > whole accurate users-specified topology. As you mentioned, if anybody who
> > bothers
> > to specify one, why not also specify the others.
> > 
> > I can add the requirement for ARM in the documentation, and also check the
> > parameters
> > in virt_smp_parse. Will this be fine?
> 
> We sort of have to support command lines that are missing 'maxcpus' and
> 'clusters', unless we work together with libvirt to make the change.
> Currently libvirt will generate '-smp 16,sockets=16,cores=1,threads=1'
> from '<vcpu placement='static'>16</vcpu>'. That's sufficient for our
> stricter, but not completely strict requirements. And, I still think
> 'threads' could be optional, because there's a good chance the user
> doesn't want to describe them, so a default of 1 is good enough. Also,
> given maxcpus, but not cpus, it's pretty obvious that cpus should equal
> maxcpus.
>

We also still need just 'cpus' or just 'maxcpus' to work, since that
already works now. So, at least these should work

 -smp N
 -smp maxcpus=N
 -smp N,maxcpus=M
 -smp N,sockets=N,cores=1,threads=1
 -smp N,maxcpus=M,sockets=M,cores=1,threads=1

since they work today, even though no topology is described. If we want to
describe a topology for the first three, then we'll have to pick one,
which brings us back to the sockets over cores stuff. Or, we could choose
to just not generate topology descriptions when none is provided.

Thanks,
drew

