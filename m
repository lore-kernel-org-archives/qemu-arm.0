Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2648115lfy;
        Mon, 27 Jul 2020 01:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYbO1xa2nIyJbuPIie+TK6cc44a6alPB+ZPxbTlhxkONgRYClN4Ig0n7sF8Ja+CA5Ngi07
X-Received: by 2002:a25:6dd5:: with SMTP id i204mr32047438ybc.319.1595838855526;
        Mon, 27 Jul 2020 01:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595838855; cv=none;
        d=google.com; s=arc-20160816;
        b=PTvSPy1NclGc4RIamzEme8jLHWLcSYl3AAeoBbBthM/r0NtAcmLYVGp81shELjhGyR
         wlZ+dCg8IYpjtHVEtOVvEzbcDp9ozwvFUCp0PXof4US2wAFd6aomIIiB58XBuADXtmTm
         L58DVS89jSYx34gDNUU8xQhpPK91S1FimRIDLaiThNqvZS6HHIeei2JZj1TMkrThyAt9
         orZjXOSBq5N3qqXk5xQ/gaZxcfXiYrMHZaj2BE9sb/SdQDDzecDcfoMDx4eeWJWmKci/
         YvvK7aSQJd/nvlfiIOQ+pTaX5ysR2iOETVzI4M6LMmZSjKrqg0je47qcHql/IR2JKne4
         zI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=vxAC7kiFS016cETpwk1rOgUT+R9geqEOY153JJ+pd38=;
        b=R7Y4fI1118mbZQClpDmDynIhTGSEZYWGco0beoapyEGvN+gL6kOcF6b+ZsXuVg2CMS
         mGDUVe76jp3qpTC9T7Ln4huIDQfq1fxKaFEwegm0xLrko9lGPbq6fAWzoGH5TC8pFq7R
         JHTQ49BqgO0jhV1Te8CpGeY5OM3HQuPjb+bUMMBzBgXT1nXMeZ563pNMGgElb5pnzDTE
         lOaErWV+ztY+ih7SabMhej4EX+XhH5L3xrdK2f+VR0NU13FzfNOxwTm/No4bnRI+Dxdj
         Q2QDGsD10FG+ZKBAudya9+kRS6bj+LNxlgXTixoaAsWKpPiyCRbGwzuIfOZyo5OifHRo
         n3eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fA7AcBtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si9938464ybk.185.2020.07.27.01.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 01:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fA7AcBtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jzyaM-0003s1-Sw
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 04:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jzyaF-0003ro-Pe
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 04:34:07 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41048
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jzyaE-0005Bz-9u
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 04:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595838845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vxAC7kiFS016cETpwk1rOgUT+R9geqEOY153JJ+pd38=;
 b=fA7AcBtlNRS/nGwE5C/BocJ3akfp9nnMd6gKrWoZ/lhgncUaPQBI3StDRlUUPThpRYiqPs
 +1nriIObnzGSg2COaPwTQJ+7nE1iJ/bA1yK5RkEkxH9cun7KUVZ6pkaJP7lAb+vNBFtZsx
 SUPtdGeb+YwZ/2zxK+Lamk7ukTkQY+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-GZ56-Ia_NQGkn41QPapVmw-1; Mon, 27 Jul 2020 04:34:01 -0400
X-MC-Unique: GZ56-Ia_NQGkn41QPapVmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70B4B800468;
 Mon, 27 Jul 2020 08:34:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32D3560BF4;
 Mon, 27 Jul 2020 08:33:59 +0000 (UTC)
Date: Mon, 27 Jul 2020 10:33:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] hw/arm/virt: Introduce kvm-steal-time
Message-ID: <20200727083356.6pr6f5ph5wh2aev6@kamzik.brq.redhat.com>
References: <20200711101033.47371-1-drjones@redhat.com>
 <CAFEAcA_F_zJESdsZbsQaD+SLN5HDuL1x9Z=YrxC9kXw1XGvrcg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_F_zJESdsZbsQaD+SLN5HDuL1x9Z=YrxC9kXw1XGvrcg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 03:37:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Beata Michalska <beata.michalska@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 57guUak4wx0G

On Mon, Jul 20, 2020 at 11:16:41AM +0100, Peter Maydell wrote:
> On Sat, 11 Jul 2020 at 11:10, Andrew Jones <drjones@redhat.com> wrote:
> >
> > KVM supports the ability to publish the amount of time that VCPUs
> > were runnable, but not running due to other host threads running
> > instead, to the guest. The guest scheduler may use that information
> > when making decisions and the guest may expose it to its userspace
> > (Linux publishes this information in /proc/stat). This feature is
> > called "steal time" as it represents the amount of time stolen from
> > a guest by scheduling out its VCPUs. To enable this feature KVM
> > userspace must provide a memory region that will be used to publish
> > the information to the guest. The memory region is typical migratable
> > region. The GPA of the region is given to KVM through a VCPU device
> > ioctl interface. This feature is only available for 64-bit hosts
> > running 64-bit guests.
> >
> > This series provides the QEMU support of this feature. It will
> > be enabled by default for 5.1 machine types and later, but may
> > be disabled with a new CPU property "kvm-steal-time".
> 
> Just a note that this has missed 5.1, but I'll review it at
> some point for 5.2.
>

Yup. No problem. I was out on vacation all last week, so there wasn't
a chance for me to follow up until now anyway. Thanks for the review.
I'll get to the responses / respinning tomorrow after I dig out of my
email backlog.

drew

