Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp422485lfp;
        Tue, 28 Jan 2020 04:42:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbTKXntx+ALruSZJ2pEzXute17g77qRWy9cKs71sXDC2T/gIJ25JE/khwpioiBVIqSbtsP
X-Received: by 2002:a37:78c2:: with SMTP id t185mr21434726qkc.361.1580215327793;
        Tue, 28 Jan 2020 04:42:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580215327; cv=none;
        d=google.com; s=arc-20160816;
        b=Ci17GW9yMnzZU6mrJ8A70hDRbkCfTqSqDjEi8qeSu34L1OvEKz30bf+HT+YpXGgBTn
         UZKWC6gfabAN88mXRof83k+uWSyLOyXWTnpXraJiPIrGvy6hYRhp4AsfMH5cvSUVwm+/
         mDKsD99rixqaMkkEovdZ+AmOVzpgBRFQPxFl/vZtrwKLIqNrJBhl/mzzPpW2tSxzxoDm
         CMFEdATKTyzq5Qptw4Ud4UbrWLCgdhqfblc//dydQ1BLLFHwoVVoyaqBWUiimYsmnXc/
         kmZ/CRLls9VWj+v4HgkLdwYrGGPgrjRLTQr5fEMt4BNlTIZiS0dA2laPTML0ohwbXbBD
         aLkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=rYU23pZAEhqMTdqi6MK3b98XpUaWEtHE8dQ2Dxc0pQk=;
        b=R9s0e/P9vEDV3i9YoZgpLB5HTNPP6Hn21wnPicpeI6iJkKuEVQK+vgXa59QGROVPWx
         ZuJ178GSq6swu6FGZlwMNyWl06G9gWvL6CkaB4aRiX+UNPTOdSiAkak336owrWB8vnrA
         SCOwu8Ci7QWy1/GZ0HnbVmTfdsscbFg4BkxvJLKIxE7+fi47Uvb6gDvr4iOv0obBqW+2
         Rbi+Zw7ISyA3F/TKZ+UujfhOBuw1tSAnkE4A//+lejPZGt7P9fS2ee+xYw0TKFP1UfT2
         m/q+6j6WbTNz7k7AGs1JUjPfqz6Ak4HvtiXSrgT/SMf4UxVSy7wyD1EThBqKdeO8uq7t
         R4YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GkRtKpZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff15si12046801qvb.159.2020.01.28.04.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 04:42:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GkRtKpZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwQBz-0005D5-Aw
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 07:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iwQBo-0005Cd-RC
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 07:41:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iwQBn-00070v-QH
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 07:41:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48095
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iwQBn-00070f-MS
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 07:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580215315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYU23pZAEhqMTdqi6MK3b98XpUaWEtHE8dQ2Dxc0pQk=;
 b=GkRtKpZ+s5YNnp+RyrLbEs0AVDy9wgntFMtJx1+UmhSnSH7Rs3Qv+T9Rw44Re1cdm0PdWe
 mYD+iGs3EVLkVsUL09pKZpyO6s2tKmE0iI3xzHHG0XayByAEFngfJKZZr0h67ggBZqpUzz
 TpxPGK8NgDH5d/aU6bP0qrmkoSjUjmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-2DrjF4LHN_uMzB1W5R41AA-1; Tue, 28 Jan 2020 07:41:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A99D019251A2;
 Tue, 28 Jan 2020 12:41:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5454E60BFB;
 Tue, 28 Jan 2020 12:41:45 +0000 (UTC)
Date: Tue, 28 Jan 2020 13:41:43 +0100
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [question] hw/arm/virt: about the default gic-version in
 accelerated mode
Message-ID: <20200128124143.cmbl3po2uvhsgd23@kamzik.brq.redhat.com>
References: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
 <CAFEAcA8hib-3YWuS-MajjvokOFCGKUHeuz+XQTBYf8LBz+PuFQ@mail.gmail.com>
 <20200128122915.ehzgj5kpmsw5azap@kamzik.brq.redhat.com>
 <e0b73504-b37a-cc57-3c3f-b9872dd1e16c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e0b73504-b37a-cc57-3c3f-b9872dd1e16c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2DrjF4LHN_uMzB1W5R41AA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08ZdvvVU2bHE

On Tue, Jan 28, 2020 at 01:34:06PM +0100, Auger Eric wrote:
> Hi Drew,
>=20
> On 1/28/20 1:29 PM, Andrew Jones wrote:
> > On Tue, Jan 28, 2020 at 10:52:50AM +0000, Peter Maydell wrote:
> >> On Tue, 28 Jan 2020 at 10:47, Auger Eric <eric.auger@redhat.com> wrote=
:
> >>> When arm virt machine is run in accelerated mode with "-cpu host
> >>> -machine virt", the default gic version is 2.
> >>>
> >>> I understand the rationale with TCG where we don't have MSI ITS
> >>> emulation along with GICv3 so we need to choose GICv2 to get GICv2M
> >>> functionality.
> >>>
> >>> However in KVM mode, I would have expected to see the host GIC probed=
 to
> >>> set the same version on guest. Indeed most of our HW now have GICv3
> >>> without GICv2 compat mode so our default values lead to weird traces:
> >>>
> >>> "
> >>> qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
> >>> qemu-system-aarch64: failed to set irq for PMU
> >>> "
> >>>
> >>> I would like to propose a patch to improve those errors and also sugg=
est
> >>> a hint. But I also wanted to know whether you would accept to change =
the
> >>> default value with KVM and choose the host version instead of 2. For =
TCG
> >>> we would keep v2.
> >>
> >> As with the -cpu option, the default is there for command
> >> line backward compatibility primarily. Even if we had
> >> better support for MSI ITS emulation we'd still leave
> >> the default at GICv2.
> >>
> >> If you want "do the best you can, regardless of accelerator"
> >> that is "-cpu max -machine gic-version=3Dmax".
> >>
> >=20
> > There is a case where we can probe without breaking backward
> > compatibility. That case is kvm-enabled and no gic-version
> > specified. The reason it would be safe to probe the GIC version
> > is because unless the host was a gicv2 host, then that command
> > line wouldn't have worked anyway.
> Except if the host GICv3 has a GICv2 compat (which is pretty unlikely)?

Is there a way to probe that? If so, and the setting up of gicv2 on
a gicv3 host with the gicv2-compat is the same as setting up gicv2,
then we can just choose gicv2 to keep the command line compatibility.

Thanks,
drew

