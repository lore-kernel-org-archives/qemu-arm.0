Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp693838lfm;
        Tue, 18 May 2021 12:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2ylFws76vXhvXNNk0J4EiUoljIuXxa2wEDWlJf9XxCqdTJ35LytFxD9BAtW9ruGS4ZDOi
X-Received: by 2002:a92:6b05:: with SMTP id g5mr5817869ilc.40.1621364854302;
        Tue, 18 May 2021 12:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621364854; cv=none;
        d=google.com; s=arc-20160816;
        b=yfy3vhud922XZWIJfwUoCavaRueFwEPOHyUIktbCSO0wUbR8qExgmbP0aZMJ0UZ3T2
         twW64KClyBoge3os0ybHRfT/aiQegt5b35Z0opnxnaj+OEV8h720j3KwnjFDK+koG6m8
         Rksil/4jUkZE7vix49sXxpBS7sKW+qMZVcopnvi+8dQB4h17IldrfxLeIxd40G+BYfhE
         /gPObGxIWtGy+nT32ORlvRZswncO+3otZ7mngO/k4rcB4sBnuHQaQ/30uAcuvt27v7wC
         bLSB7q2G3iTD6HD3O4Ldf07m0vVwGeX1nD9u+U/qMnI8uEzZegSSyJtSumrpoYWXdCmP
         7Org==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=7TzBgPovcNpObbvKEKQ0BJgkB7MW43xUbKh9QiC5KtA=;
        b=NvDnskSWc02fYIfT1DfaYRiWPc57hSSGpxlXRvjX6+YO0+hS040TZmGDx99Vak3Mle
         q+iT7XNPf40ZEXffx0pfHiNSxm6W04o7O5QjV6f7rN6r8JsGnnXtFJQXCKp3xV36RCwl
         3nltSv1VD+lD3obQXAiJL/9itR272LkknxlynUjZrwbZZ0sokS3MMzFcvYxjHzUHS39d
         en6xThcIaUZ4MOQHwCy0JioJS8XRcjb2tZe/TauB78cJmncEHC5Cykz2BTVDaZ/rp2O2
         bruQ1W6S1MRDIB7cR5prnrxsdC4YghzartokTGz7CC8TrmSyDsG97YjTDUj7lqXrPF9r
         nnyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CVW+igSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si24305066ilv.74.2021.05.18.12.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CVW+igSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj541-0002aG-Gl
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lj52P-0007NH-4R
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lj52N-0007SA-Fj
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621364750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7TzBgPovcNpObbvKEKQ0BJgkB7MW43xUbKh9QiC5KtA=;
 b=CVW+igSsNbsrFxS4kFMe4ggjga64AzZLoCTJ1zoPgOHxca3d6eWezefBKU9WVtZ2VLknmM
 LCSKQN77dWwH66yHtLSTxlmRCJh3cjEzeUUgrZshU7BT5bOZ5WahX+s3xwSdH3yGuvw0ad
 3yuaqsuUywqmEQbFHN/O5wV5veeXxP8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-n-ky4bXCONu1_R78m0EJ6A-1; Tue, 18 May 2021 15:05:44 -0400
X-MC-Unique: n-ky4bXCONu1_R78m0EJ6A-1
Received: by mail-ej1-f72.google.com with SMTP id
 bi3-20020a170906a243b02903933c4d9132so2784509ejb.11
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 12:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7TzBgPovcNpObbvKEKQ0BJgkB7MW43xUbKh9QiC5KtA=;
 b=EGepDXOve9EU/+fzDBm2rU8RhsoA0x1DN5M3aqDTT3/APkW2I/yjUnVWKl0hiyA18N
 Ax7bKuWCkZInrcnLucRt/G+XTr6DgZvSw+NztWuIYi6AHIca6Dw3roUSmxQliaQnitdB
 btvWRS/Z8ik5DvUG+7bpZ+QmkaEKl+VmXDQYdKl5OXC/eQBGhKk5IOhs+02swBUQFBLp
 lvePstuni9mvVxjwMD9nhvRK1666N3AlznNW1D7i7EDkSlbglqB5UUOxcn1XuKca1Rp+
 WLMLDisawPDw+k3oWd1xYwANcl7bBzENpiOjaem64cyUiHi3IX6a4u7+B2V8nQ1nKPGk
 bCyg==
X-Gm-Message-State: AOAM5314uAKrjR4EuRQg0K0LU83VDAlEkh0m7HZqNBUt1KPzkDo6oZOt
 Q13i6OdPVjWUHNzUrFyho09HLUEGbQuWe5FfYTy52MC2VI6mj8JKftzzYU945OP2t5U2+DcJ6SP
 ymVog+EhafaoX
X-Received: by 2002:a17:906:7203:: with SMTP id
 m3mr7411918ejk.381.1621364743092; 
 Tue, 18 May 2021 12:05:43 -0700 (PDT)
X-Received: by 2002:a17:906:7203:: with SMTP id
 m3mr7411885ejk.381.1621364742813; 
 Tue, 18 May 2021 12:05:42 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id e6sm1768689ejd.31.2021.05.18.12.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:05:41 -0700 (PDT)
Date: Tue, 18 May 2021 21:05:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
MIME-Version: 1.0
In-Reply-To: <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-TUID: Wbo03b0mK4W8

On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
>  Those benefits, when vcpu pinning is used, are the same benefits
> > as for the host, which already use PPTT tables to describe topology, even
> > though hot plug isn't supported.
> 
> yes sure, you mean pinning vcpus according to the cpu topology for performance?

Yup

> 
> > 
> > Now, if you're saying we should only generate tables for smp.cpus, not
> 
> Correct. This is what I thought we must be doing even now
> 
> > smp.maxcpus, because hot plug isn't supported anyway, then I see your
> > point. But, it'd be better to require smp.cpus == smp.maxcpus in our
> > smp_parse function to do that, which we've never done before, so we may
> > have trouble supporting existing command lines.
> 
> I am trying to recall, if the vcpu Hotplug is not supported then can they
> ever be different?
> 
> cpus =  (threads * cores * sockets)
> 
> static void smp_parse(MachineState *ms, QemuOpts *opts)
> {
>      [...]
> 
>         if (sockets * cores * threads != ms->smp.max_cpus) {
>             warn_report("Invalid CPU topology deprecated: "
>                         "sockets (%u) * cores (%u) * threads (%u) "
>                         "!= maxcpus (%u)",
>                         sockets, cores, threads,
>                         ms->smp.max_cpus);
>         }
>      [...]
> }
>   
> Although, above check does not exit(1) and just warns on detecting invalid
> CPU topology. Not sure why?

Hmm, not sure what code you have there. I see this in
hw/core/machine.c:smp_parse

        if (ms->smp.max_cpus < cpus) {
            error_report("maxcpus must be equal to or greater than smp");
            exit(1);
        }

        if (sockets * cores * threads != ms->smp.max_cpus) {
            error_report("Invalid CPU topology: "
                         "sockets (%u) * cores (%u) * threads (%u) "
                         "!= maxcpus (%u)",
                         sockets, cores, threads,
                         ms->smp.max_cpus);
            exit(1);
        }

> 
> Well if you think there are subtleties to support above implementation and
> we cannot do it now then sure it is your call. :)

The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
we're proposing that it should. Maybe we can start erroring out when
cpus != maxcpus until hot plug is supported?

Thanks,
drew

