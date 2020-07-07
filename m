Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp790273lfm;
        Tue, 7 Jul 2020 03:05:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu68x7EKf3egh0niFmpl2+xa8DE4pSJcS6KLUPc6KFh0ojRgnJ5Tocx5TaTFN48voNQ8ZO
X-Received: by 2002:a25:2393:: with SMTP id j141mr23390438ybj.409.1594116306786;
        Tue, 07 Jul 2020 03:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594116306; cv=none;
        d=google.com; s=arc-20160816;
        b=JSQZXWymhIC8obBFI7g12hURy8S6nI/lYoCSbRLY97sL95lqAiOXai1itLiMYX1oMD
         TJ/atw1dRIH7OL5X4taVaZwTVX/BB/C4z16NDx/1Iil1ZCFTX3PYTWe/cyHONpolb2NV
         ibmA7OK0rtzPN0JS2w0/AFI1dGKULFhIam8U1aXpCmNhyoDaUFhQGTAZ2CWIEJP8Dun7
         oglfifQmCaJSq/c5hovVQxuzgmebq4a8j9OFX8UE1YaiCWdRIwSESGqrM+rwdqIekp3N
         VA7AHBQm2uxbBKppUxzONe3D1YhHh3ssU8Pw7/ZKzABqWFyxIveASo0j1EX4z2lkDS6r
         Nw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=rkbR018ikHVeo7/9dyvz4wLIubLeaeSzWqnHOFTBsO8=;
        b=FoXFfhUGljQc4NwYJd4SR0L9OALomVBkGgj5s+IFatKJcovBruChS4mUXHAKTC44lZ
         /frtAhYcFTJNTS9Lvb84EKaLWdRU/fF5c2MOFPNrqqmBcVmxHv1mLwVmFyH9aPZ4x5XO
         234Ph0xFef3jCALR4A4btpaxZOTDG3SOHk7wOy7lbkXTDkKjMiHvEaTDvYrJ0/8rdibD
         Jna2EBmDEZtZN6fvkMrEDmHMjg8MIsWlRQ+qSa6hEE2Dzc/Mez8DfYJaDBg7TKQhtlx1
         SFBPxIHSoLFHY2NybDwHMaE+32vGX1skxYlfP2fNyjWLyosiyje+vK4mzdRVYNr7fn/x
         rYLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=anlpyjtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i145si19170ybg.280.2020.07.07.03.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 03:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=anlpyjtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jskTK-0004XA-5t
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 06:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jskTB-0004WX-OF
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 06:04:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47324
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jskT9-0008Vf-99
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 06:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594116290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkbR018ikHVeo7/9dyvz4wLIubLeaeSzWqnHOFTBsO8=;
 b=anlpyjtv4x3hsazAPVpISh1kqJzYT3S6VzuNWM50EQE4duBrglsubQ3VUYY/9R7eJcANst
 FqLu3s9Q2bEGmy3fEDBXYKtJ8r2jGiPMkEiAdoniXRufdDhChXTEQkk1SaXt8nM37WIs4A
 Myl+u1v8DfYiu6lXN5z2afZBqF83rUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-NuYVgZ2zOS-CapPihf_R4g-1; Tue, 07 Jul 2020 06:04:46 -0400
X-MC-Unique: NuYVgZ2zOS-CapPihf_R4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40E24800C64;
 Tue,  7 Jul 2020 10:04:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B12185C1B2;
 Tue,  7 Jul 2020 10:04:39 +0000 (UTC)
Date: Tue, 7 Jul 2020 12:04:36 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] virt/acpi: set PSCI flag even when psci_conduit is disabled
Message-ID: <20200707100436.72ldilqrnwc7pg55@kamzik.brq.redhat.com>
References: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
 <CAFEAcA8RU6fS8PX7LMhn4U33nKoRvcO_mnyBFcmW3iOpA40sCQ@mail.gmail.com>
 <00016872-f1ca-5989-8ad6-28cf05ea0c57@linux.alibaba.com>
 <CAFEAcA-eyudHSQhEaM-G5hpVOqEG4G_kZpT=vjraciux-7P7Bw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-eyudHSQhEaM-G5hpVOqEG4G_kZpT=vjraciux-7P7Bw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: yitian.ly@alibaba-inc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cy+2XC/Yk6Lr

On Fri, Jul 03, 2020 at 03:41:05PM +0100, Peter Maydell wrote:
> On Fri, 3 Jul 2020 at 15:36, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
> >
> >
> > 在 2020/7/3 下午6:37, Peter Maydell 写道:
> > > On Fri, 3 Jul 2020 at 10:44, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
> > >> vms->psci_conduit being disabled only means PSCI is not implemented by
> > >> qemu; it doesn't mean PSCI is not supported on this virtual machine.
> > >> Actually vms->psci_conduit is set to disabled when vms->secure and
> > >> firmware_loaded are both set, which means we will run ARM trusted
> > >> firmware, which will definitely provide PSCI.
> > >>
> > >> The issue can be reproduced when running qemu in TCG mode with secure
> > >> enabled, while using ARM trusted firmware + qemu virt UEFI as firmware
> > >> binaries, and we can see secondary cores will not be waken up.
> > > If you're using a real EL3 guest firmware then it's the job of
> > > the guest firmware to provide a DTB to the guest EL2/EL1 that says
> > > "and I support PSCI" if it supports PSCI, surely? QEMU can't tell
> > > whether the EL3 code does or doesn't do that...
> >
> > Thanks, Peter. Does that mean the ACPI tables generated in qemu are only
> > templates and firmware should update them if necessary?
> 
> I don't really know enough about ACPI to say. I hadn't noticed
> that this patch only updated the ACPI tables, sorry. Perhaps it
> is correct; Andrew will probably know better than me.
>

This seems a bit messy to me. With an EL3 firmware, the DTB is provided
by the EL3 firmware. I guess that's why when I look at the DTB generation
in virt.c we don't properly set "enable-method" of the CPUs to
"spin-table", even though we don't set it to "psci"[*]. However, if the
EL3 firmware isn't providing the ACPI tables too, then how do the DTB
and ACPI tables stay in synch? We can't be sure that just because we
have (vms->secure && firmware_loaded) that we should / should not
generate certain ACPI table entries when we don't also know what the
corresponding DTB will be.

So, I think the EL3 firmware should also provide the ACPI tables.
However, this patch it probably fine too. For a configuration where
the EL3 firmware provides the ACPI tables, it will do no harm. For
configurations where EL3 firmware isn't involved, it will do no harm.
And, for configurations like this, which I consider a bit hacky, it's
probably better to assume PSCI than not.

Thanks,
drew

[*] kernel doc Documentation/devicetree/bindings/arm/cpus.yaml says
    "enable-method" must be "spin-table" or "psci"

