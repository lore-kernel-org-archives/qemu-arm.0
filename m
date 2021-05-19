Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1265720lfm;
        Wed, 19 May 2021 01:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyGYFk0DyOyqWmsWaDwQ3lAmXGTgdpe44ZHHvaDvwJ+z/1FN16qh0lOVYMgAhB1h6ppKXD
X-Received: by 2002:a1f:2006:: with SMTP id g6mr2366051vkg.17.1621412132541;
        Wed, 19 May 2021 01:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621412132; cv=none;
        d=google.com; s=arc-20160816;
        b=y8CSf2qbF3yFJvMI8RUR67t9JrzqvftuHTzmk4PMTAEuQyWmTOE8jyCdx9Z5xkCMn0
         j92doPACK9DNE1VcQZWEn5gAk+4HPouU+pcCfuj4OTMHe3VsR/0Bqf9qjGW0/zX7ixMA
         jlMrsozKp2wgshjumAhLFAtM77MlY8/byeEjHP5aj1LU0gepmqZhBYkRDOuRu9ryHahB
         jY5BAqVZ8tMHuLXg0nsYZdR8W254yaGAlxmvzMsxDatOr3gjaZNUUv6E0zkuMhdIthAn
         QHY1VgO9zSM15QhvYxxs9vv06D5XOWRs2vCBowWJVEBKzXNHxcbDG2QMgZ4Rdhbm4xdN
         Iszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=d46HRGTwyKe7dHmhQFZugTDR/zUsSqEV5PcCwV2Wb3I=;
        b=nY/ZavgUUxfCfUWE3ZakFZZc9/LGKe71ZoMTVpVUw+SVnUbjmGLVmN/pQk8kik8FZw
         qMlkSwNLgGUo+0pchVt0whyiZbeE/DTGv0wgxcC4HC2Mtu9D/EuDtaKeCf+KbHlRgce7
         n4xsPV1bbcyzrroZ5DItHEHXesBu1tMFFcBynfhBH2hvDcdOP+E3Rwhe6fD0r6Pr4u5i
         z7cf2gof7z4zjViZX3VokIc89RXYWpps7TQWX9BK1cbcj0dmcZ6tMkSWgUDk0hClhqtQ
         SXB8nw7Q611UzbgUmsXAw4H04LKW7WsO1PY4vT/yTKYqfW+glAVOtmQRhNwaleyjpJsD
         mZRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Rrga+72Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si3080511vsr.92.2021.05.19.01.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 01:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Rrga+72Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljHMZ-0002Pr-JT
	for alex.bennee@linaro.org; Wed, 19 May 2021 04:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHML-0002OO-0P
 for qemu-arm@nongnu.org; Wed, 19 May 2021 04:15:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ljHMI-0008RB-2Q
 for qemu-arm@nongnu.org; Wed, 19 May 2021 04:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621412113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d46HRGTwyKe7dHmhQFZugTDR/zUsSqEV5PcCwV2Wb3I=;
 b=Rrga+72Q/SG9mLCuzHCJP7iaHadxqeBs8aFI1ynoR+dYcVOA6CLDo6q0/GITGjHb4LkQNS
 s9sQIZGKujXdWJ4DuQgdduQUk/wRV3xw8DJG3FRmtzq9/Oy40n3iglGcqV9B46b8Y0oLTU
 lvlkXzYz1iW8z+V5iZ0XpkBse/YKkEw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-jLiB79prOLGvCrAcC2b4tA-1; Wed, 19 May 2021 04:15:11 -0400
X-MC-Unique: jLiB79prOLGvCrAcC2b4tA-1
Received: by mail-ed1-f72.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so6469462edv.3
 for <qemu-arm@nongnu.org>; Wed, 19 May 2021 01:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d46HRGTwyKe7dHmhQFZugTDR/zUsSqEV5PcCwV2Wb3I=;
 b=QMUC9hmWiVN7A4b/WDyxNE3wJa3KKbw9l/P6QXP8MH8M/pqC6uLA5W2ymmXRUpYpt1
 3YJ2Qo7nyGNogEYiDSC+oYBKyINFthZB7CVrRigurX30mejN+B5GhEbcfXiG2Yb3LFaL
 bkfLoSYFoZAzSz/h/Mz64HU/Hbr3Vy7DS6kBdMyvtqaPx9MoY9mGtDnN2+OLFLermQ94
 EAENn8CTQDoCGu6iSv+kH2uFLLSj+ldknfauO+cK2aAoKHyhFlJD2xTUns6N2Cua9fy1
 6am/XBK5Lq3xGA2GVIUF6gAE+sYHn4u7Rer3LlYS4HiKLQjG6T9NhTFAWc8rAabfXCcl
 0PWQ==
X-Gm-Message-State: AOAM532QBywdQnX6zayw77udyx4L7sb18wkz9wb5MYEPsznArccAq/hI
 vr6CNVvU1d/Hn26cOBH8sGUb6vMXldSLWT2op8zw8AwT++Ji85Kwf6noCZLGjw/kzc+k9zfJVZW
 FS8ebTXuQB3/V
X-Received: by 2002:a05:6402:35d4:: with SMTP id
 z20mr12868292edc.164.1621412110578; 
 Wed, 19 May 2021 01:15:10 -0700 (PDT)
X-Received: by 2002:a05:6402:35d4:: with SMTP id
 z20mr12868240edc.164.1621412110253; 
 Wed, 19 May 2021 01:15:10 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id m16sm2161389edq.56.2021.05.19.01.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 01:15:09 -0700 (PDT)
Date: Wed, 19 May 2021 10:15:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210519081507.mnk43k77wbekeany@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
 <b61a7413f98a430685b838eecc2db74f@huawei.com>
 <224d54ac-0c03-afc4-4aec-ea3435aa68e7@huawei.com>
 <f766805215ac439bb988dab02247ec71@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f766805215ac439bb988dab02247ec71@huawei.com>
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
X-TUID: d5MkJdMIR5gg

On Wed, May 19, 2021 at 07:54:37AM +0000, Salil Mehta wrote:
> > From: wangyanan (Y)
> > Sent: Wednesday, May 19, 2021 4:18 AM
> > 
> > 
> > On 2021/5/19 3:22, Salil Mehta wrote:
> > >> From: Andrew Jones [mailto:drjones@redhat.com]
> > >> Sent: Tuesday, May 18, 2021 8:06 PM
> > >> To: Salil Mehta <salil.mehta@huawei.com>
> > >> Cc: wangyanan (Y) <wangyanan55@huawei.com>; Peter Maydell
> > >> <peter.maydell@linaro.org>; Michael S . Tsirkin <mst@redhat.com>; Wanghaibin
> > >> (D) <wanghaibin.wang@huawei.com>; qemu-devel@nongnu.org; Shannon Zhao
> > >> <shannon.zhaosl@gmail.com>; qemu-arm@nongnu.org; Alistair Francis
> > >> <alistair.francis@wdc.com>; Zengtao (B) <prime.zeng@hisilicon.com>;
> > >> yangyicong <yangyicong@huawei.com>; yuzenghui <yuzenghui@huawei.com>; Igor
> > >> Mammedov <imammedo@redhat.com>; zhukeqian <zhukeqian1@huawei.com>; lijiajie
> > (H)
> > >> <lijiajie11@huawei.com>; David Gibson <david@gibson.dropbear.id.au>;
> > Linuxarm
> > >> <linuxarm@huawei.com>; linuxarm@openeuler.org
> > >> Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
> > >>
> > >> On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
> > >>>   Those benefits, when vcpu pinning is used, are the same benefits
> > >>>> as for the host, which already use PPTT tables to describe topology, even
> > >>>> though hot plug isn't supported.
> > >>> yes sure, you mean pinning vcpus according to the cpu topology for performance?
> > >> Yup
> > > Already Agreed :)
> > >
> > >>>> Now, if you're saying we should only generate tables for smp.cpus, not
> > >>> Correct. This is what I thought we must be doing even now
> > >>>
> > >>>> smp.maxcpus, because hot plug isn't supported anyway, then I see your
> > >>>> point. But, it'd be better to require smp.cpus == smp.maxcpus in our
> > >>>> smp_parse function to do that, which we've never done before, so we may
> > >>>> have trouble supporting existing command lines.
> > >>> I am trying to recall, if the vcpu Hotplug is not supported then can they
> > >>> ever be different?
> > >>>
> > >>> cpus =  (threads * cores * sockets)
> > >>>
> > >>> static void smp_parse(MachineState *ms, QemuOpts *opts)
> > >>> {
> > >>>       [...]
> > >>>
> > >>>          if (sockets * cores * threads != ms->smp.max_cpus) {
> > >>>              warn_report("Invalid CPU topology deprecated: "
> > >>>                          "sockets (%u) * cores (%u) * threads (%u) "
> > >>>                          "!= maxcpus (%u)",
> > >>>                          sockets, cores, threads,
> > >>>                          ms->smp.max_cpus);
> > >>>          }
> > >>>       [...]
> > >>> }
> > >>>
> > >>> Although, above check does not exit(1) and just warns on detecting invalid
> > >>> CPU topology. Not sure why?
> > >> Hmm, not sure what code you have there. I see this in
> > >> hw/core/machine.c:smp_parse
> > >>
> > >>          if (ms->smp.max_cpus < cpus) {
> > >>              error_report("maxcpus must be equal to or greater than smp");
> > >>              exit(1);
> > >>          }
> > >>
> > >>          if (sockets * cores * threads != ms->smp.max_cpus) {
> > >>              error_report("Invalid CPU topology: "
> > >>                           "sockets (%u) * cores (%u) * threads (%u) "
> > >>                           "!= maxcpus (%u)",
> > >>                           sockets, cores, threads,
> > >>                           ms->smp.max_cpus);
> > >>              exit(1);
> > >>          }
> > >>
> > >>> Well if you think there are subtleties to support above implementation and
> > >>> we cannot do it now then sure it is your call. :)
> > Hi Salil, Drew,
> > >> The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
> > >> it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
> > >> we're proposing that it should. Maybe we can start erroring out when
> > >> cpus != maxcpus until hot plug is supported?
> > > Agreed, both don't make any sense if hotplug is not supported and ideally should
> > > fail with error. We should block any such topology configuration.
> > In the ARM-specific function virt_smp_parse() (patch 9), there already
> > have been some restrictions for the given -smp configuration.
> > We now only allow:
> > -smp N
> > -smp maxcpus=M
> > -smp N, maxcpus=M
> > 
> > -smp N, sockets=X, cores=Y
> > -smp N, sockets=X, cores=Y, threads=Z
> > 
> > -smp maxcpus=M, sockets=X, cores=Y
> > -smp maxcpus=M, sockets=X, cores=Y, threads=Z
> > 
> > -smp N, maxcpus=M, sockets=X, cores=Y
> > -smp N, maxcpus=M, sockets=X, cores=Y, threads=Z
> > 
> > and disallow the other strange and rare formats that shouldn't be provided.
> > 
> > It's reasonable to block the topology configuration which is not useful
> > currently. I will add the requirement for "cpus==maxcpus" in this fuction
> > if the possible conflict with existing command lines is not a big problem.
> 
> Hi Yanan,
> Makes sense. I did see your other patch-set in which cluster support has been
> added. Are we deferring that too?

The merge of that needs to be deferred, but for a different reason. It
shouldn't impact hot plug, because if hot plug doesn't like clusters,
then one could configure a topology which doesn't have clusters. But,
it can't be merged to QEMU until the kernel has merged its support.

Thanks,
drew

