Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3991245lfk;
        Mon, 13 Dec 2021 03:08:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXM29N2rwvBDGGQkcHujWbLGjyg7voof06RVTyzgFTUtAzy3hQzwlffGiasEsygPmZPJgm
X-Received: by 2002:a05:622a:1d5:: with SMTP id t21mr45765095qtw.119.1639393680766;
        Mon, 13 Dec 2021 03:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639393680; cv=none;
        d=google.com; s=arc-20160816;
        b=jvrdH80/rUniotZG986yfv2hEIe165gpZ3LcJP2lLcbjQ1Kna8Ao89THvNPT6/nzOJ
         3nayuCYahGPbYPrgne9/m2gWBA16hmR0JpS5dW+qkCRxkbMvCVgmHNj77YaHBTh3o/yT
         QH8pW/BUFlu4AO/BqsEcGOTDVnrCds9ttFKhe5XZvgwdQ66GyF5pvFKQAWnvt7kbp1YE
         iNkWZcID8hrquSA6NRApL9Xm/kqhGe8RSjYd49s42cWH8A/MRNObqipidX4aBP0JrGQ0
         n0j9Qal5w/OC7JrcOX5L18cEOt0InxDU2Vk+FvkGsPfbTBV6AbxeZPRJ8R794WpkXfvu
         vn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8jRryDH3W+y71PQHQ+cCIBIuzuAfhbuiiQtPNOo9yk=;
        b=GzB7h3cpUJMJDZbvn7O4OCGmHSA+RAipZPBHvRE/I9uLY/3AXg6TkN3KSfAgC634hB
         t/Ptqexo9hGb8yLl6P4k2QEF5hkNtV2Ykoe6UhDiXQilInxpjYg02o2vtjlnv4gcDguA
         NJWCT4MURQgX0DVgb0/dhgK0BhbfIjPFxVIj9JOp8h02YCGF3LYQwRG9FqbqN2LqFJoz
         ysCgpklO5R9wyrJQccHmcngWrxe3bRDbuhphanAzvwNYaZlvkixm2ptZLWO2OA2guPg/
         xlgHSdvbHY7BErBbJ5Qh83PWhEoiyBnnczSQVKSOrtgyYua0Pcn/Pt2YPRlVgSfgzVhM
         Tn3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W0w6AWWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw7si11269852qvb.166.2021.12.13.03.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 03:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W0w6AWWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwjBY-0004ms-7T
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 06:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwjBQ-0004mN-8N
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 06:07:52 -0500
Received: from [2a00:1450:4864:20::42a] (port=44815
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwjBO-0004bW-L3
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 06:07:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t18so26307340wrg.11
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 03:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G8jRryDH3W+y71PQHQ+cCIBIuzuAfhbuiiQtPNOo9yk=;
 b=W0w6AWWUtYBmn8UorE1Nro+8Jy9AuzkLRCOH5+AUXiU84HsULjDN4Sxdn6CkFvngeP
 xNbt5QxUljnsreOLLymRPLU2QjITbeynTz9tYO5YGhdr3zbZ3ptkJ5Omb4CKUpANiRZF
 rpgtq6UuVVSDYhVlDea47LhiyqjpaEFBferyU7obNbaaBpxyEnuZPDyMpQvVwxN4ha6T
 YSdBztTWasc+aXT6Lg3sxRVHB5/7+6B6FpwDWBQAgNw2HqCw9t9OdT4NS1BSKTxd8zQD
 IWxBd3+KH+ZacBN/G86lc4S4jWuTKWRRcjwlx5F6Sj0XRIEAz0e8oVBztr6n3GPeK6j7
 UnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G8jRryDH3W+y71PQHQ+cCIBIuzuAfhbuiiQtPNOo9yk=;
 b=K2kYkvPf3svzgexesqECNfRU/m/PFAdze1S3T2QJzPKHpODMMfZyATDWkKXOX9lnUe
 TpdNsUsH+SsE4ofTLetKUJJFSksL9xUbwhLGpIhEJlIY7o4aal715G3vH985hb32HmsR
 SqukrDEiKAuhFWm7W1tPECRflNmcn1hZos+Q4gurkTMyZUK5egbDVi68N88RG5oFZQij
 0kci12En44f4jx2kmz6fmJLcKHvEkZMpQ5FkzRXR+zyLaAS0jbqHNr7MJtyx50AfA6Zk
 E9DxOWuDc3crWDRdbb6oFyMGq5MFww76Lme0FP3/Q7mSwxg36uK1ATAHKv1ThKNQwGYX
 U8JQ==
X-Gm-Message-State: AOAM531k/taO1eSx1/RwNuN8mx8UN7xGXr59ORQ2pWvm189GjLMP+/9C
 KWCtSguGxLfq7jpTFoW+OAk/Y/jgjTCYkdfMPmML4g==
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr31307590wrw.319.1639393669033; 
 Mon, 13 Dec 2021 03:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
 <YbcSOcEy//0DSMtL@myrica>
 <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
 <Ybcmx/TK8F7ayt+X@myrica>
In-Reply-To: <Ybcmx/TK8F7ayt+X@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 11:07:38 +0000
Message-ID: <CAFEAcA-bqvxsXWZq2q=HrMPbO=cfu5E=tHbkA-AMW_FNX8D+gg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: eric.auger@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UyDlz6JJPKul

On Mon, 13 Dec 2021 at 10:56, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Mon, Dec 13, 2021 at 10:04:57AM +0000, Peter Maydell wrote:
> > On Mon, 13 Dec 2021 at 09:28, Jean-Philippe Brucker
> > <jean-philippe@linaro.org> wrote:
> > >
> > > On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> > > > On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> > > > <jean-philippe@linaro.org> wrote:
> > > > >
> > > > > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > > > > a VIOT table. Also add the tests for the ACPI table.
> > > > >
> > > > > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > > > > series [2] only contained the table and x86 support, which have been
> > > > > merged. Everything has now been reviewed and should be good to go.
> > > > >
> > > > > * Patches 1-2 add the VIOT table for the virt machine
> > > > > * Patches 3-4 are minor fixes
> > > > > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> > > > >   q35 as well, which didn't make it last time because they depended on
> > > > >   another fix that has now been merged.
> > > >
> > > > I believe the entire patchset has been reviewed and you are re-sending
> > > > it so that it gets pulled in after the release?
> > >
> > > Yes
> >
> > To be clear, do you mean:
> > (1) The patchset has been reviewed, and I plan to resend it (ie a v8)
> > to be pulled in after 6.2 releases
> > or
> > (2) The patchset has been reviewed already as v6, and this (v7) was just
> > a resend to be pulled in after 6.2 releases
>
> I meant (2), v6 had already been reviewed and I'm resending v7 to be
> pulled after 6.2 releases, sorry about the confusion.  Just for my
> understanding, should I have resent this after the 6.2 release, or is this
> OK and I should just state the intention for a patchset more clearly?

Sending for-7.0 patchsets before 6.2 officially releases is fine; I just wanted
to check what you intended. I've queued this patchset to target-arm.next.

thanks
-- PMM
