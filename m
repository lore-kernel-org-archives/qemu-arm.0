Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2669913lfb;
        Fri, 27 Nov 2020 10:21:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSydN43qs4SbQhYA2b8ztqdJ+qL9F1K1gcos9GwjcLS7GgR7E9lJKVak2Hn3dyXTVpUmsF
X-Received: by 2002:a25:c6d5:: with SMTP id k204mr12542103ybf.363.1606501283813;
        Fri, 27 Nov 2020 10:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606501283; cv=none;
        d=google.com; s=arc-20160816;
        b=oOqvzYfoe0LAZFmi+/7zruIJJp4B0+0UhMdpqnjdp5mgF5AMCBQDbmaz3TfLyXR43j
         3UYiYEN31kv43Zh2HQKP5SW+3FrOs/2nlp9bzql01gxyHcgj2MjAS057JXkVgVpLX5ir
         VzjOT2amuKNoizhufj6aHlctDVQNCfr67AXFyjy3KGbtaNYg2TmRARIHIW8P7GIfnZ/w
         nV2ttuijVBu6n7a40bOPb/L/eeWTMGqFD7WrJIj4M7UHS0eAwaEbGSHC7sEymkDaj14O
         qfTYH10VYlYK+Y+TyCwavht3QrznkbQpN3c7aNNVOmmEeRPh3JZ1E3kuERCaGsRCYLd6
         Gq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XRUu1ujYdL5L648exhpLxJs8pk5t7z5sXWcH0+n9S54=;
        b=hoKeaiDmf38nyDrr/Kuv01M+yjocmjIgcAiNXW+bi3UUEuKEPDuUl3E21GDQlV2Q+N
         RWan3/Xh8QuMQP4l+R9V12AuO+tkw/ZNzIDxwF9wnAZoH1gRyh1ljHvW7+Tl1Hc00nKF
         uKCgE7dfAnm4F8OyrdqdB/GmUXt/KxIxlPX1NHlCgads/WkhvwExlzkJiz8CvDal9nCs
         L0Xrcc14fbHWpCqwj86mYma+2igTwMxotRdM38JkzixYyf2JponU4T5O99dY3zRukMo2
         Z89XOr6kYGBy46gafeke6uvHbfieZrlGrZNW52fWOw7HK4MCuRYnpx/1Qb8tU8rq9n+/
         lUpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Jutm+lBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si10315807ybe.280.2020.11.27.10.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 10:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Jutm+lBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiiN1-00023s-0H
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 13:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiiMS-00022M-IP
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 13:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kiiMO-00043E-O9
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 13:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606501242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRUu1ujYdL5L648exhpLxJs8pk5t7z5sXWcH0+n9S54=;
 b=Jutm+lBEU/uO4LwXObuntBm7GYPBRPgIsYMG4jU7MkWMUgJ061kPgZmQOlIR6l8cDkMXKm
 se2xjsu8JXL3xvsw7fOHrBlvvEgGYpuWPy+0PwldPCcIBZI5dNQdumiA6al07oFyaR1thW
 lVDqqNSVh7Fy9Wi4B1o8phSnH6aP7dY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-2m8OR-lgMeC9f3HDqcQa4g-1; Fri, 27 Nov 2020 13:20:39 -0500
X-MC-Unique: 2m8OR-lgMeC9f3HDqcQa4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9768100B724;
 Fri, 27 Nov 2020 18:20:37 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AEC060BF1;
 Fri, 27 Nov 2020 18:20:36 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:20:36 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201127182036.GF2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <20201127164708.GZ2271382@habkost.net>
 <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
 <20201127171757.GB2271382@habkost.net>
 <CAFEAcA8D3SUMvxXU4RRYxeBAsywRfAvaFhSToJ1jcrH8bn+-4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8D3SUMvxXU4RRYxeBAsywRfAvaFhSToJ1jcrH8bn+-4Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9d7sn/+ebDsg

On Fri, Nov 27, 2020 at 06:16:27PM +0000, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 17:18, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > Thanks!  Is the data returned by kvm_arm_get_host_cpu_features()
> > supposed to eventually affect the value of id_aa64mmfr0?  I don't
> > see how that could happen.
> 
> kvm_arm_get_host_cpu_features() does:
>         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
>                               ARM64_SYS_REG(3, 0, 0, 7, 0));
> 
> which is filling in data in the ARMHostCPUFeatures* that it is
> passed as an argument. The caller is kvm_arm_set_cpu_features_from_host(),
> which does
>  kvm_arm_get_host_cpu_features(&arm_host_cpu_features)
> (assuming it hasn't already done it once and cached the results;
> arm_host_cpu_features is a global) and then
>  cpu->isar = arm_host_cpu_features.isar;
> thus copying the ID values into the "struct ARMISARegisters isar"
> that is part of the ARMCPU struct. (It also copies across the
> 'features' word which gets set up with ARM_FEATURE_* flags
> for the benefit of the parts of the target code which key off
> those rather than ID register fields.)

Thanks!  For some reason I missed the line above when grepping
for id_aa64mmfr0.

-- 
Eduardo

